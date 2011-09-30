From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 30 Sep 2011 16:17:22 +0200
Subject: [Buildroot] [PATCH 1/2] gst-ffmpeg: change back to use the included
	version of ffmpeg
Message-ID: <1317392243-27154-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream buildroot uses the system-wide installed copy of ffmpeg.
Since we only need ffmpeg for the gstreamer plug-in, go back to
using the included version.

Also had to disable iwmmxt optimizations, we might want to review
this later...
---
 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk |   32 +++++++++++++++++++++++++-
 1 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
index 41a7f3b..3a8b78f 100644
--- a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
@@ -8,8 +8,36 @@ GST_FFMPEG_VERSION = 0.10.11
 GST_FFMPEG_SOURCE = gst-ffmpeg-$(GST_FFMPEG_VERSION).tar.bz2
 GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
 GST_FFMPEG_INSTALL_STAGING = YES
-GST_FFMPEG_DEPENDENCIES = gstreamer gst-plugins-base ffmpeg
-GST_FFMPEG_CONF_OPT = --with-system-ffmpeg
+GST_FFMPEG_DEPENDENCIES = gstreamer gst-plugins-base
+
+GST_FFMPEG_CONF_OPT = \
+	--with-ffmpeg-extra-configure="--target-os=linux \
+				       --disable-ffmpeg \
+                                       --disable-ffplay \
+                                       --disable-ffserver \
+                                       --disable-avfilter \
+                                       --disable-swscale \
+                                       --enable-gpl \
+                                       --enable-nonfree \
+                                       --enable-postproc \
+                                       --enable-pthreads \
+                                       --enable-zlib \
+                                       --disable-avfilter \
+                                       --enable-postproc \
+                                       --enable-swscale \
+                                       --prefix=$(STAGING_DIR)/usr \
+                                       --enable-cross-compile \
+                                       --sysroot=$(STAGING_DIR) \
+                                       --host-cc=$(TARGET_CC) \
+                                       --cc=$(TARGET_CC) \
+                                       --arch=$(BR2_ARCH) \
+                                       --enable-cross-compile \
+                                       --cross-prefix=$(TARGET_CROSS) \
+                                       --disable-shared \
+                                       --enable-static \
+                                       --disable-encoders \
+                                       --disable-muxers \
+				       --disable-iwmmxt"
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 GST_FFMPEG_DEPENDENCIES += bzip2
-- 
1.7.4.1
