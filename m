From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 24 Jan 2017 14:54:38 -0500
Subject: [Buildroot] [PATCH 10/10] janus-gateway: Make voicemail plugin
	optional.
In-Reply-To: <20170124195438.4144-1-aduskett@codeblue.com>
References: <20170124195438.4144-1-aduskett@codeblue.com>
Message-ID: <20170124195438.4144-10-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently janus-gateway is built by default with the voicemail plugin.
This causes a example config file to be placed on the target filing system
that the user may not need or want.
This patch makes the voicemail plugin a option.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/janus-gateway/Config.in        | 4 ++++
 package/janus-gateway/janus-gateway.mk | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index deedc36..f74895f 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -53,6 +53,10 @@ config BR2_PACKAGE_JANUS_PLUGIN_VIDEO_ROOM
 	bool "janus video room plugin"
 	default n
 
+config BR2_PACKAGE_JANUS_PLUGIN_VOICE_MAIL
+	bool "janus voice mail plugin"
+	default n
+
 endif
 
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 040973d..d716c2e 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -75,6 +75,12 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-videoroom
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_PLUGIN_VOICE_MAIL),y)
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-voicemail
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-voicemail
+endif
+
 ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
 JANUS_GATEWAY_DEPENDENCIES += libwebsockets
 JANUS_GATEWAY_CONF_OPTS += --enable-websockets
-- 
2.9.3
