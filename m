From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 28 Apr 2016 18:41:16 +0200
Subject: [Buildroot] [PATCH v3 6/7] package/vlc: bump version to git master
	(to be released as 3.0)
In-Reply-To: <1461861677-22146-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461861677-22146-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1461861677-22146-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for ffmpeg 3.0 by bumping vlc to its git
master branch since vlc 2.2 will not get support for ffmpeg 3.0:
https://trac.macports.org/ticket/50697#comment:3

gcc >= 4.9 is needed to solve this build error seen with
gcc-Version 4.8.5 (Buildroot 2016.05-git-00772-g09cf3c2-dirty):

  CXX      demux/sid.lo
In file included from ../config.h:890:0,
                 from demux/sid.cpp:33:
../include/vlc_fixups.h:297:104: error: types may not be defined in 'sizeof' expressions
 # define _Static_assert(x, s) extern char STATIC_ASSERT_CONCAT(static_assert_, __LINE__)[sizeof(struct { unsigned:-!(x); })]
                                                                                                        ^
../include/vlc_fixups.h:297:124: error: storage class specified for 'static_assert_935'
 # define _Static_assert(x, s) extern char STATIC_ASSERT_CONCAT(static_assert_, __LINE__)[sizeof(struct { unsigned:-!(x); })]
                                                                                                                            ^
/home/bernd/buildroot/br4/output/host/usr/i586-buildroot-linux-uclibc/include/c++/4.8.5/type_traits: In function 'typename std::add_rvalue_reference< <template-parameter-1-1> >::type std::declval()':
../include/vlc_fixups.h:297:104: error: types may not be defined in 'sizeof' expressions
 # define _Static_assert(x, s) extern char STATIC_ASSERT_CONCAT(static_assert_, __LINE__)[sizeof(struct { unsigned:-!(x); })]
                                                                                                        ^
/home/bernd/buildroot/br4/output/host/usr/i586-buildroot-linux-uclibc/include/c++/4.8.5/bits/move.h: In function 'constexpr _Tp&& std::forward(typename std::remove_reference<_From>::type&&)':
../include/vlc_fixups.h:297:104: error: types may not be defined in 'sizeof' expressions
 # define _Static_assert(x, s) extern char STATIC_ASSERT_CONCAT(static_assert_, __LINE__)[sizeof(struct { unsigned:-!(x); })]
                                                                                                        ^
Makefile:18342: recipe for target 'demux/sid.lo' failed

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/0001-vlc-static.patch                  | 10 ++---
 ...ac-add-check-for-libgcrypt-config-program.patch | 36 +++++++++---------
 .../vlc/0004-implicit-function-declaration.patch   |  4 +-
 package/vlc/0006-qt-x11.patch                      | 12 +++---
 package/vlc/0007-strerror.patch                    | 10 ++---
 ...-error-using-uClibc-by-adding-sys-types.h.patch | 44 ++++++++++++++++++++++
 package/vlc/Config.in                              |  6 ++-
 package/vlc/vlc.hash                               |  2 -
 package/vlc/vlc.mk                                 | 24 +++++++++---
 9 files changed, 102 insertions(+), 46 deletions(-)
 create mode 100644 package/vlc/0008-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
 delete mode 100644 package/vlc/vlc.hash

diff --git a/package/vlc/0001-vlc-static.patch b/package/vlc/0001-vlc-static.patch
index f9aa079..f8d3365 100644
--- a/package/vlc/0001-vlc-static.patch
+++ b/package/vlc/0001-vlc-static.patch
@@ -1,19 +1,19 @@
 diff -uNr vlc-2.1.5.org/bin/Makefile.am vlc-2.1.5/bin/Makefile.am
 --- vlc-2.1.5.org/bin/Makefile.am	2013-12-03 10:12:34.000000000 +0100
 +++ vlc-2.1.5/bin/Makefile.am	2014-08-03 12:30:06.722154518 +0200
