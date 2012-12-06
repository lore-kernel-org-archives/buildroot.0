From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  6 Dec 2012 23:50:00 +0100
Subject: [Buildroot] [PATCH 2/2] b43-firmware: new package
In-Reply-To: <1354834200-31532-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1354834200-31532-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1354834200-31532-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package allows to download the Broadcom Wifi drivers, extract the
firmware from them, and install them in /lib/firmware, so that they
can be used by the open-source kernel driver b43.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/b43-firmware/Config.in       |   25 +++++++++++++++++++++++++
 package/b43-firmware/b43-firmware.mk |   29 +++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 package/b43-firmware/Config.in
 create mode 100644 package/b43-firmware/b43-firmware.mk

diff --git a/package/Config.in b/package/Config.in
index f95e29d..e313337 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -197,6 +197,7 @@ endmenu
 
 menu "Hardware handling"
 source "package/acpid/Config.in"
+source "package/b43-firmware/Config.in"
 source "package/cdrkit/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
diff --git a/package/b43-firmware/Config.in b/package/b43-firmware/Config.in
new file mode 100644
index 0000000..ab7f4a7
--- /dev/null
+++ b/package/b43-firmware/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_B43_FIRMWARE
+	bool "b43-firware"
+	help
+	  Firmware for the Broadcom Wifi devices supported by the b43
+	  kernel driver.
+
+if BR2_PACKAGE_B43_FIRMWARE
+
+choice
+	prompt "Kernel version"
+	default BR2_PACKAGE_B43_FIRMWARE_KERNEL_AFTER_3_2
+	help
+	  Select the kernel version you're using. The b43 driver in
+	  kernel >= 3.2 need a different firmware than the b43 drivers
+	  from kernel < 3.2.
+
+	config BR2_PACKAGE_B43_FIRMWARE_KERNEL_AFTER_3_2
+		bool ">= 3.2"
+
+	config BR2_PACKAGE_B43_FIRMWARE_KERNEL_BEFORE_3_2
+		bool "< 3.2"
+
+endchoice
+
+endif
diff --git a/package/b43-firmware/b43-firmware.mk b/package/b43-firmware/b43-firmware.mk
new file mode 100644
index 0000000..a4383e4
--- /dev/null
+++ b/package/b43-firmware/b43-firmware.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# b43-firmware
+#
+#############################################################
+
+ifeq ($(BR2_PACKAGE_B43_FIRMWARE_KERNEL_AFTER_3_2),y)
+B43_FIRMWARE_VERSION = 5.100.138
+B43_FIRMWARE_SITE = http://www.lwfinger.com/b43-firmware/
+B43_FIRMWARE_SOURCE = broadcom-wl-$(B43_FIRMWARE_VERSION).tar.bz2
+B43_FIRMWARE_DRIVER_FILE = linux/wl_apsta.o
+else ifeq ($(BR2_PACKAGE_B43_FIRMWARE_KERNEL_BEFORE_3_2),y)
+B43_FIRMWARE_VERSION = 5.10.56.27.3
+B43_FIRMWARE_SITE = http://mirror2.openwrt.org/sources/
+B43_FIRMWARE_SOURCE = broadcom-wl-$(B43_FIRMWARE_VERSION)_mipsel.tar.bz2
+B43_FIRMWARE_DRIVER_FILE = driver/wl_apsta/wl_prebuilt.o
+endif
+
+B43_FIRMWARE_LICENSE = PROPRIETARY
+B43_FIRMWARE_REDISTRIBUTE = NO
+
+B43_FIRMWARE_DEPENDENCIES = host-b43-fwcutter
+
+define B43_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/firmware/
+	$(HOST_DIR)/usr/bin/b43-fwcutter -w $(TARGET_DIR)/lib/firmware/ $(@D)/$(B43_FIRMWARE_DRIVER_FILE)
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
