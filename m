Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C687BEB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 16:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D4BE41B42;
	Mon, 26 Jun 2023 16:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D4BE41B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sWTPpKcptQe1; Mon, 26 Jun 2023 16:02:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D699341B54;
	Mon, 26 Jun 2023 16:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D699341B54
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85E771BF3D0
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CC1F40493
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CC1F40493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZiFcGm-colN7 for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 16:01:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9466D401A4
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9466D401A4
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 16:01:01 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1b801e6ce85so8390165ad.1
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 09:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687795260; x=1690387260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K1jk1Bim8QQqc35MfXvAYWnqntGfYjdICubeWOHM+Ng=;
 b=ZcQP5bULRbxvUG00SBgtXhPnJzoKfQxP4/LcX/0kQx1hVLB/Vp8OLmuPhPMvNgttJP
 mrZXP3wD9yhkTuEf0jV28wkB9a6YSc5FT2Y6YTkYxUa3XrfTNvsizxFvMJ1bDsZNG3K2
 osA4yt6L+DJyHFphaQhI0uCunh/f0SHLgnl0GseOAtqzvv2U5IImL/HPiZl/X0zncZFt
 p7nd7a2eqguOZ+4Bwbu5grMXgKPWBbIjphxhX1pEYPNex/zeszNOeHAZC48Xvv0YiNgQ
 lilkQWHndowt0NuQSI/BD0znGZCp2gX+iQWIvb/I+bBgGtmlhGCKmxeRxvP6ld90VIli
 dzgA==
X-Gm-Message-State: AC+VfDx4hx0U+uPH4mMJ3sYGcD0mLGGs2y/1nYdo0q5JWaUQalz9fgFq
 GfMDbDTUM28+VHwzkfYQ7oz9oHzJLZGmYg==
X-Google-Smtp-Source: ACHHUZ5r5BoEwyiP01m7usupfgLXDajofK62FslK4xtovw/9ys82xiBBAfOWmtWjjX4Y5xxAMzpMcg==
X-Received: by 2002:a17:902:650e:b0:1b6:b445:36d0 with SMTP id
 b14-20020a170902650e00b001b6b44536d0mr8306097plk.26.1687795260034; 
 Mon, 26 Jun 2023 09:01:00 -0700 (PDT)
Received: from ubuntu.. ([149.28.154.72]) by smtp.gmail.com with ESMTPSA id
 x3-20020a1709027c0300b001ab1b7bae5asm4352343pll.184.2023.06.26.09.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 09:00:59 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 00:00:26 +0800
Message-Id: <20230626160030.93063-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626160030.93063-1-bmeng.cn@gmail.com>
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687795260; x=1690387260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K1jk1Bim8QQqc35MfXvAYWnqntGfYjdICubeWOHM+Ng=;
 b=UfaeZqtzKiIa3VZLkYVCGCNuvF5Cc3BKtGgwaWHMzbTL/NsYDQo+WVqV35YL3uuvJP
 whKTJN0CglXLDkwK/zkqPDBjxWgV/diRRGQnyAW7dO82yXVJtQmO9XT5FEhoQma/h/4Z
 Urykx3+SWt5LPrtZqVkI8+95YS4+g3X0xD/sp6xPqlq2lX5lKvv7GPwfMNLUE9WUySrW
 alKtdAaMAXGuKTskxw5lNz5w0Ns7tqUo3MGRU+ZggzY77pQKOCKcYk2V8cMneTDpKfqK
 56BzSGALifuEs7Jv+XamHxmbc2Gzpq/H+/vRhc1N87hMmdc/1DFoMu1W6i/WTdlJKaPT
 0msg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=UfaeZqtz
Subject: [Buildroot] [PATCH 06/10] configs: riscv: Drop
 BR2_TARGET_OPENSBI_CUSTOM_VERSION
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
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bin Meng <bmeng@tinylab.org>

Since commit 64f1f82385b2 ("boot/opensbi: Bump to version 1.2"),
the default OpenSBI version has been bumped up to 1.2. With that,
there is no need to define a custom version in each RISC-V board's
defconfig files.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 configs/hifive_unleashed_defconfig      | 2 --
 configs/nezha_defconfig                 | 2 --
 configs/qemu_riscv32_virt_defconfig     | 2 --
 configs/qemu_riscv64_virt_defconfig     | 2 --
 configs/sipeed_lichee_rv_defconfig      | 2 --
 configs/sipeed_lichee_rv_dock_defconfig | 2 --
 configs/spike_riscv64_defconfig         | 2 --
 7 files changed, 14 deletions(-)

diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index 80c5e48f96..013a1423c0 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -38,8 +38,6 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # Bootloader
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
 BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
diff --git a/configs/nezha_defconfig b/configs/nezha_defconfig
index dd94707905..b4c5b4d0ba 100644
--- a/configs/nezha_defconfig
+++ b/configs/nezha_defconfig
@@ -15,8 +15,6 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
 BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index 03c871282e..01922ac151 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -25,8 +25,6 @@ BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
 BR2_TARGET_OPENSBI_PLAT="generic"
 
 # host-qemu for gitlab testing
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 666500d889..8b729f137d 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -25,8 +25,6 @@ BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
 BR2_TARGET_OPENSBI_PLAT="generic"
 
 # host-qemu for gitlab testing
diff --git a/configs/sipeed_lichee_rv_defconfig b/configs/sipeed_lichee_rv_defconfig
index 750d2d6e3b..8ad587d35f 100644
--- a/configs/sipeed_lichee_rv_defconfig
+++ b/configs/sipeed_lichee_rv_defconfig
@@ -14,8 +14,6 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
 BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
diff --git a/configs/sipeed_lichee_rv_dock_defconfig b/configs/sipeed_lichee_rv_dock_defconfig
index a228cd8cb7..b6ac7aa31f 100644
--- a/configs/sipeed_lichee_rv_dock_defconfig
+++ b/configs/sipeed_lichee_rv_dock_defconfig
@@ -22,8 +22,6 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
 BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
diff --git a/configs/spike_riscv64_defconfig b/configs/spike_riscv64_defconfig
index 73ea566084..a6f746eb3f 100644
--- a/configs/spike_riscv64_defconfig
+++ b/configs/spike_riscv64_defconfig
@@ -9,8 +9,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
 BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
 BR2_PACKAGE_HOST_RISCV_ISA_SIM=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
