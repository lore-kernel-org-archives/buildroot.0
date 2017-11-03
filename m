From: Olivier Maignial <olivier.maignial@smile.fr>
Date: Fri,  3 Nov 2017 11:23:59 +0100
Subject: [Buildroot] [PATCH 1/1] janus-gateway: add option for libcurl
 support
Message-ID: <1509704639-20360-1-git-send-email-olivier.maignial@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcurl is not mandatory to compile Janus, but Janus use it in several way:
    - RTSP stream support in plugin streaming
    - TURN REST API support
    - HTTP backend for text room plugin
    - ...
This commit add an option "libcurl support" to add dependency on libcurl.

Signed-off-by: Olivier Maignial <olivier.maignial@smile.fr>
---
 package/janus-gateway/Config.in        | 18 ++++++++++++++++++
 package/janus-gateway/janus-gateway.mk |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 5bd4e95..156fac6 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -38,6 +38,12 @@ config  BR2_PACKAGE_JANUS_STREAMING
 	# SO_REUSEPORT
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
 
+if BR2_PACKAGE_JANUS_STREAMING
+config BR2_PACKAGE_JANUS_STREAMING_RTSP
+	bool "Support RTSP feed"
+	select BR2_PACKAGE_JANUS_LIBCURL
+endif
+
 comment "streaming plugin needs a toolchain w/ headers >= 3.9"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
 
@@ -77,6 +83,7 @@ config BR2_PACKAGE_JANUS_REST
 	bool "REST (HTTP/HTTPS)"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBMICROHTTPD
+	select BR2_PACKAGE_JANUS_LIBCURL	
 
 comment "REST transport needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
@@ -90,6 +97,17 @@ config BR2_PACKAGE_JANUS_WEBSOCKETS
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBWEBSOCKETS
 
+comment "libcurl support"
+
+config BR2_PACKAGE_JANUS_LIBCURL
+	bool "Enable libcurl support"
+	default y
+	help
+	  Janus uses libcurl to several purposes:
+	    - Enable TURN REST API	
+	    - Implement Sample Event Handler plugin
+	    - Support RTSP stream in streaming plugin
+
 endif
 
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index bf3e590..7314d1c 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -117,6 +117,10 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-websockets
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_LIBCURL),y)
+JANUS_GATEWAY_DEPENDENCIES += libcurl
+endif
+
 # Parallel build broken
 JANUS_GATEWAY_MAKE = $(MAKE1)
 
-- 
2.7.4
