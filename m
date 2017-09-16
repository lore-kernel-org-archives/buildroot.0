From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Sep 2017 15:33:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv: bump version to 2.4.13.3
Message-ID: <20170916133334.24964-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patches applied upstream:

0002-avoid-sysctl_h.patch
https://github.com/opencv/opencv/commit/61936eb1a43e732e4bc1c75b63e6cab85c6f9e94

0004-fix-static-linking.patch
https://github.com/opencv/opencv/commit/70489b1e2232ead1701519e35d151670b74c3f70

In-source-builds are not allowed anymore:
https://github.com/opencv/opencv/commit/777a0080cbdb98761853519b3f45136727a855c2

Re-numbered remaining patches.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...xt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch} |  0
 package/opencv/0002-avoid-sysctl_h.patch           | 61 ----------------------
 package/opencv/0004-fix-static-linking.patch       | 45 ----------------
 package/opencv/opencv.hash                         |  2 +-
 package/opencv/opencv.mk                           |  3 +-
 5 files changed, 3 insertions(+), 108 deletions(-)
 rename package/opencv/{0003-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch => 0002-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch} (100%)
 delete mode 100644 package/opencv/0002-avoid-sysctl_h.patch
 delete mode 100644 package/opencv/0004-fix-static-linking.patch

