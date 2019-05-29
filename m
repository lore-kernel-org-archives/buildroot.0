From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 29 May 2019 19:29:31 +0200
Subject: [Buildroot] [PATCH 1/2] package/snappy: add snappy.pc
Message-ID: <20190529172932.3753-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../snappy/0001-Readd-pkgconfig-support.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/snappy/0001-Readd-pkgconfig-support.patch

diff --git a/package/snappy/0001-Readd-pkgconfig-support.patch b/package/snappy/0001-Readd-pkgconfig-support.patch
new file mode 100644
index 0000000000..f27df9c8e8
--- /dev/null
+++ b/package/snappy/0001-Readd-pkgconfig-support.patch
@@ -0,0 +1,56 @@
+From e2c4ae93c6f57a80a71bdcff309006efccd30f42 Mon Sep 17 00:00:00 2001
+From: Niclas Rosenvik <youremailsarecrap@gmail.com>
+Date: Fri, 4 Aug 2017 12:33:18 +0200
+Subject: [PATCH] Readd pkgconfig support.
+
+Readd pkgconfig support to support usage of snappy with other build systems.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved (and updated to add Libs.private) from:
+https://github.com/google/snappy/pull/51/commits/e2c4ae93c6f57a80a71bdcff309006efccd30f42]
+---
+ CMakeLists.txt     |  6 ++++++
+ cmake/snappy.pc.in | 10 ++++++++++
+ 2 files changed, 16 insertions(+)
+ create mode 100644 cmake/snappy.pc.in
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e9e70c8..7a8dab4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -54,6 +54,11 @@ configure_file(
+   "${PROJECT_SOURCE_DIR}/cmake/config.h.in"
+   "${PROJECT_BINARY_DIR}/config.h"
+ )
++configure_file(
++  "${PROJECT_SOURCE_DIR}/cmake/snappy.pc.in"
++  "${PROJECT_BINARY_DIR}/snappy.pc"
++  @ONLY
++)
+ 
+ # We don't want to define HAVE_ macros in public headers. Instead, we use
+ # CMake's variable substitution with 0/1 variables, which will be seen by the
+@@ -165,3 +170,4 @@ install(
+     "${PROJECT_BINARY_DIR}/SnappyConfigVersion.cmake"
+   DESTINATION lib/cmake/Snappy
+ )
++install(FILES "${PROJECT_BINARY_DIR}/snappy.pc" DESTINATION lib/pkgconfig)
+\ No newline at end of file
+diff --git a/cmake/snappy.pc.in b/cmake/snappy.pc.in
+new file mode 100644
+index 0000000..6c43545
+--- /dev/null
++++ b/cmake/snappy.pc.in
+@@ -0,0 +1,10 @@
++prefix=@CMAKE_INSTALL_PREFIX@
++exec_prefix=${prefix}
++libdir=${exec_prefix}/lib
++includedir=${prefix}/include
++
++Name: @PROJECT_NAME@
++Description: A fast compression/decompression library
++Version: @PROJECT_VERSION@
++Libs: -L${libdir} -lsnappy
++Libs.private: -lstdc++
++Cflags: -I${includedir}
+\ No newline at end of file
-- 
2.20.1
