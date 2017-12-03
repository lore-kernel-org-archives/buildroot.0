From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Dec 2017 22:48:10 +0100
Subject: [Buildroot] [PATCH 7/8] atf: add support for Marvell Armada SoCs
In-Reply-To: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
References: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171203214811.3124-8-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sergey Matyukevich <geomatsi@gmail.com>

Add Marvell Armada 7k/8k SoCs support to arm-trusted-firmware package.
Marvell ATF needs two additional dependencies:
DDR training code and SCP_BL2 image.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
[Thomas: adjust to previous ATF changes.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                        |  1 +
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9115892d5c..4a82b6ecfb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1508,6 +1508,7 @@ F:	package/lua-resty-http/
 F:	package/mpir/
 
 N:	Sergey Matyukevich <geomatsi@gmail.com>
+F:	boot/arm-trusted-firmware/
 F:	boot/binaries-marvell/
 F:	boot/mv-ddr-marvell/
 F:	board/linksprite/pcduino
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 0aa7c9b492..e8d1c6205b 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -41,6 +41,16 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += vexpress-firmware
 endif
 
+ifeq ($(BR2_TARGET_BINARIES_MARVELL),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += binaries-marvell
+endif
+
+ifeq ($(BR2_TARGET_MV_DDR_MARVELL),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
+endif
+
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
-- 
2.13.6
