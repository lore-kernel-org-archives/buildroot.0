Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264C4CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0E8042D56;
	Sat, 30 May 2026 20:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k8uH2eMeET5O; Sat, 30 May 2026 20:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D07742EB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780173627;
	bh=u0naTRJ8gDreu6Pu8jm78Xq3dbXyp2cHazRCIK30GWU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HxLAJlK2cx2zNFQLi+1ravkED5bmi3Fp0Y9G5EtddwsZa2wC9MRx0LzECwAvibmFT
	 psgHE6lNDrAY5fRIuG0vrInRjMpcXvseGmymdcpsGcjkcgeG74FWRHuYH+kdZb+CK6
	 VhDfs+GMmIulCz0JkKzgVxprMu525cEZ5sBBXCGNAF3L5GEkBg032yViCP2gWUysQN
	 g6f1I2IeqhA1xI+M9/bpPBvQUS1Q88IN0os4MKBA5IOplV9Q4Rr0JDTa51Ui5t7HCJ
	 jsvCK52I7iOqlaWyc5nLH5/Bm912cDpMuyEpu387EsVpl90rN2ptuO14fkIAfgEEqq
	 TahHJJ7zZRwAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D07742EB5;
	Sat, 30 May 2026 20:40:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1390EF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED9CD42670
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:40:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVd_gN-skzhq for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:40:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2024F4010F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2024F4010F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:40:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9BF78752D; Sat, 30 May 2026 20:40:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 22:39:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 646ea396c14b0da0016f42eba2b147c8767e6dfb
X-Git-Newrev: e60515bbf51998a1ce098d7ea1683a67aff50de8
X-Patchwork-Hint: ignore
Message-Id: <20260530204010.D9BF78752D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: correct cpe-id
 version logic
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e60515bbf51998a1ce098d7ea1683a67aff50de8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 53bb7eafb2 ("package/arm-trusted-firmware: add
ARM_TRUSTED_FIRMWARE_CPE_ID_*") added logic to set the cpe-id version from
the package version by dropping a v or lts- prefix, but it used subst
instead of patsubst - So it would replace "v" and "lts-" anywhere in the
version and not only in the beginning of it.

Change to patsubst to fix that.

E.G. with the following defconfig:
BR2_aarch64=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="version-with-v-or-lts-in-it"

before:
make printvars VARS=ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION
ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION=ersion-with--or-in-it

after:
make printvars VARS=ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION
ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION=ersion-with-v-or-lts-in-it

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index c3c4a581da..1b52f36783 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -8,7 +8,7 @@ ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_V
 ARM_TRUSTED_FIRMWARE_CPE_ID_PREFIX = cpe:2.3:o
 ARM_TRUSTED_FIRMWARE_CPE_ID_VENDOR = arm
 ARM_TRUSTED_FIRMWARE_CPE_ID_PRODUCT = trusted_firmware-a
-ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION = $(subst v,,$(subst lts-,,$(ARM_TRUSTED_FIRMWARE_VERSION)))
+ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION = $(patsubst v%,%,$(patsubst lts-%,%,$(ARM_TRUSTED_FIRMWARE_VERSION)))
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL),y)
 # Handle custom ATF tarballs as specified by the configuration
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
