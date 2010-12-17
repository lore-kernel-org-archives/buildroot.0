From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 17 Dec 2010 11:43:29 +0100
Subject: [Buildroot] [PATCH v2] Create menu entry to select device creation
	method
Message-ID: <4D0B3ED1.7040504@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter and Thomas,

what do you think about this approach? I've used the mini_device_table.txt that has almost no device definitions to manage the file permissions.
One drawback is that I had to split BR2_ROOTFS_DEVICE_TABLE into two macros so I could independently configure device tables for various methods. If this approach is accepted, one will have to update boards default configs, so that they configure BR2_ROOTFS_STATIC_DEVICE_TABLE instead of BR2_ROOTFS_DEVICE_TABLE.

Best regards,
Yegor

--------------------------------------------------------------

Four methods for the creation of device files in /dev are now
provided:

 - static method uses device table as before
 - devtmpfs method enables this feature in kernel
 - mdev method adds mdev starting script to the file system
    and selects mdev itself for installation
 - udev method selects udev for installation

All dynamic methods are based on devtmpfs, so one doesn't need to care
about /dev folder.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/Config.in               |   33 +++++++++++++++++++++++++++------
 linux/linux.mk             |    7 +++++++
 package/busybox/S10mdev    |   22 ++++++++++++++++++++++
 package/busybox/busybox.mk |   15 +++++++++++++++
 4 files changed, 71 insertions(+), 6 deletions(-)
 create mode 100644 package/busybox/S10mdev

Index: b/fs/Config.in
===================================================================
--- a/fs/Config.in	2010-10-13 09:04:53.000000000 +0200
+++ b/fs/Config.in	2010-12-17 10:24:31.000000000 +0100
@@ -15,13 +15,56 @@
 	  only argument. Make sure the exit code of that script is 0,
 	  otherwise make will stop after calling it.
 
+choice
+	prompt "/dev management"
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
+	select BR2_PACKAGE_BUSYBOX
+
+config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	bool "Dynamic using udev"
+	select BR2_PACKAGE_UDEV
+
+endchoice
+
+config BR2_ROOTFS_STATIC_DEVICE_TABLE
+	string "Path to the device table"
+	depends on BR2_ROOTFS_DEVICE_CREATION_STATIC
+	default "target/generic/device_table.txt"
+	help
+	  Specify the location of a device table, that will be passed
+	  to the makedevs utility to create all the special device
+	  files in the target filesystem.
+
+config BR2_ROOTFS_MINI_DEVICE_TABLE
+	string "Path to the device table"
+	depends on (BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS \
+	  || BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV \
+	  || BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV)
+	default "target/generic/mini_device_table.txt"
+	help
+	  Specify the location of a device table, that will be passed
+	  to the makedevs utility to create the minimum of the special device
+	  files in the target filesystem.
+
 config BR2_ROOTFS_DEVICE_TABLE
-       string "Path to the device table"
-       default "target/generic/device_table.txt"
-       help
-         Specify the location of a device table, that will be passed
-         to the makedevs utility to create all the special device
-         files in the target filesystem.
+	string
+	default BR2_ROOTFS_STATIC_DEVICE_TABLE \
+	  if BR2_ROOTFS_DEVICE_CREATION_STATIC
+	default BR2_ROOTFS_MINI_DEVICE_TABLE \
+	  if BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
+	default BR2_ROOTFS_MINI_DEVICE_TABLE \
+	  if BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
+	default BR2_ROOTFS_MINI_DEVICE_TABLE \
+	  if BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 
 choice
 	prompt "Root FS skeleton"
Index: b/linux/linux.mk
===================================================================
--- a/linux/linux.mk	2010-12-14 12:26:51.000000000 +0100
+++ b/linux/linux.mk	2010-12-17 08:48:38.000000000 +0100
@@ -111,6 +111,13 @@
 	$(call KCONFIG_DISABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE,$(@D)/.config)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(@D)/.config)
 endif
+ifneq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config)
+endif
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
+	$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config)
+endif
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig
 	$(Q)touch $@
 
Index: b/package/busybox/S10mdev
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ b/package/busybox/S10mdev	2010-12-17 08:48:38.000000000 +0100
@@ -0,0 +1,22 @@
+#!/bin/sh
+#
+# Start mdev....
+#
+
+case "$1" in
+  start)
+ 	echo "Starting mdev..."
+	/sbin/mdev -s
+	;;
+  stop)
+	;;
+  restart|reload)
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
--- a/package/busybox/busybox.mk	2010-12-14 12:26:51.000000000 +0100
+++ b/package/busybox/busybox.mk	2010-12-17 10:25:46.000000000 +0100
@@ -20,6 +20,17 @@
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
+endef
+endif
+
 # If we have external syslogd, force busybox to use it
 ifeq ($(BR2_PACKAGE_SYSKLOGD),y)
 define BUSYBOX_SET_SYSKLOGD
@@ -114,6 +125,7 @@
 	$(BUSYBOX_SET_IPV6)
 	$(BUSYBOX_SET_RPC)
 	$(BUSYBOX_PREFER_STATIC)
+	$(BUSYBOX_SET_MDEV)
 	$(BUSYBOX_NETKITBASE)
 	$(BUSYBOX_NETKITTELNET)
 	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
@@ -141,6 +153,7 @@
 
 define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_BINARY)
+ 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	if [ ! -f $(TARGET_DIR)/usr/share/udhcpc/default.script ]; then \
 		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
 			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
