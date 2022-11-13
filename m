Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A9EC4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 19:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7235F404DD;
	Sun, 13 Nov 2022 19:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7235F404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sLgMHg7aqUAI; Sun, 13 Nov 2022 19:10:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B30F0404B0;
	Sun, 13 Nov 2022 19:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B30F0404B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 025E71BF318
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 19:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB18D81335
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 19:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB18D81335
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UV8Lfo8l-ZFT for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 19:10:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C733180072
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C733180072
 for <buildroot@busybox.net>; Sun, 13 Nov 2022 19:10:04 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 3A19B4405F3;
 Sun, 13 Nov 2022 21:07:28 +0200 (IST)
To: buildroot@busybox.net
Date: Sun, 13 Nov 2022 21:09:54 +0200
Message-Id: <a165e1785fec7f9b4ce3e38f1282c5ab87bff511.1668366594.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1668366448;
 bh=aeXqtg06XPgnZEyD7Hv69UTGQu2T+7cqg+DIqt0XWcQ=;
 h=From:To:Cc:Subject:Date:From;
 b=b8ZgJfnoOldMNy8eidiK25vmwD0T9x/V0Xkd6eOQZ9r80DTiS+lhSI23tl3/DF8E+
 GTIySeY8ppGWeK2V9FHa/MsL3vVec0HPj/lxxtybgkoo13yBMQ4qAVFV4JV3UYZDQz
 FzIY0PaHau/ie35Ek28BVj4KoEPRt8pGN2sZc+TrH5t1gEMnaxd/+3l55dilonExDX
 QkgfyWiskwvhn+oryS7Z+q5VYKXN8/serUYmyXLFZgmrvSnxgNGp0/PnoIP1BcPSmF
 4mx9uksElsyztvaumOM7mR0lfXkjZffAkYTihswDZYcIAbyIMckCGXl/deaXNsuMkJ
 ydDbQb2SPVP8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=b8ZgJfno
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: fix SSP disable in
 v2.2
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 34d7d80243d4..1164c8141061 100644
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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
