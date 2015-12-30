From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Dec 2015 21:06:38 +0100
Subject: [Buildroot] [git commit] package/gstreamer1: Allow to build
	OpenJPEG plugin
Message-ID: <20151230202300.56E8E8274E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fcb2c2329e73bbe603534d6e92d9c63bd63858a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The OpenJPEG library is packaged in buildroot (version 1) and there is a
plugin "openjpeg" using it in gst1-plugins-bad. This commit add the option
for building this plugin. It provide a JPEG2000 encoder and decoder.

[Peter: use 'select' instead of 'depends on', sort alphabetically]
Signed-off-by: Vincent Dehors <vincent.dehors@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 6 ++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index a834f13..bc9415b 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -597,6 +597,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENH264
 	bool "openh264"
 	select BR2_PACKAGE_LIBOPENH264
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENJPEG
+	bool "openjpeg"
+	select BR2_PACKAGE_OPENJPEG
+	help
+	  GStreamer OpenJPEG plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPUS
 	bool "opus"
 	select BR2_PACKAGE_OPUS
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 64760a8..5a913a3 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -58,7 +58,6 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-nas \
 	--disable-ofa \
 	--disable-openexr \
-	--disable-openjpeg \
 	--disable-openni2 \
 	--disable-pvr \
 	--disable-libvisual \
@@ -715,6 +714,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-opencv
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENJPEG),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-openjpeg
+GST1_PLUGINS_BAD_DEPENDENCIES += openjpeg
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-openjpeg
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPUS),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-opus
 GST1_PLUGINS_BAD_DEPENDENCIES += opus
