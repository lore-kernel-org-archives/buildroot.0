From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Tue,  8 Jul 2014 15:57:08 +0200
Subject: [Buildroot] [RFC 5/9] at-spi2-atk: new package
In-Reply-To: <1404827832-1101-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1404827832-1101-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <1404827832-1101-6-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The at-spi2-atk package provides AT-SPI 2 Toolkit Bridge. This is a
requirement for Gtk+ 3.0.

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                  |  1 +
 package/at-spi2-atk/Config.in      | 16 ++++++++++++++++
 package/at-spi2-atk/at-spi2-atk.mk | 19 +++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/at-spi2-atk/Config.in
 create mode 100644 package/at-spi2-atk/at-spi2-atk.mk

diff --git a/package/Config.in b/package/Config.in
index 1ec108a..b700ed1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -588,6 +588,7 @@ endmenu
 menu "Graphics"
 	source "package/atk/Config.in"
 	source "package/at-spi2-core/Config.in"
+	source "package/at-spi2-atk/Config.in"
 	source "package/cairo/Config.in"
 	source "package/fltk/Config.in"
 	source "package/fontconfig/Config.in"
diff --git a/package/at-spi2-atk/Config.in b/package/at-spi2-atk/Config.in
new file mode 100644
index 0000000..828db71
--- /dev/null
+++ b/package/at-spi2-atk/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_AT_SPI2_ATK
+	bool "at-spi2-atk"
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_AT_SPI2_CORE
+	depends on BR2_PACKAGE_XORG7 # at-spi2-core
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	help
+	  AT-SPI 2 Toolkit Bridge
+
+comment "at-spi2-atk needs a toolchain w/wchar, threads"
+	depends on !BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/at-spi2-atk/at-spi2-atk.mk b/package/at-spi2-atk/at-spi2-atk.mk
new file mode 100644
index 0000000..747eea4
--- /dev/null
+++ b/package/at-spi2-atk/at-spi2-atk.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# at-spi2-atk
+#
+################################################################################
+
+AT_SPI2_ATK_VERSION_MAJOR = 2.10
+AT_SPI2_ATK_VERSION_MINOR = 2
+AT_SPI2_ATK_VERSION = $(AT_SPI2_ATK_VERSION_MAJOR).$(AT_SPI2_ATK_VERSION_MINOR)
+AT_SPI2_ATK_SOURCE = at-spi2-atk-$(AT_SPI2_ATK_VERSION).tar.xz
+AT_SPI2_ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/at-spi2-atk/$(AT_SPI2_ATK_VERSION_MAJOR)
+AT_SPI2_ATK_LICENSE = LGPLv2+
+AT_SPI2_ATK_LICENSE_FILES = COPYING
+AT_SPI2_ATK_INSTALL_STAGING = YES
+AT_SPI2_ATK_INSTALL_TARGET = YES
+
+AT_SPI2_ATK_DEPENDENCIES = host-pkgconf libglib2 dbus atk at-spi2-core
+
+$(eval $(autotools-package))
-- 
2.0.1
