From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 Jun 2017 10:11:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv: fix static linking
Message-ID: <20170625081140.2451-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes ffmpeg static linking
http://autobuild.buildroot.net/results/44d/44d53e4c5d4570507c7e8856fb9dd0a477dcdf63/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/opencv/0004-fix-static-linking.patch | 45 ++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/opencv/0004-fix-static-linking.patch

diff --git a/package/opencv/0004-fix-static-linking.patch b/package/opencv/0004-fix-static-linking.patch
new file mode 100644
index 000000000..5851e8d92
--- /dev/null
+++ b/package/opencv/0004-fix-static-linking.patch
@@ -0,0 +1,45 @@
+From 70489b1e2232ead1701519e35d151670b74c3f70 Mon Sep 17 00:00:00 2001
+From: Alexander Alekhin <alexander.alekhin@intel.com>
+Date: Thu, 22 Jun 2017 19:34:50 +0300
+Subject: [PATCH] cmake: fix libname for pkg-config configuration
+
+Downloaded from upstream PR 8970.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ cmake/OpenCVGenPkgconfig.cmake | 4 ++--
+ cmake/OpenCVUtils.cmake        | 6 ++++++
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/OpenCVGenPkgconfig.cmake b/cmake/OpenCVGenPkgconfig.cmake
+index 4c46e66f494..c3a6b458fa2 100644
+--- a/cmake/OpenCVGenPkgconfig.cmake
++++ b/cmake/OpenCVGenPkgconfig.cmake
+@@ -74,8 +74,8 @@ if(OpenCV_EXTRA_COMPONENTS)
+       list(APPEND OpenCV_LIB_COMPONENTS_ "${extra_component}")
+     elseif(extra_component MATCHES "[\\/]")
+       get_filename_component(libdir "${extra_component}" PATH)
+-      get_filename_component(libname "${extra_component}" NAME_WE)
+-      string(REGEX REPLACE "^lib" "" libname "${libname}")
++      get_filename_component(libname "${extra_component}" NAME)
++      ocv_get_libname(libname "${libname}")
+       list(APPEND OpenCV_LIB_COMPONENTS_ "-L${libdir}" "-l${libname}")
+     else()
+       list(APPEND OpenCV_LIB_COMPONENTS_ "-l${extra_component}")
+diff --git a/cmake/OpenCVUtils.cmake b/cmake/OpenCVUtils.cmake
+index 55a7acdaaf6..6be808c2edc 100644
+--- a/cmake/OpenCVUtils.cmake
++++ b/cmake/OpenCVUtils.cmake
+@@ -749,6 +749,12 @@ function(ocv_source_group group)
+   source_group(${group} FILES ${srcs})
+ endfunction()
+ 
++macro(ocv_get_libname var_name)
++  get_filename_component(__libname "${ARGN}" NAME)
++  string(REGEX REPLACE "^lib(.+).(a|so)(.[.0-9]+)?$" "\\1" __libname "${__libname}")
++  set(${var_name} "${__libname}")
++endmacro()
++
+ # build the list of simple dependencies, that links via "-l"
+ #  _all_libs - name of variable with input list
+ #  _simple - name of variable with output list of simple libs
-- 
2.11.0
