From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 24 Jan 2017 15:31:36 -0500
Subject: [Buildroot] [V2 07/10] janus-gateway: Make text room plugin
	optional.
In-Reply-To: <20170124203139.15919-1-aduskett@codeblue.com>
References: <20170124203139.15919-1-aduskett@codeblue.com>
Message-ID: <20170124203139.15919-7-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently janus-gateway is built by default with the text room plugin.
This causes a example config file to be placed on the target filing system
that the user may not need or want.
This patch makes the text room plugin a option.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
v1 -> v2: no changes.

 package/janus-gateway/Config.in        | 4 ++++
 package/janus-gateway/janus-gateway.mk | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index a7edb61..3a16534 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -41,6 +41,10 @@ config  BR2_PACKAGE_JANUS_PLUGIN_STREAMING
 	bool "janus streaming plugin"
 	default y
 
+config BR2_PACKAGE_JANUS_PLUGIN_TEXT_ROOM
+	bool "janus text room plugin"
+	default n
+
 endif
 
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 2ad1990..c3e35c8 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -57,6 +57,12 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-streaming
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_PLUGIN_TEXT_ROOM),y)
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-textroom
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-textroom
+endif
+
 ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
 JANUS_GATEWAY_DEPENDENCIES += libwebsockets
 JANUS_GATEWAY_CONF_OPTS += --enable-websockets
-- 
2.9.3
