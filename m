From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 18 Apr 2019 14:44:51 +0200
Subject: [Buildroot] [PATCH 2/2] package/libtorrent-rasterbar: fix build
 with boost 1.70.0
In-Reply-To: <20190418124451.25968-1-fontaine.fabrice@gmail.com>
References: <20190418124451.25968-1-fontaine.fabrice@gmail.com>
Message-ID: <20190418124451.25968-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/dc21322e101cbd242a22018f4d506b9f2c26dd33

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0003-fix-build-with-boost-1.70.0.patch    | 267 ++++++++++++++++++
 1 file changed, 267 insertions(+)
 create mode 100644 package/libtorrent-rasterbar/0003-fix-build-with-boost-1.70.0.patch

diff --git a/package/libtorrent-rasterbar/0003-fix-build-with-boost-1.70.0.patch b/package/libtorrent-rasterbar/0003-fix-build-with-boost-1.70.0.patch
new file mode 100644
index 0000000000..133857cd9a
--- /dev/null
+++ b/package/libtorrent-rasterbar/0003-fix-build-with-boost-1.70.0.patch
@@ -0,0 +1,267 @@
+From 93c56656fbeba3cf06e644bc36b3c3598c6b23f3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 18 Apr 2019 11:27:43 +0200
+Subject: [PATCH] fix build with boost 1.70.0
+
+Fix #3683
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/arvidn/libtorrent/pull/3787]
+---
+ include/libtorrent/config.hpp          |  9 +++++++++
+ include/libtorrent/proxy_base.hpp      |  2 +-
+ include/libtorrent/tracker_manager.hpp |  2 +-
+ include/libtorrent/udp_socket.hpp      |  2 +-
+ src/disk_io_thread_pool.cpp            |  2 +-
+ src/http_connection.cpp                | 16 ++++++++--------
+ src/kademlia/dht_tracker.cpp           |  2 +-
+ src/lsd.cpp                            |  4 ++--
+ src/natpmp.cpp                         |  6 +++---
+ src/udp_socket.cpp                     |  2 +-
+ src/upnp.cpp                           |  2 +-
+ 11 files changed, 29 insertions(+), 20 deletions(-)
+
+diff --git a/include/libtorrent/config.hpp b/include/libtorrent/config.hpp
+index 9ddcdb94a..59733065d 100644
+--- a/include/libtorrent/config.hpp
++++ b/include/libtorrent/config.hpp
+@@ -38,6 +38,7 @@ POSSIBILITY OF SUCH DAMAGE.
+ #define _FILE_OFFSET_BITS 64
+ 
+ #include <boost/config.hpp>
++#include <boost/version.hpp>
+ 
+ #include "libtorrent/aux_/disable_warnings_pop.hpp"
+ 
+@@ -56,6 +57,14 @@ POSSIBILITY OF SUCH DAMAGE.
+ #pragma GCC diagnostic ignored "-Wformat-extra-args"
+ #endif
+ 
++// ====== BOOST ========
++
++#if BOOST_VERSION >= 107000
++#define GET_IO_SERVICE(s) ((boost::asio::io_context&)(s).get_executor().context())
++#else
++#define GET_IO_SERVICE(s) ((s).get_io_service())
++#endif
++
+ // ====== CLANG ========
+ 
+ #if defined __clang__
+diff --git a/include/libtorrent/proxy_base.hpp b/include/libtorrent/proxy_base.hpp
+index 344c23097..d7aa1d45d 100644
+--- a/include/libtorrent/proxy_base.hpp
++++ b/include/libtorrent/proxy_base.hpp
+@@ -246,7 +246,7 @@ public:
+ 
+ 	io_service& get_io_service()
+ 	{
+-		return m_sock.get_io_service();
++		return GET_IO_SERVICE(m_sock);
+ 	}
+ 
+ 	lowest_layer_type& lowest_layer()
+diff --git a/include/libtorrent/tracker_manager.hpp b/include/libtorrent/tracker_manager.hpp
+index 86331adbc..dfed6b9f5 100644
+--- a/include/libtorrent/tracker_manager.hpp
++++ b/include/libtorrent/tracker_manager.hpp
+@@ -259,7 +259,7 @@ namespace libtorrent {
+ 		virtual void on_timeout(error_code const& ec) = 0;
+ 		virtual ~timeout_handler();
+ 
+-		io_service& get_io_service() { return m_timeout.get_io_service(); }
++		io_service& get_io_service() { return GET_IO_SERVICE(m_timeout); }
+ 
+ 	private:
+ 
+diff --git a/include/libtorrent/udp_socket.hpp b/include/libtorrent/udp_socket.hpp
+index f4dcbeb24..367318eef 100644
+--- a/include/libtorrent/udp_socket.hpp
++++ b/include/libtorrent/udp_socket.hpp
+@@ -61,7 +61,7 @@ namespace libtorrent {
+ 		static constexpr udp_send_flags_t dont_fragment = 3_bit;
+ 
+ 		bool is_open() const { return m_abort == false; }
+-		io_service& get_io_service() { return m_socket.get_io_service(); }
++		io_service& get_io_service() { return GET_IO_SERVICE(m_socket); }
+ 
+ 		template <typename Handler>
+ 		void async_read(Handler&& h)
+diff --git a/src/disk_io_thread_pool.cpp b/src/disk_io_thread_pool.cpp
+index 4d4b5ee67..72a3523f5 100644
+--- a/src/disk_io_thread_pool.cpp
++++ b/src/disk_io_thread_pool.cpp
+@@ -173,7 +173,7 @@ namespace libtorrent {
+ 			// buffer pool won't exist anymore, and crash. This prevents that.
+ 			m_threads.emplace_back(&pool_thread_interface::thread_fun
+ 				, &m_thread_iface, std::ref(*this)
+-				, io_service::work(m_idle_timer.get_io_service()));
++				, io_service::work(GET_IO_SERVICE(m_idle_timer)));
+ 		}
+ 	}
+ 
+diff --git a/src/http_connection.cpp b/src/http_connection.cpp
+index e01e9ea1d..b4028e0c8 100644
+--- a/src/http_connection.cpp
++++ b/src/http_connection.cpp
+@@ -148,7 +148,7 @@ void http_connection::get(std::string const& url, time_duration timeout, int pri
+ 
+ 	if (ec)
+ 	{
+-		m_timer.get_io_service().post(std::bind(&http_connection::callback
++		GET_IO_SERVICE(m_timer).post(std::bind(&http_connection::callback
+ 			, me, ec, span<char>{}));
+ 		return;
+ 	}
+@@ -160,7 +160,7 @@ void http_connection::get(std::string const& url, time_duration timeout, int pri
+ 		)
+ 	{
+ 		error_code err(errors::unsupported_url_protocol);
+-		m_timer.get_io_service().post(std::bind(&http_connection::callback
++		GET_IO_SERVICE(m_timer).post(std::bind(&http_connection::callback
+ 			, me, err, span<char>{}));
+ 		return;
+ 	}
+@@ -258,7 +258,7 @@ void http_connection::start(std::string const& hostname, int port
+ 
+ 	if (ec)
+ 	{
+-		m_timer.get_io_service().post(std::bind(&http_connection::callback
++		GET_IO_SERVICE(m_timer).post(std::bind(&http_connection::callback
+ 			, me, ec, span<char>{}));
+ 		return;
+ 	}
+@@ -297,7 +297,7 @@ void http_connection::start(std::string const& hostname, int port
+ #if TORRENT_USE_I2P
+ 			if (i2p_conn->proxy().type != settings_pack::i2p_proxy)
+ 			{
+-				m_timer.get_io_service().post(std::bind(&http_connection::callback
++				GET_IO_SERVICE(m_timer).post(std::bind(&http_connection::callback
+ 					, me, error_code(errors::no_i2p_router), span<char>{}));
+ 				return;
+ 			}
+@@ -332,7 +332,7 @@ void http_connection::start(std::string const& hostname, int port
+ 					m_ssl_ctx->set_verify_mode(ssl::context::verify_none, ec);
+ 					if (ec)
+ 					{
+-						m_timer.get_io_service().post(std::bind(&http_connection::callback
++						GET_IO_SERVICE(m_timer).post(std::bind(&http_connection::callback
+ 								, me, ec, span<char>{}));
+ 						return;
+ 					}
+@@ -344,7 +344,7 @@ void http_connection::start(std::string const& hostname, int port
+ 		// assume this is not a tracker connection. Tracker connections that
+ 		// shouldn't be subject to the proxy should pass in nullptr as the proxy
+ 		// pointer.
+-		instantiate_connection(m_timer.get_io_service()
++		instantiate_connection(GET_IO_SERVICE(m_timer)
+ 			, proxy ? *proxy : null_proxy, m_sock, userdata, nullptr, false, false);
+ 
+ 		if (m_bind_addr)
+@@ -353,7 +353,7 @@ void http_connection::start(std::string const& hostname, int port
+ 			m_sock.bind(tcp::endpoint(*m_bind_addr, 0), ec);
+ 			if (ec)
+ 			{
+-				m_timer.get_io_service().post(std::bind(&http_connection::callback
++				GET_IO_SERVICE(m_timer).post(std::bind(&http_connection::callback
+ 					, me, ec, span<char>{}));
+ 				return;
+ 			}
+@@ -362,7 +362,7 @@ void http_connection::start(std::string const& hostname, int port
+ 		setup_ssl_hostname(m_sock, hostname, ec);
+ 		if (ec)
+ 		{
+-			m_timer.get_io_service().post(std::bind(&http_connection::callback
++			GET_IO_SERVICE(m_timer).post(std::bind(&http_connection::callback
+ 				, me, ec, span<char>{}));
+ 			return;
+ 		}
+diff --git a/src/kademlia/dht_tracker.cpp b/src/kademlia/dht_tracker.cpp
+index a840bcf99..9433795f3 100644
+--- a/src/kademlia/dht_tracker.cpp
++++ b/src/kademlia/dht_tracker.cpp
+@@ -130,7 +130,7 @@ namespace libtorrent { namespace dht {
+ 		// must use piecewise construction because tracker_node::connection_timer
+ 		// is neither copyable nor movable
+ 		auto n = m_nodes.emplace(std::piecewise_construct_t(), std::forward_as_tuple(s)
+-			, std::forward_as_tuple(m_key_refresh_timer.get_io_service()
++			, std::forward_as_tuple(GET_IO_SERVICE(m_key_refresh_timer)
+ 			, s, this, m_settings, nid, m_log, m_counters
+ 			, std::bind(&dht_tracker::get_node, this, _1, _2)
+ 			, m_storage));
+diff --git a/src/lsd.cpp b/src/lsd.cpp
+index 99e21ead4..32066ca30 100644
+--- a/src/lsd.cpp
++++ b/src/lsd.cpp
+@@ -100,11 +100,11 @@ void lsd::debug_log(char const* fmt, ...) const
+ void lsd::start(error_code& ec)
+ {
+ 	m_socket.open(std::bind(&lsd::on_announce, self(), _1, _2)
+-		, m_broadcast_timer.get_io_service(), ec);
++		, GET_IO_SERVICE(m_broadcast_timer), ec);
+ 	if (ec) return;
+ 
+ 	m_socket6.open(std::bind(&lsd::on_announce, self(), _1, _2)
+-		, m_broadcast_timer.get_io_service(), ec);
++		, GET_IO_SERVICE(m_broadcast_timer), ec);
+ }
+ 
+ lsd::~lsd() = default;
+diff --git a/src/natpmp.cpp b/src/natpmp.cpp
+index 1226bceba..b3e277cfb 100644
+--- a/src/natpmp.cpp
++++ b/src/natpmp.cpp
+@@ -160,13 +160,13 @@ void natpmp::start(address local_address, std::string device)
+ 	// try to find one even if the listen socket isn't bound to a device
+ 	if (device.empty())
+ 	{
+-		device = device_for_address(local_address, m_socket.get_io_service(), ec);
++		device = device_for_address(local_address, GET_IO_SERVICE(m_socket), ec);
+ 		// if this fails fall back to using the first default gateway in the
+ 		// routing table
+ 		ec.clear();
+ 	}
+ 
+-	auto const route = get_default_route(m_socket.get_io_service()
++	auto const route = get_default_route(GET_IO_SERVICE(m_socket)
+ 		, device, local_address.is_v6(), ec);
+ 
+ 	if (!route)
+@@ -194,7 +194,7 @@ void natpmp::start(address local_address, std::string device)
+ 	if (local_address.is_unspecified())
+ 	{
+ 		std::vector<ip_interface> const net = enum_net_interfaces(
+-			m_socket.get_io_service(), ec);
++			GET_IO_SERVICE(m_socket), ec);
+ 
+ 		auto const it = std::find_if(net.begin(), net.end(), [&](ip_interface const& i)
+ 		{
+diff --git a/src/udp_socket.cpp b/src/udp_socket.cpp
+index 9ca38e548..9e46a3e3d 100644
+--- a/src/udp_socket.cpp
++++ b/src/udp_socket.cpp
+@@ -492,7 +492,7 @@ void udp_socket::set_proxy_settings(aux::proxy_settings const& ps)
+ 	{
+ 		// connect to socks5 server and open up the UDP tunnel
+ 
+-		m_socks5_connection = std::make_shared<socks5>(m_socket.get_io_service());
++		m_socks5_connection = std::make_shared<socks5>(GET_IO_SERVICE(m_socket));
+ 		m_socks5_connection->start(ps);
+ 	}
+ }
+diff --git a/src/upnp.cpp b/src/upnp.cpp
+index a300571e4..2c9123300 100644
+--- a/src/upnp.cpp
++++ b/src/upnp.cpp
+@@ -121,7 +121,7 @@ void upnp::start()
+ 
+ 	error_code ec;
+ 	m_socket.open(std::bind(&upnp::on_reply, self(), _1, _2)
+-		, m_refresh_timer.get_io_service(), ec);
++		, GET_IO_SERVICE(m_refresh_timer), ec);
+ 
+ 	m_mappings.reserve(10);
+ }
+-- 
+2.20.1
+
-- 
2.20.1
