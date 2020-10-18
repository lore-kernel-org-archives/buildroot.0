From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Oct 2020 09:58:42 +0200
Subject: [Buildroot] [git commit] package/freeswitch: add opencv3 optional
 dependency
Message-ID: <20201018075241.5C6388345F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05dd489d77559b341e39e9ff6adb997b847e88e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

opencv3 is an optional dependency since version 1.8.1 and
https://github.com/signalwire/freeswitch/commit/6483ab8b65886465863584e8dcfee57084030b9c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...lications-mod_cv-mod_cv.cpp-fix-build-wit.patch | 44 ++++++++++++++++++++++
 package/freeswitch/Config.in                       |  3 ++
 package/freeswitch/freeswitch.mk                   |  5 +++
 3 files changed, 52 insertions(+)

diff --git a/package/freeswitch/0001-src-mod-applications-mod_cv-mod_cv.cpp-fix-build-wit.patch b/package/freeswitch/0001-src-mod-applications-mod_cv-mod_cv.cpp-fix-build-wit.patch
new file mode 100644
index 0000000000..cd0a3ab4c2
--- /dev/null
+++ b/package/freeswitch/0001-src-mod-applications-mod_cv-mod_cv.cpp-fix-build-wit.patch
@@ -0,0 +1,44 @@
+From 575409a14e62f73e83309daf8ff6642a235f250c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 16 Oct 2020 23:06:36 +0200
+Subject: [PATCH] src/mod/applications/mod_cv/mod_cv.cpp: fix build with opencv
+ 3.4.9
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Use cvScalar instead of CV_RGB to avoid the following build failure with
+opencv 3.4.9:
+
+mod_cv.cpp:693:24: error: conversion from ???cv::Scalar {aka cv::Scalar_<double>}??? to non-scalar type ???CvScalar??? requested
+         CvScalar col = CV_RGB((float)255 * object_neighbors / max_neighbors, 0, 0);
+                        ^
+
+Indeed, CV_RGB is defined as cv::Scalar instead of cvScalar since
+version 3.4.2 and
+https://github.com/opencv/opencv/commit/7f9253ea0a9fe2635926379420002dbf0c3fce0f
+
+It should be noted that CV_RGB(r,g,b) = cvScalar(b,g,r,0)
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/signalwire/freeswitch/pull/914]
+---
+ src/mod/applications/mod_cv/mod_cv.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mod/applications/mod_cv/mod_cv.cpp b/src/mod/applications/mod_cv/mod_cv.cpp
+index 582f925abf..bbec755e91 100644
+--- a/src/mod/applications/mod_cv/mod_cv.cpp
++++ b/src/mod/applications/mod_cv/mod_cv.cpp
+@@ -690,7 +690,7 @@ void detectAndDraw(cv_context_t *context)
+ 		//printf("WTF %d\n", object_neighbors);
+         //cout << "Detected " << object_neighbors << " object neighbors" << endl;
+         const int rect_height = cvRound((float)img.rows * object_neighbors / max_neighbors);
+-        CvScalar col = CV_RGB((float)255 * object_neighbors / max_neighbors, 0, 0);
++        CvScalar col = cvScalar(0, 0, (float)255 * object_neighbors / max_neighbors, 0);
+         rectangle(img, cvPoint(0, img.rows), cvPoint(img.cols/10, img.rows - rect_height), col, -1);
+ 
+         parse_stats(&context->nestDetected, nestedObjects.size(), context->skip);
+-- 
+2.28.0
+
diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index fc8b4bf7e7..a2bb6f4fb0 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -14,6 +14,9 @@ config BR2_PACKAGE_FREESWITCH
 	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI if BR2_PACKAGE_OPENCV
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC if BR2_PACKAGE_OPENCV
 	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT if BR2_PACKAGE_OPENCV
+	select BR2_PACKAGE_OPENCV3_LIB_HIGHGUI if BR2_PACKAGE_OPENCV3
+	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC if BR2_PACKAGE_OPENCV3
+	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT if BR2_PACKAGE_OPENCV3
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_SOFIA_SIP
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index fe10bc1fa1..e4438e5f04 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -279,6 +279,11 @@ FREESWITCH_DEPENDENCIES += opencv
 FREESWITCH_ENABLED_MODULES += applications/mod_cv
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV3),y)
+FREESWITCH_DEPENDENCIES += opencv3
+FREESWITCH_ENABLED_MODULES += applications/mod_cv
+endif
+
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 FREESWITCH_CONF_ENV += \
 	ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
