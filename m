From: Paul Cercueil <paul.cercueil@analog.com>
Date: Mon, 6 Feb 2017 15:55:42 +0100
Subject: [Buildroot] [PATCH] libiio: Bump to version 0.9
Message-ID: <20170206145542.32623-1-paul.cercueil@analog.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new version introduces a lot of bug fixes and some new API
functions.

Additionally, the IIO Daemon is now able to share the local IIO devices
through USB (using FunctionFS).

Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
---
 ...t-include-pthread.h-if-NO_THREADS-is-defi.patch | 26 ----------
 ...ties.c-Add-a-check-for-newlocale-function.patch | 55 ++++++++++++++++++++++
 .../0002-CMake-Link-with-librt-if-found.patch      | 30 ------------
 package/libiio/Config.in                           | 18 +++++--
 package/libiio/libiio.hash                         |  4 +-
 package/libiio/libiio.mk                           | 11 ++++-
 6 files changed, 82 insertions(+), 62 deletions(-)
 delete mode 100644 package/libiio/0001-lock.c-Don-t-include-pthread.h-if-NO_THREADS-is-defi.patch
 create mode 100644 package/libiio/0001-utilities.c-Add-a-check-for-newlocale-function.patch
 delete mode 100644 package/libiio/0002-CMake-Link-with-librt-if-found.patch

