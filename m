From: Abhimanyu V <abhimanyu.vishwakarma@imgtec.com>
Date: Thu, 16 Mar 2017 17:13:20 +0530
Subject: [Buildroot] [PATCH v4 1/3] uccp420wlan: new package
Message-ID: <1489664602-32596-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>

Wifi kernel module and firmware for Imagination explorer RPU

Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Reviewed-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
---
 Changes v1->v2
  - add hash file
 Changes v2->v3 (Suggested by Arnout)
  - remove patch and bump version
  - add proprietary license file to LICENSE_FILES
  - Fix help text indentation to below 72 columns
 Changes v3->v4 (Suggested by Arnout)
  - use UCCP420WLAN_INSTALL_TARGET_CMDS instead of HOOKS

 package/Config.in                    |  1 +
 package/uccp420wlan/Config.in        | 14 ++++++++++++++
 package/uccp420wlan/uccp420wlan.hash |  2 ++
 package/uccp420wlan/uccp420wlan.mk   | 18 ++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/uccp420wlan/Config.in
 create mode 100644 package/uccp420wlan/uccp420wlan.hash
 create mode 100644 package/uccp420wlan/uccp420wlan.mk

diff --git a/package/Config.in b/package/Config.in
index 85e4dee..18d00b0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -479,6 +479,7 @@ endmenu
 	source "package/triggerhappy/Config.in"
 	source "package/uboot-tools/Config.in"
 	source "package/ubus/Config.in"
+	source "package/uccp420wlan/Config.in"
 	source "package/udev/Config.in"
 	source "package/udisks/Config.in"
 	source "package/upower/Config.in"
diff --git a/package/uccp420wlan/Config.in b/package/uccp420wlan/Config.in
new file mode 100644
index 0000000..40abc8e
--- /dev/null
+++ b/package/uccp420wlan/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_UCCP420WLAN
+	bool "uccp420wlan"
+	depends on BR2_LINUX_KERNEL
+	help
+	  SoftMAC (mac80211) based WiFi driver for Imagination's
+	  Explorer RPU uccp420. This supports Dual Band WiFi with
+	  2.4GHz - 2x2 b/g/n 40MHz, 5GHz - 2x2 a/n/11ac 80MHz modes
+
+	  Used in creator ci40 board.
+
+	  https://github.com/CreatorDev/uccp420wlan
+
+comment "uccp420wlan needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/uccp420wlan/uccp420wlan.hash b/package/uccp420wlan/uccp420wlan.hash
new file mode 100644
index 0000000..41f60a4
--- /dev/null
+++ b/package/uccp420wlan/uccp420wlan.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 1d4de62fc842dbab739708cf0d9ebce270fcdf63c1c13ac676cbc253acdaa3bb uccp420wlan-v6.9.1.tar.gz
diff --git a/package/uccp420wlan/uccp420wlan.mk b/package/uccp420wlan/uccp420wlan.mk
new file mode 100644
index 0000000..1496a92
--- /dev/null
+++ b/package/uccp420wlan/uccp420wlan.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# uccp420wlan
+#
+################################################################################
+
+UCCP420WLAN_VERSION = v6.9.1
+UCCP420WLAN_SITE = $(call github,CreatorDev,uccp420wlan,$(UCCP420WLAN_VERSION))
+UCCP420WLAN_LICENSE = GPLv2 (kernel module), proprietary (firmware blob)
+UCCP420WLAN_LICENSE_FILES = COPYING firmware/LICENSE.imagination
+
+define UCCP420WLAN_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/firmware/img/uccp420wlan
+	cp $(@D)/firmware/*.ldr $(TARGET_DIR)/lib/firmware/img/uccp420wlan
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.7.4
