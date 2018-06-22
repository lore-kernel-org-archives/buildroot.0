From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 21 Jun 2018 17:33:36 -0700
Subject: [Buildroot] [RFC PATCH v5 2/6] at-spi2-atk: new package
In-Reply-To: <20180622003340.10859-1-joseph.kogut@gmail.com>
References: <20180622003340.10859-1-joseph.kogut@gmail.com>
Message-ID: <20180622003340.10859-3-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/at-spi2-atk/Config.in        | 21 +++++++++++++++++++++
 package/at-spi2-atk/at-spi2-atk.hash |  3 +++
 package/at-spi2-atk/at-spi2-atk.mk   | 17 +++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 package/at-spi2-atk/Config.in
 create mode 100644 package/at-spi2-atk/at-spi2-atk.hash
 create mode 100644 package/at-spi2-atk/at-spi2-atk.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b721b3592a..9116db39cb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -974,6 +974,7 @@ F:	board/qemu/ppc64le-pseries/
 F:	configs/qemu_ppc64le_pseries_defconfig
 
 N:	Joseph Kogut <joseph.kogut@gmail.com>
+F:	package/at-spi2-atk/
 F:	package/at-spi2-core/
 F:	package/gconf/
 F:	package/libnss/
diff --git a/package/Config.in b/package/Config.in
index 56e6b2f2bd..d18b542cc5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1130,6 +1130,7 @@ endmenu
 
 menu "Graphics"
 	source "package/assimp/Config.in"
+	source "package/at-spi2-atk/Config.in"
 	source "package/at-spi2-core/Config.in"
 	source "package/atk/Config.in"
 	source "package/atkmm/Config.in"
diff --git a/package/at-spi2-atk/Config.in b/package/at-spi2-atk/Config.in
new file mode 100644
index 0000000000..599913c7df
--- /dev/null
+++ b/package/at-spi2-atk/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_AT_SPI2_ATK
+	bool "at-spi2-atk"
+	depends on BR2_PACKAGE_XORG7 # at-spi2-core
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_USE_WCHAR # glib2
+	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_AT_SPI2_CORE
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  The At-Spi2 Atk package contains a library that bridges
+	  ATK to At-Spi2 D-Bus service.
+
+	  https://www.freedesktop.org/wiki/Accessibility/AT-SPI2/
+
+comment "at-spi2-atk needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "at-spi2-atk depends on X.org"
+	depends on !BR2_PACKAGE_XORG7
diff --git a/package/at-spi2-atk/at-spi2-atk.hash b/package/at-spi2-atk/at-spi2-atk.hash
new file mode 100644
index 0000000000..77c8f68e47
--- /dev/null
+++ b/package/at-spi2-atk/at-spi2-atk.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256 61891f0abae1689f6617a963105a3f1dcdab5970c4a36ded9c79a7a544b16a6e  at-spi2-atk-2.26.2.tar.xz
+sha256 c6105b34ab6829ff5c70eba234f40053215fa9f8383ced271b0e370a1923624b  COPYING
diff --git a/package/at-spi2-atk/at-spi2-atk.mk b/package/at-spi2-atk/at-spi2-atk.mk
new file mode 100644
index 0000000000..0e9b39e8b8
--- /dev/null
+++ b/package/at-spi2-atk/at-spi2-atk.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# at-spi2-atk
+#
+################################################################################
+
+AT_SPI2_ATK_VERSION_MAJOR = 2.26
+AT_SPI2_ATK_VERSION = $(AT_SPI2_ATK_VERSION_MAJOR).2
+AT_SPI2_ATK_SOURCE = at-spi2-atk-$(AT_SPI2_ATK_VERSION).tar.xz
+AT_SPI2_ATK_SITE =  http://ftp.gnome.org/pub/gnome/sources/at-spi2-atk/$(AT_SPI2_ATK_VERSION_MAJOR)
+AT_SPI2_ATK_LICENSE = LGPL-2.0+
+AT_SPI2_ATK_LICENSE_FILES = COPYING
+AT_SPI2_ATK_INSTALL_STAGING = YES
+AT_SPI2_ATK_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install
+AT_SPI2_ATK_DEPENDENCIES = atk at-spi2-core libglib2 host-pkgconf
+
+$(eval $(autotools-package))
-- 
2.17.1
