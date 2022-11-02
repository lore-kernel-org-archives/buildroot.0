Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E44C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7F2140A90;
	Wed,  2 Nov 2022 22:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7F2140A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X9FRRofdqIRv; Wed,  2 Nov 2022 22:47:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6443408DC;
	Wed,  2 Nov 2022 22:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6443408DC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD0D71BF95F
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8922E81E90
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8922E81E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kHPhzuamSn2n for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:47:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9304481E50
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9304481E50
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D8B787AA3; Wed,  2 Nov 2022 22:47:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Nov 2022 19:42:48 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1adf0b06988b43752ed02a6b9ae308e0c09f88f5
X-Git-Newrev: 416b70a4d74d526d092eb111e59d866b6329bb5e
X-Patchwork-Hint: ignore
Message-Id: <20221102224704.7D8B787AA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 boot/arm-trusted-firmware: fix SSP support
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

commit: https://git.buildroot.net/buildroot/commit/?id=416b70a4d74d526d092eb111e59d866b6329bb5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 09acc7cbc91f50305730ca0690a58fb93529034b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/arm-trusted-firmware/Config.in               | 4 ----
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 8 ++++++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index b1fc03e10b..ad87909bbf 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -213,10 +213,6 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP
 
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
index c53fe20b10..f39a24128c 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -53,10 +53,14 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
 	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM)
 
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
