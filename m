From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 17:20:52 +0200
Subject: [Buildroot] [git commit] libiio: Bump version to 0.7
Message-ID: <20160705152113.E3CD48222B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00deb6a7c11440766767cc07800661e8067df474
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The two previous patches have been merged upstream, so they have been
deleted here. Another patch (picked from upstream) has been added to fix
the build with thread-less toolchains.

Libiio v0.7 provides two new backends, a USB backend (using libusb-1.0)
and a serial backend (using libserialport).

Additionally, it is now possible to compile libiio with thread-less
toolchains. In that case, thread safety is disabled.

Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...l2-detection-try-first-the-CMake-module-f.patch | 43 ----------------------
 ...t-include-pthread.h-if-NO_THREADS-is-defi.patch | 26 +++++++++++++
 ...IIOD-Link-pthread-with-no-network-backend.patch | 30 ---------------
 package/libiio/Config.in                           | 31 ++++++++++++++--
 package/libiio/libiio.hash                         |  4 +-
 package/libiio/libiio.mk                           | 23 ++++++++++--
 6 files changed, 74 insertions(+), 83 deletions(-)

diff --git a/package/libiio/0001-cmake-libxml2-detection-try-first-the-CMake-module-f.patch b/package/libiio/0001-cmake-libxml2-detection-try-first-the-CMake-module-f.patch
deleted file mode 100644
index 17fbdab..0000000
--- a/package/libiio/0001-cmake-libxml2-detection-try-first-the-CMake-module-f.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From b613e0fe7999cfff9efb646eb388ea1e58952e30 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Thu, 14 Apr 2016 12:59:27 -0400
-Subject: [PATCH] cmake: libxml2 detection: try CMake module from libxml2
-
-Libxml2 >=2.9.2 provides its own CMake module, so check for it before
-falling back on the CMake's module FindLibXml2.cmake.
-
-Updated for v0.6 by: Matt Fornero <matt.fornero@mathworks.com>
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-Signed-off-by: Matt Fornero <matt.fornero@mathworks.com>
----
- CMakeLists.txt |   13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 70f61f0..4a4209b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -143,7 +143,18 @@ if(WITH_NETWORK_BACKEND)
- endif()
- 
- if (NEED_LIBXML2)
--	include(FindLibXml2)
-+	# Since libxml2-2.9.2, libxml2 provides its own LibXml2-config.cmake, with all
-+	# variables correctly set.
-+	# So, try first to find the CMake module provided by libxml2 package, then fallback
-+	# on the CMake's FindLibXml2.cmake module (which can lack some definition, especially
-+	# in static build case).
-+	find_package(LibXml2 QUIET NO_MODULE)
-+	if(DEFINED LIBXML2_VERSION_STRING)
-+		set(LIBXML2_FOUND ON)
-+		set(LIBXML2_INCLUDE_DIR ${LIBXML2_INCLUDE_DIRS})
-+	else()
-+		include(FindLibXml2)
-+	endif()
- 
- 	if (NOT LIBXML2_FOUND)
- 		message(SEND_ERROR "The selected backends require libxml2 to be installed")
--- 
-1.7.10.4
-
diff --git a/package/libiio/0001-lock.c-Don-t-include-pthread.h-if-NO_THREADS-is-defi.patch b/package/libiio/0001-lock.c-Don-t-include-pthread.h-if-NO_THREADS-is-defi.patch
new file mode 100644
index 0000000..fd029cc
--- /dev/null
+++ b/package/libiio/0001-lock.c-Don-t-include-pthread.h-if-NO_THREADS-is-defi.patch
@@ -0,0 +1,26 @@
+From d052d263600549979a6219a59e85af80eeafc6d2 Mon Sep 17 00:00:00 2001
+From: Paul Cercueil <paul.cercueil@analog.com>
+Date: Tue, 5 Jul 2016 12:12:41 +0200
+Subject: [PATCH] lock.c: Don't include <pthread.h> if NO_THREADS is defined
+
+Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
+---
+ lock.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lock.c b/lock.c
+index 39248ab..00eb9d9 100644
+--- a/lock.c
++++ b/lock.c
+@@ -18,7 +18,7 @@
+ 
+ #ifdef _WIN32
+ #include <windows.h>
+-#else
++#elif !defined(NO_THREADS)
+ #include <pthread.h>
+ #endif
+ 
+-- 
+2.8.1
+
diff --git a/package/libiio/0002-IIOD-Link-pthread-with-no-network-backend.patch b/package/libiio/0002-IIOD-Link-pthread-with-no-network-backend.patch
deleted file mode 100644
index df11a49..0000000
--- a/package/libiio/0002-IIOD-Link-pthread-with-no-network-backend.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 8dcb6c3f60123511d77b9fc7e4e22ae710e7d2f4 Mon Sep 17 00:00:00 2001
-From: Matthew Fornero <mfornero@mathworks.com>
-Date: Wed, 8 Jun 2016 20:03:56 -0400
-Subject: [PATCH] IIOD: Link pthread with no network backend
-
-If iiod is built without the network backend, CMake will not link in
-pthreads. Update the CMake configuration to accomodate this case.
-
-Signed-off-by: Matthew Fornero <mfornero@mathworks.com>
----
- CMakeLists.txt |    3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 70f61f0..20fa9f1 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -56,6 +56,9 @@ IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
- 	if (WITH_IIOD AND NOT WITH_LOCAL_BACKEND)
- 		message(SEND_ERROR "IIOD can only be enabled if the local backend is enabled")
- 	endif()
-+	if (WITH_IIOD)
-+		set(NEED_THREADS 1)
-+	endif()
- endif()
- 
- option(ENABLE_IPV6 "Define if you want to enable IPv6 support" ON)
--- 
-1.7.10.4
-
diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 28a43f9..e7a5d18 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBIIO
 	bool "libiio"
