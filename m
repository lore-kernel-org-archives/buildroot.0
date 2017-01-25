From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 25 Jan 2017 08:42:38 -0500
Subject: [Buildroot] [V3 03/10] janus-gateway: Make audio bridge plugin
	optional.
In-Reply-To: <20170125134245.12920-1-aduskett@codeblue.com>
References: <20170125134245.12920-1-aduskett@codeblue.com>
Message-ID: <20170125134245.12920-3-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
v2 -> v3:
  - Removed 'PLUGIN' from the name; as this is implied.
  - Removed 'default n' from the config file, as this is the default.
  - Selecting the audio bridge plugin now adds opus to the dependencies in the
    make file and selects the opus package in the config file.
  - remove unecessary check for opus in the make file as the package is now
    selected by default if the user chooses to enable the audiobridge plugin.
v1 -> v2: 
  - Fixed patch so that this patch adds the plugin to both the
    Config.in and the .mk file.

 package/janus-gateway/Config.in        |  4 ++++
 package/janus-gateway/janus-gateway.mk | 14 +++++++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index b0a2e5d..c89c723 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -19,6 +19,10 @@ if BR2_PACKAGE_JANUS_GATEWAY
 
 comment "janus-gateway plugins"
 
+config BR2_PACKAGE_JANUS_AUDIO_BRIDGE
+	select BR2_PACKAGE_OPUS
+	bool "audio bridge"
+
 config BR2_PACKAGE_JANUS_SIP_GATEWAY
 	select BR2_PACKAGE_SOFIA_SIP
 	bool "sip gateway"
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
-- 
2.9.3
