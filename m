From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 14 Sep 2010 12:07:19 +0200
Subject: [Buildroot] [PATCH 1/1] Customize device creation
Message-ID: <4C8F4957.5030309@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Create menu entry to select device creation method:

- static method uses device table as before
- devtmpfs method enables this feature in kernel
- mdev method adds mdev starting script to the file system
  and selects mdev itself for installation
- udev method selects udev for installation 

All dynamic methods are base on devtmpfs, so one doesn't
need to care about /dev folder.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Index: b/fs/Config.in
===================================================================
--- a/fs/Config.in	2010-09-14 11:32:40.000000000 +0200
+++ b/fs/Config.in	2010-09-14 11:32:58.000000000 +0200
@@ -15,13 +15,34 @@
 	  only argument. Make sure the exit code of that script is 0,
 	  otherwise make will stop after calling it.
 
+choice
+	prompt "Device Creation"
+	default BR2_ROOTFS_DEVICE_CREATION_STATIC
+
+config BR2_ROOTFS_DEVICE_CREATION_STATIC
+	bool "Static using device table"
+
+config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
+	bool "Dynamic using devtmpfs only"
+
+config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
+	bool "Dynamic using mdev"
+
+config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	bool "Dynamic using udev"
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_UDEV
+
+endchoice
+
 config BR2_ROOTFS_DEVICE_TABLE
-       string "Path to the device table"
-       default "target/generic/device_table.txt"
-       help
-         Specify the location of a device table, that will be passed
-         to the makedevs utility to create all the special device
-         files in the target filesystem.
+	string "Path to the device table"
+	depends on BR2_ROOTFS_DEVICE_CREATION_STATIC
+	default "target/generic/device_table.txt"
+	help
+	 Specify the location of a device table, that will be passed
+	 to the makedevs utility to create all the special device
+	 files in the target filesystem.
 
 choice
 	prompt "Root FS skeleton"
Index: b/package/busybox/S10mdev
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ b/package/busybox/S10mdev	2010-09-14 11:32:58.000000000 +0200
@@ -0,0 +1,26 @@
+#!/bin/sh
+#
+# Start the mdev....
+#
+
+case "$1" in
+  start)
+ 	echo "Starting mdev..."
+	/sbin/mdev -s
+	;;
+  stop)
+	echo -n "Stopping mdev..."
+	killall mdev
+	;;
+  restart|reload)
+	"$0" stop
+	"$0" start
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
+
+
Index: b/package/busybox/busybox.mk
===================================================================
--- a/package/busybox/busybox.mk	2010-09-14 11:32:40.000000000 +0200
+++ b/package/busybox/busybox.mk	2010-09-14 11:33:57.000000000 +0200
@@ -20,6 +20,19 @@
 	BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
 endif
 
+# If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
+define BUSYBOX_INSTALL_MDEV_SCRIPT
+	install -m 0755 package/busybox/S10mdev $(TARGET_DIR)/etc/init.d
+endef
+define BUSYBOX_SET_MDEV
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MDEV,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_MDEV_CONF,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_MDEV_EXEC,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_MDEV_LOAD_FIRMWARE,$(BUSYBOX_BUILD_CONFIG))
+endef
+endif
+
 # If we have external syslogd, force busybox to use it
 ifeq ($(BR2_PACKAGE_SYSKLOGD),y)
 define BUSYBOX_SET_SYSKLOGD
@@ -114,6 +127,7 @@
 	$(BUSYBOX_SET_IPV6)
 	$(BUSYBOX_SET_RPC)
 	$(BUSYBOX_PREFER_STATIC)
+	$(BUSYBOX_SET_MDEV)
 	$(BUSYBOX_NETKITBASE)
 	$(BUSYBOX_NETKITTELNET)
 	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
@@ -142,6 +156,7 @@
 define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_BINARY)
 	-chmod a+rx $(TARGET_DIR)/usr/share/udhcpc/default.script
+	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 endef
 
 define BUSYBOX_UNINSTALL_TARGET_CMDS
Index: b/linux/linux.mk
===================================================================
--- a/linux/linux.mk	2010-09-14 11:32:40.000000000 +0200
+++ b/linux/linux.mk	2010-09-14 11:32:58.000000000 +0200
@@ -108,6 +108,10 @@
 	$(call KCONFIG_DISABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config)
 	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"\",$(@D)/.config)
 endif
+ifneq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config)
+endif
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig
 	$(Q)touch $@
 
