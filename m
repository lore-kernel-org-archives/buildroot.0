From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:39:01 +0200
Subject: [Buildroot] [git commit] linux-firmware: add support for intel
	iwlwifi 7265D
Message-ID: <20160424214207.1708681E08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41e6e727284904799876da5fcc2d632f640b2fcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It selects 7265 non-D firmware since they share the same firmware for
old kernel versions (rev 10 D-variant is the same as rev 10 non-D).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
[Thomas: add a comment about the select in Config.in.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in         | 9 +++++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 5a94a3c..b060885 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -98,6 +98,15 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265
 	  Firmware files for the Intel Wifi 7265 devices supported by
 	  the iwlwifi kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D
+	bool "Intel iwlwifi 7265D"
+	# needed for old kernel versions, where the non-D and D
+	# firmwares were the same
+	select BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265
+	help
+	  Firmware files for the Intel Wifi 7265D devices supported by
+	  the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8
 	bool "Libertas SD 8686 v8"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 2770bd9..532604b 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -257,6 +257,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-7265-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D),y)
+LINUX_FIRMWARE_FILES += iwlwifi-7265D-*.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
 LINUX_FIRMWARE_FILES += \
 	bnx2x/bnx2x-e1-7.10.51.0.fw \
