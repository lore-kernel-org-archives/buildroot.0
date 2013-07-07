From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  7 Jul 2013 20:44:55 +0200
Subject: [Buildroot] [PATCH 3/3] opencv: bump version to 2.4.6
In-Reply-To: <1373222695-9148-1-git-send-email-s.martin49@gmail.com>
References: <1373222695-9148-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1373222695-9148-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also:
- add license details;
- add new modules option;
- explicitly disable python support to avoid being confuse by the one from the
  host;
- update qt support (now handle qt4/qt5)

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/opencv/Config.in | 34 ++++++++++++++++++++++++++--------
 package/opencv/opencv.mk | 18 +++++++++++++-----
 2 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 26bf5e7..553a0a5 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -97,6 +97,13 @@ config BR2_PACKAGE_OPENCV_LIB_STITCHING
 	help
 	  Include opencv_stitching module into the OpenCV build.
 
+config BR2_PACKAGE_OPENCV_LIB_SUPERRES
+	bool "superres"
+	default y
+	help
+	  Include opencv_superres "super resolution" - module into the OpenCV
+	  build.
+
 config BR2_PACKAGE_OPENCV_LIB_TS
 	bool "ts (touchscreen)"
 	default y
@@ -164,15 +171,26 @@ config BR2_PACKAGE_OPENCV_WITH_PNG
 	help
 	  Use shared libpng from the target system.
 
+if BR2_INSTALL_LIBSTDCPP && (!BR2_avr32 || (BR2_USE_WCHAR && BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS)) # qt{4,5} dependencies
+
+if !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
+comment "Qt support not available."
+comment "Enable one of the Qt libraries before enabling Qt support in OpenCV"
+endif
+
 config BR2_PACKAGE_OPENCV_WITH_QT
-	bool "qt backend support"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_avr32 # qt
-	select BR2_PACKAGE_QT
-	select BR2_PACKAGE_QT_STL
-	default y
-	help
-	  Use Qt with STL support
+	bool "Qt support"
+	#prompt "Qt4 support" if BR2_PACKAGE_QT
+	#prompt "Qt5 support" if BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT_STL             if BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT5BASE            if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_TEST       if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_GUI        if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_WIDGETS    if BR2_PACKAGE_QT5
+
+endif # qt{4,5} dependencies
 
 config BR2_PACKAGE_OPENCV_WITH_TIFF
 	bool "tiff support"
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index b9ed8cb..aa64c33 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-OPENCV_VERSION = 2.4.2
+OPENCV_VERSION = 2.4.6
 OPENCV_SITE    = http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_VERSION)
-OPENCV_SOURCE  = OpenCV-$(OPENCV_VERSION).tar.bz2
 OPENCV_INSTALL_STAGING = YES
+OPENCV_LICENSE = BSD-3c
+OPENCV_LICENSE_FILES = doc/license.txt
 
+OPENCV_CONF_ENV = PATH="$(TARGET_PATH)"
 OPENCV_CONF_OPT += \
 	-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release)   \
 	-DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON)    \
@@ -47,13 +49,19 @@ OPENCV_CONF_OPT += \
 	-DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_LIB_NONFREE),ON,OFF)   \
 	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
 	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF)       \
-	-DBUILD_opencv_python=OFF                                               \
 	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
+	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
 	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF)             \
 	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF)       \
 	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB),ON,OFF) \
 	-DBUILD_opencv_world=OFF
 
+# Explicitly disable python to avoid confusing OpenCV, which comes with its
+# own implementation of the Python detection CMake module.
+OPENCV_CONF_OPT += \
+	-DBUILD_opencv_python=OFF \
+	-DPYTHON_EXECUTABLE=OFF
+
 # Hardware support options.
 #
 # * PowerPC support is turned off since its only effect is altering CFLAGS,
@@ -141,8 +149,8 @@ OPENCV_CONF_OPT += -DWITH_PNG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
-OPENCV_CONF_OPT += -DWITH_QT=ON
-OPENCV_DEPENDENCIES += qt
+OPENCV_CONF_OPT += -DWITH_QT=$(if $(BR2_PACKAGE_QT),4,5)
+OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_QT),qt,qt5base)
 else
 OPENCV_CONF_OPT += -DWITH_QT=OFF
 endif
-- 
1.8.3.2
