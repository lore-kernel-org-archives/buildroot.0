From: Will Newton <will.newton@gmail.com>
Date: Tue, 16 Jun 2009 21:40:43 +0100
Subject: [Buildroot] [git commit] gst-plugins-good: Allow souphttpsrc plugin
	to be configured.
Message-ID: <20090618085944.D08397777D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a5b9cebfecb5ac840904a10c04c7343dbcc575a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Add a config option to enable the user to enable or disable the souphttpsrc
plugin.

Closes #383.

Signed-off-by: Will Newton <will.newton@gmail.com>
---
 package/multimedia/gst-plugins-good/Config.in      |    4 ++++
 .../gst-plugins-good/gst-plugins-good.mk           |    7 +++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index 5c5696c..b96f15d 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -156,4 +156,8 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS
 	bool "ossaudio (OSS audio)"
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
+	bool "souphttpsrc (http client)"
+	select BR2_PACKAGE_LIBSOUP
+
 endif
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index 68acdee..75d25c8 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -286,4 +286,11 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-oss
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-soup
+GST_PLUGINS_GOOD_DEPENDENCIES += libsoup
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-soup
+endif
+
 $(eval $(call AUTOTARGETS,package/multimedia,gst-plugins-good))
-- 
1.6.0.6
