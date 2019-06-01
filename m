From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  1 Jun 2019 12:20:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv: fix build due to gcc bug
 68485
Message-ID: <20190601102032.28968-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version <= 9.x the build fails due to gcc bug 68485:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. The bug show up when
building opencv with optimization but not when building with -O0. To
work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_68458=y, we force using
-O0.

Fixes:
 - http://autobuild.buildroot.org/results/17fff0f312ebd520ba3341976ba56fd8c85ee376

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv/opencv.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index ccc2d820da..4c15075fe0 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -10,6 +10,7 @@ OPENCV_INSTALL_STAGING = YES
 OPENCV_LICENSE = BSD-3-Clause
 OPENCV_LICENSE_FILES = LICENSE
 OPENCV_SUPPORTS_IN_SOURCE_BUILD = NO
+OPENCV_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 # OpenCV component options
 OPENCV_CONF_OPTS += \
@@ -166,6 +167,10 @@ OPENCV_CONF_OPTS += \
 
 OPENCV_DEPENDENCIES += zlib
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+OPENCV_CXXFLAGS += -O0
+endif
+
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_FFMPEG),y)
 OPENCV_CONF_OPTS += -DWITH_FFMPEG=ON
 OPENCV_DEPENDENCIES += ffmpeg bzip2
@@ -195,8 +200,8 @@ OPENCV_CONF_OPTS += -DWITH_GTK=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_JASPER),y)
-OPENCV_CONF_OPTS += -DWITH_JASPER=ON \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -D__STDC_LIMIT_MACROS"
+OPENCV_CONF_OPTS += -DWITH_JASPER=ON
+OPENCV_CXXFLAGS += -D__STDC_LIMIT_MACROS
 OPENCV_DEPENDENCIES += jasper
 else
 OPENCV_CONF_OPTS += -DWITH_JASPER=OFF
@@ -232,6 +237,8 @@ else
 OPENCV_CONF_OPTS += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
 endif
 
+OPENCV_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(OPENCV_CXXFLAGS)"
+
 # Installation hooks:
 define OPENCV_CLEAN_INSTALL_DOC
 	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/doc
-- 
2.20.1
