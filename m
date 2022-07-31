Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FA4C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 09:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9983A8175B;
	Sun, 31 Jul 2022 09:48:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9983A8175B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6dUKWEklDMBI; Sun, 31 Jul 2022 09:48:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C18F581C21;
	Sun, 31 Jul 2022 09:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C18F581C21
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13FDF1BF342
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 09:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86678812E3
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 09:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86678812E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TrCgj3LeFNmi for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 09:48:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B78068135A
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B78068135A
 for <buildroot@busybox.net>; Sun, 31 Jul 2022 09:48:28 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k8so8546563wrd.5
 for <buildroot@busybox.net>; Sun, 31 Jul 2022 02:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ipK9Iv/ezyg2xZ0djCGUbCZY4V/6RNMXh1WXoV+5xiQ=;
 b=HFDrKhpTP4jDiNErHTGV0/EDajLJ1j+1na+eNUWlC1bHDOLggi0pLEZXaubwHR4ucV
 6MO8jpmYZvi3YDEZqxR/WCP2MgN4WuqwOOV3QDos2fGmxXBRVC4K0S7CiCInTiPFziME
 NFdikg6T/pGzX+q4hCyCk0743Bud19SDc5Zt0lYGk8mMvx2nwgkxs/ONNRznq/KFI/ag
 spaD7pF/hmQR7wX/8ZfEN7Rjp/vdrwCxuyzHNPsWDMfLr5ntPZme6a/7i919Zj6K3N6k
 aSCjvuo1AY+LyIZW/gpoKHzLvvMuZBFaf7lX/nfiiz91+o71iH+XeWZvJ3TQJwpA3u8Z
 l0Ew==
X-Gm-Message-State: ACgBeo0dd+R6h9zSpev/ZOdqG9G159690U/ItIuQvbgZWSnVwvJKNu0h
 upiS4RY+BeoTDdv7KnjeQ7s3GuALMCE=
X-Google-Smtp-Source: AA6agR5kLDfFHEqEPjto2Sp+M7mjUxU+FfBtfvnqC4wmk2r/qyMbKxqijIIQ2b5FN8OIxEREDnxszA==
X-Received: by 2002:a05:6000:10c3:b0:21f:15aa:1b68 with SMTP id
 b3-20020a05600010c300b0021f15aa1b68mr5730854wrx.693.1659260906953; 
 Sun, 31 Jul 2022 02:48:26 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 bi9-20020a05600c3d8900b003a0375c4f73sm10241477wmb.44.2022.07.31.02.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 02:48:26 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 31 Jul 2022 11:48:06 +0200
Message-Id: <20220731094808.1347975-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220731094808.1347975-1-francois.perrad@gadz.org>
References: <20220731094808.1347975-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ipK9Iv/ezyg2xZ0djCGUbCZY4V/6RNMXh1WXoV+5xiQ=;
 b=ULsX8VA1pNho/3MJBjXZ65Jp7iYIt9IeJuRINEzgfS356Oty/yeXQHxDZ5AYVgz3TP
 XkJEGtmKT9I3U7lKInxY9otgheGjMyuNAjcLF3oqt5A705UDuqdc3+o+7t4YMTeJ8T1G
 3eKQkFBV4HZqspfEgrpPoVYIALn8pCoKaWkVB1wAQVdQmRKB8ARqfAkq1xAR0BLeYQyU
 9NpM3mXxHcQXtIKd6y3b0phsGFPFJoa/PoNJ14wpKmtBg4cpBxT4U7b4Ojiyy4yfsUif
 M39dYtlekWzkmbZmjzyUkH8TTAjazUTQnoWf26nKP1N93126d/Dzs+EjRlOEprUT6lP/
 E62g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ULsX8VA1
Subject: [Buildroot] [PATCH 1/3] boot/arm-trusted-firmware: allow to
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

add the option BR2_TARGETARM_TRUSTED_FIRMWARE_RCW.

TF-A can encapsulate a pre-loader RCW (Reset Configuration Word) file into BL2.

This is useful with NXP QorIQ family.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 boot/arm-trusted-firmware/Config.in               | 6 ++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index b1fc03e10..0f91953bf 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -85,6 +85,12 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP
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
index 35a95a7ec..eb9b656fe 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -133,6 +133,12 @@ define ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL
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
