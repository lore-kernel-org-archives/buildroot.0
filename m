From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 11:37:15 +0100
Subject: [Buildroot] [git commit] libvips: new package
Message-ID: <20150202103822.4F853803DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d79ce0bbdf6cd79c252b11c716bfc20467031f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - Fix variable name: LIBVIPS_CONF_OPTSS -> LIBVIPS_CONF_OPTS
 - Add a lot of --without-<foo> options to make sure we explicitly
   disable optional features that are not handled by the .mk file.
 - Remove the host-swig dependency, which was probably thought of
   being needed by Pieter due to --without-python not being passed
   explicitly.
 - Remove trailing spaces in Config.in.
 - Rename patch to the new naming convention.]

Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                         |    1 +
 package/libvips/0001-fix-no-gtk-doc.patch |   35 +++++++++++++
 package/libvips/Config.in                 |   18 +++++++
 package/libvips/libvips.mk                |   77 +++++++++++++++++++++++++++++
 4 files changed, 131 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index dd011be..bcd1481 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -700,6 +700,7 @@ menu "Graphics"
 	source "package/libungif/Config.in"
 	source "package/libva/Config.in"
 	source "package/libva-intel-driver/Config.in"
+	source "package/libvips/Config.in"
 	source "package/opencv/Config.in"
 	source "package/opengl/Config.in"
 	source "package/pango/Config.in"
diff --git a/package/libvips/0001-fix-no-gtk-doc.patch b/package/libvips/0001-fix-no-gtk-doc.patch
new file mode 100644
index 0000000..bfaf7c3
--- /dev/null
+++ b/package/libvips/0001-fix-no-gtk-doc.patch
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
diff --git a/package/libvips/Config.in b/package/libvips/Config.in
new file mode 100644
index 0000000..1a0d35c
--- /dev/null
+++ b/package/libvips/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LIBVIPS
+	bool "libvips"
+	depends on BR2_USE_WCHAR # gettext, libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	help
+	  libvips is a 2D image processing library. Compared to
+	  similar libraries, libvips runs quickly and uses little
+	  memory.
+
+	  http://www.vips.ecs.soton.ac.uk/
+
+comment "libvips needs a toolchain w/ wchar, threads"
+        depends on BR2_USE_MMU
+        depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
new file mode 100644
index 0000000..35e7684
--- /dev/null
+++ b/package/libvips/libvips.mk
@@ -0,0 +1,77 @@
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
+# We're patching gtk-doc.make, so need to autoreconf
+LIBVIPS_AUTORECONF = YES
+LIBVIPS_CONF_OPTS = \
+	--disable-introspection \
+	--without-dmalloc \
+	--without-gsf \
+	--without-magick \
+	--without-orc \
+	--without-lcms \
+	--without-OpenEXR \
+	--without-openslide \
+	--without-matio \
+	--without-cfitsio \
+	--without-libwebp \
+	--without-pangoft2 \
+	--without-x \
+	--without-zip \
+	--without-python
+LIBVIPS_INSTALL_STAGING = YES
+LIBVIPS_DEPENDENCIES = \
+	host-pkgconf libglib2 \
+	libxml2 $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+LIBVIPS_CONF_OPTS += --enable-cxx
+else
+LIBVIPS_CONF_OPTS += --disable-cxx
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+LIBVIPS_CONF_OPTS += --with-jpeg
+LIBVIPS_DEPENDENCIES += jpeg
+else
+LIBVIPS_CONF_OPTS += --without-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+LIBVIPS_CONF_OPTS += --with-png
+LIBVIPS_DEPENDENCIES += libpng
+else
+LIBVIPS_CONF_OPTS += --without-png
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+LIBVIPS_CONF_OPTS += --with-tiff
+LIBVIPS_DEPENDENCIES += tiff
+else
+LIBVIPS_CONF_OPTS += --without-tiff
+endif
+
+ifeq ($(BR2_PACKAGE_FFTW),y)
+LIBVIPS_CONF_OPTS += --with-fftw
+LIBVIPS_DEPENDENCIES += fftw
+else
+LIBVIPS_CONF_OPTS += --without-fftw
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEXIF),y)
+LIBVIPS_CONF_OPTS += --with-libexif
+LIBVIPS_DEPENDENCIES += libexif
+else
+LIBVIPS_CONF_OPTS += --without-libexif
+endif
+
+$(eval $(autotools-package))
