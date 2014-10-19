From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 18:47:49 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/beecrypt: Fix build with
	BR2_ENABLE_DEBUG=yes, no need for expert mode anymore
Message-ID: <1413737269-24583-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/d32/d326799e9b1a959778be66e36ee78e6891a7b068/
http://autobuild.buildroot.net/results/b35/b353696a01ae85ad0b0c379364aaa9224e0bde42/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: - backport the complete Gentoo patch to respect buildroot-provided CFLAGS
    - disable expert mode, not needed anymore

 package/beecrypt/beecrypt-0003-build-system.patch |  173 +++++++++++++++++++++
 package/beecrypt/beecrypt.mk                      |    1 +
 2 files changed, 174 insertions(+)
 create mode 100644 package/beecrypt/beecrypt-0003-build-system.patch

diff --git a/package/beecrypt/beecrypt-0003-build-system.patch b/package/beecrypt/beecrypt-0003-build-system.patch
new file mode 100644
index 0000000..0574689
--- /dev/null
+++ b/package/beecrypt/beecrypt-0003-build-system.patch
@@ -0,0 +1,173 @@
+Fix build with BR2_ENABLE_DEBUG=yes, no need for expert mode anymore
+
+Otherwise configure issues this error message:
+configure: error: --enable-debug cannot be used in conjunction with --enable-expert-mode
+
+Downloaded from Gentoo:
+http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/beecrypt/files/beecrypt-4.2.1-build-system.patch?revision=1.2&view=markup
+
+This patch also removes the hard-coded CFLAGS provided by beecrypt in favour
+of the CFLAGS provided by buildroot.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- beecrypt-4.2.1/configure.ac
++++ beecrypt-4.2.1/configure.ac
+@@ -11,7 +11,7 @@
+ 
+ # Checks for package options
+ AC_ARG_ENABLE(expert-mode, [  --enable-expert-mode      follow user-defined CFLAGS settings [[default=no]]],[
+-  ac_enable_expert_mode=yes
++  ac_enable_expert_mode=$enableval
+   ],[
+   if test "X$CFLAGS" != "X"; then
+     echo "enabling expert mode"
+@@ -25,7 +25,7 @@
+   if test "$ac_enable_expert_mode" = yes; then
+     AC_MSG_ERROR([--enable-debug cannot be used in conjunction with --enable-expert-mode])
+   fi
+-  ac_enable_debug=yes
++  ac_enable_debug=$enableval
+   ],[
+   ac_enable_debug=no
+   ])
+@@ -456,7 +456,7 @@
+       ac_cv_python_include="-I`$PYTHON -c 'import distutils.sysconfig; print distutils.sysconfig.get_python_inc()'`"
+     ])
+     AC_CACHE_CHECK([where to install python libraries], ac_cv_python_libdir, [
+-      ac_cv_python_libdir=`$PYTHON -c 'import distutils.sysconfig; print distutils.sysconfig.get_python_lib()'`
++      ac_cv_python_libdir=`$PYTHON -c 'import distutils.sysconfig; print distutils.sysconfig.get_python_lib(1, 0)'`
+     ])
+   fi
+ fi
+--- beecrypt-4.2.1/acinclude.m4
++++ beecrypt-4.2.1/acinclude.m4
+@@ -498,15 +498,6 @@ AC_DEFUN([BEE_GNU_CC],[
+     AC_SUBST(OPENMP_LIBS,"-lgomp")
+   fi
+   case $bc_target_arch in
+-  x86_64 | athlon64 | athlon-fx | k8 | opteron | em64t | nocona)
+-    CC="$CC -m64"
+-    ;;
+-  i[[3456]]86 | \
+-  pentium* | \
+-  athlon*)
+-    CC="$CC -m32"
+-    CCAS="$CCAS -m32"
+-    ;;
+   ia64)
+     case $target_os in
+     # HP/UX on Itanium needs to be told that a long is 64-bit!
+@@ -525,17 +516,8 @@ AC_DEFUN([BEE_GNU_CC],[
+     aix*)
+       CC="$CC -maix64"
+       ;;
+-    linux*)
+-      CC="$CC -m64"
+-      ;;
+     esac
+     ;;
+-  sparc | sparcv8*)
+-    CC="$CC -m32"
+-    ;;
+-  sparc64 | sparcv9*)
+-    CC="$CC -m64"
+-    ;;
+   esac
+   # Certain platforms needs special flags for multi-threaded code
+   if test "$ac_enable_threads" = yes; then
+@@ -646,14 +646,6 @@ dnl  BEE_GNU_CXX
+ AC_DEFUN([BEE_GNU_CXX],[
+   AC_REQUIRE([AC_PROG_CXX])
+   case $bc_target_arch in
+-  x86_64 | athlon64 | athlon-fx | k8 | opteron | em64t | nocona | core2)
+-    CXX="$CXX -m64"
+-    ;;
+-  i[[3456]]86 | \
+-  pentium* | \
+-  athlon*)
+-    CXX="$CXX -m32"
+-    ;;
+   ia64)
+     case $target_os in
+     # HP/UX on Itanium needs to be told that a long is 64-bit!
+@@ -672,17 +664,8 @@ AC_DEFUN([BEE_GNU_CXX],[
+     aix*)
+       CXX="$CXX -maix64"
+       ;;
+-    linux*)
+-      CXX="$CXX -m64"
+-      ;;
+     esac
+     ;;
+-  sparc | sparcv8*)
+-    CXX="$CXX -m32"
+-    ;;
+-  sparc64 | sparcv9*)
+-    CXX="$CXX -m64"
+-    ;;
+   esac
+   # Certain platforms needs special flags for multi-threaded code
+   if test "$ac_enable_threads" = yes; then
+--- beecrypt-4.2.1/java/Makefile.am
++++ beecrypt-4.2.1/java/Makefile.am
+@@ -26,7 +26,7 @@
+ 
+ INCLUDES = -I$(top_srcdir)/include
+ 
+-libaltdir=$(prefix)/lib at LIBALT@
++libaltdir=$(libdir)
+ 
+ libalt_LTLIBRARIES = libbeecrypt_java.la
+ 
+--- beecrypt-4.2.1/acinclude.m4
++++ beecrypt-4.2.1/acinclude.m4
+@@ -1589,20 +1589,5 @@
+   AC_SUBST(TYPEDEF_BC_THREADID_T,$bc_typedef_bc_threadid_t)
+   ])
+-
+-AH_BOTTOM([
+-#if ENABLE_THREADS
+-# ifndef _REENTRANT
+-#  define _REENTRANT
+-# endif
+-# if LINUX
+-#  define _LIBC_REENTRANT
+-# endif
+-#else
+-# ifdef _REENTRANT
+-#  undef _REENTRANT
+-# endif
+-#endif
+-])
+ 
+ 
+ dnl  BEE_THREAD_LOCAL_STORAGE
+@@ -1623,7 +1609,5 @@
+   ])
+ 
+ AH_BOTTOM([
+-#if !ENABLE_THREAD_LOCAL_STORAGE
+-# define __thread
+-#endif
++#include "config.threads.h"
+ ])
+--- beecrypt-4.2.1/config.threads.h
++++ beecrypt-4.2.1/config.threads.h
+@@ -0,0 +1,16 @@
++#if ENABLE_THREADS
++# ifndef _REENTRANT
++#  define _REENTRANT
++# endif
++# if LINUX
++#  define _LIBC_REENTRANT
++# endif
++#else
++# ifdef _REENTRANT
++#  undef _REENTRANT
++# endif
++#endif
++
++#if !ENABLE_THREAD_LOCAL_STORAGE
++# define __thread
++#endif
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index 7a2511d..e9e701b 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -18,6 +18,7 @@ BEECRYPT_CONF_ENV = \
 	CXXFLAGS="$(TARGET_CXXFLAGS) -fpermissive"
 
 BEECRYPT_CONF_OPTS = \
+		--disable-expert-mode \
 		--without-java \
 		--without-python \
 		--disable-openmp
-- 
1.7.10.4
