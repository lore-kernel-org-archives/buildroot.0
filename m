Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0A5CCF9E3
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 14:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D5428221C;
	Tue,  4 Nov 2025 14:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4lT1wssj9oI; Tue,  4 Nov 2025 14:44:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D185F82216
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D185F82216;
	Tue,  4 Nov 2025 14:44:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05D1B462
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 14:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBED740D64
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 14:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G6sN8kLTJ2vu for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 14:44:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7719640D65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7719640D65
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7719640D65
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 14:44:07 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-640c3940649so3439555a12.1
 for <buildroot@buildroot.org>; Tue, 04 Nov 2025 06:44:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762267445; x=1762872245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dWeaHg4lnQtCwljv60ee6L+E/dJ+PSNQmoOxesrbK0g=;
 b=s+UJxxHJfXdr3LYu36RVfDnHo6ndxQTVAfCHMG1JkfWAPRCu5K6IPjuOOwKI6MG+Sp
 OnYqDRmJYYBhqvmpttkMniEMTaTvUS5zVvSB4mZzb6V3O8fG3yxMxKP/zGNA3b51YN6D
 0vBbY7u2SoEUEaQtIvEsK1vOco/KZ9ScNJwvEiRoV+gAFT7Og1wSzYPmx+X17KtmpSFO
 +fqkHsWGmdsTKwDemg1HJlBzTvC36EdInWTzsoj7JoZgH/THtHeLbIWLknYYndixBFj9
 30GGCdYy3+qFpdOugrUR9rf1hHakYsqndvDeK2bZpYsa/ibiJrPglAFofBaOub14Av51
 90tg==
X-Gm-Message-State: AOJu0YyQpxOJ6+zakWj6r4B8c95Ik2XAgNNWdzxBkYDOONx0L3xzoctF
 WLTvKpRMjC6WgWJZoSLblnZ0scdn1bAoTzx/BKit4QkYTA4+mTcNIBNJBbU6du6Khqj/msoaPqz
 igTN0
X-Gm-Gg: ASbGncvTYN8JOaip6fC2hdKr5v0F1L6SymWBCtCn3lUOQUBDWWPSmIKXbFNRA01OhPP
 2PGYrXfqCUScH5F6pjVyVknhYiCjtkXI1zBoXd/WAqcg6GQAS+FYMIrSCTzO1fU9BM599C/MMDE
 /MEkLm3xQJ9mfPwLKnmBkPdoq+Od1GdwLJj4Ccjj4+74t3p45A1hEz08/ikgl7PCh590OXl63vx
 hQeS0qO95ymAOW1U/F6Ehys2Ng+pBFAYwBFc4LlgHVAurvQB5+g18gMT9IsbVaOtMLSbmkn4UeG
 5OqewroTeM822nN1Jg6nMuCy0apTv8z88zxgY7nC+BqCtwpwAWWPu95PCJvCiYoH1IJqJxdwcKR
 +eENTbsSIBPnVezHijxN3AAcqtXg14u1uMWYktc+LOOmfnhn6uheLmFwqLelTbnDYKEf+joSC9e
 ocyQo4OEDFG6heJs5dEYWpV5CyJ3UKjEMsmTIi
X-Google-Smtp-Source: AGHT+IFLE2stROv0o8dny5CbRMkLb55uPysvV4cwZWjZt5Xv+cWECWjbi1kF1csQZIQmcEsIsJA+3Q==
X-Received: by 2002:a17:907:86a7:b0:b6d:4f1d:8c9b with SMTP id
 a640c23a62f3a-b70701c3c7amr1683538166b.28.1762267444792; 
 Tue, 04 Nov 2025 06:44:04 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:9d18:fb9c:93d1:73b5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b723fe3b899sm226683466b.66.2025.11.04.06.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 06:44:04 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Date: Tue,  4 Nov 2025 15:44:00 +0100
Message-ID: <20251104144400.1242876-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762267445; x=1762872245;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dWeaHg4lnQtCwljv60ee6L+E/dJ+PSNQmoOxesrbK0g=;
 b=LugsOesKfrET2c0IWboyJZsFBwJAYYap3i07iddemgJtHnfnFnVZcI84bgaglSPWfU
 jZxILQ+PF4cqvUtbZXrVPLZFQBpM33UA7p5QQN0/II8A5GN6YQouMpAz+WoTY0WC9qRy
 UnksFAwbFElT91XuZ3vL8bZueR3fsfBddPZxE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=LugsOesK
Subject: [Buildroot] [PATCH 1/1] configs/imx6ulz_bsh_smm_m2: bump Linux to
 6.12.56 and U-Boot to 2025.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 6.12.56 and U-Boot to
version 2025.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash | 2 +-
 board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash | 2 +-
 configs/imx6ulz_bsh_smm_m2_defconfig                  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
index 32ed4d2a08d8..75072f26f71e 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
+sha256  55432b2af352f7bf3053c348d8549df2f2deeaa4a361c65d638c2f3b2ca7ec96  linux-6.12.56.tar.xz
diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
index 440526977bd9..98a5c53aaf97 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
index 5aa41b6438ca..9ced7c51ec55 100644
--- a/configs/imx6ulz_bsh_smm_m2_defconfig
+++ b/configs/imx6ulz_bsh_smm_m2_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx6ulz-bsh-smm-m2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.56"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/bsh/imx6ulz-bsh-smm-m2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ulz_smm_m2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
