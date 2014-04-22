From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 23 Apr 2014 01:15:39 +0200
Subject: [Buildroot] [PATCH v2 07/24] opencv: bump to version 2.4.8
In-Reply-To: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398208556-4195-8-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps OpenCV version and address the minimal set of change to
get the new version building correctly:
- update the download location;
- force Qt version to Qt 4 when support is enabled;
- naively fix the v4l support.

However, it does not address a couple improvements, among these:
- jasper support;
- python/numpy support;
- Qt4 and Qt5 support (since the 2.4.6 release), so only Qt4 support is
  supported in this patch;
- optional libv4l dependency (since 2.4.7 release);
- etc.
These will be addressed in followup patches.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- rebase
- use github *.tar.gz source location
- split the big patch in several atomic ones (Yann)
---
 package/opencv/Config.in |  2 +-
 package/opencv/opencv.mk | 11 +++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 49ada5d..2c6200c 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -8,7 +8,7 @@ menuconfig BR2_PACKAGE_OPENCV
 	  OpenCV (Open Source Computer Vision) is a library of programming
 	  functions for real time computer vision.
 
-	  http://opencv.willowgarage.com/wiki/
+	  http://opencv.org/
 
 if BR2_PACKAGE_OPENCV
 
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 42f9b0a..10f11cf 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-OPENCV_VERSION = 2.4.2
-OPENCV_SITE    = http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_VERSION)
-OPENCV_SOURCE  = OpenCV-$(OPENCV_VERSION).tar.bz2
+OPENCV_VERSION = 2.4.8
+OPENCV_SITE = $(call github,itseez,opencv,$(OPENCV_VERSION))
 OPENCV_INSTALL_STAGING = YES
 
 OPENCV_CONF_OPT += \
@@ -140,7 +139,7 @@ OPENCV_CONF_OPT += -DWITH_PNG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
-OPENCV_CONF_OPT += -DWITH_QT=ON
+OPENCV_CONF_OPT += -DWITH_QT=4
 OPENCV_DEPENDENCIES += qt
 else
 OPENCV_CONF_OPT += -DWITH_QT=OFF
@@ -154,10 +153,10 @@ OPENCV_CONF_OPT += -DWITH_TIFF=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_V4L),y)
-OPENCV_CONF_OPT += -DWITH_V4L=ON
+OPENCV_CONF_OPT += -DWITH_V4L=ON -DWITH_LIBV4L=ON
 OPENCV_DEPENDENCIES += libv4l
 else
-OPENCV_CONF_OPT += -DWITH_V4L=OFF
+OPENCV_CONF_OPT += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
 endif
 
 # Installation hooks:
-- 
1.9.2
