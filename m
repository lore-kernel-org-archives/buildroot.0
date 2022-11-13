Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645E7C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 083C742ACC;
	Mon, 20 Feb 2023 21:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 083C742ACC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2t_ioeSYcKvi; Mon, 20 Feb 2023 21:10:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EC5142AC9;
	Mon, 20 Feb 2023 21:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EC5142AC9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15ABE1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 735C140C2E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 735C140C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qCbbYippAD_S for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D5DD411A1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D5DD411A1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 533BB86495; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 21:54:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a0d1c6288a9adfb54dc9d98b8c4f5531eb4c9cba
X-Git-Newrev: 5e330ff030d11193ce716822c932c2a6b0f109c9
X-Patchwork-Hint: ignore
Message-Id: <20230220205150.533BB86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/arm-trusted-firmware: fix
 SSP disable in v2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e330ff030d11193ce716822c932c2a6b0f109c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

ATF version 2.2 and older does not disable SSP when
ENABLE_STACK_PROTECTOR is not set. This is because the compiler enables
SSP by default, and ATF does not pass -fno-stack-protector to the
compiler. Upstream commit 7af195e29a42 ("Disable stack protection
explicitly") fixed the issue for v2.3 and newer.

Add -fno-stack-protector in CFLAGS when
BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is not set to fix older ATF
versions.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821171

Cc: Dick Olsson <hi@senzilla.io>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 34d7d80243..1164c81410 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -67,11 +67,17 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	ENABLE_STACK_PROTECTOR=$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_LEVEL))
+else
+ARM_TRUSTED_FIRMWARE_CFLAGS += -fno-stack-protector
+endif
+
+ifeq ($(BR2_PIC_PIE),y)
+ARM_TRUSTED_FIRMWARE_CFLAGS += -fno-PIE
 endif
 
 ARM_TRUSTED_FIRMWARE_MAKE_ENV += \
 	$(TARGET_MAKE_ENV) \
-	$(if $(BR2_PIC_PIE),CFLAGS="-fno-PIE")
+	CFLAGS="$(ARM_TRUSTED_FIRMWARE_CFLAGS)"
 
 ifeq ($(BR2_ARM_CPU_ARMV7A),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARM_ARCH_MAJOR=7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
