Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13255CCD188
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 10:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D95C161279;
	Thu,  9 Oct 2025 10:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWf3V1uili24; Thu,  9 Oct 2025 10:06:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EC1861308
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EC1861308;
	Thu,  9 Oct 2025 10:06:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1015A9DA
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25BFA40FA4
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 10nQ6SoynrwM for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 10:06:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C78940FBB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C78940FBB
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:06:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A65A86D29; Thu,  9 Oct 2025 10:06:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:47:22 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: ad3c7c8855c34669a5fc74019cba0ae94a6dbf75
X-Git-Newrev: d5dab82db4e28a53295d88d27a144c2af2057db4
X-Patchwork-Hint: ignore
Message-Id: <20251009100624.2A65A86D29@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] configs/beagleboneai:
 move to u-boot 2025.04 to unbreak build with gcc 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d5dab82db4e28a53295d88d27a144c2af2057db4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

With the change to default to gcc 14.x with commit 1e1fafa1f0f5
("package/gcc: switch to GCC 14.x as the default"), the old u-boot version
no longer builds:

board/ti/am57xx/board.c:948:17: error: implicit declaration of function 'do_cape_detect'; did you mean 'do_board_detect'? [-Wimplicit-function-declaration]

https://gitlab.com/buildroot.org/buildroot/-/jobs/11570241744

So move to u-boot 2025.04 to fix that.  We still need a small patch as
(early) beagleboneai boards do not have the EEPROM (or eMMC partition)
populated, so include the bb.org patch from

https://github.com/beagleboard/u-boot/commit/0b161f8e89a411fe54059cf1d0ba61354ee1e8a2

The new u-boot version needs both openssl and gnutls on the host, so enable
them.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Julien: remove patch entry in .checkpackageignore to
  fix check-package error
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7ec419fb9c07292dc28b87ccb0ed35b00437dd16)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |   1 -
 ...-board.c-assume-on-failure-its-a-BBONE-AI.patch |  31 +
 .../patches/uboot/0001-am57xx_evm-fixes.patch      | 839 ---------------------
 .../beagleboneai/patches/uboot/uboot.hash          |   2 +-
 configs/beagleboneai_defconfig                     |   4 +-
 5 files changed, 35 insertions(+), 842 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3be6c6e082..2dd432582f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -9,7 +9,6 @@ board/asus/tinker/post-build.sh Shellcheck
 board/atmel/flasher.sh Shellcheck
 board/beagleboard/beaglebone-qt5/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch lib_patch.Upstream
 board/beagleboard/beaglebone/post-build.sh Shellcheck
-board/beagleboard/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch lib_patch.Upstream
 board/beagleboard/beagleboneai/post-build.sh Shellcheck
 board/boundarydevices/common/post-build.sh Shellcheck
 board/boundarydevices/common/post-image.sh Shellcheck
