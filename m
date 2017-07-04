From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 13:31:41 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: move dtls plugin
Message-ID: <20170704113143.434E27FD23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b1529948b00e8b51806f2a84f65874972205417
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dtls plugin needs openssl, so move it down to the "plugins with external
dependencies" section to match the rest of the plugins.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 12 ++++++------
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 14 +++++++-------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 67d3923..0c97899 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -219,12 +219,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	help
 	  Collection of elements that may or may not be useful for debugging
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS
-	bool "dtls"
-	select BR2_PACKAGE_OPENSSL
-	help
-	  DTLS plugin
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY
 	bool "dvdsuboverlay"
 	help
@@ -547,6 +541,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS
 comment "libmms needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS
+	bool "dtls"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  DTLS plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTML
 	bool "ttml"
 	depends on BR2_USE_WCHAR # pango -> glib2
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 56e443c..685538d 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -233,13 +233,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-debugutils
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-dtls
-GST1_PLUGINS_BAD_DEPENDENCIES += openssl
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-dtls
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-dvbsuboverlay
 else
@@ -636,6 +629,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-libmms
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-dtls
+GST1_PLUGINS_BAD_DEPENDENCIES += openssl
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-dtls
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTML),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-ttml
 GST1_PLUGINS_BAD_DEPENDENCIES += cairo libxml2 pango
