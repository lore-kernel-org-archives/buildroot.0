Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2275C19F29
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ACB1408F5;
	Tue, 26 Jul 2022 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ACB1408F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZbhrauW_ZxxN; Tue, 26 Jul 2022 20:52:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12786408F1;
	Tue, 26 Jul 2022 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12786408F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 608841BF3EF
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A286408F1
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A286408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x0g6RByR2hXf for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:52:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BB2540226
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BB2540226
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8D21A85FF8; Tue, 26 Jul 2022 20:39:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 22:51:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89c5bfe3e429ab29a00b62c206670d3bc1f0db7f
X-Git-Newrev: 9e315b0cad9b04105b5184e0a2d086c96f4b24c0
X-Patchwork-Hint: ignore
Message-Id: <20220726203900.8D21A85FF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: allow enabling
 without uboot or edk2
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e315b0cad9b04105b5184e0a2d086c96f4b24c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It should be possible to compile ARM_TRUSTED_FIRMWARE without u-boot or EDK2.
For example, one might want to produce "bl31.bin" for use as an init stub for
the Raspberry Pi 4.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 2f77b0242a..100ac83482 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -1,7 +1,6 @@
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE
 	bool "ARM Trusted Firmware (ATF)"
-	depends on (BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A) && \
-		   (BR2_TARGET_UBOOT || BR2_TARGET_EDK2)
+	depends on (BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A)
 	help
 	  Enable this option if you want to build the ATF for your ARM
 	  based embedded device.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
