From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 14:19:01 +0100
Subject: [Buildroot] [git commit] gst-plugins-good: add wavpack + gdkpixbuf
	options
Message-ID: <20130114132041.7BF7C9A0C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d3dcd932bd4724b32d6ca459efe6baad3f330f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by Bogdan Radulescu <bogdan_radulescu99@yahoo.com>

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-good/Config.in      |    8 ++++++++
 .../gst-plugins-good/gst-plugins-good.mk           |   14 ++++++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index b5006e6..1498ed0 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -186,6 +186,10 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC
 	bool "flac (libFLAC)"
 	select BR2_PACKAGE_FLAC
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GDKPIXBUF
+	bool "gdkpixbuf"
+	select BR2_PACKAGE_GDK_PIXBUF
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS
 	bool "ossaudio (OSS audio)"
 
@@ -205,4 +209,8 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPEEX
 	bool "speex"
 	select BR2_PACKAGE_SPEEX
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPACK
+	bool "wavpack (*.wv audio)"
+	select BR2_PACKAGE_WAVPACK
+
 endif
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index f64527d..2ba3e20 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -342,6 +342,13 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-flac
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GDKPIXBUF),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-gdk_pixbuf
+GST_PLUGINS_GOOD_DEPENDENCIES += gdk-pixbuf
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-gdk_pixbuf
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-oss
 else
@@ -375,4 +382,11 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-speex
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPACK),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-wavpack
+GST_PLUGINS_GOOD_DEPENDENCIES += wavpack
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-wavpack
+endif
+
 $(eval $(autotools-package))
