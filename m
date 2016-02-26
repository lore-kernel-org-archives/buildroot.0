From: Joel Stanley <joel@jms.id.au>
Date: Fri, 26 Feb 2016 15:01:33 +1030
Subject: [Buildroot] [PATCH] linux-firmware: Allow selection of bnx2x fw
	version
Message-ID: <1456461093-10202-1-git-send-email-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linux kernel 4.2 moved the driver to a newer firmware version.

Instead of hard coding for 4.2+'s behaviour, introduce a selection
mechanism where the user specifies which version to use based on
the kernel they have.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/linux-firmware/Config.in         | 22 ++++++++++++++++++++++
 package/linux-firmware/linux-firmware.mk | 11 ++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index d8389864adaa..b28064b9e45c 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -243,6 +243,28 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
 	help
 	  Firmware files for Broadcom NetXtreme 10Gb ethernet cards (bnx2x)
 
+if BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
+
+choice
+	bool "Broadcom bnx2x revision to use"
+	help
+	  Use revision 7.12.30.0 for kernel 4.2 onward.
+	  Use revision 7.10.51.0 for kernel 3.16 to 4.1.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X_REV_7_12_30_0
+	prompt "revision 7.12.30.0"
+	help
+	  Use revision 7.12.30.0 for kernel 4.2 onwards.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X_REV_7_10_51_0
+	prompt "revision 7.10.51.0"
+	help
+	  Use revision 7.10.51.0 for kernel 3.16 to 4.1.
+
+endchoice
+
+endif
+
 config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4
 	bool "Chelsio T4"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 083a381ea00a..a73cbf9d6209 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -251,7 +251,7 @@ LINUX_FIRMWARE_FILES += iwlwifi-7265-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV).u
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
-ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X_REV_7_10_51_0),y)
 LINUX_FIRMWARE_FILES += \
 	bnx2x/bnx2x-e1-7.10.51.0.fw \
 	bnx2x/bnx2x-e1h-7.10.51.0.fw \
@@ -260,6 +260,15 @@ LINUX_FIRMWARE_FILES += \
 # which is installed unconditionally
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X_REV_7_12_30_0),y)
+LINUX_FIRMWARE_FILES += \
+	bnx2x/bnx2x-e1-7.12.30.0.fw \
+	bnx2x/bnx2x-e1h-7.12.30.0.fw \
+	bnx2x/bnx2x-e2-7.12.30.0.fw
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4),y)
 # cxgb4/t4fw.bin is a symlink to cxgb4/t4fw-1.14.4.0.bin
 LINUX_FIRMWARE_FILES += cxgb4/t4fw-1.14.4.0.bin cxgb4/t4fw.bin
-- 
2.7.0
