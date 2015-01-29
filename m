From: Pieter De Gendt <pieter.degendt@gmail.com>
Date: Thu, 29 Jan 2015 13:33:05 +0100
Subject: [Buildroot] [PATCH 1/1] libvips: new package
Message-ID: <1422534785-24666-1-git-send-email-pieter.degendt@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
---
 package/Config.in                               |  1 +
 package/libvips/Config.in                       | 47 +++++++++++++++++++
 package/libvips/libvips-01-fix-no-gtk-doc.patch | 35 +++++++++++++++
 package/libvips/libvips.mk                      | 60 +++++++++++++++++++++++++
 4 files changed, 143 insertions(+)
 create mode 100644 package/libvips/Config.in
 create mode 100644 package/libvips/libvips-01-fix-no-gtk-doc.patch
 create mode 100644 package/libvips/libvips.mk

diff --git a/package/Config.in b/package/Config.in
index 3117474..34a061f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -695,6 +695,7 @@ menu "Graphics"
 	source "package/libungif/Config.in"
 	source "package/libva/Config.in"
 	source "package/libva-intel-driver/Config.in"
+	source "package/libvips/Config.in"
 	source "package/opencv/Config.in"
 	source "package/opengl/Config.in"
 	source "package/pango/Config.in"
diff --git a/package/libvips/Config.in b/package/libvips/Config.in
new file mode 100644
index 0000000..bba40f4
--- /dev/null
+++ b/package/libvips/Config.in
@@ -0,0 +1,47 @@
+menuconfig BR2_PACKAGE_LIBVIPS
+	bool "libvips"
+	depends on BR2_USE_MMU # glib2
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	help
+	  libvips is a 2D image processing library. Compared to similar libraries, 
+	  libvips runs quickly and uses little memory. livips is licensed under the LGPL 2.1+.
+
+	  http://www.vips.ecs.soton.ac.uk/
+
+if BR2_PACKAGE_LIBVIPS
+
+config BR2_PACKAGE_LIBVIPS_WITH_JPEG
+	bool "jpeg support"
+	select BR2_PACKAGE_JPEG
+	help
+	  Use shared libjpeg from the target system.
+
+config BR2_PACKAGE_LIBVIPS_WITH_LIBPNG
+	bool "png support"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  Use shared libpng from the target system.
+
+config BR2_PACKAGE_LIBVIPS_WITH_TIFF
+	bool "tiff support"
+	select BR2_PACKAGE_TIFF
+	help
+	  Use shared tiff from the target system.
+
+config BR2_PACKAGE_LIBVIPS_WITH_FFTW
+	bool "fftw support"
+	select BR2_PACKAGE_FFTW
+	help
+	  Use shared fftw from the target system.
+
+config BR2_PACKAGE_LIBVIPS_WITH_LIBEXIF
+	bool "libexif support"
+	select BR2_PACKAGE_LIBEXIF
+	help
+	  Use shared libexif from the target system.
+
+endif # BR2_PACKAGE_LIBVIPS
+
+comment "libvips needs a toolchain w/ MMU support"
+        depends on !BR2_USE_MMU
\ No newline at end of file
diff --git a/package/libvips/libvips-01-fix-no-gtk-doc.patch b/package/libvips/libvips-01-fix-no-gtk-doc.patch
new file mode 100644
index 0000000..bfaf7c3
--- /dev/null
+++ b/package/libvips/libvips-01-fix-no-gtk-doc.patch
@@ -0,0 +1,35 @@
+From a3d47be3b6bed845af5e1aa87ca2da2b1e840cbb Mon Sep 17 00:00:00 2001
+From: Pieter De Gendt <pieter.degendt@basalte.be>
+Date: Thu, 29 Jan 2015 12:25:35 +0100
+Subject: [PATCH] Same patch as for systemd in commit
+ http://git.buildroot.net/buildroot/commit/?id=7144f2f04b70553
+
+Fix deactivation of gtk-doc
+
+The tarball contains the Makefile for building documentation with gtk-doc,
+Unfortunately the AM_CONDITIONAL variable is not the correct one, which
+results in an error when running autoreconf.
+
+This patch fixes this issue.
+
+Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
+---
+ doc/reference/gtk-doc.make | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/doc/reference/gtk-doc.make b/doc/reference/gtk-doc.make
+index e791656..786803e 100644
+--- a/doc/reference/gtk-doc.make
++++ b/doc/reference/gtk-doc.make
+@@ -267,7 +267,7 @@ uninstall-local:
+ #
+ # Require gtk-doc when making dist
+ #
+-if HAVE_GTK_DOC
++if ENABLE_GTK_DOC
+ dist-check-gtkdoc: docs
+ else
+ dist-check-gtkdoc:
+-- 
+2.2.2
+
diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
new file mode 100644
index 0000000..8e2bc10
--- /dev/null
+++ b/package/libvips/libvips.mk
@@ -0,0 +1,60 @@
+################################################################################
+#
+# libvips
+#
+################################################################################
+
+LIBVIPS_VERSION_MAJOR = 7.42
+LIBVIPS_VERSION = $(LIBVIPS_VERSION_MAJOR).1
+LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.gz
+LIBVIPS_SITE = http://www.vips.ecs.soton.ac.uk/supported/$(LIBVIPS_VERSION_MAJOR)
+LIBVIPS_LICENSE = LGPLv2.1+
+LIBVIPS_LICENSE_FILES = COPYING
+
+LIBVIPS_AUTORECONF = YES
+LIBVIPS_CONF_OPT = --disable-docs --disable-gtk-doc --disable-introspection
+LIBVIPS_INSTALL_STAGING = YES
+LIBVIPS_DEPENDENCIES = host-pkgconf host-swig host-automake host-autoconf host-libtool libglib2 libxml2 $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+
+ifeq ($(BR2_PACKAGE_LIBVIPS_CXX),y)
+LIBVIPS_CONF_OPT += --enable-cxx
+else
+LIBVIPS_CONF_OPT += --disable-cxx
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVIPS_WITH_JPEG),y)
+LIBVIPS_CONF_OPT += --with-jpeg
+LIBVIPS_DEPENDENCIES += jpeg
+else
+LIBVIPS_CONF_OPT += --without-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVIPS_WITH_LIBPNG),y)
+LIBVIPS_CONF_OPT += --with-png
+LIBVIPS_DEPENDENCIES += libpng
+else
+LIBVIPS_CONF_OPT += --without-png
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVIPS_WITH_TIFF),y)
+LIBVIPS_CONF_OPT += --with-tiff
+LIBVIPS_DEPENDENCIES += tiff
+else
+LIBVIPS_CONF_OPT += --without-tiff
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVIPS_WITH_FFTW),y)
+LIBVIPS_CONF_OPT += --with-fftw
+LIBVIPS_DEPENDENCIES += fftw
+else
+LIBVIPS_CONF_OPT += --without-fftw
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVIPS_WITH_LIBEXIF),y)
+LIBVIPS_CONF_OPT += --with-libexif
+LIBVIPS_DEPENDENCIES += libexif
+else
+LIBVIPS_CONF_OPT += --without-libexif
+endif
+
+$(eval $(autotools-package))
\ No newline at end of file
-- 
2.2.2
