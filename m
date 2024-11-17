Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C97FD10F35
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 22:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AFBF846F2;
	Sun, 17 Nov 2024 22:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AnE_84iUUJ5F; Sun, 17 Nov 2024 22:05:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 095E28488D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 095E28488D;
	Sun, 17 Nov 2024 22:05:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF1C5DB3
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 22:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7D4884488
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 22:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXB_q9LEIG0r for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 22:05:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=robertoxmed@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A79CF84573
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A79CF84573
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A79CF84573
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 22:05:09 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4314b316495so19817365e9.2
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 14:05:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731881107; x=1732485907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/haQv62k07P0TyVxZlAqmUGqzOdraRXndpauC1heOdg=;
 b=pn5beXqSsc1KAq6Sh66cPLIWDkAoYnaWtvlp99ofIrPHcU2jzmuu6MmR0fTCdh1J/h
 288zT71GQevPG1eV0mkWc7CDFLzctmBBCdt+gsrOV9qEkT1NkhGdrM+JRuD0gfJ/VnMc
 bRACXn0iTtxBsUJzqlDtzF6F9bhJILrS8MnEX8fitYW9Q72QvP6WSnAUJtlpAqkaVb65
 ZRN2lFL0T7Bm5Br4g0Pn/+MEzf3bhauY9XHtSyfUc1VdYEgu35t/bKI9aNRfc37qgv/X
 9al+4RXW8RmDtfLwqiUwnTStEwOrPnPTQaSO6SLI7is6nRJd+14vzsK+mmGALi7NbTNC
 bFVw==
X-Gm-Message-State: AOJu0Yw7vUdqbsJa44e1P/EbgVoyfIZRYoYAKPtzFt5ZiUrlkNbVMmcx
 /SPvzbEe9i0Mt9WPprGX6iqy55C2a7R1ha8AvGAtyK4XGQZCbXtLkStLTzhB
X-Google-Smtp-Source: AGHT+IElQl+umoTHGS1+gt63QsokYc2giQXs+khHP0eptdTOPFOIVt8Pz9VdzfJIaY6cDUwFljvFwA==
X-Received: by 2002:a05:600c:1d8f:b0:431:5a27:839c with SMTP id
 5b1f17b1804b1-432df71eb8fmr90040995e9.5.1731881107150; 
 Sun, 17 Nov 2024 14:05:07 -0800 (PST)
Received: from Suzaku.home ([2001:bb6:11e3:a300:da4d:c63d:b184:11d6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab80821sm131158645e9.23.2024.11.17.14.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2024 14:05:06 -0800 (PST)
From: Roberto Medina <robertoxmed@gmail.com>
To: buildroot@buildroot.org
Cc: Roberto Medina <robertoxmed@gmail.com>
Date: Sun, 17 Nov 2024 22:05:00 +0000
Message-ID: <20241117220500.584642-2-robertoxmed@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241117220500.584642-1-robertoxmed@gmail.com>
References: <20241117220500.584642-1-robertoxmed@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731881107; x=1732485907; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/haQv62k07P0TyVxZlAqmUGqzOdraRXndpauC1heOdg=;
 b=FtjoTXqnf0ImSYFpcv0fJUQw5x80sPlQq2VVgFRZwLSMvH+EdOxdFwTbmyEZ8N1rMt
 IPqyy9veR2BQoZvHgtaFWwsILTtgzJ0MsXu0HkJH7yafLvHq16lLG2hJV8kb0RysbM8q
 ORix0hAQ8ait/PfxcwNO3ivX9fbQFvYQUy6BrP3MGlR3L64lRn3xSfCQS+9DGrzQz2C6
 bnq6t4NpgFjXb2xzHVX/o1FThiCEOHG8Ji/UJI/Lc6k97S8nIE9JTyZzu6il/naWjg4M
 iIgzgwK9jmJ/4imSkeYlGFiEtun4iCYM8WXnlNyjt1SwDpL2Y23nd66D+0/KN5H5NpY1
 AEtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FtjoTXqn
Subject: [Buildroot] [PATCH v3 1/1] configs/roc_pc_rk3399: Bump Linux, U-Boot,
 TF-A
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

- Bump Linux to 6.6.56 (LTS).
- Bump U-Boot to 2024.07, so it contains commit ebb0ad4eef0a ("arch: arm:
mach-rockchip: Kconfig: Enable BOOTSTD_FULL for RK3399 and RK3588").
- Bump TF-A to 2.11.
- Enable hash checking: BR2_DOWNLOAD_FORCE_CHECK_HASHES.
- Add relevant hashes in the patches folder for the board.

Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
---
 .../arm-trusted-firmware/arm-trusted-firmware.hash     |  2 ++
 .../patches/linux-headers/linux-headers.hash           |  1 +
 board/firefly/roc-rk3399-pc/patches/linux/linux.hash   |  2 ++
 board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash   |  2 ++
 configs/roc_pc_rk3399_defconfig                        | 10 ++++++----
 5 files changed, 13 insertions(+), 4 deletions(-)
 create mode 100644 board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/firefly/roc-rk3399-pc/patches/linux-headers/linux-headers.hash
 create mode 100644 board/firefly/roc-rk3399-pc/patches/linux/linux.hash
 create mode 100644 board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash

diff --git a/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..8b77e1f165
--- /dev/null
+++ b/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
diff --git a/board/firefly/roc-rk3399-pc/patches/linux-headers/linux-headers.hash b/board/firefly/roc-rk3399-pc/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/firefly/roc-rk3399-pc/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/firefly/roc-rk3399-pc/patches/linux/linux.hash b/board/firefly/roc-rk3399-pc/patches/linux/linux.hash
new file mode 100644
index 0000000000..98edd13a58
--- /dev/null
+++ b/board/firefly/roc-rk3399-pc/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f74812f78e88992c416434cb107639e13a551dbaff36bb90d6346ab16ab71a95  linux-6.6.56.tar.xz
diff --git a/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash b/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..fe9b4f53dc
--- /dev/null
+++ b/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
index 1323752683..145e155fac 100644
--- a/configs/roc_pc_rk3399_defconfig
+++ b/configs/roc_pc_rk3399_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a72_a53=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/firefly/roc-rk3399-pc/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="roc-rk3399-pc"
 BR2_TARGET_GENERIC_ISSUE="Welcome to ROC-RK3399-PC!"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/roc-rk3399-pc/post-build.sh"
@@ -8,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/firefly/roc-rk3399-pc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.61"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.56"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-roc-pc"
@@ -21,14 +23,14 @@ BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O 64bit"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.9"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.11"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="roc-pc-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
