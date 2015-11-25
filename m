From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 24 Nov 2015 22:15:10 -0200
Subject: [Buildroot] [PATCH v3] libgdiplus: new package
Message-ID: <1448410510-23087-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libgdiplus is an open source implementation of the GDI+ API.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
Changes v2 -> v3:
  - removing md5 hash
  - adding a comment explaining the source code license

Changes v1 -> v2:
  - because of libglib2, package depends on BR2_USE_WCHAR,
    BR2_TOOLCHAIN_HAS_THREADS and BR2_USE_MMU
  - because of cairo, package depends on BR2_PACKAGE_CAIRO
  - adding hashes
  - fixing license to MIT
  - adding a comment explaining why we need to enable autoreconf
  - adding a dependency on package host-pkgconf
  - adding a comment explaining why we cannot use --without-pango
---
 package/Config.in                  |  1 +
 package/libgdiplus/Config.in       | 21 ++++++++++++++
 package/libgdiplus/libgdiplus.hash |  2 ++
 package/libgdiplus/libgdiplus.mk   | 56 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 80 insertions(+)
 create mode 100644 package/libgdiplus/Config.in
 create mode 100644 package/libgdiplus/libgdiplus.hash
 create mode 100644 package/libgdiplus/libgdiplus.mk

diff --git a/package/Config.in b/package/Config.in
index bdc3063abd1a..ef09361c5440 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -824,6 +824,7 @@ menu "Graphics"
 	source "package/libfm-extra/Config.in"
 	source "package/libfreeimage/Config.in"
 	source "package/libgail/Config.in"
+	source "package/libgdiplus/Config.in"
 	source "package/libgeotiff/Config.in"
 	source "package/libglade/Config.in"
 	source "package/libglew/Config.in"
diff --git a/package/libgdiplus/Config.in b/package/libgdiplus/Config.in
new file mode 100644
index 000000000000..f860ab339469
--- /dev/null
+++ b/package/libgdiplus/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_LIBGDIPLUS
+	bool "libgdiplus"
+	select BR2_PACKAGE_XLIB_LIBXFT
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_LIBPNG
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_WCHAR # libglib2 -> gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
+	help
+	  An Open Source implementation of the GDI+ API.
+
+	  https://github.com/mono/libgdiplus
+
+comment "libgdiplus needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgdiplus/libgdiplus.hash b/package/libgdiplus/libgdiplus.hash
new file mode 100644
index 000000000000..71ffdd346685
--- /dev/null
+++ b/package/libgdiplus/libgdiplus.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 7eadc5105c6352d456c5f8699dc89260bf402e82ce6668e7e0c625519f9e5b44 libgdiplus-3.12.tar.gz
diff --git a/package/libgdiplus/libgdiplus.mk b/package/libgdiplus/libgdiplus.mk
new file mode 100644
index 000000000000..9f96c972c561
--- /dev/null
+++ b/package/libgdiplus/libgdiplus.mk
@@ -0,0 +1,56 @@
+################################################################################
+#
+# libgdiplus
+#
+################################################################################
+
+LIBGDIPLUS_VERSION = 3.12
+LIBGDIPLUS_SITE = $(call github,mono,libgdiplus,$(LIBGDIPLUS_VERSION))
+
+# Although there is a LICENSE file thas specifies LGPL or MPLv1.1, looks 
+# like it is incorrect. The actual source files specify that they're 
+# licensed under MIT, and so does the COPYING file (and they all predate 
+# the addition of the LICENSE file).
+LIBGDIPLUS_LICENSE = MIT
+LIBGDIPLUS_LICENSE_FILES = COPYING src/carbon-private.h
+
+LIBGDIPLUS_INSTALL_STAGING = YES
+
+# github tarball doesn't have configure
+LIBGDIPLUS_AUTORECONF = YES
+
+LIBGDIPLUS_DEPENDENCIES = xlib_libXft libglib2 cairo libpng host-pkgconf
+
+# API changes in recent versions of libgif makes it incompatible with
+# this version of libgdiplus, so we are disabling it for now.
+LIBGDIPLUS_CONF_OPTS = --without-libgif
+
+# there is a bug in the configure script that enables pango support when 
+# passing --without-pango, so let's just not use it
+ifeq ($(BR2_PACKAGE_PANGO),y)
+LIBGDIPLUS_CONF_OPTS += --with-pango
+LIBGDIPLUS_DEPENDENCIES += pango
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEXIF),y)
+LIBGDIPLUS_CONF_OPTS += --with-libexif
+LIBGDIPLUS_DEPENDENCIES += libexif
+else
+LIBGDIPLUS_CONF_OPTS += --without-libexif
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+LIBGDIPLUS_CONF_OPTS += --with-libjpeg
+LIBGDIPLUS_DEPENDENCIES += jpeg 
+else
+LIBGDIPLUS_CONF_OPTS += --without-libjpeg
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+LIBGDIPLUS_CONF_OPTS += --with-libtiff
+LIBGDIPLUS_DEPENDENCIES += tiff
+else
+LIBGDIPLUS_CONF_OPTS += --without-libtiff
+endif
+
+$(eval $(autotools-package))
-- 
1.9.1
