From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed,  6 Nov 2013 16:34:36 +0100
Subject: [Buildroot] [PATCH v3 3/5] eudev: new package.
In-Reply-To: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1383752078-25315-4-git-send-email-eric.le.bihan.dev@free.fr>
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
 package/Config.in       |    1 +
 package/eudev/Config.in |   26 ++++++++++++++++++++++++
 package/eudev/S10udev   |   48 +++++++++++++++++++++++++++++++++++++++++++++
 package/eudev/eudev.mk  |   50 +++++++++++++++++++++++++++++++++++++++++++++++
 system/Config.in        |   13 ++++++++++++
 5 files changed, 138 insertions(+)
 create mode 100644 package/eudev/Config.in
 create mode 100755 package/eudev/S10udev
 create mode 100644 package/eudev/eudev.mk

diff --git a/package/Config.in b/package/Config.in
index 4c4da51..4c349da 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -274,6 +274,7 @@ source "package/dmraid/Config.in"
 source "package/dvb-apps/Config.in"
 source "package/dvbsnoop/Config.in"
 source "package/eeprog/Config.in"
+source "package/eudev/Config.in"
 source "package/evtest/Config.in"
 source "package/fan-ctrl/Config.in"
 source "package/fconfig/Config.in"
diff --git a/package/eudev/Config.in b/package/eudev/Config.in
new file mode 100644
index 0000000..5a89325
--- /dev/null
+++ b/package/eudev/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_EUDEV
+	bool "eudev"
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
+	depends on BR2_LARGEFILE # util-linux
+	depends on BR2_USE_WCHAR # util-linux
+	depends on !BR2_PACKAGE_SYSTEMD
+	select BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_KMOD
+	help
+          Userspace device daemon. This is a standalone version,
+          independent of systemd. It is a fork maintained by Gentoo.
+
+	  eudev requires a Linux kernel >= 2.6.34: it relies on devtmpfs.
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
index 0000000..8603c42
--- /dev/null
+++ b/package/eudev/eudev.mk
@@ -0,0 +1,50 @@
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
+	EUDEV_CONF_OPT += --enable-rule_generator
+endif
+
+ifneq ($(BR2_LARGEFILE),y)
+	EUDEV_CONF_OPT += --disable-largefile
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+	EUDEV_CONF_OPT += --enable-gudev
+	EUDEV_DEPENDENCIES += libglib2
+else
+	EUDEV_CONF_OPT += --disable-gudev
+endif
+
+define EUDEV_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
+endef
+
+EUDEV_POST_INSTALL_TARGET_HOOKS += EUDEV_INSTALL_INIT_SYSV
+
+$(eval $(autotools-package))
diff --git a/system/Config.in b/system/Config.in
index 1fe4127..1867b25 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -126,6 +126,19 @@ comment "udev requires a toolchain with LARGEFILE + WCHAR support"
 comment "udev doesn't work with 'prefer static libraries'"
 	depends on BR2_PREFER_STATIC_LIB
 
+config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
+	bool "Dynamic using eudev"
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR
+	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_PACKAGE_EUDEV
+
+comment "eudev requires a toolchain w/ largefile, wchar"
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+
+comment "eudev requires a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
 endchoice
 
 config BR2_ROOTFS_DEVICE_TABLE
-- 
1.7.9.5