-	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND if !BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
+	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND if !BR2_PACKAGE_LIBIIO_XML_BACKEND
 	help
 	  Libiio is a library to ease the development of software
 	  interfacing Linux Industrial I/O (IIO) devices.
@@ -15,17 +15,40 @@ config BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
 	help
 	  Enable the local backend of the library.
 
+config BR2_PACKAGE_LIBIIO_XML_BACKEND
+	bool "XML backend"
+	select BR2_PACKAGE_LIBXML2
+	default y
+	help
+	  Enable the XML backend of the library.
+
 config BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
 	bool "Network backend"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_LIBXML2
+	depends on BR2_PACKAGE_LIBIIO_XML_BACKEND
 	default y
 	help
 	  Enable the network backend of the library.
 
-comment "IIO Network backend needs a toolchain w/ threads"
+config BR2_PACKAGE_LIBIIO_USB_BACKEND
+	bool "USB backend"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # from libusb
+	depends on BR2_PACKAGE_LIBIIO_XML_BACKEND
+	select BR2_PACKAGE_LIBUSB
+	default y
+	help
+	  Enable the USB backend of the library.
+
+comment "The USB backend needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
+config BR2_PACKAGE_LIBIIO_SERIAL_BACKEND
+	bool "Serial backend"
+	depends on BR2_PACKAGE_LIBIIO_XML_BACKEND
+	select BR2_PACKAGE_LIBSERIALPORT
+	default y
+	help
+	  Enable the serial backend of the library.
+
 config BR2_PACKAGE_LIBIIO_IIOD
 	bool "IIO Daemon"
 	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
diff --git a/package/libiio/libiio.hash b/package/libiio/libiio.hash
index da42c21..f15182a 100644
--- a/package/libiio/libiio.hash
+++ b/package/libiio/libiio.hash
@@ -1,2 +1,2 @@
-# From https://github.com/analogdevicesinc/libiio/archive/v0.6/
-sha256  efd3b4ebdba01dd2bfbdce8e222356b4fec2b96daab14f99691b5c1c9089e466    libiio-0.6.tar.gz
+# From https://github.com/analogdevicesinc/libiio/archive/v0.7/
+sha256	c2b02f1cb51870db52368fdaa8087dc2a4ec43f2bc3c3514d8214952f14c3f39	libiio-0.7.tar.gz
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 6479e6f..3cbfdd6 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIIO_VERSION = 0.6
+LIBIIO_VERSION = 0.7
 LIBIIO_SITE = $(call github,analogdevicesinc,libiio,v$(LIBIIO_VERSION))
 LIBIIO_INSTALL_STAGING = YES
 LIBIIO_LICENSE = LGPLv2.1+
@@ -12,14 +12,29 @@ LIBIIO_LICENSE_FILES = COPYING.txt
 
 LIBIIO_CONF_OPTS = -DENABLE_IPV6=ON \
 	-DWITH_LOCAL_BACKEND=$(if $(BR2_PACKAGE_LIBIIO_LOCAL_BACKEND),ON,OFF) \
+	-DWITH_NETWORK_BACKEND=$(if $(BR2_PACKAGE_LIBIIO_NETWORK_BACKEND),ON,OFF) \
 	-DWITH_TESTS=$(if $(BR2_PACKAGE_LIBIIO_TESTS),ON,OFF) \
 	-DWITH_DOC=OFF
 
-ifeq ($(BR2_PACKAGE_LIBIIO_NETWORK_BACKEND),y)
+ifeq ($(BR2_PACKAGE_LIBIIO_XML_BACKEND),y)
 LIBIIO_DEPENDENCIES += libxml2
-LIBIIO_CONF_OPTS += -DWITH_NETWORK_BACKEND=ON
+LIBIIO_CONF_OPTS += -DWITH_XML_BACKEND=ON
 else
-LIBIIO_CONF_OPTS += -DWITH_NETWORK_BACKEND=OFF
+LIBIIO_CONF_OPTS += -DWITH_XML_BACKEND=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBIIO_USB_BACKEND),y)
+LIBIIO_DEPENDENCIES += libusb
+LIBIIO_CONF_OPTS += -DWITH_USB_BACKEND=ON
+else
+LIBIIO_CONF_OPTS += -DWITH_USB_BACKEND=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBIIO_SERIAL_BACKEND),y)
+LIBIIO_DEPENDENCIES += libserialport
+LIBIIO_CONF_OPTS += -DWITH_SERIAL_BACKEND=ON
+else
+LIBIIO_CONF_OPTS += -DWITH_SERIAL_BACKEND=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBIIO_IIOD),y)
