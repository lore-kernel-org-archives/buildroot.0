From: Bradford Barr <bradford@density.io>
Date: Thu, 28 Sep 2017 19:50:43 -0400
Subject: [Buildroot] [PATCH v2 2/2] opencv3: add support for tbb
In-Reply-To: <20170928235043.31891-1-bradford@density.io>
References: <20170928235043.31891-1-bradford@density.io>
Message-ID: <20170928235043.31891-3-bradford@density.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: bradford barr <bradford@density.io>

This patchset adds support for tbb optimizations in opencv3.

Signed-off-by: bradford barr <bradford@density.io>
---
 package/opencv3/0001-tbb-debug.patch | 27 +++++++++++++++++++++++++++
 package/opencv3/Config.in            |  6 ++++++
 package/opencv3/opencv3.mk           | 12 ++++++++++--
 3 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 package/opencv3/0001-tbb-debug.patch

diff --git a/package/opencv3/0001-tbb-debug.patch b/package/opencv3/0001-tbb-debug.patch
new file mode 100644
index 0000000..808483d
--- /dev/null
+++ b/package/opencv3/0001-tbb-debug.patch
@@ -0,0 +1,27 @@
+From a56d7592f0f2f63a84e2159171a784026cc99986 Mon Sep 17 00:00:00 2001
+From: bradford barr <bradford@density.io>
+Date: Thu, 28 Sep 2017 17:31:41 -0400
+Subject: [PATCH] TBB Debug Release
+
+OpenCV fails to detect tbb on a debug build if the platform has only installed
+debug libraries.  This PR adds an additional check to the tbb detect logic for
+systems that only install tbb debug and not both tbb debug and release.
+
+Signed-off-by: bradford barr <bradford@density.io>
+---
+ cmake/OpenCVDetectTBB.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/OpenCVDetectTBB.cmake b/cmake/OpenCVDetectTBB.cmake
+index 426487a88cc..9417a53dd98 100644
+--- a/cmake/OpenCVDetectTBB.cmake
++++ b/cmake/OpenCVDetectTBB.cmake
+@@ -45,7 +45,7 @@ function(ocv_tbb_env_guess _found)
+   find_library(TBB_ENV_LIB NAMES "tbb")
+   find_library(TBB_ENV_LIB_DEBUG NAMES "tbb_debug" PATHS ENV LIBRARY_PATH ENV LD_LIBRARY_PATH NO_DEFAULT_PATH)
+   find_library(TBB_ENV_LIB_DEBUG NAMES "tbb_debug")
+-  if (TBB_ENV_INCLUDE AND TBB_ENV_LIB)
++  if (TBB_ENV_INCLUDE AND (TBB_ENV_LIB OR TBB_ENV_LIB_DEBUG))
+     ocv_tbb_verify()
+     ocv_tbb_read_version("${TBB_ENV_INCLUDE}")
+     add_library(tbb UNKNOWN IMPORTED)
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 2214ee8..07613e8 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -307,6 +307,12 @@ config BR2_PACKAGE_OPENCV3_WITH_PNG
 	help
 	  Use shared libpng from the target system.
 
+config BR2_PACKAGE_OPENCV3_WITH_TBB
+	bool "tbb support"
+	select BR2_PACKAGE_TBB
+	help
+	  Use build libtbb from OpenCV3.
+
 config BR2_PACKAGE_OPENCV3_WITH_TIFF
 	bool "tiff support"
 	select BR2_PACKAGE_TIFF
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 3a7c3f4..1b3de46 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -133,8 +133,7 @@ OPENCV3_CONF_OPTS += \
 	-DBUILD_WITH_DYNAMIC_IPP=OFF \
 	-DWITH_INTELPERC=OFF \
 	-DWITH_IPP=OFF \
-	-DWITH_IPP_A=OFF \
-	-DWITH_TBB=OFF
+	-DWITH_IPP_A=OFF
 
 # Smartek stuff
 OPENCV3_CONF_OPTS += -DWITH_GIGEAPI=OFF
@@ -288,6 +287,15 @@ OPENCV3_CONF_OPTS += -DWITH_QT=5
 OPENCV3_DEPENDENCIES += qt5base
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_TBB),y)
+OPENCV3_CONF_OPTS += \
+	-DWITH_TBB=ON \
+	-DTBB_ENV_INCLUDE=$(STAGING_DIR)/usr/include/tbb
+OPENCV3_DEPENDENCIES += tbb
+else
+OPENCV3_CONF_OPTS += -DWITH_TBB=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_TIFF),y)
 OPENCV3_CONF_OPTS += -DWITH_TIFF=ON
 OPENCV3_DEPENDENCIES += tiff
-- 
2.9.3
