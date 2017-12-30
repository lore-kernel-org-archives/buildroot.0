From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 30 Dec 2017 14:16:55 -0500
Subject: [Buildroot] [PATCH v7 1/1] libcpprestsdk: new package
Message-ID: <20171230191655.32606-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The C++ REST SDK is a Microsoft project for cloud-based client-server
communication in native code using a modern asynchronous C++ API design.
This project aims to help C++ developers connect to and interact with
services.

This package is licensed under the MIT package and depends on BOOST
and OpenSSL/LibreSSL.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
Changes v1 -> v2:
  - Add "depends on BR2_USE_WCHAR # boost" to boost.mk (Thomas)
  - Remove "depends on BR2_USE_MMU" from boost.mk (Thomas)
  - Add "!BR2_USE_WCHAR" to boost.mk (Thomas)

Changes v2 -> v3:
  - Update to v2.10.0
  - Remove check for libressl now that OpenSSL is a virtual package.
  - Add 0001-remove-cast-align-error-flag.patch to prevent cross-compiling
    warning errors.
  - Add 0002-fix-xlocale-header-check.patch to prevent uclibc/musl errors
    due to a missing header.
  - Add 0003-fix-compilation-issues-with-musl.patch which adds sys/time.h to
    asyncrt_utils.h.

Changes v3 -> v4:
  - Fixed 0003-fix-compilation-issues-with-musl.patch
  
Changes v4 -> v5
  - Patches now formatted with -N.
  - Dependencies now on a single line.
  
Changes v5 -> v6
  - Removed 0001-remove-cast-align-error-flag.patch in favor of passing
    -DWERROR=OFF in libcpprestsdk.mk (Arnout)
  - Renamed fix-compilation-issues-with-musl.patch to 
    include-sys-time-for-struct-timeval.patch (Arnout)
  - Fixed spacing issues in Config.in
  - Fixed spacing issues in libcpprestsdk.hash (Arnout)

Changes v6 -> v7
  - Bump to version v2.10.1

 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-fix-xlocale-header-check.patch            | 55 ++++++++++++++++++++++
 .../0002-include-sys-time-for-struct-timeval.patch | 28 +++++++++++
 package/libcpprestsdk/Config.in                    | 26 ++++++++++
 package/libcpprestsdk/libcpprestsdk.hash           |  3 ++
 package/libcpprestsdk/libcpprestsdk.mk             | 15 ++++++
 7 files changed, 129 insertions(+)
 create mode 100644 package/libcpprestsdk/0001-fix-xlocale-header-check.patch
 create mode 100644 package/libcpprestsdk/0002-include-sys-time-for-struct-timeval.patch
 create mode 100644 package/libcpprestsdk/Config.in
 create mode 100644 package/libcpprestsdk/libcpprestsdk.hash
 create mode 100644 package/libcpprestsdk/libcpprestsdk.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b6cc7a0950..41647734ac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -43,6 +43,7 @@ F:	package/gstreamer1/gst1-plugins-ugly/
 F:	package/gstreamer1/gst1-vaapi/
 F:	package/imx-usb-loader/
 F:	package/janus-gateway/
+F:	package/libcpprestsdk/
 F:	package/libressl/
 F:	package/libselinux/
 F:	package/libsemanage/
diff --git a/package/Config.in b/package/Config.in
index bd39a374f0..f24899ec39 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1353,6 +1353,7 @@ menu "Networking"
 	source "package/libcgi/Config.in"
 	source "package/libcgicc/Config.in"
 	source "package/libcoap/Config.in"
+	source "package/libcpprestsdk/Config.in"
 	source "package/libcurl/Config.in"
 	source "package/libdnet/Config.in"
 	source "package/libeXosip2/Config.in"
