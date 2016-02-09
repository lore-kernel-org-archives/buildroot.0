From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  9 Feb 2016 21:53:30 +0100
Subject: [Buildroot] [PATCH v2] valgrind: fix musl compile
Message-ID: <1455051210-20712-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add musl libc detection (based on suggestions by Romain Naour and
Arnout Vandecappelle) and add some tweaks for musl support (based
on OpenWRT patch [1]).

Fixes ([2]):
  checking the glibc version... unsupported version
  configure: error: Valgrind requires glibc version 2.2 or later

Patch suggested upstream (see [3]).

[1] https://dev.openwrt.org/browser/trunk/package/devel/valgrind/patches/200-musl_fix.patch?rev=46302
[2] http://autobuild.buildroot.org/results/7b0/7b048ba58918f0a08498c61327fcf35a85a84837
[3] https://bugs.kde.org/show_bug.cgi?id=359202

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - add proper musl libc detection (suggested by Romain Naour and
    Arnout Vandecappelle)
---
 package/valgrind/0004-Fixes-for-musl-libc.patch | 98 +++++++++++++++++++++++++
 package/valgrind/valgrind.mk                    |  3 +
 2 files changed, 101 insertions(+)
 create mode 100644 package/valgrind/0004-Fixes-for-musl-libc.patch

diff --git a/package/valgrind/0004-Fixes-for-musl-libc.patch b/package/valgrind/0004-Fixes-for-musl-libc.patch
new file mode 100644
index 0000000..54c2b93
--- /dev/null
+++ b/package/valgrind/0004-Fixes-for-musl-libc.patch
@@ -0,0 +1,98 @@
+From d096693009d951e9e235a880db906b0dfcdd5733 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 31 Oct 2015 19:45:04 +0100
+Subject: [PATCH] Fixes for musl libc.
+
+- add musl libc detection (prevents configure error)
+- adjust preload and symbol names (based on the OpenWrt
+  patch, see [1])
+
+[1] https://dev.openwrt.org/browser/trunk/package/devel/valgrind/patches/200-musl_fix.patch?rev=46302
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac             | 14 +++++++++++++-
+ coregrind/vg_preloaded.c |  2 +-
+ include/pub_tool_redir.h |  9 ++++++++-
+ 3 files changed, 22 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8ab7f9b..e9d71cd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1009,6 +1009,13 @@ if test x$VGCONF_PLATFORM_PRI_CAPS = xX86_SOLARIS \
+     GLIBC_VERSION="solaris"
+ fi
+ 
++# GLIBC_VERSION is empty if a musl libc is used, so use the toolchain tuple
++# in this case.
++if test x$GLIBC_VERSION = x; then
++    if $CC -dumpmachine | grep -q musl; then
++        GLIBC_VERSION=musl
++    fi
++fi
+ 
+ AC_MSG_CHECKING([the glibc version])
+ 
+@@ -1064,10 +1071,15 @@ case "${GLIBC_VERSION}" in
+ 	# DEFAULT_SUPP set in host_os switch-case above.
+ 	# No other suppression file is used.
+ 	;;
++     musl)
++	AC_MSG_RESULT(Musl)
++	AC_DEFINE([MUSL_LIBC], 1, [Define to 1 if you're using Musl libc])
++	# no DEFAULT_SUPP file yet for musl libc.
++	;;
+      2.0|2.1|*)
+ 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
+ 	AC_MSG_ERROR([Valgrind requires glibc version 2.2 or later,])
+-	AC_MSG_ERROR([Darwin libc, Bionic libc or Solaris libc])
++	AC_MSG_ERROR([musl libc, Darwin libc, Bionic libc or Solaris libc])
+ 	;;
+ esac
+ 
+diff --git a/coregrind/vg_preloaded.c b/coregrind/vg_preloaded.c
+index 2ea7a7a..e49c832 100644
+--- a/coregrind/vg_preloaded.c
++++ b/coregrind/vg_preloaded.c
+@@ -56,7 +56,7 @@
+ void VG_NOTIFY_ON_LOAD(freeres)( void );
+ void VG_NOTIFY_ON_LOAD(freeres)( void )
+ {
+-#  if !defined(__UCLIBC__) \
++#  if !defined(__UCLIBC__) && defined(__GLIBC__) \
+       && !defined(VGPV_arm_linux_android) \
+       && !defined(VGPV_x86_linux_android) \
+       && !defined(VGPV_mips32_linux_android) \
+diff --git a/include/pub_tool_redir.h b/include/pub_tool_redir.h
+index bac00d7..b8cd97e 100644
+--- a/include/pub_tool_redir.h
++++ b/include/pub_tool_redir.h
+@@ -242,8 +242,11 @@
+ /* --- Soname of the standard C library. --- */
+ 
+ #if defined(VGO_linux) || defined(VGO_solaris)
++# if defined(__GLIBC__) || defined(__UCLIBC__)
+ #  define  VG_Z_LIBC_SONAME  libcZdsoZa              // libc.so*
+-
++#else
++#  define  VG_Z_LIBC_SONAME  libcZdZa              // libc.*
++#endif
+ #elif defined(VGO_darwin) && (DARWIN_VERS <= DARWIN_10_6)
+ #  define  VG_Z_LIBC_SONAME  libSystemZdZaZddylib    // libSystem.*.dylib
+ 
+@@ -274,7 +277,11 @@
+ /* --- Soname of the pthreads library. --- */
+ 
+ #if defined(VGO_linux)
++# if defined(__GLIBC__) || defined(__UCLIBC__)
+ #  define  VG_Z_LIBPTHREAD_SONAME  libpthreadZdsoZd0     // libpthread.so.0
++#else
++#  define  VG_Z_LIBPTHREAD_SONAME  libcZdZa              // libc.*
++#endif
+ #elif defined(VGO_darwin)
+ #  define  VG_Z_LIBPTHREAD_SONAME  libSystemZdZaZddylib  // libSystem.*.dylib
+ #elif defined(VGO_solaris)
+-- 
+2.1.4
+
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 5849b49..46ba13e 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -12,6 +12,9 @@ VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
 VALGRIND_CONF_OPTS = --disable-ubsan
 VALGRIND_INSTALL_STAGING = YES
 
+# patch 0004-Fixes-for-musl-libc.patch touching configure.ac
+VALGRIND_AUTORECONF = YES
+
 ifeq ($(BR2_GCC_ENABLE_TLS),y)
 VALGRIND_CONF_OPTS += --enable-tls
 else
-- 
2.1.4
