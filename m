From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 24 Jan 2017 14:54:32 -0500
Subject: [Buildroot] [PATCH 04/10] janus-gateway: Make echo test plugin
	optional.
In-Reply-To: <20170124195438.4144-1-aduskett@codeblue.com>
References: <20170124195438.4144-1-aduskett@codeblue.com>
Message-ID: <20170124195438.4144-4-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently janus-gateway is built by default with the echo test plugin.
This causes a example config file to be placed on the target filing system
that the user may not need or want.
This patch makes the echo test plugin a option.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/janus-gateway/Config.in        | 10 +++++++++-
 package/janus-gateway/janus-gateway.mk |  6 ++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 7008d56..b18204b 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -20,7 +20,15 @@ menuconfig BR2_PACKAGE_JANUS_GATEWAY
 if BR2_PACKAGE_JANUS_GATEWAY
 
 comment "janus-gateway plugins"
-	
+
+config BR2_PACKAGE_JANUS_PLUGIN_AUDIO_BRIDGE
+	bool "janus audio bridge plugin"
+	default n
+
+config BR2_PACKAGE_JANUS_PLUGIN_ECHO_TEST
+	bool "janus echo test plugin"
+	default n
+
 config BR2_PACKAGE_JANUS_PLUGIN_SIP
 	bool "janus sip gateway plugin"
 	default n
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index da25137..e1e3601 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -32,6 +32,12 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-audiobridge
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_PLUGIN_ECHO_TEST),y)
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-echotest
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-echotest
+endif
+
 ifeq ($(BR2_PACKAGE_JANUS_PLUGIN_SIP_GATEWAY),y)
 JANUS_GATEWAY_DEPENDENCIES += sofia-sip
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-sip
-- 
2.9.3
