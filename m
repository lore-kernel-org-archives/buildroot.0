From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Feb 2014 22:14:16 +0100
Subject: [Buildroot] [git commit branch/next] eudev: new package
Message-ID: <20140212213526.0B5639C9C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=937a95449ecaad02386523f8fe2eeefbea6be971
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

eudev is a userspace device management daemon. It is a standalone
version, independent from systemd. It is a fork maintained by Gentoo.

Features:

 - No extra configuration options are available: Gudev is build if
   libglib2 is selected.
 - No dependency on hwdata as the package uses its own hardware
   database (as does systemd).

eudev 1.3 is in sync with systemd v207.

[Peter: add BR2_USE_MMU dependency]
Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk          |    2 +
 package/Config.in       |    1 +
 package/eudev/Config.in |   38 +++++++++++++++++++++++++++++++++++++
 package/eudev/S10udev   |   48 +++++++++++++++++++++++++++++++++++++++++++++++
 package/eudev/eudev.mk  |   43 ++++++++++++++++++++++++++++++++++++++++++
 system/Config.in        |   12 +++++++++++
 6 files changed, 144 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 6038467..34ea924 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -188,6 +188,8 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
+	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
 	$(if $(BR2_PACKAGE_KTAP),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_EVENT_TRACING,$(@D)/.config)
diff --git a/package/Config.in b/package/Config.in
index c323711..b8b2f4e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -278,6 +278,7 @@ source "package/dmraid/Config.in"
 source "package/dvb-apps/Config.in"
 source "package/dvbsnoop/Config.in"
 source "package/eeprog/Config.in"
+source "package/eudev/Config.in"
 source "package/evemu/Config.in"
 source "package/evtest/Config.in"
 source "package/fan-ctrl/Config.in"
diff --git a/package/eudev/Config.in b/package/eudev/Config.in
new file mode 100644
index 0000000..9d2eb1b
--- /dev/null
+++ b/package/eudev/Config.in
@@ -0,0 +1,38 @@
+config BR2_PACKAGE_EUDEV
+	bool "eudev"
+	depends on !BR2_avr32 # no epoll_create1
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
+	depends on BR2_USE_MMU # uses fork()
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
+	  Enable persistent rules generator
+
+endif
+
+comment "eudev needs eudev /dev management"
+	depends on !BR2_avr32
+	depends on BR2_USE_MMU
+	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
+
+comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
+	depends on !BR2_avr32
+	depends on BR2_USE_MMU
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
diff --git a/package/eudev/S10udev b/package/eudev/S10udev
new file mode 100755
index 0000000..e4d28a2
--- /dev/null
+++ b/package/eudev/S10udev
@@ -0,0 +1,48 @@
+#!/bin/sh
+#
+# udev	This is a minimal non-LSB version of a UDEV startup script.  It
+#	was derived by stripping down the udev-058 LSB version for use
+#	with buildroot on embedded hardware using Linux 2.6.34+ kernels.
+#
+#	You may need to customize this for your system's resource limits
+#	(including startup time!) and administration.  For example, if
+#	your early userspace has a custom initramfs or initrd you might
+#	need /dev much earlier; or without hotpluggable busses (like USB,
+#	PCMCIA, MMC/SD, and so on) your /dev might be static after boot.
+#
+#	This script assumes your system boots right into the eventual root
+#	filesystem, and that init runs this udev script before any programs
+#	needing more device nodes than the bare-bones set -- /dev/console,
+#	/dev/zero, /dev/null -- that's needed to boot and run this script.
+#
+
+# Check for missing binaries
+UDEV_BIN=/sbin/udevd
+test -x $UDEV_BIN || exit 5
+
+# Check for config file and read it
+UDEV_CONFIG=/etc/udev/udev.conf
+test -r $UDEV_CONFIG || exit 6
+. $UDEV_CONFIG
+
+case "$1" in
+    start)
+        echo -n "Populating ${udev_root:-/dev} using udev: "
+        echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
+        $UDEV_BIN -d || (echo "FAIL" && exit 1)
+        udevadm trigger
+        echo "done"
+        ;;
+    stop)
+        # Stop execution of events
+        udevadm control --stop-exec-queue
+        killall udevd
+        ;;
+    *)
+        echo "Usage: $0 {start|stop}"
+        exit 1
+        ;;
+esac
+
+
+exit 0
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
new file mode 100644
index 0000000..ffa413f
--- /dev/null
+++ b/package/eudev/eudev.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# eudev
+#
+################################################################################
+
+EUDEV_VERSION = 1.3
+EUDEV_SITE = $(call github,gentoo,eudev,v$(EUDEV_VERSION))
+EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
+EUDEV_LICENSE_FILES = COPYING
+EUDEV_INSTALL_STAGING = YES
+EUDEV_AUTORECONF = YES
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
index 181a0ac..d1b0cbb 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -137,6 +137,18 @@ comment "udev doesn't work with 'prefer static libraries'"
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
+comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
+	depends on !BR2_avr32 # eudev
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+
 endchoice
 
 config BR2_ROOTFS_DEVICE_TABLE
