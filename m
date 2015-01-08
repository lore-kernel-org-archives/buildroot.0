From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  8 Jan 2015 21:09:56 +0100
Subject: [Buildroot] [PATCH] ads7846-device: new package
In-Reply-To: <1420747796-28272-1-git-send-email-ps.report@gmx.net>
References: <1420747796-28272-1-git-send-email-ps.report@gmx.net>
Message-ID: <1420747796-28272-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 linux/linux.mk                           |  6 ++++++
 package/Config.in                        |  1 +
 package/ads7846-device/Config.in         | 11 +++++++++++
 package/ads7846-device/ads7846-device.mk | 21 +++++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/ads7846-device/Config.in
 create mode 100644 package/ads7846-device/ads7846-device.mk

diff --git a/linux/linux.mk b/linux/linux.mk
index 8256641..97056aa 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -196,6 +196,12 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
+	$(if $(BR2_PACKAGE_ADS7846_DEVICE),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SPI,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SPI_BCM2708,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_INPUT,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_INPUT_TOUCHSCREEN,$(@D)/.config)
+		$(call KCONFIG_SET_OPT,CONFIG_TOUCHSCREEN_ADS7846,m,$(@D)/.config))
 	$(if $(BR2_PACKAGE_KTAP),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_EVENT_TRACING,$(@D)/.config)
diff --git a/package/Config.in b/package/Config.in
index 3b37bb2..98df82d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -286,6 +286,7 @@ menu "Firmware"
 endmenu
 	source "package/a10disp/Config.in"
 	source "package/acpid/Config.in"
+	source "package/ads7846-device/Config.in"
 	source "package/am335x-pru-package/Config.in"
 	source "package/avrdude/Config.in"
 	source "package/bcache-tools/Config.in"
diff --git a/package/ads7846-device/Config.in b/package/ads7846-device/Config.in
new file mode 100644
index 0000000..6a0968b
--- /dev/null
+++ b/package/ads7846-device/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_ADS7846_DEVICE
+	bool "ads7846-device"
+	depends on BR2_LINUX_KERNEL
+	help
+	  A kernel module for registering an ads7846 touchscreen device
+	  e.g. for Raspberry Pi Waveshare 3.2inch RPi LCD (B).
+
+	  https://github.com/notro/fbtft_tools/wiki/ads7846_device
+
+comment "ads7846-device needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/ads7846-device/ads7846-device.mk b/package/ads7846-device/ads7846-device.mk
new file mode 100644
index 0000000..48a1893
--- /dev/null
+++ b/package/ads7846-device/ads7846-device.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# ads7846-device
+#
+################################################################################
+
+ADS7846_DEVICE_VERSION = 013d9b93fc79f3992626b1ce7c4fb7980e2fb778
+ADS7846_DEVICE_SITE = $(call github,notro,fbtft_tools,$(ADS7846_DEVICE_VERSION))
+ADS7846_DEVICE_LICENSE = GPLv2+
+
+ADS7846_DEVICE_DEPENDENCIES = linux
+
+define ADS7846_DEVICE_BUILD_CMDS
+	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M=$(@D)/ads7846_device
+endef
+
+define ADS7846_DEVICE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M="$(@D)/ads7846_device" modules_install
+endef
+
+$(eval $(generic-package))
-- 
2.1.2
