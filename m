Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8484BC3DA47
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 09:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B390C41764;
	Thu, 11 Jul 2024 09:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35pTLUM-JPUU; Thu, 11 Jul 2024 09:05:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1526141768
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1526141768;
	Thu, 11 Jul 2024 09:05:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29E5D1BF574
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 09:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8968541723
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 09:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOvgMO7_hl22 for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 09:05:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 25023416BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25023416BA
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25023416BA
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 09:05:38 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7527afa23cso76761566b.2
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 02:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720688737; x=1721293537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OQxoHdk011UmkWBfUifqNSicKUxDutmeM0/ppxXjKxk=;
 b=EnwwWIAF7O7eOrYVyEDoH9bKQ6dQHGCqNQzc2mOulSM49z9MgF17+PHX6W74krOyfv
 OEezn9B6L/XaYqqfWlO/ZMhiDEXfxipvlIlbm+7sEMLpJsH8maVWZ6/hyOgxLW6ITmoG
 cOP41ZO6OMB3MiNYtd6A6o7GNib9LCudma7/2KvLpTNT0Pa6douj8SdzeCtJQMxZ0PyT
 i4vx4Vzj7TMOhQtTBUOaRY80g0vksuTmTNlfJ0rmOIQYt/Qxd3yOFgnqS8L35/TKptNk
 7asRZsn90uD3VvzOieQY1LMnkjFtnuMbpKwr+WUQn4DvBa+a5ZgAW8JC6Wba9QKnGNLd
 nZug==
X-Gm-Message-State: AOJu0YzCfSvdpyz9inDZMRri+AL2Md8rt79mSD93J/6IK0iBIvfbh0Y3
 bnbnb4KdS1jszEbfYfGscY4IttuU3HD0MUWfoAYHCqyMKUDUufoHuX4LbxrTy6F0dUhq3nofYGj
 79cg=
X-Google-Smtp-Source: AGHT+IEAcxd+1+OSTJ4eFlqnkLbH1tmNhRW2ml1t6QjwQBXNaFPBSY4zM+5D4tOrGIZpjzouKg1NAw==
X-Received: by 2002:a17:906:195a:b0:a72:a05a:6601 with SMTP id
 a640c23a62f3a-a780b6891f6mr555200466b.14.1720688736852; 
 Thu, 11 Jul 2024 02:05:36 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.36])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a871f03sm236739166b.197.2024.07.11.02.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 02:05:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 11:05:26 +0200
Message-ID: <20240711090526.2206829-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240711090526.2206829-1-dario.binacchi@amarulasolutions.com>
References: <20240711090526.2206829-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720688737; x=1721293537;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OQxoHdk011UmkWBfUifqNSicKUxDutmeM0/ppxXjKxk=;
 b=j8ChFo9l2e4el5IUnswf0ORlefFTBk610n6EgOJU6sx0UrLMjrrzjrNkhwLvUQfwTm
 8GpVRk1UsTmbOZtxFU9pcmUioL+9C2dE2RC0wjAOvduOkhZynw4FkXDhMDNZH7NXj81m
 0rVs0t12MahbH4TGv1kfSuipIm+USTZtdPCCA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=j8ChFo9l
Subject: [Buildroot] [PATCH v2 2/2] configs/stm32f469_disco_{sd,
 xip}: add hashes
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch adds .hash files for Linux, Linux headers and U-Boot and then
enables BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the
defconfig from .checkpackageignore.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
 - Update Linux hash for version 5.15.162.

 .checkpackageignore                                             | 2 --
 .../stm32f469-disco/patches/linux-headers/linux-headers.hash    | 1 +
 .../stmicroelectronics/stm32f469-disco/patches/linux/linux.hash | 2 ++
 .../stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash | 2 ++
 configs/stm32f469_disco_sd_defconfig                            | 1 +
 configs/stm32f469_disco_xip_defconfig                           | 1 +
 6 files changed, 7 insertions(+), 2 deletions(-)
 create mode 120000 board/stmicroelectronics/stm32f469-disco/patches/linux-headers/linux-headers.hash
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index e539c0a15f78..9a4684042295 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -286,8 +286,6 @@ configs/solidrun_clearfog_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_clearfog_gt_8k_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_macchiatobin_defconfig lib_defconfig.ForceCheckHash
 configs/spike_riscv64_defconfig lib_defconfig.ForceCheckHash
-configs/stm32f469_disco_sd_defconfig lib_defconfig.ForceCheckHash
-configs/stm32f469_disco_xip_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157a_dk1_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_dk2_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_odyssey_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux-headers/linux-headers.hash b/board/stmicroelectronics/stm32f469-disco/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
new file mode 100644
index 000000000000..d8e8263e9eff
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  91bfc0ea152ce7b102a0b79d35a7c92843874ebf085c99d2ba8b4d85e62b1a7c  linux-5.15.162.tar.xz
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..97a2b4eaf95b
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index 689a12941630..d440d6d2017f 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -2,6 +2,7 @@ BR2_arm=y
 BR2_cortex_m4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh board/stmicroelectronics/stm32f469-disco/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 000265d83155..5a9d3e8afc77 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -4,6 +4,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_ENABLE_LTO=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
