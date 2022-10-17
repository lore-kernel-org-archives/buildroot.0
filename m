Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AD4C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 08:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DA4560C1A;
	Mon, 17 Oct 2022 08:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DA4560C1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sEZqoZkIviK7; Mon, 17 Oct 2022 08:38:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB88160F2F;
	Mon, 17 Oct 2022 08:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB88160F2F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B006F1BF97F
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 08:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98342416FD
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 08:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98342416FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kmvy0WtVoS_E for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 08:38:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0419416F2
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 08:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0419416F2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DA0B86DF8; Mon, 17 Oct 2022 08:38:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 10:31:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09acc7cbc91f50305730ca0690a58fb93529034b
X-Git-Newrev: 9883ff708e300b93247b4463dc7dcf1681c32354
X-Patchwork-Hint: ignore
Message-Id: <20221017083837.8DA0B86DF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/solidrun_{macchiatobin,
 clearfog_gt_8k}: disable SSP
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9883ff708e300b93247b4463dc7dcf1681c32354
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Armada target does not provide platform level support for SSP.

Fixes link failure:

(.text.asm.update_stack_protector_canary+0x4): undefined reference to `plat_get_stack_protector_canary'

This error does not show up on CI jobs because SSP was effectively always
disabled until the previous commit.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/solidrun_clearfog_gt_8k_defconfig | 1 +
 configs/solidrun_macchiatobin_defconfig   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/solidrun_clearfog_gt_8k_defconfig b/configs/solidrun_clearfog_gt_8k_defconfig
index bec4a7dacc..30b1e17925 100644
--- a/configs/solidrun_clearfog_gt_8k_defconfig
+++ b/configs/solidrun_clearfog_gt_8k_defconfig
@@ -12,6 +12,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS="mrvl_flash"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
+# BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is not set
 BR2_TARGET_BINARIES_MARVELL=y
 BR2_TARGET_MV_DDR_MARVELL=y
 
diff --git a/configs/solidrun_macchiatobin_defconfig b/configs/solidrun_macchiatobin_defconfig
index 7d06313b03..f388e37163 100644
--- a/configs/solidrun_macchiatobin_defconfig
+++ b/configs/solidrun_macchiatobin_defconfig
@@ -12,6 +12,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS="mrvl_flash"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
+# BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is not set
 BR2_TARGET_BINARIES_MARVELL=y
 BR2_TARGET_MV_DDR_MARVELL=y
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
