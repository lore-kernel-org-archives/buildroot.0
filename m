Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C6FCDB481
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 11:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E15DF81E40;
	Wed, 24 Jun 2026 11:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vZ-vRajOhS5; Wed, 24 Jun 2026 11:45:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6EE181E55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782301552;
	bh=KFYlyxyPUSOIxZa6QXePgMF1ISY+pvbaD2E838bvn4g=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=daVe6EBxeY8FmxLEYnnSFBQS9P0hKcy1wkJePbc/CBUJ6aabvBl/RCiptr318vgaa
	 FcpZ4lpeh3S1aoUZSxWU1xqaLNGKmlDXvfaAmIKWrA6EzqigdHYG+Hlq11m/8QYVIz
	 Zpwxvp4Ykqfrs3bau1vCc0E/mKmqE57fnotTWq++vTFXLFp7zGt6zLO25WjJFHTCO7
	 tiNCubojtRuBucaLRYMJPoVWijeb+7b0lgMY8pa0IWO2lMU+7CrSuozsG9qT6DUr+U
	 H+r4xIPKPgT4vpx5eLnqfxbpJoyhzLfOZhH7eKlrl7aItXRyxcGrmxbbWA/aihh0hE
	 ZIqb8bLrcupEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6EE181E55;
	Wed, 24 Jun 2026 11:45:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 069C5363
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 11:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D770A40C2D
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 11:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ou4VD7yAZqlM for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 11:45:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A579140C2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A579140C2B
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A579140C2B
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 11:45:48 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4924944fe6bso6286585e9.0
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 04:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782301546; x=1782906346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AdNe5F86s9n6JzreNymdVVh0w/cZBgRgWJ83HpQd+yw=;
 b=q0CzXCTbz7MGLqGYY5lKrjr40pGKjMr1Nc4jUIoXsxqPWHdvqzGzHGRp5OM4C+/GN3
 bZRdEboVn+CYVxgz1Mvvu6WOCbNOZQMKcEGBcSOA9KP/dh7d+l3gLpbdIvxgAUFqta4+
 kjFP9XBz81ib4M8vGMSgC5evkWKPlgtEKC8dQdl29ud30pi2VUWA0GEGcI9iG8DRsJX+
 1KOrwFHZRu1132n9nlGjo4kgmHXarVGlwDsSbfeUvH+o2Ypex55jyFHtnGCSXXFliME4
 qhWg4TEpD0I9uve9fBcYH3h1MtKF1lY6pLo7t18A2Dldc8/dcqGr/jptCGeOHFkB4Rfg
 zY+Q==
X-Gm-Message-State: AOJu0YyohCB2CztS8Kpw4fPE8C6sPzQ4QBvq6SkEP9BLaSi3Kyy0TvBG
 WWWVSFNBCglwdNfLuDbGO6QoLpDnT53eerUG68VvXsGz191SZetAWMOgfqIqC0cIPx7HVFlDtBr
 8uu9L
X-Gm-Gg: AfdE7ckvCZHspyArs4KMeOuonwVUEqhmXyfKa65NboldNhgDjdHLreZNGfqMXBjJklq
 5c3a5WYjcn3Wo5CTNxR39G06MDGsCUWDuSWSmUnwF8/c05IlAnPolpM4WyKlIRgz1TKB/D4lO++
 2nGpPfiNoRWmMmcJpW6vIw+w5a/YW8GL1fhdXnceNcAOV7JfhgLqzLXEbGhS/45J27NWnkE3lTi
 GuHpKOEGM4mAdK00bzcY527FWNNJmh90Q/QQcvh0ByePpOcN8BbyM/7mDWoM9/iiGCQe4iCNiBo
 N3pnROX7HJHOhqdd9C6B8wqdaTv78a23way/q4vJ1Vdfll6TldPe+YSbg0bbb4VvamwRT3ZRdwW
 RrTgLfTimhqOLdQjjeVCVQOudOwQmOlA0J5wxo4vrIqx4gLVy3jV2gDchPDWqksjWRdgaojMAIZ
 bGBnxWYCqdW07U0Xt2DxkFhKgSqeh9O/NeRWKePeoE7GXQG5Nlw52v1t1Xx7kkx1SON7bfTd++E
 PGDfk6JYnCwvA==
