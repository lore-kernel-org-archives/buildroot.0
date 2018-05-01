From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  1 May 2018 22:09:47 +0200
Subject: [Buildroot] [PATCH 1/2] libcue: add patch to fix BR2_STATIC_LIBS=y
 builds
Message-ID: <20180501200948.13115-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.net/results/02712e85db8e538045497e9242b476c040198f1d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...txt-don-t-force-SHARED-when-building-the-.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/libcue/0002-CMakeLists.txt-don-t-force-SHARED-when-building-the-.patch

diff --git a/package/libcue/0002-CMakeLists.txt-don-t-force-SHARED-when-building-the-.patch b/package/libcue/0002-CMakeLists.txt-don-t-force-SHARED-when-building-the-.patch
new file mode 100644
index 0000000000..4071572f21
--- /dev/null
+++ b/package/libcue/0002-CMakeLists.txt-don-t-force-SHARED-when-building-the-.patch
@@ -0,0 +1,41 @@
+From 4d0d29482c2116cfd39a5884061648a6b416cb76 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 1 May 2018 22:04:51 +0200
+Subject: [PATCH] CMakeLists.txt: don't force SHARED when building the library
+
+According to the CMake documentation [1]:
+
+   If no type is given explicitly the type is STATIC or SHARED based
+   on whether the current value of the variable BUILD_SHARED_LIBS is
+   ON.
+
+The CMakeLists.txt currently forces "SHARED", which prevents
+static-only builds from working. By removing this "SHARED" statement,
+we let CMake decide whether a static or shared library should be
+built, depending on the value of the standard variable
+BUILD_SHARED_LIBS.
+
+[1] https://cmake.org/cmake/help/v3.0/command/add_library.html
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream-status: https://github.com/lipnitsk/libcue/pull/18
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1e4ca25..adacc45 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -37,7 +37,7 @@ FLEX_TARGET(CueScanner
+ 	${CMAKE_BINARY_DIR}/cue_scanner.c)
+ ADD_FLEX_BISON_DEPENDENCY(CueScanner CueParser)
+ 
+-ADD_LIBRARY(cue SHARED ${CUE_SOURCES}
++ADD_LIBRARY(cue ${CUE_SOURCES}
+ 	${BISON_CueParser_OUTPUTS}
+ 	${FLEX_CueScanner_OUTPUTS})
+ 
+-- 
+2.14.3
+
-- 
2.14.3
