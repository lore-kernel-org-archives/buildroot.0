From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Sep 2015 23:53:04 +0200
Subject: [Buildroot] [git commit] libmng: new package
Message-ID: <20150924215452.E899F819F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ce9b533e300c71bfa4d7cd77d33e5c07b0a2c7f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                 |    1 +
 package/libmng/0001-jpeg-9a.patch |   22 ++++++++++++++++++++++
 package/libmng/Config.in          |    9 +++++++++
 package/libmng/libmng.hash        |    3 +++
 package/libmng/libmng.mk          |   22 ++++++++++++++++++++++
 5 files changed, 57 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5158371..9dff5e8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -825,6 +825,7 @@ menu "Graphics"
 	source "package/libglu/Config.in"
 	source "package/libgtk2/Config.in"
 	source "package/libgtk3/Config.in"
+	source "package/libmng/Config.in"
 	source "package/libpng/Config.in"
 	source "package/libqrencode/Config.in"
 	source "package/libraw/Config.in"
diff --git a/package/libmng/0001-jpeg-9a.patch b/package/libmng/0001-jpeg-9a.patch
new file mode 100644
index 0000000..5d65133
--- /dev/null
+++ b/package/libmng/0001-jpeg-9a.patch
@@ -0,0 +1,22 @@
+Adaptation from gentoo patch for libmng 2.0.3
+See https://bugs.gentoo.org/show_bug.cgi?id=520906
+
+Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
+
+diff -Nura libmng-2.0.3.orig/libmng_types.h libmng-2.0.3/libmng_types.h
+--- libmng-2.0.3.orig/libmng_types.h	2015-09-24 10:32:05.500984924 -0300
++++ libmng-2.0.3/libmng_types.h	2015-09-24 10:33:11.145254771 -0300
+@@ -200,13 +200,6 @@
+ #undef FAR                             /* possibly defined by zlib or lcms */
+ #endif
+ #define JPEG_INTERNAL_OPTIONS          /* for RGB_PIXELSIZE */
+-/* There has been a change in jpeg-9 : */
+-#if !defined(HAVE_BOOLEAN) && !defined(_WIN32)
+-#define HAVE_BOOLEAN
+-#endif
+-#ifndef _WIN32
+-typedef int boolean;
+-#endif
+ /* For jpegsrc.v09a: */
+ #include <stdio.h>
+ #include <jpeglib.h>
diff --git a/package/libmng/Config.in b/package/libmng/Config.in
new file mode 100644
index 0000000..a0bd59c
--- /dev/null
+++ b/package/libmng/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBMNG
+	bool "libmng"
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_ZLIB
+	help
+	  The reference library for reading, displaying, writing and
+	  examining Multiple-Image Network Graphics.
+
+	  http://sourceforge.net/projects/libmng/
diff --git a/package/libmng/libmng.hash b/package/libmng/libmng.hash
new file mode 100644
index 0000000..a695cc3
--- /dev/null
+++ b/package/libmng/libmng.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/libmng/files/libmng-devel/2.0.3/
+md5	e9e899adb1b681b17f14d91e261878c5	libmng-2.0.3.tar.xz
+sha1	0f141482ffcef6f8cd4413f945a59310ac2e49af	libmng-2.0.3.tar.xz
diff --git a/package/libmng/libmng.mk b/package/libmng/libmng.mk
new file mode 100644
index 0000000..090fe18
--- /dev/null
+++ b/package/libmng/libmng.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# libmng
+#
+################################################################################
+
+LIBMNG_VERSION = 2.0.3
+LIBMNG_SITE = http://downloads.sourceforge.net/project/libmng/libmng-devel/$(LIBMNG_VERSION)
+LIBMNG_SOURCE = libmng-$(LIBMNG_VERSION).tar.xz
+LIBMNG_DEPENDENCIES = jpeg zlib
+LIBMNG_CONF_OPTS = --without-lcms
+LIBMNG_INSTALL_STAGING = YES
+LIBMNG_LICENSE = libmng license
+LIBMNG_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+LIBMNG_DEPDENDENCIES += lcms2
+else
+LIBMNG_CONF_OPTS += --without-lcms2
+endif
+
+$(eval $(autotools-package))
