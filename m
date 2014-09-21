From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Sep 2014 20:38:09 +0200
Subject: [Buildroot] [PATCH 1/5 v3] package/linux-firmware: prepare new
	firmware and new revision for iwlwifi
In-Reply-To: <cover.1411324588.git.yann.morin.1998@free.fr>
References: <cover.1411324588.git.yann.morin.1998@free.fr>
Message-ID: <6fd85bcfb8a4b2dff13d862f1ccb9ad19da2ef5f.1411324588.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is an upcoming new firmware file for a new chipset supported by
iwlwifi, as well as a new revision of the iwlwifi firmware.

The patch only prepares the iwlwifi entries so it is easier to add them.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Chamges v2 -> v3:
  - add old options to Legacy  (Thomas P.)
---
 Config.in.legacy                         | 23 +++++++++++++++++++++++
 package/linux-firmware/Config.in         | 20 ++++++++++++--------
 package/linux-firmware/linux-firmware.mk |  4 ++--
 3 files changed, 37 insertions(+), 10 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5b1460c..f7bde7f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -99,6 +99,29 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2014.11"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_7
+	bool "BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_7 has been renamed"
+	help
+	  The option BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_7 was
+	  renamed to BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_7. You must
+	  select it in:
+	      Target packages -> Hardware handling ->
+	      Firmware -> linux-firmware -> WiFi firmware ->
+	      iwlwifi 3160/726x revision to use (revision 7)
+
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_8
+	bool "BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_8 has been renamed"
+	help
+	  The option BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_8 was
+	  renamed to BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_8. You must
+	  select it in:
+	      Target packages -> Hardware handling ->
+	      Firmware -> linux-firmware -> WiFi firmware ->
+	      iwlwifi 3160/726x revision to use (revision 8)
+
+###############################################################################
 comment "Legacy options removed in 2014.08"
 
 config BR2_PACKAGE_LIBELF
diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 7a1c40f..dc07a96 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -46,6 +46,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX
 
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160
 	bool "Intel iwlwifi 3160"
+	select BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_NEED_REV
 	help
 	  Firmware files for the Intel Wifi 3160 devices supported by
 	  the iwlwifi kernel driver.
@@ -58,35 +59,38 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000
 
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260
 	bool "Intel iwlwifi 7260"
+	select BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_NEED_REV
 	help
 	  Firmware files for the Intel Wifi 7260 devices supported by
 	  the iwlwifi kernel driver.
 
-if BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160 || \
-   BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_NEED_REV
+	bool
+
+if BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_NEED_REV
 
 choice
-	bool "iwlwifi 3160/7260 revision to use"
+	bool "iwlwifi 3160/726x revision to use"
 	help
 	  Use revision 7 for kernel 3.10 to 3.12.
 	  Use revision 8 for kernel 3.13 onward.
 
-config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_7
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_7
 	prompt "revision 7"
 	help
 	  Use revision 7 for kernel 3.10 to 3.12.
 
-config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_8
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_8
 	prompt "revision 8"
 	help
 	  Use revision 8 for kernel 3.13 onward.
 
 endchoice
 
-config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_REV
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV
 	int
-	default 7 if BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_7
-	default 8 if BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_8
+	default 7 if BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_7
+	default 8 if BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_8
 
 endif # iwlwifi 3160/7260
 
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index a7e1329..46e07d6 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -159,7 +159,7 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160),y)
-LINUX_FIRMWARE_FILES += iwlwifi-3160-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_REV).ucode
+LINUX_FIRMWARE_FILES += iwlwifi-3160-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV).ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
@@ -173,7 +173,7 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260),y)
-LINUX_FIRMWARE_FILES += iwlwifi-7260-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_REV).ucode
+LINUX_FIRMWARE_FILES += iwlwifi-7260-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV).ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
-- 
1.9.1
