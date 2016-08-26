From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 17:17:47 +0200
Subject: [Buildroot] [git commit branch/next] package/ffmpeg: add optional
	support for opencv
Message-ID: <20160826194349.E66737F9A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9ea46425ba886e479b658dc8e7f55cc175cfad7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

ffmpeg only needs the imgproc module of opencv:
https://github.com/FFmpeg/FFmpeg/commit/15708f13477aaf2effdc0d7fc727507bc468335a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 91e7fa9..1d04101 100644
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
