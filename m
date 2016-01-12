From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2016 21:59:00 +0100
Subject: [Buildroot] [git commit] mraa: new package
Message-ID: <20160112205919.BF951826F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f6b5d4cb395bc3d0474a1e3120b649f5d8ca691
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mraa provides a unified interface for IO on Galileo, Edison,
Raspberry Pi and others.

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Tested-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                  |  1 +
 ...ake-build-shared-libs-by-default-on-linux.patch | 53 ++++++++++++++++++++
 ...keLists.txt-do-not-require-a-CXX-compiler.patch | 57 ++++++++++++++++++++++
 package/mraa/Config.in                             | 14 ++++++
 package/mraa/mraa.mk                               | 25 ++++++++++
 5 files changed, 150 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 442021f..06ed4a8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -946,6 +946,7 @@ menu "Hardware handling"
 	source "package/libusb-compat/Config.in"
 	source "package/libv4l/Config.in"
 	source "package/libxkbcommon/Config.in"
+	source "package/mraa/Config.in"
 	source "package/mtdev/Config.in"
 	source "package/ne10/Config.in"
 	source "package/neardal/Config.in"
diff --git a/package/mraa/0001-cmake-build-shared-libs-by-default-on-linux.patch b/package/mraa/0001-cmake-build-shared-libs-by-default-on-linux.patch
new file mode 100644
index 0000000..9f7c95e
--- /dev/null
+++ b/package/mraa/0001-cmake-build-shared-libs-by-default-on-linux.patch
@@ -0,0 +1,53 @@
+Upstream status: Merged
+Fetched from: https://github.com/intel-iot-devkit/mraa/commit/86a0e10c037e5c069c48012f169f9e8e2587a0ef
+
+From 86a0e10c037e5c069c48012f169f9e8e2587a0ef Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Wed, 6 Jan 2016 01:07:10 +0100
+Subject: [PATCH] cmake: build shared libs by default on linux
+
+The change allows to build shared libraries by default on Linux, while
+respecting the requested library build type when the standard CMake flag
+BUILD_SHARED_LIBS is defined.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
+---
+ CMakeLists.txt     | 7 +++++++
+ src/CMakeLists.txt | 2 +-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9860556..6a189b9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -10,6 +10,13 @@ set (LIB_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}" CACHE PATH "Installation path for
+ # Set CMAKE_LIB_INSTALL_DIR if not defined
+ include(GNUInstallDirs)
+ 
++# By default, build shared object libraries on linux
++if (UNIX AND NOT APPLE)
++  if (NOT DEFINED BUILD_SHARED_LIBS)
++    set(BUILD_SHARED_LIBS ON)
++  endif()
++endif()
++
+ # Appends the cmake/modules path to MAKE_MODULE_PATH variable.
+ set (CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules ${CMAKE_MODULE_PATH})
+ 
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index ceb31e4..6698fa4 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -111,7 +111,7 @@ set (mraa_LIB_GLOB_HEADERS
+   ${PROJECT_SOURCE_DIR}/api/mraa.hpp
+ )
+ 
+-add_library (mraa SHARED ${mraa_LIB_SRCS})
++add_library (mraa ${mraa_LIB_SRCS})
+ 
+ 
+ target_link_libraries (mraa ${mraa_LIBS})
+-- 
+1.9.1
+
diff --git a/package/mraa/0002-CMakeLists.txt-do-not-require-a-CXX-compiler.patch b/package/mraa/0002-CMakeLists.txt-do-not-require-a-CXX-compiler.patch
new file mode 100644
index 0000000..a01395b
--- /dev/null
+++ b/package/mraa/0002-CMakeLists.txt-do-not-require-a-CXX-compiler.patch
@@ -0,0 +1,57 @@
+Upstream status: Merged
+Fetched from: https://github.com/intel-iot-devkit/mraa/commit/a87a104efeb83d4e762992e5be3b8908e6d2bf40
+
+From a87a104efeb83d4e762992e5be3b8908e6d2bf40 Mon Sep 17 00:00:00 2001
+From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
+Date: Tue, 5 Jan 2016 19:36:55 +0100
+Subject: [PATCH] CMakeLists.txt: do not require a C++ compiler
+
+By default, CMake assumes both a C and C++ compiler are required.
+This is not needed for mraa because it only provides C++ header
+files. Note that if using SWIG you need one and if using node.js 3+ you'll need
+a C++11 compiler
+
+Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
+Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
+---
+ CMakeLists.txt              | 2 +-
+ examples/c++/CMakeLists.txt | 2 ++
+ src/CMakeLists.txt          | 1 +
+ 3 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6a189b9..4457efc 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ cmake_minimum_required (VERSION 2.8)
+-project (mraa)
++project (mraa C)
+ 
+ FIND_PACKAGE (Threads REQUIRED)
+ 
+diff --git a/examples/c++/CMakeLists.txt b/examples/c++/CMakeLists.txt
+index 69714aa..d688d48 100644
+--- a/examples/c++/CMakeLists.txt
++++ b/examples/c++/CMakeLists.txt
+@@ -1,3 +1,5 @@
++enable_language(CXX)
++
+ add_executable (AioA0 AioA0.cpp)
+ add_executable (blink-io-cpp Blink-IO.cpp)
+ add_executable (Pwm3-cycle Pwm3-cycle.cpp)
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 6698fa4..05b546c 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -171,6 +171,7 @@ if (DOXYGEN_FOUND)
+ endif ()
+ 
+ if (BUILDSWIG)
++  enable_language(CXX)
+   find_package (SWIG)
+   if (SWIG_FOUND)
+     include (${SWIG_USE_FILE})
+-- 
+1.9.1
+
diff --git a/package/mraa/Config.in b/package/mraa/Config.in
new file mode 100644
index 0000000..2e5d3b1
--- /dev/null
+++ b/package/mraa/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_MRAA
+	bool "mraa"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_arm || BR2_i386 || BR2_x86_64
+	help
+	  mraa is a C/C++ library with bindings to javascript & python
+	  to interface with the IO on Galileo, Edison & other platforms,
+	  with a structured and sane API where port names/numbering matches
+	  the board that you are on.
+
+	  http://iotdk.intel.com/docs/master/mraa
+
+comment "mraa needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mraa/mraa.mk b/package/mraa/mraa.mk
new file mode 100644
index 0000000..299beb0
--- /dev/null
+++ b/package/mraa/mraa.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# mraa
+#
+################################################################################
+
+MRAA_VERSION = v0.9.0
+MRAA_SITE = $(call github,intel-iot-devkit,mraa,$(MRAA_VERSION))
+MRAA_LICENSE = MIT
+MRAA_LICENSE_FILES = COPYING
+MRAA_INSTALL_STAGING = YES
+
+# USBPLAT only makes sense with FTDI4222, which requires the ftd2xx library,
+# which doesn't exist in buildroot
+
+MRAA_CONF_OPTS += \
+	-DBUILDSWIG=OFF \
+	-DUSBPLAT=OFF \
+	-DFTDI4222=OFF \
+	-DIPK=OFF \
+	-DRPM=OFF \
+	-DENABLEEXAMPLES=OFF \
+	-DTESTS=OFF
+
+$(eval $(cmake-package))
