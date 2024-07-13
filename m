Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A50C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86BDC400BA;
	Sat, 13 Jul 2024 19:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4K3Y6IbmpPC; Sat, 13 Jul 2024 19:51:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AA00401ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AA00401ED;
	Sat, 13 Jul 2024 19:51:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A5781BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 145C881204
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmT68EqkQYQ7 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:51:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD6D68116B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD6D68116B
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:51:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0C4386563; Sat, 13 Jul 2024 19:51:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 21:50:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fb08cdc85fab4ba1460cd15e0829494afc0fdf2
X-Git-Newrev: 1dcb311afe1043bf369099eec8b6fa6a06adc0fb
X-Patchwork-Hint: ignore
Message-Id: <20240713195105.C0C4386563@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/xilinx-prebuilt: support custom
 boards using XSA
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1dcb311afe1043bf369099eec8b6fa6a06adc0fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The xilinx-prebuilt package only supports development boards that Xilinx
has published firmware for. Custom designs based on the Xilinx platform
must generate their own firmware using the AMD Vivado Design Suite.

Vivado produces an XSA file, which is a Zip file containing all the
firmware needed by xilinx-prebuilt. We extend xilinx-prebuilt to
download custom XSA files and extract their contents.

Reviewed-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
[Romain: add a comment about the custom PSMFW file name.]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/xilinx-prebuilt/Config.in          | 24 ++++++++++++++++++++++++
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 29 ++++++++++++++++++++++++++---
 2 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index d3df1c06e7..94ef3dd111 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -31,6 +31,30 @@ config BR2_TARGET_XILINX_PREBUILT_VERSAL
 
 endchoice
 
+config BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
+	bool "download a prebuilt Versal XSA"
+	depends on BR2_TARGET_XILINX_PREBUILT_VERSAL
+	help
+	  The Xilinx Support Archive (XSA) provides custom Xilinx
+	  firmware files generated by the AMD Vivado Design Suite.
+
+	  https://docs.amd.com/r/en-US/ug1400-vitis-embedded/Creating-a-Hardware-Design-XSA-File
+
+if BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
+
+config BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION
+	string "URL of custom XSA"
+	help
+	  This option allows to specify a URL pointing to an XSA source
+	  file. This URL can use any protocol recognized by Buildroot,
+	  like http://, ftp://, file:// or scp://.
+
+	  When pointing to a local XSA using file://, you may want to
+	  use a make variable like $(TOPDIR) to reference the root of
+	  the Buildroot tree.
+
+endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
+
 config BR2_TARGET_XILINX_PREBUILT_FAMILY
 	string
 	default "zynqmp" if BR2_TARGET_XILINX_PREBUILT_ZYNQMP
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index d09f4b13e2..0b0e85b820 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -5,9 +5,20 @@
 ################################################################################
 
 XILINX_PREBUILT_VERSION = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_VERSION))
+
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
+XILINX_PREBUILT_FILE = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION))
+XILINX_PREBUILT_SITE = $(patsubst %/,%,$(dir $(XILINX_PREBUILT_FILE)))
+XILINX_PREBUILT_SOURCE = $(notdir $(XILINX_PREBUILT_FILE))
+define XILINX_PREBUILT_EXTRACT_CMDS
+	$(UNZIP) $(XILINX_PREBUILT_DL_DIR)/$(XILINX_PREBUILT_SOURCE) -d $(@D)
+endef
+else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 XILINX_PREBUILT_SITE = $(call github,Xilinx,soc-prebuilt-firmware,$(XILINX_PREBUILT_VERSION))
 XILINX_PREBUILT_LICENSE = MIT
 XILINX_PREBUILT_LICENSE_FILES = LICENSE
+endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
+
 XILINX_PREBUILT_INSTALL_TARGET = NO
 XILINX_PREBUILT_INSTALL_IMAGES = YES
 
@@ -20,12 +31,24 @@ ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
 # We need the *.pdi glob, because the file has different names for the
 # different boards, but there is only one, and it has to be named
 # vpl_gen_fixed.pdi when installed.
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
+XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
+# Unlike the psmfw.elf file for Xilinx development boards,
+# AMD Vivado Design Suite generates a file named psm_fw.elf.
+XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm_fw.elf
+XILINX_PREBUILT_PDI = $(@D)/*.pdi
+else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
+XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
+XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
+XILINX_PREBUILT_PDI = $(XILINX_PREBUILT_BOARD_DIR)/*.pdi
+endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
+
 define XILINX_PREBUILT_INSTALL
-	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/plm.elf \
+	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_PLM) \
 		$(BINARIES_DIR)/plm.elf
-	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf \
+	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_PSMFW) \
 		$(BINARIES_DIR)/psmfw.elf
-	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
+	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_PDI) \
 		$(BINARIES_DIR)/vpl_gen_fixed.pdi
 endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
