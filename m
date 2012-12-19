From: bogdan at nimblex.org <bogdan@nimblex.org>
Date: Wed, 19 Dec 2012 16:58:44 +0000
Subject: [Buildroot] [PATCH 4/4] gstreamer: replace gst-ffmpeg with gst-libav
In-Reply-To: <1355936324-9585-1-git-send-email-bogdan@nimblex.org>
References: <1355936324-9585-1-git-send-email-bogdan@nimblex.org>
Message-ID: <1355936324-9585-4-git-send-email-bogdan@nimblex.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bogdan Radulescu <bogdan@nimblex.net>

Replaced gst-ffmepg with gst-libav plug-in.
Didn't use external libav since the gstreamer guys use a snapshot instead of a release of libav.
Removed gst-dsp and gst-omapfb as they are not available for gstreamer-1.0

Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>
---
 package/multimedia/Config.in                |  4 +---
 package/multimedia/gst-dsp/Config.in        |  8 -------
 package/multimedia/gst-dsp/gst-dsp.mk       | 18 ---------------
 package/multimedia/gst-ffmpeg/Config.in     | 17 ---------------
 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk | 18 ---------------
 package/multimedia/gst-libav/Config.in      | 16 ++++++++++++++
 package/multimedia/gst-libav/gst-libav.mk   | 34 +++++++++++++++++++++++++++++
 package/multimedia/gst-omapfb/Config.in     |  7 ------
 package/multimedia/gst-omapfb/gst-omapfb.mk | 19 ----------------
 9 files changed, 51 insertions(+), 90 deletions(-)
 delete mode 100644 package/multimedia/gst-dsp/Config.in
 delete mode 100644 package/multimedia/gst-dsp/gst-dsp.mk
 delete mode 100644 package/multimedia/gst-ffmpeg/Config.in
 delete mode 100644 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
 create mode 100644 package/multimedia/gst-libav/Config.in
 create mode 100644 package/multimedia/gst-libav/gst-libav.mk
 delete mode 100644 package/multimedia/gst-omapfb/Config.in
 delete mode 100644 package/multimedia/gst-omapfb/gst-omapfb.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 273d9bc..5ff7b4a 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -6,9 +6,7 @@ source "package/multimedia/faad2/Config.in"
 source "package/multimedia/flac/Config.in"
 source "package/multimedia/ffmpeg/Config.in"
 source "package/multimedia/gstreamer/Config.in"
