From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 22:18:35 +0200
Subject: [Buildroot] [git commit] package/opencv: define modules
	inter-dependencies
Message-ID: <20160421201839.619D380489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc23297c5cb7e3b36d8c8bacdd58e3babda3af85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenCV allows to enable/disable the selection of modules (a.k.a.
opencv libraries). These modules depend one on the others; these
dependencies are already handled by the build-system (CMake).

However, the way we handled them in Buildroot was not really clean.
For each opencv module, there is a kconfig option, but we forced the
corresponding CMake config option without checking for the modules'
dependencies.
For further details about the issues this situation was causing, refer
to this discussion [1].

This patch replicates the modules' dependency relations in the
Config.in, so that the selection of the user will actually be built.
This changes completes this work [2].

[1] http://lists.busybox.net/pipermail/buildroot/2016-April/159017.html
[2] https://git.buildroot.org/buildroot/commit/?id=3bd5025038a9ecfb2c19a2450a68ae3b0888b440

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in | 42 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 83a26a6..908eb37 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -17,13 +17,14 @@ comment "OpenCV modules"
 config BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	bool "calib3d"
 	default y
+	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_calib3d module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_CONTRIB
 	bool "contrib"
 	default y
-	# modules/contrib/CMakeLists.txt
 	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
@@ -36,24 +37,32 @@ config BR2_PACKAGE_OPENCV_LIB_CONTRIB
 config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	bool "features2d"
 	default y
+	select BR2_PACKAGE_OPENCV_LIB_FLANN
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_features2d module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_FLANN
 	bool "flann"
 	default y
+	# opencv_core dependency is already enabled
 	help
 	  Include opencv_flann module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_GPU
 	bool "gpu"
+	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_LEGACY
+	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
+	select BR2_PACKAGE_OPENCV_LIB_PHOTO
+	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
 	  Include opencv_gpu module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	bool "highgui"
 	default y
-	# modules/highgui/CMakeLists.txt
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_highgui module into the OpenCV build.
@@ -61,13 +70,13 @@ config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 config BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	bool "imgproc"
 	default y
+	# opencv_core dependency is already enabled
 	help
 	  Include opencv_imgproc module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_LEGACY
 	bool "legacy"
 	default y
-	# modules/legacy/CMakeLists.txt
 	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV_LIB_ML
 	select BR2_PACKAGE_OPENCV_LIB_VIDEO
@@ -77,18 +86,22 @@ config BR2_PACKAGE_OPENCV_LIB_LEGACY
 config BR2_PACKAGE_OPENCV_LIB_ML
 	bool "ml (machine learning)"
 	default y
+	# opencv_core dependency is already enabled
 	help
 	  Include opencv_ml module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_NONFREE
 	bool "nonfree"
+	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_nonfree module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 	bool "objdetect"
 	default y
-	# modules/objdetect/CMakeLists.txt
+	# opencv_core dependency is already enabled
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_objdetect module into the OpenCV build.
@@ -96,6 +109,7 @@ config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 config BR2_PACKAGE_OPENCV_LIB_PHOTO
 	bool "photo"
 	default y
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_photo module into the OpenCV build.
 
@@ -104,32 +118,50 @@ comment "opencv_python module requires numpy which is not yet available."
 config BR2_PACKAGE_OPENCV_LIB_STITCHING
 	bool "stitching"
 	default y
+	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 	help
 	  Include opencv_stitching module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_SUPERRES
 	bool "superres"
 	default y
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
 	  Include opencv_superres "super resolution" - module into the OpenCV
 	  build.
 
 config BR2_PACKAGE_OPENCV_LIB_TS
 	bool "ts (touchscreen)"
-	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	default y
+	# opencv_core dependency is already enabled
+	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
 	  Include opencv_ts module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_VIDEO
 	bool "video"
 	default y
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_video module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB
 	bool "videostab"
 	default y
+	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_PHOTO
+	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
 	  Include opencv_videostab module into the OpenCV build.
 
