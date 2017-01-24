From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 24 Jan 2017 14:54:30 -0500
Subject: [Buildroot] [PATCH 02/10] janus-gateway: Make sofia-sip a optional
	dependency.
In-Reply-To: <20170124195438.4144-1-aduskett@codeblue.com>
References: <20170124195438.4144-1-aduskett@codeblue.com>
Message-ID: <20170124195438.4144-2-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently janus-gateway requires sofia-sip in the build system, however
this is unessasary.  This patch makes the sip gateway plugin a option.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/janus-gateway/Config.in        | 14 ++++++++++++--
 package/janus-gateway/janus-gateway.mk |  9 ++++++++-
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 20491b7..7008d56 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -1,9 +1,8 @@
-config BR2_PACKAGE_JANUS_GATEWAY
+menuconfig BR2_PACKAGE_JANUS_GATEWAY
 	bool "janus-gateway"
 	select BR2_PACKAGE_LIBMICROHTTPD
 	select BR2_PACKAGE_JANSSON
 	select BR2_PACKAGE_LIBNICE
-	select BR2_PACKAGE_SOFIA_SIP
 	select BR2_PACKAGE_LIBSRTP
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_DING_LIBS
@@ -18,6 +17,17 @@ config BR2_PACKAGE_JANUS_GATEWAY
 
 	  https://github.com/meetecho/janus-gateway
 
+if BR2_PACKAGE_JANUS_GATEWAY
+
+comment "janus-gateway plugins"
+	
+config BR2_PACKAGE_JANUS_PLUGIN_SIP
+	bool "janus sip gateway plugin"
+	default n
+
+
+endif
+
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 4b87b33..77254e6 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -11,7 +11,7 @@ JANUS_GATEWAY_LICENSE_FILES = COPYING
 
 # ding-libs provides the ini_config library
 JANUS_GATEWAY_DEPENDENCIES = host-pkgconf libmicrohttpd jansson \
-	libnice sofia-sip libsrtp host-gengetopt openssl ding-libs
+	libnice libsrtp host-gengetopt openssl ding-libs
 
 # Straight out of the repository, no ./configure, and we also patch
 # configure.ac.
@@ -26,6 +26,13 @@ JANUS_GATEWAY_CONF_OPTS = \
 	--disable-data-channels \
 	--disable-rabbitmq
 
+ifeq ($(BR2_PACKAGE_JANUS_PLUGIN_SIP_GATEWAY),y)
+JANUS_GATEWAY_DEPENDENCIES += sofia-sip
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-sip
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-sip
+endif
+
 ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
 JANUS_GATEWAY_DEPENDENCIES += libwebsockets
 JANUS_GATEWAY_CONF_OPTS += --enable-websockets
-- 
2.9.3
