From: Matthew Fornero <mfornero@mathworks.com>
Date: Fri, 20 May 2016 13:36:31 -0400
Subject: [Buildroot] [PATCH RESEND] libiio: Bump version to 0.6
In-Reply-To: <1460655035-24870-1-git-send-email-mfornero@mathworks.com>
References: <1460655035-24870-1-git-send-email-mfornero@mathworks.com>
Message-ID: <1463765791-308-1-git-send-email-mfornero@mathworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v0.6 API offers some major additions, including:
* iio_device_set_kernel_buffers_counts
* iio_buffer_get_poll_fd
* iio_bufer_set_blocking_mode
* iio_buffer_push_partial

Signed-off-by: Matthew Fornero <mfornero@mathworks.com>
---
 ...l2-detection-try-first-the-CMake-module-f.patch |   57 ++++++++++----------
 ...ake-fix-build-on-unix-systems-without-cpp.patch |   36 -------------
 package/libiio/libiio.hash                         |    4 +-
 package/libiio/libiio.mk                           |    2 +-
 4 files changed, 32 insertions(+), 67 deletions(-)
 delete mode 100644 package/libiio/0002-cmake-fix-build-on-unix-systems-without-cpp.patch

diff --git a/package/libiio/0001-cmake-libxml2-detection-try-first-the-CMake-module-f.patch b/package/libiio/0001-cmake-libxml2-detection-try-first-the-CMake-module-f.patch
index 9f44169..17fbdab 100644
--- a/package/libiio/0001-cmake-libxml2-detection-try-first-the-CMake-module-f.patch
+++ b/package/libiio/0001-cmake-libxml2-detection-try-first-the-CMake-module-f.patch
@@ -1,42 +1,43 @@
-From 4f849e1d2287206cfb7ff0fdeca96c22383b0d53 Mon Sep 17 00:00:00 2001
+From b613e0fe7999cfff9efb646eb388ea1e58952e30 Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
-Date: Mon, 29 Dec 2014 19:05:13 +0100
-Subject: [PATCH] cmake: libxml2 detection: try first the CMake module from
- libxml2
+Date: Thu, 14 Apr 2016 12:59:27 -0400
+Subject: [PATCH] cmake: libxml2 detection: try CMake module from libxml2
 
 Libxml2 >=2.9.2 provides its own CMake module, so check for it before
 falling back on the CMake's module FindLibXml2.cmake.
 
+Updated for v0.6 by: Matt Fornero <matt.fornero@mathworks.com>
+
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+Signed-off-by: Matt Fornero <matt.fornero@mathworks.com>
 ---
- CMakeLists.txt | 14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
+ CMakeLists.txt |   13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 393fee3..b4f1d26 100644
+index 70f61f0..4a4209b 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -38,7 +38,19 @@ endif()
- find_library(AVAHI_CLIENT_LIBRARIES avahi-client)
- find_library(AVAHI_COMMON_LIBRARIES avahi-common)
- find_library(PTHREAD_LIBRARIES pthread)
--include(FindLibXml2)
-+
-+# Since libxml2-2.9.2, libxml2 provides its own LibXml2-config.cmake, with all
-+# variables correctly set.
-+# So, try first to find the CMake module provided by libxml2 package, then fallback
-+# on the CMake's FindLibXml2.cmake module (which can lack some definition, especially
-+# in static build case).
-+find_package(LibXml2 QUIET NO_MODULE)
-+if(DEFINED LIBXML2_VERSION_STRING)
-+  set(LIBXML2_FOUND ON)
-+  set(LIBXML2_INCLUDE_DIR ${LIBXML2_INCLUDE_DIRS})
-+else()
-+  include(FindLibXml2)
-+endif()
+@@ -143,7 +143,18 @@ if(WITH_NETWORK_BACKEND)
+ endif()
+ 
+ if (NEED_LIBXML2)
+-	include(FindLibXml2)
++	# Since libxml2-2.9.2, libxml2 provides its own LibXml2-config.cmake, with all
++	# variables correctly set.
++	# So, try first to find the CMake module provided by libxml2 package, then fallback
++	# on the CMake's FindLibXml2.cmake module (which can lack some definition, especially
++	# in static build case).
++	find_package(LibXml2 QUIET NO_MODULE)
++	if(DEFINED LIBXML2_VERSION_STRING)
++		set(LIBXML2_FOUND ON)
++		set(LIBXML2_INCLUDE_DIR ${LIBXML2_INCLUDE_DIRS})
++	else()
++		include(FindLibXml2)
++	endif()
  
