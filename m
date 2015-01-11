From: Steve Kenton <skenton@ou.edu>
Date: Sun, 11 Jan 2015 12:49:25 -0600
Subject: [Buildroot] [PATCH] libpng: add  libpng12
Message-ID: <54B2C5B5.4070703@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some programs still link using the legacy -lpng12 version
of libpng for handling PNG (Portable Network Graphics)
images. It is still maintained for security fixes so
make it available.

http://www.libpng.org

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
---
The png support in freetype uses libpng v1.2 instead of v1.6.
Currently freetype is configured without png support but another
package I am investigating wants it, so here is a patch to enable it.
I copied and modified the files from libpng and do not know if the
arm specific option is needed for v1.2 since I'm only using x86.

diff -pruN buildroot.ori/package/Config.in buildroot/package/Config.in
--- buildroot.ori/package/Config.in	2015-01-09 15:52:22.000000000 -0600
+++ buildroot/package/Config.in	2015-01-11 12:38:37.399803185 -0600
@@ -681,6 +681,7 @@ menu "Graphics"
 	source "package/libgtk2/Config.in"
 	source "package/libgtk3/Config.in"
 	source "package/libpng/Config.in"
+	source "package/libpng12/Config.in"
 	source "package/libqrencode/Config.in"
 	source "package/libraw/Config.in"
 	source "package/librsvg/Config.in"
diff -pruN buildroot.ori/package/libpng12/Config.in buildroot/package/libpng12/Config.in
--- buildroot.ori/package/libpng12/Config.in	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/libpng12/Config.in	2015-01-11 12:28:26.115791459 -0600
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBPNG12
+	bool "libpng12"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Some programs still link using the legacy -lpng12 version
+	  of libpng for handling PNG (Portable Network Graphics)
+	  images. It is still maintained for security fixes so
+	  make it available, but do not select this unless you
+	  have an application that explicitly needs the older
+	  libpng12 functionality. Use libpng instead.
+
+	  http://www.libpng.org/
diff -pruN buildroot.ori/package/libpng12/libpng.mk buildroot/package/libpng12/libpng.mk
--- buildroot.ori/package/libpng12/libpng.mk	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/libpng12/libpng.mk	2015-01-11 12:33:28.495797259 -0600
@@ -0,0 +1,19 @@
+################################################################################
+#
+# libpng12
+#
+################################################################################
+
+LIBPNG12_VERSION = 1.2.52
+LIBPNG12_SERIES = 12
+LIBPNG12_SOURCE = libpng-$(LIBPNG12_VERSION).tar.xz
+LIBPNG12_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG12_SERIES}/$(LIBPNG12_VERSION)
+LIBPNG12_LICENSE = libpng license
+LIBPNG12_LICENSE_FILES = LICENSE
+LIBPNG12_INSTALL_STAGING = YES
+LIBPNG12_DEPENDENCIES = host-pkgconf zlib
+LIBPNG12_CONFIG_SCRIPTS = libpng$(LIBPNG12_SERIES)-config libpng-config
+LIBPNG12_CONF_OPTS = $(if $(BR2_ARM_CPU_HAS_NEON),--enable-arm-neon=yes,--enable-arm-neon=no)
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
