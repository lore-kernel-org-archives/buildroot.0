From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  5 Feb 2016 22:57:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/mraa: bump version to 0.9.1
Message-ID: <1454709441-31380-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patches applied upstream:
https://github.com/intel-iot-devkit/mraa/commit/86a0e10c037e5c069c48012f169f9e8e2587a0ef
https://github.com/intel-iot-devkit/mraa/commit/a87a104efeb83d4e762992e5be3b8908e6d2bf40
https://github.com/intel-iot-devkit/mraa/commit/7fce2e2a3a3fbbaa2b645d810bde8a50b9c78023

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ake-build-shared-libs-by-default-on-linux.patch | 53 --------------------
 ...keLists.txt-do-not-require-a-CXX-compiler.patch | 57 ----------------------
 .../0003-uart.c-fix-build-with-musl-libc.patch     | 40 ---------------
 package/mraa/mraa.mk                               |  2 +-
 4 files changed, 1 insertion(+), 151 deletions(-)
 delete mode 100644 package/mraa/0001-cmake-build-shared-libs-by-default-on-linux.patch
 delete mode 100644 package/mraa/0002-CMakeLists.txt-do-not-require-a-CXX-compiler.patch
 delete mode 100644 package/mraa/0003-uart.c-fix-build-with-musl-libc.patch

diff --git a/package/mraa/0001-cmake-build-shared-libs-by-default-on-linux.patch b/package/mraa/0001-cmake-build-shared-libs-by-default-on-linux.patch
deleted file mode 100644
index 9f7c95e..0000000
--- a/package/mraa/0001-cmake-build-shared-libs-by-default-on-linux.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Upstream status: Merged
-Fetched from: https://github.com/intel-iot-devkit/mraa/commit/86a0e10c037e5c069c48012f169f9e8e2587a0ef
-
-From 86a0e10c037e5c069c48012f169f9e8e2587a0ef Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Wed, 6 Jan 2016 01:07:10 +0100
-Subject: [PATCH] cmake: build shared libs by default on linux
-
-The change allows to build shared libraries by default on Linux, while
-respecting the requested library build type when the standard CMake flag
-BUILD_SHARED_LIBS is defined.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
----
- CMakeLists.txt     | 7 +++++++
- src/CMakeLists.txt | 2 +-
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9860556..6a189b9 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -10,6 +10,13 @@ set (LIB_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}" CACHE PATH "Installation path for
- # Set CMAKE_LIB_INSTALL_DIR if not defined
- include(GNUInstallDirs)
- 
-+# By default, build shared object libraries on linux
-+if (UNIX AND NOT APPLE)
-+  if (NOT DEFINED BUILD_SHARED_LIBS)
-+    set(BUILD_SHARED_LIBS ON)
-+  endif()
-+endif()
-+
- # Appends the cmake/modules path to MAKE_MODULE_PATH variable.
- set (CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules ${CMAKE_MODULE_PATH})
- 
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index ceb31e4..6698fa4 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -111,7 +111,7 @@ set (mraa_LIB_GLOB_HEADERS
-   ${PROJECT_SOURCE_DIR}/api/mraa.hpp
- )
- 
--add_library (mraa SHARED ${mraa_LIB_SRCS})
-+add_library (mraa ${mraa_LIB_SRCS})
- 
- 
- target_link_libraries (mraa ${mraa_LIBS})
--- 
-1.9.1
-
diff --git a/package/mraa/0002-CMakeLists.txt-do-not-require-a-CXX-compiler.patch b/package/mraa/0002-CMakeLists.txt-do-not-require-a-CXX-compiler.patch
deleted file mode 100644
index a01395b..0000000
--- a/package/mraa/0002-CMakeLists.txt-do-not-require-a-CXX-compiler.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Upstream status: Merged
-Fetched from: https://github.com/intel-iot-devkit/mraa/commit/a87a104efeb83d4e762992e5be3b8908e6d2bf40
-
-From a87a104efeb83d4e762992e5be3b8908e6d2bf40 Mon Sep 17 00:00:00 2001
-From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
-Date: Tue, 5 Jan 2016 19:36:55 +0100
-Subject: [PATCH] CMakeLists.txt: do not require a C++ compiler
-
-By default, CMake assumes both a C and C++ compiler are required.
-This is not needed for mraa because it only provides C++ header
-files. Note that if using SWIG you need one and if using node.js 3+ you'll need
-a C++11 compiler
-
-Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
-Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
----
- CMakeLists.txt              | 2 +-
- examples/c++/CMakeLists.txt | 2 ++
- src/CMakeLists.txt          | 1 +
- 3 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6a189b9..4457efc 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,5 +1,5 @@
- cmake_minimum_required (VERSION 2.8)
--project (mraa)
-+project (mraa C)
- 
- FIND_PACKAGE (Threads REQUIRED)
- 
-diff --git a/examples/c++/CMakeLists.txt b/examples/c++/CMakeLists.txt
-index 69714aa..d688d48 100644
---- a/examples/c++/CMakeLists.txt
-+++ b/examples/c++/CMakeLists.txt
-@@ -1,3 +1,5 @@
-+enable_language(CXX)
-+
- add_executable (AioA0 AioA0.cpp)
- add_executable (blink-io-cpp Blink-IO.cpp)
- add_executable (Pwm3-cycle Pwm3-cycle.cpp)
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 6698fa4..05b546c 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -171,6 +171,7 @@ if (DOXYGEN_FOUND)
- endif ()
- 
- if (BUILDSWIG)
-+  enable_language(CXX)
-   find_package (SWIG)
-   if (SWIG_FOUND)
-     include (${SWIG_USE_FILE})
--- 
-1.9.1
-
diff --git a/package/mraa/0003-uart.c-fix-build-with-musl-libc.patch b/package/mraa/0003-uart.c-fix-build-with-musl-libc.patch
deleted file mode 100644
index 75ceb6f..0000000
--- a/package/mraa/0003-uart.c-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 30e4abcd5f53bac50da874ba8795388fc05f5252 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 31 Jan 2016 08:57:05 +0100
-Subject: [PATCH 1/1] uart.c: fix build with musl libc
-
-musl does not define CMSPAR on all archs, patch inspired by
-http://git.alpinelinux.org/cgit/aports/plain/main/freerdp/musl-fix.patch
-
-musl needs sys/select.h to provide fd_set.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
-Patch sent upstream: https://github.com/intel-iot-devkit/mraa/pull/418
-
- src/uart/uart.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/uart/uart.c b/src/uart/uart.c
-index 6d3973a..0f8a2e3 100644
---- a/src/uart/uart.c
-+++ b/src/uart/uart.c
-@@ -29,10 +29,15 @@
- #include <unistd.h>
- #include <string.h>
- #include <termios.h>
-+#include <sys/select.h>
- 
- #include "uart.h"
- #include "mraa_internal.h"
- 
-+#ifndef CMSPAR
-+#define CMSPAR   010000000000
-+#endif
-+
- // This function takes an unsigned int and converts it to a B* speed_t
- // that can be used with linux/posix termios
- static speed_t
--- 
-2.7.0.rc3
-
diff --git a/package/mraa/mraa.mk b/package/mraa/mraa.mk
index 299beb0..8c7dbc4 100644
--- a/package/mraa/mraa.mk
+++ b/package/mraa/mraa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MRAA_VERSION = v0.9.0
+MRAA_VERSION = v0.9.1
 MRAA_SITE = $(call github,intel-iot-devkit,mraa,$(MRAA_VERSION))
 MRAA_LICENSE = MIT
 MRAA_LICENSE_FILES = COPYING
-- 
2.7.0
