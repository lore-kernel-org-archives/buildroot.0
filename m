Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11636CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFC1560A7F;
	Wed, 10 Apr 2024 21:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzb2vArddGAY; Wed, 10 Apr 2024 21:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C686260BDF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C686260BDF;
	Wed, 10 Apr 2024 21:45:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 734551BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 608DF4036A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_oJ4qV1-iNS for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:45:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 01A8B40359
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01A8B40359
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01A8B40359
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:44:59 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-343cfa6faf0so5362370f8f.0
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 14:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712785498; x=1713390298;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K9Jnb1h98ilTF9UDdDexEX3vHY7jh4OqLbQfotqDXYs=;
 b=nHszhFq5p/EHN09kIrfeWonu998M4kyUvmP1VsIUgZJhNPQHZ5Db178GzNx3kl0FWA
 EgRAe8EI+itDx5zIRAsEmT39LmLxUmO3s1k5hpyI+w737+W8Ogup/kDutkGtKR2RY4eJ
 MpNz6PuMgXViP+Xe0+cc2em7UPiGFxEWBP9S7CPw9CnJMFnW/N0bL5G8pEk6xVJw61hR
 GXUrV2W5BRmbkmtUpEq+8IfqpZt3zh7nW4Ow+i7WPwHvyrBQ+9qpURJahADs7DAR0Eqe
 QVeFFSNx4w2tIiQStZmgDKw4ODCLu6TGcvmOuxvqbKmZ5oPS4vqOrlZ7NSM4PVoZOwO2
 GrGw==
X-Gm-Message-State: AOJu0YzhKMlXmfcEHk9dgUZYwajrTYAdsrNuJYjCiA8Jeh+zncjK564o
 lOONiHz8vPAWloH/XTtS/pYo05cO+RKeDkVxUNEGMglPrDcsh40I0+cY2VgPlRCKoOw+K9Y85Gi
 F
X-Google-Smtp-Source: AGHT+IGuy/oBRq3xA03n25Wd3mXdxpDu5LR6rSgQtFAnEkmIegUCnyI8UWHRlyu2CqHYXeyd83hGvg==
X-Received: by 2002:adf:fc46:0:b0:33e:cf4d:c583 with SMTP id
 e6-20020adffc46000000b0033ecf4dc583mr2877341wrs.16.1712785497830; 
 Wed, 10 Apr 2024 14:44:57 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a5d6852000000b00343e8968917sm177991wrw.1.2024.04.10.14.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 14:44:57 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 23:44:52 +0200
Message-ID: <20240410214454.86748-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712785498; x=1713390298;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K9Jnb1h98ilTF9UDdDexEX3vHY7jh4OqLbQfotqDXYs=;
 b=R3b4JagybucggE5SX38jBCtWMT4Q53v5V/69jkfgKiydJkynccWacejy1X+LwnwjjK
 c3IoIu1m5djzFQzQDXc36v1qy2Imb1GnC4yzq6lCGr9qEfr7H2hI0sN3GYRC45qWBF+7
 U1Il/pbfkPYQwF2HIi6KPV3+v4nw6acLsYundXUfN1JNZINqyQmI16diz8l8F8HVlHMq
 NQShNfbWn7/9fl5dHukRq41+B9ImRs6q1C83xbxsn/NzCu8XYhn9XEQI4+KY8rqfkfFc
 9rpOJDhCMwBj/rb9m2PGaXZyEThPCmHYQHO4+PYCmpljtBkPhHBzDBFHpsMpVP1ApMXZ
 +kQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=R3b4Jagy
Subject: [Buildroot] [PATCH 1/3] boot/uboot: remove
 BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE
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

As suggested by Arnout during the review [1], we can assume that U-Boot
needs ti-k3-boot-firmware when it is selected (likely by
ti-k3-r5-loader).

We can remove BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE without
legacy handling since this option is not part of any Buildroot
release.

[1] http://lists.busybox.net/pipermail/buildroot/2024-April/689263.html

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy              |  3 +--
 boot/uboot/Config.in          | 11 -----------
 boot/uboot/uboot.mk           |  6 +++++-
 configs/ti_am62x_sk_defconfig |  1 -
 configs/ti_am64x_sk_defconfig |  1 -
 5 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 76af1da348..f67187e92d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -154,9 +154,8 @@ config BR2_TARGET_TI_K3_IMAGE_GEN
 	  U-Boot binman tool (requires U-boot >= 2023.10).
 
 config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
-	bool "u-boot TI K3 DM option has been renamed."
+	bool "u-boot TI K3 DM option has been removed."
 	select BR2_LEGACY
-	select BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE
 	help
 	  The TI K3 Device Manager is already included in
 	  ti-k3-boot-firmware.
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8d2228dc7d..8133b780bb 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -240,17 +240,6 @@ config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
 	  U-Boot, and that the TEE variable pointing to OPTEE's
 	  tee.elf, is passed during the Buildroot build.
 
-config BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE
-	bool "U-Boot needs ti-k3-boot-firmware"
-	depends on BR2_TARGET_TI_K3_BOOT_FIRMWARE
-	help
-	  TI K3 devices needs at least ti-sysfw (System Firmware) when
-	  built with u-boot's binman tool.
-
-	  Some TI K3 devices using a split firmware boot flow (AM62,
-	  j721e) also need the Device Manager (DM) firmware to be
-	  available for the U-Boot build.
-
 config BR2_TARGET_UBOOT_NEEDS_OPENSBI
 	bool "U-Boot needs OpenSBI"
 	depends on BR2_TARGET_OPENSBI
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a894654698..c3baa75e49 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -194,7 +194,11 @@ UBOOT_DEPENDENCIES += optee-os
 UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
 endif
 
-ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE),y)
+# TI K3 devices needs at least ti-sysfw (System Firmware) provided
+# by ti-k3-boot-firmware when built with u-boot's binman tool.
+# Some TI K3 devices using a split firmware boot flow (AM62,
+# j721e) also need the Device Manager (DM) firmware.
+ifeq ($(BR2_TARGET_TI_K3_BOOT_FIRMWARE),y)
 UBOOT_DEPENDENCIES += ti-k3-boot-firmware
 endif
 
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 5c7b97b3b0..a0b4c21216 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -37,7 +37,6 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 28e97f94e2..8dbe0fae33 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -37,7 +37,6 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am64x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
