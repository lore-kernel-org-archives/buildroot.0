From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 Oct 2015 12:03:09 +0200
Subject: [Buildroot] [PATCH v3 04/37] package/libevas-generic-loaders: move
	to package directory
In-Reply-To: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
References: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1444471422-15118-5-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/Config.in                                  |  1 +
 package/efl/Config.in                              |  1 -
 package/efl/libevas-generic-loaders/Config.in      | 29 -------------------
 .../libevas-generic-loaders.mk                     | 31 --------------------
 package/libevas-generic-loaders/Config.in          | 33 ++++++++++++++++++++++
 .../libevas-generic-loaders.mk                     | 31 ++++++++++++++++++++
 6 files changed, 65 insertions(+), 61 deletions(-)
 delete mode 100644 package/efl/libevas-generic-loaders/Config.in
 delete mode 100644 package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
 create mode 100644 package/libevas-generic-loaders/Config.in
 create mode 100644 package/libevas-generic-loaders/libevas-generic-loaders.mk

diff --git a/package/Config.in b/package/Config.in
index 49ce01a..2bc87d4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -241,6 +241,7 @@ endif
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
 	source "package/libelementary/Config.in"
+	source "package/libevas-generic-loaders/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
diff --git a/package/efl/Config.in b/package/efl/Config.in
index cf82f8b..659ee10 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -16,7 +16,6 @@ source "package/efl/libeet/Config.in"
 source "package/efl/libefreet/Config.in"
 source "package/efl/libeio/Config.in"
 source "package/efl/libevas/Config.in"
-source "package/efl/libevas-generic-loaders/Config.in"
 source "package/efl/libembryo/Config.in"
 source "package/efl/libedje/Config.in"
 source "package/efl/libethumb/Config.in"
diff --git a/package/efl/libevas-generic-loaders/Config.in b/package/efl/libevas-generic-loaders/Config.in
deleted file mode 100644
index 3f7581f..0000000
--- a/package/efl/libevas-generic-loaders/Config.in
+++ /dev/null
@@ -1,29 +0,0 @@
-config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
-	bool "libevas generic loaders"
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_ZLIB
-	help
-	  These are additional "generic" loaders for Evas that are
-	  stand-alone executables that evas may run from its generic
-	  loader module.
-
-	  http://trac.enlightenment.org/e/wiki/Evas_Generic_Loaders
-
-if BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
-
-config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
-	bool "SVG loader"
-	select BR2_PACKAGE_LIBRSVG
-	select BR2_PACKAGE_CAIRO
-	depends on BR2_USE_WCHAR # librsvg -> glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # librsvg -> glib2
-	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
-	depends on BR2_ARCH_HAS_ATOMICS # cairo
-	help
-	  This option enables the Evas generic SVG loader
-
-comment "SVG loader needs a toolchain w/ wchar, threads, C++"
-	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
-
-endif
diff --git a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk b/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
deleted file mode 100644
index ac6b1cc..0000000
--- a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
+++ /dev/null
@@ -1,31 +0,0 @@
-################################################################################
-#
-# libevas-generic-loaders
-#
-################################################################################
-
-LIBEVAS_GENERIC_LOADERS_VERSION = 1.7.10
-LIBEVAS_GENERIC_LOADERS_SOURCE = evas_generic_loaders-$(LIBEVAS_GENERIC_LOADERS_VERSION).tar.bz2
-LIBEVAS_GENERIC_LOADERS_SITE = http://download.enlightenment.org/releases
-LIBEVAS_GENERIC_LOADERS_LICENSE = GPLv2
-LIBEVAS_GENERIC_LOADERS_LICENSE_FILES = COPYING
-
-LIBEVAS_GENERIC_LOADERS_INSTALL_STAGING = YES
-
-LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = libeina zlib
-
-# For now, we only support the SVG loader
-LIBEVAS_GENERIC_LOADERS_CONF_OPTS += \
-	--disable-poppler \
-	--disable-spectre \
-	--disable-libraw \
-	--disable-gstreamer
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG),y)
-LIBEVAS_GENERIC_LOADERS_DEPENDENCIES += librsvg cairo
-LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --enable-svg
-else
-LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --disable-svg
-endif
-
-$(eval $(autotools-package))
diff --git a/package/libevas-generic-loaders/Config.in b/package/libevas-generic-loaders/Config.in
new file mode 100644
index 0000000..47e5aa2
--- /dev/null
+++ b/package/libevas-generic-loaders/Config.in
@@ -0,0 +1,33 @@
+config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
+	bool "libevas generic loaders"
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_USE_WCHAR # efl
+	depends on BR2_USE_MMU # efl
+	help
+	  These are additional "generic" loaders for Evas that are
+	  stand-alone executables that evas may run from its generic
+	  loader module.
+
+	  http://trac.enlightenment.org/e/wiki/Evas_Generic_Loaders
+
+if BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
+
+config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
+	bool "SVG loader"
+	select BR2_PACKAGE_LIBRSVG
+	select BR2_PACKAGE_CAIRO
+	depends on BR2_TOOLCHAIN_HAS_THREADS # librsvg -> glib2
+	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
+	help
+	  This option enables the Evas generic SVG loader
+
+comment "SVG loader needs a toolchain w/ threads, C++"
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+
+endif
+
+comment "libevas generic loaders needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/libevas-generic-loaders/libevas-generic-loaders.mk b/package/libevas-generic-loaders/libevas-generic-loaders.mk
new file mode 100644
index 0000000..ac6b1cc
--- /dev/null
+++ b/package/libevas-generic-loaders/libevas-generic-loaders.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# libevas-generic-loaders
+#
+################################################################################
+
+LIBEVAS_GENERIC_LOADERS_VERSION = 1.7.10
+LIBEVAS_GENERIC_LOADERS_SOURCE = evas_generic_loaders-$(LIBEVAS_GENERIC_LOADERS_VERSION).tar.bz2
+LIBEVAS_GENERIC_LOADERS_SITE = http://download.enlightenment.org/releases
+LIBEVAS_GENERIC_LOADERS_LICENSE = GPLv2
+LIBEVAS_GENERIC_LOADERS_LICENSE_FILES = COPYING
+
+LIBEVAS_GENERIC_LOADERS_INSTALL_STAGING = YES
+
+LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = libeina zlib
+
+# For now, we only support the SVG loader
+LIBEVAS_GENERIC_LOADERS_CONF_OPTS += \
+	--disable-poppler \
+	--disable-spectre \
+	--disable-libraw \
+	--disable-gstreamer
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG),y)
+LIBEVAS_GENERIC_LOADERS_DEPENDENCIES += librsvg cairo
+LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --enable-svg
+else
+LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --disable-svg
+endif
+
+$(eval $(autotools-package))
-- 
2.4.3