diff --git a/package/opencv/0003-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch b/package/opencv/0002-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch
similarity index 100%
rename from package/opencv/0003-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch
rename to package/opencv/0002-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch
diff --git a/package/opencv/0002-avoid-sysctl_h.patch b/package/opencv/0002-avoid-sysctl_h.patch
deleted file mode 100644
index b63ba55ac1..0000000000
--- a/package/opencv/0002-avoid-sysctl_h.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From e5e71c31d54562f9c67a8226f0bfc08ad24b81cf Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Tue, 1 Nov 2016 09:30:23 +0100
-Subject: [PATCH 2/4] From upstream master branch:
- https://github.com/Itseez/opencv/blob/master/modules/core/src/
-
-Do not include sysctl.h targeting Linux systems.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-[Samuel Martin: convert patch to git diff, add cap_ffmpeg_impl.hpp fix]
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- modules/core/src/parallel.cpp           | 2 +-
- modules/core/src/system.cpp             | 2 +-
- modules/highgui/src/cap_ffmpeg_impl.hpp | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/modules/core/src/parallel.cpp b/modules/core/src/parallel.cpp
-index 4459a24..0374876 100644
---- a/modules/core/src/parallel.cpp
-+++ b/modules/core/src/parallel.cpp
-@@ -56,7 +56,7 @@
-     #include <sys/types.h>
-     #if defined ANDROID
-         #include <sys/sysconf.h>
--    #else
-+    #elif defined __APPLE__
-         #include <sys/sysctl.h>
-     #endif
- #endif
-diff --git a/modules/core/src/system.cpp b/modules/core/src/system.cpp
-index 9a7b262..731f090 100644
---- a/modules/core/src/system.cpp
-+++ b/modules/core/src/system.cpp
-@@ -163,7 +163,7 @@ std::wstring GetTempFileNameWinRT(std::wstring prefix)
- #include <sys/types.h>
- #if defined ANDROID
- #include <sys/sysconf.h>
--#else
-+#elif defined __APPLE__
- #include <sys/sysctl.h>
- #endif
- #endif
-diff --git a/modules/highgui/src/cap_ffmpeg_impl.hpp b/modules/highgui/src/cap_ffmpeg_impl.hpp
-index dc3e10d..23674ff 100644
---- a/modules/highgui/src/cap_ffmpeg_impl.hpp
-+++ b/modules/highgui/src/cap_ffmpeg_impl.hpp
-@@ -126,9 +126,9 @@ extern "C" {
-     #include <unistd.h>
-     #include <stdio.h>
-     #include <sys/types.h>
--    #include <sys/sysctl.h>
-     #include <sys/time.h>
- #if defined __APPLE__
-+    #include <sys/sysctl.h>
-     #include <mach/clock.h>
-     #include <mach/mach.h>
- #endif
--- 
-2.10.2
-
diff --git a/package/opencv/0004-fix-static-linking.patch b/package/opencv/0004-fix-static-linking.patch
deleted file mode 100644
index 5851e8d926..0000000000
--- a/package/opencv/0004-fix-static-linking.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 70489b1e2232ead1701519e35d151670b74c3f70 Mon Sep 17 00:00:00 2001
-From: Alexander Alekhin <alexander.alekhin@intel.com>
-Date: Thu, 22 Jun 2017 19:34:50 +0300
-Subject: [PATCH] cmake: fix libname for pkg-config configuration
-
-Downloaded from upstream PR 8970.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- cmake/OpenCVGenPkgconfig.cmake | 4 ++--
- cmake/OpenCVUtils.cmake        | 6 ++++++
- 2 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/cmake/OpenCVGenPkgconfig.cmake b/cmake/OpenCVGenPkgconfig.cmake
-index 4c46e66f494..c3a6b458fa2 100644
---- a/cmake/OpenCVGenPkgconfig.cmake
-+++ b/cmake/OpenCVGenPkgconfig.cmake
-@@ -74,8 +74,8 @@ if(OpenCV_EXTRA_COMPONENTS)
-       list(APPEND OpenCV_LIB_COMPONENTS_ "${extra_component}")
-     elseif(extra_component MATCHES "[\\/]")
-       get_filename_component(libdir "${extra_component}" PATH)
--      get_filename_component(libname "${extra_component}" NAME_WE)
--      string(REGEX REPLACE "^lib" "" libname "${libname}")
-+      get_filename_component(libname "${extra_component}" NAME)
-+      ocv_get_libname(libname "${libname}")
-       list(APPEND OpenCV_LIB_COMPONENTS_ "-L${libdir}" "-l${libname}")
-     else()
-       list(APPEND OpenCV_LIB_COMPONENTS_ "-l${extra_component}")
-diff --git a/cmake/OpenCVUtils.cmake b/cmake/OpenCVUtils.cmake
-index 55a7acdaaf6..6be808c2edc 100644
---- a/cmake/OpenCVUtils.cmake
-+++ b/cmake/OpenCVUtils.cmake
-@@ -749,6 +749,12 @@ function(ocv_source_group group)
-   source_group(${group} FILES ${srcs})
- endfunction()
- 
-+macro(ocv_get_libname var_name)
-+  get_filename_component(__libname "${ARGN}" NAME)
-+  string(REGEX REPLACE "^lib(.+).(a|so)(.[.0-9]+)?$" "\\1" __libname "${__libname}")
-+  set(${var_name} "${__libname}")
-+endmacro()
-+
- # build the list of simple dependencies, that links via "-l"
- #  _all_libs - name of variable with input list
- #  _simple - name of variable with output list of simple libs
diff --git a/package/opencv/opencv.hash b/package/opencv/opencv.hash
index 2c1842bd56..85a3e0b8f4 100644
--- a/package/opencv/opencv.hash
+++ b/package/opencv/opencv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 4b00c110e6c54943cbbb7cf0d35c5bc148133ab2095ee4aaa0ac0a4f67c58080  opencv-2.4.13.2.tar.gz
+sha256 fb4769d0119c35426c3754b7fb079b407911e863958db53bdec83c7794582e41  opencv-2.4.13.3.tar.gz
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index b5b1253f92..d170aec58f 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-OPENCV_VERSION = 2.4.13.2
+OPENCV_VERSION = 2.4.13.3
 OPENCV_SITE = $(call github,itseez,opencv,$(OPENCV_VERSION))
 OPENCV_INSTALL_STAGING = YES
 OPENCV_LICENSE = BSD-3-Clause
 OPENCV_LICENSE_FILES = LICENSE
+OPENCV_SUPPORTS_IN_SOURCE_BUILD = NO
 
 # OpenCV component options
 OPENCV_CONF_OPTS += \
-- 
2.11.0
