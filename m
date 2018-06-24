From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Jun 2018 15:54:53 +0200
Subject: [Buildroot] [git commit] domoticz: bump to version 4.9700
Message-ID: <20180624135258.4E8D380262@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4a6dd3e023fbdff4e1d834179c11b52072e747d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch (not needed anymore)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-compilation-with-boost-1.66.patch     | 56 ----------------------
 package/domoticz/domoticz.hash                     |  2 +-
 package/domoticz/domoticz.mk                       |  2 +-
 3 files changed, 2 insertions(+), 58 deletions(-)

diff --git a/package/domoticz/0001-Fix-compilation-with-boost-1.66.patch b/package/domoticz/0001-Fix-compilation-with-boost-1.66.patch
deleted file mode 100644
index d73ea4f002..0000000000
--- a/package/domoticz/0001-Fix-compilation-with-boost-1.66.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From b9481d3382d416d72f523a0442d662e49b4192d1 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 14 Jan 2018 18:18:32 +0100
-Subject: [PATCH] Fix compilation with boost 1.66
-
-Patch fetch from one of the answer of
- https://github.com/domoticz/domoticz/issues/2034
-(issue still opened, no official PR sent upstream)
-
-Boost asio changed its API:
- - http://www.boost.org/doc/libs/1_66_0/doc/html/boost_asio/net_ts.html
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- webserver/proxyclient.cpp | 2 +-
- webserver/server.cpp      | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/webserver/proxyclient.cpp b/webserver/proxyclient.cpp
-index 203ee619..efc9815a 100644
---- a/webserver/proxyclient.cpp
-+++ b/webserver/proxyclient.cpp
-@@ -639,7 +639,7 @@ namespace http {
- 		void CProxyManager::StartThread()
- 		{
- 			try {
--				boost::asio::ssl::context ctx(io_service, boost::asio::ssl::context::sslv23);
-+				boost::asio::ssl::context ctx(boost::asio::ssl::context::sslv23);
- 				ctx.set_verify_mode(boost::asio::ssl::verify_none);
- 
- 				proxyclient.reset(new CProxyClient(io_service, ctx, m_pWebEm));
-diff --git a/webserver/server.cpp b/webserver/server.cpp
-index 5255aa34..0c1af08a 100644
---- a/webserver/server.cpp
-+++ b/webserver/server.cpp
-@@ -148,7 +148,7 @@ void server::handle_accept(const boost::system::error_code& e) {
- ssl_server::ssl_server(const ssl_server_settings & ssl_settings, request_handler & user_request_handler) :
- 		server_base(ssl_settings, user_request_handler),
- 		settings_(ssl_settings),
--		context_(io_service_, ssl_settings.get_ssl_method())
-+		context_(ssl_settings.get_ssl_method())
- {
- #ifdef DEBUG_WWW
- 	_log.Log(LOG_STATUS, "[web:%s] create ssl_server using ssl_server_settings : %s", ssl_settings.listening_port.c_str(), ssl_settings.to_string().c_str());
-@@ -161,7 +161,7 @@ ssl_server::ssl_server(const ssl_server_settings & ssl_settings, request_handler
- ssl_server::ssl_server(const server_settings & settings, request_handler & user_request_handler) :
- 		server_base(settings, user_request_handler),
- 		settings_(dynamic_cast<ssl_server_settings const &>(settings)),
--		context_(io_service_, dynamic_cast<ssl_server_settings const &>(settings).get_ssl_method()) {
-+		context_(dynamic_cast<ssl_server_settings const &>(settings).get_ssl_method()) {
- #ifdef DEBUG_WWW
- 	_log.Log(LOG_STATUS, "[web:%s] create ssl_server using server_settings : %s", settings.listening_port.c_str(), settings.to_string().c_str());
- #endif
--- 
-2.14.1
-
diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index 00dcf713b2..106d242d0d 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	5ea8f37f2ef900e9bd17b1b5375e75bfdec4f09001e3e2e0b647a260989d014c	domoticz-3.8153.tar.gz
+sha256	c31f185a1ffac01b86a77bf33e059a4403d814e826c9d6639c63c2e9afa55a46	domoticz-4.9700.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index bd25708a14..af58563436 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 3.8153
+DOMOTICZ_VERSION = 4.9700
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
