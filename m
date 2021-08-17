Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A04CC4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:29:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC33560F39
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC33560F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A514C401CF;
	Tue, 17 Aug 2021 07:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IgVCY-eO-5B5; Tue, 17 Aug 2021 07:28:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10A7E40295;
	Tue, 17 Aug 2021 07:28:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D8E941BF33E
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD7224051D
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xvlpfV6xjjHm for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 07:28:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28D83404C4
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 07:28:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CC1C18D33B; Tue, 17 Aug 2021 07:28:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 09:24:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a3d1f34bcd5c5305b07ba268fa47d6c42a7f7ca
X-Git-Newrev: ccac9a5bbbd7374187a0f0017101ece0c202851d
X-Patchwork-Hint: ignore
Message-Id: <20210817072812.CC1C18D33B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: don't force
 ENABLE_STACK_PROTECTOR
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8518279446123517600=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============8518279446123517600==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ccac9a5bbbd7374187a0f0017101ece0c202851d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5f432df7e2d2 ("boot/arm-trusted-firmware: change
ENABLE_STACK_PROTECTOR value when disabled") set
ENABLE_STACK_PROTECTOR=0 when disabled. But since we pass this value as
MAKE_OPT, the internal ATF logic that sets ENABLE_STACK_PROTECTOR again
based on its initial value breaks. This leads to build failure:

make[1]: *** [/builds/buildroot.org/buildroot/output/build/arm-trusted-firmware-v2.4/build/a80x0_mcbin/release/libc/assert.o] Error 1
aarch64-buildroot-linux-uclibc-gcc.br_real: error: unrecognized command-line option ‘-fstack-protector-0’; did you mean ‘-fstack-protector’?

Move ENABLE_STACK_PROTECTOR to make environment instead to allow make to
change its value.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1497663294

Cc: Dick Olsson <hi@senzilla.io>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 1f08f5dabb..00b68a30af 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -51,7 +51,10 @@ endif
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
-	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
+	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM)
+
+ARM_TRUSTED_FIRMWARE_MAKE_ENV += \
+	$(TARGET_MAKE_ENV) \
 	ENABLE_STACK_PROTECTOR=$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_LEVEL))
 
 ifeq ($(BR2_ARM_CPU_ARMV7A),y)
@@ -164,7 +167,8 @@ ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += \
 
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 	$(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
+	$(ARM_TRUSTED_FIRMWARE_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
 		$(ARM_TRUSTED_FIRMWARE_MAKE_TARGETS)
 	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_BUILD)
 endef

--===============8518279446123517600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============8518279446123517600==--
