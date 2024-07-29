Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F79C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 17:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 744926085A;
	Mon, 29 Jul 2024 17:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eV0LVmnKfZ1W; Mon, 29 Jul 2024 17:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BBC56086B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BBC56086B;
	Mon, 29 Jul 2024 17:43:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 390251BF424
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 318BD81180
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xHxVjRuR9BFf for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 17:43:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3891A81176
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3891A81176
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 17:43:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F5E18289C; Mon, 29 Jul 2024 17:43:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 19:43:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 520ca083dfec4ad5ce7977bed478e2285ce93b07
X-Git-Newrev: 549e4d8d9ed4f9dbca92cb85cc7fa414a9582915
X-Patchwork-Hint: ignore
Message-Id: <20240729174330.1F5E18289C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/xilinx-prebuilt: support future AMD
 Vivado versions
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=549e4d8d9ed4f9dbca92cb85cc7fa414a9582915
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When creating a hardware platform for AMD Versal devices with the AMD Vivado
Design Suite, the resulting XSA file has a file named "psm_fw.elf" included.
This does not match the "psmfw.elf" filename that users will get when building
the boot firmware from the Xilinx GIT repository.

A change request has been submitted to resolve this issue, so that future
AMD Vivado Design Suite versions will generate XSA files including the boot
firmware file named "psmfw.elf" to match the filename that is generated when
building the firmware.

In order to support both current and future versions of AMD Vivado Design
Suite, this patch changes the xilinx-prebuilt package to use the filename
"psm*fw.elf" when obtaining the Versal boot firmware images from a user
generated XSA file.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 0b0e85b820..9f36ee7285 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -34,8 +34,11 @@ ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
 XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
 # Unlike the psmfw.elf file for Xilinx development boards,
-# AMD Vivado Design Suite generates a file named psm_fw.elf.
-XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm_fw.elf
+# AMD Vivado Design Suite currently generates a file named psm_fw.elf.
+# Future versions of AMD Vivado will generate a file named psmfw.elf,
+# so to support current and future AMD Vivado versions, the filename
+# psm*fw.elf is used.
+XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm*fw.elf
 XILINX_PREBUILT_PDI = $(@D)/*.pdi
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
