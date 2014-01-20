From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 Jan 2014 12:33:40 +0200
Subject: [Buildroot] [PATCH] gst-ffmpeg: fix build for xtensa
Message-ID: <c047dbb77048875f512696ec613ef7d204724753.1390214020.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 6ea49a23df3 (gst-ffmpeg: Use internal libav instead of external
ffmpeg) gst-ffmpge uses its internal libav. This requires the same fix for
xtensa like ffmpeg got in commit 4ec35e76b8a3 (ffmpeg: fix build for xtensa).

Fixes
http://autobuild.buildroot.net/results/08a/08a27891fd5336250f00e611a15ea45505985f67/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index 6534f9310795..eb7389f90f30 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -14,6 +14,14 @@ GST_FFMPEG_CONF_EXTRA_OPT = \
 		--cross-prefix=$(TARGET_CROSS) \
 		--target-os=linux
 
+GST_FFMPEG_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_xtensa),y)
+GST_FFMPEG_CFLAGS += -mtext-section-literals
+endif
+
+GST_FFMPEG_CONF_ENV = CFLAGS="$(GST_FFMPEG_CFLAGS)"
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GST_FFMPEG_CONF_EXTRA_OPT += --enable-zlib
 GST_FFMPEG_DEPENDENCIES += zlib
-- 
1.8.5.2
