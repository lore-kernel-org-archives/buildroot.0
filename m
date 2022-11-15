Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A1AC433FE
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 13:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6A7F40A8A;
	Tue, 15 Nov 2022 13:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6A7F40A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30EKpjRk-o7e; Tue, 15 Nov 2022 13:27:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 094E340A99;
	Tue, 15 Nov 2022 13:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 094E340A99
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7BB4F1BF951
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56BEE403EC
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56BEE403EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXNYG1wuhbfS for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 13:26:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B38040872
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 13:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B38040872
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A29F83CA0; Tue, 15 Nov 2022 13:26:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Nov 2022 14:06:19 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 72842461de91209709d2055ed7377a441d5cb3cd
X-Git-Newrev: 7fcd29cb57c50b8e9dea84878b8b54e4fed0ec3c
X-Patchwork-Hint: ignore
Message-Id: <20221115132631.3A29F83CA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x]
 boot/arm-trusted-firmware: fix SSP disable in v2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7fcd29cb57c50b8e9dea84878b8b54e4fed0ec3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
(cherry picked from commit 5e330ff030d11193ce716822c932c2a6b0f109c9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 6225d60560..af31d59f67 100644
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
