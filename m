From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 15 Aug 2016 17:03:39 +0200
Subject: [Buildroot] [PATCH/next v5 4/6] package/ffmpeg: add optional
	support for opencv
In-Reply-To: <1471273421-12076-1-git-send-email-bernd.kuhls@t-online.de>
References: <1471273421-12076-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1471273421-12076-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ffmpeg only needs the imgproc module of opencv:
https://github.com/FFmpeg/FFmpeg/commit/15708f13477aaf2effdc0d7fc727507bc468335a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v5: no changes
v4: first release

 package/ffmpeg/ffmpeg.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 154a091..1f2d1df 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -48,7 +48,6 @@ FFMPEG_CONF_OPTS = \
 	--disable-frei0r \
 	--disable-libopencore-amrnb \
 	--disable-libopencore-amrwb \
-	--disable-libopencv \
 	--disable-libcdio \
 	--disable-libdc1394 \
 	--disable-libfaac \
@@ -249,6 +248,15 @@ else
 FFMPEG_CONF_OPTS += --disable-vdpau
 endif
 
+# To avoid a circular dependency only use opencv if opencv itself does
+# not depend on ffmpeg.
+ifeq ($(BR2_PACKAGE_OPENCV_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV_WITH_FFMPEG),yx)
+FFMPEG_CONF_OPTS += --enable-libopencv
+FFMPEG_DEPENDENCIES += opencv
+else
+FFMPEG_CONF_OPTS += --disable-libopencv
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 FFMPEG_CONF_OPTS += --enable-libopus
 FFMPEG_DEPENDENCIES += opus
-- 
2.8.1
