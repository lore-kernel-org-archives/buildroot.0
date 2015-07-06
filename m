From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  6 Jul 2015 15:09:34 +0200
Subject: [Buildroot] [PATCH 1/2] system: allow using mdev for firmware
	loading only
Message-ID: <1436188175-7912-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Busybox's mdev nicely provides the ability to load a firmware requested by
the kernel.

However, when using a static /dev management, mdev is not installed as a
hotplug helper (i.e. S10mdev is not installed) and
CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not enabled in the busybox
configuration.

Provide a knob for static /dev users to easily enable mdev for firmware
loading.

This is just a matter of extending the ifeq condition around the S10mdev
installation and kconfig fixups that enable the needed configuration in
busybox. But leave mdev.conf installation under the old condition, it's
not needed for firmware loading.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/busybox/busybox.mk | 16 ++++++++++------
 system/Config.in           | 13 +++++++++++++
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 51b35bc..73a6d61 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -55,16 +55,13 @@ define BUSYBOX_PERMISSIONS
 	/usr/share/udhcpc/default.script f 755  0  0 - - - - -
 endef
 
-# If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
-ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
+# If mdev will be used for device creation, or at least for firmware loading,
+# enable it and copy S10mdev to /etc/init.d
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV)$(BR2_ROOTFS_MDEV_FIRMWARE_LOADING),y)
 define BUSYBOX_INSTALL_MDEV_SCRIPT
 	$(INSTALL) -D -m 0755 package/busybox/S10mdev \
 		$(TARGET_DIR)/etc/init.d/S10mdev
 endef
-define BUSYBOX_INSTALL_MDEV_CONF
-	$(INSTALL) -D -m 0644 package/busybox/mdev.conf \
-		$(TARGET_DIR)/etc/mdev.conf
-endef
 define BUSYBOX_SET_MDEV
 	$(call KCONFIG_ENABLE_OPT,CONFIG_MDEV,$(BUSYBOX_BUILD_CONFIG))
 	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_MDEV_CONF,$(BUSYBOX_BUILD_CONFIG))
@@ -73,6 +70,13 @@ define BUSYBOX_SET_MDEV
 endef
 endif
 
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
+define BUSYBOX_INSTALL_MDEV_CONF
+	$(INSTALL) -D -m 0644 package/busybox/mdev.conf \
+		$(TARGET_DIR)/etc/mdev.conf
+endef
+endif
+
 # sha passwords need USE_BB_CRYPT_SHA
 ifeq ($(BR2_TARGET_GENERIC_PASSWD_SHA256)$(BR2_TARGET_GENERIC_PASSWD_SHA512),y)
 define BUSYBOX_SET_CRYPT_SHA
diff --git a/system/Config.in b/system/Config.in
index b72aa17..da2376e 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -127,6 +127,19 @@ endchoice
 comment "/dev management using udev (from systemd)"
 	depends on BR2_INIT_SYSTEMD
 
+config BR2_ROOTFS_MDEV_FIRMWARE_LOADING
+	bool "Use mdev for firmware loading"
+	depends on BR2_ROOTFS_DEVICE_CREATION_STATIC
+	help
+	  Some devices need to load firmware before they can be usable.
+	  The kernel will ask the (userspace) hotplug helper to provide
+	  a firmware.
+
+	  Even if you do not need mdev for device creation, say Y if you
+	  want to install it as a hotplug helper so it takes care of
+	  firmware loading. Otherwise you need to setup a different
+	  mechanism for your firmwares to be loaded.
+
 config BR2_ROOTFS_DEVICE_TABLE
 	string "Path to the permission tables"
 	default "system/device_table.txt"
-- 
1.9.1
