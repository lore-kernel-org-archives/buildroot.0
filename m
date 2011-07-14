From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Jul 2011 09:35:52 +0200
Subject: [Buildroot] [git commit] lzo: bump version
Message-ID: <20110714075411.18DB58A5B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d10125af7fa172d0bc5682d98b1aff627c6fd101
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This contains an updated build system, so the patches are no longer needed.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lzo/lzo-2.03-acinclude-m4.patch     |  377 ---------------------------
 package/lzo/lzo-2.03-fix-configure-ac.patch |   21 --
 package/lzo/lzo-2.03-fix-makefile-am.patch  |   24 --
 package/lzo/lzo.mk                          |   14 +-
 4 files changed, 2 insertions(+), 434 deletions(-)
 delete mode 100644 package/lzo/lzo-2.03-acinclude-m4.patch
 delete mode 100644 package/lzo/lzo-2.03-fix-configure-ac.patch
 delete mode 100644 package/lzo/lzo-2.03-fix-makefile-am.patch

diff --git a/package/lzo/lzo-2.03-acinclude-m4.patch b/package/lzo/lzo-2.03-acinclude-m4.patch
deleted file mode 100644
index 8f860f4..0000000
--- a/package/lzo/lzo-2.03-acinclude-m4.patch
+++ /dev/null
@@ -1,377 +0,0 @@
-The lzo tarball only contains an aclocal.m4, which is the result from
-running aclocal. Unfortunately, it lacks the acinclude.m4 file which
-would allow us to do an autoreconf of the package. Therefore, this
-patch extracts from aclocal.m4 the parts that are specific to this lzo
-package, and put them into an acinclude.m4 so that autoreconf on this
-package will work.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- acinclude.m4 |  360 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 360 insertions(+)
-
-Index: lzo-2.03/acinclude.m4
-===================================================================
---- /dev/null
-+++ lzo-2.03/acinclude.m4
-@@ -0,0 +1,360 @@
-+# /***********************************************************************
-+# // standard ACC macros
-+# ************************************************************************/
-+
-+AC_DEFUN([mfx_ACC_CHECK_ENDIAN], [
-+AC_C_BIGENDIAN([AC_DEFINE(ACC_ABI_BIG_ENDIAN,1,[Define to 1 if your machine is big endian.])],[AC_DEFINE(ACC_ABI_LITTLE_ENDIAN,1,[Define to 1 if your machine is little endian.])])
-+])#
-+
-+AC_DEFUN([mfx_ACC_CHECK_HEADERS], [
-+AC_HEADER_TIME
-+AC_CHECK_HEADERS([assert.h ctype.h dirent.h errno.h fcntl.h float.h limits.h malloc.h memory.h setjmp.h signal.h stdarg.h stddef.h stdint.h stdio.h stdlib.h string.h strings.h time.h unistd.h utime.h sys/mman.h sys/resource.h sys/stat.h sys/time.h sys/types.h sys/wait.h])
-+])#
-+
-+AC_DEFUN([mfx_ACC_CHECK_FUNCS], [
-+AC_CHECK_FUNCS(access alloca atexit atoi atol chmod chown clock_getcpuclockid clock_getres clock_gettime ctime difftime fstat getenv getpagesize getrusage gettimeofday gmtime isatty localtime longjmp lstat memcmp memcpy memmove memset mkdir mktime mmap mprotect munmap qsort raise rmdir setjmp signal snprintf strcasecmp strchr strdup strerror strftime stricmp strncasecmp strnicmp strrchr strstr time umask utime vsnprintf)
-+])#
-+
-+
-+AC_DEFUN([mfx_ACC_CHECK_SIZEOF], [
-+AC_CHECK_SIZEOF(short)
-+AC_CHECK_SIZEOF(int)
-+AC_CHECK_SIZEOF(long)
-+
-+AC_CHECK_SIZEOF(long long)
-+AC_CHECK_SIZEOF(__int16)
-+AC_CHECK_SIZEOF(__int32)
-+AC_CHECK_SIZEOF(__int64)
-+
-+AC_CHECK_SIZEOF(void *)
-+AC_CHECK_SIZEOF(size_t)
-+AC_CHECK_SIZEOF(ptrdiff_t)
-+])#
-+
-+
-+# /***********************************************************************
-+# // Check for ACC_conformance
-+# ************************************************************************/
-+
-+AC_DEFUN([mfx_ACC_ACCCHK], [
-+mfx_tmp=$1
-+mfx_save_CPPFLAGS=$CPPFLAGS
-+dnl in Makefile.in $(INCLUDES) will be before $(CPPFLAGS), so we mimic this here
-+test "X$mfx_tmp" = "X" || CPPFLAGS="$mfx_tmp $CPPFLAGS"
-+
-+AC_MSG_CHECKING([whether your compiler passes the ACC conformance test])
-+
-+AC_LANG_CONFTEST([AC_LANG_PROGRAM(
-+[[#define ACC_CONFIG_NO_HEADER 1
-+#include "acc/acc.h"
-+#include "acc/acc_incd.h"
-+#undef ACCCHK_ASSERT
-+#define ACCCHK_ASSERT(expr)     ACC_COMPILE_TIME_ASSERT_HEADER(expr)
-+#include "acc/acc_chk.ch"
-+#undef ACCCHK_ASSERT
-+static void test_acc_compile_time_assert(void) {
-+#define ACCCHK_ASSERT(expr)     ACC_COMPILE_TIME_ASSERT(expr)
-+#include "acc/acc_chk.ch"
-+#undef ACCCHK_ASSERT
-+}
-+#undef NDEBUG
-+#include <assert.h>
-+static int test_acc_run_time_assert(int r) {
-+#define ACCCHK_ASSERT(expr)     assert(expr);
-+#include "acc/acc_chk.ch"
-+#undef ACCCHK_ASSERT
-+return r;
-+}
-+]], [[
-+test_acc_compile_time_assert();
-+if (test_acc_run_time_assert(1) != 1) return 1;
-+]]
-+)])
-+
-+mfx_tmp=FAILED
-+_AC_COMPILE_IFELSE([], [mfx_tmp=yes])
-+rm -f conftest.$ac_ext conftest.$ac_objext
-+
-+CPPFLAGS=$mfx_save_CPPFLAGS
-+
-+AC_MSG_RESULT([$mfx_tmp])
-+case x$mfx_tmp in
-+  xpassed | xyes) ;;
-+  *)
-+    AC_MSG_NOTICE([])
-+    AC_MSG_NOTICE([Your compiler failed the ACC conformance test - for details see ])
-+    AC_MSG_NOTICE([`config.log'. Please check that log file and consider sending])
-+    AC_MSG_NOTICE([a patch or bug-report to <${PACKAGE_BUGREPORT}>.])
-+    AC_MSG_NOTICE([Thanks for your support.])
-+    AC_MSG_NOTICE([])
-+    AC_MSG_ERROR([ACC conformance test failed. Stop.])
-+dnl    AS_EXIT
-+    ;;
-+esac
-+])# mfx_ACC_ACCCHK
-+
-+
-+# /***********************************************************************
-+# // Check for ACC_conformance
-+# ************************************************************************/
-+
-+AC_DEFUN([mfx_MINIACC_ACCCHK], [
-+mfx_tmp=$1
-+mfx_save_CPPFLAGS=$CPPFLAGS
-+dnl in Makefile.in $(INCLUDES) will be before $(CPPFLAGS), so we mimic this here
-+test "X$mfx_tmp" = "X" || CPPFLAGS="$mfx_tmp $CPPFLAGS"
-+
-+AC_MSG_CHECKING([whether your compiler passes the ACC conformance test])
-+
-+AC_LANG_CONFTEST([AC_LANG_PROGRAM(
-+[[#define ACC_CONFIG_NO_HEADER 1
-+#define ACC_WANT_ACC_INCD_H 1
-+#include $2
-+
-+#define ACC_WANT_ACC_CHK_CH 1
-+#undef ACCCHK_ASSERT
-+#define ACCCHK_ASSERT(expr)     ACC_COMPILE_TIME_ASSERT_HEADER(expr)
-+#include $2
-+
-+#define ACC_WANT_ACC_CHK_CH 1
-+#undef ACCCHK_ASSERT
-+#define ACCCHK_ASSERT(expr)     ACC_COMPILE_TIME_ASSERT(expr)
-+static void test_acc_compile_time_assert(void) {
-+#include $2
-+}
-+
-+#undef NDEBUG
-+#include <assert.h>
-+#define ACC_WANT_ACC_CHK_CH 1
-+#undef ACCCHK_ASSERT
-+#define ACCCHK_ASSERT(expr)  assert(expr);
-+static int test_acc_run_time_assert(int r) {
-+#include $2
-+return r;
-+}
-+]], [[
-+test_acc_compile_time_assert();
-+if (test_acc_run_time_assert(1) != 1) return 1;
-+]]
-+)])
-+
-+mfx_tmp=FAILED
-+_AC_COMPILE_IFELSE([], [mfx_tmp=yes])
-+rm -f conftest.$ac_ext conftest.$ac_objext
-+
-+CPPFLAGS=$mfx_save_CPPFLAGS
-+
-+AC_MSG_RESULT([$mfx_tmp])
-+case x$mfx_tmp in
-+  xpassed | xyes) ;;
-+  *)
-+    AC_MSG_NOTICE([])
-+    AC_MSG_NOTICE([Your compiler failed the ACC conformance test - for details see ])
-+    AC_MSG_NOTICE([`config.log'. Please check that log file and consider sending])
-+    AC_MSG_NOTICE([a patch or bug-report to <${PACKAGE_BUGREPORT}>.])
-+    AC_MSG_NOTICE([Thanks for your support.])
-+    AC_MSG_NOTICE([])
-+    AC_MSG_ERROR([ACC conformance test failed. Stop.])
-+dnl    AS_EXIT
-+    ;;
-+esac
-+])# mfx_MINIACC_ACCCHK
-+
-+
-+
-+# serial 1
-+
-+AC_DEFUN([mfx_PROG_CPPFLAGS], [
-+AC_MSG_CHECKING([whether the C preprocessor needs special flags])
-+
-+AC_LANG_CONFTEST([AC_LANG_PROGRAM(
-+[[#include <limits.h>
-+#if (32767 >= 4294967295ul) || (65535u >= 4294967295ul)
-+#  include "your C preprocessor is broken 1"
-+#elif (0xffffu == 0xfffffffful)
-+#  include "your C preprocessor is broken 2"
-+#elif (32767 >= ULONG_MAX) || (65535u >= ULONG_MAX)
-+#  include "your C preprocessor is broken 3"
-+#endif
-+]], [[ ]]
-+)])
-+
-+mfx_save_CPPFLAGS=$CPPFLAGS
-+mfx_tmp=ERROR
-+for mfx_arg in "" -no-cpp-precomp
-+do
-+  CPPFLAGS="$mfx_arg $mfx_save_CPPFLAGS"
-+  _AC_COMPILE_IFELSE([],
-+[mfx_tmp=$mfx_arg
-+break])
-+done
-+CPPFLAGS=$mfx_save_CPPFLAGS
-+rm -f conftest.$ac_ext conftest.$ac_objext
-+case x$mfx_tmp in
-+  x)
-+    AC_MSG_RESULT([none needed]) ;;
-+  xERROR)
-+    AC_MSG_RESULT([ERROR])
-+    AC_MSG_ERROR([your C preprocessor is broken - for details see config.log])
-+    ;;
-+  *)
-+    AC_MSG_RESULT([$mfx_tmp])
-+    CPPFLAGS="$mfx_tmp $CPPFLAGS"
-+    ;;
-+esac
-+])# mfx_PROG_CPPFLAGS
-+
-+# serial 3
-+
-+AC_DEFUN([mfx_CHECK_HEADER_SANE_LIMITS_H], [
-+AC_CACHE_CHECK([whether limits.h is sane],
-+mfx_cv_header_sane_limits_h,
-+[AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <limits.h>
-+#if (32767 >= 4294967295ul) || (65535u >= 4294967295ul)
-+#  if defined(__APPLE__) && defined(__GNUC__)
-+#    error "your preprocessor is broken - use compiler option -no-cpp-precomp"
-+#  else
-+#    include "your preprocessor is broken"
-+#  endif
-+#endif
-+#define MFX_0xffff          0xffff
-+#define MFX_0xffffffffL     4294967295ul
-+#if !defined(CHAR_BIT) || (CHAR_BIT != 8)
-+#  include "error CHAR_BIT"
-+#endif
-+#if !defined(UCHAR_MAX)
-+#  include "error UCHAR_MAX 1"
-+#endif
-+#if !defined(USHRT_MAX)
-+#  include "error USHRT_MAX 1"
-+#endif
-+#if !defined(UINT_MAX)
-+#  include "error UINT_MAX 1"
-+#endif
-+#if !defined(ULONG_MAX)
-+#  include "error ULONG_MAX 1"
-+#endif
-+#if !defined(SHRT_MAX)
-+#  include "error SHRT_MAX 1"
-+#endif
-+#if !defined(INT_MAX)
-+#  include "error INT_MAX 1"
-+#endif
-+#if !defined(LONG_MAX)
-+#  include "error LONG_MAX 1"
-+#endif
-+#if (UCHAR_MAX < 1)
-+#  include "error UCHAR_MAX 2"
-+#endif
-+#if (USHRT_MAX < 1)
-+#  include "error USHRT_MAX 2"
-+#endif
-+#if (UINT_MAX < 1)
-+#  include "error UINT_MAX 2"
-+#endif
-+#if (ULONG_MAX < 1)
-+#  include "error ULONG_MAX 2"
-+#endif
-+#if (UCHAR_MAX < 0xff)
-+#  include "error UCHAR_MAX 3"
-+#endif
-+#if (USHRT_MAX < MFX_0xffff)
-+#  include "error USHRT_MAX 3"
-+#endif
-+#if (UINT_MAX < MFX_0xffff)
-+#  include "error UINT_MAX 3"
-+#endif
-+#if (ULONG_MAX < MFX_0xffffffffL)
-+#  include "error ULONG_MAX 3"
-+#endif
-+#if (USHRT_MAX > UINT_MAX)
-+#  include "error USHRT_MAX vs UINT_MAX"
-+#endif
-+#if (UINT_MAX > ULONG_MAX)
-+#  include "error UINT_MAX vs ULONG_MAX"
-+#endif
-+]], [[
-+#if (USHRT_MAX == MFX_0xffff)
-+{ typedef char a_short2a[1 - 2 * !(sizeof(short) == 2)]; }
-+#elif (USHRT_MAX >= MFX_0xffff)
-+{ typedef char a_short2b[1 - 2 * !(sizeof(short) > 2)]; }
-+#endif
-+#if (UINT_MAX == MFX_0xffff)
-+{ typedef char a_int2a[1 - 2 * !(sizeof(int) == 2)]; }
-+#elif (UINT_MAX >= MFX_0xffff)
-+{ typedef char a_int2b[1 - 2 * !(sizeof(int) > 2)]; }
-+#endif
-+#if (ULONG_MAX == MFX_0xffff)
-+{ typedef char a_long2a[1 - 2 * !(sizeof(long) == 2)]; }
-+#elif (ULONG_MAX >= MFX_0xffff)
-+{ typedef char a_long2b[1 - 2 * !(sizeof(long) > 2)]; }
-+#endif
-+#if !defined(_CRAY1) /* CRAY PVP systems */
-+#if (USHRT_MAX == MFX_0xffffffffL)
-+{ typedef char a_short4a[1 - 2 * !(sizeof(short) == 4)]; }
-+#elif (USHRT_MAX >= MFX_0xffffffffL)
-+{ typedef char a_short4b[1 - 2 * !(sizeof(short) > 4)]; }
-+#endif
-+#endif /* _CRAY1 */
-+#if (UINT_MAX == MFX_0xffffffffL)
-+{ typedef char a_int4a[1 - 2 * !(sizeof(int) == 4)]; }
-+#elif (UINT_MAX >= MFX_0xffffffffL)
-+{ typedef char a_int4b[1 - 2 * !(sizeof(int) > 4)]; }
-+#endif
-+#if (ULONG_MAX == MFX_0xffffffffL)
-+{ typedef char a_long4a[1 - 2 * !(sizeof(long) == 4)]; }
-+#elif (ULONG_MAX >= MFX_0xffffffffL)
-+{ typedef char a_long4b[1 - 2 * !(sizeof(long) > 4)]; }
-+#endif
-+]])],
-+[mfx_cv_header_sane_limits_h=yes],
-+[mfx_cv_header_sane_limits_h=no])])
-+])
-+
-+# /***********************************************************************
-+# // standard
-+# ************************************************************************/
-+
-+AC_DEFUN([mfx_LZO_CHECK_ENDIAN], [
-+AC_C_BIGENDIAN([AC_DEFINE(LZO_ABI_BIG_ENDIAN,1,[Define to 1 if your machine is big endian.])],[AC_DEFINE(LZO_ABI_LITTLE_ENDIAN,1,[Define to 1 if your machine is little endian.])])
-+])#
-+
-+
-+# /***********************************************************************
-+# //
-+# ************************************************************************/
-+
-+dnl more types which are not yet covered by ACC
-+
-+AC_DEFUN([mfx_CHECK_SIZEOF], [
-+AC_CHECK_SIZEOF(__int32)
-+AC_CHECK_SIZEOF(intmax_t)
-+AC_CHECK_SIZEOF(uintmax_t)
-+AC_CHECK_SIZEOF(intptr_t)
-+AC_CHECK_SIZEOF(uintptr_t)
-+
-+AC_CHECK_SIZEOF(float)
-+AC_CHECK_SIZEOF(double)
-+AC_CHECK_SIZEOF(long double)
-+
-+AC_CHECK_SIZEOF(dev_t)
-+AC_CHECK_SIZEOF(fpos_t)
-+AC_CHECK_SIZEOF(mode_t)
-+AC_CHECK_SIZEOF(off_t)
-+AC_CHECK_SIZEOF(ssize_t)
-+AC_CHECK_SIZEOF(time_t)
-+])#
-+
-+
-+
-+AC_DEFUN([mfx_CHECK_LIB_WINMM], [
-+if test "X$GCC" = Xyes; then
-+case $host_os in
-+cygwin* | mingw* | pw32*)
-+     test "X$LIBS" != "X" && LIBS="$LIBS "
-+     LIBS="${LIBS}-lwinmm" ;;
-+*)
-+     ;;
-+esac
-+fi
-+])#
diff --git a/package/lzo/lzo-2.03-fix-configure-ac.patch b/package/lzo/lzo-2.03-fix-configure-ac.patch
deleted file mode 100644
index 26aece7..0000000
--- a/package/lzo/lzo-2.03-fix-configure-ac.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-_AC_SRCPATHS doesn't exist in autoconf, _AC_SRCDIRS should be used
-instead according to many reports found by Google.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: lzo-2.03/configure.ac
-===================================================================
---- lzo-2.03.orig/configure.ac
-+++ lzo-2.03/configure.ac
-@@ -48,7 +48,7 @@
- AM_MAINTAINER_MODE
- 
- if test -z "$ac_abs_top_srcdir"; then
--    _AC_SRCPATHS(.)
-+    _AC_SRCDIRS(.)
- fi
- if test -r .Conf.settings1; then
-     . ./.Conf.settings1
diff --git a/package/lzo/lzo-2.03-fix-makefile-am.patch b/package/lzo/lzo-2.03-fix-makefile-am.patch
deleted file mode 100644
index 9f23e40..0000000
--- a/package/lzo/lzo-2.03-fix-makefile-am.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Makefile.am is not allowed to override CFLAGS/CPPFLAGS, it must use
-AM_CFLAGS and AM_CPPFLAGS. This is needed in order for autoreconf to
-work on this package.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/Makefile.am |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: lzo-2.03/src/Makefile.am
-===================================================================
---- lzo-2.03.orig/src/Makefile.am
-+++ lzo-2.03/src/Makefile.am
-@@ -7,8 +7,8 @@
- SUFFIXES = .S
- 
- INCLUDES = -I$(top_srcdir)/include -I$(top_srcdir)
--CPPFLAGS = $(LZO_CPPFLAGS) $(configure_CPPFLAGS) $(LZO_EXTRA_CPPFLAGS)
--CFLAGS = $(LZO_CFLAGS) $(configure_CFLAGS) $(LZO_EXTRA_CFLAGS)
-+AM_CPPFLAGS = $(LZO_CPPFLAGS) $(configure_CPPFLAGS) $(LZO_EXTRA_CPPFLAGS)
-+AM_CFLAGS = $(LZO_CFLAGS) $(configure_CFLAGS) $(LZO_EXTRA_CFLAGS)
- 
- lib_LTLIBRARIES = liblzo2.la
- 
diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index bfa6679..d4195f6 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -3,19 +3,9 @@
 # lzo
 #
 #############################################################
-LZO_VERSION:=2.03
-LZO_SOURCE:=lzo-$(LZO_VERSION).tar.gz
-LZO_SITE:=http://www.oberhumer.com/opensource/lzo/download
-LZO_AUTORECONF = NO
-
-# lzo's configure was generated by an old autoconf, and the
-# AC_CANONICAL_TARGET check fails in host-lzo when the cache has been
-# filled with ac_cv_build and ac_cv_host.
-HOST_LZO_AUTORECONF = YES
-
+LZO_VERSION = 2.05
+LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_INSTALL_STAGING = YES
-LZO_INSTALL_TARGET = YES
-LZO_INSTALL_STAGING_OPT = CC="$(TARGET_CC)" DESTDIR=$(STAGING_DIR) install
 
 $(eval $(call AUTOTARGETS,package,lzo))
 $(eval $(call AUTOTARGETS,package,lzo,host))
-- 
1.7.3.4
