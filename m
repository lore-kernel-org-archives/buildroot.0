Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6ACE77180
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 14:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 978264077D;
	Sun,  8 Dec 2024 14:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lAjW3RJPTCBr; Sun,  8 Dec 2024 14:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E18884076C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E18884076C;
	Sun,  8 Dec 2024 14:38:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3381CED7
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FD3D81C11
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXL7JO5s2uKA for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 14:38:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6DA0B81BF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DA0B81BF5
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DA0B81BF5
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:39 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa67773ffd4so9181866b.2
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 06:38:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733668717; x=1734273517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+1EcYNbaQA7kcg79+QWY9wQyULBeibglvxuPNrcOZI=;
 b=msfydxoATyeBEfNPUrurRKtNnXvtcnEw6iqsKublREhkr2ot1KIroq1rLEUMQTWiUl
 BlWa+lj6fXLNRDOXgCXIMDxjh3r4ZI3GNQBW7Dwo2JLrmj1+QfvZam7mw/imyvyPJBRz
 RPSlf8dkI3SWjZwtvG3Ng7K2BpviekhcwhLEVZYO7WkZfyMrMmHO3ViTc7C7qbMihdjP
 bExaHgWgKe2CyHiKl4RRO65ALg0NdpX5ifayBnjroTpG0L1kcFwDF3vjSfQRIouOp1oi
 iBKASdsVg7+vlMRNS2HU6FJKjnMo8eLYS7ayTJUoqLsfZSpdWUzf0AAhEEoVnHrNWhd3
 AQPg==
X-Gm-Message-State: AOJu0YyqSFgQ2+X+baCn9bAvcF8ibyvfbYzu+3I0GdSmfpxCIBaWsFEL
 wzLVsEBO1SYu9stOSg8gjn2JdEAs51fXO+tryIbDcKGSl0Bz+mihpxd0SQ==
X-Gm-Gg: ASbGncvuwa4a9u+ruGTQiTJ+jHvm8MFvEiEW4a8yrtfRDYZr29aMgSkqAkWZBBfeXiB
 vWFn4MhkZ+OMiiuuXEqAB7+A/UWfkQ+8wCuOZThNPlQopcZE1Paz1K4kPHpmsek0+ACbgC5MarH
 DwVg85iq+M8dlRTgH7Fq/SmzwHMAPUlLvFsxrJGT3Zugakye5hqJpL3eCSYmA/LApRd0W2bublp
 /UTAvwycJKd4YCo8QcI/QLFDtjujM6BjgwwnORMtS4=
X-Google-Smtp-Source: AGHT+IE/7eC99/M8exT6OgYPr/F48kqZ++z979kKVof6Vwh6kRrVIRNkePpiB+GX0aJU4kBDc00S2A==
X-Received: by 2002:a17:907:2d27:b0:aa6:273c:a616 with SMTP id
 a640c23a62f3a-aa639fed099mr355258266b.4.1733668714738; 
 Sun, 08 Dec 2024 06:38:34 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa666cf5743sm204660366b.65.2024.12.08.06.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 06:38:33 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Date: Sun,  8 Dec 2024 16:37:58 +0200
Message-ID: <20241208143802.1048266-8-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208143802.1048266-1-olteanv@gmail.com>
References: <20241208143802.1048266-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733668717; x=1734273517; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+1EcYNbaQA7kcg79+QWY9wQyULBeibglvxuPNrcOZI=;
 b=UAA6KKESYKMaiv6/8F5giXZnifzUauj2csGLqsrcJDG48xGJ0kGWa2hlX/14IMzU0w
 s4K5qHtuCbWna0GXGBEl9u1UAd4u6jKVv7cFL5z3M0DDnjAk+nmq79nioUx2B2Nq7SzI
 y+8TbDpLjoJmYGpqozWDucwQQN5VmKbrpGJuFRlQgIKn0OsUozd6X2pTxa41rylwNT36
 L4vpQjC2FoOjjGCitJF0ZVQIgg9iSk2RESIvEklsVpar2CptPjWAUooDr6sum0SBSYwF
 6mBHCqnv4FR598F20dEOj3c4cO86e1Nz52CmNfzmeaF/cBiAEI6V1TFgfnvCO7j1/DlE
 /NqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UAA6KKES
