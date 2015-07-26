From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:31 +0200
Subject: [Buildroot] [RFC 21/37] package/libevas-generic-loaders: bump to
	version 1.14.0
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-22-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update url and add a hash file.
Add efl reverse dependencies.
Add a comment about poppler support

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/libevas-generic-loaders/Config.in             | 19 ++++++++-----------
 .../libevas-generic-loaders.hash                      |  2 ++
 .../libevas-generic-loaders.mk                        |  9 +++++----
 3 files changed, 15 insertions(+), 15 deletions(-)
 create mode 100644 package/libevas-generic-loaders/libevas-generic-loaders.hash

diff --git a/package/libevas-generic-loaders/Config.in b/package/libevas-generic-loaders/Config.in
index 47e5aa2..ffa23ce 100644
--- a/package/libevas-generic-loaders/Config.in
+++ b/package/libevas-generic-loaders/Config.in
@@ -1,15 +1,17 @@
 config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 	bool "libevas generic loaders"
-	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_EFL
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_USE_WCHAR # efl
+	depends on BR2_INSTALL_LIBSTDCPP # efl
+	depends on BR2_PACKAGE_HAS_UDEV # efl -> libudev
+	depends on BR2_TOOLCHAIN_USES_GLIBC # efl
 	depends on BR2_USE_MMU # efl
 	help
 	  These are additional "generic" loaders for Evas that are
 	  stand-alone executables that evas may run from its generic
 	  loader module.
 
-	  http://trac.enlightenment.org/e/wiki/Evas_Generic_Loaders
+	  https://www.enlightenment.org/
 
 if BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 
@@ -17,17 +19,12 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
 	bool "SVG loader"
 	select BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_CAIRO
-	depends on BR2_TOOLCHAIN_HAS_THREADS # librsvg -> glib2
-	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
 	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	help
 	  This option enables the Evas generic SVG loader
 
-comment "SVG loader needs a toolchain w/ threads, C++"
-	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
-
 endif
 
-comment "libevas generic loaders needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+comment "libevas generic loaders needs udev /dev management and a (e)glibc toolchain w/ C++"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_USE_MMU
diff --git a/package/libevas-generic-loaders/libevas-generic-loaders.hash b/package/libevas-generic-loaders/libevas-generic-loaders.hash
new file mode 100644
index 0000000..4f1f0a6
--- /dev/null
+++ b/package/libevas-generic-loaders/libevas-generic-loaders.hash
@@ -0,0 +1,2 @@
+# From https://download.enlightenment.org/rel/libs/evas_generic_loaders/evas_generic_loaders-1.14.0.tar.xz.sha256
+sha256	14213f2c27dc8eb5ae99b269b8ecff0d55f14ec8fc534e2bf17405e456ed66a1	evas_generic_loaders-1.14.0.tar.xz
diff --git a/package/libevas-generic-loaders/libevas-generic-loaders.mk b/package/libevas-generic-loaders/libevas-generic-loaders.mk
index ac6b1cc..4b31305 100644
--- a/package/libevas-generic-loaders/libevas-generic-loaders.mk
+++ b/package/libevas-generic-loaders/libevas-generic-loaders.mk
@@ -4,17 +4,18 @@
 #
 ################################################################################
 
-LIBEVAS_GENERIC_LOADERS_VERSION = 1.7.10
-LIBEVAS_GENERIC_LOADERS_SOURCE = evas_generic_loaders-$(LIBEVAS_GENERIC_LOADERS_VERSION).tar.bz2
-LIBEVAS_GENERIC_LOADERS_SITE = http://download.enlightenment.org/releases
+LIBEVAS_GENERIC_LOADERS_VERSION = 1.14.0
+LIBEVAS_GENERIC_LOADERS_SOURCE = evas_generic_loaders-$(LIBEVAS_GENERIC_LOADERS_VERSION).tar.xz
+LIBEVAS_GENERIC_LOADERS_SITE = http://download.enlightenment.org/rel/libs/evas_generic_loaders/
 LIBEVAS_GENERIC_LOADERS_LICENSE = GPLv2
 LIBEVAS_GENERIC_LOADERS_LICENSE_FILES = COPYING
 
 LIBEVAS_GENERIC_LOADERS_INSTALL_STAGING = YES
 
-LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = libeina zlib
+LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = efl zlib
 
 # For now, we only support the SVG loader
+# poppler >= 0.32 is not supported with libevas-generic-loaders 1.14.0
 LIBEVAS_GENERIC_LOADERS_CONF_OPTS += \
 	--disable-poppler \
 	--disable-spectre \
-- 
2.4.3
