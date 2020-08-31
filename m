From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Mon, 31 Aug 2020 17:32:41 +0200
Subject: [Buildroot] [PATCH next 1/1] package/janus-gateway: add an option
 to remove the HTML demos
Message-ID: <20200831153241.8960-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

janus-gateway comes with an example website to test its features.
Since the bump to 0.10.3, this website takes 1.8MiB uncompressed on the
target, among which is a 1MiB video sample which does not compress
well.

This adds an default-y option to keep the website after installation.
If unset, the website is manually deleted from the target as there is
no configure option to not install it.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---

Not to mention that the video is said to have been downloaded from
www2.iis.fraunhofer.de, but its terms and conditions do not seems to
allow redistribution:
https://www.iis.fraunhofer.de/en/imprint.html
---
 package/janus-gateway/Config.in        | 7 +++++++
 package/janus-gateway/janus-gateway.mk | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 434ea30152..91cdda266e 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -18,6 +18,13 @@ menuconfig BR2_PACKAGE_JANUS_GATEWAY
 
 if BR2_PACKAGE_JANUS_GATEWAY
 
+config BR2_PACKAGE_JANUS_GATEWAY_DEMOS
+	bool "HTML demos"
+	default y
+	help
+	  Install the demonstration website, as featured on
+	  https://janus.conf.meetecho.com/
+
 comment "plugins"
 
 config BR2_PACKAGE_JANUS_GATEWAY_AUDIO_BRIDGE
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 444c396b97..f0acca8b25 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -22,6 +22,13 @@ JANUS_GATEWAY_CONF_OPTS = \
 	--disable-data-channels \
 	--disable-sample-event-handler
 
+ifneq ($(BR2_PACKAGE_JANUS_GATEWAY_DEMOS),y)
+define JANUS_GATEWAY_REMOVE_DEMOS
+	$(RM) -fr $(TARGET_DIR)/usr/share/janus/demos/
+endef
+JANUS_GATEWAY_POST_INSTALL_TARGET_HOOKS += JANUS_GATEWAY_REMOVE_DEMOS
+endif
+
 ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_AUDIO_BRIDGE),y)
 JANUS_GATEWAY_DEPENDENCIES += opus
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-audiobridge
-- 
2.28.0
