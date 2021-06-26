Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45528C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:19:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BF5C60F58
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BF5C60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C866E404D9;
	Tue,  3 Aug 2021 23:19:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wJNTwTZxnpjQ; Tue,  3 Aug 2021 23:19:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3E844015B;
	Tue,  3 Aug 2021 23:19:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 116591BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D3F4404F3
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nfs0y2Ud5TlL for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 456D840677
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 889DF8827E; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 26 Jun 2021 17:10:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 78f477d1367a3f1a557d5d780051e4163c4aa3e3
X-Git-Newrev: cf176128ec4ad60c29c8828cab1887f69edb9473
X-Patchwork-Hint: ignore
Message-Id: <20210803210956.889DF8827E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/arm-trusted-firmware: add
 SSP option
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=cf176128ec4ad60c29c8828cab1887f69edb9473
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Buildroot sets appropriate ENABLE_STACK_PROTECTOR build flag value based
on the toolchain global BR2_SSP_* options, and all packages are built
with that setting.

However it might not be always convenient to automatically infer TF-A
stack protection from the toolchain features. For instance, secure
memory constraints may become an issue and all the extra TF-A features
need to be tuned or disabled in order to shrink TF-A firmware image.

Besides, for any value other than "none", TF-A platform specific hook
'plat_get_stack_protector_canary' must be implemented. However this hook
is not implemented by all the platforms supported by TF-A. For instance,
Allwinner currently does not provide such a hook.

Add an new option that a user can toggle to enable or disable SSP in
their ATF build. If enabled, the SSP level is automatically inherited
from the global setting.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
[yann.morin.1998@free.fr: simplify logic with a single boolean]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/arm-trusted-firmware/Config.in               | 21 +++++++++++++++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 11 ++---------
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index a5a8c5bfc3..981873fce5 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -188,4 +188,25 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
 	  Select this option if your ATF board configuration requires
 	  an ARM32 bare metal toolchain to be available.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP
+	bool "Build with SSP"
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	depends on !BR2_SSP_NONE
+	default y
+	help
+	  Say 'y' here if you want to build ATF with SSP.
+
+	  Your board must have SSP support in ATF: it must have an
+	  implementation for plat_get_stack_protector_canary().
+
+	  If you say 'y', the SSP level will be the level selected
+	  by the global SSP setting.
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_LEVEL
+	string
+	default "none"    if !BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP
+	default "default" if BR2_SSP_REGULAR
+	default "strong"  if BR2_SSP_STRONG
+	default "all"     if BR2_SSP_ALL
+
 endif
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 279658712b..1f08f5dabb 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -51,7 +51,8 @@ endif
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
-	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM)
+	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
+	ENABLE_STACK_PROTECTOR=$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_LEVEL))
 
 ifeq ($(BR2_ARM_CPU_ARMV7A),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARM_ARCH_MAJOR=7
@@ -109,14 +110,6 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
 endif
 
-ifeq ($(BR2_SSP_REGULAR),y)
-ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=default
-else ifeq ($(BR2_SSP_STRONG),y)
-ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=strong
-else ifeq ($(BR2_SSP_ALL),y)
-ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=all
-endif
-
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
