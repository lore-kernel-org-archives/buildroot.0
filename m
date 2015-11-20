From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Fri, 20 Nov 2015 17:47:22 -0200
Subject: [Buildroot] [PATCH 1/1] libgdiplus: new package
Message-ID: <1448048842-25060-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libgdiplus is an open source implementation of the GDI+ API.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/Config.in                  |  1 +
 package/libgdiplus/Config.in       | 14 ++++++++++++
 package/libgdiplus/libgdiplus.hash |  2 ++
 package/libgdiplus/libgdiplus.mk   | 46 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 63 insertions(+)
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
index 000000000000..173d9af0d48a
--- /dev/null
+++ b/package/libgdiplus/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBGDIPLUS
+	bool "libgdiplus"
+	select BR2_PACKAGE_XLIB_LIBXFT
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_LIBPNG
+	depends on BR2_PACKAGE_XORG7
+	help
+	  An Open Source implementation of the GDI+ API.
+
+	  https://github.com/mono/libgdiplus
+
+comment "libgdiplus depends on X.org"
+	depends on !BR2_PACKAGE_XORG7
diff --git a/package/libgdiplus/libgdiplus.hash b/package/libgdiplus/libgdiplus.hash
new file mode 100644
index 000000000000..f2b0d33d71ab
--- /dev/null
+++ b/package/libgdiplus/libgdiplus.hash
@@ -0,0 +1,2 @@
+# No hash for 3.12, comes from the github-helper:
+none    xxx     libgdiplus-3.12.tar.gz
diff --git a/package/libgdiplus/libgdiplus.mk b/package/libgdiplus/libgdiplus.mk
new file mode 100644
index 000000000000..c8e2d96a1c82
--- /dev/null
+++ b/package/libgdiplus/libgdiplus.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# libgdiplus
+#
+################################################################################
+
+LIBGDIPLUS_VERSION = 3.12
+LIBGDIPLUS_SITE = $(call github,mono,libgdiplus,$(LIBGDIPLUS_VERSION))
+LIBGDIPLUS_LICENSE = LGPL MPLv1.0
+LIBGDIPLUS_LICENSE_FILES = LICENSE
+LIBGDIPLUS_AUTORECONF = YES
+LIBGDIPLUS_INSTALL_STAGING = YES
+
+LIBGDIPLUS_DEPENDENCIES = xlib_libXft libglib2 cairo libpng
+
+# API changes in recent versions of libgif makes it incompatible with
+# this version of libgdiplus, so we are disabling it for now.
+LIBGDIPLUS_CONF_OPTS = --without-libgif
+
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
