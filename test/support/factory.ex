defmodule Tmate.Factory do
  use ExMachina

  def event_session_register_factory do
    %{event_type: :session_register,
      entity_id: UUID.uuid1,
      ip_address: sequence(:ip, &"1.1.1.#{&1}"),
      ws_url_fmt: "https://tmate.io/ws/session/%s",
      ssh_cmd_fmt: "ssh %s@tmate.io",
      stoken: sequence(:token, &"STOKEN___________________RW#{&1}"),
      stoken_ro: sequence(:token, &"STOKEN___________________RO#{&1}"),
      reconnected: false
      }
  end

  def event_session_close_factory do
    %{event_type: :session_close,
      entity_id: UUID.uuid1}
  end

  def event_session_join_factory do
    %{event_type: :session_join,
      id: UUID.uuid1,
      ip_address: sequence(:ip, &"1.1.2.#{&1}"),
      type: "ssh",
      readonly: false}
  end

  def event_session_left_factory do
    %{event_type: :session_left,
      id: sequence(:client_id, & &1)}
  end

  def event_session_disconnect_factory do
    %{event_type: :session_disconnect,
      entity_id: UUID.uuid1}
  end
end
