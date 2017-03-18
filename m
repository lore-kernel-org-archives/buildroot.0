From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 15:34:03 +0100
Subject: [Buildroot] [git commit] uccp420wlan: new package
Message-ID: <20170318143433.EB46D82489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03197f30ab874d83fe1a56dc3f8bd7beddc29f73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Wifi kernel module and firmware for Imagination explorer RPU

Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Reviewed-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: indicate linux >= 4.2 dependency, as suggested by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/uccp420wlan/Config.in        | 16 ++++++++++++++++
 package/uccp420wlan/uccp420wlan.hash |  2 ++
 package/uccp420wlan/uccp420wlan.mk   | 18 ++++++++++++++++++
 4 files changed, 37 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ab76a77..e9648a0 100644
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
index 0000000..ef6a9db
--- /dev/null
+++ b/package/uccp420wlan/Config.in
@@ -0,0 +1,16 @@
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
+	  This module needs a Linux kernel >= v4.2.
+
+	  https://github.com/CreatorDev/uccp420wlan
+
+comment "uccp420wlan needs a Linux kernel >= 4.2 to be built"
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
