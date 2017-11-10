From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Nov 2017 07:33:10 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/kodi: remove dependency on
 locale-enabled toolchain
Message-ID: <20171110063310.12642-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
This patch was previously included in the 17.1 bump series:
http://lists.busybox.net/pipermail/buildroot/2017-April/190136.html

In the meantime FindIconv.cmake was committed upstream to master branch.
Due to additional changes needed for their internal rbpi toolchain
upstream will not accept a backport of this patch to Krypton. This
problem does not exist in buildroot.

 ...0003-cmake-iconv-is-a-required-dependency.patch | 92 ++++++++++++++++++++++
 package/kodi/Config.in                             |  5 +-
 package/kodi/kodi.mk                               |  4 +
 3 files changed, 98 insertions(+), 3 deletions(-)
 create mode 100644 package/kodi/0003-cmake-iconv-is-a-required-dependency.patch

diff --git a/package/kodi/0003-cmake-iconv-is-a-required-dependency.patch b/package/kodi/0003-cmake-iconv-is-a-required-dependency.patch
new file mode 100644
index 0000000000..b95771c525
--- /dev/null
+++ b/package/kodi/0003-cmake-iconv-is-a-required-dependency.patch
@@ -0,0 +1,92 @@
+From 70ab56d74aff8b2e3ac49fed6bdf3751c9b1457e Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 12 Feb 2017 14:24:18 +0100
+Subject: [PATCH] [cmake] iconv is a required dependency
+
+This patch adds support for libiconv currently only provided by the
+autoconf-based build system:
+https://github.com/xbmc/xbmc/blob/Krypton/configure.ac#L1172
+
+This commit fixes an error during linking with an uClibc-based
+buildroot toolchain:
+
+[100%] Linking CXX executable kodi.bin
+/home/buildroot/br8_ffmpeg3_kodi17_github/output/host/usr/lib/gcc/i586-buildroot-linux-uclibc/6.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld: build/utils/utils.a(CharsetConverter.cpp.o): undefined reference to symbol 'libiconv_open'
+/home/buildroot/br8_ffmpeg3_kodi17_github/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/lib32/libiconv.so.2: error adding symbols: DSO missing from command line
+
+Backported to Krypton from master branch commit:
+https://github.com/xbmc/xbmc/commit/9a64537543e8dc8609ca8a98181ba17f30c53493
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ project/cmake/CMakeLists.txt          |  2 +-
+ project/cmake/modules/FindIconv.cmake | 44 +++++++++++++++++++++++++++++++++++
+ 2 files changed, 45 insertions(+), 1 deletion(-)
+ create mode 100644 project/cmake/modules/FindIconv.cmake
+
+diff --git a/project/cmake/CMakeLists.txt b/project/cmake/CMakeLists.txt
+index aeb1ff47c2..07c1d1a8d3 100644
+--- a/project/cmake/CMakeLists.txt
++++ b/project/cmake/CMakeLists.txt
+@@ -103,7 +103,7 @@ list(APPEND DEPLIBS ${CMAKE_THREAD_LIBS_INIT})
+ 
+ # Required dependencies
+ set(required_deps Sqlite3 FreeType PCRE Cpluff LibDvd
+-                  TinyXML Python Yajl Cdio
++                  TinyXML Python Yajl Cdio Iconv
+                   Lzo2 Fribidi TagLib FFMPEG CrossGUID)
+ if(NOT WIN32)
+   list(APPEND required_deps ZLIB)
+diff --git a/project/cmake/modules/FindIconv.cmake b/project/cmake/modules/FindIconv.cmake
+new file mode 100644
+index 0000000000..8ee01fb6b8
+--- /dev/null
++++ b/project/cmake/modules/FindIconv.cmake
+@@ -0,0 +1,44 @@
++#.rst:
++# FindICONV
++# --------
++# Finds the ICONV library
++#
++# This will will define the following variables::
++#
++# ICONV_FOUND - system has ICONV
++# ICONV_INCLUDE_DIRS - the ICONV include directory
++# ICONV_LIBRARIES - the ICONV libraries
++#
++# and the following imported targets::
++#
++#   ICONV::ICONV   - The ICONV library
++
++find_path(ICONV_INCLUDE_DIR NAMES iconv.h)
++
++find_library(ICONV_LIBRARY NAMES iconv libiconv c)
++
++set(CMAKE_REQUIRED_LIBRARIES ${ICONV_LIBRARY})
++check_function_exists(iconv HAVE_ICONV_FUNCTION)
++if(NOT HAVE_ICONV_FUNCTION)
++  check_function_exists(libiconv HAVE_LIBICONV_FUNCTION2)
++  set(HAVE_ICONV_FUNCTION ${HAVE_LIBICONV_FUNCTION2})
++  unset(HAVE_LIBICONV_FUNCTION2)
++endif()
++
++include(FindPackageHandleStandardArgs)
++find_package_handle_standard_args(Iconv
++                                  REQUIRED_VARS ICONV_LIBRARY ICONV_INCLUDE_DIR HAVE_ICONV_FUNCTION)
++
++if(ICONV_FOUND)
++  set(ICONV_LIBRARIES ${ICONV_LIBRARY})
++  set(ICONV_INCLUDE_DIRS ${ICONV_INCLUDE_DIR})
++
++  if(NOT TARGET ICONV::ICONV)
++    add_library(ICONV::ICONV UNKNOWN IMPORTED)
++    set_target_properties(ICONV::ICONV PROPERTIES
++                                     IMPORTED_LOCATION "${ICONV_LIBRARY}"
++                                     INTERFACE_INCLUDE_DIRECTORIES "${ICONV_INCLUDE_DIR}")
++  endif()
++endif()
++
++mark_as_advanced(ICONV_INCLUDE_DIR ICONV_LIBRARY HAVE_ICONV_FUNCTION)
+-- 
+2.11.0
+
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 7c81d6f542..be5b23942a 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -5,11 +5,10 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on !(BR2_i386 && !BR2_X86_CPU_HAS_SSE)
 	depends on BR2_USE_MMU # libcdio, and others
 
-comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, locale, threads, wchar, dynamic library, gcc >= 4.8, host gcc >= 4.6"
+comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.8, host gcc >= 4.6"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_ENABLE_LOCALE \
 		|| !BR2_HOST_GCC_AT_LEAST_4_6 \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		|| BR2_TOOLCHAIN_USES_MUSL \
@@ -34,7 +33,6 @@ comment "kodi needs an OpenGL EGL with either an openGL or an OpenGL ES backend"
 
 menuconfig BR2_PACKAGE_KODI
 	bool "kodi"
-	depends on BR2_ENABLE_LOCALE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_HOST_GCC_AT_LEAST_4_6
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
@@ -63,6 +61,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_KODI_GL_EGL
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBPLIST
 	select BR2_PACKAGE_LIBSAMPLERATE
 	select BR2_PACKAGE_LZO
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index b5db109b9a..cd84a2b22b 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -73,6 +73,10 @@ KODI_CONF_OPTS += \
 	-DLIBDVDNAV_URL=$(DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
 	-DLIBDVDREAD_URL=$(DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz
 
+ifeq ($(BR2_ENABLE_LOCALE),)
+KODI_DEPENDENCIES += libiconv
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 KODI_CONF_OPTS += -DCORE_SYSTEM_NAME=rbpi
 KODI_DEPENDENCIES += rpi-userland
-- 
2.11.0
