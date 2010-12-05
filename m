From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:53:16 +0100
Subject: [Buildroot] [PATCH 45/55] Create menu entry to select device
	creation method
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d166de76db4ed6fb2616a4dcc262694139b072e9.1291582352.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegor_sub1@visionsystems.de>

Four methods for the creation of device files in /dev are now
proposed:

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

diff --git a/fs/Config.in b/fs/Config.in
index 188e815..9ac3acc 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -15,13 +15,34 @@ config BR2_ROOTFS_POST_BUILD_SCRIPT
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
+	  Specify the location of a device table, that will be passed
+	  to the makedevs utility to create all the special device
+	  files in the target filesystem.
 
 choice
 	prompt "Root FS skeleton"
diff --git a/linux/linux.mk b/linux/linux.mk
index 8dc7dd0..f7b0889 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -109,6 +109,13 @@ ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.initramfs\",$(@D)/.config)
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
 
diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
new file mode 100644
index 0000000..472810b
--- /dev/null
+++ b/package/busybox/S10mdev
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
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index b7f4740..d4b04a9 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -20,6 +20,19 @@ ifndef BUSYBOX_CONFIG_FILE
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
@@ -114,6 +127,7 @@ define BUSYBOX_CONFIGURE_CMDS
 	$(BUSYBOX_SET_IPV6)
 	$(BUSYBOX_SET_RPC)
 	$(BUSYBOX_PREFER_STATIC)
+	$(BUSYBOX_SET_MDEV)
 	$(BUSYBOX_NETKITBASE)
 	$(BUSYBOX_NETKITTELNET)
 	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
@@ -142,6 +156,7 @@ endif
 define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_BINARY)
 	-chmod a+rx $(TARGET_DIR)/usr/share/udhcpc/default.script
+	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 endef
 
 define BUSYBOX_UNINSTALL_TARGET_CMDS
-- 
1.7.0.4
