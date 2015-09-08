From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue,  8 Sep 2015 23:28:51 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
	(without devtmpfs)
In-Reply-To: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are a few reasons for an embedded Linux system not to use devtmpfs,
but still want to have dynamic /dev management. The most notable is to use
a kernel < 2.6.32, which have no devtmpfs support.

For such corner cases, we introduce the ability to use busybox mdev for
/dev management even without devtmpfs.

First, we need the BR2_ROOTFS_STATIC_DEVICE_TABLE just like the static
/dev management, in order to have the very basic devices such as /dev/null
and /dev/console until mdev is enabled.

Then we mount a tmpfs on /dev and enable mdev using the incantations:

  /bin/mount -t tmpfs mdev /dev
  echo /sbin/mdev >/proc/sys/kernel/hotplug
  /sbin/mdev -s

But doing this in S10mdev, which already does something similar, would be a
bit complex because when S10mdev runs /dev/shm and /dev/pts are already
mounted. We might unmount, recreate and mount them again, but devices in
them might be already in use. Or we could leave the "old" alone, and mount
them again in the newly created /dev. Both solutions are dirty and
potentially problematic.

Instead we hook in inittab (both busybox and sysvinit) and do the same
incantations there, right after mounting /sys (needed for mdev) but before
any other actions on /dev, such as creating and mounting /dev/shm and
/dev/pts. We also skip installing S10mdev: it would do the same things
twice. In order to keep the inittab files concise and maintainable, this
taks is delegated to a helper script, /sbin/activate-mdev.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 linux/linux.mk                |  2 +-
 package/busybox/activate-mdev |  5 +++++
 package/busybox/busybox.mk    |  7 +++++++
 package/busybox/inittab       |  1 +
 package/skeleton/skeleton.mk  | 15 +++++++++++++++
 package/sysvinit/inittab      | 13 +++++++------
 system/Config.in              |  6 +++++-
 7 files changed, 41 insertions(+), 8 deletions(-)
 create mode 100755 package/busybox/activate-mdev

diff --git a/linux/linux.mk b/linux/linux.mk
index bbcc54b..bbac1e6 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -190,7 +190,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$${BR_BINARIES_DIR}/rootfs.cpio",$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config))
-	$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
+	$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC)$(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV_ONLY),,
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV),
diff --git a/package/busybox/activate-mdev b/package/busybox/activate-mdev
new file mode 100755
index 0000000..db2a53d
--- /dev/null
+++ b/package/busybox/activate-mdev
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+/bin/mount -t tmpfs mdev /dev
+echo /sbin/mdev >/proc/sys/kernel/hotplug
+/sbin/mdev -s
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 6e302f4..f95ff52 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -55,11 +55,18 @@ define BUSYBOX_PERMISSIONS
 endef
 
 # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV)$(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV_ONLY),y)
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
 define BUSYBOX_INSTALL_MDEV_SCRIPT
 	$(INSTALL) -D -m 0755 package/busybox/S10mdev \
 		$(TARGET_DIR)/etc/init.d/S10mdev
 endef
+else
+define BUSYBOX_INSTALL_MDEV_SCRIPT
+	$(INSTALL) -D -m 0755 package/busybox/activate-mdev \
+		$(TARGET_DIR)/sbin/activate-mdev
+endef
+endif
 define BUSYBOX_INSTALL_MDEV_CONF
 	$(INSTALL) -D -m 0644 package/busybox/mdev.conf \
 		$(TARGET_DIR)/etc/mdev.conf
diff --git a/package/busybox/inittab b/package/busybox/inittab
index 6703fc5..eaba42f 100644
--- a/package/busybox/inittab
+++ b/package/busybox/inittab
@@ -16,6 +16,7 @@
 # Startup the system
 null::sysinit:/bin/mount -t proc proc /proc
 null::sysinit:/bin/mount -t sysfs sysfs /sys
+#null::sysinit:/sbin/activate-mdev
 null::sysinit:/bin/mount -o remount,rw /
 null::sysinit:/bin/mkdir -p /dev/pts
 null::sysinit:/bin/mkdir -p /dev/shm
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 48e7085..975e2a5 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -141,6 +141,7 @@ TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_GETTY
 endif
 
 ifeq ($(BR2_INIT_BUSYBOX)$(BR2_INIT_SYSV),y)
+
 ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 # Find commented line, if any, and remove leading '#'s
 define SKELETON_SYSTEM_REMOUNT_RW
@@ -153,6 +154,20 @@ define SKELETON_SYSTEM_REMOUNT_RW
 endef
 endif
 TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_REMOUNT_RW
+
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV_ONLY),y)
+# Find commented line, if any, and remove leading '#'s
+define SKELETON_SYSTEM_EARLY_MDEV
+	$(SED) '/^#.*sbin\/activate-mdev$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
+endef
+else
+# Find uncommented line, if any, and add a leading '#'
+define SKELETON_SYSTEM_EARLY_MDEV
+	$(SED) '/^[^#].*sbin\/activate-mdev$$/s~^~#~' $(TARGET_DIR)/etc/inittab
+endef
+endif
+TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_EARLY_MDEV
+
 endif # BR2_INIT_BUSYBOX || BR2_INIT_SYSV
 
 endif # BR2_ROOTFS_SKELETON_DEFAULT
diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index 6ebf6fa..5abca7f 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -6,12 +6,13 @@ id:3:initdefault:
 
 si0::sysinit:/bin/mount -t proc proc /proc
 si1::sysinit:/bin/mount -t sysfs sysfs /sys
-si2::sysinit:/bin/mount -o remount,rw /
-si3::sysinit:/bin/mkdir -p /dev/pts
-si4::sysinit:/bin/mkdir -p /dev/shm
-si5::sysinit:/bin/mount -a
-si6::sysinit:/bin/hostname -F /etc/hostname
-si7::sysinit:/etc/init.d/rcS
+si2::sysinit:/sbin/activate-mdev
+si3::sysinit:/bin/mount -o remount,rw /
+si4::sysinit:/bin/mkdir -p /dev/pts
+si5::sysinit:/bin/mkdir -p /dev/shm
+si6::sysinit:/bin/mount -a
+si7::sysinit:/bin/hostname -F /etc/hostname
+si8::sysinit:/etc/init.d/rcS
 
 # S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
 
diff --git a/system/Config.in b/system/Config.in
index 5bf5048..a10de1e 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -106,6 +106,10 @@ choice
 config BR2_ROOTFS_DEVICE_CREATION_STATIC
 	bool "Static using device table"
 
+config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV_ONLY
+	bool "Dynamic using mdev only"
+	select BR2_PACKAGE_BUSYBOX
+
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
 	bool "Dynamic using devtmpfs only"
 
@@ -144,7 +148,7 @@ config BR2_ROOTFS_DEVICE_TABLE
 config BR2_ROOTFS_STATIC_DEVICE_TABLE
 	string "Path to the device tables"
 	default "system/device_table_dev.txt"
-	depends on BR2_ROOTFS_DEVICE_CREATION_STATIC
+	depends on BR2_ROOTFS_DEVICE_CREATION_STATIC || BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV_ONLY
 	help
 	  Specify a space-separated list of device table locations,
 	  that will be passed to the makedevs utility to create all
-- 
1.9.1
