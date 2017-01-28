From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 21:39:41 +1300
Subject: [Buildroot] [git commit] janus-gateway: make video room plugin
	optional
Message-ID: <20170128084142.05E4E81E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=955f2e6d1ce71c7168f05e28f66daf645f782dc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently janus-gateway is built by default with the video room  plugin.
This causes a example config file to be placed on the target filing system
that the user may not need or want, creates a 47K .so
file on the target directory, and janus will also generate a warning when
ran if the plugin does not have a matching configuration file setup by
the user, as it will not use the example config file by default.

This patch makes the video room plugin optional.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/janus-gateway/Config.in        | 3 +++
 package/janus-gateway/janus-gateway.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index b66480e..eb4d032 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -42,6 +42,9 @@ config BR2_PACKAGE_JANUS_TEXT_ROOM
 config BR2_PACKAGE_JANUS_VIDEO_CALL
 	bool "video call"
 
+config BR2_PACKAGE_JANUS_VIDEO_ROOM
+	bool "video room"
+
 endif
 
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index cfd8a7b..b9a36a0 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -70,6 +70,12 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-videocall
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_VIDEO_ROOM),y)
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-videoroom
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-videoroom
+endif
+
 ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
 JANUS_GATEWAY_DEPENDENCIES += libwebsockets
 JANUS_GATEWAY_CONF_OPTS += --enable-websockets