diff --git a/package/libcpprestsdk/0001-fix-xlocale-header-check.patch b/package/libcpprestsdk/0001-fix-xlocale-header-check.patch
new file mode 100644
index 0000000000..807ba60e61
--- /dev/null
+++ b/package/libcpprestsdk/0001-fix-xlocale-header-check.patch
@@ -0,0 +1,55 @@
+From a826b7b656c165bc35746d9af3ec371387d2bca1 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Mon, 23 Oct 2017 08:11:21 -0400
+Subject: [PATCH] fix xlocale header check
+
+asyncrt_utils.h checks if __GLIBC__ is not defined before including
+xlocal.h.  This will cause a compilation failure on uclibc and musl.
+
+Add a proper check in CMakeLists.txt and check for HAVE_XLOCALE_H
+instead of __GLIBC__
+
+Upstream-Status: Pending
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ Release/CMakeLists.txt                  | 3 +++
+ Release/include/cpprest/asyncrt_utils.h | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Release/CMakeLists.txt b/Release/CMakeLists.txt
+index d57aa3d..eefae75 100644
+--- a/Release/CMakeLists.txt
++++ b/Release/CMakeLists.txt
+@@ -42,6 +42,7 @@ include(cmake/cpprest_find_boost.cmake)
+ include(cmake/cpprest_find_zlib.cmake)
+ include(cmake/cpprest_find_openssl.cmake)
+ include(cmake/cpprest_find_websocketpp.cmake)
++include(CheckIncludeFiles)
+ 
+ find_package(Threads REQUIRED)
+ if(THREADS_HAVE_PTHREAD_ARG)
+@@ -56,6 +57,8 @@ if(CPPREST_EXCLUDE_WEBSOCKETS)
+   set(CPPREST_WEBSOCKETS_IMPL none CACHE STRING "Internal use.")
+ endif()
+ 
++CHECK_INCLUDE_FILES(xlocale.h HAVE_XLOCALE_H)
++
+ if(APPLE) # Note: also iOS
+   set(CPPREST_PPLX_IMPL apple CACHE STRING "Internal use.")
+   set(CPPREST_WEBSOCKETS_IMPL wspp CACHE STRING "Internal use.")
+diff --git a/Release/include/cpprest/asyncrt_utils.h b/Release/include/cpprest/asyncrt_utils.h
+index fac70a9..8faa2dc 100644
+--- a/Release/include/cpprest/asyncrt_utils.h
++++ b/Release/include/cpprest/asyncrt_utils.h
+@@ -29,7 +29,7 @@
+ 
+ #ifndef _WIN32
+ #include <boost/algorithm/string.hpp>
+-#if !defined(ANDROID) && !defined(__ANDROID__) && !defined(__GLIBC__) // CodePlex 269
++#if !defined(ANDROID) && !defined(__ANDROID__) && defined(HAVE_XLOCALE_H) // CodePlex 269
+ /* Systems using glibc: xlocale.h has been removed from glibc 2.26
+    The above include of locale.h is sufficient
+    Further details: https://sourceware.org/git/?p=glibc.git;a=commit;h=f0be25b6336db7492e47d2e8e72eb8af53b5506d */
+-- 
+2.13.6
+
diff --git a/package/libcpprestsdk/0002-include-sys-time-for-struct-timeval.patch b/package/libcpprestsdk/0002-include-sys-time-for-struct-timeval.patch
new file mode 100644
index 0000000000..0930a25d57
--- /dev/null
+++ b/package/libcpprestsdk/0002-include-sys-time-for-struct-timeval.patch
@@ -0,0 +1,28 @@
+From 25453f9c186cf441881b06bc5503d979acb0ab75 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Mon, 23 Oct 2017 09:38:11 -0400
+Subject: [PATCH] Include sys/time.h for struct timeval
+
+This is needed with musl.
+
+Upstream-Status: Pending
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ Release/include/cpprest/asyncrt_utils.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Release/include/cpprest/asyncrt_utils.h b/Release/include/cpprest/asyncrt_utils.h
+index 8faa2dc..aab87a5 100644
+--- a/Release/include/cpprest/asyncrt_utils.h
++++ b/Release/include/cpprest/asyncrt_utils.h
+@@ -28,6 +28,7 @@
+ #endif
+ 
+ #ifndef _WIN32
++#include <sys/time.h>
+ #include <boost/algorithm/string.hpp>
+ #if !defined(ANDROID) && !defined(__ANDROID__) && defined(HAVE_XLOCALE_H) // CodePlex 269
+ /* Systems using glibc: xlocale.h has been removed from glibc 2.26
+-- 
+2.13.6
+
diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
new file mode 100644
index 0000000000..9ef52c72be
--- /dev/null
+++ b/package/libcpprestsdk/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_LIBCPPRESTSDK
+	bool "libcpprestsdk"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+	depends on BR2_USE_WCHAR # boost
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_ATOMIC
+	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_RANDOM
+	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_THREAD
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  The C++ REST SDK is a Microsoft project for cloud-based
+	  client-server communication in native code using a modern
+	  asynchronous C++ API design. This project aims to help C++
+	  developers connect to and interact with services.
+
+	  https://github.com/Microsoft/cpprestsdk
+
+comment "libcpprestsdk needs a toolchain w/ C++, wchar, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR
diff --git a/package/libcpprestsdk/libcpprestsdk.hash b/package/libcpprestsdk/libcpprestsdk.hash
new file mode 100644
index 0000000000..0bddfc916e
--- /dev/null
+++ b/package/libcpprestsdk/libcpprestsdk.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 f38bc48e6fca969de794dcd65889df6563855cee5ff99742dafc6b2869976e71	libcpprestsdk-v2.10.1.tar.gz
+sha256 5c191789f502ac87df83b57008d2fc3e47fbf31315381b5bc4309f6602d0fe97	license.txt
diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
new file mode 100644
index 0000000000..4aafa6e593
--- /dev/null
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libcpprestsdk
+#
+################################################################################
+
+LIBCPPRESTSDK_VERSION = v2.10.1
+LIBCPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,$(LIBCPPRESTSDK_VERSION))
+LIBCPPRESTSDK_LICENSE = MIT
+LIBCPPRESTSDK_LICENSE_FILES = license.txt
+LIBCPPRESTSDK_SUBDIR = Release
+LIBCPPRESTSDK_DEPENDENCIES += boost openssl zlib
+LIBCPPRESTSDK_CONF_OPTS = -DWERROR=OFF
+
+$(eval $(cmake-package))
-- 
2.14.3
