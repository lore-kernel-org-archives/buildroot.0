From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Sep 2016 16:51:19 +0200
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: opencv2 support is broken
	if BR2_ARM_ENABLE_VFP is enabled
Message-ID: <20160905145120.8613-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/c32/c32a21240a9933796ee850349a62ff3c2314f25c/
http://autobuild.buildroot.net/results/22a/22a9769d83d2a398bb6b264d342b2077c41c9cc5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index a90d437..74f783c 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -250,7 +250,8 @@ endif
 
 # To avoid a circular dependency only use opencv if opencv itself does
 # not depend on ffmpeg.
-ifeq ($(BR2_PACKAGE_OPENCV_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV_WITH_FFMPEG),yx)
+# opencv2 is broken if BR2_ARM_ENABLE_VFP is enabled
+ifeq ($(BR2_PACKAGE_OPENCV_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV_WITH_FFMPEG)x$(BR2_ARM_ENABLE_VFP),yxx)
 FFMPEG_CONF_OPTS += --enable-libopencv
 FFMPEG_DEPENDENCIES += opencv
 else
-- 
2.9.3
