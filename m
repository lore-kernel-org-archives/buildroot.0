Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C31C71131
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 19:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A8BB61501;
	Mon,  9 Jun 2025 19:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TpIiv7LOyxoo; Mon,  9 Jun 2025 19:50:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FE3E614F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FE3E614F6;
	Mon,  9 Jun 2025 19:50:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42F10CD
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 19:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34D7D406EA
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 19:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTf_O4MgT9fW for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 19:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3C1B4090A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3C1B4090A
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 19:50:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A32FF87AFF; Mon,  9 Jun 2025 19:50:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Jun 2025 19:02:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6646d0b90f9a70240103b8dff9779a905a81c10e
X-Git-Newrev: a0a92928dbbfa17e054208c6156e65b70ac5380b
X-Patchwork-Hint: ignore
Message-Id: <20250609195051.A32FF87AFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/xilinx-prebuilt: add
 segmented config support
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0a92928dbbfa17e054208c6156e65b70ac5380b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

AMD has created a new segmented configuration for Versal products.  It splits
the Vivado hardware design into two PDI files, one containing the minimal
required configuration for the DDR and booting the processors, and a second PDI
file which contains the rest of the FPGA design and can be loaded at run-time
via U-boot or Linux.

The file names generated when using the Vivado Segmented Configuration are as
follows:

<design>_boot.pdi - Minimal DDR and PS config for booting
<design>_pld.pdi - Remainder of FPGA design to be loaded at run-time

Since two PDI files will be included in the XSA file when using Segmented
Configuration, the xilinx-prebuilt package needs to be updated to support
this feature.

For Buildroot purposes, the <design>_boot.pdi is the file that needs to be
included in the boot.bin for booting the processors, so this patch checks
for a file named *boot*.pdi which will indicate that Segmented Configuration
is being used and will make sure to use the <design>_boot.pdi file and not
the <design>_pld.pdi file when generating the boot.bin image.

If no pdi files contain the word "boot" in the filename, it can be assumed
that Segmented Configuration is not being used, so the single file *.pdi
method is the appropriate one for this case, and this patch is thus
backwards compatible with prior designs not using Segmented Configuration.

Also, Segmented Configuration is going to become the default mode for Versal
products, so the xilinx-prebuilt github location will also soon have two PDI
files for each board.  For this reason, this patch is also handling Segmented
Configuration for files downloaded from the xilinx-prebuilt repo.

For further information about the AMD Segmented Configuration, please see the
github tutorial below.

https://github.com/Xilinx/Vivado-Design-Tutorials/tree/2024.2/Versal/Boot_and_Config/Segmented_Configuration

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 36 ++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 72273f0d2f..4d1dfc5ca0 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -28,9 +28,6 @@ XILINX_PREBUILT_BOARD = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_BOARD))
 XILINX_PREBUILT_BOARD_DIR = $(@D)/$(XILINX_PREBUILT_BOARD)-$(XILINX_PREBUILT_FAMILY)
 
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
-# We need the *.pdi glob, because the file has different names for the
-# different boards, but there is only one, and it has to be named
-# vpl_gen_fixed.pdi when installed.
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
 XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
 # Unlike the psmfw.elf file for Xilinx development boards,
@@ -39,11 +36,33 @@ XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
 # so to support current and future AMD Vivado versions, the filename
 # psm*fw.elf is used.
 XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm*fw.elf
-XILINX_PREBUILT_PDI = $(@D)/*.pdi
+# We need the *.pdi glob, because the file has different names for the
+# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# If Segmented Configuration is used, there will be two pdi files and we need
+# the file that has "_boot.pdi" in the filename.
+define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
+	$(INSTALL) -D -m 0644 \
+		$(if $(wildcard $(@D)/*_boot.pdi), \
+			$(@D)/*_boot.pdi, \
+			$(@D)/*.pdi \
+		) \
+		$(BINARIES_DIR)/vpl_gen_fixed.pdi
+endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
-XILINX_PREBUILT_PDI = $(XILINX_PREBUILT_BOARD_DIR)/*.pdi
+# We need the *.pdi glob, because the file has different names for the
+# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# If Segmented Configuration is used, there will be two pdi files and we need
+# the file that has "_boot.pdi" in the filename.
+define XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI
+	$(INSTALL) -D -m 0644 \
+		$(if $(wildcard $(XILINX_PREBUILT_BOARD_DIR)/*_boot.pdi), \
+			$(XILINX_PREBUILT_BOARD_DIR)/*_boot.pdi, \
+			$(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
+		) \
+		$(BINARIES_DIR)/vpl_gen_fixed.pdi
+endef
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
@@ -60,10 +79,6 @@ define XILINX_PREBUILT_INSTALL_VERSAL_PSMFW
 endef
 endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 
-define XILINX_PREBUILT_INSTALL_VERSAL_PDI
-	$(INSTALL) -D -m 0644 $(XILINX_PREBUILT_PDI) \
-		$(BINARIES_DIR)/vpl_gen_fixed.pdi
-endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
 define XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW
@@ -76,7 +91,8 @@ endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
 define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
 	$(XILINX_PREBUILT_INSTALL_VERSAL_PLM)
 	$(XILINX_PREBUILT_INSTALL_VERSAL_PSMFW)
-	$(XILINX_PREBUILT_INSTALL_VERSAL_PDI)
+	$(XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI)
+	$(XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI)
 	$(XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
