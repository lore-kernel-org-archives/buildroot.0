From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 24 Jan 2017 14:54:31 -0500
Subject: [Buildroot] [PATCH 03/10] janus-gateway: Make audio bridge plugin
	optional.
In-Reply-To: <20170124195438.4144-1-aduskett@codeblue.com>
References: <20170124195438.4144-1-aduskett@codeblue.com>
Message-ID: <20170124195438.4144-3-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently janus-gateway is built by default with the audio bridge plugin.
This causes a example config file to be placed on the target filing system
that the user may not need or want.
This patch makes the audio bridge plugin a option.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/janus-gateway/janus-gateway.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 77254e6..da25137 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -26,6 +26,12 @@ JANUS_GATEWAY_CONF_OPTS = \
 	--disable-data-channels \
 	--disable-rabbitmq
 
+ifeq ($(BR2_PACKAGE_JANUS_PLUGIN_AUDIO_BRIDGE),y)
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-audiobridge
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-audiobridge
+endif
+
 ifeq ($(BR2_PACKAGE_JANUS_PLUGIN_SIP_GATEWAY),y)
 JANUS_GATEWAY_DEPENDENCIES += sofia-sip
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-sip
-- 
2.9.3
