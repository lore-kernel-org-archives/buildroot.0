From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 16:31:23 +0200
Subject: [Buildroot] [git commit] package/janus-gateway: add an option to
 remove the HTML demos
Message-ID: <20200906142335.20A8D815E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc483043d4541d626369e11a96c0a3467c8b51d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

janus-gateway comes with an example website to test its features.
Since the bump to 0.10.3, this website takes 1.8MiB uncompressed on
the target, among which is a 1MiB video sample which does not compress
well.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/janus-gateway/Config.in        | 6 ++++++
 package/janus-gateway/janus-gateway.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 434ea30152..5d711fe746 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -18,6 +18,12 @@ menuconfig BR2_PACKAGE_JANUS_GATEWAY
 
 if BR2_PACKAGE_JANUS_GATEWAY
 
+config BR2_PACKAGE_JANUS_GATEWAY_DEMOS
+	bool "HTML demos"
+	help
+	  Install the demonstration website, as featured on
+	  https://janus.conf.meetecho.com/
+
 comment "plugins"
 
 config BR2_PACKAGE_JANUS_GATEWAY_AUDIO_BRIDGE
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 444c396b97..bdf8d7a1e0 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -22,6 +22,13 @@ JANUS_GATEWAY_CONF_OPTS = \
 	--disable-data-channels \
 	--disable-sample-event-handler
 
+ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_DEMOS),)
+define JANUS_GATEWAY_REMOVE_DEMOS
+	$(RM) -fr $(TARGET_DIR)/usr/share/janus/demos/
+endef
+JANUS_GATEWAY_POST_INSTALL_TARGET_HOOKS += JANUS_GATEWAY_REMOVE_DEMOS
+endif
+
 ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_AUDIO_BRIDGE),y)
 JANUS_GATEWAY_DEPENDENCIES += opus
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-audiobridge
