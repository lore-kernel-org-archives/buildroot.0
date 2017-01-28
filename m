From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 21:39:40 +1300
Subject: [Buildroot] [git commit] janus-gateway: make text room plugin
	optional
Message-ID: <20170128084141.DAC737FAC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8bb5a76c67ee949df391a7d6673feca18c6b54f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently janus-gateway is built by default with the text room plugin.
This causes a example config file to be placed on the target filing system
that the user may not need or want, creates a 63K .so
file on the target directory, and janus will also generate a warning when
ran if the plugin does not have a matching configuration file setup by
the user, as it will not use the example config file by default.

This patch makes the text room plugin optional.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/janus-gateway/Config.in        | 3 +++
 package/janus-gateway/janus-gateway.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 16e98f8..50e4dff 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -36,6 +36,9 @@ config BR2_PACKAGE_JANUS_SIP_GATEWAY
 config  BR2_PACKAGE_JANUS_STREAMING
 	bool "streaming"
 
+config BR2_PACKAGE_JANUS_TEXT_ROOM
+	bool "text room"
+
 endif
 
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 96a81fe..52acd5c 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -58,6 +58,12 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-streaming
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_TEXT_ROOM),y)
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-textroom
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-textroom
+endif
+
 ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
 JANUS_GATEWAY_DEPENDENCIES += libwebsockets
 JANUS_GATEWAY_CONF_OPTS += --enable-websockets