-@@ -1,7 +1,7 @@
- # Building vlc
- #
+@@ -5,7 +5,7 @@
+ noinst_PROGRAMS = vlc-osx-static
+ else
  bin_PROGRAMS = vlc
 -noinst_PROGRAMS = vlc-static
 +noinst_PROGRAMS =
+ endif
  noinst_DATA =
  vlclib_PROGRAMS = vlc-cache-gen
- EXTRA_PROGRAMS = vlc-wrapper
 diff -uNr vlc-2.1.5.org/Makefile.am vlc-2.1.5/Makefile.am
 --- vlc-2.1.5.org/Makefile.am	2014-02-14 18:40:50.000000000 +0100
 +++ vlc-2.1.5/Makefile.am	2014-08-03 12:29:52.059010766 +0200
-@@ -932,7 +932,7 @@
+@@ -926,7 +926,7 @@
  	cd lib && $(MAKE) $(AM_MAKEFLAGS) libvlc.la
  
  core: libvlc vlc$(EXEEXT)
diff --git a/package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch b/package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch
index e9a7315..0193d1e 100644
--- a/package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch
+++ b/package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch
@@ -19,25 +19,25 @@ diff --git a/configure.ac b/configure.ac
 index 02fb8aa..5a2267b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4020,16 +4020,17 @@
- AC_ARG_ENABLE(libgcrypt,
+diff -uNr vlc-3001875707021c028efb3bb953059344cef9a154.org/configure.ac vlc-3001875707021c028efb3bb953059344cef9a154/configure.ac
+--- vlc-3001875707021c028efb3bb953059344cef9a154.org/configure.ac	2016-03-18 20:05:44.000000000 +0100
++++ vlc-3001875707021c028efb3bb953059344cef9a154/configure.ac	2016-03-26 20:29:01.978968157 +0100
+@@ -4056,6 +4056,7 @@
    [  --disable-libgcrypt     gcrypt support (default enabled)])
