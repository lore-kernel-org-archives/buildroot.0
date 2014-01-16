From: Sven Neumann <neumann@teufel.de>
Date: Thu, 16 Jan 2014 14:57:52 +0100
Subject: [Buildroot] [PATCH] gst1-libav: new package
Message-ID: <1389880672-15503-1-git-send-email-neumann@teufel.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <neumann@teufel.de>
---
 package/gstreamer1/Config.in                |  1 +
 package/gstreamer1/gst1-libav/Config.in     | 14 ++++++++++
 package/gstreamer1/gst1-libav/gst1-libav.mk | 41 +++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 package/gstreamer1/gst1-libav/Config.in
 create mode 100644 package/gstreamer1/gst1-libav/gst1-libav.mk

diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index f7b98c7..fe0ad48 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -6,5 +6,6 @@ source "package/gstreamer1/gst1-plugins-base/Config.in"
 source "package/gstreamer1/gst1-plugins-good/Config.in"
 source "package/gstreamer1/gst1-plugins-bad/Config.in"
 source "package/gstreamer1/gst1-plugins-ugly/Config.in"
+source "package/gstreamer1/gst1-libav/Config.in"
 source "package/gstreamer1/gst-omx/Config.in"
 endif
diff --git a/package/gstreamer1/gst1-libav/Config.in b/package/gstreamer1/gst1-libav/Config.in
new file mode 100644
index 0000000..859bdff
--- /dev/null
+++ b/package/gstreamer1/gst1-libav/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_GST1_LIBAV
+	bool "gst1-libav"
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	depends on BR2_LARGEFILE
+	help
+	  GStreamer plugin (formerly gst-ffmpeg).
+
+	  This package contains GStreamer plugins based on
+	  the libav project.
+
+	  http://gstreamer.freedesktop.org/
+
+comment "gst1-libav requires a toolchain with LARGEFILE support"
+	depends on !(BR2_LARGEFILE)
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
new file mode 100644
index 0000000..e90f6c5
--- /dev/null
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -0,0 +1,41 @@
+#############################################################
+#
+# gst1-libav
+#
+#############################################################
+
+GST1_LIBAV_VERSION = 1.2.2
+GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
+GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
+
+GST1_LIBAV_DEPENDENCIES = host-pkgconf gstreamer1 gst1-plugins-base
+
+GST1_LIBAV_CONF_OPT = \
+	--with-libav-extra-configure="--target-os=linux \
+	                               --disable-debug \
+				       --disable-ffmpeg \
+				       --disable-avconv \
+				       --disable-avdevice \
+				       --disable-avplay \
+				       --disable-avserver \
+                                       --enable-pthreads \
+                                       --enable-zlib \
+                                       --prefix=$(STAGING_DIR)/usr \
+                                       --sysroot=$(STAGING_DIR) \
+                                       --host-cc=$(TARGET_CC) \
+                                       --cc=$(TARGET_CC) \
+                                       --arch=$(BR2_ARCH) \
+                                       --enable-cross-compile \
+                                       --cross-prefix=$(TARGET_CROSS) \
+                                       --disable-shared \
+                                       --enable-static"
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+GST1_LIBAV_DEPENDENCIES += bzip2
+endif
+
+ifeq ($(BR2_i386),y)
+GST1_LIBAV_DEPENDENCIES += host-yasm
+endif
+
+$(eval $(autotools-package))
-- 
1.8.3.2
