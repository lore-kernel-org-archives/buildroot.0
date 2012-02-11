From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Sat, 11 Feb 2012 02:17:11 +0200
Subject: [Buildroot] [PATCH] Add gst-av package
Message-ID: <1328919431-22820-1-git-send-email-felipe.contreras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
---
 package/multimedia/Config.in        |    1 +
 package/multimedia/gst-av/Config.in |   12 ++++++++++++
 package/multimedia/gst-av/gst-av.mk |   19 +++++++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/gst-av/Config.in
 create mode 100644 package/multimedia/gst-av/gst-av.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index a05d1d9..b9209da 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -7,6 +7,7 @@ source "package/multimedia/flac/Config.in"
 source "package/multimedia/ffmpeg/Config.in"
 source "package/multimedia/gstreamer/Config.in"
 source "package/multimedia/gst-ffmpeg/Config.in"
+source "package/multimedia/gst-av/Config.in"
 source "package/multimedia/gst-dsp/Config.in"
 source "package/multimedia/gst-omapfb/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
diff --git a/package/multimedia/gst-av/Config.in b/package/multimedia/gst-av/Config.in
new file mode 100644
index 0000000..d43269e
--- /dev/null
+++ b/package/multimedia/gst-av/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_GST_AV
+	bool "gst-av"
+	depends on BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	select BR2_PACKAGE_FFMPEG
+	help
+	  GStreamer plug-in to provide support for libav (fork of FFmpeg), it
+	  is similar to gst-ffmpeg, but all libav codecs are supported, even if
+	  there are native GStreamer alternatives; VP8, MP3, Ogg, Vorbis, AAC,
+	  etc.
+
+	  http://code.google.com/p/gst-av/
diff --git a/package/multimedia/gst-av/gst-av.mk b/package/multimedia/gst-av/gst-av.mk
new file mode 100644
index 0000000..cb47ac6
--- /dev/null
+++ b/package/multimedia/gst-av/gst-av.mk
@@ -0,0 +1,19 @@
+GST_AV_VERSION = 0.6.0
+GST_AV_SOURCE = gst-av-$(GST_AV_VERSION).tar.gz
+GST_AV_SITE = http://gst-av.googlecode.com/files/
+
+define GST_AV_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
+endef
+
+define GST_AV_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
+endef
+
+define GST_AV_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/usr/lib/gstreamer-0.10/libgstav.so
+endef
+
+GST_AV_DEPENDENCIES = gstreamer gst-plugins-base ffmpeg host-pkg-config
+
+$(eval $(call GENTARGETS))
-- 
1.7.9.1.g97f7d
