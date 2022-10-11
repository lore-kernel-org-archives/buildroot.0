Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D97C433FE
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 14:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC05B8140D;
	Tue, 11 Oct 2022 14:02:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC05B8140D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CE9x1auu7ank; Tue, 11 Oct 2022 14:02:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E827E81490;
	Tue, 11 Oct 2022 14:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E827E81490
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 366A41BF9CB
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 14:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1045B81490
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 14:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1045B81490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DEI_W0O0oKas for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 14:02:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA888813EC
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA888813EC
 for <buildroot@busybox.net>; Tue, 11 Oct 2022 14:02:29 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 46E86440537;
 Tue, 11 Oct 2022 17:00:30 +0300 (IDT)
To: buildroot@busybox.net
Date: Tue, 11 Oct 2022 17:02:10 +0300
Message-Id: <662b275967464a67a9d63efdfb0257094b16c111.1665496931.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <96728725434424ecdff6a4087126c9d665c877ec.1665496931.git.baruch@tkos.co.il>
References: <96728725434424ecdff6a4087126c9d665c877ec.1665496931.git.baruch@tkos.co.il>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1665496830;
 bh=f2XZchwCMvqXHcbBIl6NJ1Zzvsw9GD3AJag90euHzvI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZmAcNBCrQzhjq10j664LbzxQCzXiiTpVHEa6h/0MWNkkYdmrYFJP6W/8jErOKyomY
 /4NY9un+O2aH1aPknZYUhFLG5t+Xa/XstQ6Y94NhKr5eahOh4HqgS6UEaTIlFB6gLH
 qLwVNoo1jCkEqzuiKWwz7SwluaqTCv2q+MYg6EjxgbIAvizEcbN7TlRVvp03pWoOVh
 M7CxU3pqAwkEzG9OD5IpH4yTo/HFSu2SL1GTCvY9+BTdo84GQYbgzAmq6V530SyaFU
 WOUXAJcSpqj0FfmJHDt+p6NbsCPErI9KCR4ZfVAtQ1B8mOXpaCc84iEVDScItm7o26
 JKLxV5iUSRB/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=ZmAcNBCr
Subject: [Buildroot] [PATCH 2/3] configs/solidrun_{macchiatobin,
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Armada target does not provide platform level support for SSP.

Fixes link failure:

(.text.asm.update_stack_protector_canary+0x4): undefined reference to `plat_get_stack_protector_canary'

This error does not should up on CI jobs because SSP was effectively
always disabled until the previous commit.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 configs/solidrun_clearfog_gt_8k_defconfig | 1 +
 configs/solidrun_macchiatobin_defconfig   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/solidrun_clearfog_gt_8k_defconfig b/configs/solidrun_clearfog_gt_8k_defconfig
index bec4a7daccc6..30b1e17925d6 100644
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
index 7d06313b03db..f388e37163aa 100644
--- a/configs/solidrun_macchiatobin_defconfig
+++ b/configs/solidrun_macchiatobin_defconfig
@@ -12,6 +12,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS="mrvl_flash"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
+# BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is not set
 BR2_TARGET_BINARIES_MARVELL=y
 BR2_TARGET_MV_DDR_MARVELL=y
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
