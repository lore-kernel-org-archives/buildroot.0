From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Apr 2016 15:03:37 +0200
Subject: [Buildroot] [git commit] package/freeswitch: select OpenCV modules
	needed for mod_cv
Message-ID: <20160422130346.EE55B80301@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01d321f695a7098c862ccba6799b92cdd22d6224
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/ffd/ffd572d7bb68d8ed46ce76b2af824503c587449f/
http://autobuild.buildroot.net/results/e53/e53e356451aa4541a76e26722fd71051896e774b/
http://autobuild.buildroot.net/results/564/5649ff1b50a1eaafbd0e1a329bff87a65ce18da0/
http://autobuild.buildroot.net/results/c60/c60f97c6aafb1a94cb4ce344953598eae8b4a912/
http://autobuild.buildroot.net/results/c1a/c1ac61f9a77635962babdb6bfb31dbecb7f4d439/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-mod_cv-remove-unneeded-includes.patch     | 36 ++++++++++++++++++++++
 package/freeswitch/Config.in                       |  5 +++
 2 files changed, 41 insertions(+)

diff --git a/package/freeswitch/0002-mod_cv-remove-unneeded-includes.patch b/package/freeswitch/0002-mod_cv-remove-unneeded-includes.patch
new file mode 100644
index 0000000..f211363
--- /dev/null
+++ b/package/freeswitch/0002-mod_cv-remove-unneeded-includes.patch
@@ -0,0 +1,36 @@
+From 83774b612a39ae81d1a4c9a4ca14278cd9e674e7 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Thu, 21 Apr 2016 19:10:52 +0200
+Subject: [PATCH 1/1] mod_cv: remove unneeded includes
+
+OpenCV contains various modules which have inter-module dependencies.
+While including freeswitch into buildroot we stumbled over the fact
+that mod_cv.cpp includes more headers than needed[1]. These OpenCV
+headers are generic headers which require more OpenCV modules enabled
+than really used by Freeswitch. The attached fixes the problem.
+
+[1] http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/146662
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Patch sent upstream: https://freeswitch.org/jira/browse/FS-9093]
+---
+ src/mod/applications/mod_cv/mod_cv.cpp | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/mod/applications/mod_cv/mod_cv.cpp b/src/mod/applications/mod_cv/mod_cv.cpp
+index 5183adc..5c10b8d 100644
+--- a/src/mod/applications/mod_cv/mod_cv.cpp
++++ b/src/mod/applications/mod_cv/mod_cv.cpp
+@@ -40,9 +40,6 @@ using namespace cv;
+ 
+ #include <switch.h>
+ 
+-#include <cv.h>
+-#include "cvaux.h"
+-#include "cxmisc.h"
+ #include "highgui.h"
+ #include <stdio.h>
+ #include <stdlib.h>
+-- 
+2.8.0.rc3
+
diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index 602928c..6049af3 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -7,6 +7,11 @@ config BR2_PACKAGE_FREESWITCH
 	depends on BR2_USE_WCHAR # libuuid
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_JPEG
+	# src/mod/applications/mod_cv/mod_cv.cpp includes
+	# highgui.h, imgproc.hpp & objdetect.hpp
+	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI if BR2_PACKAGE_OPENCV
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC if BR2_PACKAGE_OPENCV
+	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT if BR2_PACKAGE_OPENCV
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_SPEEX
