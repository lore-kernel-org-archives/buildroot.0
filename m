Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A4AC43219
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2289140B48;
	Wed,  2 Nov 2022 22:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2289140B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IHjsKUbvkoix; Wed,  2 Nov 2022 22:48:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D83640B2F;
	Wed,  2 Nov 2022 22:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D83640B2F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F8F91BF471
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A99B41721
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A99B41721
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mgxk793Wi2kW for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:48:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25B8B41717
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25B8B41717
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1408487ACE; Wed,  2 Nov 2022 22:48:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Nov 2022 19:42:40 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 69d4f8f9b04946144348f7b194d27ddeb29b0b74
X-Git-Newrev: 75d099fa674abb61c54376a39bcb055b78c34486
X-Patchwork-Hint: ignore
Message-Id: <20221102224807.1408487ACE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=75d099fa674abb61c54376a39bcb055b78c34486
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
index 100ac83482..a87181d0db 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -218,10 +218,6 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP
 
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
index 7c4e7edb00..6225d60560 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
