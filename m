From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 26 Jan 2016 20:46:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/valgrind: Fix musl build
Message-ID: <1453837585-4799-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/bd8/bd85f48823e1acd590dcfc00ba7d2e53d837d154/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/valgrind/0004-musl.patch | 51 ++++++++++++++++++++++++++++++++++++++++
 package/valgrind/valgrind.mk     |  2 ++
 2 files changed, 53 insertions(+)
 create mode 100644 package/valgrind/0004-musl.patch

diff --git a/package/valgrind/0004-musl.patch b/package/valgrind/0004-musl.patch
new file mode 100644
index 0000000..e1eb0a9
--- /dev/null
+++ b/package/valgrind/0004-musl.patch
@@ -0,0 +1,51 @@
+Fix musl build
+
+Patch suggested by Thomas: http://patchwork.ozlabs.org/patch/538683/
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -upr valgrind-3.11.0.orig/configure.ac valgrind-3.11.0/configure.ac
+--- valgrind-3.11.0.orig/configure.ac	2015-10-03 02:28:18.597612716 +0200
++++ valgrind-3.11.0/configure.ac	2015-10-03 02:28:49.284502749 +0200
+@@ -1066,8 +1066,6 @@ case "${GLIBC_VERSION}" in
+ 	;;
+      2.0|2.1|*)
+ 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
+-	AC_MSG_ERROR([Valgrind requires glibc version 2.2 or later,])
+-	AC_MSG_ERROR([Darwin libc, Bionic libc or Solaris libc])
+ 	;;
+ esac
+ 
+diff -upr valgrind-3.11.0.orig/coregrind/vg_preloaded.c valgrind-3.11.0/coregrind/vg_preloaded.c
+--- valgrind-3.11.0.orig/coregrind/vg_preloaded.c	2015-10-03 02:28:18.367636023 +0200
++++ valgrind-3.11.0/coregrind/vg_preloaded.c	2015-10-03 02:28:37.745672152 +0200
+@@ -56,7 +56,7 @@
+ void VG_NOTIFY_ON_LOAD(freeres)( void );
+ void VG_NOTIFY_ON_LOAD(freeres)( void )
+ {
+-#  if !defined(__UCLIBC__) \
++#  if defined(__GLIBC__) \
+       && !defined(VGPV_arm_linux_android) \
+       && !defined(VGPV_x86_linux_android) \
+       && !defined(VGPV_mips32_linux_android) \
+diff -upr valgrind-3.11.0.orig/include/pub_tool_redir.h valgrind-3.11.0/include/pub_tool_redir.h
+--- valgrind-3.11.0.orig/include/pub_tool_redir.h	2015-10-03 02:28:18.304309107 +0200
++++ valgrind-3.11.0/include/pub_tool_redir.h	2015-10-03 02:28:37.745672152 +0200
+@@ -242,7 +242,7 @@
+ /* --- Soname of the standard C library. --- */
+ 
+ #if defined(VGO_linux) || defined(VGO_solaris)
+-#  define  VG_Z_LIBC_SONAME  libcZdsoZa              // libc.so*
++#  define  VG_Z_LIBC_SONAME  libcZdZa                // libc.*
+ 
+ #elif defined(VGO_darwin) && (DARWIN_VERS <= DARWIN_10_6)
+ #  define  VG_Z_LIBC_SONAME  libSystemZdZaZddylib    // libSystem.*.dylib
+@@ -274,7 +274,7 @@
+ /* --- Soname of the pthreads library. --- */
+ 
+ #if defined(VGO_linux)
+-#  define  VG_Z_LIBPTHREAD_SONAME  libpthreadZdsoZd0     // libpthread.so.0
++#  define  VG_Z_LIBPTHREAD_SONAME  libcZdZa              // libc.*
+ #elif defined(VGO_darwin)
+ #  define  VG_Z_LIBPTHREAD_SONAME  libSystemZdZaZddylib  // libSystem.*.dylib
+ #elif defined(VGO_solaris)
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 5849b49..efdd602 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -9,6 +9,8 @@ VALGRIND_SITE = http://valgrind.org/downloads
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPLv2 GFDLv1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
+# we patch configure.ac in 0004-musl.patch
+VALGRIND_AUTORECONF = YES
 VALGRIND_CONF_OPTS = --disable-ubsan
 VALGRIND_INSTALL_STAGING = YES
 
-- 
2.7.0.rc3
