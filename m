From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  7 Jun 2015 12:26:30 +0200
Subject: [Buildroot] [PATCH v5 04/13] package/opencv: define modules
	inter-dependencies
In-Reply-To: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
References: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1433672799-21387-5-git-send-email-s.martin49@gmail.com>
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
corresponding CMake config option without checking for the modules'
dependencies.

This patch replicates the modules' dependency relations in the
Config.in, so that the selection of the user will actually be built.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v4->v5:
- rebase
- remove Reviewed-by tag form Yann (because of the changes introduced
  with the version bump)

changes v3->v4:
- rebase
- update ts module dependencies

changes v2->v3:
- rebase
- fix typo in commit log (Yann)
- update A/R/T tags

changes v1->v2:
- rebase
---
 package/opencv/Config.in | 53 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 16 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index a3f1f5e..4ab4dc7 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -19,7 +19,8 @@ comment "OpenCV modules"
 
 config BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	bool "calib3d"
-	default y
+	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_calib3d module into the OpenCV build.
 
@@ -27,13 +28,15 @@ config BR2_PACKAGE_OPENCV_LIB_CALIB3D
 
 config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	bool "features2d"
-	default y
+	select BR2_PACKAGE_OPENCV_LIB_FLANN
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_ML
 	help
 	  Include opencv_features2d module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_FLANN
 	bool "flann"
-	default y
+	# opencv_core dependency is already enabled
 	help
 	  Include opencv_flann module into the OpenCV build.
 
@@ -42,37 +45,41 @@ config BR2_PACKAGE_OPENCV_LIB_FLANN
 
 config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	bool "highgui"
-	default y
+	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_VIDEOIO
 	help
 	  Include opencv_highgui module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_IMGCODECS
 	bool "imgcodecs (image codecs)"
-	default y
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_imgcodecs module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	bool "imgproc (image processing)"
-	default y
+	# opencv_core dependency is already enabled
 	help
 	  Include opencv_imgproc module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_ML
 	bool "ml (machine learning)"
-	default y
+	# opencv_core dependency is already enabled
 	help
 	  Include opencv_ml module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 	bool "objdetect"
-	default y
+	# opencv_core dependency is already enabled
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_ML
 	help
 	  Include opencv_objdetect module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_PHOTO
 	bool "photo"
-	default y
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_photo module into the OpenCV build.
 
@@ -80,45 +87,59 @@ comment "opencv_python module requires numpy which is not yet available."
 
 config BR2_PACKAGE_OPENCV_LIB_SHAPE
 	bool "shape (shape descriptors and matchers)"
-	default y
+	# opencv_core dependency is already enabled
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
 	  Include opencv_shape module into the OpenCV build.
 
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
+	# opencv_core dependency is already enabled
 	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
-	default y
+	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_VIDEOIO
 	help
 	  Include opencv_ts module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_VIDEOIO
 	bool "videoio (media i/o)"
-	default y
+	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_videoio module into the OpenCV build.
 
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
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_PHOTO
+	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
 	  Include opencv_videostab module into the OpenCV build.
 
-- 
2.4.2
