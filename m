From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon,  4 Jul 2011 15:54:45 +0200
Subject: [Buildroot] [PATCH 6/6] gst-ffmpeg: depend on orc if it is enabled
In-Reply-To: <1309787685-22269-1-git-send-email-s.neumann@raumfeld.com>
References: <1309787685-22269-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1309787685-22269-7-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk |   36 +++++++++++++++++++++++++-
 1 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
index ebe87dc..4e7ca66 100644
--- a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
@@ -8,8 +8,40 @@ GST_FFMPEG_VERSION = 0.10.11
 GST_FFMPEG_SOURCE = gst-ffmpeg-$(GST_FFMPEG_VERSION).tar.bz2
 GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
 GST_FFMPEG_INSTALL_STAGING = YES
-GST_FFMPEG_DEPENDENCIES = gstreamer gst-plugins-base ffmpeg
-GST_FFMPEG_CONF_OPT = --with-system-ffmpeg
+GST_FFMPEG_DEPENDENCIES = gstreamer gst-plugins-base
+
+ifeq ($(BR2_PACKAGE_ORC),y)
+GST_FFMPEG_DEPENDENCIES += orc
+endif
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
1.7.1
