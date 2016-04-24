From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:37:40 +0200
Subject: [Buildroot] [git commit] linux-firmware: drop revision handling for
	iwlwifi
Message-ID: <20160424214207.0674D80238@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ee93c754611be2d0d31d5052c17b09335555765
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This avoids a lot of unnecessary complication with lots of revison
knobs for different chipsets and it's consequence when bumping
linux-firmware as well.

Users can purge unwanted versions from a post processing script if
target space is too constrained.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in         | 41 --------------------------------
 package/linux-firmware/linux-firmware.mk |  6 ++---
 2 files changed, 3 insertions(+), 44 deletions(-)

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
index c33eb95..2770bd9 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -229,7 +229,7 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160),y)
-LINUX_FIRMWARE_FILES += iwlwifi-3160-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV).ucode
+LINUX_FIRMWARE_FILES += iwlwifi-3160-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
@@ -248,12 +248,12 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260),y)
-LINUX_FIRMWARE_FILES += iwlwifi-7260-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV).ucode
+LINUX_FIRMWARE_FILES += iwlwifi-7260-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265),y)
-LINUX_FIRMWARE_FILES += iwlwifi-7265-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV).ucode
+LINUX_FIRMWARE_FILES += iwlwifi-7265-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