X-Received: by 2002:a05:600c:8518:b0:490:a298:acf7 with SMTP id
 5b1f17b1804b1-4926086d16bmr47540555e9.17.1782301546199; 
 Wed, 24 Jun 2026 04:45:46 -0700 (PDT)
Received: from P-NTS-Evian
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c2279bc77sm5419901f8f.32.2026.06.24.04.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 04:45:45 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed, 24 Jun 2026 13:45:38 +0200
Message-ID: <20260624114538.1705870-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782301546; x=1782906346; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AdNe5F86s9n6JzreNymdVVh0w/cZBgRgWJ83HpQd+yw=;
 b=vAB06yvslJmtiIROV5AVaIKsVGes9MUFxPRnQET5Jn5DZYPPBjM/bIQXJKSAbtjFen
 5iv4p0kA+Qdd761PjMKnJzpfcUqb3V5aLonJyf2E521FxLY5dhK/a6FfBAQ4PENncPjX
 Y2RXFos+mPpv0em6AxCX2pVqWO0rhHqYmvggk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=vAB06yvs
Subject: [Buildroot] [PATCH] configs/qemu_arm_vexpress_tz_defconfig: bump
 tf-a and u-boot versions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Bump TF-A LTS 2.12
- Bump u-boot to version 2026.04.

smhload command has been removed from u-boot 2022.07 [1], use
"load hostfs" generic command as suggested by the documentation [2].

[1] https://source.denx.de/u-boot/u-boot/-/commit/dcc4f9623e27b92a1e0b97326631b0d5841c49cb
[2] https://docs.u-boot-project.org/en/latest/usage/semihosting.html#migrating-from-smhload

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/qemu/arm-vexpress-tz/u-boot.config | 2 +-
 board/qemu/patches/uboot/uboot.hash      | 2 +-
 configs/qemu_arm_vexpress_tz_defconfig   | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/board/qemu/arm-vexpress-tz/u-boot.config b/board/qemu/arm-vexpress-tz/u-boot.config
index 48b1d06fdb..8633ea18d0 100644
--- a/board/qemu/arm-vexpress-tz/u-boot.config
+++ b/board/qemu/arm-vexpress-tz/u-boot.config
@@ -1,5 +1,5 @@
 CONFIG_SYS_TEXT_BASE=0x60000000
-CONFIG_BOOTCOMMAND="smhload zImage ${kernel_addr_r} && smhload rootfs.cpio.uboot ${ramdisk_addr_r} && setenv bootargs console=ttyAMA0,115200 earlyprintk=serial,ttyAMA0,115200 && bootz ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr}"
+CONFIG_BOOTCOMMAND="load hostfs - ${kernel_addr_r} zImage && load hostfs - ${ramdisk_addr_r} rootfs.cpio.uboot  && setenv bootargs console=ttyAMA0,115200 earlyprintk=serial,ttyAMA0,115200 && bootz ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr}"
 CONFIG_SEMIHOSTING=y
 # Drop flash accesses
 CONFIG_ENV_IS_IN_FLASH=n
diff --git a/board/qemu/patches/uboot/uboot.hash b/board/qemu/patches/uboot/uboot.hash
index 7762ff3f8f..594d7ebeae 100644
--- a/board/qemu/patches/uboot/uboot.hash
+++ b/board/qemu/patches/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  68e065413926778e276ec3abd28bb32fa82abaa4a6898d570c1f48fbdb08bcd0  u-boot-2022.04.tar.bz2
 sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index 99d5f505e1..03bb578f72 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -23,8 +23,7 @@ BR2_TARGET_ROOTFS_CPIO_GZIP=y
 BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
@@ -36,7 +35,7 @@ BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/u-boot.config"
 BR2_PACKAGE_HOST_QEMU=y
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
