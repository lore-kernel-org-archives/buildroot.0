From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 24 Jan 2017 15:31:37 -0500
Subject: [Buildroot] [V2 08/10] janus-gateway: Make video call plugin
	optional.
In-Reply-To: <20170124203139.15919-1-aduskett@codeblue.com>
References: <20170124203139.15919-1-aduskett@codeblue.com>
Message-ID: <20170124203139.15919-8-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently janus-gateway is built by default with the video call plugin.
This causes a example config file to be placed on the target filing system
that the user may not need or want.
This patch makes the video call plugin a option.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
v1 -> v2: no changes.

 package/janus-gateway/Config.in        | 4 ++++
 package/janus-gateway/janus-gateway.mk | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 3a16534..c24de88 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -45,6 +45,10 @@ config BR2_PACKAGE_JANUS_PLUGIN_TEXT_ROOM
 	bool "janus text room plugin"
 	default n
 
+config BR2_PACKAGE_JANUS_PLUGIN_VIDEO_CALL
+	bool "janus video call plugin"
+	default n
+
 endif
 
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index c3e35c8..a1fffa1 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -63,6 +63,12 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-textroom
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_PLUGIN_VIDEO_CALL),y)
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-videocall
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-videocall
+endif
+
 ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
 JANUS_GATEWAY_DEPENDENCIES += libwebsockets
 JANUS_GATEWAY_CONF_OPTS += --enable-websockets
-- 
2.9.3
