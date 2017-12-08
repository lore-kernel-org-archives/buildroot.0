From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Dec 2017 19:00:53 +0100
Subject: [Buildroot] [git commit] atf: add support for Marvell Armada SoCs
Message-ID: <20171208181255.6832C82867@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72123169266e3eb2aaa64b6332b2d7c77e03a113
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add Marvell Armada 7k/8k SoCs support to arm-trusted-firmware package.
Marvell ATF needs two additional dependencies:
DDR training code and SCP_BL2 image.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
[Thomas: adjust to previous ATF changes.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                        |  1 +
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c81808f..77e3344 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1520,6 +1520,7 @@ F:	package/lua-resty-http/
 F:	package/mpir/
 
 N:	Sergey Matyukevich <geomatsi@gmail.com>
+F:	boot/arm-trusted-firmware/
 F:	boot/binaries-marvell/
 F:	boot/mv-ddr-marvell/
 F:	board/linksprite/pcduino
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 0aa7c9b..e8d1c62 100644
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
