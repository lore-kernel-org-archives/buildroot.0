Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63506C04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 15:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E957240B86;
	Sat, 30 Jul 2022 15:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E957240B86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6R9Z5DRs12VV; Sat, 30 Jul 2022 15:02:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA3EE40217;
	Sat, 30 Jul 2022 15:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA3EE40217
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 20AA51BF3D2
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 15:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFC03832E7
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 15:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFC03832E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Go8Wvxb7KU82 for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 15:02:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3475C8322E
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 15:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3475C8322E
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 046F6869CD; Sat, 30 Jul 2022 14:48:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Jul 2022 17:02:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 991b7b990ad8cd4a37564cd91d5bb0ee7e1e9f11
X-Git-Newrev: 4d919211edc362abd2f3226a2376a15d0b3365ca
X-Patchwork-Hint: ignore
Message-Id: <20220730144816.046F6869CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: set CFLAGS from
 environment, not override
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d919211edc362abd2f3226a2376a15d0b3365ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Older versions of TF-A don't support setting CFLAGS on the make command
line. They use 'CFLAGS += ...' in the Makefile, which is still
overridden by the CFLAGS on the command line.

Fix this by moving the CFLAGS setting to the environment. Both older and
newer versions of TF-A handle this correctly.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800954
and a large number of other defconfigs

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 6b0405a44a..7c4e7edb00 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -60,13 +60,13 @@ endif
 
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	$(if $(BR2_PIC_PIE),CFLAGS="-fno-PIE") \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
 	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
 	TARGET_BOARD=$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)
 
 ARM_TRUSTED_FIRMWARE_MAKE_ENV += \
 	$(TARGET_MAKE_ENV) \
+	$(if $(BR2_PIC_PIE),CFLAGS="-fno-PIE") \
 	ENABLE_STACK_PROTECTOR=$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_LEVEL))
 
 ifeq ($(BR2_ARM_CPU_ARMV7A),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
