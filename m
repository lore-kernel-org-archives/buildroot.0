From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 13 Jan 2014 16:45:03 +0100
Subject: [Buildroot] [PATCH v6 2/5] eudev: new package.
In-Reply-To: <1389627907-7821-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1389627907-7821-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1389627907-7821-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

eudev is a userspace device management daemon. It is a standalone
version, independent from systemd. It is a fork maintained by Gentoo.

Features:

 - No extra configuration options are available: Gudev is build if
   libglib2 is selected.
 - No dependency on hwdata as the package uses its own hardware
   database (as does systemd).

eudev 1.3 is in sync with systemd v207.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 linux/linux.mk                  |    2 +-
 package/Config.in               |    1 +
 package/eudev/Config.in         |   37 ++++++++++++++++++++++++++++++
 package/{udev => eudev}/S10udev |    2 +-
 package/eudev/eudev.mk          |   48 +++++++++++++++++++++++++++++++++++++++
 system/Config.in                |   15 ++++++++++++
 6 files changed, 103 insertions(+), 2 deletions(-)
 create mode 100644 package/eudev/Config.in
 copy package/{udev => eudev}/S10udev (98%)
 create mode 100644 package/eudev/eudev.mk

diff --git a/linux/linux.mk b/linux/linux.mk
index ab25fe9..17365a0 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -185,7 +185,7 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
-	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),
+	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
 	$(if $(BR2_PACKAGE_KTAP),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS,$(@D)/.config)
diff --git a/package/Config.in b/package/Config.in
index aac6f02..e37b33c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -279,6 +279,7 @@ source "package/dmraid/Config.in"
 source "package/dvb-apps/Config.in"
 source "package/dvbsnoop/Config.in"
 source "package/eeprog/Config.in"
+source "package/eudev/Config.in"
 source "package/evemu/Config.in"
 source "package/evtest/Config.in"
 source "package/fan-ctrl/Config.in"
diff --git a/package/eudev/Config.in b/package/eudev/Config.in
new file mode 100644
index 0000000..b3462d5
--- /dev/null
+++ b/package/eudev/Config.in
@@ -0,0 +1,37 @@
+config BR2_PACKAGE_EUDEV
+	bool "eudev"
+	depends on !BR2_avr32 # no epoll_create1
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
+	depends on BR2_LARGEFILE # util-linux
+	depends on BR2_USE_WCHAR # util-linux
+	depends on !BR2_PREFER_STATIC_LIB # kmod
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_KMOD
+	help
+	  Userspace device daemon. This is a standalone version,
+	  independent of systemd. It is a fork maintained by Gentoo.
+
+	  eudev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
+	  and inotify.
+
+	  http://github.com/gentoo/eudev/
+
+if BR2_PACKAGE_EUDEV
+
+config BR2_PACKAGE_EUDEV_RULES_GEN
+	bool "enable rules generator"
+	help
+	  Enable persistant rules generator
+
+endif
+
+comment "eudev needs /dev management set to eudev"
+	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
+
+comment "eudev needs a toolchain w/ largefile, wchar"
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+
+comment "eudev needs a toolchain w/ dynamic library"
+	depends on BR2_avr32
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/udev/S10udev b/package/eudev/S10udev
similarity index 98%
copy from package/udev/S10udev
copy to package/eudev/S10udev
index 2c7b7e9..e4d28a2 100755
--- a/package/udev/S10udev
+++ b/package/eudev/S10udev
@@ -17,7 +17,7 @@
 #
 
 # Check for missing binaries
-UDEV_BIN=/lib/udev/udevd
+UDEV_BIN=/sbin/udevd
 test -x $UDEV_BIN || exit 5
 
 # Check for config file and read it
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
new file mode 100644
index 0000000..aac37e7
--- /dev/null
+++ b/package/eudev/eudev.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# eudev
+#
+################################################################################
+
+EUDEV_VERSION         = 1.3
+EUDEV_SITE            = https://github.com/gentoo/eudev/archive/
+EUDEV_SOURCE          = v$(EUDEV_VERSION).tar.gz
+EUDEV_LICENSE         = GPLv2+
+EUDEV_LICENSE_FILES   = COPYING
+EUDEV_INSTALL_STAGING = YES
+EUDEV_AUTORECONF      = YES
+
+# mq_getattr is in librt
+EUDEV_CONF_ENV += LIBS=-lrt
+
+EUDEV_CONF_OPT =		\
+	--sbindir=/sbin		\
+	--with-rootlibdir=/lib	\
+	--libexecdir=/lib	\
+	--with-firmware-path=/lib/firmware	\
+	--disable-introspection			\
+	--enable-split-usr			\
+	--enable-libkmod
+
+EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
+
+ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
+EUDEV_CONF_OPT += --enable-rule_generator
+endif
+
+ifeq ($(BR2_LARGEFILE),)
+EUDEV_CONF_OPT += --disable-largefile
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+EUDEV_CONF_OPT += --enable-gudev
+EUDEV_DEPENDENCIES += libglib2
+else
+EUDEV_CONF_OPT += --disable-gudev
+endif
+
+define EUDEV_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
+endef
+
+$(eval $(autotools-package))
diff --git a/system/Config.in b/system/Config.in
index 8288335..7f4d851 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -136,6 +136,21 @@ comment "udev doesn't work with 'prefer static libraries'"
 	depends on !BR2_avr32 # udev
 	depends on BR2_PREFER_STATIC_LIB
 
+config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
+	bool "Dynamic using eudev"
+	depends on !BR2_avr32 # eudev
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR
+	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_PACKAGE_EUDEV
+
+comment "eudev needs a toolchain w/ largefile, wchar"
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+
+comment "eudev needs a toolchain w/ dynamic library"
+	depends on BR2_avr32 # eudev
+	depends on BR2_PREFER_STATIC_LIB
+
 endchoice
 
 config BR2_ROOTFS_DEVICE_TABLE
-- 
1.7.9.5
