From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun,  3 Dec 2017 21:18:17 +0300
Subject: [Buildroot] [PATCH v3 3/4] atf: add support for Marvell Armada SoCs
In-Reply-To: <20171203181818.10087-1-geomatsi@gmail.com>
References: <20171203181818.10087-1-geomatsi@gmail.com>
Message-ID: <20171203181818.10087-4-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add Marvell Armada 7k/8k SoCs support to arm-trusted-firmware package.
Marvell ATF needs two additional dependencies:
DDR training code and SCP_BL2 image.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 DEVELOPERS                                        |  1 +
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 840159fc2b..87b18cc9b9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1508,6 +1508,7 @@ F:	package/lua-resty-http/
 F:	package/mpir/
 
 N:	Sergey Matyukevich <geomatsi@gmail.com>
+F:	boot/arm-trusted-firmware/
 F:	boot/binaries-marvell/
 F:	boot/mv-ddr-marvell/
 F:	package/armbian-firmware/
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 7b1cc6ebb6..035f7de189 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -39,6 +39,17 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += vexpress-firmware
 endif
 
+ifeq ($(BR2_TARGET_BINARIES_MARVELL),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += binaries-marvell
+endif
+
+ifeq ($(BR2_TARGET_MV_DDR_MARVELL),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
+	MV_DDR_PATH=$(BUILD_DIR)/mv-ddr-marvell
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
+endif
+
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
-- 
2.11.0
