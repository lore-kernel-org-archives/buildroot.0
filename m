From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 23:06:58 +0200
Subject: [Buildroot] [git commit] at-spi2-core: new package
Message-ID: <20180625210446.5986A8124E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=624f65d428a568f3866e9317833b68c1b068145d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
[Thomas:
 - drop host-meson dependency, unneeded since the meson-package
   infrastructure is used
 - add -Ddbus_daemon=/usr/bin/dbus-daemon, otherwise at-spi2-core
   meson build system tries to find dbus-daemon on the host machine,
   where it may not be available.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/at-spi2-core/Config.in         | 25 +++++++++++++++++++++++++
 package/at-spi2-core/at-spi2-core.hash |  3 +++
 package/at-spi2-core/at-spi2-core.mk   | 17 +++++++++++++++++
 5 files changed, 47 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 626fba3159..b3148a0270 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -975,6 +975,7 @@ F:	board/qemu/ppc64le-pseries/
 F:	configs/qemu_ppc64le_pseries_defconfig
 
 N:	Joseph Kogut <joseph.kogut@gmail.com>
+F:	package/at-spi2-core/
 F:	package/gconf/
 F:	package/libnss/
 F:	package/python-cython/
diff --git a/package/Config.in b/package/Config.in
index c8e35fd99e..63db543d87 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1131,6 +1131,7 @@ endmenu
 
 menu "Graphics"
 	source "package/assimp/Config.in"
+	source "package/at-spi2-core/Config.in"
 	source "package/atk/Config.in"
 	source "package/atkmm/Config.in"
 	source "package/bullet/Config.in"
diff --git a/package/at-spi2-core/Config.in b/package/at-spi2-core/Config.in
new file mode 100644
index 0000000000..f56c5b93c4
--- /dev/null
+++ b/package/at-spi2-core/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_AT_SPI2_CORE
+	bool "at-spi2-core"
+	depends on BR2_PACKAGE_XORG7 # xlib-libxtst
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_USE_WCHAR # glib2
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_XLIB_LIBXTST
+	help
+	  The At-Spi2 Core package is a part of the GNOME
+	  Accessibility Project. It provides a Service Provider
+	  Interface for the Assistive Technologies available on the
+	  GNOME platform and a library against which applications
+	  can be linked.
+
+	  https://wiki.gnome.org/Accessibility
+
+comment "at-spi2-core needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "at-spi2-core depends on X.org"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_XORG7
diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
new file mode 100644
index 0000000000..9c96da312b
--- /dev/null
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256 42a2487ab11ce43c288e73b2668ef8b1ab40a0e2b4f94e80fca04ad27b6f1c87  at-spi2-core-2.28.0.tar.xz
+sha256 c6105b34ab6829ff5c70eba234f40053215fa9f8383ced271b0e370a1923624b  COPYING
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
new file mode 100644
index 0000000000..40b29bdb3f
--- /dev/null
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# at-spi2-core
+#
+################################################################################
+
+AT_SPI2_CORE_VERSION_MAJOR = 2.28
+AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
+AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
+AT_SPI2_CORE_SITE = http://ftp.gnome.org/pub/gnome/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
+AT_SPI2_CORE_LICENSE = LGPL-2.0+
+AT_SPI2_CORE_LICENSE_FILES = COPYING
+AT_SPI2_CORE_INSTALL_STAGING = YES
+AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 xlib_libXtst
+AT_SPI2_CORE_CONF_OPTS = -Ddbus_daemon=/usr/bin/dbus-daemon
+
+$(eval $(meson-package))
