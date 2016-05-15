From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 15 May 2016 10:43:23 +0200
Subject: [Buildroot] [PATCH] package/opencv: disable toolchains affected by
	PR19405
Message-ID: <1463301803-15333-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

opencv libphoto fail to link with the following error:
nios2-linux-gnu/bin/ld: BFD (Sourcery CodeBench Lite 2015.11-130) 2.25.51
assertion fail binutils-src-2015.11-130-nios2-linux-gnu-i686-pc-linux-gnu/bfd/elf32-nios2.c:1908

Fixes:
http://autobuild.buildroot.net/results/fd0cc1cb09d07be94770d984efb28eea7c6f25b7

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/opencv/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 908eb37..d06135c 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -51,6 +51,7 @@ config BR2_PACKAGE_OPENCV_LIB_FLANN
 
 config BR2_PACKAGE_OPENCV_LIB_GPU
 	bool "gpu"
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # opencv libphoto
 	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_LEGACY
@@ -109,6 +110,7 @@ config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 config BR2_PACKAGE_OPENCV_LIB_PHOTO
 	bool "photo"
 	default y
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Binutils 2.25 nios2 issue
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_photo module into the OpenCV build.
@@ -156,6 +158,7 @@ config BR2_PACKAGE_OPENCV_LIB_VIDEO
 config BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB
 	bool "videostab"
 	default y
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # opencv libphoto
 	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
-- 
2.5.5
