Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEB9C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:27:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64E7660FE8
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64E7660FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35419401BB;
	Thu, 19 Aug 2021 21:27:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vW1WqXDqVxzb; Thu, 19 Aug 2021 21:27:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A5A74023F;
	Thu, 19 Aug 2021 21:27:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EBF51BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DEE542514
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JmVqneczVLmN for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:27:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68E1F407A4
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:27:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 175388D68A; Thu, 19 Aug 2021 21:27:01 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 23:27:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 68933bf19560c180379c34906281d49187a4e6ea
X-Git-Newrev: 82f5b3724bfe3ab262a384af61f3d2faf9c6c0a5
X-Patchwork-Hint: ignore
Message-Id: <20210819212701.175388D68A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/arm-trusted-firmware: Add
 out-of-source ATF device tree support
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

commit: https://git.buildroot.net/buildroot/commit/?id=82f5b3724bfe3ab262a384af61f3d2faf9c6c0a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Similarly to Uboot, this patch adds the ability to copy in and build
out-of-source device tree sources during an ATF build.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/Config.in               | 9 +++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 7e46a10270..20a121c2fc 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -68,6 +68,15 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM
 	help
 	  Target plaform to build for.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH
+	string "Device Tree Source file paths"
+	help
+	  Space-separated list of paths to device tree source files
+	  that will be copied to fdts/ before starting the build.
+
+	  To use this device tree source file, the ATF configuration
+	  file must refer to it.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP
 	bool "Build FIP image"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 1f08f5dabb..d1eb72e7ae 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -162,7 +162,12 @@ endif
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS))
 
+ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH))
+
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
+	$(if $(ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH),
+		cp -f $(ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH) $(@D)/fdts/
+	)
 	$(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
 		$(ARM_TRUSTED_FIRMWARE_MAKE_TARGETS)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
