From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 17 Feb 2020 15:30:29 +0100
Subject: [Buildroot] [PATCH 3/4] package/libblockdev: add new package
In-Reply-To: <20200217143030.5031-1-giulio.benetti@benettiengineering.com>
References: <20200217143030.5031-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200217143030.5031-4-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libblockdev is a library for manipulating block devices.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/libblockdev/Config.in        | 22 +++++++++++++++
 package/libblockdev/libblockdev.hash |  3 +++
 package/libblockdev/libblockdev.mk   | 40 ++++++++++++++++++++++++++++
 5 files changed, 67 insertions(+)
 create mode 100644 package/libblockdev/Config.in
 create mode 100644 package/libblockdev/libblockdev.hash
 create mode 100644 package/libblockdev/libblockdev.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5276c09384..514b850c08 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1009,6 +1009,7 @@ F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
 F:	package/at/
+F:	package/libblockdev/
 F:	package/libbytesize/
 F:	package/libnspr/
 F:	package/libnss/
diff --git a/package/Config.in b/package/Config.in
index a058d7d2f0..40118b58b0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1456,6 +1456,7 @@ menu "Hardware handling"
 	source "package/let-me-create/Config.in"
 	source "package/libaio/Config.in"
 	source "package/libatasmart/Config.in"
+	source "package/libblockdev/Config.in"
 	source "package/libcec/Config.in"
 	source "package/libfreefare/Config.in"
 	source "package/libftdi/Config.in"
diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
new file mode 100644
index 0000000000..0b0a943d5f
--- /dev/null
+++ b/package/libblockdev/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_LIBBLOCKDEV
+	bool "libblockdev"
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HAS_THREADS # volume_key -> cryptsetup
+	depends on BR2_USE_MMU # lvm2, volume_key -> cryptsetup
+	depends on !BR2_STATIC_LIBS # volume_key -> cryptsetup
+	depends on BR2_SYSTEM_ENABLE_NLS # volume_key
+	select BR2_PACKAGE_LIBBYTESIZE
+	select BR2_PACKAGE_LIBYAML
+	select BR2_PACKAGE_PARTED
+	select BR2_PACKAGE_VOLUME_KEY
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX
+	help
+	  libblockdev is a C library supporting GObject introspection for
+	  manipulation of block devices
+
+	  https://github.com/storaged-project/libblockdev/
+
+comment "libblockdev needs udev /dev management and a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_HAS_UDEV
diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
new file mode 100644
index 0000000000..0bf9a2c934
--- /dev/null
+++ b/package/libblockdev/libblockdev.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 c5fc030474b44afcaedd8ea10388282534a6d5bb25488b780e645fbf0a6d4d80  libblockdev-2.23-1.tar.gz
+sha256 97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
new file mode 100644
index 0000000000..0dcab4c445
--- /dev/null
+++ b/package/libblockdev/libblockdev.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# libblockdev
+#
+################################################################################
+
+LIBBLOCKDEV_VERSION = 2.23-1
+LIBBLOCKDEV_SITE = $(call github,storaged-project,libblockdev,$(LIBBLOCKDEV_VERSION))
+LIBBLOCKDEV_LICENSE = LGPL-2.1+
+LIBBLOCKDEV_LICENSE_FILES = LICENSE
+LIBBLOCKDEV_DEPENDENCIES = host-autoconf-archive host-pkgconf kmod \
+			   libbytesize libyaml parted udev util-linux \
+			   volume_key
+LIBBLOCKDEV_INSTALL_STAGING = YES
+LIBBLOCKDEV_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
+LIBBLOCKDEV_AUTORECONF = YES
+
+LIBBLOCKDEV_CONF_OPTS = --without-nvdimm
+
+ifeq ($(BR2_PACKAGE_DMRAID),y)
+LIBBLOCKDEV_CONF_OPTS += --with-dmraid
+LIBBLOCKDEV_DEPENDENCIES += dmraid
+else
+LIBBLOCKDEV_CONF_OPTS += --without-dmraid
+endif
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBBLOCKDEV_CONF_OPTS += --enable-introspection=yes
+LIBBLOCKDEV_DEPENDENCIES += gobject-introspection
+else
+LIBBLOCKDEV_CONF_OPTS += --enable-introspection=no
+endif
+
+# Autoreconf requires an existing m4 directory
+define LIBBLOCKDEV_MKDIR_M4
+	mkdir -p $(@D)/m4
+endef
+LIBBLOCKDEV_POST_PATCH_HOOKS += LIBBLOCKDEV_MKDIR_M4
+
+$(eval $(autotools-package))
-- 
2.20.1
