From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 22:19:24 +0200
Subject: [Buildroot] [git commit] package/websocketpp: bump to version 0.8.2
Message-ID: <20200419200502.CC7B08F271@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db040807b84ef64da8d06f1d9a0871837a4dee1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...eplace-make_shared-with-new-in-some-cases.patch | 79 ----------------------
 .../0002-Fix-missed-entries-fix-testing.patch      | 66 ------------------
 package/websocketpp/websocketpp.hash               |  2 +-
 package/websocketpp/websocketpp.mk                 |  2 +-
 4 files changed, 2 insertions(+), 147 deletions(-)

diff --git a/package/websocketpp/0001-Replace-make_shared-with-new-in-some-cases.patch b/package/websocketpp/0001-Replace-make_shared-with-new-in-some-cases.patch
deleted file mode 100644
index 3b37834f55..0000000000
--- a/package/websocketpp/0001-Replace-make_shared-with-new-in-some-cases.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From c769c9238ad62178f506038178714a1c35aa2769 Mon Sep 17 00:00:00 2001
-From: Stefan Floeren <42731906+stefan-floeren@users.noreply.github.com>
-Date: Tue, 16 Apr 2019 08:38:01 +0200
-Subject: [PATCH] Replace make_shared with new in some cases
-
-Replace make_shared for asio types that take a lib::ref as a parameter.
-This should fix the ASIO change (boostorg/asio at 59066d8) for 1.70,
-while keeping it backwards compatible to older boost versions.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/zaphoyd/websocketpp/pull/814/commits/c769c9238ad62178f506038178714a1c35aa2769]
----
- websocketpp/transport/asio/connection.hpp    | 7 ++++---
- websocketpp/transport/asio/endpoint.hpp      | 3 +--
- websocketpp/transport/asio/security/none.hpp | 3 +--
- websocketpp/transport/asio/security/tls.hpp  | 3 +--
- 4 files changed, 7 insertions(+), 9 deletions(-)
-
-diff --git a/websocketpp/transport/asio/connection.hpp b/websocketpp/transport/asio/connection.hpp
-index 60f88a79..1ccda8f3 100644
---- a/websocketpp/transport/asio/connection.hpp
-+++ b/websocketpp/transport/asio/connection.hpp
-@@ -311,9 +311,10 @@ class connection : public config::socket_type::socket_con_type {
-      * needed.
-      */
-     timer_ptr set_timer(long duration, timer_handler callback) {
--        timer_ptr new_timer = lib::make_shared<lib::asio::steady_timer>(
--            lib::ref(*m_io_service),
--            lib::asio::milliseconds(duration)
-+        timer_ptr new_timer(
-+            new lib::asio::steady_timer(
-+                *m_io_service,
-+                lib::asio::milliseconds(duration))
-         );
- 
-         if (config::enable_multithreading) {
-diff --git a/websocketpp/transport/asio/endpoint.hpp b/websocketpp/transport/asio/endpoint.hpp
-index ddab2c74..4b719a97 100644
---- a/websocketpp/transport/asio/endpoint.hpp
-+++ b/websocketpp/transport/asio/endpoint.hpp
-@@ -195,8 +195,7 @@ class endpoint : public config::socket_type {
- 
-         m_io_service = ptr;
-         m_external_io_service = true;
--        m_acceptor = lib::make_shared<lib::asio::ip::tcp::acceptor>(
--            lib::ref(*m_io_service));
-+        m_acceptor.reset(new lib::asio::ip::tcp::acceptor(*m_io_service));
- 
-         m_state = READY;
-         ec = lib::error_code();
-diff --git a/websocketpp/transport/asio/security/none.hpp b/websocketpp/transport/asio/security/none.hpp
-index 5c8293db..6c7d3524 100644
---- a/websocketpp/transport/asio/security/none.hpp
-+++ b/websocketpp/transport/asio/security/none.hpp
-@@ -168,8 +168,7 @@ class connection : public lib::enable_shared_from_this<connection> {
-             return socket::make_error_code(socket::error::invalid_state);
-         }
- 
--        m_socket = lib::make_shared<lib::asio::ip::tcp::socket>(
--            lib::ref(*service));
-+        m_socket.reset(new lib::asio::ip::tcp::socket(*service));
- 
-         if (m_socket_init_handler) {
-             m_socket_init_handler(m_hdl, *m_socket);
-diff --git a/websocketpp/transport/asio/security/tls.hpp b/websocketpp/transport/asio/security/tls.hpp
-index c76fd9aa..04ac3790 100644
---- a/websocketpp/transport/asio/security/tls.hpp
-+++ b/websocketpp/transport/asio/security/tls.hpp
-@@ -193,8 +193,7 @@ class connection : public lib::enable_shared_from_this<connection> {
-         if (!m_context) {
-             return socket::make_error_code(socket::error::invalid_tls_context);
-         }
--        m_socket = lib::make_shared<socket_type>(
--            _WEBSOCKETPP_REF(*service),lib::ref(*m_context));
-+        m_socket.reset(new socket_type(*service, *m_context));
- 
-         if (m_socket_init_handler) {
-             m_socket_init_handler(m_hdl, get_socket());
diff --git a/package/websocketpp/0002-Fix-missed-entries-fix-testing.patch b/package/websocketpp/0002-Fix-missed-entries-fix-testing.patch
deleted file mode 100644
index 7a27065c76..0000000000
--- a/package/websocketpp/0002-Fix-missed-entries-fix-testing.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From f810ca2e800e9b55be41c5911cf1d1185fcd516b Mon Sep 17 00:00:00 2001
-From: Stefan Floeren <42731906+stefan-floeren@users.noreply.github.com>
-Date: Wed, 17 Apr 2019 10:06:18 +0000
-Subject: [PATCH] Fix missed entries; fix testing
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/zaphoyd/websocketpp/pull/814/commits/f810ca2e800e9b55be41c5911cf1d1185fcd516b]
----
- CMakeLists.txt                            | 2 +-
- websocketpp/transport/asio/connection.hpp | 3 +--
- websocketpp/transport/asio/endpoint.hpp   | 7 ++-----
- 3 files changed, 4 insertions(+), 8 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2786aba9..951de975 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -202,7 +202,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
- 	endif ()
- 
-     if (NOT Boost_USE_STATIC_LIBS)
--        add_definitions (/DBOOST_TEST_DYN_LINK)
-+        add_definitions (-DBOOST_TEST_DYN_LINK)
-     endif ()
- 
-     set (Boost_FIND_REQUIRED TRUE)
-diff --git a/websocketpp/transport/asio/connection.hpp b/websocketpp/transport/asio/connection.hpp
-index 1ccda8f3..57dda74a 100644
---- a/websocketpp/transport/asio/connection.hpp
-+++ b/websocketpp/transport/asio/connection.hpp
-@@ -462,8 +462,7 @@ class connection : public config::socket_type::socket_con_type {
-         m_io_service = io_service;
- 
-         if (config::enable_multithreading) {
--            m_strand = lib::make_shared<lib::asio::io_service::strand>(
--                lib::ref(*io_service));
-+            m_strand.reset(new lib::asio::io_service::strand(*io_service));
-         }
- 
-         lib::error_code ec = socket_con_type::init_asio(io_service, m_strand,
-diff --git a/websocketpp/transport/asio/endpoint.hpp b/websocketpp/transport/asio/endpoint.hpp
-index 4b719a97..94509adb 100644
---- a/websocketpp/transport/asio/endpoint.hpp
-+++ b/websocketpp/transport/asio/endpoint.hpp
-@@ -687,9 +687,7 @@ class endpoint : public config::socket_type {
-      * @since 0.3.0
-      */
-     void start_perpetual() {
--        m_work = lib::make_shared<lib::asio::io_service::work>(
--            lib::ref(*m_io_service)
--        );
-+        m_work.reset(new lib::asio::io_service::work(*m_io_service));
-     }
- 
-     /// Clears the endpoint's perpetual flag, allowing it to exit when empty
-@@ -853,8 +851,7 @@ class endpoint : public config::socket_type {
- 
-         // Create a resolver
-         if (!m_resolver) {
--            m_resolver = lib::make_shared<lib::asio::ip::tcp::resolver>(
--                lib::ref(*m_io_service));
-+            m_resolver.reset(new lib::asio::ip::tcp::resolver(*m_io_service));
-         }
- 
-         tcon->set_uri(u);
diff --git a/package/websocketpp/websocketpp.hash b/package/websocketpp/websocketpp.hash
index 8bf671d96e..e4d0c929d5 100644
--- a/package/websocketpp/websocketpp.hash
+++ b/package/websocketpp/websocketpp.hash
@@ -1,3 +1,3 @@
 # Locally Computed:
-sha256  178899de48c02853b55b1ea8681599641cedcdfce59e56beaff3dd0874bf0286  websocketpp-0.8.1.tar.gz
+sha256  6ce889d85ecdc2d8fa07408d6787e7352510750daa66b5ad44aacb47bea76755  websocketpp-0.8.2.tar.gz
 sha256  b31e597bc777d884a39663c11d0557a0af40780e1f451de11ea5103924a69667  COPYING
diff --git a/package/websocketpp/websocketpp.mk b/package/websocketpp/websocketpp.mk
index 47da4dbe2f..26595a00d3 100644
--- a/package/websocketpp/websocketpp.mk
+++ b/package/websocketpp/websocketpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBSOCKETPP_VERSION = 0.8.1
+WEBSOCKETPP_VERSION = 0.8.2
 WEBSOCKETPP_SITE = $(call github,zaphoyd,websocketpp,$(WEBSOCKETPP_VERSION))
 WEBSOCKETPP_LICENSE = BSD-3c, MIT, Zlib
 WEBSOCKETPP_LICENSE_FILES = COPYING
