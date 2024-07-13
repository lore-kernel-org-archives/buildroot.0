Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56327C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 16:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B860401B2;
	Sat, 13 Jul 2024 16:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DrAcxLsyVmB; Sat, 13 Jul 2024 16:30:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCAD040359
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCAD040359;
	Sat, 13 Jul 2024 16:30:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FC4D1BF2FA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 16:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AE17413E5
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 16:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kb1NXbY8bb8f for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 16:30:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 075E6413DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 075E6413DC
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 075E6413DC
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 16:30:26 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a77b60cafecso367997466b.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720888224; x=1721493024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6rA2R3T99mp4LuPIzuOv9/fWH3kgt34Jn4wrNpkmgwc=;
 b=pIaOEN4lunw03jW7inm0ZRLYtIS+y6j3griXfKjrNoM5BZNkWG+RvVc8Q34q8xCE5L
 S4vQBUNskXouybN52LKhSRBA+5A1vJkK6fbWefW53c7GKTM9aoKmkiFtdoV7kwPZb7d3
 b7TsPLebMTIr8p7itFN1EvJTxPP9s6JIJ8e2SbKgYJwneGHO10j2y6Z2lJZz4+FA0AF2
 CXLcSg5Iy3yagwSAjfimnmBkecEQa+CUizO8gRAxNB3k8TfSEAD6H358fz8MHDbt+Ogh
 zNd51rr9uFf8DjRGzGqgLeal5PxsViYSqIVamI252x60SepzXFW5cLNu7FS+z6BTVIEt
 breg==
X-Gm-Message-State: AOJu0YymyTYnOwxOmtjCIchQwKtCUFGjFiXU7higGKMeJsaZhLWhlozz
 yMoP1oK5bcQVqjiLado5o0XWNjcBXT9tZbXUXBoFXauSXz4sn4/rgmeDOubPnCfwU5nUEcWW+dV
 K8mQ=
X-Google-Smtp-Source: AGHT+IGgT84YwPEHgOpToWmp1FWjvMg4UEjbXclKt6kx9mxEQC2zFbktWIjchyeo62cjEeOUc6IEJQ==
X-Received: by 2002:a17:906:eb55:b0:a77:e1fb:7df0 with SMTP id
 a640c23a62f3a-a780b688b3emr935938466b.2.1720888222150; 
 Sat, 13 Jul 2024 09:30:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-101-21.retail.telecomitalia.it. [95.244.101.21])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc7f2197sm62570266b.117.2024.07.13.09.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 09:30:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 18:30:16 +0200
Message-ID: <20240713163016.1135653-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720888224; x=1721493024;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6rA2R3T99mp4LuPIzuOv9/fWH3kgt34Jn4wrNpkmgwc=;
 b=QG1inRaU1l5NYYCa7x7tboO30rwS1BRBhw6buo5J+dM0I/AcVhKe3bqWviPrxkperF
 Xieo7XwOkkFFTGmd8buE0xrpgf3+VyOEuy2w/+JBrhy6ARl3uw8mdthIgvFjXWpIRHi0
 N+dagUMEJttwUiNIEDHY6jXPTfARPWDG9QTlM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=QG1inRaU
Subject: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump Linux to 6.8.12
 and U-Boot to 2024.07
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
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Bryan Brattlof <bb@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 6.8.12 and U-Boot to version
2024.07.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/ti/am62x-sk/patches/linux/linux.hash                  | 2 +-
 .../am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash   | 2 +-
 board/ti/am62x-sk/patches/uboot/uboot.hash                  | 2 +-
 configs/ti_am62x_sk_defconfig                               | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
index 2e9aad399ebe..5e9df51ecddc 100644
--- a/board/ti/am62x-sk/patches/linux/linux.hash
+++ b/board/ti/am62x-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  1c4cdcb9d560fad1fb95db2cb8afbedc922f9ead848371fe40363b13f9f631ba  linux-6.8.8.tar.xz
+sha256  19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
diff --git a/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
index 97a2b4eaf95b..fe9b4f53dc63 100644
--- a/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/board/ti/am62x-sk/patches/uboot/uboot.hash b/board/ti/am62x-sk/patches/uboot/uboot.hash
index 97a2b4eaf95b..fe9b4f53dc63 100644
--- a/board/ti/am62x-sk/patches/uboot/uboot.hash
+++ b/board/ti/am62x-sk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 36052dba407a..f56669c24fe5 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.12"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
@@ -27,12 +27,12 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
