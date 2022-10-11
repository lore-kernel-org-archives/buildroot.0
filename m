Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4386FC433FE
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 14:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFD5E40BB8;
	Tue, 11 Oct 2022 14:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFD5E40BB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FN76fl1PzSpS; Tue, 11 Oct 2022 14:02:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 131E040AF7;
	Tue, 11 Oct 2022 14:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 131E040AF7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1503E1BF9CB
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 14:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92DEA813EC
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 14:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92DEA813EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-e8EEV7Lpg6 for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 14:02:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF37E813C0
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF37E813C0
 for <buildroot@busybox.net>; Tue, 11 Oct 2022 14:02:29 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id E6FA044051F;
 Tue, 11 Oct 2022 17:00:29 +0300 (IDT)
To: buildroot@busybox.net
Date: Tue, 11 Oct 2022 17:02:09 +0300
Message-Id: <96728725434424ecdff6a4087126c9d665c877ec.1665496931.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1665496830;
 bh=3VVpSh6mc7d641m8ukotbKXiAn3XtWgnqCzBxDHryI0=;
 h=From:To:Cc:Subject:Date:From;
 b=hAgdd4J+oaTGaBYdvlMFLv0iJEV0xTzgLoinEsw9OBMi5Vzrzdf252vmemQYTG5+g
 Ubrezf2s6AoufhgQVA61jLpXcth4HkGOEUBd9hb0vBKO6rLnDiaWU3o+nZjhfn4aTO
 TGrHweDCg1+gMSdMAnjNti9lpJ1zY2XFcAnJabRidQ82vwVB2SEvvUDwH4VYQ0B6tl
 9mEa0vys+6WLcdnx+1mHvMhMdCn093srS5Xk4WpC6qPys7PW2Mtd3PTNC+nrLqMY3+
 pRM/s4nhEOIHCOljDT9ADIUDzgM49s2DOP2FTG1rDM/VanG4v1EDvadeyOgAIvTlcY
 SBsgHBdJlRimg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=hAgdd4J+
Subject: [Buildroot] [PATCH 1/3] boot/arm-trusted-firmware: fix SSP support
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

Commit ccac9a5bbbd ("boot/arm-trusted-firmware: don't force
ENABLE_STACK_PROTECTOR") fixed a build failure but also effectively
disabled SSP entirely for ATF. This is because ENABLE_STACK_PROTECTOR is
set to 0 unconditionally in make_helpers/defaults.mk, overwriting any
environment set value. So we must pass ENABLE_STACK_PROTECTOR in
MAKE_OPTS for it to be effective. But to avoid said build failure we
can't pass ENABLE_STACK_PROTECTOR=0.

Only pass ENABLE_STACK_PROTECTOR when
BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is enabled. Drop SSP_LEVEL value for
the !BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP case which is now unused.

Cc: Dick Olsson <hi@senzilla.io>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 boot/arm-trusted-firmware/Config.in               | 4 ----
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 8 ++++++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index aa571502b345..5070849d9b43 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -226,10 +226,6 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_LEVEL
 	string
-	# While newer versions of TF-A support "none" as
-	# ENABLE_STACK_PROTECTOR value, older versions (e.g 2.0) only
-	# supported "0" to disable SSP.
-	default "0"    	  if !BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP
 	default "default" if BR2_SSP_REGULAR
 	default "strong"  if BR2_SSP_STRONG
 	default "all"     if BR2_SSP_ALL
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 246c0699bb4a..34d7d80243d4 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -64,10 +64,14 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
 	TARGET_BOARD=$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
+	ENABLE_STACK_PROTECTOR=$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_LEVEL))
+endif
+
 ARM_TRUSTED_FIRMWARE_MAKE_ENV += \
 	$(TARGET_MAKE_ENV) \
-	$(if $(BR2_PIC_PIE),CFLAGS="-fno-PIE") \
-	ENABLE_STACK_PROTECTOR=$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_LEVEL))
+	$(if $(BR2_PIC_PIE),CFLAGS="-fno-PIE")
 
 ifeq ($(BR2_ARM_CPU_ARMV7A),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARM_ARCH_MAJOR=7
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
