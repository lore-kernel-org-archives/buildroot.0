From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 15 Dec 2017 08:38:49 -0500
Subject: [Buildroot] [PATCH 1/1] janus-gateway: add libcurl check.
Message-ID: <20171215133849.5650-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The streaming protocol works without libcurl via RTP, but if a user wishes to
stream via RTSP or use the turn-rest api, libcurl must be built first.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/janus-gateway/Config.in        | 6 ++++--
 package/janus-gateway/janus-gateway.mk | 4 ++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 5bd4e9586b..130bb9d57a 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -35,8 +35,10 @@ config BR2_PACKAGE_JANUS_SIP_GATEWAY
 
 config  BR2_PACKAGE_JANUS_STREAMING
 	bool "streaming"
-	# SO_REUSEPORT
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
+	help
+	  Enable streaming plugin.
+	  Note: For RTSP streaming support, libcurl must be selected.
 
 comment "streaming plugin needs a toolchain w/ headers >= 3.9"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
@@ -90,7 +92,7 @@ config BR2_PACKAGE_JANUS_WEBSOCKETS
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBWEBSOCKETS
 
-endif
+endif #BR2_PACKAGE_JANUS_GATEWAY
 
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
 	depends on BR2_USE_MMU
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index bf3e590ac5..ea2ff6fa89 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -26,6 +26,10 @@ JANUS_GATEWAY_CONF_OPTS = \
 	--disable-data-channels \
 	--disable-sample-event-handler
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+JANUS_GATEWAY_DEPENDENCIES += libcurl
+endif
+
 ifeq ($(BR2_PACKAGE_JANUS_AUDIO_BRIDGE),y)
 JANUS_GATEWAY_DEPENDENCIES += opus
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-audiobridge
-- 
2.14.3
