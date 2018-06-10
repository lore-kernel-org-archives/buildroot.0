From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 10 Jun 2018 13:44:42 -0700
Subject: [Buildroot] [RFC PATCH v2 2/9] at-spi2-core: new package
In-Reply-To: <20180610204449.13646-1-joseph.kogut@gmail.com>
References: <20180608225932.13127-1-joseph.kogut@gmail.com>
 <20180610204449.13646-1-joseph.kogut@gmail.com>
Message-ID: <20180610204449.13646-4-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/at-spi2-core/Config.in         |  9 +++++
 package/at-spi2-core/at-spi2-core.hash |  4 +++
 package/at-spi2-core/at-spi2-core.mk   | 46 ++++++++++++++++++++++++++
 5 files changed, 61 insertions(+)
 create mode 100644 package/at-spi2-core/Config.in
 create mode 100644 package/at-spi2-core/at-spi2-core.hash
 create mode 100644 package/at-spi2-core/at-spi2-core.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1a8440759e..31c651b938 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -955,6 +955,7 @@ F:	board/qemu/ppc64le-pseries/
 F:	configs/qemu_ppc64le_pseries_defconfig
 
 N:	Joseph Kogut <joseph.kogut@gmail.com>
+F:	package/at-spi2-core/
 F:	package/gconf/
 F:	package/libnss/
 F:	package/python-cython/
diff --git a/package/Config.in b/package/Config.in
index 6a1606e568..692b422911 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1128,6 +1128,7 @@ endmenu
 
 menu "Graphics"
 	source "package/assimp/Config.in"
+	source "package/at-spi2-core/Config.in"
 	source "package/atk/Config.in"
 	source "package/atkmm/Config.in"
 	source "package/bullet/Config.in"
diff --git a/package/at-spi2-core/Config.in b/package/at-spi2-core/Config.in
new file mode 100644
index 0000000000..9c60c51792
--- /dev/null
+++ b/package/at-spi2-core/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_AT_SPI2_CORE
+	bool "at-spi2-core"
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_XLIB_LIBXTST
+	help
+	  The At-Spi2 Core package is a part of the GNOME Accessibility Project.
+	  It provides a Service Provider Interface for the Assistive Technologies
+	  available on the GNOME platform and a library against which 
+	  applications can be linked.
diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
new file mode 100644
index 0000000000..e792cc0e0a
--- /dev/null
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -0,0 +1,4 @@
+# locally calculated
+sha256 42a2487ab11ce43c288e73b2668ef8b1ab40a0e2b4f94e80fca04ad27b6f1c87  at-spi2-core-2.28.0.tar.xz
+sha256 c6105b34ab6829ff5c70eba234f40053215fa9f8383ced271b0e370a1923624b  COPYING
+
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
new file mode 100644
index 0000000000..88800e2ce7
--- /dev/null
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -0,0 +1,46 @@
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
+AT_SPI2_CORE_DEPENDENCIES = host-meson host-pkgconf dbus libglib2 xlib_libXtst
+
+AT_SPI2_CORE_MESON_OPTS += \
+	--prefix=/usr \
+	--libdir=/usr/lib \
+	--sysconfdir=/etc \
+	--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
+	--cross-file=$(HOST_DIR)/etc/meson/cross-compilation.conf
+
+AT_SPI2_CORE_NINJA_OPTS = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
+
+define AT_SPI2_CORE_CONFIGURE_CMDS
+	rm -rf $(@D)/build
+	mkdir -p $(@D)/build
+	$(TARGET_MAKE_ENV) meson $(AT_SPI2_CORE_MESON_OPTS) $(@D) $(@D)/build
+endef
+
+define AT_SPI2_CORE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) ninja $(AT_SPI2_CORE_NINJA_OPTS) -C $(@D)/build
+endef
+
+define AT_SPI2_CORE_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) \
+		ninja $(AT_SPI2_CORE_NINJA_OPTS) -C $(@D)/build install
+endef
+
+define AT_SPI2_CORE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) \
+		ninja $(AT_SPI2_CORE_NINJA_OPTS) -C $(@D)/build install
+endef
+
+$(eval $(generic-package))
+
-- 
2.17.1
