From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 15 Apr 2018 22:22:41 +0200
Subject: [Buildroot] [PATCH v1] valgrind: bump version to 3.13.0
Message-ID: <20180415202241.13595-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- update site
- remove 0004-Fixes-for-musl-libc.patch (applied upstream, see [1])

[1] https://sourceware.org/git/?p=valgrind.git;a=commit;h=f8f1e9cb434cc97ce16586437407a6ac7e6a74a7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/valgrind/0004-Fixes-for-musl-libc.patch | 99 -------------------------
 package/valgrind/valgrind.hash                  |  2 +-
 package/valgrind/valgrind.mk                    |  4 +-
 3 files changed, 3 insertions(+), 102 deletions(-)
 delete mode 100644 package/valgrind/0004-Fixes-for-musl-libc.patch

diff --git a/package/valgrind/0004-Fixes-for-musl-libc.patch b/package/valgrind/0004-Fixes-for-musl-libc.patch
deleted file mode 100644
index d543728ac5..0000000000
--- a/package/valgrind/0004-Fixes-for-musl-libc.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 50859f3577418cc42f76e1319e699202a615bbe1 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sat, 31 Oct 2015 19:45:04 +0100
-Subject: [PATCH] Fixes for musl libc.
-
-- add musl libc detection (prevents configure error)
-- adjust preload and symbol names (based on the OpenWrt
-  patch, see [1])
-
-[1] https://dev.openwrt.org/browser/trunk/package/devel/valgrind/patches/200-musl_fix.patch?rev=46302
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure.ac             | 16 ++++++++++++++--
- coregrind/vg_preloaded.c |  2 +-
- include/pub_tool_redir.h |  9 ++++++++-
- 3 files changed, 23 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 8ab7f9b..e865bf5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1009,6 +1009,13 @@ if test x$VGCONF_PLATFORM_PRI_CAPS = xX86_SOLARIS \
-     GLIBC_VERSION="solaris"
- fi
- 
-+# GLIBC_VERSION is empty if a musl libc is used, so use the toolchain tuple
-+# in this case.
-+if test x$GLIBC_VERSION = x; then
-+    if $CC -dumpmachine | grep -q musl; then
-+        GLIBC_VERSION=musl
-+    fi
-+fi
- 
- AC_MSG_CHECKING([the glibc version])
- 
-@@ -1064,10 +1071,15 @@ case "${GLIBC_VERSION}" in
- 	# DEFAULT_SUPP set in host_os switch-case above.
- 	# No other suppression file is used.
- 	;;
-+     musl)
-+	AC_MSG_RESULT(Musl)
-+	AC_DEFINE([MUSL_LIBC], 1, [Define to 1 if you're using Musl libc])
-+	# no DEFAULT_SUPP file yet for musl libc.
-+	;;
-      2.0|2.1|*)
- 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
--	AC_MSG_ERROR([Valgrind requires glibc version 2.2 or later,])
--	AC_MSG_ERROR([Darwin libc, Bionic libc or Solaris libc])
-+	AC_MSG_ERROR([Valgrind requires glibc version 2.2 or later, uClibc,])
-+	AC_MSG_ERROR([musl libc, Darwin libc, Bionic libc or Solaris libc])
- 	;;
- esac
- 
-diff --git a/coregrind/vg_preloaded.c b/coregrind/vg_preloaded.c
-index 2ea7a7a..7b51aba 100644
---- a/coregrind/vg_preloaded.c
-+++ b/coregrind/vg_preloaded.c
-@@ -56,7 +56,7 @@
- void VG_NOTIFY_ON_LOAD(freeres)( void );
- void VG_NOTIFY_ON_LOAD(freeres)( void )
- {
--#  if !defined(__UCLIBC__) \
-+#  if !defined(__UCLIBC__) && !defined(MUSL_LIBC) \
-       && !defined(VGPV_arm_linux_android) \
-       && !defined(VGPV_x86_linux_android) \
-       && !defined(VGPV_mips32_linux_android) \
-diff --git a/include/pub_tool_redir.h b/include/pub_tool_redir.h
-index bac00d7..babcf9a 100644
---- a/include/pub_tool_redir.h
-+++ b/include/pub_tool_redir.h
-@@ -242,8 +242,11 @@
- /* --- Soname of the standard C library. --- */
- 
- #if defined(VGO_linux) || defined(VGO_solaris)
-+# if defined(MUSL_LIBC)
-+#  define  VG_Z_LIBC_SONAME  libcZdZa              // libc.*
-+#else
- #  define  VG_Z_LIBC_SONAME  libcZdsoZa              // libc.so*
--
-+#endif
- #elif defined(VGO_darwin) && (DARWIN_VERS <= DARWIN_10_6)
- #  define  VG_Z_LIBC_SONAME  libSystemZdZaZddylib    // libSystem.*.dylib
- 
-@@ -274,7 +277,11 @@
- /* --- Soname of the pthreads library. --- */
- 
- #if defined(VGO_linux)
-+# if defined(MUSL_LIBC)
-+#  define  VG_Z_LIBPTHREAD_SONAME  libcZdZa              // libc.*
-+#else
- #  define  VG_Z_LIBPTHREAD_SONAME  libpthreadZdsoZd0     // libpthread.so.0
-+#endif
- #elif defined(VGO_darwin)
- #  define  VG_Z_LIBPTHREAD_SONAME  libSystemZdZaZddylib  // libSystem.*.dylib
- #elif defined(VGO_solaris)
--- 
-2.1.4
-
diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 5d7da19a86..8f3dbcb04e 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,2 +1,2 @@
 # From http://valgrind.org/downloads/current.html
-md5 6eb03c0c10ea917013a7622e483d61bb valgrind-3.12.0.tar.bz2
+md5 817dd08f1e8a66336b9ff206400a5369 valgrind-3.13.0.tar.bz2
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 32aeb97cee..2be96da9c8 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.12.0
-VALGRIND_SITE = http://valgrind.org/downloads
+VALGRIND_VERSION = 3.13.0
+VALGRIND_SITE = ftp://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
-- 
2.16.3