diff --git a/package/libiio/0001-lock.c-Don-t-include-pthread.h-if-NO_THREADS-is-defi.patch b/package/libiio/0001-lock.c-Don-t-include-pthread.h-if-NO_THREADS-is-defi.patch
deleted file mode 100644
index fd029ccc6a..0000000000
--- a/package/libiio/0001-lock.c-Don-t-include-pthread.h-if-NO_THREADS-is-defi.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d052d263600549979a6219a59e85af80eeafc6d2 Mon Sep 17 00:00:00 2001
-From: Paul Cercueil <paul.cercueil@analog.com>
-Date: Tue, 5 Jul 2016 12:12:41 +0200
-Subject: [PATCH] lock.c: Don't include <pthread.h> if NO_THREADS is defined
-
-Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
----
- lock.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lock.c b/lock.c
-index 39248ab..00eb9d9 100644
---- a/lock.c
-+++ b/lock.c
-@@ -18,7 +18,7 @@
- 
- #ifdef _WIN32
- #include <windows.h>
--#else
-+#elif !defined(NO_THREADS)
- #include <pthread.h>
- #endif
- 
--- 
-2.8.1
-
diff --git a/package/libiio/0001-utilities.c-Add-a-check-for-newlocale-function.patch b/package/libiio/0001-utilities.c-Add-a-check-for-newlocale-function.patch
new file mode 100644
index 0000000000..cea22cbcac
--- /dev/null
+++ b/package/libiio/0001-utilities.c-Add-a-check-for-newlocale-function.patch
@@ -0,0 +1,55 @@
+From 913c2cc740d60450e91e066cf38f5654936a6015 Mon Sep 17 00:00:00 2001
+From: Paul Cercueil <paul.cercueil@analog.com>
+Date: Mon, 6 Feb 2017 14:04:47 +0100
+Subject: [PATCH] utilities.c: Add a check for newlocale() function
+
+uClibc might define __UCLIBC_HAS_LOCALE__, without actually providing
+the locale_t type or the setlocale() function.
+
+Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
+---
+ CMakeLists.txt       | 1 +
+ iio-config.h.cmakein | 1 +
+ utilities.c          | 2 +-
+ 3 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index cb3a48f..b24eff3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -66,6 +66,7 @@ endif()
+ include(CheckSymbolExists)
+ check_symbol_exists(strdup "string.h" HAS_STRDUP)
+ check_symbol_exists(strerror_r "string.h" HAS_STRERROR_R)
++check_symbol_exists(newlocale "locale.h" HAS_NEWLOCALE)
+ 
+ IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
+ 	option(WITH_IIOD "Build the IIO Daemon" ON)
+diff --git a/iio-config.h.cmakein b/iio-config.h.cmakein
+index 1b8608e..6700326 100644
+--- a/iio-config.h.cmakein
++++ b/iio-config.h.cmakein
+@@ -21,6 +21,7 @@
+ #cmakedefine HAS_PIPE2
+ #cmakedefine HAS_STRDUP
+ #cmakedefine HAS_STRERROR_R
++#cmakedefine HAS_NEWLOCALE
+ #cmakedefine HAS_PTHREAD_SETNAME_NP
+ #cmakedefine HAVE_IPV6
+ #cmakedefine HAVE_AVAHI
+diff --git a/utilities.c b/utilities.c
+index 88b8257..21dbd10 100644
+--- a/utilities.c
++++ b/utilities.c
+@@ -34,7 +34,7 @@
+ #endif
+ 
+ #ifdef LOCALE_SUPPORT
+-#if defined(__MINGW32__)
++#if defined(__MINGW32__) || (!defined(_WIN32) && !defined(HAS_NEWLOCALE))
+ static int read_double_locale(const char *str, double *val)
+ {
+ 	char *end, *old_locale;
+-- 
+2.11.0
+
diff --git a/package/libiio/0002-CMake-Link-with-librt-if-found.patch b/package/libiio/0002-CMake-Link-with-librt-if-found.patch
deleted file mode 100644
index 2c45016540..0000000000
--- a/package/libiio/0002-CMake-Link-with-librt-if-found.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 1bc450179a0819970261e6a29071756d09b71c5f Mon Sep 17 00:00:00 2001
-From: Paul Cercueil <paul.cercueil@analog.com>
-Date: Fri, 19 Aug 2016 09:00:58 +0200
-Subject: [PATCH] CMake: Link with librt if found
-
-This is required for older versions of glibc.
-
-Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
----
- CMakeLists.txt | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2a339fe..3dd3520 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -113,6 +113,10 @@ add_definitions(-DLIBIIO_VERSION_GIT="${LIBIIO_VERSION_GIT}")
- if(WITH_LOCAL_BACKEND)
- 	add_definitions(-DLOCAL_BACKEND=1)
- 	set(LIBIIO_CFILES ${LIBIIO_CFILES} local.c)
-+
-+	# Link with librt if present
-+	find_library(LIBRT_LIBRARIES rt)
-+	set(LIBS_TO_LINK ${LIBS_TO_LINK} ${LIBRT_LIBRARIES})
- endif()
- 
- find_library(LIBUSB_LIBRARIES usb-1.0)
--- 
-2.8.1
-
diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 2e7a76d8c8..dd27e5c519 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_LIBIIO_XML_BACKEND
 
 config BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
 	bool "Network backend"
-	depends on BR2_PACKAGE_LIBIIO_XML_BACKEND
+	select BR2_PACKAGE_LIBIIO_XML_BACKEND
 	default y
 	help
 	  Enable the network backend of the library.
@@ -32,7 +32,7 @@ config BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
 config BR2_PACKAGE_LIBIIO_USB_BACKEND
 	bool "USB backend"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # from libusb
-	depends on BR2_PACKAGE_LIBIIO_XML_BACKEND
+	select BR2_PACKAGE_LIBIIO_XML_BACKEND
 	select BR2_PACKAGE_LIBUSB
 	default y
 	help
@@ -43,7 +43,7 @@ comment "The USB backend needs a toolchain w/ threads"
 
 config BR2_PACKAGE_LIBIIO_SERIAL_BACKEND
 	bool "Serial backend"
-	depends on BR2_PACKAGE_LIBIIO_XML_BACKEND
+	select BR2_PACKAGE_LIBIIO_XML_BACKEND
 	select BR2_PACKAGE_LIBSERIALPORT
 	default y
 	help
@@ -65,6 +65,18 @@ comment "IIO Daemon needs a toolchain w/ threads"
 comment "IIO Daemon is not yet available on Blackfin"
 	depends on BR2_bfin
 
+config BR2_PACKAGE_LIBIIO_IIOD_USBD
+	bool "USB support in the IIO Daemon (FunctionFS)"
+	depends on BR2_PACKAGE_LIBIIO_IIOD
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	select BR2_PACKAGE_LIBAIO
+	help
+	  Add support for USB through FunctionFS with IIOD.
+
+comment "USB support in the IIO Daemon requires libaio"
+	depends on BR2_PACKAGE_LIBIIO_IIOD
+	depends on !BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+
 config BR2_PACKAGE_LIBIIO_TESTS
 	bool "Install test programs"
 	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
diff --git a/package/libiio/libiio.hash b/package/libiio/libiio.hash
index f15182aa75..e5387861aa 100644
--- a/package/libiio/libiio.hash
+++ b/package/libiio/libiio.hash
@@ -1,2 +1,2 @@
-# From https://github.com/analogdevicesinc/libiio/archive/v0.7/
-sha256	c2b02f1cb51870db52368fdaa8087dc2a4ec43f2bc3c3514d8214952f14c3f39	libiio-0.7.tar.gz
+# From https://github.com/analogdevicesinc/libiio/archive/v0.9/
+sha256	b6184876d192fbfd51e3a0a29736fa1be2dbaf07370cf861797076f40a85f823	libiio-0.9.tar.gz
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index e8fb6b2f25..8977610999 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIIO_VERSION = 0.7
+LIBIIO_VERSION = 0.9
 LIBIIO_SITE = $(call github,analogdevicesinc,libiio,v$(LIBIIO_VERSION))
 LIBIIO_INSTALL_STAGING = YES
 LIBIIO_LICENSE = LGPLv2.1+
@@ -13,6 +13,8 @@ LIBIIO_LICENSE_FILES = COPYING.txt
 LIBIIO_CONF_OPTS = -DENABLE_IPV6=ON \
 	-DWITH_LOCAL_BACKEND=$(if $(BR2_PACKAGE_LIBIIO_LOCAL_BACKEND),ON,OFF) \
 	-DWITH_NETWORK_BACKEND=$(if $(BR2_PACKAGE_LIBIIO_NETWORK_BACKEND),ON,OFF) \
+	-DWITH_MATLAB_BINDINGS_API=OFF \
+	-DINSTALL_UDEV_RULE=$(if $(BR2_PACKAGE_HAS_UDEV),ON,OFF) \
 	-DWITH_TESTS=$(if $(BR2_PACKAGE_LIBIIO_TESTS),ON,OFF) \
 	-DWITH_DOC=OFF
 
@@ -44,6 +46,13 @@ else
 LIBIIO_CONF_OPTS += -DWITH_IIOD=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBIIO_IIOD_USBD),y)
+LIBIIO_DEPENDENCIES += libaio
+LIBIIO_CONF_OPTS += -DWITH_IIOD_USBD=ON
+else
+LIBIIO_CONF_OPTS += -DWITH_IIOD_USBD=OFF
+endif
+
 # Avahi support in libiio requires avahi-client, which needs avahi-daemon
 ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON),yy)
 LIBIIO_DEPENDENCIES += avahi
-- 
2.11.0
