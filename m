From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Sep 2020 23:26:47 +0200
Subject: [Buildroot] [git commit] package/hiredis: fix build without C++
Message-ID: <20200905211859.EBDCD81983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07b90a59276697ae9e0f466741e7b56f58cf5e5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is needed to fix a build failure with hiredis 1.0.0

Fixes:
 - http://autobuild.buildroot.org/results/830ec3398cd29b9fc5cde06a225ef531d7a9d850

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...s.txt-allow-building-without-a-C-compiler.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/hiredis/0002-CMakeLists.txt-allow-building-without-a-C-compiler.patch b/package/hiredis/0002-CMakeLists.txt-allow-building-without-a-C-compiler.patch
new file mode 100644
index 0000000000..08a9ef9854
--- /dev/null
+++ b/package/hiredis/0002-CMakeLists.txt-allow-building-without-a-C-compiler.patch
@@ -0,0 +1,57 @@
+From bb4a8937411a9e6ac2e5c12c0e7eeaa7dab251ba Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 5 Sep 2020 12:54:21 +0200
+Subject: [PATCH] CMakeLists.txt: allow building without a C++ compiler
+
+Define hiredis as a C project (and use a single PROJECT statement) to
+avoid the following build failure if a C++ compiler is not found:
+
+CMake Error at CMakeLists.txt:3 (PROJECT):
+  The CMAKE_CXX_COMPILER:
+
+    /srv/storage/autobuild/run/instance-1/output-1/host/bin/arm-linux-g++
+
+  is not a full path to an existing compiler tool.
+
+  Tell CMake where to find the compiler by setting either the environment
+  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
+  to the compiler, or to the compiler name if it is in the PATH.
+
+The only cpp source file is examples/example-qt.cpp which is never
+compiled with cmake buildsystem. This file is compiled only with the
+Makefile buildsystem so perhaps it should be removed. If it is added to
+the cmake buildsystem, a call to enable_language(CXX) will have to be
+added.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/830ec3398cd29b9fc5cde06a225ef531d7a9d850
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/redis/hiredis/pull/872]
+---
+ CMakeLists.txt | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4cbd438..9d65b7f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,6 +1,5 @@
+ CMAKE_MINIMUM_REQUIRED(VERSION 3.4.0)
+ INCLUDE(GNUInstallDirs)
+-PROJECT(hiredis)
+ 
+ OPTION(ENABLE_SSL "Build hiredis_ssl for SSL support" OFF)
+ OPTION(DISABLE_TESTS "If tests should be compiled or not" OFF)
+@@ -20,7 +19,7 @@ getVersionBit(HIREDIS_SONAME)
+ SET(VERSION "${HIREDIS_MAJOR}.${HIREDIS_MINOR}.${HIREDIS_PATCH}")
+ MESSAGE("Detected version: ${VERSION}")
+ 
+-PROJECT(hiredis VERSION "${VERSION}")
++PROJECT(hiredis LANGUAGES "C" VERSION "${VERSION}")
+ 
+ # Hiredis requires C99
+ SET(CMAKE_C_STANDARD 99)
+-- 
+2.28.0
+
