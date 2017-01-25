From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 25 Jan 2017 08:42:43 -0500
Subject: [Buildroot] [V3 08/10] janus-gateway: Make video call plugin
	optional.
In-Reply-To: <20170125134245.12920-1-aduskett@codeblue.com>
References: <20170125134245.12920-1-aduskett@codeblue.com>
Message-ID: <20170125134245.12920-8-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently janus-gateway is built by default with the video call plugin.
This causes a example config file to be placed on the target filing system
that the user may not need or want, creates a 47K .so
file on the target directory, and janus will also generate a warning when
ran if the plugin does not have a matching configuration file setup by
the user, as it will not use the example config file by default.

This patch makes the video call plugin optional.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
v2 -> v3:
  - Removed 'PLUGIN' from the name; as this is implied.
  - Removed 'default n' from the config file, as this is the default.
v1 -> v2:
  - No changes.

 package/janus-gateway/Config.in        | 3 +++
 package/janus-gateway/janus-gateway.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 836fb8b..092bb60 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -39,6 +39,9 @@ config  BR2_PACKAGE_JANUS_STREAMING
 config BR2_PACKAGE_JANUS_TEXT_ROOM
 	bool "text room"
 
+config BR2_PACKAGE_JANUS_VIDEO_CALL
+	bool "video call"
+
 endif
 
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 52acd5c..cfd8a7b 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -64,6 +64,12 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-textroom
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_VIDEO_CALL),y)
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
