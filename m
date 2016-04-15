From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 15 Apr 2016 15:11:27 -0300
Subject: [Buildroot] [PATCH 1/2] linux-firmware: drop revision handling for
	iwlwifi
Message-ID: <1460743888-19967-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's problematic since newer kernel versions for different chipsets
(3168, 7260, 7265) aren't version tied. See:
http://lxr.free-electrons.com/source/drivers/net/wireless/intel/iwlwifi/iwl-7000.c?v=4.5#L69

For 3168 the abs minimum is v20, normal minimum v20, and maximum v20.
For 7260 the abs minimum is v13, normal minimum v13, and maximum v17.
For 7265 the abs minimum is v13, normal minimum v13, and maximum v17.

And for the upcoming 7265D abs min v13, normal min v13 and max v20, with
minimum available version being v10 for previous (<4.5) kernels.

This gives an impossible to satisfy logical combination with one
revision knob for all 3 chipsets, and adding more knobs will add a lot
of complexity.

Users can purge unwanted versions from a post processing script if
the space is too constrained.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-firmware/Config.in         | 41 --------------------------------
 package/linux-firmware/linux-firmware.mk |  9 ++++---
 2 files changed, 6 insertions(+), 44 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 97d64ca..5a94a3c 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -70,7 +70,6 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX
 
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160
 	bool "Intel iwlwifi 3160"
-	select BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_NEED_REV
 	help
 	  Firmware files for the Intel Wifi 3160 devices supported by
 	  the iwlwifi kernel driver.
@@ -89,56 +88,16 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A
 
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260
 	bool "Intel iwlwifi 7260"
-	select BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_NEED_REV
 	help
 	  Firmware files for the Intel Wifi 7260 devices supported by
 	  the iwlwifi kernel driver.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265
 	bool "Intel iwlwifi 7265"
-	select BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_NEED_REV
 	help
 	  Firmware files for the Intel Wifi 7265 devices supported by
 	  the iwlwifi kernel driver.
 
-config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_NEED_REV
-	bool
-
-if BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_NEED_REV
-
-choice
-	bool "iwlwifi 3160/726x revision to use"
-	help
-	  Use revision 7 for kernel 3.10 to 3.12.
-	  Use revision 8 for kernel 3.13 to 3.15.
-	  Use revision 9 for kernel 3.16 onward.
-
-config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_7
-	prompt "revision 7"
-	depends on !BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265
-	help
-	  Use revision 7 for kernel 3.10 to 3.12.
-
-config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_8
-	prompt "revision 8"
-	help
-	  Use revision 8 for kernel 3.13 to 3.15.
-
-config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_9
-	prompt "revision 9"
-	help
-	  Use revision 9 for kernel 3.16 onward.
-
-endchoice
-
-config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV
-	int
-	default 7 if BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_7
-	default 8 if BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_8
-	default 9 if BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_9
-
-endif # iwlwifi 3160/7260
-
 config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8
 	bool "Libertas SD 8686 v8"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 28fe66c..acdeea9 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -229,7 +229,8 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160),y)
-LINUX_FIRMWARE_FILES += iwlwifi-3160-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV).ucode
+LINUX_FIRMWARE_FILES += \
+	$(foreach version,7 8 9 10 12 13 16,iwlwifi-3160-$(version).ucode)
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
@@ -248,12 +249,14 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260),y)
-LINUX_FIRMWARE_FILES += iwlwifi-7260-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV).ucode
+LINUX_FIRMWARE_FILES += \
+	$(foreach version,7 8 9 10 12 13 16,iwlwifi-7260-$(version).ucode)
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265),y)
-LINUX_FIRMWARE_FILES += iwlwifi-7265-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV).ucode
+LINUX_FIRMWARE_FILES += \
+	$(foreach version,8 9 10 12 13 16,iwlwifi-7265-$(version).ucode)
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
-- 
2.7.3
