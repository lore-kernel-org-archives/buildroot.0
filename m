From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 21:31:45 +0200
Subject: [Buildroot] [git commit] package/opencv: gpu module depends on
	!BR2_STATIC_LIBS
Message-ID: <20160515193406.0BE3A801C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07144093d4fd0d5c6f59006a0e58fd5074da0f92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GPU support and related features (GL and CL) are detected and loaded at
runtime, so it requires libdl which is only available on
!BR2_STATIC_LIBS builds.

Because the OpenCV tests sets use these modules, they also requires
libdl, so they cannot be built when BR2_STATIC_LIBS is enable.

Fixes:
  http://autobuild.buildroot.net/results/570/57007a8d22d20b2fc5cd64154f5ec674b0842afa/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index d06135c..05c1fc1 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -58,9 +58,13 @@ config BR2_PACKAGE_OPENCV_LIB_GPU
 	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 	select BR2_PACKAGE_OPENCV_LIB_PHOTO
 	select BR2_PACKAGE_OPENCV_LIB_VIDEO
+	depends on !BR2_STATIC_LIBS
 	help
 	  Include opencv_gpu module into the OpenCV build.
 
+comment "gpu module needs a toolchain w/ dynamic libraries"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	bool "highgui"
 	default y
@@ -168,13 +172,21 @@ config BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB
 	help
 	  Include opencv_videostab module into the OpenCV build.
 
+if !BR2_STATIC_LIBS
+
 comment "Test sets"
+
 config BR2_PACKAGE_OPENCV_BUILD_TESTS
 	bool "build tests"
 
 config BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS
 	bool "build performance tests"
 
+endif
+
+comment "Tests sets need a toolchain w/ dynamic libraries"
+	depends on BR2_STATIC_LIBS
+
 comment "3rd party support"
 
 config BR2_PACKAGE_OPENCV_WITH_FFMPEG