+ # require libgcrypt >= 1.6.0
  AS_IF([test "${enable_libgcrypt}" != "no"], [
 +  AC_PATH_PROG([GCRYPT_CONFIG],[libgcrypt-config],[libgcrypt-config])
-   AC_CHECK_DECL([GCRYCTL_SET_THREAD_CBS], [
--    libgcrypt-config --version >/dev/null || \
-+    ${GCRYPT_CONFIG} --version >/dev/null || \
-         AC_MSG_ERROR([gcrypt.h present but libgcrypt-config could not be found])
-     AC_CHECK_LIB(gcrypt, gcry_control, [
-       have_libgcrypt="yes"
--      GCRYPT_CFLAGS="`libgcrypt-config --cflags`"
--      GCRYPT_LIBS="`libgcrypt-config --libs`"
-+      GCRYPT_CFLAGS="`${GCRYPT_CONFIG} --cflags`"
-+      GCRYPT_LIBS="`${GCRYPT_CONFIG} --libs`"
-     ], [
-       AC_MSG_ERROR([libgcrypt not found. Install libgcrypt or pass --disable-libgcrypt.])
--    ], [`libgcrypt-config --libs`])
-+    ], [`${GCRYPT_CONFIG} --libs`])
+   AC_TRY_COMPILE([
+ #include <gcrypt.h>
+ #if GCRYPT_VERSION_NUMBER < 0x010600
+@@ -4064,8 +4065,8 @@
+   [], [
+     have_libgcrypt="yes"
+     AC_DEFINE([HAVE_GCRYPT], 1, [Defined if having gcrypt])
+-    GCRYPT_CFLAGS="`libgcrypt-config --cflags`"
+-    GCRYPT_LIBS="`libgcrypt-config --libs`"
++    GCRYPT_CFLAGS="`${GCRYPT_CONFIG} --cflags`"
++    GCRYPT_LIBS="`${GCRYPT_CONFIG} --libs`"
    ], [
-     AC_MSG_ERROR([libgcrypt version 1.1.94 or higher not found. Install libgcrypt or pass --disable-libgcrypt.])
-   ], [#include <gcrypt.h>]
+     AS_IF([test "${enable_libgcrypt}" == "yes"], [
+       AC_MSG_ERROR([libgcrypt version 1.6.0 or higher not found. Install libgcrypt or pass --disable-libgcrypt.])
diff --git a/package/vlc/0004-implicit-function-declaration.patch b/package/vlc/0004-implicit-function-declaration.patch
index 515453d..0506fa0 100644
--- a/package/vlc/0004-implicit-function-declaration.patch
+++ b/package/vlc/0004-implicit-function-declaration.patch
@@ -13,8 +13,8 @@ diff -uNr vlc-2.2.1.org/configure.ac vlc-2.2.1/configure.ac
  dnl  Compiler warnings
  dnl
  
--RDC_PROG_CC_WFLAGS([all extra sign-compare undef pointer-arith bad-function-cast write-strings missing-prototypes volatile-register-var error-implicit-function-declaration])
-+RDC_PROG_CC_WFLAGS([all extra sign-compare undef pointer-arith bad-function-cast write-strings missing-prototypes volatile-register-var])
+-RDC_PROG_CC_WFLAGS([all extra sign-compare undef pointer-arith bad-function-cast write-strings missing-prototypes volatile-register-var error-implicit-function-declaration init-self logical-op format-security])
++RDC_PROG_CC_WFLAGS([all extra sign-compare undef pointer-arith bad-function-cast write-strings missing-prototypes volatile-register-var init-self logical-op format-security])
  RDC_PROG_CC_FLAGS([-pipe])
  AC_LANG_PUSH([C++])
  RDC_PROG_CXX_WFLAGS([all extra sign-compare undef pointer-arith volatile-register-var])
diff --git a/package/vlc/0006-qt-x11.patch b/package/vlc/0006-qt-x11.patch
index 316a31f..63a3b13 100644
--- a/package/vlc/0006-qt-x11.patch
+++ b/package/vlc/0006-qt-x11.patch
@@ -1,16 +1,16 @@
-libX11 is an optional dependency for the qt4 module
+libX11 is an optional dependency for the qt module
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
 diff -uNr vlc-2.2.1.org/modules/gui/qt4/Makefile.am vlc-2.2.1/modules/gui/qt4/Makefile.am
---- vlc-2.2.1.org/modules/gui/qt4/Makefile.am	2014-11-29 12:34:15.000000000 +0100
-+++ vlc-2.2.1/modules/gui/qt4/Makefile.am	2015-04-27 18:53:36.968611490 +0200
+--- vlc-2.2.1.org/modules/gui/qt/Makefile.am	2014-11-29 12:34:15.000000000 +0100
++++ vlc-2.2.1/modules/gui/qt/Makefile.am	2015-04-27 18:53:36.968611490 +0200
 @@ -22,7 +22,7 @@
  if HAVE_WIN32
- libqt4_plugin_la_LIBADD += -lole32 -lcomctl32 -luuid
+ libqt_plugin_la_LIBADD += -lole32 -lcomctl32 -luuid
  else
--libqt4_plugin_la_LIBADD += $(X_LIBS) $(X_PRE_LIB) -lX11
-+libqt4_plugin_la_LIBADD += $(X_LIBS) $(X_PRE_LIB)
+-libqt_plugin_la_LIBADD += $(X_LIBS) $(X_PRE_LIB) -lX11
++libqt_plugin_la_LIBADD += $(X_LIBS) $(X_PRE_LIB)
  endif
  endif
  if HAVE_DARWIN
diff --git a/package/vlc/0007-strerror.patch b/package/vlc/0007-strerror.patch
index e9f3141..6a31ef9 100644
--- a/package/vlc/0007-strerror.patch
+++ b/package/vlc/0007-strerror.patch
@@ -11,15 +11,15 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 diff -uNr vlc-2.2.1.org/configure.ac vlc-2.2.1/configure.ac
 --- vlc-2.2.1.org/configure.ac	2015-04-13 09:57:54.000000000 +0200
 +++ vlc-2.2.1/configure.ac	2015-05-02 16:13:22.800448380 +0200
-@@ -534,7 +534,7 @@
+@@ -574,7 +574,7 @@
  
  dnl Check for usual libc functions
  AC_CHECK_DECLS([nanosleep],,,[#include <time.h>])
--AC_CHECK_FUNCS([daemon fcntl fstatvfs fork getenv getpwuid_r isatty lstat memalign mmap open_memstream openat pread posix_fadvise posix_madvise setlocale stricmp strnicmp strptime uselocale])
-+AC_CHECK_FUNCS([daemon fcntl fstatvfs fork getenv getpwuid_r isatty lstat memalign mmap open_memstream openat pread posix_fadvise posix_madvise setlocale strerror_l stricmp strnicmp strptime uselocale])
- AC_REPLACE_FUNCS([atof atoll dirfd fdopendir flockfile fsync getdelim getpid gmtime_r lldiv localtime_r nrand48 poll posix_memalign rewind setenv strcasecmp strcasestr strdup strlcpy strndup strnlen strsep strtof strtok_r strtoll swab tdestroy strverscmp])
+-AC_CHECK_FUNCS([daemon fcntl flock fstatvfs fork getenv getpwuid_r isatty lstat memalign mkostemp mmap open_memstream openat pread posix_fadvise posix_madvise setlocale stricmp strnicmp strptime uselocale pthread_cond_timedwait_monotonic_np pthread_condattr_setclock])
++AC_CHECK_FUNCS([daemon fcntl flock fstatvfs fork getenv getpwuid_r isatty lstat memalign mkostemp mmap open_memstream openat pread posix_fadvise posix_madvise setlocale strerror_l stricmp strnicmp strptime uselocale pthread_cond_timedwait_monotonic_np pthread_condattr_setclock])
+ AC_REPLACE_FUNCS([atof atoll dirfd fdopendir ffsll flockfile fsync getdelim getpid lldiv nrand48 poll posix_memalign recvmsg rewind sendmsg setenv strcasecmp strcasestr strdup strlcpy strndup strnlen strnstr strsep strtof strtok_r strtoll swab tdestroy timegm timespec_get strverscmp])
+ AC_REPLACE_FUNCS([gettimeofday])
  AC_CHECK_FUNCS(fdatasync,,
-   [AC_DEFINE(fdatasync, fsync, [Alias fdatasync() to fsync() if missing.])
 diff -uNr vlc-2.2.1.org/src/posix/error.c vlc-2.2.1/src/posix/error.c
 --- vlc-2.2.1.org/src/posix/error.c	2014-08-14 09:20:04.000000000 +0200
 +++ vlc-2.2.1/src/posix/error.c	2015-05-02 16:25:24.075378369 +0200
diff --git a/package/vlc/0008-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch b/package/vlc/0008-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
new file mode 100644
index 0000000..6f4558c
--- /dev/null
+++ b/package/vlc/0008-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
@@ -0,0 +1,44 @@
+From 393474c609e2b4641c9f75a5e8c5099c3d72352b Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 2 Apr 2016 16:49:54 +0200
+Subject: [PATCH] Fix build error using uClibc by adding sys/types.h
+
+Fixes
+
+  CC       core.lo
+In file included from libvlc_internal.h:35:0,
+                 from core.c:28:
+../include/vlc/libvlc_media.h:313:18: error: expected declaration specifiers or '...' before '*' token
+ typedef ssize_t (*libvlc_media_read_cb)(void *opaque, unsigned char *buf,
+                  ^
+../include/vlc/libvlc_media.h:423:36: error: unknown type name 'libvlc_media_read_cb'
+                                    libvlc_media_read_cb read_cb,
+                                    ^
+Bug was reported to trac:
+https://trac.videolan.org/vlc/ticket/16768
+
+This patch was suggested by courmisch in the trac ticket.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Patch sent upstream:
+ https://mailman.videolan.org/pipermail/vlc-devel/2016-April/106952.html]
+---
+ include/vlc/libvlc_media.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/vlc/libvlc_media.h b/include/vlc/libvlc_media.h
+index 3e7c637..7caa65e 100644
+--- a/include/vlc/libvlc_media.h
++++ b/include/vlc/libvlc_media.h
+@@ -26,6 +26,8 @@
+ #ifndef VLC_LIBVLC_MEDIA_H
+ #define VLC_LIBVLC_MEDIA_H 1
+ 
++#include <sys/types.h>  /* for ssize_t */
++
+ # ifdef __cplusplus
+ extern "C" {
+ # endif
+-- 
+2.8.0.rc3
+
diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index 166e7d2..d90f7ed 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_VLC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
@@ -32,7 +33,8 @@ config BR2_PACKAGE_VLC_OPENCV3_BACKEND
 	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT
 
-comment "vlc needs a toolchain w/ C++, dynamic library, wchar, threads, headers >= 3.7"
+comment "vlc needs a toolchain w/ C++, dynamic library, wchar, threads, gcc >= 4.9, headers >= 3.7"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
deleted file mode 100644
index 6754b82..0000000
--- a/package/vlc/vlc.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://download.videolan.org/pub/videolan/vlc/2.2.2/vlc-2.2.2.tar.xz.sha256
-sha256	9ad23128be16f9b40ed772961272cb0748ed8e4aa1bc79c129e589feebea5fb5	vlc-2.2.2.tar.xz
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 46a7cad..82ae802 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,17 +4,22 @@
 #
 ################################################################################
 
-VLC_VERSION = 2.2.2
-VLC_SITE = http://get.videolan.org/vlc/$(VLC_VERSION)
-VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
+VLC_VERSION = 98dd4c30db57f88a92be16aa694f5d9fda08c15c
+VLC_SITE = https://git.videolan.org/git/vlc.git
+VLC_SITE_METHOD = git
 VLC_LICENSE = GPLv2+ LGPLv2.1+
 VLC_LICENSE_FILES = COPYING COPYING.LIB
 VLC_DEPENDENCIES = host-pkgconf
-VLC_AUTORECONF = YES
-
-# Install vlc libraries in staging.
 VLC_INSTALL_STAGING = YES
 
+# we can not use plain autoreconf because the vlc bootstrap script
+# creates more makefiles, quote from $(@D)/bootstrap:
+# "Generate the modules makefile, by parsing modules/**/Modules.am"
+define VLC_BOOTSTRAP
+	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
+endef
+VLC_PRE_CONFIGURE_HOOKS += VLC_BOOTSTRAP
+
 # VLC defines two autoconf functions which are also defined by our own pkg.m4
 # from pkgconf. Unfortunately, they are defined in a different way: VLC adds
 # --enable- options, but pkg.m4 adds --with- options. To make sure we use
@@ -26,6 +31,13 @@ define VLC_OVERRIDE_PKG_M4
 endef
 VLC_POST_PATCH_HOOKS += VLC_OVERRIDE_PKG_M4
 
+# VLC needs the current git revision stored in a text file for the make
+# target stamp-revision
+define VLC_VERSION_TO_REVISION_TXT
+	echo $(VLC_VERSION) > $(@D)/src/revision.txt
+endef
+VLC_POST_PATCH_HOOKS += VLC_VERSION_TO_REVISION_TXT
+
 VLC_CONF_OPTS += \
 	--disable-gles1 \
 	--disable-a52 \
-- 
2.8.0.rc3
