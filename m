From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 30 Mar 2016 00:17:19 +0200
Subject: [Buildroot] [PATCH 6/6] package/vlc: bump version to 3.0
In-Reply-To: <1459289839-6230-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459289839-6230-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1459289839-6230-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for ffmpeg 3.0 by bumping vlc to its git
master branch since vlc 2.2 will not get support for ffmpeg 3.0:
https://trac.macports.org/ticket/50697#comment:3

The build system expects the git revision stored in a plain text file
called src/revision.txt

Patches 1-7 were rebased.

Patches 8-10 are still to be re-formatted using git and send upstream
to the vlc-devel mailinglist.

Please note that this patch is still WIP and only compile tested using
autobuild.buildroot.net/toolchains/configs/br-x86-64-core2-full.config

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/0001-vlc-static.patch                  | 10 +++---
 ...ac-add-check-for-libgcrypt-config-program.patch | 36 +++++++++++-----------
 .../vlc/0004-implicit-function-declaration.patch   |  4 +--
 package/vlc/0006-qt-x11.patch                      | 12 ++++----
 package/vlc/0007-strerror.patch                    | 10 +++---
 package/vlc/0008-skins2-makefile.patch             | 21 +++++++++++++
 package/vlc/0009-vlc_fixups.patch                  | 31 +++++++++++++++++++
 package/vlc/0010-includes.patch                    | 32 +++++++++++++++++++
 package/vlc/vlc.mk                                 |  7 +++--
 9 files changed, 124 insertions(+), 39 deletions(-)
 create mode 100644 package/vlc/0008-skins2-makefile.patch
 create mode 100644 package/vlc/0009-vlc_fixups.patch
 create mode 100644 package/vlc/0010-includes.patch

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
diff --git a/package/vlc/0008-skins2-makefile.patch b/package/vlc/0008-skins2-makefile.patch
new file mode 100644
index 0000000..937eac0
--- /dev/null
+++ b/package/vlc/0008-skins2-makefile.patch
@@ -0,0 +1,21 @@
+configure.ac: Remove modules/gui/skins2/Makefile from AC_CONFIG_FILES
+
+This fixed a bug during autoreconf:
+configure.ac:4291: error: required file 'modules/gui/skins2/Makefile.in' not found
+
+Patch sent upstream:
+https://trac.videolan.org/vlc/ticket/16766
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr vlc-3001875707021c028efb3bb953059344cef9a154.org/configure.ac vlc-3001875707021c028efb3bb953059344cef9a154/configure.ac
+--- vlc-3001875707021c028efb3bb953059344cef9a154.org/configure.ac	2016-03-18 20:05:44.000000000 +0100
++++ vlc-3001875707021c028efb3bb953059344cef9a154/configure.ac	2016-03-26 20:47:51.937385232 +0100
+@@ -4301,7 +4301,6 @@
+   test/Makefile
+   modules/gui/macosx/Makefile
+   modules/gui/qt/Makefile
+-  modules/gui/skins2/Makefile
+   modules/hw/mmal/Makefile
+ ])
+ 
diff --git a/package/vlc/0009-vlc_fixups.patch b/package/vlc/0009-vlc_fixups.patch
new file mode 100644
index 0000000..6254600
--- /dev/null
+++ b/package/vlc/0009-vlc_fixups.patch
@@ -0,0 +1,31 @@
+Support for strnstr was added in
+http://git.videolan.org/?p=vlc.git;a=commitdiff;h=4c1238c77239cdea38a44748f2800332818b6750
+
+but for systems lacking it, it broke the build:
+
+  CC       strnstr.lo
+In file included from ../config.h:887:0,
+                 from strnstr.c:22:
+../include/vlc_fixups.h:157:45: error: unknown type name ?size_t?
+ char * strnstr (const char *, const char *, size_t);
+
+This patch fixes the problem by adding strnstr to a list of other
+functions to get size_t defined.
+
+Patch sent upstream: https://trac.videolan.org/vlc/ticket/16767
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr vlc-3001875707021c028efb3bb953059344cef9a154.org/include/vlc_fixups.h vlc-3001875707021c028efb3bb953059344cef9a154/include/vlc_fixups.h
+--- vlc-3001875707021c028efb3bb953059344cef9a154.org/include/vlc_fixups.h	2016-03-18 20:05:44.000000000 +0100
++++ vlc-3001875707021c028efb3bb953059344cef9a154/include/vlc_fixups.h	2016-03-26 20:53:12.000000000 +0100
+@@ -74,7 +74,8 @@
+ #if !defined (HAVE_POSIX_MEMALIGN) || \
+     !defined (HAVE_STRLCPY) || \
+     !defined (HAVE_STRNDUP) || \
+-    !defined (HAVE_STRNLEN)
++    !defined (HAVE_STRNLEN) || \
++    !defined (HAVE_STRNSTR)
+ # include <stddef.h> /* size_t */
+ #endif
+ 
diff --git a/package/vlc/0010-includes.patch b/package/vlc/0010-includes.patch
new file mode 100644
index 0000000..1f40681
--- /dev/null
+++ b/package/vlc/0010-includes.patch
@@ -0,0 +1,32 @@
+Fix build errors using uClibc.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr vlc-2bcf949bea43669055e33fedbcfa3193c1b43704.org/include/vlc/libvlc_media.h vlc-2bcf949bea43669055e33fedbcfa3193c1b43704/include/vlc/libvlc_media.h
+--- vlc-2bcf949bea43669055e33fedbcfa3193c1b43704.org/include/vlc/libvlc_media.h	2016-03-29 19:48:05.000000000 +0200
++++ vlc-2bcf949bea43669055e33fedbcfa3193c1b43704/include/vlc/libvlc_media.h	2016-03-30 00:07:29.000000000 +0200
+@@ -26,6 +26,8 @@
+ #ifndef VLC_LIBVLC_MEDIA_H
+ #define VLC_LIBVLC_MEDIA_H 1
+ 
++#include <sys/types.h>  /* for ssize_t */
++
+ # ifdef __cplusplus
+ extern "C" {
+ # endif
+diff -uNr vlc-2bcf949bea43669055e33fedbcfa3193c1b43704.org/include/vlc_fixups.h vlc-2bcf949bea43669055e33fedbcfa3193c1b43704/include/vlc_fixups.h
+--- vlc-2bcf949bea43669055e33fedbcfa3193c1b43704.org/include/vlc_fixups.h	2016-03-29 19:48:05.000000000 +0200
++++ vlc-2bcf949bea43669055e33fedbcfa3193c1b43704/include/vlc_fixups.h	2016-03-30 00:01:59.000000000 +0200
+@@ -26,9 +26,11 @@
+ #ifndef LIBVLC_FIXUPS_H
+ # define LIBVLC_FIXUPS_H 1
+ 
++#include <features.h>
++
+ /* C++11 says there's no need to define __STDC_*_MACROS when including
+  * inttypes.h and stdint.h. */
+-#if defined (__cplusplus) && (!defined(HAVE_CXX11) || defined(__MINGW32__))
++#if (defined (__cplusplus) && (!defined(HAVE_CXX11) || defined(__MINGW32__))) || defined(__UCLIBC__)
+ # ifndef __STDC_FORMAT_MACROS
+ #  define __STDC_FORMAT_MACROS 1
+ # endif
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 46a7cad..ce60433 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-VLC_VERSION = 2.2.2
-VLC_SITE = http://get.videolan.org/vlc/$(VLC_VERSION)
-VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
+VLC_VERSION = 2bcf949bea43669055e33fedbcfa3193c1b43704
+VLC_SITE = https://git.videolan.org/git/vlc.git
+VLC_SITE_METHOD = git
 VLC_LICENSE = GPLv2+ LGPLv2.1+
 VLC_LICENSE_FILES = COPYING COPYING.LIB
 VLC_DEPENDENCIES = host-pkgconf
@@ -23,6 +23,7 @@ define VLC_OVERRIDE_PKG_M4
 	$(SED) 's/PKG_WITH_MODULES/VLC_PKG_WITH_MODULES/g' \
 		-e 's/PKG_HAVE_WITH_MODULES/VLC_PKG_HAVE_WITH_MODULES/g' \
 		$(@D)/configure.ac $(@D)/m4/with_pkg.m4
+	echo $(VLC_VERSION) > $(@D)/src/revision.txt
 endef
 VLC_POST_PATCH_HOOKS += VLC_OVERRIDE_PKG_M4
 
-- 
2.8.0.rc3
