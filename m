From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon,  5 Jan 2015 15:05:47 +0100
Subject: [Buildroot] [PATCH 1/2] package/shairport-sync: bump to version
	2.1.15
Message-ID: <1420466748-6155-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 .../0001-fix-static-link-openssl.patch             | 41 ----------------------
 .../shairport-sync/0002-fix-static-link-alsa.patch | 27 --------------
 .../shairport-sync/0003-fix-static-link-popt.patch | 25 -------------
 package/shairport-sync/shairport-sync.mk           |  2 +-
 4 files changed, 1 insertion(+), 94 deletions(-)
 delete mode 100644 package/shairport-sync/0001-fix-static-link-openssl.patch
 delete mode 100644 package/shairport-sync/0002-fix-static-link-alsa.patch
 delete mode 100644 package/shairport-sync/0003-fix-static-link-popt.patch

diff --git a/package/shairport-sync/0001-fix-static-link-openssl.patch b/package/shairport-sync/0001-fix-static-link-openssl.patch
deleted file mode 100644
index 8245b89..0000000
--- a/package/shairport-sync/0001-fix-static-link-openssl.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-configure: fix static link with openssl
-
-Use pkg-config to find openssl libraries, that will return all the
-dependent libraries of openssl as well (e.g. -lz) that can not be
-deduced in case of a static link.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Patch applied upstream:
-    https://github.com/mikebrady/shairport-sync/commit/2a430ec434674ed8c1959698c061662bb7abc1a1
-
-diff -durN shairport-sync-2.1.8.orig/configure.ac shairport-sync-2.1.8/configure.ac
---- shairport-sync-2.1.8.orig/configure.ac	2014-10-25 18:03:13.000000000 +0200
-+++ shairport-sync-2.1.8/configure.ac	2014-11-29 12:52:41.507981720 +0100
-@@ -21,6 +21,8 @@
- AC_PROG_CC
- AC_PROG_INSTALL
- 
-+PKG_PROG_PKG_CONFIG([0.9.0])
-+
- # Checks for libraries.
- if test "x${with_os_type}" = xlinux; then
-  AC_CHECK_LIB([rt],[clock_gettime], , AC_MSG_ERROR(librt needed))
-@@ -52,8 +56,14 @@
-     AC_MSG_ERROR(choose either "openssl" or "polarssl" encryption)
-   fi
-   if test "x${with_ssl}" = xopenssl ; then
--    AC_CHECK_LIB([crypto], [MD5_Init], , AC_MSG_ERROR(libcrypto selected, but the library cannot be found!))
--    AC_CHECK_LIB([ssl],[SSL_library_init], , AC_MSG_ERROR(openssl selected but the library cannot be found!))
-+    PKG_CHECK_MODULES(
-+        [CRYPTO], [libcrypto],
-+        [LIBS="${CRYPTO_LIBS} ${LIBS}"
-+         AC_DEFINE([HAVE_LIBCRYPTO],[1],[Define to 1 if you have libcrypto])])
-+    PKG_CHECK_MODULES(
-+        [SSL], [libssl],
-+        [LIBS="${SSL_LIBS} ${LIBS}"
-+         AC_DEFINE([HAVE_LIBSSL],[1],[Define to 1 if you have libssl])])
-   elif test "x${with_ssl}" = xpolarssl ; then
-     AC_CHECK_LIB([polarssl],[ssl_init], , AC_MSG_ERROR(PolarSSL selected but the library cannot be found!))
-   else
diff --git a/package/shairport-sync/0002-fix-static-link-alsa.patch b/package/shairport-sync/0002-fix-static-link-alsa.patch
deleted file mode 100644
index 101ce14..0000000
--- a/package/shairport-sync/0002-fix-static-link-alsa.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-configure: fix static link with alsa
-
-Use pkg-config to find the alsa library, that will return all the
-dependent libraries of alsa (e.g. -ldl -lpthread -lrt) as well that
-can not be deduced in case of a static link.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Patch applied upstream:
-    https://github.com/mikebrady/shairport-sync/commit/e5a74a3ff08134a2b11f07bd850659d7816fb03d
-
-diff -durN shairport-sync-2.1.8.orig/configure.ac shairport-sync-2.1.8/configure.ac
---- shairport-sync-2.1.8.orig/configure.ac	2014-11-29 12:56:11.954118681 +0100
-+++ shairport-sync-2.1.8/configure.ac	2014-11-29 13:07:24.941687600 +0100
-@@ -99,7 +99,10 @@
-   HAS_ALSA=1
-   AM_CONDITIONAL([USE_ALSA], [test 0])
-   AC_DEFINE([CONFIG_ALSA], 1, [Needed by the compiler.])
--  AC_CHECK_LIB([asound], [snd_pcm_open], , AC_MSG_ERROR(ALSA support requires the asound library!))], )
-+  PKG_CHECK_MODULES(
-+    [ALSA], [alsa],
-+    [LIBS="${ALSA_LIBS} ${LIBS}"
-+     AC_DEFINE([HAVE_LIBASOUND],[1],[Define to 1 if you have ALSA])])])
- AM_CONDITIONAL([USE_ALSA], [test "x$HAS_ALSA" = "x1"])
- 
- # Look for SNDIO flag
diff --git a/package/shairport-sync/0003-fix-static-link-popt.patch b/package/shairport-sync/0003-fix-static-link-popt.patch
deleted file mode 100644
index fe4d8f6..0000000
--- a/package/shairport-sync/0003-fix-static-link-popt.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-configure: fix static link with popt
-
-Use pkg-config to find the popt library.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Patch applied upstream:
-    https://github.com/mikebrady/shairport-sync/commit/1f759e57e8c0682613eaaf89a46fdf6db4c6b5cd
-
-diff -durN shairport-sync-2.1.8.orig/configure.ac shairport-sync-2.1.8/configure.ac
---- shairport-sync-2.1.8.orig/configure.ac	2014-11-29 14:14:36.655955733 +0100
-+++ shairport-sync-2.1.8/configure.ac	2014-11-29 14:16:21.072719327 +0100
-@@ -31,7 +31,10 @@
- AC_CHECK_LIB([daemon],[daemon_log], , AC_MSG_ERROR(libdaemon needed))
- AC_CHECK_LIB([pthread],[pthread_create], , AC_MSG_ERROR(pthread library needed))
- AC_CHECK_LIB([m],[exp], , AC_MSG_ERROR(maths library needed))
--AC_CHECK_LIB([popt],[poptGetContext], , AC_MSG_ERROR(libpopt needed))
-+PKG_CHECK_MODULES(
-+    [POPT], [popt],
-+    [LIBS="${POPT_LIBS} ${LIBS}"
-+     AC_DEFINE([HAVE_LIBPOPT],[1],[Define to 1 if you have popt])])
- 
- # Look for piddir flag
- AC_ARG_WITH(piddir, [ --with-piddir=<pathname> Specify a pathname to a directory in which to write the PID file.], [
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 39017a0..9f3c0f0 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 2.1.11
+SHAIRPORT_SYNC_VERSION = 2.1.15
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
-- 
2.2.1
