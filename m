From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 22:24:15 +0100
Subject: [Buildroot] [PATCH 3/5] package/linux-firmware: different
	iwlwifi3160/7260 firmwares for different kernels
In-Reply-To: <cover.1394486562.git.yann.morin.1998@free.fr>
References: <cover.1394486562.git.yann.morin.1998@free.fr>
Message-ID: <a4bd9752b69b55b2f3c91ac892ebaeb72730b015.1394486562.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The firmwares to use for iwlwifi 3160/7260 are different, depending on which
version of the Linux kernel is being used:
  - rev. 7 is for linux 3.10 through 3.12 (both included)
  - rev. 8 is for linux 3.13 onward

Add a config choice to select the appropriate version.

(See cset a0a6eeb in the linux-firmware repository for the details.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 28 ++++++++++++++++++++++++++++
 package/linux-firmware/linux-firmware.mk |  4 ++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 0a37a7e..ba9a6c1 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -48,6 +48,34 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260
 	  Firmware files for the Intel Wifi 7260 devices supported by
 	  the iwlwifi kernel driver.
 
+if BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160 || \
+   BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260
+
+choice
+	bool "iwlwifi 3160/7260 revision to use"
+	help
+	  Use revision 7 for kernel 3.10 to 3.12.
+	  Use revision 8 for kernel 3.13 onward.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_7
+	prompt "revision 7"
+	help
+	  Use revision 7 for kernel 3.10 to 3.12.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_8
+	prompt "revision 8"
+	help
+	  Use revision 8 for kernel 3.13 onward.
+
+endchoice
+
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_REV
+	int
+	default 7 if BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_7
+	default 8 if BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_8
+
+endif # iwlwifi 3160/7260
+
 config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8
 	bool "Libertas SD 8686 v8"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 307e8ee..df6c36b 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -127,7 +127,7 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160),y)
-LINUX_FIRMWARE_FILES += iwlwifi-3160-7.ucode
+LINUX_FIRMWARE_FILES += iwlwifi-3160-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_REV).ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
@@ -141,7 +141,7 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260),y)
-LINUX_FIRMWARE_FILES += iwlwifi-7260-7.ucode
+LINUX_FIRMWARE_FILES += iwlwifi-7260-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_REV).ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
-- 
1.8.3.2
