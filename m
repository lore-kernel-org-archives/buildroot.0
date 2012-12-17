From: Bogdan Radulescu <bogdan_radulescu99@yahoo.com>
Date: Mon, 17 Dec 2012 12:08:03 -0800 (PST)
Subject: [Buildroot] [PATCH 1/1] Added FAAD,
	WavPack and gdk_pixbuf to gst-plugins.
Message-ID: <1355774883.23993.YahooMailNeo@web120306.mail.ne1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>
---
?package/multimedia/gst-plugins-bad/Config.in??????????? | 17 ++++++++++-------
?package/multimedia/gst-plugins-bad/gst-plugins-bad.mk?? |? 7 +++++++
?package/multimedia/gst-plugins-good/Config.in?????????? |? 7 +++++++
?package/multimedia/gst-plugins-good/gst-plugins-good.mk | 14 ++++++++++++++
?4 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index d87aec4..cd368fb 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -82,12 +82,12 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FESTIVAL
?config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FIELDANALYSIS
???? bool "fieldanalysis"
?
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE
-??? bool "freeze"
-
?config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEVERB
???? bool "freeverb"
?
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE
+??? bool "freeze"
+
?config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREI0R
???? bool "frei0r"
?
@@ -211,12 +211,12 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SMOOTH
?config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SPEED
???? bool "speed"
?
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SUBENC
-??? bool "subenc"
-
?config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_STEREO
???? bool "stereo"
?
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SUBENC
+??? bool "subenc"
+
?config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TTA
???? bool "tta"
?
@@ -241,7 +241,7 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VMNC
?config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_Y4M
???? bool "y4m"
?
-comment "plugins with external dependencies (there may be more available)"
+comment "plugins with external dependencies (not all from gstreamer are here)"
?
?config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK
???? bool "apexsink"
@@ -270,6 +270,9 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB
?config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FBDEV
???? bool "fbdev"
?
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FAAD
+??? bool "faad"
+
?config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBMMS
???? bool "libmms"
???? select BR2_PACKAGE_LIBMMS
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 714c987..183de7b 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -508,6 +508,13 @@ else
?GST_PLUGINS_BAD_CONF_OPT += --disable-dvb
?endif
?
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FAAD),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-faad
+GST_PLUGINS_BAD_DEPENDENCIES += faad2
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-faad
+endif
+
?ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FBDEV),y)
?GST_PLUGINS_BAD_CONF_OPT += --enable-fbdev
?else
diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index 33ecb5c..8c43ac8 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -161,6 +161,9 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOMIXER
?config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVENC
???? bool "wavenc"
?
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPACK
+??? bool "wavpack (*.wv audio)"
+
?config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPARSE
???? bool "wavparse (*.wav audio)"
???? default y
@@ -186,6 +189,10 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC
???? bool "flac (libFLAC)"
???? select BR2_PACKAGE_FLAC
?
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GDKPIXBUF
+??? bool "gdkpixbuf"
+??? select BR2_PACKAGE_GDK_PIXBUF
+
?config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS
???? bool "ossaudio (OSS audio)"
?
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index 18b4299..5e93a49 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -308,6 +308,13 @@ else
?GST_PLUGINS_GOOD_CONF_OPT += --disable-wavenc
?endif
?
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPACK),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-wavpack
+GST_PLUGINS_GOOD_DEPENDENCIES += wavpack
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-wavpack
+endif
+
?ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPARSE),y)
?GST_PLUGINS_GOOD_CONF_OPT += --enable-wavparse
?else
@@ -347,6 +354,13 @@ else
?GST_PLUGINS_GOOD_CONF_OPT += --disable-flac
?endif
?
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GDKPIXBUF),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-gdk_pixbuf
+GST_PLUGINS_GOOD_DEPENDENCIES += gdk-pixbuf
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-gdk_pixbuf
+endif
+
?ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS),y)
?GST_PLUGINS_GOOD_CONF_OPT += --enable-oss
?else
-- 
1.7.12.1
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gst-plugins.diff
Type: application/octet-stream
Size: 5046 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121217/d69ae7f5/attachment-0001.obj>
