From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 24 Jan 2017 14:54:34 -0500
Subject: [Buildroot] [PATCH 06/10] janus-gateway: Make streaming plugin
	optional.
In-Reply-To: <20170124195438.4144-1-aduskett@codeblue.com>
References: <20170124195438.4144-1-aduskett@codeblue.com>
Message-ID: <20170124195438.4144-6-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently janus-gateway is built by default with the streaming plugin.
This causes a example config file to be placed on the target filing system
that the user may not need or want.
This patch makes the streaming  plugin a option.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/janus-gateway/Config.in        | 7 +++++++
 package/janus-gateway/janus-gateway.mk | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index b18204b..c273668 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -29,10 +29,17 @@ config BR2_PACKAGE_JANUS_PLUGIN_ECHO_TEST
 	bool "janus echo test plugin"
 	default n
 
+config BR2_PACKAGE_JANUS_PLUGIN_RECORDPLAY
+	bool "janus record and play plugin"
+	default n
+
 config BR2_PACKAGE_JANUS_PLUGIN_SIP
 	bool "janus sip gateway plugin"
 	default n
 
+config  BR2_PACKAGE_JANUS_PLUGIN_STREAMING
+	bool "janus streaming plugin"
+	default y
 
 endif
 
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index d2ffb8b..2ad1990 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -51,6 +51,12 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-sip
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_PLUGIN_STREAMING),y)
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-streaming
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-streaming
+endif
+
 ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
 JANUS_GATEWAY_DEPENDENCIES += libwebsockets
 JANUS_GATEWAY_CONF_OPTS += --enable-websockets
-- 
2.9.3
