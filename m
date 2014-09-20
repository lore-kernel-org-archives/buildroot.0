From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 22:55:12 +0200
Subject: [Buildroot] [PATCH 14/15 v2] package/linux-firmware: add option for
	iwl7265 firmware
In-Reply-To: <cover.1411246411.git.yann.morin.1998@free.fr>
References: <cover.1411246411.git.yann.morin.1998@free.fr>
Message-ID: <7e0e77403d3498e8c09ef45b3dd2bd50738fffca.1411246412.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New firmware to support iwlwifi-7265. Only comes in rev-8 or rev-9
flavours, so hide rev-7 when iwlwifi-7265 is selected.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 8 ++++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 6a43290..3bcc982 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -55,6 +55,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260
 	  Firmware files for the Intel Wifi 7260 devices supported by
 	  the iwlwifi kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265
+	bool "Intel iwlwifi 7265"
+	select BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_NEED_REV
+	help
+	  Firmware files for the Intel Wifi 7265 devices supported by
+	  the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_NEED_REV
 	bool
 
@@ -69,6 +76,7 @@ choice
 
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_7
 	prompt "revision 7"
+	depends on !BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265
 	help
 	  Use revision 7 for kernel 3.10 to 3.12.
 
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 0d96502..9645db6 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -171,6 +171,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-7260-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV).u
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265),y)
+LINUX_FIRMWARE_FILES += iwlwifi-7265-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV).ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
 LINUX_FIRMWARE_FILES += \
 	bnx2x/bnx2x-e1-7.10.51.0.fw \
-- 
1.9.1
