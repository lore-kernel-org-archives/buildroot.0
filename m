From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:44:18 +0200
Subject: [Buildroot] [git commit] package/libevas-generic-loaders: remove
	package
Message-ID: <20160906195112.2162480583@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e51731760788d068339a32d1601232782c2bb0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libevas-generic-loaders package is not used anymore, remove it.
Add a legacy entry.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  8 +++++
 package/Config.in                                  |  1 -
 package/libevas-generic-loaders/Config.in          | 41 ----------------------
 .../libevas-generic-loaders.hash                   |  2 --
 .../libevas-generic-loaders.mk                     | 38 --------------------
 5 files changed, 8 insertions(+), 82 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c76aeb1..60d414b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
+	bool "libevas-generic-loaders package removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  With EFL 1.18, libevas-generic-loaders is now provided by the efl
+	  package.
+
 config BR2_PACKAGE_ELEMENTARY
 	bool "elementary package removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 2acc739..add6052 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -954,7 +954,6 @@ menu "Graphics"
 	source "package/libdri2/Config.in"
 	source "package/libdrm/Config.in"
 	source "package/libepoxy/Config.in"
-	source "package/libevas-generic-loaders/Config.in"
 	source "package/libexif/Config.in"
 	source "package/libfm/Config.in"
 	source "package/libfm-extra/Config.in"
diff --git a/package/libevas-generic-loaders/Config.in b/package/libevas-generic-loaders/Config.in
deleted file mode 100644
index c171d47..0000000
--- a/package/libevas-generic-loaders/Config.in
+++ /dev/null
@@ -1,41 +0,0 @@
-config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
-	bool "libevas generic loaders"
-	depends on BR2_PACKAGE_EFL
-	select BR2_PACKAGE_ZLIB
-	help
-	  These are additional "generic" loaders for Evas that are
-	  stand-alone executables that evas may run from its generic
-	  loader module.
-
-	  https://www.enlightenment.org/
-
-if BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
-
-config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_LIBRAW
-	bool "libraw loader"
-	depends on BR2_INSTALL_LIBSTDCPP # libraw
-	select BR2_PACKAGE_LIBRAW
-	help
-	  This option enables the Evas generic Libraw loader
-
-comment "libraw loader needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-
-config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
-	bool "SVG loader"
-	depends on BR2_USE_MMU # librsvg -> glib2
-	depends on BR2_USE_WCHAR # librsvg -> glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # librsvg -> glib2
-	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
-	select BR2_PACKAGE_LIBRSVG
-	select BR2_PACKAGE_CAIRO
-	help
-	  This option enables the Evas generic SVG loader
-
-comment "SVG loader needs a toolchain w/ wchar, threads, C++"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
-
-endif
diff --git a/package/libevas-generic-loaders/libevas-generic-loaders.hash b/package/libevas-generic-loaders/libevas-generic-loaders.hash
deleted file mode 100644
index ee2ae9b..0000000
--- a/package/libevas-generic-loaders/libevas-generic-loaders.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From https://download.enlightenment.org/rel/libs/evas_generic_loaders/evas_generic_loaders-1.17.0.tar.xz.sha256
-sha256	c2f5193a9326532d3ab3ff76f547b9d17b33ae7221ce4d6e0aefb905ba0dd87a	evas_generic_loaders-1.17.0.tar.xz
diff --git a/package/libevas-generic-loaders/libevas-generic-loaders.mk b/package/libevas-generic-loaders/libevas-generic-loaders.mk
deleted file mode 100644
index abc436b..0000000
--- a/package/libevas-generic-loaders/libevas-generic-loaders.mk
+++ /dev/null
@@ -1,38 +0,0 @@
-################################################################################
-#
-# libevas-generic-loaders
-#
-################################################################################
-
-LIBEVAS_GENERIC_LOADERS_VERSION = 1.17.0
-LIBEVAS_GENERIC_LOADERS_SOURCE = evas_generic_loaders-$(LIBEVAS_GENERIC_LOADERS_VERSION).tar.xz
-LIBEVAS_GENERIC_LOADERS_SITE = http://download.enlightenment.org/rel/libs/evas_generic_loaders
-LIBEVAS_GENERIC_LOADERS_LICENSE = GPLv2
-LIBEVAS_GENERIC_LOADERS_LICENSE_FILES = COPYING
-
-LIBEVAS_GENERIC_LOADERS_INSTALL_STAGING = YES
-
-LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = host-pkgconf efl zlib
-
-# poppler >= 0.32 is not supported by the current version of
-# libevas-generic-loaders.
-LIBEVAS_GENERIC_LOADERS_CONF_OPTS += \
-	--disable-poppler \
-	--disable-spectre \
-	--disable-gstreamer
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_LIBRAW),y)
-LIBEVAS_GENERIC_LOADERS_DEPENDENCIES += libraw
-LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --enable-libraw
-else
-LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --disable-libraw
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG),y)
-LIBEVAS_GENERIC_LOADERS_DEPENDENCIES += librsvg cairo
-LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --enable-svg
-else
-LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --disable-svg
-endif
-
-$(eval $(autotools-package))
