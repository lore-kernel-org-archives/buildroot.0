Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D399C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 17:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E152E82B94;
	Tue, 16 Aug 2022 17:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E152E82B94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aBbQucoTTqt0; Tue, 16 Aug 2022 17:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9019A82893;
	Tue, 16 Aug 2022 17:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9019A82893
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58D1F1BF391
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 17:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4098F824F4
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 17:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4098F824F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDdeBnde3N1I for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 17:55:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0F6D82893
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0F6D82893
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 17:55:43 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id j8so20310947ejx.9
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 10:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=4rfSGpuaKd0aNtuaw9lt47rMg2nCE5LNwlyMWkrLbNo=;
 b=z5QPDxE2m2v2XK2Pv6x79Ecm/Kop648+gMkYtOA8QDM8IGsCFvptv8ZcUWpoxydiKt
 gIlWvi96X5b45fwXHjHWTgAqNHvra8wqnVwwLnjU/OfocfUucvhKgSom154PwhldAIlk
 ygZ+kZAtt5+Fro4aa+0s8167dVircDYTxHVowXlENfvI7cyxt13YWfH68TB6PWXXVOGO
 qmNMD+i3K6bEHWFo3XXiyrAxiduN/0oXkpPWIfww+0pNjpN2U5Sv9F8ROM5mfD7Wqmsu
 lE/KBrW1aE1Ccfj0W1EBPxFJT15/StwTBRWK41HN1QykOMtqi2A0rhu7fMqaHuSTkj4e
 WElg==
X-Gm-Message-State: ACgBeo15Qd1RD4ySUq3AX88YXUGBXnxFrefxf7bwKuFNAJ/zz94G7AIw
 P6vZiuqOsB1c50fvp6KbU1X+NPARCXs=
X-Google-Smtp-Source: AA6agR6I3LnE+OboYY7eW7YBCprR2HlaYCAZiz09Y1466iXbDilFxm80aknDO4lK1cxP+nQGpdWgYg==
X-Received: by 2002:a17:907:7243:b0:733:2c:14cf with SMTP id
 ds3-20020a170907724300b00733002c14cfmr14038907ejc.485.1660672542126; 
 Tue, 16 Aug 2022 10:55:42 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a50ec94000000b0043c83ac66e3sm8821420edr.92.2022.08.16.10.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:55:41 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 16 Aug 2022 19:55:02 +0200
Message-Id: <20220816175503.1280276-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816175503.1280276-1-francois.perrad@gadz.org>
References: <20220816175503.1280276-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=4rfSGpuaKd0aNtuaw9lt47rMg2nCE5LNwlyMWkrLbNo=;
 b=cUjjK8SeMUhFJ/0QIvLI0dvL3GfvA+I4C9Q5LXCIQneBqjokHlNcNQslXHj850WiUW
 sF7lAdokZDwsTFit8CrvKltDOyd59NvhFzTavhNbLSu6694BSzVeNtDTKC0+LQE/ez2r
 xpO0oZo2/zrFmj645KtIJOrKz6EoZUqZDDIeq91ugggSjfyqSuv93RTUUnieQrN3V6r9
 iNrnINK1yBztmc2dwC0ntzmbF3qG93aBUhoa5jFtNuTBj5iuamM4rcZ0854Bbizs+K3b
 x1bp7jdfgum+30I8+qLKIdyGX3gm49/baWUiMH5aEDp7OPOZnFhneAHHW9KEUVOkQ1RQ
 9WHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cUjjK8Se
Subject: [Buildroot] [PATCH v4 1/2] boot/arm-trusted-firmware: allow to
 generate BL2 from RCW
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds option BR2_TARGETARM_TRUSTED_FIRMWARE_RCW that allows
TF-A to encapsulate a pre-loader RCW (Reset Configuration Word) file
into BL2.

Upcoming NXP QorIQ family board needs this option.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 boot/arm-trusted-firmware/Config.in               | 6 ++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 100ac8348..2a59a325d 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -90,6 +90,12 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP
 	  platforms were ATF encapsulates the second stage bootloader
 	  (such as U-Boot).
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW
+	bool "Include RCW"
+	select BR2_PACKAGE_HOST_QORIQ_RCW
+	help
+	  Include the RCW in BL2.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
 	bool "Build BL31 image"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 7c4e7edb0..246c0699b 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -144,6 +144,12 @@ define ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL
 endef
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW),y)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-qoriq-rcw
+ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += pbl
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += RCW=$(BINARIES_DIR)/PBL.bin
+endif
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31),y)
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += bl31
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