-source "package/multimedia/gst-ffmpeg/Config.in"
-source "package/multimedia/gst-dsp/Config.in"
-source "package/multimedia/gst-omapfb/Config.in"
+source "package/multimedia/gst-libav/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
diff --git a/package/multimedia/gst-dsp/Config.in b/package/multimedia/gst-dsp/Config.in
deleted file mode 100644
index 590931a..0000000
--- a/package/multimedia/gst-dsp/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_GST_DSP
-	bool "gst-dsp"
-	depends on BR2_PACKAGE_GSTREAMER && BR2_cortex_a8
-	select BR2_PACKAGE_TIDSP_BINARIES
-	help
-	  GStreamer plug-in to access TI OMAP3 DSP algorithms.
-
-	  http://code.google.com/p/gst-dsp/
diff --git a/package/multimedia/gst-dsp/gst-dsp.mk b/package/multimedia/gst-dsp/gst-dsp.mk
deleted file mode 100644
index 74b4c98..0000000
--- a/package/multimedia/gst-dsp/gst-dsp.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-GST_DSP_VERSION = 0.10.2
-GST_DSP_SITE = http://gst-dsp.googlecode.com/files/
-
-define GST_DSP_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
-endef
-
-define GST_DSP_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
-endef
-
-define GST_DSP_UNINSTALL_TARGET_CMDS
-	$(RM) $(TARGET_DIR)/usr/lib/gstreamer-0.10/libgstdsp.so
-endef
-
-GST_DSP_DEPENDENCIES = gstreamer tidsp-binaries host-pkgconf
-
-$(eval $(generic-package))
diff --git a/package/multimedia/gst-ffmpeg/Config.in b/package/multimedia/gst-ffmpeg/Config.in
deleted file mode 100644
index 537101e..0000000
--- a/package/multimedia/gst-ffmpeg/Config.in
+++ /dev/null
@@ -1,17 +0,0 @@
-config BR2_PACKAGE_GST_FFMPEG
-	bool "gst-ffmpeg"
-	depends on BR2_PACKAGE_GSTREAMER
-	select BR2_PACKAGE_GST_PLUGINS_BASE
-	select BR2_PACKAGE_FFMPEG
-	select BR2_PACKAGE_FFMPEG_GPL
-	select BR2_PACKAGE_FFMPEG_POSTPROC
-	select BR2_PACKAGE_FFMPEG_SWSCALE
-	depends on BR2_LARGEFILE
-	depends on BR2_INET_IPV6
-	help
-	  GStreamer plugin using FFmpeg.
-
-	  http://gstreamer.freedesktop.org/
-
-comment "gst-ffmpeg requires a toolchain with LARGEFILE and IPV6 support"
-	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
diff --git a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
deleted file mode 100644
index 2570cea..0000000
--- a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-#############################################################
-#
-# gst-ffmpeg
-#
-#############################################################
-
-GST_FFMPEG_VERSION = 0.11.2
-GST_FFMPEG_SOURCE = gst-ffmpeg-$(GST_FFMPEG_VERSION).tar.bz2
-GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
-GST_FFMPEG_INSTALL_STAGING = YES
-GST_FFMPEG_DEPENDENCIES = host-pkgconf gstreamer gst-plugins-base ffmpeg
-GST_FFMPEG_CONF_OPT = --with-system-ffmpeg
-
-ifeq ($(BR2_PACKAGE_BZIP2),y)
-GST_FFMPEG_DEPENDENCIES += bzip2
-endif
-
-$(eval $(autotools-package))
diff --git a/package/multimedia/gst-libav/Config.in b/package/multimedia/gst-libav/Config.in
new file mode 100644
index 0000000..1365256
--- /dev/null
+++ b/package/multimedia/gst-libav/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_GST_LIBAV
+	bool "gst-libav"
+	depends on BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	depends on BR2_LARGEFILE
+	help
+	  GStreamer plugin (formerly gst-ffmpeg).
+
+	  This package is an implementation of the former
+	  gst-ffmpeg plugin but there is a lot missing from it.
+	  So far it only support decoding WMA and AAC.
+	  
+	  http://gstreamer.freedesktop.org/
+
+comment "gst-libav requires a toolchain with LARGEFILE support"
+	depends on !(BR2_LARGEFILE)
diff --git a/package/multimedia/gst-libav/gst-libav.mk b/package/multimedia/gst-libav/gst-libav.mk
new file mode 100644
index 0000000..cff69b2
--- /dev/null
+++ b/package/multimedia/gst-libav/gst-libav.mk
@@ -0,0 +1,34 @@
+
+#############################################################
+#
+# gst-libav
+#
+#############################################################
+
+GST_LIBAV_VERSION = 1.0.3
+GST_LIBAV_SOURCE = gst-libav-$(GST_LIBAV_VERSION).tar.xz
+GST_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
+GST_LIBAV_INSTALL_STAGING = YES
+
+GST_LIBAV_DEPENDENCIES = host-pkgconf gstreamer
+
+GST_LIBAV_CONF_OPT = \
+	--with-libav-extra-configure="--target-os=linux \
+	                               --disable-debug \
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
+GST_LIBAV_DEPENDENCIES += bzip2
+endif
+
+$(eval $(autotools-package))
diff --git a/package/multimedia/gst-omapfb/Config.in b/package/multimedia/gst-omapfb/Config.in
deleted file mode 100644
index e603cb1..0000000
--- a/package/multimedia/gst-omapfb/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_GST_OMAPFB
-	bool "gst-omapfb"
-	depends on BR2_PACKAGE_GSTREAMER && BR2_cortex_a8
-	help
-	  GStreamer plug-in to use OMAP framebuffer.
-
-	  http://github.com/felipec/gst-omapfb
diff --git a/package/multimedia/gst-omapfb/gst-omapfb.mk b/package/multimedia/gst-omapfb/gst-omapfb.mk
deleted file mode 100644
index f23bc86..0000000
--- a/package/multimedia/gst-omapfb/gst-omapfb.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-GST_OMAPFB_VERSION=1.0
-GST_OMAPFB_SOURCE=gst-omapfb-$(GST_OMAPFB_VERSION).tar.gz
-GST_OMAPFB_SITE=http://gst-dsp.googlecode.com/files/
-
-define GST_OMAPFB_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
-endef
-
-define GST_OMAPFB_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
-endef
-
-define GST_OMAPFB_UNINSTALL_TARGET_CMDS
-	$(RM) $(TARGET_DIR)/usr/lib/gstreamer-0.10/libgstomapfb.so
-endef
-
-GST_OMAPFB_DEPENDENCIES = gstreamer
-
-$(eval $(generic-package))
-- 
1.7.12.1
