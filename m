Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A72C5B552
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 19:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCA388214C;
	Mon,  9 Jun 2025 19:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9w8Z2ENpN5lH; Mon,  9 Jun 2025 19:50:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E16B982152
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E16B982152;
	Mon,  9 Jun 2025 19:50:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4D37CD
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 19:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 973AF406EA
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 19:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MorSPV32SCiN for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 19:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C90534178F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C90534178F
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 19:50:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B87368230F; Mon,  9 Jun 2025 19:50:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Jun 2025 19:02:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3ee8569037b278ea9d19b9a22a9fc7aab964b0d2
X-Git-Newrev: 526522a021edb736a6e9f8c106daa116fc0d3cbb
X-Patchwork-Hint: ignore
Message-Id: <20250609195051.B87368230F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/xilinx-prebuilt: install
 pld.pdi to target
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=526522a021edb736a6e9f8c106daa116fc0d3cbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

With the Versal Segmented Configuration, it is possible to load a PL bitstream
at run-time using the Linux fpgautil application.  Whenever Segmented
Configuration is used, both the boot.pdi and pld.pdi files will be available
to Buildroot.  For this reason, this patch improves the user experience by
installing the pld.pdi file to the target file system for run-time loading
whenever Versal Segemented Configuration is used.

If the fpgautil application is available in the target file system, it can
be used for loading the pld.pdi using the target command below.

fpgautil -b /lib/firmware/xilinx/*_pld.pdi

The source code for the fpgautil application can be found here:
https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c

Along with usage details:
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1188397412/Solution+Versal+PL+Programming

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/xilinx-prebuilt/Config.in          |  9 +++++++++
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 30 +++++++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index b95df5cbf4..b127097c7e 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -63,6 +63,15 @@ config BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION
 
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
+config BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI
+	bool "install versal pld.pdi"
+	depends on BR2_TARGET_XILINX_PREBUILT_VERSAL
+	help
+	  When using the Versal Segmented Configuration, there is a
+	  pld.pdi file containing the FPGA bitstream which can be
+	  loaded at run-time.  By enabling this option, the pld.pdi
+	  will be installed to the target /lib/firmware/xilinx dir.
+
 config BR2_TARGET_XILINX_PREBUILT_FAMILY
 	string
 	default "zynqmp" if BR2_TARGET_XILINX_PREBUILT_ZYNQMP
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 05dc9aebe8..62b60b88fa 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -19,7 +19,6 @@ XILINX_PREBUILT_LICENSE = MIT
 XILINX_PREBUILT_LICENSE_FILES = LICENSE
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
-XILINX_PREBUILT_INSTALL_TARGET = NO
 XILINX_PREBUILT_INSTALL_IMAGES = YES
 
 XILINX_PREBUILT_FAMILY = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_FAMILY))
@@ -48,6 +47,18 @@ define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
 		) \
 		$(BINARIES_DIR)/boot.pdi
 endef
+
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI),y)
+# Install pld.pdi in target file system for run-time loading when using
+# Versal Segmented Configuration.
+define XILINX_PREBUILT_INSTALL_VERSAL_XSA_PLD_PDI
+	$(if $(wildcard $(@D)/*_pld.pdi),
+		mkdir -p $(TARGET_DIR)/lib/firmware/xilinx && \
+		$(INSTALL) -D -m 0644 $(@D)/*_pld.pdi \
+			$(TARGET_DIR)/lib/firmware/xilinx
+	)
+endef
+endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
@@ -63,6 +74,18 @@ define XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI
 		) \
 		$(BINARIES_DIR)/boot.pdi
 endef
+
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI),y)
+# Install pld.pdi in target file system for run-time loading when using
+# Versal Segmented Configuration.
+define XILINX_PREBUILT_INSTALL_VERSAL_PLD_PDI
+	$(if $(wildcard $(XILINX_PREBUILT_BOARD_DIR)/*_pld.pdi),
+		mkdir -p $(TARGET_DIR)/lib/firmware/xilinx && \
+		$(INSTALL) -D -m 0644 $(XILINX_PREBUILT_BOARD_DIR)/*_pld.pdi \
+			$(TARGET_DIR)/lib/firmware/xilinx
+	)
+endef
+endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
@@ -96,4 +119,9 @@ define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
 	$(XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW)
 endef
 
+define XILINX_PREBUILT_INSTALL_TARGET_CMDS
+	$(XILINX_PREBUILT_INSTALL_VERSAL_PLD_PDI)
+	$(XILINX_PREBUILT_INSTALL_VERSAL_XSA_PLD_PDI)
+endef
+
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