Subject: [Buildroot] [PATCH v2 07/11] board/lx2160acex7: add Arm Trusted
 Firmware patches
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These come straight from https://github.com/SolidRun/lx2160a_build/,
commit 497e9ebf0e2a ("atf: update sdram configuration for internal cex6
evb revision 1.2"), and are unmodified.

I've also symlinked the extra patch at
board/freescale/common/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
to avoid this warning treated as error:

$(HOSTDIR)/bin/aarch64-buildroot-linux-gnu-ld: warning:
$(BUILDDIR)/arm-trusted-firmware-custom/build/lx2160acex7/release/bl2/bl2.elf
has a LOAD segment with RWX permissions
make[2]: *** [Makefile:1240: $(BUILDDIR)/arm-trusted-firmware-custom/build/lx2160acex7/release/bl2/bl2.elf] Error 1
make[2]: *** Waiting for unfinished jobs....

Since commit 7cbc240ac2c3 ("configs/ls1028ardb: update to Linux 6.6"),
Layerscape platforms no longer use board/freescale/common/patches, and
neither do we, here. But we use an older arm-trusted-firmware tag of
lf-5.15.71-2.2.0, so we need to selectively include that one patch.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2:
- split out from previous [PATCH 6/7] board/lx2160acex7: new platform
- update to latest lx2160a_build HEAD

 .../0001-plat-nxp-lx2160a-auto-boot.patch     | 219 +++++++
 ...ccount-MEM_PLL_CFG_SHIFT-for-ddr-fre.patch |  85 +++
 ...sert-SUS_S5-GPIO-to-poweroff-the-COM.patch |  29 +
 ...assert-IRQ0-GPIO-to-poweroff-the-EVB.patch |  29 +
 ...ptional-S5-gpio-from-Makefile-consta.patch |  63 ++
 ...te-platform-for-solidrun-cex7-module.patch | 418 ++++++++++++
 ...flexible-value-for-CONFIG_DDR_NODIMM.patch |  33 +
 ...tform-for-solidrun-internal-cex6-eva.patch | 544 ++++++++++++++++
 ...ort-flushing-i2c-bus-before-ddr-init.patch | 365 +++++++++++
 ...h-i2c-bus-with-spd-eeprom-before-ddr.patch |  30 +
 ...h-i2c-bus-with-spd-eeprom-before-ddr.patch |  30 +
 ...-building-without-NXP_NV_SW_MAINT_LA.patch |  49 ++
 ...-boot-without-spi-flash-disable-non-.patch |  33 +
 ...te-platform-for-solidrun-lx2162a-som.patch | 597 ++++++++++++++++++
 ...ddr-configuration-for-pcb-v1.2-with-.patch | 127 ++++
 ...g-output-for-dimm-parameters-parsed-.patch |  83 +++
 ...dq-mapping-and-remove-invalid-spd-ee.patch |  36 ++
 ...dd-support-for-new-binutils-versions.patch |   1 +
 18 files changed, 2771 insertions(+)
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0001-plat-nxp-lx2160a-auto-boot.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0002-dcfg-Take-into-account-MEM_PLL_CFG_SHIFT-for-ddr-fre.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0003-lx2160acex7-assert-SUS_S5-GPIO-to-poweroff-the-COM.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0004-lx2160acex6-assert-IRQ0-GPIO-to-poweroff-the-EVB.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0005-lx2160a-assert-optional-S5-gpio-from-Makefile-consta.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0006-add-separate-platform-for-solidrun-cex7-module.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0007-lx2160a-support-flexible-value-for-CONFIG_DDR_NODIMM.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0008-add-separate-platform-for-solidrun-internal-cex6-eva.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0009-lx2160a-support-flushing-i2c-bus-before-ddr-init.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0010-lx2160acex6-flush-i2c-bus-with-spd-eeprom-before-ddr.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0011-lx2160acex7-flush-i2c-bus-with-spd-eeprom-before-ddr.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0012-plat-lx2160a-fix-building-without-NXP_NV_SW_MAINT_LA.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0013-plat-lx2160a-fix-boot-without-spi-flash-disable-non-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0014-add-separate-platform-for-solidrun-lx2162a-som.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0015-lx2160acex6-add-ddr-configuration-for-pcb-v1.2-with-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0016-nxp-ddr-add-debug-output-for-dimm-parameters-parsed-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0017-lx2160acex6-fix-dq-mapping-and-remove-invalid-spd-ee.patch
 create mode 120000 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0018-feat-build-add-support-for-new-binutils-versions.patch

diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0001-plat-nxp-lx2160a-auto-boot.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0001-plat-nxp-lx2160a-auto-boot.patch
new file mode 100644
index 000000000000..4b47054b0d78
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0001-plat-nxp-lx2160a-auto-boot.patch
@@ -0,0 +1,219 @@
+From 5d13f425bd0dea29912bf253a7be83a7cdca591d Mon Sep 17 00:00:00 2001
+From: Rabeeh Khoury <rabeeh@solid-run.com>
+Date: Sun, 28 Nov 2021 14:00:07 +0200
+Subject: [PATCH] plat/nxp: lx2160a auto boot
+
+This patch adds support to patch RCW that already has SD/eMMC/SPI boot
+support embedded with conditional load and jump.
+The idea is to look for SD/eMMC/SPI boot, and modify src/dst/size
+address with the correct values; rather than adding blockread at the end
+of RCW code.
+
+With this patch images are unified and can be used to boot from SD /
+eMMC and SPI.
+
+Signed-off-by: Rabeeh Khoury <rabeeh@solid-run.com>
+---
+ .../plat_make_helper/plat_common_def.mk       |  5 ++
+ plat/nxp/soc-lx2160a/lx2160ardb/platform.mk   |  3 +-
+ plat/nxp/soc-lx2160a/soc.mk                   |  5 ++
+ tools/nxp/create_pbl/create_pbl.c             | 74 ++++++++++++++++---
+ 4 files changed, 76 insertions(+), 11 deletions(-)
+
+diff --git a/plat/nxp/common/plat_make_helper/plat_common_def.mk b/plat/nxp/common/plat_make_helper/plat_common_def.mk
+index 86dacf83d..a1038a073 100644
+--- a/plat/nxp/common/plat_make_helper/plat_common_def.mk
++++ b/plat/nxp/common/plat_make_helper/plat_common_def.mk
+@@ -91,6 +91,11 @@ define add_boot_mode_define
+     else ifeq ($(1),flexspi_nor)
+         $$(eval $$(call SET_NXP_MAKE_FLAG,XSPI_NEEDED,BL2))
+         $$(eval $$(call add_define,FLEXSPI_NOR_BOOT))
++    else ifeq ($(1),auto)
++        $$(eval $$(call SET_FLAG,SD_MMC_NEEDED,BL2))
++        $$(eval $$(call add_define,EMMC_BOOT))
++        $$(eval $$(call SET_FLAG,XSPI_NEEDED,BL2))
++        $$(eval $$(call add_define,FLEXSPI_NOR_BOOT))
+     else
+         $$(error $(PLAT) Cannot Support Boot Mode: $(BOOT_MODE))
+     endif
+diff --git a/plat/nxp/soc-lx2160a/lx2160ardb/platform.mk b/plat/nxp/soc-lx2160a/lx2160ardb/platform.mk
+index ffb5fadee..09c552c72 100644
+--- a/plat/nxp/soc-lx2160a/lx2160ardb/platform.mk
++++ b/plat/nxp/soc-lx2160a/lx2160ardb/platform.mk
+@@ -42,7 +42,8 @@ BL2_SOURCES	+=	${BOARD_PATH}/ddr_init.c\
+ 
+ SUPPORTED_BOOT_MODE	:=	flexspi_nor	\
+ 				sd		\
+-				emmc
++				emmc		\
++				auto
+ 
+ # Adding platform board build info
+ include plat/nxp/common/plat_make_helper/plat_common_def.mk
+diff --git a/plat/nxp/soc-lx2160a/soc.mk b/plat/nxp/soc-lx2160a/soc.mk
+index 239442c20..a72b4113d 100644
+--- a/plat/nxp/soc-lx2160a/soc.mk
++++ b/plat/nxp/soc-lx2160a/soc.mk
+@@ -82,6 +82,11 @@ else
+ ifeq (${BOOT_MODE}, emmc)
+ $(eval $(call SET_NXP_MAKE_FLAG,SD_MMC_NEEDED,BL2))
+ $(eval $(call add_define,EMMC_BOOT))
++else ifeq (${BOOT_MODE}, auto)
++$(eval $(call SET_NXP_MAKE_FLAG,SD_MMC_NEEDED,BL2))
++$(eval $(call add_define,EMMC_BOOT))
++$(eval $(call SET_NXP_MAKE_FLAG,XSPI_NEEDED,BL2))
++$(eval $(call add_define,FLEXSPI_NOR_BOOT))
+ else
+ $(error Un-supported Boot Mode = ${BOOT_MODE})
+ endif
+diff --git a/tools/nxp/create_pbl/create_pbl.c b/tools/nxp/create_pbl/create_pbl.c
+index 792747f0e..35cd39b61 100644
+--- a/tools/nxp/create_pbl/create_pbl.c
++++ b/tools/nxp/create_pbl/create_pbl.c
+@@ -66,6 +66,7 @@ typedef enum {
+ 	FLXSPI_NOR_BOOT,
+ 	FLXSPI_NAND_BOOT,
+ 	FLXSPI_NAND4K_BOOT,
++	AUTO_BOOT,
+ 	MAX_BOOT    /* must be last item in list */
+ } boot_src_t;
+ 
+@@ -140,6 +141,7 @@ char *boot_src_string[] = {
+ 	"FLXSPI_NOR_BOOT",
+ 	"FLXSPI_NAND_BOOT",
+ 	"FLXSPI_NAND4K_BOOT",
++	"AUTO_BOOT",
+ };
+ 
+ enum stop_command {
+@@ -193,7 +195,7 @@ struct pbl_image {
+ #define SOC_LS2088 2088
+ #define SOC_LX2160 2160
+ 
+-static uint32_t pbl_size;
++static uint32_t pbl_size = 0;
+ bool sb_flag;
+ 
+ /***************************************************************************
+@@ -703,6 +705,8 @@ int main(int argc, char **argv)
+ 	int ret = FAILURE;
+ 	bool bootptr_flag = false;
+ 	enum stop_command flag_stop_cmd = CRC_STOP_COMMAND;
++	int skip = 0;
++	uint32_t saved_src;
+ 
+ 	/* Initializing the global structure to zero. */
+ 	memset(&pblimg, 0x0, sizeof(struct pbl_image));
+@@ -802,6 +806,8 @@ int main(int argc, char **argv)
+ 				pblimg.boot_src = FLXSPI_NAND_BOOT;
+ 			} else if (strcmp(optarg, "flexspi_nand2k") == 0) {
+ 				pblimg.boot_src = FLXSPI_NAND4K_BOOT;
++			} else if (strcmp(optarg, "auto") == 0) {
++				pblimg.boot_src = AUTO_BOOT;
+ 			} else {
+ 				printf("CMD Error: Invalid boot source.\n");
+ 				goto exit_main;
+@@ -909,13 +915,14 @@ int main(int argc, char **argv)
+ 			printf("%s: Error reading PBI Cmd.\n", __func__);
+ 			goto exit_main;
+ 		}
++		saved_src = pblimg.src_addr;
+ 		while (word != 0x808f0000 && word != 0x80ff0000) {
+ 			pbl_size++;
+ 			/* 11th words in RCW has PBL length. Update it
+ 			 * with new length. 2 comamnds get added
+ 			 * Block copy + CCSR Write/CSF header write
+ 			 */
+-			if (pbl_size == 11) {
++			if ((pbl_size == 11) && (pblimg.boot_src != AUTO_BOOT)) {
+ 				word_1 = (word & PBI_LEN_MASK)
+ 					+ (PBI_LEN_ADD << 20);
+ 				word = word & ~PBI_LEN_MASK;
+@@ -933,8 +940,50 @@ int main(int argc, char **argv)
+ 					goto exit_main;
+ 				}
+ 			}
+-			if (fwrite(&word, sizeof(word),	NUM_MEM_BLOCK,
+-				fp_rcw_pbi_op) != NUM_MEM_BLOCK) {
++			if (pblimg.boot_src == AUTO_BOOT) {
++				if (word == 0x80000008) {
++					printf ("Found SD boot at %d\n",pbl_size);
++					pblimg.boot_src = SD_BOOT;
++					add_blk_cpy_cmd(fp_rcw_pbi_op, args);
++					skip = 4; // skip original blockcopy
++					pblimg.boot_src = AUTO_BOOT;
++					pblimg.src_addr = saved_src;
++					if (bootptr_flag == true) {
++						add_boot_ptr_cmd(fp_rcw_pbi_op);
++						skip += 2; // skip original bootlocptr write (low byte only)
++						printf("added bootptr\n");
++					}
++				}
++				if (word == 0x80000009) {
++					printf ("Found eMMC boot at %d\n",pbl_size);
++					pblimg.boot_src = EMMC_BOOT;
++					add_blk_cpy_cmd(fp_rcw_pbi_op, args);
++					skip = 4; // skip original blockcopy
++					pblimg.boot_src = AUTO_BOOT;
++					pblimg.src_addr = saved_src;
++					if (bootptr_flag == true) {
++						add_boot_ptr_cmd(fp_rcw_pbi_op);
++						skip += 2; // skip original bootlocptr write (low byte only)
++						printf("added bootptr\n");
++					}
++				}
++				if (word == 0x8000000f) {
++					printf ("Found SPI boot at %d\n",pbl_size);
++					pblimg.boot_src = FLXSPI_NOR_BOOT;
++					add_blk_cpy_cmd(fp_rcw_pbi_op, args);
++					skip = 4; // skip original blockcopy
++					pblimg.boot_src = AUTO_BOOT;
++					pblimg.src_addr = saved_src;
++					if (bootptr_flag == true) {
++						add_boot_ptr_cmd(fp_rcw_pbi_op);
++						skip += 2; // skip original bootlocptr write (low byte only)
++						printf("added bootptr\n");
++					}
++				}
++			}
++			if (!skip &&
++				(fwrite(&word, sizeof(word),	NUM_MEM_BLOCK,
++					fp_rcw_pbi_op) != NUM_MEM_BLOCK)) {
+ 				printf("%s: [CH3] Error in Writing PBI Words\n",
+ 					__func__);
+ 				goto exit_main;
+@@ -951,8 +1000,11 @@ int main(int argc, char **argv)
+ 			} else if (word == STOP_CMD_ARM_CH3) {
+ 				flag_stop_cmd = STOP_COMMAND;
+ 			}
++
++			if (skip)
++				skip--;
+ 		}
+-		if (bootptr_flag == true) {
++		if ((pblimg.boot_src != AUTO_BOOT) && (bootptr_flag == true)) {
+ 			/* Add command to set boot_loc ptr */
+ 			ret = add_boot_ptr_cmd(fp_rcw_pbi_op);
+ 			if (ret != SUCCESS) {
+@@ -963,11 +1015,13 @@ int main(int argc, char **argv)
+ 		}
+ 
+ 		/* Write acs write commands to output file */
+-		ret = add_blk_cpy_cmd(fp_rcw_pbi_op, args);
+-		if (ret != SUCCESS) {
+-			printf("%s: Function add_blk_cpy_cmd return failure.\n",
+-				 __func__);
+-			goto exit_main;
++		if (pblimg.boot_src != AUTO_BOOT) {
++			ret = add_blk_cpy_cmd(fp_rcw_pbi_op, args);
++			if (ret != SUCCESS) {
++				printf("%s: Function add_blk_cpy_cmd return failure.\n",
++					 __func__);
++				goto exit_main;
++			}
+ 		}
+ 
+ 		/* Add stop command after adding pbi commands */
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0002-dcfg-Take-into-account-MEM_PLL_CFG_SHIFT-for-ddr-fre.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0002-dcfg-Take-into-account-MEM_PLL_CFG_SHIFT-for-ddr-fre.patch
new file mode 100644
index 000000000000..9fb5de84bc89
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0002-dcfg-Take-into-account-MEM_PLL_CFG_SHIFT-for-ddr-fre.patch
@@ -0,0 +1,85 @@
+From f750b41bf323d04791b4b25962f693c1fb43bade Mon Sep 17 00:00:00 2001
+From: Jon Nettleton <jon@solid-run.com>
+Date: Tue, 8 Oct 2024 04:56:45 +0200
+Subject: [PATCH] dcfg: Take into account MEM_PLL_CFG_SHIFT for ddr frequency
+
+The base ddr clock frequency is 1/4 the speed of the final
+ddr clock frequency. By default the RCW config is setting
+the CFG_SHIFT to be a 1/4 divider of the memory speed,
+i.e.  3200 / 4 (800MHz).  The parent DDRCLK is 100MHz so PLL_RAT
+needs to be rounded to 100MHz. However using a divider of / 3 for
+a lower speed always us to match industry standard ddr4 speeds
+2666 and 2933 (2000 / 3 * 4 = 2666.67)
+
+This patch takes into account the PLL_CFG_SHIFT divider so these
+speeds can be configured in the RCW and then updates the helper
+function that reports ddr_clk_freq to properly multiply the
+clock fed into the DDRC * 4 to properly reflect the actual MTs
+that the memory is being configured for.
+
+Signed-off-by: Jon Nettleton <jon@solid-run.com>
+---
+ drivers/nxp/dcfg/dcfg.c               | 6 ++++++
+ drivers/nxp/ddr/nxp-ddr/utility.c     | 6 +++---
+ include/drivers/nxp/dcfg/dcfg_lsch3.h | 4 ++++
+ 3 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/nxp/dcfg/dcfg.c b/drivers/nxp/dcfg/dcfg.c
+index e5c4db437..4a5820a64 100644
+--- a/drivers/nxp/dcfg/dcfg.c
++++ b/drivers/nxp/dcfg/dcfg.c
+@@ -104,9 +104,15 @@ int get_clocks(struct sysinfo *sys)
+ 	sys->freq_ddr_pll0 *= (gur_in32(rcwsr0) >>
+ 				RCWSR0_MEM_PLL_RAT_SHIFT) &
+ 				RCWSR0_MEM_PLL_RAT_MASK;
++	sys->freq_ddr_pll0 /= ((gur_in32(rcwsr0) >>
++				RCWSR0_MEM_PLL_CFG_SHIFT) &
++				RCWSR0_MEM_PLL_CFG_MASK) + 1;
+ 	sys->freq_ddr_pll1 *= (gur_in32(rcwsr0) >>
+ 				RCWSR0_MEM2_PLL_RAT_SHIFT) &
+ 				RCWSR0_MEM2_PLL_RAT_MASK;
++	sys->freq_ddr_pll1 /= ((gur_in32(rcwsr0) >>
++				RCWSR0_MEM2_PLL_CFG_SHIFT) &
++				RCWSR0_MEM2_PLL_CFG_MASK) + 1;
+ 	if (sys->freq_platform == 0) {
+ 		return 1;
+ 	} else {
+diff --git a/drivers/nxp/ddr/nxp-ddr/utility.c b/drivers/nxp/ddr/nxp-ddr/utility.c
+index b6dffc872..3920b4488 100644
+--- a/drivers/nxp/ddr/nxp-ddr/utility.c
++++ b/drivers/nxp/ddr/nxp-ddr/utility.c
+@@ -47,11 +47,11 @@ unsigned long get_ddr_freq(struct sysinfo *sys, int ctrl_num)
+ 
+ 	switch (ctrl_num) {
+ 	case 0:
+-		return sys->freq_ddr_pll0;
++		return sys->freq_ddr_pll0 * 4;
+ 	case 1:
+-		return sys->freq_ddr_pll0;
++		return sys->freq_ddr_pll0 * 4;
+ 	case 2:
+-		return sys->freq_ddr_pll1;
++		return sys->freq_ddr_pll1 * 4;
+ 	}
+ 
+ 	return 0;
+diff --git a/include/drivers/nxp/dcfg/dcfg_lsch3.h b/include/drivers/nxp/dcfg/dcfg_lsch3.h
+index cde86fe19..f9409d1a7 100644
+--- a/include/drivers/nxp/dcfg/dcfg_lsch3.h
++++ b/include/drivers/nxp/dcfg/dcfg_lsch3.h
+@@ -53,8 +53,12 @@
+ #define RCWSR0_OFFSET				0x100
+ #define RCWSR0_SYS_PLL_RAT_SHIFT	2
+ #define RCWSR0_SYS_PLL_RAT_MASK		0x1f
++#define RCWSR0_MEM_PLL_CFG_SHIFT	8
++#define RCWSR0_MEM_PLL_CFG_MASK		0x3
+ #define RCWSR0_MEM_PLL_RAT_SHIFT	10
+ #define RCWSR0_MEM_PLL_RAT_MASK		0x3f
++#define RCWSR0_MEM2_PLL_CFG_SHIFT	16
++#define RCWSR0_MEM2_PLL_CFG_MASK	0x3
+ #define RCWSR0_MEM2_PLL_RAT_SHIFT	18
+ #define RCWSR0_MEM2_PLL_RAT_MASK	0x3f
+ 
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0003-lx2160acex7-assert-SUS_S5-GPIO-to-poweroff-the-COM.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0003-lx2160acex7-assert-SUS_S5-GPIO-to-poweroff-the-COM.patch
new file mode 100644
index 000000000000..d77020956579
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0003-lx2160acex7-assert-SUS_S5-GPIO-to-poweroff-the-COM.patch
@@ -0,0 +1,29 @@
+From 72557b712198e3292776fbe8697322c68583acf4 Mon Sep 17 00:00:00 2001
+From: Rabeeh Khoury <rabeeh@solid-run.com>
+Date: Sun, 28 Nov 2021 13:33:10 +0200
+Subject: [PATCH] lx2160acex7: assert SUS_S5# GPIO to poweroff the COM
+
+Signed-off-by: Rabeeh Khoury <rabeeh@solid-run.com>
+---
+ plat/nxp/soc-lx2160a/aarch64/lx2160a.S | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/plat/nxp/soc-lx2160a/aarch64/lx2160a.S b/plat/nxp/soc-lx2160a/aarch64/lx2160a.S
+index cc679f2ba..01b3c7ecd 100644
+--- a/plat/nxp/soc-lx2160a/aarch64/lx2160a.S
++++ b/plat/nxp/soc-lx2160a/aarch64/lx2160a.S
+@@ -563,6 +563,11 @@ endfunc _soc_sys_reset
+  */
+ func _soc_sys_off
+ 
++	/* assert GPIO3[7] (IRQ07 - CEX-7 SUS_S5) */
++	mov x3, #NXP_GPIO3_ADDR
++	mov w1, #0x01000000
++	str w1, [x3]
++
+ 	/* disable sec, QBman, spi and qspi */
+ 	ldr  x2, =NXP_DCFG_ADDR
+ 	ldr  x0, =DCFG_DEVDISR1_OFFSET
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0004-lx2160acex6-assert-IRQ0-GPIO-to-poweroff-the-EVB.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0004-lx2160acex6-assert-IRQ0-GPIO-to-poweroff-the-EVB.patch
new file mode 100644
index 000000000000..848951cf2a82
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0004-lx2160acex6-assert-IRQ0-GPIO-to-poweroff-the-EVB.patch
@@ -0,0 +1,29 @@
+From 6bc7cf0b6de6427b230d47ae7ee273175ffe95dd Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Mon, 14 Oct 2024 11:55:03 +0200
+Subject: [PATCH] lx2160acex6: assert IRQ0 GPIO to poweroff the EVB
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ plat/nxp/soc-lx2160a/aarch64/lx2160a.S | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/plat/nxp/soc-lx2160a/aarch64/lx2160a.S b/plat/nxp/soc-lx2160a/aarch64/lx2160a.S
+index 01b3c7ecd..8035b145e 100644
+--- a/plat/nxp/soc-lx2160a/aarch64/lx2160a.S
++++ b/plat/nxp/soc-lx2160a/aarch64/lx2160a.S
+@@ -563,9 +563,9 @@ endfunc _soc_sys_reset
+  */
+ func _soc_sys_off
+ 
+-	/* assert GPIO3[7] (IRQ07 - CEX-7 SUS_S5) */
++	/* assert GPIO3[7] (IRQ07 - CEX-7 SUS_S5), GPIO3[0] (IRQ00 - CEX-6 EVB IRQ0) */
+ 	mov x3, #NXP_GPIO3_ADDR
+-	mov w1, #0x01000000
++	mov w1, #0x81000000
+ 	str w1, [x3]
+ 
+ 	/* disable sec, QBman, spi and qspi */
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0005-lx2160a-assert-optional-S5-gpio-from-Makefile-consta.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0005-lx2160a-assert-optional-S5-gpio-from-Makefile-consta.patch
new file mode 100644
index 000000000000..25865c759e8d
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0005-lx2160a-assert-optional-S5-gpio-from-Makefile-consta.patch
@@ -0,0 +1,63 @@
+From 13496d248f11fe09d5a634fe15dd6b507a520a87 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Fri, 18 Oct 2024 21:09:04 +0200
+Subject: [PATCH 5/6] lx2160a: assert optional S5 gpio from Makefile constant
+
+GPIO address and number for S5 are specific per board and should not be
+set globally across lx2160.
+
+Add support for setting gpio address and number form platform.mk, into
+soc.mk:
+
+- LX2160A_S5_GPIO_ADDR: gpio value register address
+- LX2160A_S5_GPIO: gpio number
+
+This feature can be enabled for individual boards by setting a non-zero
+address in platform.mk file, before including soc.mk.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ plat/nxp/soc-lx2160a/aarch64/lx2160a.S | 9 ++++++---
+ plat/nxp/soc-lx2160a/soc.mk            | 8 ++++++++
+ 2 files changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/plat/nxp/soc-lx2160a/aarch64/lx2160a.S b/plat/nxp/soc-lx2160a/aarch64/lx2160a.S
+index 8035b145e..67ade7b66 100644
+--- a/plat/nxp/soc-lx2160a/aarch64/lx2160a.S
++++ b/plat/nxp/soc-lx2160a/aarch64/lx2160a.S
+@@ -563,10 +563,13 @@ endfunc _soc_sys_reset
+  */
+ func _soc_sys_off
+ 
+-	/* assert GPIO3[7] (IRQ07 - CEX-7 SUS_S5), GPIO3[0] (IRQ00 - CEX-6 EVB IRQ0) */
+-	mov x3, #NXP_GPIO3_ADDR
+-	mov w1, #0x81000000
++#if defined(CONFIG_LX2160A_S5_GPIO_ADDR) && defined(CONFIG_LX2160A_S5_GPIO)
++	/* assert s5 gpio */
++	mov x3, # CONFIG_LX2160A_S5_GPIO_ADDR
++	ldr w1, [x3]
++	orr w1, w1, # 1 << (31 - CONFIG_LX2160A_S5_GPIO)
+ 	str w1, [x3]
++#endif
+ 
+ 	/* disable sec, QBman, spi and qspi */
+ 	ldr  x2, =NXP_DCFG_ADDR
+diff --git a/plat/nxp/soc-lx2160a/soc.mk b/plat/nxp/soc-lx2160a/soc.mk
+index a72b4113d..20e64753c 100644
+--- a/plat/nxp/soc-lx2160a/soc.mk
++++ b/plat/nxp/soc-lx2160a/soc.mk
+@@ -177,3 +177,11 @@ include ${PLAT_PATH}/common/setup/common.mk
+ 
+  # Adding source files to generate separate DDR FIP image
+ include ${PLAT_SOC_PATH}/ddr_fip.mk
++
++# S5 GPIO (optional)
++LX2160A_S5_GPIO_ADDR ?= 0
++LX2160A_S5_GPIO ?= 0
++ifneq (${LX2160A_S5_GPIO_ADDR},0)
++$(eval $(call add_define_val,CONFIG_LX2160A_S5_GPIO_ADDR,$(LX2160A_S5_GPIO_ADDR)))
++$(eval $(call add_define_val,CONFIG_LX2160A_S5_GPIO,$(LX2160A_S5_GPIO)))
++endif
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0006-add-separate-platform-for-solidrun-cex7-module.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0006-add-separate-platform-for-solidrun-cex7-module.patch
new file mode 100644
index 000000000000..8e961b6e0e86
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0006-add-separate-platform-for-solidrun-cex7-module.patch
@@ -0,0 +1,418 @@
+From 1fc354074e5fe98e185633b8d7f62836d5b2b710 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Fri, 18 Oct 2024 15:11:53 +0200
+Subject: [PATCH 6/6] add separate platform for solidrun cex7 module
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ plat/nxp/soc-lx2160a/lx2160acex7/ddr_init.c   | 116 ++++++++++++++++++
+ plat/nxp/soc-lx2160a/lx2160acex7/plat_def.h   | 105 ++++++++++++++++
+ plat/nxp/soc-lx2160a/lx2160acex7/platform.c   |  29 +++++
+ plat/nxp/soc-lx2160a/lx2160acex7/platform.mk  |  56 +++++++++
+ .../soc-lx2160a/lx2160acex7/platform_def.h    |  14 +++
+ plat/nxp/soc-lx2160a/lx2160acex7/policy.h     |  38 ++++++
+ 6 files changed, 358 insertions(+)
+ create mode 100644 plat/nxp/soc-lx2160a/lx2160acex7/ddr_init.c
+ create mode 100644 plat/nxp/soc-lx2160a/lx2160acex7/plat_def.h
+ create mode 100644 plat/nxp/soc-lx2160a/lx2160acex7/platform.c
+ create mode 100644 plat/nxp/soc-lx2160a/lx2160acex7/platform.mk
+ create mode 100644 plat/nxp/soc-lx2160a/lx2160acex7/platform_def.h
+ create mode 100644 plat/nxp/soc-lx2160a/lx2160acex7/policy.h
+
+diff --git a/plat/nxp/soc-lx2160a/lx2160acex7/ddr_init.c b/plat/nxp/soc-lx2160a/lx2160acex7/ddr_init.c
+new file mode 100644
+index 000000000..2bd014a7e
+--- /dev/null
++++ b/plat/nxp/soc-lx2160a/lx2160acex7/ddr_init.c
+@@ -0,0 +1,116 @@
++/*
++ * Copyright 2021 NXP
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#include <assert.h>
++#include <errno.h>
++#include <stdbool.h>
++#include <stdint.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++
++#include <common/debug.h>
++#include <ddr.h>
++#include <lib/utils.h>
++#include <load_img.h>
++
++#include "plat_common.h"
++#include <platform_def.h>
++
++#if defined(CONFIG_STATIC_DDR) || defined(CONFIG_DDR_NODIMM)
++#error not implemented
++#endif /* defined(CONFIG_STATIC_DDR) || defined(CONFIG_DDR_NODIMM) */
++
++int ddr_board_options(struct ddr_info *priv)
++{
++	struct memctl_opt *popts = &priv->opt;
++	const struct ddr_conf *conf = &priv->conf;
++
++	popts->vref_dimm = U(0x24);		/* range 1, 83.4% */
++	popts->rtt_override = 0;
++	popts->rtt_park = U(240);
++	popts->otf_burst_chop_en = 0;
++	popts->burst_length = U(DDR_BL8);
++	popts->trwt_override = U(1);
++	popts->bstopre = U(0);			/* auto precharge */
++	popts->addr_hash = 1;
++
++	/* Set ODT impedance on PHY side */
++	switch (conf->cs_on_dimm[1]) {
++	case 0xc:	/* Two slots dual rank */
++	case 0x4:	/* Two slots single rank, not valid for interleaving */
++		popts->trwt = U(0xf);
++		popts->twrt = U(0x7);
++		popts->trrt = U(0x7);
++		popts->twwt = U(0x7);
++		popts->vref_phy = U(0x6B);	/* 83.6% */
++		popts->odt = U(60);
++		popts->phy_tx_impedance = U(28);
++		break;
++	case 0:		/* One slot used */
++	default:
++		popts->trwt = U(0x3);
++		popts->twrt = U(0x3);
++		popts->trrt = U(0x3);
++		popts->twwt = U(0x3);
++		popts->vref_phy = U(0x60);	/* 75% */
++		popts->odt = U(48);
++		popts->phy_tx_impedance = U(28);
++		break;
++	}
++
++	return 0;
++}
++
++long long init_ddr(void)
++{
++	int spd_addr[] = { 0x51, 0x52, 0x53, 0x54 };
++	struct ddr_info info;
++	struct sysinfo sys;
++	long long dram_size;
++
++	zeromem(&sys, sizeof(sys));
++	if (get_clocks(&sys) != 0) {
++		ERROR("System clocks are not set\n");
++		panic();
++	}
++	debug("platform clock %lu\n", sys.freq_platform);
++	debug("DDR PLL1 %lu\n", sys.freq_ddr_pll0);
++	debug("DDR PLL2 %lu\n", sys.freq_ddr_pll1);
++
++	zeromem(&info, sizeof(info));
++
++	/* Set two DDRC. Unused DDRC will be removed automatically. */
++	info.num_ctlrs = NUM_OF_DDRC;
++	info.spd_addr = spd_addr;
++	info.ddr[0] = (void *)NXP_DDR_ADDR;
++	info.ddr[1] = (void *)NXP_DDR2_ADDR;
++	info.phy[0] = (void *)NXP_DDR_PHY1_ADDR;
++	info.phy[1] = (void *)NXP_DDR_PHY2_ADDR;
++	info.clk = get_ddr_freq(&sys, 0);
++	info.img_loadr = load_img;
++	info.phy_gen2_fw_img_buf = PHY_GEN2_FW_IMAGE_BUFFER;
++	if (info.clk == 0) {
++		info.clk = get_ddr_freq(&sys, 1);
++	}
++	info.dimm_on_ctlr = DDRC_NUM_DIMM;
++
++	info.warm_boot_flag = DDR_WRM_BOOT_NT_SUPPORTED;
++
++	dram_size = dram_init(&info
++#if defined(NXP_HAS_CCN504) || defined(NXP_HAS_CCN508)
++		    , NXP_CCN_HN_F_0_ADDR
++#endif
++		    );
++
++
++	if (dram_size < 0) {
++		ERROR("DDR init failed.\n");
++	}
++
++	return dram_size;
++}
+diff --git a/plat/nxp/soc-lx2160a/lx2160acex7/plat_def.h b/plat/nxp/soc-lx2160a/lx2160acex7/plat_def.h
+new file mode 100644
+index 000000000..02f51e74d
+--- /dev/null
++++ b/plat/nxp/soc-lx2160a/lx2160acex7/plat_def.h
+@@ -0,0 +1,105 @@
++/*
++ * Copyright 2021 NXP
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef PLAT_DEF_H
++#define PLAT_DEF_H
++
++#include <arch.h>
++#include <cortex_a72.h>
++/* Required without TBBR.
++ * To include the defines for DDR PHY
++ * Images.
++ */
++#include <tbbr_img_def.h>
++
++#include <policy.h>
++#include <soc.h>
++
++#if defined(IMAGE_BL31)
++#define LS_SYS_TIMCTL_BASE		0x2890000
++#define PLAT_LS_NSTIMER_FRAME_ID	0
++#define LS_CONFIG_CNTACR		1
++#endif
++
++#define NXP_SYSCLK_FREQ		100000000
++#define NXP_DDRCLK_FREQ		100000000
++
++/* UART related definition */
++#define NXP_CONSOLE_ADDR	NXP_UART_ADDR
++#define NXP_CONSOLE_BAUDRATE	115200
++
++/* Size of cacheable stacks */
++#if defined(IMAGE_BL2)
++#if defined(TRUSTED_BOARD_BOOT)
++#define PLATFORM_STACK_SIZE	0x2000
++#else
++#define PLATFORM_STACK_SIZE	0x1000
++#endif
++#elif defined(IMAGE_BL31)
++#define PLATFORM_STACK_SIZE	0x1000
++#endif
++
++/* SD block buffer */
++#define NXP_SD_BLOCK_BUF_SIZE	(0x8000)
++#define NXP_SD_BLOCK_BUF_ADDR	(NXP_OCRAM_ADDR + NXP_OCRAM_SIZE \
++				- NXP_SD_BLOCK_BUF_SIZE)
++
++#ifdef SD_BOOT
++#define BL2_LIMIT		(NXP_OCRAM_ADDR + NXP_OCRAM_SIZE \
++				- NXP_SD_BLOCK_BUF_SIZE)
++#else
++#define BL2_LIMIT		(NXP_OCRAM_ADDR + NXP_OCRAM_SIZE)
++#endif
++
++/* IO defines as needed by IO driver framework */
++#define MAX_IO_DEVICES		4
++#define MAX_IO_BLOCK_DEVICES	1
++#define MAX_IO_HANDLES		4
++
++#define PHY_GEN2_FW_IMAGE_BUFFER	(NXP_OCRAM_ADDR + CSF_HDR_SZ)
++
++/*
++ * FIP image defines - Offset at which FIP Image would be present
++ * Image would include Bl31 , Bl33 and Bl32 (optional)
++ */
++#ifdef POLICY_FUSE_PROVISION
++#define MAX_FIP_DEVICES		3
++#endif
++
++#ifndef MAX_FIP_DEVICES
++#define MAX_FIP_DEVICES		2
++#endif
++
++/*
++ * ID of the secure physical generic timer interrupt used by the BL32.
++ */
++#define BL32_IRQ_SEC_PHY_TIMER	29
++
++#define BL31_WDOG_SEC		89
++
++#define BL31_NS_WDOG_WS1	108
++
++/*
++ * Define properties of Group 1 Secure and Group 0 interrupts as per GICv3
++ * terminology. On a GICv2 system or mode, the lists will be merged and treated
++ * as Group 0 interrupts.
++ */
++#define PLAT_LS_G1S_IRQ_PROPS(grp) \
++	INTR_PROP_DESC(BL32_IRQ_SEC_PHY_TIMER, GIC_HIGHEST_SEC_PRIORITY, grp, \
++			GIC_INTR_CFG_EDGE)
++
++/* SGI 15 and Secure watchdog interrupts assigned to Group 0 */
++#define NXP_IRQ_SEC_SGI_7		15
++
++#define PLAT_LS_G0_IRQ_PROPS(grp)	\
++	INTR_PROP_DESC(BL31_WDOG_SEC, GIC_HIGHEST_SEC_PRIORITY, grp, \
++			GIC_INTR_CFG_EDGE), \
++	INTR_PROP_DESC(BL31_NS_WDOG_WS1, GIC_HIGHEST_SEC_PRIORITY, grp, \
++			GIC_INTR_CFG_EDGE), \
++	INTR_PROP_DESC(NXP_IRQ_SEC_SGI_7, GIC_HIGHEST_SEC_PRIORITY, grp, \
++			GIC_INTR_CFG_LEVEL)
++#endif
+diff --git a/plat/nxp/soc-lx2160a/lx2160acex7/platform.c b/plat/nxp/soc-lx2160a/lx2160acex7/platform.c
+new file mode 100644
+index 000000000..b00adb51d
+--- /dev/null
++++ b/plat/nxp/soc-lx2160a/lx2160acex7/platform.c
+@@ -0,0 +1,29 @@
++/*
++ * Copyright 2021 NXP
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#include <plat_common.h>
++
++#pragma weak board_enable_povdd
++#pragma weak board_disable_povdd
++
++bool board_enable_povdd(void)
++{
++#ifdef CONFIG_POVDD_ENABLE
++	return true;
++#else
++	return false;
++#endif
++}
++
++bool board_disable_povdd(void)
++{
++#ifdef CONFIG_POVDD_ENABLE
++	return true;
++#else
++	return false;
++#endif
++}
+diff --git a/plat/nxp/soc-lx2160a/lx2160acex7/platform.mk b/plat/nxp/soc-lx2160a/lx2160acex7/platform.mk
+new file mode 100644
+index 000000000..37598c2d7
+--- /dev/null
++++ b/plat/nxp/soc-lx2160a/lx2160acex7/platform.mk
+@@ -0,0 +1,56 @@
++#
++# Copyright 2021 NXP
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++
++# board-specific build parameters
++
++BOOT_MODE	?= 	flexspi_nor
++BOARD		?=	lx2160acex7
++POVDD_ENABLE	:=	no
++NXP_COINED_BB	:=	no
++
++ # DDR Compilation Configs
++NUM_OF_DDRC	:=	2
++DDRC_NUM_DIMM	:=	2
++DDRC_NUM_CS	:=	4
++DDR_ECC_EN	:=	yes
++ #enable address decoding feature
++DDR_ADDR_DEC	:=	yes
++APPLY_MAX_CDD	:=	yes
++
++# S5 GPIO
++LX2160A_S5_GPIO_ADDR := NXP_GPIO3_ADDR
++LX2160A_S5_GPIO := 7
++
++# DDR Errata
++ERRATA_DDR_A011396	:= 1
++ERRATA_DDR_A050450	:= 1
++
++ # On-Board Flash Details
++FLASH_TYPE	:=	MT35XU512A
++XSPI_FLASH_SZ	:=	0x10000000
++NXP_XSPI_NOR_UNIT_SIZE		:=	0x20000
++BL2_BIN_XSPI_NOR_END_ADDRESS	:=	0x100000
++# CONFIG_FSPI_ERASE_4K is required to erase 4K sector sizes. This
++# config is enabled for future use cases.
++FSPI_ERASE_4K	:= 0
++
++ # Platform specific features.
++WARM_BOOT	:=	no
++
++ # Adding Platform files build files
++BL2_SOURCES	+=	${BOARD_PATH}/ddr_init.c\
++			${BOARD_PATH}/platform.c
++
++SUPPORTED_BOOT_MODE	:=	flexspi_nor	\
++				sd		\
++				emmc		\
++				auto
++
++# Adding platform board build info
++include plat/nxp/common/plat_make_helper/plat_common_def.mk
++
++ # Adding SoC build info
++include plat/nxp/soc-lx2160a/soc.mk
+diff --git a/plat/nxp/soc-lx2160a/lx2160acex7/platform_def.h b/plat/nxp/soc-lx2160a/lx2160acex7/platform_def.h
+new file mode 100644
+index 000000000..666099800
+--- /dev/null
++++ b/plat/nxp/soc-lx2160a/lx2160acex7/platform_def.h
+@@ -0,0 +1,14 @@
++/*
++ * Copyright 2021 NXP
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef PLATFORM_DEF_H
++#define PLATFORM_DEF_H
++
++#include "plat_def.h"
++#include "plat_default_def.h"
++
++#endif
+diff --git a/plat/nxp/soc-lx2160a/lx2160acex7/policy.h b/plat/nxp/soc-lx2160a/lx2160acex7/policy.h
+new file mode 100644
+index 000000000..19ad6dbec
+--- /dev/null
++++ b/plat/nxp/soc-lx2160a/lx2160acex7/policy.h
+@@ -0,0 +1,38 @@
++/*
++ * Copyright 2021 NXP
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef POLICY_H
++#define	POLICY_H
++
++/* Following defines affect the PLATFORM SECURITY POLICY */
++
++/* set this to 0x0 if the platform is not using/responding to ECC errors
++ * set this to 0x1 if ECC is being used (we have to do some init)
++ */
++#define  POLICY_USING_ECC 0x0
++
++/* Set this to 0x0 to leave the default SMMU page size in sACR
++ * Set this to 0x1 to change the SMMU page size to 64K
++ */
++#define POLICY_SMMU_PAGESZ_64K 0x1
++
++/*
++ * POLICY_PERF_WRIOP = 0 : No Performance enhancement for WRIOP RN-I
++ * POLICY_PERF_WRIOP = 1 : No Performance enhancement for WRIOP RN-I = 7
++ * POLICY_PERF_WRIOP = 2 : No Performance enhancement for WRIOP RN-I = 23
++ */
++#define POLICY_PERF_WRIOP 0
++
++/*
++ * set this to '1' if the debug clocks need to remain enabled during
++ * system entry to low-power (LPM20) - this should only be necessary
++ * for testing and NEVER set for normal production
++ */
++#define POLICY_DEBUG_ENABLE 0
++
++
++#endif /* POLICY_H */
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0007-lx2160a-support-flexible-value-for-CONFIG_DDR_NODIMM.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0007-lx2160a-support-flexible-value-for-CONFIG_DDR_NODIMM.patch
new file mode 100644
index 000000000000..f38c770eaf67
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0007-lx2160a-support-flexible-value-for-CONFIG_DDR_NODIMM.patch
@@ -0,0 +1,33 @@
+From 92d0a6fab056eb43fa5561fb1888c8c393ebee29 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Fri, 18 Oct 2024 21:17:12 +0200
+Subject: [PATCH 7/8] lx2160a: support flexible value for CONFIG_DDR_NODIMM
+
+Add support for values other than 0 and 1 for CONFIG_DDR_NODIMM.
+This macro can be used for both enabling, and selecting a specific
+memory configuration at compile-time.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ plat/nxp/common/plat_make_helper/plat_common_def.mk | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/plat/nxp/common/plat_make_helper/plat_common_def.mk b/plat/nxp/common/plat_make_helper/plat_common_def.mk
+index a1038a073..ed6e0bdac 100644
+--- a/plat/nxp/common/plat_make_helper/plat_common_def.mk
++++ b/plat/nxp/common/plat_make_helper/plat_common_def.mk
+@@ -39,8 +39,9 @@ ifneq (${NUM_OF_DDRC},)
+ $(eval $(call add_define_val,NUM_OF_DDRC,${NUM_OF_DDRC}))
+ endif
+ 
+-ifeq (${CONFIG_DDR_NODIMM},1)
+-$(eval $(call add_define,CONFIG_DDR_NODIMM))
++CONFIG_DDR_NODIMM ?= 0
++ifneq (${CONFIG_DDR_NODIMM},0)
++$(eval $(call add_define_val,CONFIG_DDR_NODIMM,${CONFIG_DDR_NODIMM}))
+ DDRC_NUM_DIMM := 1
+ endif
+ 
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0008-add-separate-platform-for-solidrun-internal-cex6-eva.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0008-add-separate-platform-for-solidrun-internal-cex6-eva.patch
new file mode 100644
index 000000000000..0a499e669c33
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0008-add-separate-platform-for-solidrun-internal-cex6-eva.patch
@@ -0,0 +1,544 @@
+From 067c11cd6a6de8c7480b1f8c1002f29a9bc85787 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Fri, 18 Oct 2024 15:05:13 +0200
+Subject: [PATCH 8/8] add separate platform for solidrun internal cex6
+ evaluation board
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ plat/nxp/soc-lx2160a/lx2160acex6/ddr_init.c   | 236 ++++++++++++++++++
+ plat/nxp/soc-lx2160a/lx2160acex6/plat_def.h   | 105 ++++++++
+ plat/nxp/soc-lx2160a/lx2160acex6/platform.c   |  29 +++
+ plat/nxp/soc-lx2160a/lx2160acex6/platform.mk  |  61 +++++
+ .../soc-lx2160a/lx2160acex6/platform_def.h    |  14 ++
+ plat/nxp/soc-lx2160a/lx2160acex6/policy.h     |  38 +++
+ 6 files changed, 483 insertions(+)
+ create mode 100644 plat/nxp/soc-lx2160a/lx2160acex6/ddr_init.c
+ create mode 100644 plat/nxp/soc-lx2160a/lx2160acex6/plat_def.h
+ create mode 100644 plat/nxp/soc-lx2160a/lx2160acex6/platform.c
+ create mode 100644 plat/nxp/soc-lx2160a/lx2160acex6/platform.mk
+ create mode 100644 plat/nxp/soc-lx2160a/lx2160acex6/platform_def.h
+ create mode 100644 plat/nxp/soc-lx2160a/lx2160acex6/policy.h
+
+diff --git a/plat/nxp/soc-lx2160a/lx2160acex6/ddr_init.c b/plat/nxp/soc-lx2160a/lx2160acex6/ddr_init.c
+new file mode 100644
+index 000000000..0b978e298
+--- /dev/null
++++ b/plat/nxp/soc-lx2160a/lx2160acex6/ddr_init.c
+@@ -0,0 +1,236 @@
++/*
++ * Copyright 2021 NXP
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#include <assert.h>
++#include <errno.h>
++#include <stdbool.h>
++#include <stdint.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++
++#include <common/debug.h>
++#include <ddr.h>
++#include <lib/utils.h>
++#include <load_img.h>
++
++#include "plat_common.h"
++#include <platform_def.h>
++
++#ifdef CONFIG_STATIC_DDR
++#error not implemented
++#elif defined(CONFIG_DDR_NODIMM)
++#if CONFIG_DDR_NODIMM == 1
++/*
++ * PCB Revision 1.0: 9 x K4A8G085WC-BCWE TODO
++ */
++#error Not implemented.
++#endif /* CONFIG_DDR_NODIMM == 1 */
++
++#if CONFIG_DDR_NODIMM == 2
++/*
++ * PCB Revision 1.1: 2 x 5 x K4A8G165WB-BCRC
++ *
++ * ECC disabled because of training failures.
++ */
++#define CONFIG_DDR_NODIMM_CH2
++static const struct dimm_params static_dimm = {
++	.mpart = "Fixed DDR Config 2",
++	.n_ranks = 1,
++	.die_density = 0x6, // encoded per spd byte 4, 0b110 = 16Gbit
++	.rank_density = 0x200000000, // 16GB
++	.capacity = 0x200000000, // 16GB
++	.primary_sdram_width = 64,
++	.ec_sdram_width = 0, // no ecc extension
++	.rdimm = 0,
++	.package_3ds = 0,
++	.device_width = 16, // 16 bit per sdram
++	.rc = 0,
++
++	.n_row_addr = 17,
++	.n_col_addr = 10,
++	.edc_config = 0, // disable ecc
++	.bank_addr_bits = 0, // 4 banks
++	.bank_group_bits = 1, // 2 bank groups
++	.burst_lengths_bitmask = 0xc, // enable 4 & 8-bit burst (DDR4 spec)
++
++	.mirrored_dimm = 0,
++
++	// timings based on K4A8G085WC-BCTD (DDR4-2666), missing values for 3200
++	.mtb_ps = 125, // MTB per SPD spec
++	.ftb_10th_ps = 10, // default value, unused by nxp ddr driver
++	.taa_ps = 13750, // min. 13.75ns
++	.tfaw_ps = 30000, // min: max(30ns or 28CK) (this 16Gbit sdram has 2KB pages)
++
++	.tckmin_x_ps = 625, // 3200 (CK=1600)
++	.tckmax_ps = 1250, // 1600 (CK=800)
++
++	.caslat_x = 0b00000001010101010101010000000000, // CL = [10,12,14,16,18,20,22,24] (1 << CL)
++
++	.trcd_ps = 13750, // 13.75ns - CL22-22-22
++	.trp_ps = 13750, // 13.75ns - CL22-22-22
++	.tras_ps = 32000, // 32ns
++
++	.trfc1_ps = 350000, // 350ns,
++	.trfc2_ps = 260000, // 260ns
++	.trfc4_ps = 160000, // 160ns
++	.trrds_ps = 5300, // min: max(4CK or 5.3ns)
++	.trrdl_ps = 6400, // min: max(4CK or 6.4ns)
++	.tccdl_ps = 5000, // min: max(4CK or 5ns)
++	.trfc_slr_ps = 0,
++
++	.trc_ps = 45750, // tras + trp 45.75ns
++	.twr_ps = 15000, // 15ns
++
++	.refresh_rate_ps = 7800000, // 1x mode 7.8us for standard temperature range (TODO: pick correct range based on temperature?!)
++	// .extended_op_srt = 0,
++
++	// .rcw = {}, // only for registered dimm
++	.dq_mapping = {
++		0x00,
++		0x20,
++		0x00,
++		0x20,
++		0x00,
++		0x20,
++		0x00,
++		0x20,
++		0x00,
++		0x00,
++		0x00,
++		0x20,
++		0x00,
++		0x20,
++		0x00,
++		0x20,
++		0x00,
++		0x20,
++	},
++	.dq_mapping_ors = 1,
++};
++#endif /* CONFIG_DDR_NODIMM == 2 */
++
++int ddr_get_ddr_params(struct dimm_params *pdimm,
++			    struct ddr_conf *conf)
++{
++	// channel 1
++	conf->dimm_in_use[0] = 1;
++	memcpy(&pdimm[0], &static_dimm, sizeof(struct dimm_params));
++
++#if defined(CONFIG_DDR_NODIMM_CH2)
++	// channel 2
++	conf->dimm_in_use[1] = 1; // enable (module on) channel 2
++	memcpy(&pdimm[1], &static_dimm, sizeof(struct dimm_params));
++
++	/* 2 modules */
++	return 0x3;
++#else
++	/* 1 module */
++	return 0x1;
++#endif /* defined(CONFIG_DDR_NODIMM_CH2) */
++}
++#endif /* defined(CONFIG_DDR_NODIMM) */
++
++int ddr_board_options(struct ddr_info *priv)
++{
++	struct memctl_opt *popts = &priv->opt;
++	const struct ddr_conf *conf = &priv->conf;
++
++	popts->vref_dimm = U(0x24);		/* range 1, 83.4% */
++	popts->rtt_override = 0;
++	popts->rtt_park = U(240);
++	popts->otf_burst_chop_en = 0;
++	popts->burst_length = U(DDR_BL8);
++	popts->trwt_override = U(0);
++	popts->bstopre = U(0);			/* auto precharge */
++	popts->addr_hash = 1;
++	popts->caslat_override = 0; // TODO: why is this set by default?!
++	popts->caslat_override_value = 0; // TODO: why is this set by default?!
++	popts->auto_self_refresh_en = 1;
++	popts->output_driver_impedance = 0; // 34 Ohm
++	popts->twot_en = 0;
++	popts->threet_en = 0;
++	popts->addt_lat_override = 0; // TODO: why is this set by default?!
++	popts->addt_lat_override_value = 0; // TODO: why is this set by default?!
++	popts->phy_atx_impedance = 30;
++	popts->skip2d = 0;
++
++	/* Set ODT impedance on PHY side */
++	switch (conf->cs_on_dimm[1]) {
++	case 0xc:	/* Two slots dual rank */
++	case 0x4:	/* Two slots single rank, not valid for interleaving */
++		popts->trwt = U(0xf);
++		popts->twrt = U(0x7);
++		popts->trrt = U(0x7);
++		popts->twwt = U(0x7);
++		popts->vref_phy = U(0x6B);	/* 83.6% */
++		popts->odt = U(60);
++		popts->phy_tx_impedance = U(28);
++		break;
++	case 0:		/* One slot used */
++	default:
++		popts->trwt = U(0x3);
++		popts->twrt = U(0x3);
++		popts->trrt = U(0x3);
++		popts->twwt = U(0x3);
++		popts->vref_phy = U(0x60);	/* 75% */
++		popts->odt = U(48);
++		popts->phy_tx_impedance = U(28);
++		break;
++	}
++
++	return 0;
++}
++
++long long init_ddr(void)
++{
++	int spd_addr[] = { 0x51, 0x52, 0x53, 0x54 };
++	struct ddr_info info;
++	struct sysinfo sys;
++	long long dram_size;
++
++	zeromem(&sys, sizeof(sys));
++	if (get_clocks(&sys) != 0) {
++		ERROR("System clocks are not set\n");
++		panic();
++	}
++	debug("platform clock %lu\n", sys.freq_platform);
++	debug("DDR PLL1 %lu\n", sys.freq_ddr_pll0);
++	debug("DDR PLL2 %lu\n", sys.freq_ddr_pll1);
++
++	zeromem(&info, sizeof(info));
++
++	/* Set two DDRC. Unused DDRC will be removed automatically. */
++	info.num_ctlrs = NUM_OF_DDRC;
++	info.spd_addr = spd_addr;
++	info.ddr[0] = (void *)NXP_DDR_ADDR;
++	info.ddr[1] = (void *)NXP_DDR2_ADDR;
++	info.phy[0] = (void *)NXP_DDR_PHY1_ADDR;
++	info.phy[1] = (void *)NXP_DDR_PHY2_ADDR;
++	info.clk = get_ddr_freq(&sys, 0);
++	info.img_loadr = load_img;
++	info.phy_gen2_fw_img_buf = PHY_GEN2_FW_IMAGE_BUFFER;
++	if (info.clk == 0) {
++		info.clk = get_ddr_freq(&sys, 1);
++	}
++	info.dimm_on_ctlr = DDRC_NUM_DIMM;
++
++	info.warm_boot_flag = DDR_WRM_BOOT_NT_SUPPORTED;
++
++	dram_size = dram_init(&info
++#if defined(NXP_HAS_CCN504) || defined(NXP_HAS_CCN508)
++		    , NXP_CCN_HN_F_0_ADDR
++#endif
++		    );
++
++
++	if (dram_size < 0) {
++		ERROR("DDR init failed.\n");
++	}
++
++	return dram_size;
++}
+diff --git a/plat/nxp/soc-lx2160a/lx2160acex6/plat_def.h b/plat/nxp/soc-lx2160a/lx2160acex6/plat_def.h
+new file mode 100644
+index 000000000..02f51e74d
+--- /dev/null
++++ b/plat/nxp/soc-lx2160a/lx2160acex6/plat_def.h
+@@ -0,0 +1,105 @@
++/*
++ * Copyright 2021 NXP
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef PLAT_DEF_H
++#define PLAT_DEF_H
++
++#include <arch.h>
++#include <cortex_a72.h>
++/* Required without TBBR.
++ * To include the defines for DDR PHY
++ * Images.
++ */
++#include <tbbr_img_def.h>
++
++#include <policy.h>
++#include <soc.h>
++
++#if defined(IMAGE_BL31)
++#define LS_SYS_TIMCTL_BASE		0x2890000
++#define PLAT_LS_NSTIMER_FRAME_ID	0
++#define LS_CONFIG_CNTACR		1
++#endif
++
++#define NXP_SYSCLK_FREQ		100000000
++#define NXP_DDRCLK_FREQ		100000000
++
++/* UART related definition */
++#define NXP_CONSOLE_ADDR	NXP_UART_ADDR
++#define NXP_CONSOLE_BAUDRATE	115200
++
++/* Size of cacheable stacks */
++#if defined(IMAGE_BL2)
++#if defined(TRUSTED_BOARD_BOOT)
++#define PLATFORM_STACK_SIZE	0x2000
++#else
++#define PLATFORM_STACK_SIZE	0x1000
++#endif
++#elif defined(IMAGE_BL31)
++#define PLATFORM_STACK_SIZE	0x1000
++#endif
++
++/* SD block buffer */
++#define NXP_SD_BLOCK_BUF_SIZE	(0x8000)
++#define NXP_SD_BLOCK_BUF_ADDR	(NXP_OCRAM_ADDR + NXP_OCRAM_SIZE \
++				- NXP_SD_BLOCK_BUF_SIZE)
++
++#ifdef SD_BOOT
++#define BL2_LIMIT		(NXP_OCRAM_ADDR + NXP_OCRAM_SIZE \
++				- NXP_SD_BLOCK_BUF_SIZE)
++#else
++#define BL2_LIMIT		(NXP_OCRAM_ADDR + NXP_OCRAM_SIZE)
++#endif
++
++/* IO defines as needed by IO driver framework */
++#define MAX_IO_DEVICES		4
++#define MAX_IO_BLOCK_DEVICES	1
++#define MAX_IO_HANDLES		4
++
++#define PHY_GEN2_FW_IMAGE_BUFFER	(NXP_OCRAM_ADDR + CSF_HDR_SZ)
++
++/*
++ * FIP image defines - Offset at which FIP Image would be present
++ * Image would include Bl31 , Bl33 and Bl32 (optional)
++ */
++#ifdef POLICY_FUSE_PROVISION
++#define MAX_FIP_DEVICES		3
++#endif
++
++#ifndef MAX_FIP_DEVICES
++#define MAX_FIP_DEVICES		2
++#endif
++
++/*
++ * ID of the secure physical generic timer interrupt used by the BL32.
++ */
++#define BL32_IRQ_SEC_PHY_TIMER	29
++
++#define BL31_WDOG_SEC		89
++
++#define BL31_NS_WDOG_WS1	108
++
++/*
++ * Define properties of Group 1 Secure and Group 0 interrupts as per GICv3
++ * terminology. On a GICv2 system or mode, the lists will be merged and treated
++ * as Group 0 interrupts.
++ */
++#define PLAT_LS_G1S_IRQ_PROPS(grp) \
++	INTR_PROP_DESC(BL32_IRQ_SEC_PHY_TIMER, GIC_HIGHEST_SEC_PRIORITY, grp, \
++			GIC_INTR_CFG_EDGE)
++
++/* SGI 15 and Secure watchdog interrupts assigned to Group 0 */
++#define NXP_IRQ_SEC_SGI_7		15
++
++#define PLAT_LS_G0_IRQ_PROPS(grp)	\
++	INTR_PROP_DESC(BL31_WDOG_SEC, GIC_HIGHEST_SEC_PRIORITY, grp, \
++			GIC_INTR_CFG_EDGE), \
++	INTR_PROP_DESC(BL31_NS_WDOG_WS1, GIC_HIGHEST_SEC_PRIORITY, grp, \
++			GIC_INTR_CFG_EDGE), \
++	INTR_PROP_DESC(NXP_IRQ_SEC_SGI_7, GIC_HIGHEST_SEC_PRIORITY, grp, \
++			GIC_INTR_CFG_LEVEL)
++#endif
+diff --git a/plat/nxp/soc-lx2160a/lx2160acex6/platform.c b/plat/nxp/soc-lx2160a/lx2160acex6/platform.c
+new file mode 100644
+index 000000000..b00adb51d
+--- /dev/null
++++ b/plat/nxp/soc-lx2160a/lx2160acex6/platform.c
+@@ -0,0 +1,29 @@
++/*
++ * Copyright 2021 NXP
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#include <plat_common.h>
++
++#pragma weak board_enable_povdd
++#pragma weak board_disable_povdd
++
++bool board_enable_povdd(void)
++{
++#ifdef CONFIG_POVDD_ENABLE
++	return true;
++#else
++	return false;
++#endif
++}
++
++bool board_disable_povdd(void)
++{
++#ifdef CONFIG_POVDD_ENABLE
++	return true;
++#else
++	return false;
++#endif
++}
+diff --git a/plat/nxp/soc-lx2160a/lx2160acex6/platform.mk b/plat/nxp/soc-lx2160a/lx2160acex6/platform.mk
+new file mode 100644
+index 000000000..1165cfa09
+--- /dev/null
++++ b/plat/nxp/soc-lx2160a/lx2160acex6/platform.mk
+@@ -0,0 +1,61 @@
++#
++# Copyright 2021 NXP
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++
++# board-specific build parameters
++
++BOOT_MODE	?= 	flexspi_nor
++BOARD		?=	lx2160acex6
++POVDD_ENABLE	:=	no
++NXP_COINED_BB	:=	no
++
++ # DDR Compilation Configs
++NUM_OF_DDRC	:=	2
++DDRC_NUM_DIMM	:=	2
++DDRC_NUM_CS	:=	4
++DDR_ECC_EN	:=	yes
++ #enable address decoding feature
++DDR_ADDR_DEC	:=	yes
++APPLY_MAX_CDD	:=	yes
++
++# Mock SPD:
++# - 0: disable mock spd
++# - 2: 2 x 5 x K4A8G165WB-BCRC PCB v1.1
++CONFIG_DDR_NODIMM	:=	0
++
++# S5 GPIO
++LX2160A_S5_GPIO_ADDR := NXP_GPIO3_ADDR
++LX2160A_S5_GPIO := 0
++
++# DDR Errata
++ERRATA_DDR_A011396	:= 1
++ERRATA_DDR_A050450	:= 1
++
++ # On-Board Flash Details
++FLASH_TYPE	:=	MT35XU512A
++XSPI_FLASH_SZ	:=	0x10000000
++NXP_XSPI_NOR_UNIT_SIZE		:=	0x20000
++BL2_BIN_XSPI_NOR_END_ADDRESS	:=	0x100000
++# CONFIG_FSPI_ERASE_4K is required to erase 4K sector sizes. This
++# config is enabled for future use cases.
++FSPI_ERASE_4K	:= 0
++
++ # Platform specific features.
++WARM_BOOT	:=	no
++
++ # Adding Platform files build files
++BL2_SOURCES	+=	${BOARD_PATH}/ddr_init.c\
++			${BOARD_PATH}/platform.c
++
++SUPPORTED_BOOT_MODE	:=	flexspi_nor	\
++				sd		\
++				emmc		\
++				auto
++
++# Adding platform board build info
++include plat/nxp/common/plat_make_helper/plat_common_def.mk
++
++ # Adding SoC build info
++include plat/nxp/soc-lx2160a/soc.mk
+diff --git a/plat/nxp/soc-lx2160a/lx2160acex6/platform_def.h b/plat/nxp/soc-lx2160a/lx2160acex6/platform_def.h
+new file mode 100644
+index 000000000..666099800
+--- /dev/null
++++ b/plat/nxp/soc-lx2160a/lx2160acex6/platform_def.h
+@@ -0,0 +1,14 @@
++/*
++ * Copyright 2021 NXP
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef PLATFORM_DEF_H
++#define PLATFORM_DEF_H
++
++#include "plat_def.h"
++#include "plat_default_def.h"
++
++#endif
+diff --git a/plat/nxp/soc-lx2160a/lx2160acex6/policy.h b/plat/nxp/soc-lx2160a/lx2160acex6/policy.h
+new file mode 100644
+index 000000000..19ad6dbec
+--- /dev/null
++++ b/plat/nxp/soc-lx2160a/lx2160acex6/policy.h
+@@ -0,0 +1,38 @@
++/*
++ * Copyright 2021 NXP
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef POLICY_H
++#define	POLICY_H
++
++/* Following defines affect the PLATFORM SECURITY POLICY */
++
++/* set this to 0x0 if the platform is not using/responding to ECC errors
++ * set this to 0x1 if ECC is being used (we have to do some init)
++ */
++#define  POLICY_USING_ECC 0x0
++
++/* Set this to 0x0 to leave the default SMMU page size in sACR
++ * Set this to 0x1 to change the SMMU page size to 64K
++ */
++#define POLICY_SMMU_PAGESZ_64K 0x1
++
++/*
++ * POLICY_PERF_WRIOP = 0 : No Performance enhancement for WRIOP RN-I
++ * POLICY_PERF_WRIOP = 1 : No Performance enhancement for WRIOP RN-I = 7
++ * POLICY_PERF_WRIOP = 2 : No Performance enhancement for WRIOP RN-I = 23
++ */
++#define POLICY_PERF_WRIOP 0
++
++/*
++ * set this to '1' if the debug clocks need to remain enabled during
++ * system entry to low-power (LPM20) - this should only be necessary
++ * for testing and NEVER set for normal production
++ */
++#define POLICY_DEBUG_ENABLE 0
++
++
++#endif /* POLICY_H */
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0009-lx2160a-support-flushing-i2c-bus-before-ddr-init.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0009-lx2160a-support-flushing-i2c-bus-before-ddr-init.patch
new file mode 100644
index 000000000000..4c0b23822764
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0009-lx2160a-support-flushing-i2c-bus-before-ddr-init.patch
@@ -0,0 +1,365 @@
+From efa6cca1a194050caa37a16ddccbf5d6e568b42f Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Fri, 25 Oct 2024 15:36:57 +0200
+Subject: [PATCH 09/11] lx2160a: support flushing i2c bus before ddr init
+
+The i2c bus can get locked by a slave device holding sda low, when the
+cpu is reset during a transaction.
+Implement workaround according to LX2160A Chip Errata 07/2020 A-010650.
+
+The workaround is inactive by default and must be explicitly enabled
+through a board platform.mk file defining buses and muxes to flush:
+
+LX2160_FLUSH_IIC: 1D array, takes comma separate uint8 indicating
+human-readable i2c bus number,
+e.g: IIC1 & IIC2 = "1, 2".
+
+LX2160_FLUSH_IIC_MUX: 2D array, takes comma-separated 1D array
+initializer expressions with i2c bus number, mux address on the bus and
+a bitmask for channels to flush,
+e.g. IIC1 mux @ 77, channels 1&2 = "{1, 0x77, 0x03}".
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ plat/nxp/common/setup/common.mk             |   1 +
+ plat/nxp/common/setup/include/plat_common.h |   2 +
+ plat/nxp/common/setup/ls_bl2_el3_setup.c    |   1 +
+ plat/nxp/common/setup/ls_i2c_init.c         | 274 ++++++++++++++++++++
+ plat/nxp/soc-lx2160a/soc.mk                 |   6 +
+ 5 files changed, 284 insertions(+)
+ create mode 100644 plat/nxp/common/setup/ls_i2c_init.c
+
+diff --git a/plat/nxp/common/setup/common.mk b/plat/nxp/common/setup/common.mk
+index 1fcf1d093..6333ec515 100644
+--- a/plat/nxp/common/setup/common.mk
++++ b/plat/nxp/common/setup/common.mk
+@@ -80,6 +80,7 @@ BL2_SOURCES		+=	drivers/io/io_fip.c			\
+ 				plat/nxp/common/setup/ls_image_load.c		\
+ 				plat/nxp/common/setup/ls_io_storage.c		\
+ 				plat/nxp/common/setup/ls_bl2_el3_setup.c	\
++				plat/nxp/common/setup/ls_i2c_init.c		\
+ 				plat/nxp/common/setup/${ARCH}/ls_bl2_mem_params_desc.c
+ 
+ BL31_SOURCES		+=	plat/nxp/common/setup/ls_bl31_setup.c	\
+diff --git a/plat/nxp/common/setup/include/plat_common.h b/plat/nxp/common/setup/include/plat_common.h
+index 45832fa68..1c850ebe2 100644
+--- a/plat/nxp/common/setup/include/plat_common.h
++++ b/plat/nxp/common/setup/include/plat_common.h
+@@ -77,6 +77,8 @@ int open_backend(const uintptr_t spec);
+ void ls_bl2_plat_arch_setup(void);
+ void ls_bl2_el3_plat_arch_setup(void);
+ 
++void bl2_i2c_init(void);
++
+ enum boot_device {
+ 	BOOT_DEVICE_IFC_NOR,
+ 	BOOT_DEVICE_IFC_NAND,
+diff --git a/plat/nxp/common/setup/ls_bl2_el3_setup.c b/plat/nxp/common/setup/ls_bl2_el3_setup.c
+index a4cbaef45..63e3460d7 100644
+--- a/plat/nxp/common/setup/ls_bl2_el3_setup.c
++++ b/plat/nxp/common/setup/ls_bl2_el3_setup.c
+@@ -276,6 +276,7 @@ void bl2_el3_plat_prepare_exit(void)
+  */
+ void bl2_plat_preload_setup(void)
+ {
++	bl2_i2c_init();
+ 
+ 	soc_preload_setup();
+ 
+diff --git a/plat/nxp/common/setup/ls_i2c_init.c b/plat/nxp/common/setup/ls_i2c_init.c
+new file mode 100644
+index 000000000..5392b160d
+--- /dev/null
++++ b/plat/nxp/common/setup/ls_i2c_init.c
+@@ -0,0 +1,274 @@
++#include <stdint.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++
++#include <common/debug.h>
++#include <drivers/delay_timer.h>
++#include <i2c.h>
++#include <soc.h>
++
++#define NXP_IIC1_ADDR	0x02000000
++#define NXP_IIC2_ADDR	0x02010000
++#define NXP_IIC3_ADDR	0x02020000
++#define NXP_IIC4_ADDR	0x02030000
++#define NXP_IIC5_ADDR	0x02040000
++#define NXP_IIC6_ADDR	0x02050000
++#define NXP_IIC7_ADDR	0x02060000
++#define NXP_IIC8_ADDR	0x02070000
++
++#define RCWSR12				0x01e0012c
++#define RCWSR12_IIC2_PMUX_MASK		0x00000007 /* [0..2] */
++#define RCWSR12_IIC2_PMUX_IIC2		0x00000000
++#define RCWSR12_IIC2_PMUX_GPIO		0x00000001
++#define RCWSR12_IIC3_PMUX_MASK		0x00000038 /* [3..5] */
++#define RCWSR12_IIC3_PMUX_IIC3		0x00000000
++#define RCWSR12_IIC3_PMUX_GPIO		0x00000008
++#define RCWSR12_IIC4_PMUX_MASK		0x000001c0 /* [6..8] */
++#define RCWSR12_IIC4_PMUX_IIC4		0x00000000
++#define RCWSR12_IIC4_PMUX_GPIO		0x00000040
++#define RCWSR12_IIC5_PMUX_MASK		0x00000e00 /* [9..11] */
++#define RCWSR12_IIC5_PMUX_IIC5		0x00000000
++#define RCWSR12_IIC5_PMUX_GPIO		0x00000200
++#define RCWSR12_IIC6_PMUX_MASK		0x00007000 /* [12..14] */
++#define RCWSR12_IIC6_PMUX_IIC6		0x00000000
++#define RCWSR12_IIC6_PMUX_GPIO		0x00001000
++#define RCWSR13				0x01e00130
++#define RCWSR12_SDHC2_DAT74_PMUX_MASK	0x00000003
++#define RCWSR12_SDHC2_DAT74_PMUX_SDHC2	0x00000000
++#define RCWSR12_SDHC2_DAT74_PMUX_IIC78	0x00000001
++#define RCWSR14				0x01e00134
++#define RCWSR14_IIC1_PMUX_MASK		0x00000400 /* [10] */
++#define RCWSR14_IIC1_PMUX_IIC1		0x00000000
++#define RCWSR14_IIC1_PMUX_GPIO		0x00000400
++
++static void ls_i2c_flush_pca9547(uint8_t busno, const char *busname, uint8_t address, uint8_t channels);
++static void ls_i2c_flush(uint8_t busno, const char *busname);
++
++/**
++ * Flush i2c buses to make slave devices release sda,
++ * in case the system was reset during a transaction.
++ */
++void bl2_i2c_init() {
++	const uint8_t bus_flush_list[] = {CONFIG_LX2160_FLUSH_IIC};
++	/*
++	 * List of muxes and channels to flush. Takes 2D array:
++	 * {<bus number>, <mux chip address>, <channel bitmask>},
++	 */
++	const uint8_t mux_flush_list[][3] = {CONFIG_LX2160_FLUSH_IIC_MUX};
++	const uintptr_t iic_base_addr[] = {
++		NXP_IIC1_ADDR,
++		NXP_IIC2_ADDR,
++		NXP_IIC3_ADDR,
++		NXP_IIC4_ADDR,
++		NXP_IIC5_ADDR,
++		NXP_IIC6_ADDR,
++	};
++	const char *iic_name[] = {
++		"IIC1",
++		"IIC2",
++		"IIC3",
++		"IIC4",
++		"IIC5",
++		"IIC6",
++	};
++	int i;
++	uint8_t busno;
++	uint8_t address;
++	uint8_t channels;
++
++	/* flush i2c buses */
++	for (i = 0; i < ARRAY_SIZE(bus_flush_list); i++) {
++		busno = bus_flush_list[i] - 1;
++		i2c_init(iic_base_addr[busno]);
++		ls_i2c_flush(busno, iic_name[busno]);
++	}
++
++	/* flush muxes channels */
++	for (i = 0; i < ARRAY_SIZE(mux_flush_list); i++) {
++		busno = mux_flush_list[i][0] - 1;
++		address = mux_flush_list[i][1];
++		channels = mux_flush_list[i][2];
++		i2c_init(iic_base_addr[busno]);
++		ls_i2c_flush_pca9547(busno, iic_name[busno], address, channels);
++	}
++}
++
++static void ls_i2c_flush_pca9547(uint8_t busno, const char *busname, uint8_t chip, uint8_t channels) {
++	uint8_t channel, creg = 0;
++	char buffer[64];
++	int ret;
++
++	/* try read configuration register */
++	ret = i2c_read(chip, 0x00, 1, &creg, 1);
++	if(ret != 0) {
++		/* no device responding at address, skip */
++		return;
++	}
++
++	/* after reset configuration register reads 0x08 */
++	if(creg != 0x08) {
++		/* probably not a pca9547, skip */
++		return;
++	}
++
++	/* flush selected channels */
++	for(uint8_t i = 8; i > 0; i--) {
++		if (!(channels & (1 << (i-1))))
++			continue;
++
++		/* select channel i */
++		channel = 0x08 | (i-1);
++		i2c_write(chip, 0x00, 1, &channel, 1);
++
++		/* flush channel */
++		snprintf(buffer, sizeof(buffer), "%s mux@%02x channel %u", busname, chip, i-1);
++		ls_i2c_flush(busno, buffer);
++	}
++}
++
++static struct i2c_bus_info {
++	uintptr_t pinmux_addr;
++	uint32_t pinmux_mask;
++	uint32_t pinmux_sel;
++	uintptr_t gpio_addr;
++	uint8_t gpio_scl;
++	uint8_t gpio_sda;
++} ls_i2c_bus_info[] = {
++	{
++		.pinmux_addr = RCWSR14,
++		.pinmux_mask = RCWSR14_IIC1_PMUX_MASK,
++		.pinmux_sel = RCWSR14_IIC1_PMUX_GPIO,
++		.gpio_addr = NXP_GPIO1_ADDR,
++		.gpio_scl = 3, /* GPIO1_DAT03 */
++		.gpio_sda = 2, /* GPIO1_DAT02 */
++	},
++	{
++		.pinmux_addr = RCWSR12,
++		.pinmux_mask = RCWSR12_IIC2_PMUX_MASK,
++		.pinmux_sel = RCWSR12_IIC2_PMUX_GPIO,
++		.gpio_addr = NXP_GPIO1_ADDR,
++		.gpio_scl = 31, /* GPIO1_DAT31 */
++		.gpio_sda = 30, /* GPIO1_DAT30 */
++	},
++	{
++		.pinmux_addr = RCWSR12,
++		.pinmux_mask = RCWSR12_IIC3_PMUX_MASK,
++		.pinmux_sel = RCWSR12_IIC3_PMUX_GPIO,
++		.gpio_addr = NXP_GPIO1_ADDR,
++		.gpio_scl = 29, /* GPIO1_DAT29 */
++		.gpio_sda = 28, /* GPIO1_DAT28 */
++	},
++	{
++		.pinmux_addr = RCWSR12,
++		.pinmux_mask = RCWSR12_IIC4_PMUX_MASK,
++		.pinmux_sel = RCWSR12_IIC4_PMUX_GPIO,
++		.gpio_addr = NXP_GPIO1_ADDR,
++		.gpio_scl = 27, /* GPIO1_DAT27 */
++		.gpio_sda = 26, /* GPIO1_DAT26 */
++	},
++	{
++		.pinmux_addr = RCWSR12,
++		.pinmux_mask = RCWSR12_IIC5_PMUX_MASK,
++		.pinmux_sel = RCWSR12_IIC5_PMUX_GPIO,
++		.gpio_addr = NXP_GPIO1_ADDR,
++		.gpio_scl = 25, /* GPIO1_DAT25 */
++		.gpio_sda = 24, /* GPIO1_DAT24 */
++	},
++	{
++		.pinmux_addr = RCWSR12,
++		.pinmux_mask = RCWSR12_IIC6_PMUX_MASK,
++		.pinmux_sel = RCWSR12_IIC6_PMUX_GPIO,
++		.gpio_addr = NXP_GPIO1_ADDR,
++		.gpio_scl = 23, /* GPIO1_DAT23 */
++		.gpio_sda = 22, /* GPIO1_DAT22 */
++	},
++	{
++		.pinmux_addr = RCWSR13,
++		.pinmux_mask = RCWSR12_SDHC2_DAT74_PMUX_MASK,
++		.pinmux_sel = RCWSR12_SDHC2_DAT74_PMUX_IIC78,
++		.gpio_addr = NXP_GPIO2_ADDR,
++		.gpio_scl = 16, /* GPIO2_DAT16 */
++		.gpio_sda = 15, /* GPIO2_DAT15 */
++	},
++	{
++		.pinmux_addr = RCWSR13,
++		.pinmux_mask = RCWSR12_SDHC2_DAT74_PMUX_MASK,
++		.pinmux_sel = RCWSR12_SDHC2_DAT74_PMUX_IIC78,
++		.gpio_addr = NXP_GPIO2_ADDR,
++		.gpio_scl = 18, /* GPIO2_DAT18 */
++		.gpio_sda = 17, /* GPIO2_DAT17 */
++	},
++};
++
++/*
++ * Flush the i2c bus through any muxes with 9 clock cycles
++ * to ensure all slave devices release their locks on SDA.
++ * This is a work-around for i2c slave devices locking SDA,
++ * when the system has been reset during a transaction.
++ *
++ * The implementation is inspired by LX2160A Chip Errata 07/2020 A-010650.
++ */
++static void ls_i2c_flush(uint8_t busno, const char *busname) {
++	struct i2c_bus_info *info;
++	uintptr_t gpdir_addr, gpodr_addr, gpdat_addr;
++	uint32_t pinmux, gpdir, gpodr, gpdat;
++	struct {
++		uint32_t pinmux, gpdir, gpodr, gpdat;
++	} backup;
++	uint32_t scl_mask, sda_mask;
++
++	if(busno >= 8) {
++		ERROR("failed to flush i2c bus %u %s: invalid bus number!\n", busno, busname);
++		return;
++	}
++	/* load i2c bus specific information */
++	info = &ls_i2c_bus_info[busno];
++	gpdir_addr = info->gpio_addr + 0x0;
++	gpodr_addr = info->gpio_addr + 0x4;
++	gpdat_addr = info->gpio_addr + 0x8;
++	scl_mask = 0x80000000 >> info->gpio_scl;
++	sda_mask = 0x80000000 >> info->gpio_sda;
++
++	/* backup configuration registers */
++	pinmux = backup.pinmux = mmio_read_32(info->pinmux_addr);
++	gpdir = backup.gpdir = mmio_read_32(gpdir_addr);
++	gpodr = backup.gpodr = mmio_read_32(gpodr_addr);
++	gpdat = backup.gpdat = mmio_read_32(gpdat_addr);
++
++	/* configure SCL+SDA as GPIOs */
++	pinmux = (pinmux & ~info->pinmux_mask) | info->pinmux_sel;
++	mmio_write_32(info->pinmux_addr, pinmux);
++
++	/* configure SCL+SDA as output open drain */
++	gpdir |= scl_mask | sda_mask;
++	gpodr |= scl_mask | sda_mask;
++	gpdat |= scl_mask | sda_mask;
++	mmio_write_32(gpdir_addr, gpdir);
++	mmio_write_32(gpodr_addr, gpodr);
++	mmio_write_32(gpdat_addr, gpdat);
++
++	/*
++	 * reliable detection of blocked bus is hard
++	 * because sda depends on the last sent bit.
++	 * Flush unconditionally instead.
++	 */
++
++	VERBOSE("flushing i2c bus %u (%s)\n", busno, busname);
++
++	/* toggle clock 9 times */
++	for(uint8_t i = 0; i < 9; i++) {
++		mmio_write_32(gpdat_addr, gpdat & ~scl_mask);
++		udelay(10);
++		mmio_write_32(gpdat_addr, gpdat | scl_mask);
++		udelay(10);
++	}
++
++	/* restore configuration registers */
++	mmio_write_32(gpdat_addr, backup.gpdat);
++	mmio_write_32(gpodr_addr, backup.gpodr);
++	mmio_write_32(gpdir_addr, backup.gpdir);
++	mmio_write_32(info->pinmux_addr, backup.pinmux);
++
++	return;
++}
+diff --git a/plat/nxp/soc-lx2160a/soc.mk b/plat/nxp/soc-lx2160a/soc.mk
+index 20e64753c..fa8c63251 100644
+--- a/plat/nxp/soc-lx2160a/soc.mk
++++ b/plat/nxp/soc-lx2160a/soc.mk
+@@ -185,3 +185,9 @@ ifneq (${LX2160A_S5_GPIO_ADDR},0)
+ $(eval $(call add_define_val,CONFIG_LX2160A_S5_GPIO_ADDR,$(LX2160A_S5_GPIO_ADDR)))
+ $(eval $(call add_define_val,CONFIG_LX2160A_S5_GPIO,$(LX2160A_S5_GPIO)))
+ endif
++
++# I2C Bus Flushing (optional)
++LX2160_FLUSH_IIC ?= ""
++LX2160_FLUSH_IIC_MUX ?= ""
++$(eval $(call add_define_val,CONFIG_LX2160_FLUSH_IIC,"$(LX2160_FLUSH_IIC)"))
++$(eval $(call add_define_val,CONFIG_LX2160_FLUSH_IIC_MUX,"$(LX2160_FLUSH_IIC_MUX)"))
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0010-lx2160acex6-flush-i2c-bus-with-spd-eeprom-before-ddr.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0010-lx2160acex6-flush-i2c-bus-with-spd-eeprom-before-ddr.patch
new file mode 100644
index 000000000000..ee7b9350043d
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0010-lx2160acex6-flush-i2c-bus-with-spd-eeprom-before-ddr.patch
@@ -0,0 +1,30 @@
+From 668924da1e8df2036dc05022616eb7d15a8c8727 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Fri, 25 Oct 2024 16:43:59 +0200
+Subject: [PATCH 10/11] lx2160acex6: flush i2c bus with spd eeprom before ddr
+ init
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ plat/nxp/soc-lx2160a/lx2160acex6/platform.mk | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/plat/nxp/soc-lx2160a/lx2160acex6/platform.mk b/plat/nxp/soc-lx2160a/lx2160acex6/platform.mk
+index 1165cfa09..950207878 100644
+--- a/plat/nxp/soc-lx2160a/lx2160acex6/platform.mk
++++ b/plat/nxp/soc-lx2160a/lx2160acex6/platform.mk
+@@ -29,6 +29,11 @@ CONFIG_DDR_NODIMM	:=	0
+ LX2160A_S5_GPIO_ADDR := NXP_GPIO3_ADDR
+ LX2160A_S5_GPIO := 0
+ 
++# I2C Bus Flushing: IIC1
++LX2160_FLUSH_IIC := 1,
++# I2C Mux Flushing: IIC1: PCA9547@77: Channel 0 (SPD EEPROM)
++LX2160_FLUSH_IIC_MUX := { 1, 0x77, 0x01 },
++
+ # DDR Errata
+ ERRATA_DDR_A011396	:= 1
+ ERRATA_DDR_A050450	:= 1
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0011-lx2160acex7-flush-i2c-bus-with-spd-eeprom-before-ddr.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0011-lx2160acex7-flush-i2c-bus-with-spd-eeprom-before-ddr.patch
new file mode 100644
index 000000000000..314da0a6311d
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0011-lx2160acex7-flush-i2c-bus-with-spd-eeprom-before-ddr.patch
@@ -0,0 +1,30 @@
+From 722e93b7d159dfb9435e642cb0b38c2255a10391 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Fri, 25 Oct 2024 18:11:56 +0200
+Subject: [PATCH 11/11] lx2160acex7: flush i2c bus with spd eeprom before ddr
+ init
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ plat/nxp/soc-lx2160a/lx2160acex7/platform.mk | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/plat/nxp/soc-lx2160a/lx2160acex7/platform.mk b/plat/nxp/soc-lx2160a/lx2160acex7/platform.mk
+index 37598c2d7..0b064bbbf 100644
+--- a/plat/nxp/soc-lx2160a/lx2160acex7/platform.mk
++++ b/plat/nxp/soc-lx2160a/lx2160acex7/platform.mk
+@@ -24,6 +24,11 @@ APPLY_MAX_CDD	:=	yes
+ LX2160A_S5_GPIO_ADDR := NXP_GPIO3_ADDR
+ LX2160A_S5_GPIO := 7
+ 
++# I2C Bus Flushing: IIC1
++LX2160_FLUSH_IIC := 1,
++# I2C Mux Flushing: IIC1: PCA9547@77: Channel 0 (SPD EEPROM)
++LX2160_FLUSH_IIC_MUX := { 1, 0x77, 0x01 },
++
+ # DDR Errata
+ ERRATA_DDR_A011396	:= 1
+ ERRATA_DDR_A050450	:= 1
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0012-plat-lx2160a-fix-building-without-NXP_NV_SW_MAINT_LA.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0012-plat-lx2160a-fix-building-without-NXP_NV_SW_MAINT_LA.patch
new file mode 100644
index 000000000000..278d7c249499
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0012-plat-lx2160a-fix-building-without-NXP_NV_SW_MAINT_LA.patch
@@ -0,0 +1,49 @@
+From 94bdc4e055d10b89c7683c7966791612a7aed455 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Tue, 30 Jul 2024 17:45:33 +0300
+Subject: [PATCH 12/13] plat: lx2160a: fix building without
+ NXP_NV_SW_MAINT_LAST_EXEC_DATA
+
+Fix compiler errors encountered when disabling non-volatile storage of
+execution state (NXP_NV_SW_MAINT_LAST_EXEC_DATA := no) while keeping
+watchdog restart enabled (NXP_WDOG_RESTART := yes).
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ drivers/nxp/ddr/phy-gen2/phy.h | 2 +-
+ plat/nxp/soc-lx2160a/soc.c     | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/nxp/ddr/phy-gen2/phy.h b/drivers/nxp/ddr/phy-gen2/phy.h
+index 5e80f3638..7ddc7c7c6 100644
+--- a/drivers/nxp/ddr/phy-gen2/phy.h
++++ b/drivers/nxp/ddr/phy-gen2/phy.h
+@@ -6,7 +6,7 @@
+ #if !defined(PHY_H) && defined(NXP_WARM_BOOT)
+ #define PHY_H
+ 
+-#include <flash_info.h>
++#include <drivers/nxp/flexspi/flash_info.h>
+ 
+ /* To store sector size to be erase on flash*/
+ #define PHY_ERASE_SIZE F_SECTOR_ERASE_SZ
+diff --git a/plat/nxp/soc-lx2160a/soc.c b/plat/nxp/soc-lx2160a/soc.c
+index 137c24ef8..4aebb1393 100644
+--- a/plat/nxp/soc-lx2160a/soc.c
++++ b/plat/nxp/soc-lx2160a/soc.c
+@@ -521,10 +521,12 @@ void soc_init(void)
+ static uint64_t wdog_interrupt_handler(uint32_t id, uint32_t flags,
+ 					  void *handle, void *cookie)
+ {
++#ifdef NXP_NV_SW_MAINT_LAST_EXEC_DATA
+ 	uint8_t data = WDOG_RESET_FLAG;
+ 
+ 	wr_nv_app_data(WDT_RESET_FLAG_OFFSET,
+ 		       (uint8_t *)&data, sizeof(data));
++#endif
+ 
+ 	mmio_write_32(NXP_RST_ADDR + RSTCNTL_OFFSET, SW_RST_REQ_INIT);
+ 
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0013-plat-lx2160a-fix-boot-without-spi-flash-disable-non-.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0013-plat-lx2160a-fix-boot-without-spi-flash-disable-non-.patch
new file mode 100644
index 000000000000..facda492f64c
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0013-plat-lx2160a-fix-boot-without-spi-flash-disable-non-.patch
@@ -0,0 +1,33 @@
+From cbe4212aaa1b934135c8400f16265849d12689c0 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Tue, 30 Jul 2024 17:45:38 +0300
+Subject: [PATCH 13/13] plat: lx2160a: fix boot without spi flash / disable
+ non-volatile storage
+
+Watchdog restart function does not require book-keeping on non-volatile
+storage.
+Remove explicit enabling of NXP_NV_SW_MAINT_LAST_EXEC_DATA.
+
+This fixed hang during boot where atf gets stuck trying to erase a
+sector of spi flash.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ plat/nxp/soc-lx2160a/soc.mk | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/plat/nxp/soc-lx2160a/soc.mk b/plat/nxp/soc-lx2160a/soc.mk
+index fa8c63251..4e864e164 100644
+--- a/plat/nxp/soc-lx2160a/soc.mk
++++ b/plat/nxp/soc-lx2160a/soc.mk
+@@ -28,7 +28,6 @@ NXP_WDOG_RESTART	:= yes
+ 
+  # for features enabled above.
+ ifeq (${NXP_WDOG_RESTART}, yes)
+-NXP_NV_SW_MAINT_LAST_EXEC_DATA := yes
+ LS_EL3_INTERRUPT_HANDLER := yes
+ $(eval $(call add_define, NXP_WDOG_RESTART))
+ endif
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0014-add-separate-platform-for-solidrun-lx2162a-som.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0014-add-separate-platform-for-solidrun-lx2162a-som.patch
new file mode 100644
index 000000000000..0172514cf681
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0014-add-separate-platform-for-solidrun-lx2162a-som.patch
@@ -0,0 +1,597 @@
+From 956be9ce8f365e7f9ac7d7d1f896f1c2a27f6287 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Sun, 27 Oct 2024 18:00:11 +0100
+Subject: [PATCH] add separate platform for solidrun lx2162a som
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ plat/nxp/soc-lx2160a/lx2162asom/ddr_init.c    | 290 ++++++++++++++++++
+ plat/nxp/soc-lx2160a/lx2162asom/plat_def.h    | 105 +++++++
+ plat/nxp/soc-lx2160a/lx2162asom/platform.c    |  29 ++
+ plat/nxp/soc-lx2160a/lx2162asom/platform.mk   |  61 ++++
+ .../nxp/soc-lx2160a/lx2162asom/platform_def.h |  14 +
+ plat/nxp/soc-lx2160a/lx2162asom/policy.h      |  38 +++
+ 6 files changed, 537 insertions(+)
+ create mode 100644 plat/nxp/soc-lx2160a/lx2162asom/ddr_init.c
+ create mode 100644 plat/nxp/soc-lx2160a/lx2162asom/plat_def.h
+ create mode 100644 plat/nxp/soc-lx2160a/lx2162asom/platform.c
+ create mode 100644 plat/nxp/soc-lx2160a/lx2162asom/platform.mk
+ create mode 100644 plat/nxp/soc-lx2160a/lx2162asom/platform_def.h
+ create mode 100644 plat/nxp/soc-lx2160a/lx2162asom/policy.h
+
+diff --git a/plat/nxp/soc-lx2160a/lx2162asom/ddr_init.c b/plat/nxp/soc-lx2160a/lx2162asom/ddr_init.c
+new file mode 100644
+index 000000000..2cadab7ba
+--- /dev/null
++++ b/plat/nxp/soc-lx2160a/lx2162asom/ddr_init.c
+@@ -0,0 +1,290 @@
++/*
++ * Copyright 2018-2021 NXP
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#include <assert.h>
++#include <errno.h>
++#include <stdbool.h>
++#include <stdint.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++
++#include <common/debug.h>
++#include <ddr.h>
++#include <lib/utils.h>
++#include <load_img.h>
++
++#include "plat_common.h"
++#include <platform_def.h>
++
++#ifdef CONFIG_STATIC_DDR
++#error not implemented
++#elif defined(CONFIG_DDR_NODIMM)
++#if CONFIG_DDR_NODIMM == 1
++/*
++ * SoM Revision 1.1: 9 x K4A8G085WC-BCWE (SDP, 8GB w/ ECC)
++ *
++ * Use in production for units with empty SPD,
++ * and development.
++ */
++static const struct dimm_params static_dimm = {
++	.mpart = "Fixed DDR Config 1",
++	.n_ranks = 1,
++	.die_density = 0x5, // encoded per spd byte 4, 0b101 = 8Gbit
++	.rank_density = 0x200000000, // 8GB
++	.capacity = 0x200000000, // 8GB
++	.primary_sdram_width = 64,
++	.ec_sdram_width = 8, // 8 bit ecc extension
++	.rdimm = 0,
++	.package_3ds = 0,
++	.device_width = 8, // 8 bit per sdram
++	.rc = 0,
++
++	.n_row_addr = 16,
++	.n_col_addr = 10,
++	.edc_config = 2, // enable ecc
++	.bank_addr_bits = 0, // 4 banks
++	.bank_group_bits = 2, // 4 bank groups
++	.burst_lengths_bitmask = 0xc, // enable 4 & 8-bit burst (DDR4 spec)
++
++	.mirrored_dimm = 0,
++
++	// timings based on K4A8G085WC-BCTD (DDR4-2666), missing values for 3200
++	.mtb_ps = 125, // MTB per SPD spec
++	.ftb_10th_ps = 10, // default value, unused by nxp ddr driver
++	.taa_ps = 13750, // min. 13.75ns
++	.tfaw_ps = 21000, // min: max(21ns or 20CK) (this 8Gbit sdram has 1KB pages)
++
++	.tckmin_x_ps = 625, // 3200 (CK=1600)
++	.tckmax_ps = 1250, // 1600 (CK=800)
++
++	.caslat_x = 0b00000001011111111111110000000000, // CL = [10-22,24] (1 << CL)
++
++	.trcd_ps = 13750, // 13.75ns - CL22-22-22
++	.trp_ps = 13750, // 13.75ns - CL22-22-22
++	.tras_ps = 32000, // 32ns
++
++	.trfc1_ps = 350000, // 350ns
++	.trfc2_ps = 260000, // 260ns
++	.trfc4_ps = 160000, // 160ns
++	.trrds_ps = 3300, // min: max(4CK or 3.3ns)
++	.trrdl_ps = 4900, // min: max(4CK or 6.4ns)
++	.tccdl_ps = 5000, // min: max(5CK or 5ns)
++	.trfc_slr_ps = 0,
++
++	.trc_ps = 45750, // tras + trp 45.75ns
++	.twr_ps = 15000, // 15ns
++
++	.refresh_rate_ps = 7800000, // 1x mode 7.8us for standard temperature range (TODO: pick correct range based on temperature?!)
++	// .extended_op_srt = 0,
++
++	// .rcw = {}, // only for registered dimm
++	.dq_mapping = {
++		0x16, // DQ[0:3]:   lower nibble, bit order 3120
++		0x22, // DQ[4:7]:   upper nibble, bit order 4576
++		0x0e, // DQ[8:11]:  lower nibble, bit order 2031
++		0x30, // DQ[12:15]: upper nibble, bit order 6574
++		0x14, // DQ[16:19]: lower nibble, bit order 3021
++		0x36, // DQ[20:23]: upper nibble, bit order 7564
++		0x11, // DQ[24:27]: lower nibble, bit order 2301
++		0x2f, // DQ[28:31]: upper nibble, bit order 6547
++		0x03, // ECC[0:3]:  lower nibble, bit order 0213
++		0x22, // ECC[4:7]:  upper nibble, bit order 4576
++		0x10, // DQ[32:35]: lower nibble, bit order 2130
++		0x30, // DQ[36:39]: upper nibble, bit order 6574
++		0x0e, // DQ[40:43]: lower nibble, bit order 2031
++		0x34, // DQ[44:47]: upper nibble, bit order 7465
++		0x14, // DQ[48:51]: lower nibble, bit order 3021
++		0x36, // DQ[52:55]: upper nibble, bit order 7564
++		0x10, // DQ[56:59]: lower nibble, bit order 2130
++		0x2b, // DQ[60:63]: upper nibble, bit order 5746
++	},
++	.dq_mapping_ors = 1,
++};
++#endif /* CONFIG_DDR_NODIMM == 1 */
++
++#if CONFIG_DDR_NODIMM == 2
++/*
++ * SoM Revision 1.1: 9 x K4AAG085WA-BCWE (DDP, 16GB w/ ECC)
++ *
++ * Use in production for units with empty SPD,
++ * and development.
++ */
++static const struct dimm_params static_dimm = {
++	.mpart = "Fixed DDR Config 2",
++	.n_ranks = 1,
++	.die_density = 0x6, // encoded per spd byte 4, 0b110 = 16Gbit
++	// TODO: for DDP memory should have 2 ranks per DIMM + correct density per die?
++	.rank_density = 0x400000000, // 16GB
++	.capacity = 0x400000000, // 16GB
++	.primary_sdram_width = 64,
++	.ec_sdram_width = 8, // 8 bit ecc extension
++	.rdimm = 0,
++	.package_3ds = 0,
++	.device_width = 8, // 8 bit per sdram
++	.rc = 0,
++
++	.n_row_addr = 17,
++	.n_col_addr = 10,
++	.edc_config = 2, // enable ecc
++	.bank_addr_bits = 0, // 4 banks
++	.bank_group_bits = 2, // 4 bank groups
++	.burst_lengths_bitmask = 0xc, // enable 4 & 8-bit burst (DDR4 spec)
++
++	.mirrored_dimm = 0,
++
++	.mtb_ps = 125, // MTB per SPD spec
++	.ftb_10th_ps = 10, // default value, unused by nxp ddr driver
++	.taa_ps = 13750, // min. 13.75ns
++	.tfaw_ps = 30000, // min: max(30ns or 28CK) (this 16Gbit sdram has 2KB pages)
++
++	.tckmin_x_ps = 625, // 3200 (CK=1600)
++	.tckmax_ps = 1250, // 1600 (CK=800)
++
++	.caslat_x = 0b00000001011111111111110000000000, // CL = [10-22,24] (1 << CL)
++
++	.trcd_ps = 13750, // 13.75ns
++	.trp_ps = 13750, // 13.75ns
++	.tras_ps = 32000, // 32ns
++
++	.trfc1_ps = 350000, // 350ns, assumed same as 8Gbit SDP module
++	.trfc2_ps = 260000, // 260ns, assumed same as 8Gbit SDP module
++	.trfc4_ps = 160000, // 160ns, assumed same as 8Gbit SDP module
++	.trrds_ps = 5300, // min: max(4CK or 5.3ns)
++	.trrdl_ps = 6400, // min: max(4CK or 6.4ns)
++	.tccdl_ps = 5000, // min: max(5CK or 5ns)
++	.trfc_slr_ps = 0,
++
++	.trc_ps = 45750, // tras + trp 45.75ns
++	.twr_ps = 15000, // 15ns
++
++	.refresh_rate_ps = 7800000, // 1x mode 7.8us for standard temperature range (TODO: pick correct range based on temperature?!)
++	// .extended_op_srt = 0,
++
++	// .rcw = {}, // only for registered dimm
++	.dq_mapping = {
++		0x16, // DQ[0:3]:   lower nibble, bit order 3120
++		0x22, // DQ[4:7]:   upper nibble, bit order 4576
++		0x0e, // DQ[8:11]:  lower nibble, bit order 2031
++		0x30, // DQ[12:15]: upper nibble, bit order 6574
++		0x14, // DQ[16:19]: lower nibble, bit order 3021
++		0x36, // DQ[20:23]: upper nibble, bit order 7564
++		0x11, // DQ[24:27]: lower nibble, bit order 2301
++		0x2f, // DQ[28:31]: upper nibble, bit order 6547
++		0x03, // ECC[0:3]:  lower nibble, bit order 0213
++		0x22, // ECC[4:7]:  upper nibble, bit order 4576
++		0x10, // DQ[32:35]: lower nibble, bit order 2130
++		0x30, // DQ[36:39]: upper nibble, bit order 6574
++		0x0e, // DQ[40:43]: lower nibble, bit order 2031
++		0x34, // DQ[44:47]: upper nibble, bit order 7465
++		0x14, // DQ[48:51]: lower nibble, bit order 3021
++		0x36, // DQ[52:55]: upper nibble, bit order 7564
++		0x10, // DQ[56:59]: lower nibble, bit order 2130
++		0x2b, // DQ[60:63]: upper nibble, bit order 5746
++	},
++	.dq_mapping_ors = 1,
++};
++#endif /* CONFIG_DDR_NODIMM == 2 */
++
++int ddr_get_ddr_params(struct dimm_params *pdimm,
++			    struct ddr_conf *conf)
++{
++	// channel 1
++	conf->dimm_in_use[0] = 1;
++	memcpy(&pdimm[0], &static_dimm, sizeof(struct dimm_params));
++
++	/* 1 module */
++	return 0x1;
++}
++#endif /* defined(CONFIG_DDR_NODIMM) */
++
++int ddr_board_options(struct ddr_info *priv)
++{
++	struct memctl_opt *popts = &priv->opt;
++
++	popts->caslat_override = 0;
++	popts->caslat_override_value = 0;
++	popts->auto_self_refresh_en = 1;
++	popts->output_driver_impedance = 0; // 34 Ohm
++	popts->twot_en = 0;
++	popts->threet_en = 0;
++	popts->addt_lat_override = 0;
++	popts->addt_lat_override_value = 0;
++	popts->phy_atx_impedance = 30;
++	popts->skip2d = 0;
++	popts->vref_dimm = U(0x19);		/* range 1, 83.4% */
++
++	popts->rtt_override = 0;
++	popts->rtt_park = 120U;
++	popts->otf_burst_chop_en = 0;
++	popts->burst_length = DDR_BL8;
++	popts->trwt_override = 1;
++	popts->bstopre = 0;			/* auto precharge */
++	popts->addr_hash = 1;
++	popts->trwt = 0x3;
++	popts->twrt = 0x3;
++	popts->trrt = 0x3;
++	popts->twwt = 0x3;
++	popts->vref_phy = U(0x5D);		/* 72% */
++	popts->odt = 60U;
++	popts->phy_tx_impedance = 28U;
++
++	return 0;
++}
++
++#ifdef NXP_WARM_BOOT
++long long init_ddr(uint32_t wrm_bt_flg)
++#else
++long long init_ddr(void)
++#endif
++{
++	int spd_addr[] = { 0x51 };
++	struct ddr_info info;
++	struct sysinfo sys;
++	long long dram_size;
++
++	zeromem(&sys, sizeof(sys));
++	if (get_clocks(&sys) != 0) {
++		ERROR("System clocks are not set\n");
++		panic();
++	}
++	debug("platform clock %lu\n", sys.freq_platform);
++	debug("DDR PLL1 %lu\n", sys.freq_ddr_pll0);
++	debug("DDR PLL2 %lu\n", sys.freq_ddr_pll1);
++
++	zeromem(&info, sizeof(info));
++
++	/* Set two DDRC. Unused DDRC will be removed automatically. */
++	info.num_ctlrs = NUM_OF_DDRC;
++	info.spd_addr = spd_addr;
++	info.ddr[0] = (void *)NXP_DDR_ADDR;
++	info.ddr[1] = (void *)NXP_DDR2_ADDR;
++	info.phy[0] = (void *)NXP_DDR_PHY1_ADDR;
++	info.phy[1] = (void *)NXP_DDR_PHY2_ADDR;
++	info.clk = get_ddr_freq(&sys, 0);
++	info.img_loadr = load_img;
++	info.phy_gen2_fw_img_buf = PHY_GEN2_FW_IMAGE_BUFFER;
++	if (info.clk == 0) {
++		info.clk = get_ddr_freq(&sys, 1);
++	}
++	info.dimm_on_ctlr = DDRC_NUM_DIMM;
++
++	info.warm_boot_flag = DDR_WRM_BOOT_NT_SUPPORTED;
++
++	dram_size = dram_init(&info
++#if defined(NXP_HAS_CCN504) || defined(NXP_HAS_CCN508)
++				    , NXP_CCN_HN_F_0_ADDR
++#endif
++			);
++
++
++	if (dram_size < 0) {
++		ERROR("DDR init failed.\n");
++	}
++
++	return dram_size;
++}
+diff --git a/plat/nxp/soc-lx2160a/lx2162asom/plat_def.h b/plat/nxp/soc-lx2160a/lx2162asom/plat_def.h
+new file mode 100644
+index 000000000..de2d2444a
+--- /dev/null
++++ b/plat/nxp/soc-lx2160a/lx2162asom/plat_def.h
+@@ -0,0 +1,105 @@
++/*
++ * Copyright 2018-2021 NXP
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef PLAT_DEF_H
++#define PLAT_DEF_H
++
++#include <arch.h>
++#include <cortex_a72.h>
++/* Required without TBBR.
++ * To include the defines for DDR PHY
++ * Images.
++ */
++#include <tbbr_img_def.h>
++
++#include <policy.h>
++#include <soc.h>
++
++#if defined(IMAGE_BL31)
++#define LS_SYS_TIMCTL_BASE		0x2890000
++#define PLAT_LS_NSTIMER_FRAME_ID	0
++#define LS_CONFIG_CNTACR		1
++#endif
++
++#define NXP_SYSCLK_FREQ		100000000
++#define NXP_DDRCLK_FREQ		100000000
++
++/* UART related definition */
++#define NXP_CONSOLE_ADDR	NXP_UART_ADDR
++#define NXP_CONSOLE_BAUDRATE	115200
++
++/* Size of cacheable stacks */
++#if defined(IMAGE_BL2)
++#if defined(TRUSTED_BOARD_BOOT)
++#define PLATFORM_STACK_SIZE	0x2000
++#else
++#define PLATFORM_STACK_SIZE	0x1000
++#endif
++#elif defined(IMAGE_BL31)
++#define PLATFORM_STACK_SIZE	0x1000
++#endif
++
++/* SD block buffer */
++#define NXP_SD_BLOCK_BUF_SIZE	(0x8000)
++#define NXP_SD_BLOCK_BUF_ADDR	(NXP_OCRAM_ADDR + NXP_OCRAM_SIZE \
++				- NXP_SD_BLOCK_BUF_SIZE)
++
++#ifdef SD_BOOT
++#define BL2_LIMIT		(NXP_OCRAM_ADDR + NXP_OCRAM_SIZE \
++				- NXP_SD_BLOCK_BUF_SIZE)
++#else
++#define BL2_LIMIT		(NXP_OCRAM_ADDR + NXP_OCRAM_SIZE)
++#endif
++
++/* IO defines as needed by IO driver framework */
++#define MAX_IO_DEVICES		4
++#define MAX_IO_BLOCK_DEVICES	1
++#define MAX_IO_HANDLES		4
++
++#define PHY_GEN2_FW_IMAGE_BUFFER	(NXP_OCRAM_ADDR + CSF_HDR_SZ)
++
++/*
++ * FIP image defines - Offset at which FIP Image would be present
++ * Image would include Bl31 , Bl33 and Bl32 (optional)
++ */
++#ifdef POLICY_FUSE_PROVISION
++#define MAX_FIP_DEVICES		3
++#endif
++
++#ifndef MAX_FIP_DEVICES
++#define MAX_FIP_DEVICES		2
++#endif
++
++/*
++ * ID of the secure physical generic timer interrupt used by the BL32.
++ */
++#define BL32_IRQ_SEC_PHY_TIMER	29
++
++#define BL31_WDOG_SEC		89
++
++#define BL31_NS_WDOG_WS1	108
++
++/*
++ * Define properties of Group 1 Secure and Group 0 interrupts as per GICv3
++ * terminology. On a GICv2 system or mode, the lists will be merged and treated
++ * as Group 0 interrupts.
++ */
++#define PLAT_LS_G1S_IRQ_PROPS(grp) \
++	INTR_PROP_DESC(BL32_IRQ_SEC_PHY_TIMER, GIC_HIGHEST_SEC_PRIORITY, grp, \
++			GIC_INTR_CFG_EDGE)
++
++/* SGI 15 and Secure watchdog interrupts assigned to Group 0 */
++#define NXP_IRQ_SEC_SGI_7		15
++
++#define PLAT_LS_G0_IRQ_PROPS(grp)	\
++	INTR_PROP_DESC(BL31_WDOG_SEC, GIC_HIGHEST_SEC_PRIORITY, grp, \
++			GIC_INTR_CFG_EDGE), \
++	INTR_PROP_DESC(BL31_NS_WDOG_WS1, GIC_HIGHEST_SEC_PRIORITY, grp, \
++			GIC_INTR_CFG_EDGE), \
++	INTR_PROP_DESC(NXP_IRQ_SEC_SGI_7, GIC_HIGHEST_SEC_PRIORITY, grp, \
++			GIC_INTR_CFG_LEVEL)
++#endif
+diff --git a/plat/nxp/soc-lx2160a/lx2162asom/platform.c b/plat/nxp/soc-lx2160a/lx2162asom/platform.c
+new file mode 100644
+index 000000000..7622cf09a
+--- /dev/null
++++ b/plat/nxp/soc-lx2160a/lx2162asom/platform.c
+@@ -0,0 +1,29 @@
++/*
++ * Copyright 2020 NXP
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#include <plat_common.h>
++
++#pragma weak board_enable_povdd
++#pragma weak board_disable_povdd
++
++bool board_enable_povdd(void)
++{
++#ifdef CONFIG_POVDD_ENABLE
++	return true;
++#else
++	return false;
++#endif
++}
++
++bool board_disable_povdd(void)
++{
++#ifdef CONFIG_POVDD_ENABLE
++	return true;
++#else
++	return false;
++#endif
++}
+diff --git a/plat/nxp/soc-lx2160a/lx2162asom/platform.mk b/plat/nxp/soc-lx2160a/lx2162asom/platform.mk
+new file mode 100644
+index 000000000..c1ba077e9
+--- /dev/null
++++ b/plat/nxp/soc-lx2160a/lx2162asom/platform.mk
+@@ -0,0 +1,61 @@
++#
++# Copyright 2018-2020 NXP
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++
++# board-specific build parameters
++
++BOOT_MODE	?= 	flexspi_nor
++BOARD		?=	lx2162asom
++POVDD_ENABLE	:=	no
++NXP_COINED_BB	:=	no
++
++ # DDR Compilation Configs
++NUM_OF_DDRC	:=	1
++DDRC_NUM_DIMM	:=	1
++DDRC_NUM_CS	:=	2
++DDR_ECC_EN	:=	yes
++ #enable address decoding feature
++DDR_ADDR_DEC	:=	yes
++APPLY_MAX_CDD	:=	yes
++
++# Mock SPD:
++# - 0: disable mock spd
++# - 1: 9 x K4A8G085WC-BCWE SoM v1.1 8GB w/ ECC
++# - 2: 9 x K4AAG085WA-BCWE SoM v1.1 16GB w/ ECC
++CONFIG_DDR_NODIMM	:=	0
++
++# I2C Bus Flushing: IIC1 (SPD EEPROM)
++LX2160_FLUSH_IIC := 1,
++
++# DDR Errata
++ERRATA_DDR_A011396	:= 1
++ERRATA_DDR_A050450	:= 1
++
++# On-Board Flash Details
++FLASH_TYPE	:=	MT35XU512A
++XSPI_FLASH_SZ	:=	0x10000000
++NXP_XSPI_NOR_UNIT_SIZE		:=	0x20000
++BL2_BIN_XSPI_NOR_END_ADDRESS	:=	0x100000
++# CONFIG_FSPI_ERASE_4K is required to erase 4K sector sizes. This
++# config is enabled for future use cases.
++FSPI_ERASE_4K	:= 0
++
++# Platform specific features.
++WARM_BOOT	:=	no
++
++# Adding Platform files build files
++BL2_SOURCES	+=	${BOARD_PATH}/ddr_init.c\
++			${BOARD_PATH}/platform.c
++
++SUPPORTED_BOOT_MODE	:=	flexspi_nor	\
++				sd		\
++				emmc		\
++				auto
++
++# Adding platform board build info
++include plat/nxp/common/plat_make_helper/plat_common_def.mk
++
++# Adding SoC build info
++include plat/nxp/soc-lx2160a/soc.mk
+diff --git a/plat/nxp/soc-lx2160a/lx2162asom/platform_def.h b/plat/nxp/soc-lx2160a/lx2162asom/platform_def.h
+new file mode 100644
+index 000000000..5fa774e90
+--- /dev/null
++++ b/plat/nxp/soc-lx2160a/lx2162asom/platform_def.h
+@@ -0,0 +1,14 @@
++/*
++ * Copyright 2018-2020 NXP
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef PLATFORM_DEF_H
++#define PLATFORM_DEF_H
++
++#include "plat_def.h"
++#include "plat_default_def.h"
++
++#endif
+diff --git a/plat/nxp/soc-lx2160a/lx2162asom/policy.h b/plat/nxp/soc-lx2160a/lx2162asom/policy.h
+new file mode 100644
+index 000000000..1095f3840
+--- /dev/null
++++ b/plat/nxp/soc-lx2160a/lx2162asom/policy.h
+@@ -0,0 +1,38 @@
++/*
++ * Copyright 2018-2020 NXP
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef POLICY_H
++#define	POLICY_H
++
++/* Following defines affect the PLATFORM SECURITY POLICY */
++
++/* set this to 0x0 if the platform is not using/responding to ECC errors
++ * set this to 0x1 if ECC is being used (we have to do some init)
++ */
++#define  POLICY_USING_ECC 0x0
++
++/* Set this to 0x0 to leave the default SMMU page size in sACR
++ * Set this to 0x1 to change the SMMU page size to 64K
++ */
++#define POLICY_SMMU_PAGESZ_64K 0x1
++
++/*
++ * POLICY_PERF_WRIOP = 0 : No Performance enhancement for WRIOP RN-I
++ * POLICY_PERF_WRIOP = 1 : No Performance enhancement for WRIOP RN-I = 7
++ * POLICY_PERF_WRIOP = 2 : No Performance enhancement for WRIOP RN-I = 23
++ */
++#define POLICY_PERF_WRIOP 0
++
++/*
++ * set this to '1' if the debug clocks need to remain enabled during
++ * system entry to low-power (LPM20) - this should only be necessary
++ * for testing and NEVER set for normal production
++ */
++#define POLICY_DEBUG_ENABLE 0
++
++
++#endif /* POLICY_H */
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0015-lx2160acex6-add-ddr-configuration-for-pcb-v1.2-with-.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0015-lx2160acex6-add-ddr-configuration-for-pcb-v1.2-with-.patch
new file mode 100644
index 000000000000..ef794f3c4413
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0015-lx2160acex6-add-ddr-configuration-for-pcb-v1.2-with-.patch
@@ -0,0 +1,127 @@
+From 319f6d2f0cbbb54ac56926683c5e0dfefe984e64 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Sun, 24 Nov 2024 12:38:17 +0100
+Subject: [PATCH] lx2160acex6: add ddr configuration for pcb v1.2 with ecc
+
+Tune DDR Configuration for v1.1 PCB with MIcron memory, and v1.2 PCB
+resolving ECC issues.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ plat/nxp/soc-lx2160a/lx2160acex6/ddr_init.c  | 42 +++++++++++++-------
+ plat/nxp/soc-lx2160a/lx2160acex6/platform.mk |  3 +-
+ 2 files changed, 29 insertions(+), 16 deletions(-)
+
+diff --git a/plat/nxp/soc-lx2160a/lx2160acex6/ddr_init.c b/plat/nxp/soc-lx2160a/lx2160acex6/ddr_init.c
+index 0b978e298..61acfd7ac 100644
+--- a/plat/nxp/soc-lx2160a/lx2160acex6/ddr_init.c
++++ b/plat/nxp/soc-lx2160a/lx2160acex6/ddr_init.c
+@@ -31,21 +31,29 @@
+ #error Not implemented.
+ #endif /* CONFIG_DDR_NODIMM == 1 */
+ 
+-#if CONFIG_DDR_NODIMM == 2
++#if CONFIG_DDR_NODIMM == 2 || CONFIG_DDR_NODIMM == 3
+ /*
+- * PCB Revision 1.1: 2 x 5 x K4A8G165WB-BCRC
+- *
+- * ECC disabled because of training failures.
++ * PCB Revision 1.1/1.2: 2 x 5 x MT40A1G16TB-062E IT:F
+  */
+ #define CONFIG_DDR_NODIMM_CH2
++
++#if CONFIG_DDR_NODIMM == 3
++/* PCB Revision 1.2 supports ECC */
++#define CONFIG_DDR_NODIMM_ECC
++#endif /* CONFIG_DDR_NODIMM == 3 */
++
+ static const struct dimm_params static_dimm = {
+-	.mpart = "Fixed DDR Config 2",
++	.mpart = "Fixed DDR Config " __XSTRING(CONFIG_DDR_NODIMM),
+ 	.n_ranks = 1,
+ 	.die_density = 0x6, // encoded per spd byte 4, 0b110 = 16Gbit
+-	.rank_density = 0x200000000, // 16GB
+-	.capacity = 0x200000000, // 16GB
++	.rank_density = 0x200000000, // 16Gbit
++	.capacity = 0x200000000, // 16Gbit
+ 	.primary_sdram_width = 64,
++#ifdef CONFIG_DDR_NODIMM_ECC
++	.ec_sdram_width = 8, // 8 bit ecc extension
++#else
+ 	.ec_sdram_width = 0, // no ecc extension
++#endif
+ 	.rdimm = 0,
+ 	.package_3ds = 0,
+ 	.device_width = 16, // 16 bit per sdram
+@@ -53,26 +61,30 @@ static const struct dimm_params static_dimm = {
+ 
+ 	.n_row_addr = 17,
+ 	.n_col_addr = 10,
++#ifdef CONFIG_DDR_NODIMM_ECC
++	.edc_config = 2, // enable ecc
++#else
+ 	.edc_config = 0, // disable ecc
++#endif
+ 	.bank_addr_bits = 0, // 4 banks
+ 	.bank_group_bits = 1, // 2 bank groups
+ 	.burst_lengths_bitmask = 0xc, // enable 4 & 8-bit burst (DDR4 spec)
+ 
+ 	.mirrored_dimm = 0,
+ 
+-	// timings based on K4A8G085WC-BCTD (DDR4-2666), missing values for 3200
++	// timings based on MT40A4G4 / MT40A2G8 / MT40A1G16 datasheet (DDR4-3200 22-22-22)
+ 	.mtb_ps = 125, // MTB per SPD spec
+ 	.ftb_10th_ps = 10, // default value, unused by nxp ddr driver
+ 	.taa_ps = 13750, // min. 13.75ns
+-	.tfaw_ps = 30000, // min: max(30ns or 28CK) (this 16Gbit sdram has 2KB pages)
++	.tfaw_ps = 30000, // min: max(30ns or 28CK) (this 8Gbit sdram has 2KB pages)
+ 
+-	.tckmin_x_ps = 625, // 3200 (CK=1600)
++	.tckmin_x_ps = 625, // 2400 (CK=1600)
+ 	.tckmax_ps = 1250, // 1600 (CK=800)
+ 
+-	.caslat_x = 0b00000001010101010101010000000000, // CL = [10,12,14,16,18,20,22,24] (1 << CL)
++	.caslat_x = 0b00000001011111111111110000000000, // CL = [10-22,24] (1 << CL)
+ 
+-	.trcd_ps = 13750, // 13.75ns - CL22-22-22
+-	.trp_ps = 13750, // 13.75ns - CL22-22-22
++	.trcd_ps = 13750, // 13.75ns
++	.trp_ps = 13750, // 13.75ns
+ 	.tras_ps = 32000, // 32ns
+ 
+ 	.trfc1_ps = 350000, // 350ns,
+@@ -100,7 +112,7 @@ static const struct dimm_params static_dimm = {
+ 		0x00,
+ 		0x20,
+ 		0x00,
+-		0x00,
++		0x02,
+ 		0x00,
+ 		0x20,
+ 		0x00,
+@@ -112,7 +124,7 @@ static const struct dimm_params static_dimm = {
+ 	},
+ 	.dq_mapping_ors = 1,
+ };
+-#endif /* CONFIG_DDR_NODIMM == 2 */
++#endif /* CONFIG_DDR_NODIMM == 2 || CONFIG_DDR_NODIMM == 3 */
+ 
+ int ddr_get_ddr_params(struct dimm_params *pdimm,
+ 			    struct ddr_conf *conf)
+diff --git a/plat/nxp/soc-lx2160a/lx2160acex6/platform.mk b/plat/nxp/soc-lx2160a/lx2160acex6/platform.mk
+index 950207878..d01a41ea6 100644
+--- a/plat/nxp/soc-lx2160a/lx2160acex6/platform.mk
++++ b/plat/nxp/soc-lx2160a/lx2160acex6/platform.mk
+@@ -22,7 +22,8 @@ APPLY_MAX_CDD	:=	yes
+ 
+ # Mock SPD:
+ # - 0: disable mock spd
+-# - 2: 2 x 5 x K4A8G165WB-BCRC PCB v1.1
++# - 2: 2 x 5 x MT40A1G16TB-062E IT:F PCB v1.1
++# - 3: 2 x 5 x MT40A1G16TB-062E IT:F PCB v1.2 (with ECC)
+ CONFIG_DDR_NODIMM	:=	0
+ 
+ # S5 GPIO
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0016-nxp-ddr-add-debug-output-for-dimm-parameters-parsed-.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0016-nxp-ddr-add-debug-output-for-dimm-parameters-parsed-.patch
new file mode 100644
index 000000000000..69280da6cf2d
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0016-nxp-ddr-add-debug-output-for-dimm-parameters-parsed-.patch
@@ -0,0 +1,83 @@
+From 0591394c1257b79d9d49016476325533c1c2a14a Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Thu, 26 Sep 2024 16:35:40 +0200
+Subject: [PATCH 16/17] nxp: ddr: add debug output for dimm parameters parsed
+ from spd or static
+
+Add debug prints for all members of struct dimm_params, after either
+parsing of SPD - or from static (no-dimm) configuration.
+
+This enables comparison of parameters derived from SPD with static
+configuration.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ drivers/nxp/ddr/nxp-ddr/ddr.c | 52 +++++++++++++++++++++++++++++++++++
+ 1 file changed, 52 insertions(+)
+
+diff --git a/drivers/nxp/ddr/nxp-ddr/ddr.c b/drivers/nxp/ddr/nxp-ddr/ddr.c
+index c051b3b25..91a6ef5dc 100644
+--- a/drivers/nxp/ddr/nxp-ddr/ddr.c
++++ b/drivers/nxp/ddr/nxp-ddr/ddr.c
+@@ -616,6 +616,58 @@ static int parse_spd(struct ddr_info *priv)
+ 	/* now we have valid and identical DIMMs on controllers */
+ #endif	/* CONFIG_DDR_NODIMM */
+ 
++	debug("DIMM: n_ranks = %u\n", dimm->n_ranks);
++	debug("DIMM: die_density = %u\n", dimm->die_density);
++	debug("DIMM: rank_density = %llu\n", dimm->rank_density);
++	debug("DIMM: capacity = %llu\n", dimm->capacity);
++	debug("DIMM: primary_sdram_width = %u\n", dimm->primary_sdram_width);
++	debug("DIMM: ec_sdram_width = %u\n", dimm->ec_sdram_width);
++	debug("DIMM: rdimm = %u\n", dimm->rdimm);
++	debug("DIMM: package_3ds = %u\n", dimm->package_3ds);
++	debug("DIMM: device_width = %u\n", dimm->device_width);
++	debug("DIMM: rc = %u\n", dimm->rc);
++
++	debug("DIMM: n_row_addr = %u\n", dimm->n_row_addr);
++	debug("DIMM: n_col_addr = %u\n", dimm->n_col_addr);
++	debug("DIMM: edc_config = %u\n", dimm->edc_config);
++	debug("DIMM: bank_addr_bits = %u\n", dimm->bank_addr_bits);
++	debug("DIMM: bank_group_bits = %u\n", dimm->bank_group_bits);
++	debug("DIMM: burst_lengths_bitmask = %u\n", dimm->burst_lengths_bitmask);
++
++	debug("DIMM: mirrored_dimm = %u\n", dimm->mirrored_dimm);
++
++	debug("DIMM: mtb_ps = %d\n", dimm->mtb_ps);
++	debug("DIMM: ftb_10th_ps = %d\n", dimm->ftb_10th_ps);
++	debug("DIMM: taa_ps = %d\n", dimm->taa_ps);
++	debug("DIMM: tfaw_ps = %d\n", dimm->tfaw_ps);
++
++	debug("DIMM: tckmin_x_ps = %d\n", dimm->tckmin_x_ps);
++	debug("DIMM: tckmax_ps = %d\n", dimm->tckmax_ps);
++
++	debug("DIMM: caslat_x = %u\n", dimm->caslat_x);
++
++	debug("DIMM: trcd_ps = %d\n", dimm->trcd_ps);
++	debug("DIMM: trp_ps = %d\n", dimm->trp_ps);
++	debug("DIMM: tras_ps = %d\n", dimm->tras_ps);
++
++	debug("DIMM: trfc1_ps = %d\n", dimm->trfc1_ps);
++	debug("DIMM: trfc2_ps = %d\n", dimm->trfc2_ps);
++	debug("DIMM: trfc4_ps = %d\n", dimm->trfc4_ps);
++	debug("DIMM: trrds_ps = %d\n", dimm->trrds_ps);
++	debug("DIMM: trrdl_ps = %d\n", dimm->trrdl_ps);
++	debug("DIMM: tccdl_ps = %d\n", dimm->tccdl_ps);
++	debug("DIMM: trfc_slr_ps = %d\n", dimm->trfc_slr_ps);
++
++	debug("DIMM: trc_ps = %d\n", dimm->trc_ps);
++	debug("DIMM: twr_ps = %d\n", dimm->twr_ps);
++
++	debug("DIMM: refresh_rate_ps = %u\n", dimm->refresh_rate_ps);
++	debug("DIMM: extended_op_srt = %u\n", dimm->extended_op_srt);
++
++	debug("DIMM: rcw = [%u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u]\n", (unsigned int)dimm->rcw[0], (unsigned int)dimm->rcw[1], (unsigned int)dimm->rcw[2], (unsigned int)dimm->rcw[3], (unsigned int)dimm->rcw[4], (unsigned int)dimm->rcw[5], (unsigned int)dimm->rcw[6], (unsigned int)dimm->rcw[7], (unsigned int)dimm->rcw[8], (unsigned int)dimm->rcw[9], (unsigned int)dimm->rcw[10], (unsigned int)dimm->rcw[11], (unsigned int)dimm->rcw[12], (unsigned int)dimm->rcw[13], (unsigned int)dimm->rcw[14], (unsigned int)dimm->rcw[15]);
++	debug("DIMM: dq_mapping = [%u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u]\n", dimm->dq_mapping[0], dimm->dq_mapping[1], dimm->dq_mapping[2], dimm->dq_mapping[3], dimm->dq_mapping[4], dimm->dq_mapping[5], dimm->dq_mapping[6], dimm->dq_mapping[7], dimm->dq_mapping[8], dimm->dq_mapping[9], dimm->dq_mapping[10], dimm->dq_mapping[11], dimm->dq_mapping[12], dimm->dq_mapping[13], dimm->dq_mapping[14], dimm->dq_mapping[15], dimm->dq_mapping[16], dimm->dq_mapping[17]);
++	debug("DIMM: dq_mapping_ors = %u\n", dimm->dq_mapping_ors);
++
+ 	debug("cal cs\n");
+ 	conf->cs_in_use = 0;
+ 	for (j = 0; j < DDRC_NUM_DIMM; j++) {
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0017-lx2160acex6-fix-dq-mapping-and-remove-invalid-spd-ee.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0017-lx2160acex6-fix-dq-mapping-and-remove-invalid-spd-ee.patch
new file mode 100644
index 000000000000..71beb94477d9
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0017-lx2160acex6-fix-dq-mapping-and-remove-invalid-spd-ee.patch
@@ -0,0 +1,36 @@
+From 65eaf1b55184950c67cb07156477418e93fa9351 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Tue, 26 Nov 2024 14:37:27 +0100
+Subject: [PATCH 17/17] lx2160acex6: fix dq mapping and remove invalid spd
+ eeprom addresses
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ plat/nxp/soc-lx2160a/lx2160acex6/ddr_init.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/plat/nxp/soc-lx2160a/lx2160acex6/ddr_init.c b/plat/nxp/soc-lx2160a/lx2160acex6/ddr_init.c
+index 61acfd7ac..95c0a13cf 100644
+--- a/plat/nxp/soc-lx2160a/lx2160acex6/ddr_init.c
++++ b/plat/nxp/soc-lx2160a/lx2160acex6/ddr_init.c
+@@ -112,7 +112,7 @@ static const struct dimm_params static_dimm = {
+ 		0x00,
+ 		0x20,
+ 		0x00,
+-		0x02,
++		0x20,
+ 		0x00,
+ 		0x20,
+ 		0x00,
+@@ -200,7 +200,7 @@ int ddr_board_options(struct ddr_info *priv)
+ 
+ long long init_ddr(void)
+ {
+-	int spd_addr[] = { 0x51, 0x52, 0x53, 0x54 };
++	int spd_addr[] = { 0x51, 0x00, 0x53, 0x00 };
+ 	struct ddr_info info;
+ 	struct sysinfo sys;
+ 	long long dram_size;
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0018-feat-build-add-support-for-new-binutils-versions.patch b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0018-feat-build-add-support-for-new-binutils-versions.patch
new file mode 120000
index 000000000000..5ef794304fba
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0018-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1 @@
+../../../../freescale/common/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
\ No newline at end of file
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
