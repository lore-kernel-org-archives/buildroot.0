From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 31 Aug 2014 22:09:06 +0200
Subject: [Buildroot] [PATCH v3 4/8] opencv: define modules inter-dependencies
In-Reply-To: <1409515750-10289-1-git-send-email-s.martin49@gmail.com>
References: <1409515750-10289-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1409515750-10289-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenCV allows to enable/disable the selection of modules (a.k.a.
opencv libraries). These modules depend one on the others; these
dependencies are already handled by the build-system (CMake).

However, the way we handled them in Buildroot was not really clean.
For each opencv module, there is a kconfig option, but we forced the
corresponding cmake config option without checking for module
dependencies.

This patch replicates the modules' dependency relations in the
Config.in, so that the selection of the user will actually be built.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v2 -> v3:
- rebase
- fix typo in commit log (Yann)
- update A/R/T tags

changes v1 -> v2:
- rebase
---
 package/opencv/Config.in | 75 ++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 60 insertions(+), 15 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index d725d44..7c2b964 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -8,6 +8,8 @@ menuconfig BR2_PACKAGE_OPENCV
 	  OpenCV (Open Source Computer Vision) is a library of programming
 	  functions for real time computer vision.
 
+	  Note that the opencv_core module is automatically enabled.
+
 	  http://opencv.org/
 
 if BR2_PACKAGE_OPENCV
@@ -16,109 +18,152 @@ comment "OpenCV modules"
 
 config BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	bool "calib3d"
-	default y
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	help
 	  Include opencv_calib3d module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_CONTRIB
 	bool "contrib"
-	default y
+	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_ML
+	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
+	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
 	  Include opencv_contrib module into the OpenCV build.
 
+# opencv_core module is automatically enabled when OpenCV package is selected
+
 config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	bool "features2d"
-	default y
+	select BR2_PACKAGE_OPENCV_LIB_FLANN
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_features2d module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_FLANN
 	bool "flann"
-	default y
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
-	default y
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_highgui module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	bool "imgproc"
-	default y
+	# opencv_core dependency is already enabled
 	help
 	  Include opencv_imgproc module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_LEGACY
 	bool "legacy"
-	default y
+	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV_LIB_ML
+	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
 	  Include opencv_legacy module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_ML
 	bool "ml (machine learning)"
-	default y
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
-	default y
+	# opencv_core dependency is already enabled
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_objdetect module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_PHOTO
 	bool "photo"
-	default y
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_photo module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_PYTHON
 	bool "python"
 	depends on BR2_PACKAGE_PYTHON
+	# opencv_core dependency is already enabled
+	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV_LIB_CONTRIB
+	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV_LIB_FLANN
+	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_LEGACY
+	select BR2_PACKAGE_OPENCV_LIB_ML
+	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
+	select BR2_PACKAGE_OPENCV_LIB_PHOTO
+	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
 	  Include opencv_python module into the OpenCV build.
 	  No python example is installed.
 
 config BR2_PACKAGE_OPENCV_LIB_STITCHING
 	bool "stitching"
-	default y
+	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 	help
 	  Include opencv_stitching module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_SUPERRES
 	bool "superres"
-	default y
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
 	  Include opencv_superres "super resolution" - module into the OpenCV
 	  build.
 
 config BR2_PACKAGE_OPENCV_LIB_TS
 	bool "ts (touchscreen)"
-	default y
+	# opencv_core dependency is already enabled
+	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	help
 	  Include opencv_ts module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_VIDEO
 	bool "video"
-	default y
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_video module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB
 	bool "videostab"
-	default y
+	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_PHOTO
+	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
 	  Include opencv_videostab module into the OpenCV build.
 
-- 
2.1.0
