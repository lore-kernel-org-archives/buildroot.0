Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCCFC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54BCC416FC;
	Tue, 13 Feb 2024 17:29:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cqzrr1jdzlte; Tue, 13 Feb 2024 17:29:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67ED2416D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67ED2416D6;
	Tue, 13 Feb 2024 17:28:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8A811BF30E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6DF360B79
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G-6B4kH9zJ_S for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D532860B65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D532860B65
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D532860B65
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:28 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33b2960ff60so3252480f8f.1
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845307; x=1708450107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LTI5kqsNuFPrs2NTTwdNXJPKzHj6UufWQ4sKRfTpD10=;
 b=LuXvTuqCUv5fB+qiz/Bi5E27xXAP3D29idMZHIHStC+/WUEwwCK2bWGK2qvKkkTeZZ
 4MWKfkOMPQ00qn4BfZDDi4oR2AB8w9dmmpKadbmaor6gSVdEHOc6INjjmsozfOcneFDC
 iZ0xaj3JWBmfQ7rWocVuuGguXeL2UgbCBQ0Dp/TOgV+bEIU6Lce7fm49h9fgAO9xE2vB
 NQsMzLAV62YM6EyoloFqJQSg9HJei03F8c/iB+Rm6rC6vUwIc/MGIzuoOMc5iXR3bwqV
 YEode9xUyECwLWoWt+/UaEp2xV5EwjZ+4E2ydt+BWn1GDN0Jdlc/GyyiKDvIp0dnEIpy
 +pOQ==
X-Gm-Message-State: AOJu0YwkGK1W1AmJdvJ7amsp7uAlK9YqoYrg5tiRtGimiRaWsm4uZIm0
 F+SdF9SlfkmG3wKoUgrPtZwNcN3fF3qyDkejtNX98NKZ7Ao4wFhNPAOhvBvBvWvB6uusqxzyZHI
 x
X-Google-Smtp-Source: AGHT+IHE5WqOFEkvFFjnEVYVKu703W2TenegevyLih+gdg+RS4/X6p7qaOuP/VsQ87rncca4Byrbng==
X-Received: by 2002:a5d:4003:0:b0:33b:68d2:c5c9 with SMTP id
 n3-20020a5d4003000000b0033b68d2c5c9mr113948wrp.8.1707845307143; 
 Tue, 13 Feb 2024 09:28:27 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:26 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:28:09 +0100
Message-ID: <20240213172817.2872849-14-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845307; x=1708450107;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LTI5kqsNuFPrs2NTTwdNXJPKzHj6UufWQ4sKRfTpD10=;
 b=OSJtRFBVlXDPMpm0p5SLwpmL4sjmck5r+tJl6ABYmAGUJr6Hw19vP1tU8TJRtHTO0/
 /waokrP+7aVt/z6oUk4jN4OYhaKj0C/xwK0s1S3V4boBCOZkDCKH6x56j17Qdqy33MDv
 D4qjkkYFZmO7slCWQZW6kJVclMqceXmXS/5KtYWDDWsMA0J6uJR564jDaI5lFCvHMaRV
 0hCZLpZ2VcPoi4wVU2R62FB1DMknk3zx/IQ46sRCys3CEyonyqF32i3UdU6vw2nW8lrL
 MYrJxhUAFiMtVYcCwnplzcG9MAP7EwZDcUNwFDJVj+kKs25gheBgiDSa4rX3ushcZjJ8
 Xt4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=OSJtRFBV
Subject: [Buildroot] [PATCH 13/21] boot/uboot: use DM firmware name defined
 by ti-k3-boot-firmware package
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The DM firmware name is now defined by ti-k3-boot-frimware package by
BR2_TARGET_TI_K3_BOOT_FIRMWARE_DM, so BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
can be removed to avoid duplication in Kconfig.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/uboot/Config.in | 9 ---------
 boot/uboot/uboot.mk  | 2 +-
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index e6e7956adc..63359266c6 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -250,15 +250,6 @@ config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
 	  Some TI K3 devices need the Device Manager (DM) firmware to
 	  be available for the U-Boot build.
 
-if BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
-
-config BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
-	string
-	default "am62axx" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	default "am62xx"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
-
-endif
-
 config BR2_TARGET_UBOOT_NEEDS_OPENSBI
 	bool "U-Boot needs OpenSBI"
 	depends on BR2_TARGET_OPENSBI
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 0714522550..aa2ca99bdd 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -187,7 +187,7 @@ UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
-UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME))
+UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_TARGET_TI_K3_BOOT_FIRMWARE_DM))
 UBOOT_DEPENDENCIES += ti-k3-boot-firmware
 UBOOT_MAKE_OPTS += DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
