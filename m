From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 25 Jan 2017 08:42:40 -0500
Subject: [Buildroot] [V3 05/10] janus-gateway: Make recordplay plugin
	optional.
In-Reply-To: <20170125134245.12920-1-aduskett@codeblue.com>
References: <20170125134245.12920-1-aduskett@codeblue.com>
Message-ID: <20170125134245.12920-5-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently janus-gateway is built by default with the record and play plugin.
This causes a example config file to be placed on the target filing system
that the user may not need or want, creates a 68K .so
file on the target directory, and janus will also create a warning when ran
if the plugin does not have a matching configuration file setup by the user,
as it will not use the example config file by default.

This patch makes the record and play plugin a option.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
v2 -> v3:
  - Removed 'PLUGIN' from the name; as this is implied.
  - Removed 'default n' from the config file, as this is the default.

v1 -> v2:
  - Fixed patch so that this patch only adds the plugin to both the
    Config.in and the .mk file.
    
 package/janus-gateway/Config.in        | 3 +++
 package/janus-gateway/janus-gateway.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 1975f53..db29b19 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -26,6 +26,9 @@ config BR2_PACKAGE_JANUS_AUDIO_BRIDGE
 config BR2_PACKAGE_JANUS_ECHO_TEST
 	bool "echo test"
 
+config BR2_PACKAGE_JANUS_RECORDPLAY
+	bool "record and play"
+
 config BR2_PACKAGE_JANUS_SIP_GATEWAY
 	select BR2_PACKAGE_SOFIA_SIP
 	bool "sip gateway"
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index ce12393..a051e58 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -39,6 +39,12 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-echotest
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_RECORDPLAY),y)
+JANUS_GATEWAY_CONF_OPTS += --enable-plugin-recordplay
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-plugin-recordplay
+endif
+
 ifeq ($(BR2_PACKAGE_JANUS_SIP_GATEWAY),y)
 JANUS_GATEWAY_DEPENDENCIES += sofia-sip
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-sip
-- 
2.9.3