diff --git a/board/beagleboard/beagleboneai/patches/uboot/0001-am57xx-board.c-assume-on-failure-its-a-BBONE-AI.patch b/board/beagleboard/beagleboneai/patches/uboot/0001-am57xx-board.c-assume-on-failure-its-a-BBONE-AI.patch
new file mode 100644
index 0000000000..0f2975bfaa
--- /dev/null
+++ b/board/beagleboard/beagleboneai/patches/uboot/0001-am57xx-board.c-assume-on-failure-its-a-BBONE-AI.patch
@@ -0,0 +1,31 @@
+From 0b161f8e89a411fe54059cf1d0ba61354ee1e8a2 Mon Sep 17 00:00:00 2001
+From: Robert Nelson <robertcnelson@gmail.com>
+Date: Wed, 3 Aug 2022 11:28:10 -0500
+Subject: [PATCH] am57xx/board.c: assume on failure its a BBONE-AI
+
+Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
+Upstream: https://github.com/beagleboard/u-boot/commit/0b161f8e89a411fe54059cf1d0ba61354ee1e8a2
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ board/ti/am57xx/board.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/board/ti/am57xx/board.c b/board/ti/am57xx/board.c
+index cfc825e52a3..f369693f382 100644
+--- a/board/ti/am57xx/board.c
++++ b/board/ti/am57xx/board.c
+@@ -529,8 +529,10 @@ void do_board_detect(void)
+ 
+ 	rc = ti_i2c_eeprom_am_get(CONFIG_EEPROM_BUS_ADDRESS,
+ 				  CONFIG_EEPROM_CHIP_ADDRESS);
+-	if (rc)
++	if (rc) {
+ 		printf("ti_i2c_eeprom_init failed %d\n", rc);
++		ti_i2c_eeprom_am_set("BBONE-AI", "A");
++	};
+ 
+ #ifdef CONFIG_SUPPORT_EMMC_BOOT
+ 	rc = board_bootmode_has_emmc();
+-- 
+2.39.5
+
diff --git a/board/beagleboard/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch b/board/beagleboard/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch
deleted file mode 100644
index 9c7b12be84..0000000000
--- a/board/beagleboard/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch
+++ /dev/null
@@ -1,839 +0,0 @@
-From 702ea30b462ba06f4fbee3393f0e6c19531f1e5f Mon Sep 17 00:00:00 2001
-From: Robert Nelson <robertcnelson@gmail.com>
-Date: Fri, 25 Jun 2021 11:33:25 -0500
-Subject: [PATCH] am57xx_evm-fixes
-
-Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
-[Patch from https://github.com/beagleboard/u-boot/commit/702ea30b462ba06f4fbee3393f0e6c19531f1e5f]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- arch/arm/mach-omap2/omap5/hw_data.c |   1 +
- board/ti/am57xx/board.c             | 167 +++++++++++-
- configs/am57xx_evm_defconfig        |  15 +-
- include/configs/ti_armv7_common.h   | 407 ++++++++++++++++++++++++++++
- include/configs/ti_omap5_common.h   |   5 +
- include/environment/ti/boot.h       |  32 ++-
- include/environment/ti/mmc.h        |  49 +++-
- 7 files changed, 651 insertions(+), 25 deletions(-)
-
-diff --git a/arch/arm/mach-omap2/omap5/hw_data.c b/arch/arm/mach-omap2/omap5/hw_data.c
-index fa4e27063c..d5192b1671 100644
---- a/arch/arm/mach-omap2/omap5/hw_data.c
-+++ b/arch/arm/mach-omap2/omap5/hw_data.c
-@@ -421,6 +421,7 @@ void enable_basic_clocks(void)
- 		(*prcm)->cm_l4per_uart1_clkctrl,
- 		(*prcm)->cm_l4per_uart3_clkctrl,
- 		(*prcm)->cm_l4per_i2c1_clkctrl,
-+		(*prcm)->cm_l4per_i2c4_clkctrl,
- #ifdef CONFIG_DRIVER_TI_CPSW
- 		(*prcm)->cm_gmac_gmac_clkctrl,
- #endif
-diff --git a/board/ti/am57xx/board.c b/board/ti/am57xx/board.c
-index 73063faee6..ad05c41f22 100644
---- a/board/ti/am57xx/board.c
-+++ b/board/ti/am57xx/board.c
-@@ -41,6 +41,7 @@
- #include <mmc.h>
- #include <dm/uclass.h>
- #include <hang.h>
-+#include <i2c.h>
- 
- #include "../common/board_detect.h"
- #include "mux_data.h"
-@@ -528,8 +529,10 @@ void do_board_detect(void)
- 
- 	rc = ti_i2c_eeprom_am_get(CONFIG_EEPROM_BUS_ADDRESS,
- 				  CONFIG_EEPROM_CHIP_ADDRESS);
--	if (rc)
-+	if (rc) {
- 		printf("ti_i2c_eeprom_init failed %d\n", rc);
-+		ti_i2c_eeprom_am_set("BBONE-AI", "A");
-+	};
- 
- #ifdef CONFIG_SUPPORT_EMMC_BOOT
- 	rc = board_bootmode_has_emmc();
-@@ -579,6 +582,164 @@ void do_board_detect(void)
- 			 "Board: %s REV %s\n", bname, board_ti_get_rev());
- }
- 
-+struct am335x_cape_eeprom_id {
-+	unsigned int header;
-+	char eeprom_rev[2];
-+	char board_name[32];
-+	char version[4];
-+	char manufacture[16];
-+	char part_number[16];
-+	char number_of_pins[2];
-+	char serial_number[12];
-+	char pin_usage[140];
-+	char vdd_3v3exp[ 2];
-+	char vdd_5v[ 2];
-+	char sys_5v[2];
-+	char dc_supplied[2];
-+};
-+
-+#define CAPE_EEPROM_BUS_NUM 3
-+#define CAPE_EEPROM_ADDR0	0x54
-+#define CAPE_EEPROM_ADDR1	0x55
-+#define CAPE_EEPROM_ADDR2	0x56
-+#define CAPE_EEPROM_ADDR3	0x57
-+
-+#define CAPE_EEPROM_ADDR_LEN 0x10
-+
-+static int probe_cape_eeprom(struct am335x_cape_eeprom_id *cape_header)
-+{
-+	int ret;
-+	struct udevice *dev;
-+	unsigned char addr;
-+	/* /lib/firmware/BB-CAPE-DISP-CT4-00A0.dtbo */
-+	/* 14 + 16 + 1 + 4 + 5 = 40 */
-+	char hash_cape_overlay[40];
-+	char cape_overlay[26];
-+	char process_cape_part_number[16];
-+	char process_cape_version[4];
-+	char end_part_number;
-+	char cape_overlay_pass_to_kernel[18];
-+
-+	strlcpy(cape_overlay_pass_to_kernel, "", 1);
-+
-+	for ( addr = CAPE_EEPROM_ADDR0; addr <= CAPE_EEPROM_ADDR3; addr++ ) {
-+		ret = i2c_get_chip_for_busnum(CAPE_EEPROM_BUS_NUM, addr, 1, &dev);
-+		if (ret) {
-+			printf("BeagleBone Cape EEPROM: no EEPROM at address: 0x%x\n", addr);
-+		} else {
-+			printf("BeagleBone Cape EEPROM: found EEPROM at address: 0x%x\n", addr);
-+
-+			ret = i2c_set_chip_offset_len(dev, 2);
-+			if (ret) {
-+				printf("BeagleBone Cape EEPROM: i2c_set_chip_offset_len failure\n");
-+			}
-+
-+			ret = dm_i2c_read(dev, 0, (uchar *)cape_header, sizeof(struct am335x_cape_eeprom_id));
-+			if (ret) {
-+				printf("BeagleBone Cape EEPROM: Cannot read eeprom params\n");
-+			}
-+
-+			if (cape_header->header == 0xEE3355AA) {
-+				strlcpy(hash_cape_overlay, "/lib/firmware/", 14 + 1);
-+				strlcpy(cape_overlay, "", 2);
-+				strlcpy(cape_overlay_pass_to_kernel, "", 2);
-+				strlcpy(process_cape_part_number, "...............", 16 + 1);
-+				strlcpy(process_cape_version, "...", 4 + 1);
-+
-+				strlcpy(process_cape_part_number, cape_header->part_number, 16 + 1);
-+				printf("BeagleBone Cape EEPROM: debug part_number field:[%s]\n", process_cape_part_number);
-+
-+				//FIXME: some capes end with '.'
-+				if ( process_cape_part_number[15] == 0x2E ) {
-+					puts("debug: fixup, extra . in eeprom field\n");
-+					process_cape_part_number[15] = 0x00;
-+					if ( process_cape_part_number[14] == 0x2E ) {
-+						process_cape_part_number[14] = 0x00;
-+					}
-+				}
-+
-+				//Find ending 0x00 or 0xFF
-+				puts("BeagleBone Cape EEPROM: debug part_number field HEX:[");
-+				end_part_number=16;
-+				for ( int i=0; i <= 16; i++ ) {
-+					if (( process_cape_part_number[i] == 0x00 ) || ( process_cape_part_number[i] == 0xFF )) {
-+						end_part_number=i;
-+						i=17;
-+					} else {
-+						printf("%x", process_cape_part_number[i]);
-+					}
-+				}
-+				puts("]\n");
-+
-+				strncat(cape_overlay_pass_to_kernel, process_cape_part_number, end_part_number);
-+				strncat(cape_overlay_pass_to_kernel, ",", 1);
-+				//printf("debug: %s\n", cape_overlay_pass_to_kernel);
-+
-+				strncat(hash_cape_overlay, process_cape_part_number, end_part_number);
-+				strncat(cape_overlay, process_cape_part_number, end_part_number);
-+				//printf("debug: %s %s\n", hash_cape_overlay, cape_overlay);
-+
-+				strncat(hash_cape_overlay, "-", 1);
-+				strncat(cape_overlay, "-", 1);
-+				//printf("debug: %s %s\n", hash_cape_overlay, cape_overlay);
-+
-+				strlcpy(process_cape_version, cape_header->version, 4 + 1);
-+				//printf("debug: version field:[%s]\n", process_cape_version);
-+
-+				//Find invalid 0xFF -> 0x30 BBAI FAN Cape...
-+				puts("BeagleBone Cape EEPROM: debug version field HEX:[");
-+				for ( int i=0; i <= 3; i++ ) {
-+					printf("%x", process_cape_version[i]);
-+					if ( process_cape_version[i] == 0xFF ) {
-+						process_cape_version[i] = 0x30;
-+					}
-+				}
-+				puts("]\n");
-+
-+				strncat(hash_cape_overlay, process_cape_version, 4);
-+				strncat(cape_overlay, process_cape_version, 4);
-+				//printf("debug: %s %s\n", hash_cape_overlay, cape_overlay);
-+
-+				strncat(hash_cape_overlay, ".dtbo", 5);
-+				strncat(cape_overlay, ".dtbo", 5);
-+				//printf("debug: %s %s\n", hash_cape_overlay, cape_overlay);
-+
-+				printf("BeagleBone Cape EEPROM: 0x%x %s\n", addr, cape_overlay);
-+
-+				switch(addr) {
-+					case CAPE_EEPROM_ADDR0:
-+						env_set("uboot_overlay_addr0", cape_overlay);
-+						env_set("uboot_detected_capes_addr0", cape_overlay_pass_to_kernel);
-+						break;
-+					case CAPE_EEPROM_ADDR1:
-+						env_set("uboot_overlay_addr1", cape_overlay);
-+						env_set("uboot_detected_capes_addr1", cape_overlay_pass_to_kernel);
-+						break;
-+					case CAPE_EEPROM_ADDR2:
-+						env_set("uboot_overlay_addr2", cape_overlay);
-+						env_set("uboot_detected_capes_addr2", cape_overlay_pass_to_kernel);
-+						break;
-+					case CAPE_EEPROM_ADDR3:
-+						env_set("uboot_overlay_addr3", cape_overlay);
-+						env_set("uboot_detected_capes_addr3", cape_overlay_pass_to_kernel);
-+						break;
-+				}
-+				env_set("uboot_detected_capes", "1");
-+			} else {
-+				printf("BeagleBone Cape EEPROM: EEPROM contents not valid (or blank) on address: 0x%x\n", addr);
-+			}
-+		}
-+	}
-+	return 0;
-+}
-+
-+void do_cape_detect(void)
-+{
-+	struct am335x_cape_eeprom_id cape_header;
-+
-+	probe_cape_eeprom(&cape_header);
-+}
-+
- static void setup_board_eeprom_env(void)
- {
- 	char *name = "beagle_x15";
-@@ -782,8 +943,10 @@ int board_late_init(void)
- 	/* Just probe the potentially supported cdce913 device */
- 	uclass_get_device(UCLASS_CLK, 0, &dev);
- 
--	if (board_is_bbai())
-+	if (board_is_bbai()) {
- 		env_set("console", "ttyS0,115200n8");
-+		do_cape_detect();
-+	}
- 
- #if !defined(CONFIG_SPL_BUILD)
- 	board_ti_set_ethaddr(2);
-diff --git a/configs/am57xx_evm_defconfig b/configs/am57xx_evm_defconfig
-index 4da4aaa1c7..ed5b8aec16 100644
---- a/configs/am57xx_evm_defconfig
-+++ b/configs/am57xx_evm_defconfig
-@@ -10,16 +10,20 @@ CONFIG_SPL_TEXT_BASE=0x40300000
- CONFIG_OMAP54XX=y
- CONFIG_TARGET_AM57XX_EVM=y
- CONFIG_SPL=y
--CONFIG_ENV_OFFSET_REDUND=0x280000
- CONFIG_SPL_SPI_FLASH_SUPPORT=y
- CONFIG_SPL_SPI_SUPPORT=y
- CONFIG_ARMV7_LPAE=y
--CONFIG_DEFAULT_DEVICE_TREE="am572x-idk"
-+CONFIG_DEFAULT_DEVICE_TREE="am57xx-beagle-x15-revc"
- CONFIG_AHCI=y
- CONFIG_DISTRO_DEFAULTS=y
- CONFIG_SPL_LOAD_FIT=y
- # CONFIG_USE_SPL_FIT_GENERATOR is not set
- CONFIG_OF_BOARD_SETUP=y
-+CONFIG_BOOTDELAY=1
-+CONFIG_AUTOBOOT_KEYED=y
-+CONFIG_AUTOBOOT_PROMPT="Press SPACE to abort autoboot in %d seconds\n"
-+CONFIG_AUTOBOOT_DELAY_STR="d"
-+CONFIG_AUTOBOOT_STOP_STR=" "
- CONFIG_USE_BOOTARGS=y
- CONFIG_BOOTARGS="androidboot.serialno=${serial#} console=ttyS2,115200 androidboot.console=ttyS2 androidboot.hardware=beagle_x15board"
- # CONFIG_USE_BOOTCOMMAND is not set
-@@ -48,13 +52,12 @@ CONFIG_BOOTP_DNS2=y
- CONFIG_CMD_AVB=y
- CONFIG_OF_CONTROL=y
- CONFIG_SPL_OF_CONTROL=y
--CONFIG_OF_LIST="am57xx-beagle-x15 am57xx-beagle-x15-revb1 am57xx-beagle-x15-revc am5729-beagleboneai am572x-idk am571x-idk am574x-idk"
-+CONFIG_OF_LIST="am57xx-beagle-x15 am57xx-beagle-x15-revb1 am57xx-beagle-x15-revc am5729-beagleboneai"
- CONFIG_ENV_OVERWRITE=y
--CONFIG_ENV_IS_IN_MMC=y
--CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
-+# CONFIG_ENV_IS_IN_FAT is not set
- CONFIG_SYS_RELOC_GD_ENV_ADDR=y
--CONFIG_SYS_MMC_ENV_DEV=1
- CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
-+# CONFIG_SPL_ENV_IS_NOWHERE is not set
- CONFIG_VERSION_VARIABLE=y
- CONFIG_BOOTP_SEND_HOSTNAME=y
- CONFIG_DM=y
-diff --git a/include/configs/ti_armv7_common.h b/include/configs/ti_armv7_common.h
-index f13e9e5264..eabd03e27d 100644
---- a/include/configs/ti_armv7_common.h
-+++ b/include/configs/ti_armv7_common.h
-@@ -92,6 +92,413 @@
- #define CONFIG_SYS_I2C
- #endif
- 
-+#define EEPROM_PROGRAMMING \
-+	"eeprom_dump=i2c dev 0; " \
-+		"i2c md 0x50 0x00.2 20; " \
-+		"\0" \
-+	"eeprom_blank=i2c dev 0; " \
-+		"i2c mw 0x50 0x00.2 ff; " \
-+		"i2c mw 0x50 0x01.2 ff; " \
-+		"i2c mw 0x50 0x02.2 ff; " \
-+		"i2c mw 0x50 0x03.2 ff; " \
-+		"i2c mw 0x50 0x04.2 ff; " \
-+		"i2c mw 0x50 0x05.2 ff; " \
-+		"i2c mw 0x50 0x06.2 ff; " \
-+		"i2c mw 0x50 0x07.2 ff; " \
-+		"i2c mw 0x50 0x08.2 ff; " \
-+		"i2c mw 0x50 0x09.2 ff; " \
-+		"i2c mw 0x50 0x0a.2 ff; " \
-+		"i2c mw 0x50 0x0b.2 ff; " \
-+		"i2c mw 0x50 0x0c.2 ff; " \
-+		"i2c mw 0x50 0x0d.2 ff; " \
-+		"i2c mw 0x50 0x0e.2 ff; " \
-+		"i2c mw 0x50 0x0f.2 ff; " \
-+		"i2c mw 0x50 0x10.2 ff; " \
-+		"i2c mw 0x50 0x11.2 ff; " \
-+		"i2c mw 0x50 0x12.2 ff; " \
-+		"i2c mw 0x50 0x13.2 ff; " \
-+		"i2c mw 0x50 0x14.2 ff; " \
-+		"i2c mw 0x50 0x15.2 ff; " \
-+		"i2c mw 0x50 0x16.2 ff; " \
-+		"i2c mw 0x50 0x17.2 ff; " \
-+		"i2c mw 0x50 0x18.2 ff; " \
-+		"i2c mw 0x50 0x19.2 ff; " \
-+		"i2c mw 0x50 0x1a.2 ff; " \
-+		"i2c mw 0x50 0x1b.2 ff; " \
-+		"i2c mw 0x50 0x1c.2 ff; " \
-+		"i2c mw 0x50 0x1d.2 ff; " \
-+		"i2c mw 0x50 0x1e.2 ff; " \
-+		"i2c mw 0x50 0x1f.2 ff; " \
-+		"i2c md 0x50 0x00.2 20; " \
-+		"\0" \
-+	"eeprom_x15_b1=i2c dev 0; " \
-+		"i2c mw 0x50 0x00.2 aa; " \
-+		"i2c mw 0x50 0x01.2 55; " \
-+		"i2c mw 0x50 0x02.2 33; " \
-+		"i2c mw 0x50 0x03.2 ee; " \
-+		"i2c mw 0x50 0x04.2 42; " \
-+		"i2c mw 0x50 0x05.2 42; " \
-+		"i2c mw 0x50 0x06.2 52; " \
-+		"i2c mw 0x50 0x07.2 44; " \
-+		"i2c mw 0x50 0x08.2 58; " \
-+		"i2c mw 0x50 0x09.2 31; " \
-+		"i2c mw 0x50 0x0a.2 35; " \
-+		"i2c mw 0x50 0x0b.2 5f; " \
-+		"i2c mw 0x50 0x0c.2 42; " \
-+		"i2c mw 0x50 0x0d.2 2e; " \
-+		"i2c mw 0x50 0x0e.2 31; " \
-+		"i2c mw 0x50 0x0f.2 30; " \
-+		"i2c mw 0x50 0x10.2 57; " \
-+		"i2c mw 0x50 0x11.2 57; " \
-+		"i2c mw 0x50 0x12.2 59; " \
-+		"i2c mw 0x50 0x13.2 59; " \
-+		"i2c mw 0x50 0x14.2 34; " \
-+		"i2c mw 0x50 0x15.2 50; " \
-+		"i2c mw 0x50 0x16.2 35; " \
-+		"i2c mw 0x50 0x17.2 35; " \
-+		"i2c mw 0x50 0x18.2 30; " \
-+		"i2c mw 0x50 0x19.2 30; " \
-+		"i2c mw 0x50 0x1a.2 30; " \
-+		"i2c mw 0x50 0x1b.2 30; " \
-+		"i2c mw 0x50 0x1c.2 ff; " \
-+		"i2c mw 0x50 0x1d.2 ff; " \
-+		"i2c mw 0x50 0x1e.2 ff; " \
-+		"i2c mw 0x50 0x1f.2 ff; " \
-+		"i2c md 0x50 0x00.2 20; " \
-+		"\0" \
-+	"eeprom_x15_c=i2c dev 0; " \
-+		"i2c mw 0x50 0x00.2 aa; " \
-+		"i2c mw 0x50 0x01.2 55; " \
-+		"i2c mw 0x50 0x02.2 33; " \
-+		"i2c mw 0x50 0x03.2 ee; " \
-+		"i2c mw 0x50 0x04.2 42; " \
-+		"i2c mw 0x50 0x05.2 42; " \
-+		"i2c mw 0x50 0x06.2 52; " \
-+		"i2c mw 0x50 0x07.2 44; " \
-+		"i2c mw 0x50 0x08.2 58; " \
-+		"i2c mw 0x50 0x09.2 31; " \
-+		"i2c mw 0x50 0x0a.2 35; " \
-+		"i2c mw 0x50 0x0b.2 5f; " \
-+		"i2c mw 0x50 0x0c.2 43; " \
-+		"i2c mw 0x50 0x0d.2 2e; " \
-+		"i2c mw 0x50 0x0e.2 30; " \
-+		"i2c mw 0x50 0x0f.2 30; " \
-+		"i2c mw 0x50 0x10.2 79; " \
-+		"i2c mw 0x50 0x11.2 79; " \
-+		"i2c mw 0x50 0x12.2 77; " \
-+		"i2c mw 0x50 0x13.2 77; " \
-+		"i2c mw 0x50 0x14.2 50; " \
-+		"i2c mw 0x50 0x15.2 58; " \
-+		"i2c mw 0x50 0x16.2 31; " \
-+		"i2c mw 0x50 0x17.2 35; " \
-+		"i2c mw 0x50 0x18.2 6e; " \
-+		"i2c mw 0x50 0x19.2 6e; " \
-+		"i2c mw 0x50 0x1a.2 6e; " \
-+		"i2c mw 0x50 0x1b.2 6e; " \
-+		"i2c mw 0x50 0x1c.2 ff; " \
-+		"i2c mw 0x50 0x1d.2 ff; " \
-+		"i2c mw 0x50 0x1e.2 ff; " \
-+		"i2c mw 0x50 0x1f.2 ff; " \
-+		"i2c md 0x50 0x00.2 20; " \
-+	"eeprom_bbai_a2=i2c dev 0; " \
-+		"i2c mw 0x50 0x00.2 aa; " \
-+		"i2c mw 0x50 0x01.2 55; " \
-+		"i2c mw 0x50 0x02.2 33; " \
-+		"i2c mw 0x50 0x03.2 ee; " \
-+		"i2c mw 0x50 0x04.2 42; " \
-+		"i2c mw 0x50 0x05.2 42; " \
-+		"i2c mw 0x50 0x06.2 4F; " \
-+		"i2c mw 0x50 0x07.2 4E; " \
-+		"i2c mw 0x50 0x08.2 45; " \
-+		"i2c mw 0x50 0x09.2 2D; " \
-+		"i2c mw 0x50 0x0a.2 41; " \
-+		"i2c mw 0x50 0x0b.2 49; " \
-+		"i2c mw 0x50 0x0c.2 30; " \
-+		"i2c mw 0x50 0x0d.2 30; " \
-+		"i2c mw 0x50 0x0e.2 41; " \
-+		"i2c mw 0x50 0x0f.2 32; " \
-+		"i2c mw 0x50 0x10.2 57; " \
-+		"i2c mw 0x50 0x11.2 57; " \
-+		"i2c mw 0x50 0x12.2 59; " \
-+		"i2c mw 0x50 0x13.2 59; " \
-+		"i2c mw 0x50 0x14.2 53; " \
-+		"i2c mw 0x50 0x15.2 42; " \
-+		"i2c mw 0x50 0x16.2 41; " \
-+		"i2c mw 0x50 0x17.2 49; " \
-+		"i2c mw 0x50 0x18.2 30; " \
-+		"i2c mw 0x50 0x19.2 30; " \
-+		"i2c mw 0x50 0x1a.2 30; " \
-+		"i2c mw 0x50 0x1b.2 30; " \
-+		"i2c mw 0x50 0x1c.2 30; " \
-+		"i2c mw 0x50 0x1d.2 30; " \
-+		"i2c mw 0x50 0x1e.2 ff; " \
-+		"i2c mw 0x50 0x1f.2 ff; " \
-+		"i2c md 0x50 0x00.2 20; " \
-+		"\0" \
-+
-+#define EEWIKI_MMC_BOOT \
-+	"mmc_boot=${devtype} dev ${mmcdev}; ${devtype} part; " \
-+		"if ${devtype} rescan; then " \
-+			"echo Scanning ${devtype} device ${mmcdev};" \
-+			"setenv bootpart ${mmcdev}:1; " \
-+			"echo Checking for: /uEnv.txt ...;" \
-+			"if test -e ${devtype} ${bootpart} /uEnv.txt; then " \
-+				"load ${devtype} ${bootpart} ${loadaddr} /uEnv.txt;" \
-+				"env import -t ${loadaddr} ${filesize};" \
-+				"echo Loaded environment from /uEnv.txt;" \
-+				"echo Checking if uenvcmd is set ...;" \
-+				"if test -n ${uenvcmd}; then " \
-+					"echo Running uenvcmd ...;" \
-+					"run uenvcmd;" \
-+				"fi;" \
-+			"fi; " \
-+			"echo Checking for: /boot/uEnv.txt ...;" \
-+			"for i in 1 2 3 4 5 6 7 ; do " \
-+				"setenv mmcpart ${i};" \
-+				"setenv bootpart ${mmcdev}:${mmcpart};" \
-+				"if test -e ${devtype} ${bootpart} /boot/uEnv.txt; then " \
-+					"load ${devtype} ${bootpart} ${loadaddr} /boot/uEnv.txt;" \
-+					"env import -t ${loadaddr} ${filesize};" \
-+					"echo Loaded environment from /boot/uEnv.txt;" \
-+					"if test -n ${dtb}; then " \
-+						"setenv fdtfile ${dtb};" \
-+						"echo debug: [dtb=${fdtfile}] ...;" \
-+					"fi;" \
-+					"echo Checking if uname_r is set in /boot/uEnv.txt ...;" \
-+					"if test -n ${uname_r}; then " \
-+						"echo debug: [uname_r=${uname_r}] ...;" \
-+						"setenv oldroot /dev/mmcblk${mmcdev}p${mmcpart};" \
-+						"run uname_boot;" \
-+					"fi;" \
-+				"fi;" \
-+			"done;" \
-+		"fi;\0" \
-+
-+#define EEWIKI_SCSI_BOOT \
-+	"scsi_boot=${devtype} reset ; " \
-+		"if ${devtype} dev ${mmcdev}; then " \
-+			"echo Scanning ${devtype} device ${mmcdev};" \
-+			"setenv bootpart ${mmcdev}:1; " \
-+			"echo Checking for: /uEnv.txt ...;" \
-+			"if test -e ${devtype} ${bootpart} /uEnv.txt; then " \
-+				"load ${devtype} ${bootpart} ${loadaddr} /uEnv.txt;" \
-+				"env import -t ${loadaddr} ${filesize};" \
-+				"echo Loaded environment from /uEnv.txt;" \
-+				"echo Checking if uenvcmd is set ...;" \
-+				"if test -n ${uenvcmd}; then " \
-+					"echo Running uenvcmd ...;" \
-+					"run uenvcmd;" \
-+				"fi;" \
-+			"fi; " \
-+			"echo Checking for: /boot/uEnv.txt ...;" \
-+			"for i in 1 2 3 4 ; do " \
-+				"setenv mmcpart ${i};" \
-+				"setenv bootpart ${mmcdev}:${mmcpart};" \
-+				"if test -e ${devtype} ${bootpart} /boot/uEnv.txt; then " \
-+					"load ${devtype} ${bootpart} ${loadaddr} /boot/uEnv.txt;" \
-+					"env import -t ${loadaddr} ${filesize};" \
-+					"echo Loaded environment from /boot/uEnv.txt;" \
-+					"if test -n ${dtb}; then " \
-+						"setenv fdtfile ${dtb};" \
-+						"echo debug: [dtb=${fdtfile}] ...;" \
-+					"fi;" \
-+					"echo Checking if uname_r is set in /boot/uEnv.txt ...;" \
-+					"if test -n ${uname_r}; then " \
-+						"echo debug: [uname_r=${uname_r}] ...;" \
-+						"setenv oldroot /dev/sda${mmcpart};" \
-+						"run uname_boot;" \
-+					"fi;" \
-+				"fi;" \
-+			"done;" \
-+		"fi;\0" \
-+
-+#define EEWIKI_USB_BOOT \
-+	"usb_boot=${devtype} reset ; " \
-+		"if ${devtype} dev ${mmcdev}; then " \
-+			"echo Scanning ${devtype} device ${mmcdev};" \
-+			"setenv bootpart ${mmcdev}:1; " \
-+			"echo Checking for: /uEnv.txt ...;" \
-+			"if test -e ${devtype} ${bootpart} /uEnv.txt; then " \
-+				"load ${devtype} ${bootpart} ${loadaddr} /uEnv.txt;" \
-+				"env import -t ${loadaddr} ${filesize};" \
-+				"echo Loaded environment from /uEnv.txt;" \
-+				"echo Checking if uenvcmd is set in /uEnv.txt ...;" \
-+				"if test -n ${uenvcmd}; then " \
-+					"echo Running uenvcmd ...;" \
-+					"run uenvcmd;" \
-+				"fi;" \
-+			"fi; " \
-+			"echo Checking for: /boot/uEnv.txt ...;" \
-+			"for i in 1 2 3 4 ; do " \
-+				"setenv mmcpart ${i};" \
-+				"setenv bootpart ${mmcdev}:${mmcpart};" \
-+				"if test -e ${devtype} ${bootpart} /boot/uEnv.txt; then " \
-+					"load ${devtype} ${bootpart} ${loadaddr} /boot/uEnv.txt;" \
-+					"env import -t ${loadaddr} ${filesize};" \
-+					"echo Loaded environment from /boot/uEnv.txt;" \
-+					"if test -n ${dtb}; then " \
-+						"setenv fdtfile ${dtb};" \
-+						"echo debug: [dtb=${fdtfile}] ...;" \
-+					"fi;" \
-+					"echo Checking if uname_r is set in /boot/uEnv.txt ...;" \
-+					"if test -n ${uname_r}; then " \
-+						"echo debug: [uname_r=${uname_r}] ...;" \
-+						"setenv oldroot /dev/sda${mmcpart};" \
-+						"run uname_boot;" \
-+					"fi;" \
-+				"fi;" \
-+			"done;" \
-+		"fi;\0" \
-+
-+#define EEWIKI_UNAME_BOOT \
-+	"uname_boot="\
-+		"setenv bootdir /boot; " \
-+		"setenv bootfile vmlinuz-${uname_r}; " \
-+		"if test -e ${devtype} ${bootpart} ${bootdir}/${bootfile}; then " \
-+			"echo loading ${bootdir}/${bootfile} ...; "\
-+			"run loadimage;" \
-+			"setenv fdtdir /boot/dtbs/${uname_r}; " \
-+			"if test -e ${devtype} ${bootpart} ${fdtdir}/${fdtfile}; then " \
-+				"run loadfdt;" \
-+			"else " \
-+				"setenv fdtdir /usr/lib/linux-image-${uname_r}; " \
-+				"if test -e ${devtype} ${bootpart} ${fdtdir}/${fdtfile}; then " \
-+					"run loadfdt;" \
-+				"else " \
-+					"setenv fdtdir /lib/firmware/${uname_r}/device-tree; " \
-+					"if test -e ${devtype} ${bootpart} ${fdtdir}/${fdtfile}; then " \
-+						"run loadfdt;" \
-+					"else " \
-+						"setenv fdtdir /boot/dtb-${uname_r}; " \
-+						"if test -e ${devtype} ${bootpart} ${fdtdir}/${fdtfile}; then " \
-+							"run loadfdt;" \
-+						"else " \
-+							"setenv fdtdir /boot/dtbs; " \
-+							"if test -e ${devtype} ${bootpart} ${fdtdir}/${fdtfile}; then " \
-+								"run loadfdt;" \
-+							"else " \
-+								"setenv fdtdir /boot/dtb; " \
-+								"if test -e ${devtype} ${bootpart} ${fdtdir}/${fdtfile}; then " \
-+									"run loadfdt;" \
-+								"else " \
-+									"setenv fdtdir /boot; " \
-+									"if test -e ${devtype} ${bootpart} ${fdtdir}/${fdtfile}; then " \
-+										"run loadfdt;" \
-+									"else " \
-+										"echo; echo unable to find ${fdtfile} ...; echo booting legacy ...;"\
-+										"run args_mmc;" \
-+										"echo debug: [${bootargs}] ... ;" \
-+										"echo debug: [bootz ${loadaddr}] ... ;" \
-+										"bootz ${loadaddr}; " \
-+									"fi;" \
-+								"fi;" \
-+							"fi;" \
-+						"fi;" \
-+					"fi;" \
-+				"fi;" \
-+			"fi; " \
-+			"if test -n ${enable_uboot_overlays}; then " \
-+				"setenv fdt_buffer 0x60000;" \
-+				"if test -n ${uboot_fdt_buffer}; then " \
-+					"setenv fdt_buffer ${uboot_fdt_buffer};" \
-+				"fi;" \
-+				"echo uboot_overlays: [fdt_buffer=${fdt_buffer}] ... ;" \
-+				"if test -n ${uboot_overlay_addr0}; then " \
-+					"if test -n ${disable_uboot_overlay_addr0}; then " \
-+						"echo uboot_overlays: uboot loading of [${uboot_overlay_addr0}] disabled by /boot/uEnv.txt [disable_uboot_overlay_addr0=1]...;" \
-+					"else " \
-+						"setenv uboot_overlay ${uboot_overlay_addr0}; " \
-+						"run virtualloadoverlay;" \
-+					"fi;" \
-+				"fi;" \
-+				"if test -n ${uboot_overlay_addr1}; then " \
-+					"if test -n ${disable_uboot_overlay_addr1}; then " \
-+						"echo uboot_overlays: uboot loading of [${uboot_overlay_addr1}] disabled by /boot/uEnv.txt [disable_uboot_overlay_addr1=1]...;" \
-+					"else " \
-+						"setenv uboot_overlay ${uboot_overlay_addr1}; " \
-+						"run virtualloadoverlay;" \
-+					"fi;" \
-+				"fi;" \
-+				"if test -n ${uboot_overlay_addr2}; then " \
-+					"if test -n ${disable_uboot_overlay_addr2}; then " \
-+						"echo uboot_overlays: uboot loading of [${uboot_overlay_addr2}] disabled by /boot/uEnv.txt [disable_uboot_overlay_addr2=1]...;" \
-+					"else " \
-+						"setenv uboot_overlay ${uboot_overlay_addr2}; " \
-+						"run virtualloadoverlay;" \
-+					"fi;" \
-+				"fi;" \
-+				"if test -n ${uboot_overlay_addr3}; then " \
-+					"if test -n ${disable_uboot_overlay_addr3}; then " \
-+						"echo uboot_overlays: uboot loading of [${uboot_overlay_addr3}] disabled by /boot/uEnv.txt [disable_uboot_overlay_addr3=1]...;" \
-+					"else " \
-+						"setenv uboot_overlay ${uboot_overlay_addr3}; " \
-+						"run virtualloadoverlay;" \
-+					"fi;" \
-+				"fi;" \
-+				"if test -n ${uboot_overlay_addr4}; then " \
-+					"setenv uboot_overlay ${uboot_overlay_addr4}; " \
-+					"run virtualloadoverlay;" \
-+				"fi;" \
-+				"if test -n ${uboot_overlay_addr5}; then " \
-+					"setenv uboot_overlay ${uboot_overlay_addr5}; " \
-+					"run virtualloadoverlay;" \
-+				"fi;" \
-+				"if test -n ${uboot_overlay_addr6}; then " \
-+					"setenv uboot_overlay ${uboot_overlay_addr6}; " \
-+					"run virtualloadoverlay;" \
-+				"fi;" \
-+				"if test -n ${uboot_overlay_addr7}; then " \
-+					"setenv uboot_overlay ${uboot_overlay_addr7}; " \
-+					"run virtualloadoverlay;" \
-+				"fi;" \
-+				"if test -n ${uboot_overlay_pru}; then " \
-+					"setenv uboot_overlay ${uboot_overlay_pru}; " \
-+					"run virtualloadoverlay;" \
-+				"fi;" \
-+			"else " \
-+				"echo uboot_overlays: add [enable_uboot_overlays=1] to /boot/uEnv.txt to enable...;" \
-+			"fi;" \
-+			"setenv rdfile initrd.img-${uname_r}; " \
-+			"if test -e ${devtype} ${bootpart} ${bootdir}/${rdfile}; then " \
-+				"echo loading ${bootdir}/${rdfile} ...; "\
-+				"run loadrd;" \
-+				"if test -n ${netinstall_enable}; then " \
-+					"run args_netinstall; run message;" \
-+					"echo debug: [${bootargs}] ... ;" \
-+					"echo debug: [bootz ${loadaddr} ${rdaddr}:${rdsize} ${fdtaddr}] ... ;" \
-+					"bootz ${loadaddr} ${rdaddr}:${rdsize} ${fdtaddr}; " \
-+				"fi;" \
-+				"if test -n ${uenv_root}; then " \
-+					"run args_uenv_root;" \
-+					"echo debug: [${bootargs}] ... ;" \
-+					"echo debug: [bootz ${loadaddr} ${rdaddr}:${rdsize} ${fdtaddr}] ... ;" \
-+					"bootz ${loadaddr} ${rdaddr}:${rdsize} ${fdtaddr}; " \
-+				"fi;" \
-+				"if test -n ${uuid}; then " \
-+					"run args_mmc_uuid;" \
-+					"echo debug: [${bootargs}] ... ;" \
-+					"echo debug: [bootz ${loadaddr} ${rdaddr}:${rdsize} ${fdtaddr}] ... ;" \
-+					"bootz ${loadaddr} ${rdaddr}:${rdsize} ${fdtaddr}; " \
-+				"else " \
-+					"run args_mmc_old;" \
-+					"echo debug: [${bootargs}] ... ;" \
-+					"echo debug: [bootz ${loadaddr} ${rdaddr}:${rdsize} ${fdtaddr}] ... ;" \
-+					"bootz ${loadaddr} ${rdaddr}:${rdsize} ${fdtaddr}; " \
-+				"fi;" \
-+			"else " \
-+				"if test -n ${uenv_root}; then " \
-+					"run args_uenv_root;" \
-+					"echo debug: [${bootargs}] ... ;" \
-+					"echo debug: [bootz ${loadaddr} - ${fdtaddr}] ... ;" \
-+					"bootz ${loadaddr} - ${fdtaddr}; " \
-+				"fi;" \
-+				"run args_mmc_old;" \
-+				"echo debug: [${bootargs}] ... ;" \
-+				"echo debug: [bootz ${loadaddr} - ${fdtaddr}] ... ;" \
-+				"bootz ${loadaddr} - ${fdtaddr}; " \
-+			"fi;" \
-+		"fi;\0" \
-+
- /*
-  * The following are general good-enough settings for U-Boot.  We set a
-  * large malloc pool as we generally have a lot of DDR, and we opt for
-diff --git a/include/configs/ti_omap5_common.h b/include/configs/ti_omap5_common.h
-index de0a6af2fd..0cd2ccea03 100644
---- a/include/configs/ti_omap5_common.h
-+++ b/include/configs/ti_omap5_common.h
-@@ -64,6 +64,11 @@
- 	DEFAULT_FIT_TI_ARGS \
- 	DEFAULT_COMMON_BOOT_TI_ARGS \
- 	DEFAULT_FDT_TI_ARGS \
-+	EEWIKI_USB_BOOT \
-+	EEWIKI_SCSI_BOOT \
-+	EEWIKI_MMC_BOOT \
-+	EEWIKI_UNAME_BOOT \
-+	EEPROM_PROGRAMMING \
- 	DFUARGS \
- 	NETARGS \
- 	NANDARGS \
-diff --git a/include/environment/ti/boot.h b/include/environment/ti/boot.h
-index a9d8f28d46..1480b6e3df 100644
---- a/include/environment/ti/boot.h
-+++ b/include/environment/ti/boot.h
-@@ -132,6 +132,7 @@
- 	"bootpart=0:2\0" \
- 	"bootdir=/boot\0" \
- 	"bootfile=zImage\0" \
-+	"board_eeprom_header=undefined\0" \
- 	"usbtty=cdc_acm\0" \
- 	"vram=16M\0" \
- 	AVB_VERIFY_CMD \
-@@ -183,7 +184,14 @@
- 		"else " \
- 			"echo $apart partition not found; " \
- 			"exit; " \
--		"fi;\0"
-+		"fi;\0 " \
-+	"read_board_eeprom=" \
-+		"if test $board_eeprom_header = beagle_x15_revb1_blank; then " \
-+			"run eeprom_dump; run eeprom_x15_b1; reset; fi; " \
-+		"if test $board_eeprom_header = beagle_x15_revc_blank; then " \
-+			"run eeprom_dump; run eeprom_x15_c; reset; fi; " \
-+		"if test $board_eeprom_header = bbai_a2_blank; then " \
-+			"run eeprom_dump; run eeprom_bbai_a2; reset; fi;  \0 "
- 
- #ifdef CONFIG_OMAP54XX
- 
-@@ -223,19 +231,17 @@
- 			"echo WARNING: Could not determine device tree to use; fi; \0"
- 
- #define CONFIG_BOOTCOMMAND \
--	"if test ${dofastboot} -eq 1; then " \
--		"echo Boot fastboot requested, resetting dofastboot ...;" \
--		"setenv dofastboot 0; saveenv;" \
--		FASTBOOT_CMD \
--	"fi;" \
--	"if test ${boot_fit} -eq 1; then "	\
--		"run update_to_fit;"	\
--	"fi;"	\
-+	"run read_board_eeprom; " \
- 	"run findfdt; " \
--	"run envboot; " \
--	"run mmcboot;" \
--	"run emmc_linux_boot; " \
--	"run emmc_android_boot; " \
-+	"setenv mmcdev 0; " \
-+	"setenv devtype usb; " \
-+	"echo usb_boot is currently disabled;" \
-+	"setenv devtype scsi; " \
-+	"echo scsi_boot is currently disabled;" \
-+	"setenv devtype mmc; " \
-+	"run mmc_boot;" \
-+	"setenv mmcdev 1; " \
-+	"run mmc_boot;" \
- 	""
- 
- #endif /* CONFIG_OMAP54XX */
-diff --git a/include/environment/ti/mmc.h b/include/environment/ti/mmc.h
-index b86c8dc7a4..0ec09f279a 100644
---- a/include/environment/ti/mmc.h
-+++ b/include/environment/ti/mmc.h
-@@ -11,11 +11,31 @@
- #define DEFAULT_MMC_TI_ARGS \
- 	"mmcdev=0\0" \
- 	"mmcrootfstype=ext4 rootwait\0" \
--	"finduuid=part uuid mmc ${bootpart} uuid\0" \
-+	"finduuid=part uuid ${devtype} ${bootpart} uuid\0" \
- 	"args_mmc=run finduuid;setenv bootargs console=${console} " \
- 		"${optargs} " \
--		"root=PARTUUID=${uuid} rw " \
--		"rootfstype=${mmcrootfstype}\0" \
-+		"root=PARTUUID=${uuid} ro " \
-+		"rootfstype=${mmcrootfstype} " \
-+		"${cmdline}\0" \
-+	"args_mmc_old=setenv bootargs console=${console} " \
-+		"${optargs} " \
-+		"root=${oldroot} ro " \
-+		"rootfstype=${mmcrootfstype} " \
-+		"${cmdline}\0" \
-+	"args_mmc_uuid=setenv bootargs console=${console} " \
-+		"${optargs} " \
-+		"root=UUID=${uuid} ro " \
-+		"rootfstype=${mmcrootfstype} " \
-+		"${cmdline}\0" \
-+	"args_uenv_root=setenv bootargs console=${console} " \
-+		"${optargs} " \
-+		"root=${uenv_root} ro " \
-+		"rootfstype=${mmcrootfstype} " \
-+		"${musb} ${cmdline}\0" \
-+	"args_netinstall=setenv bootargs ${netinstall_bootargs} " \
-+		"${optargs} " \
-+		"root=/dev/ram rw " \
-+		"${cmdline}\0" \
- 	"loadbootscript=load mmc ${mmcdev} ${loadaddr} boot.scr\0" \
- 	"bootscript=echo Running bootscript from mmc${mmcdev} ...; " \
- 		"source ${loadaddr}\0" \
-@@ -24,7 +44,28 @@
- 		"env import -t ${loadaddr} ${filesize}\0" \
- 	"loadbootenv=fatload mmc ${mmcdev} ${loadaddr} ${bootenvfile}\0" \
- 	"loadimage=load ${devtype} ${bootpart} ${loadaddr} ${bootdir}/${bootfile}\0" \
--	"loadfdt=load ${devtype} ${bootpart} ${fdtaddr} ${bootdir}/${fdtfile}\0" \
-+	"loadrd=load ${devtype} ${bootpart} ${rdaddr} ${bootdir}/${rdfile}; setenv rdsize ${filesize}\0" \
-+	"loadfdt=echo loading ${fdtdir}/${fdtfile} ...; load ${devtype} ${bootpart} ${fdtaddr} ${fdtdir}/${fdtfile}\0" \
-+	"loadoverlay=echo uboot_overlays: loading ${actual_uboot_overlay} ...; " \
-+		"load ${devtype} ${bootpart} ${rdaddr} ${actual_uboot_overlay}; " \
-+		"fdt addr ${fdtaddr}; fdt resize ${fdt_buffer}; " \
-+		"fdt apply ${rdaddr}; fdt resize ${fdt_buffer};\0" \
-+	"virtualloadoverlay=if test -e ${devtype} ${bootpart} ${fdtdir}/overlays/${uboot_overlay}; then " \
-+				"setenv actual_uboot_overlay ${fdtdir}/overlays/${uboot_overlay}; " \
-+				"run loadoverlay;" \
-+			"else " \
-+				"if test -e ${devtype} ${bootpart} /lib/firmware/${uboot_overlay}; then " \
-+					"setenv actual_uboot_overlay /lib/firmware/${uboot_overlay}; " \
-+					"run loadoverlay;" \
-+				"else " \
-+					"if test -e ${devtype} ${bootpart} ${uboot_overlay}; then " \
-+						"setenv actual_uboot_overlay ${uboot_overlay}; " \
-+						"run loadoverlay;" \
-+					"else " \
-+						"echo uboot_overlays: unable to find [${devtype} ${bootpart} ${uboot_overlay}]...;" \
-+					"fi;" \
-+				"fi;" \
-+			"fi;\0" \
- 	"envboot=mmc dev ${mmcdev}; " \
- 		"if mmc rescan; then " \
- 			"echo SD/MMC found on device ${mmcdev};" \
--- 
-2.20.1
-
diff --git a/board/beagleboard/beagleboneai/patches/uboot/uboot.hash b/board/beagleboard/beagleboneai/patches/uboot/uboot.hash
index 4b82872f31..80ea21b7cb 100644
--- a/board/beagleboard/beagleboneai/patches/uboot/uboot.hash
+++ b/board/beagleboard/beagleboneai/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0d438b1bb5cceb57a18ea2de4a0d51f7be5b05b98717df05938636e0aadfe11a  u-boot-2021.04.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/beagleboneai_defconfig b/configs/beagleboneai_defconfig
index 38db184817..5d269a1825 100644
--- a/configs/beagleboneai_defconfig
+++ b/configs/beagleboneai_defconfig
@@ -19,9 +19,11 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am57xx_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
