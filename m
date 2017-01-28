From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 21:39:40 +1300
Subject: [Buildroot] [git commit] janus-gateway: make audio bridge plugin
	optional
Message-ID: <20170128084141.98CD87FAC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f8f669341ec5489bd1fad4bcd874bdc120fc7c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently janus-gateway is built by default with the audio bridge plugin.
This causes a example config file to be placed on the target filing system
that the user may not need or want, creates a 119K .so
file on the target directory, adds the dependency of opus for this
plugin, and janus will also create a warning when ran if the plugin does
not have a matching configuration file setup by the user, as it will not use
the example config file by default.

This patch makes the audio bridge plugin a option, removes the check for opus,
adds opus as a dependency to the audio bridge plugin, and selects the opus
package automatically when the user selects the plugin.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/janus-gateway/Config.in        |  4 ++++
 package/janus-gateway/janus-gateway.mk | 14 +++++++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 5ce84db..95b12a9 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -19,6 +19,10 @@ if BR2_PACKAGE_JANUS_GATEWAY
 
 comment "plugins"
 
+config BR2_PACKAGE_JANUS_AUDIO_BRIDGE
+	bool "audio bridge"
+	select BR2_PACKAGE_OPUS
+
 config BR2_PACKAGE_JANUS_SIP_GATEWAY
 	bool "sip gateway"
 	select BR2_PACKAGE_SOFIA_SIP
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index dac324f..1f9ba49 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -26,6 +26,13 @@ JANUS_GATEWAY_CONF_OPTS = \
 	--disable-data-channels \
 	--disable-rabbitmq
 
+ifeq ($(BR2_PACKAGE_JANUS_AUDIO_BRIDGE),y)
+JANUS_GATEWAY_DEPENDENCIES += opus
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-audiobridge
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-audiobridge
+endif
+
 ifeq ($(BR2_PACKAGE_JANUS_SIP_GATEWAY),y)
 JANUS_GATEWAY_DEPENDENCIES += sofia-sip
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-sip
@@ -40,13 +47,6 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-websockets
 endif
 
-ifeq ($(BR2_PACKAGE_OPUS),y)
-JANUS_GATEWAY_DEPENDENCIES += opus
-JANUS_GATEWAY_CONF_OPTS += --enable-plugin-audiobridge
-else
-JANUS_GATEWAY_CONF_OPTS += --disable-plugin-audiobridge
-endif
-
 ifeq ($(BR2_PACKAGE_LIBOGG),y)
 JANUS_GATEWAY_DEPENDENCIES += libogg
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-voicemail