- set(LIBIIO_CFILES channel.c device.c context.c buffer.c utilities.c)
- set(LIBIIO_HEADERS iio.h)
+ 	if (NOT LIBXML2_FOUND)
+ 		message(SEND_ERROR "The selected backends require libxml2 to be installed")
 -- 
-2.2.1
+1.7.10.4
 
diff --git a/package/libiio/0002-cmake-fix-build-on-unix-systems-without-cpp.patch b/package/libiio/0002-cmake-fix-build-on-unix-systems-without-cpp.patch
deleted file mode 100644
index 4839a39..0000000
--- a/package/libiio/0002-cmake-fix-build-on-unix-systems-without-cpp.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 2e6fa357ffbe755bfecaecad4fc82e3307fe2831 Mon Sep 17 00:00:00 2001
-From: Paul Cercueil <paul.cercueil@analog.com>
-Date: Wed, 22 Jul 2015 10:25:01 +0200
-Subject: [PATCH] CMake: Fix build on UNIX systems without a C++ compiler
-
-Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
----
- bindings/csharp/CMakeLists.txt | 2 +-
- bindings/python/CMakeLists.txt | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/bindings/csharp/CMakeLists.txt b/bindings/csharp/CMakeLists.txt
-index 8aafb8f..fceab88 100644
---- a/bindings/csharp/CMakeLists.txt
-+++ b/bindings/csharp/CMakeLists.txt
-@@ -1,5 +1,5 @@
- cmake_minimum_required(VERSION 2.8.7)
--project(libiio-sharp)
-+project(libiio-sharp LANGUAGES NONE)
- 
- find_program(MCS_EXECUTABLE
- 	NAMES mcs csc
-diff --git a/bindings/python/CMakeLists.txt b/bindings/python/CMakeLists.txt
-index 22ffdb4..76ceae8 100644
---- a/bindings/python/CMakeLists.txt
-+++ b/bindings/python/CMakeLists.txt
-@@ -1,5 +1,5 @@
- cmake_minimum_required(VERSION 2.8.7)
--project(libiio-py)
-+project(libiio-py LANGUAGES NONE)
- 
- include(FindPythonInterp)
- 
--- 
-2.1.4
-
diff --git a/package/libiio/libiio.hash b/package/libiio/libiio.hash
index 28b9c63..da42c21 100644
--- a/package/libiio/libiio.hash
+++ b/package/libiio/libiio.hash
@@ -1,2 +1,2 @@
-# From https://github.com/analogdevicesinc/libiio/archive/v0.5/
-sha256	c41cdcfeae8717e72f1100b4dac9d7cc9d86f4e0731da3354149cb7e051666f3	libiio-0.5.tar.gz
+# From https://github.com/analogdevicesinc/libiio/archive/v0.6/
+sha256  efd3b4ebdba01dd2bfbdce8e222356b4fec2b96daab14f99691b5c1c9089e466    libiio-0.6.tar.gz
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 0e92b73..e5edb5c 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIIO_VERSION = 0.5
+LIBIIO_VERSION = 0.6
 LIBIIO_SITE = $(call github,analogdevicesinc,libiio,v$(LIBIIO_VERSION))
 LIBIIO_INSTALL_STAGING = YES
 LIBIIO_LICENSE = LGPLv2.1+
-- 
1.7.10.4
