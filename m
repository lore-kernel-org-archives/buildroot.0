Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE73CAC5AE
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 21:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D630360C17;
	Wed, 24 Sep 2025 21:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pgTOWusATj-A; Wed, 24 Sep 2025 21:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEC9060FE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEC9060FE2;
	Wed, 24 Sep 2025 21:18:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FED2177
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 21:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB0B640E4E
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 21:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9GPkVGGle3N8 for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 21:18:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2408740E2E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2408740E2E
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 21:18:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D59C863F7; Wed, 24 Sep 2025 21:18:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Sep 2025 23:02:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78d58820a5a053b3e574aeaf29c2d64ff7f494f2
X-Git-Newrev: 98b57fafdf882e8d15f4816e35903270999b50a4
X-Patchwork-Hint: ignore
Message-Id: <20250924211823.0D59C863F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: add support for custom zynq
 ps7_init_gpl.c
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=98b57fafdf882e8d15f4816e35903270999b50a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On Zynq, the booloader is responsible for some basic initializations, such as
enabling peripherals, DDR and configuring pinmuxes. The ps7_init_gpl.c file
(and optionally, ps7_init_gpl.h) contains the code for such initializations.

Although U-Boot contains ps7_init_gpl.c files for some boards, each of them
describes only one specific configuration. Users of a different board, or
needing a different configuration, can generate custom files using the Xilinx
Vivado development tools.

This patch adds Buildroot support for custom zynq ps7_init_gpl.c files in the
same way that is already done for zynqmp when working with custom hardware
that is not already supported by u-boot.

To test this feature, the following configs can be added to any zynq_defconfig:

BR2_TARGET_UBOOT_ZYNQ=y
BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE=<path to custom board ps7_init_gpl.c>

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/zynq/readme.txt | 21 +++++++++++----------
 boot/uboot/Config.in  | 34 ++++++++++++++++++++++++++++++++++
 boot/uboot/uboot.mk   | 12 ++++++++++++
 3 files changed, 57 insertions(+), 10 deletions(-)

diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
index 87df7236f0..085f47b09b 100644
--- a/board/zynq/readme.txt
+++ b/board/zynq/readme.txt
@@ -71,17 +71,18 @@ you need to add them by yourself.
 1) Start with a defconfig supported by Buildroot (e.g. Zedboard)
     make zynq_zed_defconfig
 
-2) make uboot-menuconfig
-    Visit the following menu and enable CONFIG_XILINX_PS_INIT_FILE
+2) make menuconfig
+    Visit the following menu to enable BR2_TARGET_UBOOT_ZYNQ
 
-    ARM architecture  --->
-       [*] Zynq/ZynqMP PS init file(s) location
+    Bootloaders  --->
+       U-Boot  --->
+           [*]   Boot on the Xilinx Zynq SoCs
 
-3) Copy ps7_init_gpl.c/h generated by the Xilinx Vivado tools into
-   output/build/uboot-custom/board/xilinx/zynq/custom_hw_platform/
+3) make menuconfig
+    In the same menu, configure BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE
 
-4) make
+    Bootloaders  --->
+       U-Boot  --->
+          (<Path to ps7_init_gpl.c>) Custom ps7_init_gpl file
 
-Note: The files in step 3 will need to be re-copied after cleaning the
-output directory and at this time, there is no way to save them as
-part of the buildroot configuration, except as a U-Boot patch.
+4) make
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 52e6050c81..18b58753a7 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -701,6 +701,40 @@ config BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE
 
 endif
 
+config BR2_TARGET_UBOOT_ZYNQ
+	bool "Boot on the Xilinx Zynq SoCs"
+	depends on BR2_arm
+	help
+	  Enable options specific to the Xilinx Zynq family of SoCs.
+
+config BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE
+	string "Custom ps7_init_gpl file"
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	depends on BR2_TARGET_UBOOT_ZYNQ
+	help
+	  On Zynq the booloader is responsible for some basic
+	  initializations, such as enabling peripherals and
+	  configuring pinmuxes. The ps7_init_gpl.c file (and,
+	  optionally, ps7_init_gpl.h) contains the code for such
+	  initializations.
+
+	  Although U-Boot contains ps7_init_gpl.c files for some
+	  boards, each of them describes only one specific
+	  configuration. Users of a different board, or needing a
+	  different configuration, can generate custom files using
+	  the Xilinx Vivado development tools.
+
+	  Set this variable to the path to your ps7_init_gpl.c file
+	  (e.g. "board/myboard/ps7_init_gpl.c"). ps7_init_gpl.h, if
+	  needed, should be in the same directory. U-Boot will build
+	  and link the user-provided file instead of the built-in.
+
+	  Leave empty to use the files provided by U-Boot.
+
+	  This feature requires commit
+	  6da4f67ad09cd8b311d77b2b04e557b7ef65b56c from upstream
+	  U-Boot, available from versions after 2018.07.
+
 config BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC
 	bool "CRC image for Altera SoC FPGA (mkpimage)"
 	depends on BR2_arm
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2796b0a310..c92568a559 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -520,6 +520,17 @@ endif
 
 endif # BR2_TARGET_UBOOT_ZYNQMP
 
+ifeq ($(BR2_TARGET_UBOOT_ZYNQ),y)
+UBOOT_ZYNQ_PS7_INIT = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE))
+UBOOT_ZYNQ_PS7_INIT_PATH = $(shell readlink -f $(UBOOT_ZYNQ_PS7_INIT))
+
+ifneq ($(UBOOT_ZYNQ_PS7_INIT),)
+define UBOOT_ZYNQ_KCONFIG_PS7_INIT
+	$(call KCONFIG_SET_OPT,CONFIG_XILINX_PS_INIT_FILE,"$(UBOOT_ZYNQ_PS7_INIT_PATH)")
+endef
+endif
+endif # BR2_TARGET_UBOOT_ZYNQ
+
 define UBOOT_INSTALL_OMAP_IFT_IMAGE
 	cp -dpf $(@D)/$(UBOOT_BIN_IFT) $(BINARIES_DIR)/
 endef
@@ -562,6 +573,7 @@ define UBOOT_KCONFIG_FIXUP_CMDS
 	$(UBOOT_ZYNQMP_KCONFIG_PMUFW)
 	$(UBOOT_ZYNQMP_KCONFIG_PM_CFG)
 	$(UBOOT_ZYNQMP_KCONFIG_PSU_INIT)
+	$(UBOOT_ZYNQ_KCONFIG_PS7_INIT)
 	$(UBOOT_KCONFIG_DEFAULT_ENV_FILE)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
