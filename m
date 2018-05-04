From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  4 May 2018 23:18:12 +0200
Subject: [Buildroot] [PATCH 1/1] libnice: bump to version 0.1.14
Message-ID: <20180504211812.11080-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Add gnutls mandatory dependency
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-configure-failure-when-building-without-.patch | 45 ----------------------
 package/libnice/Config.in                          |  7 +++-
 package/libnice/libnice.hash                       |  7 +++-
 package/libnice/libnice.mk                         |  6 +--
 4 files changed, 13 insertions(+), 52 deletions(-)
 delete mode 100644 package/libnice/0001-configure-Fix-configure-failure-when-building-without-.patch

diff --git a/package/libnice/0001-configure-Fix-configure-failure-when-building-without-.patch b/package/libnice/0001-configure-Fix-configure-failure-when-building-without-.patch
deleted file mode 100644
index f6b2eb4cb9..0000000000
--- a/package/libnice/0001-configure-Fix-configure-failure-when-building-without-.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 81a929ac141aae66b6450e8ce93cb357ed404cda Mon Sep 17 00:00:00 2001
-From: Timo Gurr <timo.gurr@gmail.com>
-Date: Mon, 1 Jun 2015 16:10:16 +0200
-Subject: [PATCH] configure: Fix configure failure when building without
- gstreamer support
-
-Error introduced in 20ea22e0a11a9bdfe4d8125b68083249b694338a, resulting in a
-configure/build error when building without gstreamer:
-
-configure: error: conditional "HAVE_GST_CHECK" was never defined.
-Usually this means the macro was only invoked conditionally.
-
-https://bugs.freedesktop.org/show_bug.cgi?id=90801
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Patch status: upstream
-
- configure.ac | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6031cec..64a571f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -231,9 +231,6 @@ AS_IF([test "$with_gstreamer" != no], [
- 		[
- 		have_gst_check=no
- 		])
--
--	AM_CONDITIONAL(HAVE_GST_CHECK, test "$have_gst_check" = yes)
--
- ])
- 
- AS_IF([test "$with_gstreamer010" != no], [
-@@ -260,6 +257,7 @@ AC_SUBST(gstplugindir)
- AC_SUBST(gstplugin010dir)
- 
- AM_CONDITIONAL(WITH_GSTREAMER, test "$with_gstreamer" = yes)
-+AM_CONDITIONAL(HAVE_GST_CHECK, test "$have_gst_check" = yes)
- AM_CONDITIONAL(WITH_GSTREAMER010, test "$with_gstreamer010" = yes)
- 
- GUPNP_IGD_REQUIRED=0.2.4
--- 
-2.10.2
-
diff --git a/package/libnice/Config.in b/package/libnice/Config.in
index c803a31720..af8e814618 100644
--- a/package/libnice/Config.in
+++ b/package/libnice/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_LIBNICE
 	bool "libnice"
+	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Libnice is an implementation of the IETF's Interactive
@@ -15,6 +17,7 @@ config BR2_PACKAGE_LIBNICE
 
 	  http://nice.freedesktop.org/wiki/
 
-comment "libnice needs a toolchain w/ wchar, threads"
+comment "libnice needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/libnice/libnice.hash b/package/libnice/libnice.hash
index d08c2d7839..3c1f0d845a 100644
--- a/package/libnice/libnice.hash
+++ b/package/libnice/libnice.hash
@@ -1,2 +1,7 @@
 # Locally computed after checking pgp signature
-sha256 61112d9f3be933a827c8365f20551563953af6718057928f51f487bfe88419e1 libnice-0.1.13.tar.gz
+sha256 be120ba95d4490436f0da077ffa8f767bf727b82decf2bf499e39becc027809c libnice-0.1.14.tar.gz
+
+# Hash for license files:
+sha256 9246b2ee8b1db30cf03d5d9719ad8bb5edce1cadc85f8cfef319c23d24d950b5 COPYING
+sha256 3b3c75ae6c663c4f93987647eb5463d33dc1602a1aded3ac479773f2c3928e3a COPYING.MPL
+sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861 COPYING.LGPL
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index 6afcb7635a..e023728f44 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LIBNICE_VERSION = 0.1.13
+LIBNICE_VERSION = 0.1.14
 LIBNICE_SITE = http://nice.freedesktop.org/releases
 LIBNICE_LICENSE = MPL-1.1 or LGPL-2.1
 LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
-LIBNICE_DEPENDENCIES = libglib2 host-pkgconf
+LIBNICE_DEPENDENCIES = gnutls libglib2 host-pkgconf
 LIBNICE_INSTALL_STAGING = YES
-# For 0001-configure-Fix-configure-failure-when-building-without-.patch
-LIBNICE_AUTORECONF = YES
 LIBNICE_CONF_OPTS = \
 	--without-gstreamer \
 	--without-gstreamer-0.10
-- 
2.14.1
