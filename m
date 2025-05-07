Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47ACBC3ABC0
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 21:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2D4E40E39;
	Wed,  7 May 2025 21:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DgX5_n289ITe; Wed,  7 May 2025 21:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B1DB40E32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B1DB40E32;
	Wed,  7 May 2025 21:21:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E12FC15A
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1D3861325
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yuYp2WORfsyY for <buildroot@buildroot.org>;
 Wed,  7 May 2025 21:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A849D61021
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A849D61021
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A849D61021
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:21:16 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43d0c18e84eso1664465e9.3
 for <buildroot@buildroot.org>; Wed, 07 May 2025 14:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746652874; x=1747257674;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nkTP7rC6An8W4aMoA+7aL4FkDcd5mE7Cm8qa76vXOrY=;
 b=N1C5PRjMe1NcdSdPT8I0KgW+Ea+4LV4hskwrwB2x29ewt0LzQiblP1s4BpJa3VjS+k
 ci9t/MnabnCmue7cL7pl4lELHdhnxqJRwf5NETJTnKM7SAVC9lkvc63CTL1nsPWDzmTR
 Jao/AF2piBHBvBXoqC1jQru7Czv3h4lUFX23qPJXjN8VkrpYv8dBbs+D9M3raFEib5nu
 tpwiYQe3mYDOd5RfqOZlc4yYzeS9U9ym+2u4ibh+ZCul6qGjH7FrFJeVOVwmdY89h1PR
 ZeFKwNfNrnxrlDtvKTLosqhiGfwfF1fH3k+ZXhxW4Q8YmWLSl4VZscK1y3NM/1em8462
 vCXw==
X-Gm-Message-State: AOJu0YwTYhVuLTItCc1LqtuqxvZXUMH18pCiyYVpTfca71JKmPmjdF1b
 rBRTpiNGR2YgSgEr75JKen+l8cbbfzF8s6NqExTGIqM8qmBKfdpyC7zrVStZixWj5QZI0oQB7Ug
 z
X-Gm-Gg: ASbGncvAnxW2KfXPOcjkNW1tor6eOCfjKvWLQ16s3TpOaKkhF7ZfwlrT1HApF/FFZR3
 ARZwChr4bGjfqPvLguTS5NASTqn4DFfFGMUvr4/zjThhx8R6KA540fDRWISozUQV0ZtOWi6BPqJ
 kZ2p0roZN5jfBK60wl8DOjcf7N7hneDx0OOsMw9mHREemNZGs0seqB1Uq6a0j2Ak6yQIorNq1j1
 /2F22YP9jAf9sQgsgad4W6dSkQS1/sjCdpuMwJs4VEGDw3xuggIu9djpa47chpkxzmWLkbXk4u4
 oWKX/lqV99XFbHZ9bnOHwbg8LCqrVQmzXfDorK4ubI4PtLsMlMQ+C7T9LrkI3pl42MuUY1V/gii
 G5MyFNlscckXxB1Y4ypCgVvKgO99I22c0NGnPIes=
X-Google-Smtp-Source: AGHT+IFaZNUx04LpGhQLc34XWNPuuSCDIqLQ/tXzjKCBOrs55+bgVfYIK1zAtooWS467waSBYl8fSQ==
X-Received: by 2002:a05:600c:c0d0:b0:43d:77c5:9c1a with SMTP id
 5b1f17b1804b1-442d046e76emr9207205e9.4.1746652874394; 
 Wed, 07 May 2025 14:21:14 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d580083fd25921c9c7a4f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3b7e7fsm13109785e9.39.2025.05.07.14.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 14:21:14 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed,  7 May 2025 23:21:09 +0200
Message-ID: <20250507212111.748688-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1746652874; x=1747257674; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nkTP7rC6An8W4aMoA+7aL4FkDcd5mE7Cm8qa76vXOrY=;
 b=HPCvZwzVEtXBFmbtY/ojt3vAqwBW3HukcFmvi5+P241GaQsL0TlZY4P21Pg2AjPtPO
 n1IaVvAqoNlKs/c+VfpDQ/rfsgUHBULUwDtFY/5KIuRM3EZTc4irfAP/f7DvefuG0qSv
 dEAma+XMiEdIkaZFkK8iftlc90ui7+gtycfEU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=HPCvZwzV
Subject: [Buildroot] [PATCH 1/3] configs/qemu: update defconfigs to Linux
 6.12.27
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

Update all qemu defconfigs to the latest Kernel LTS version
where first patches fixing gcc 15 builds were backported [1][2].

Fixing kernel builds with gcc 15 is a prerequisite to build
and test new Bootlin bleeding-edge toolchains [3].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=247abefeb50d56c83ce7abda5a378e395ee8af72
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=593d852f7fe21a225df4866799b6b539de6b8255
[3] https://toolchains.bootlin.com

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/qemu/patches/linux/linux.hash       | 2 +-
 configs/qemu_aarch64_ebbr_defconfig       | 2 +-
 configs/qemu_aarch64_sbsa_defconfig       | 2 +-
 configs/qemu_aarch64_virt_defconfig       | 2 +-
 configs/qemu_arm_ebbr_defconfig           | 2 +-
 configs/qemu_arm_versatile_defconfig      | 2 +-
 configs/qemu_arm_vexpress_defconfig       | 2 +-
 configs/qemu_arm_vexpress_tz_defconfig    | 2 +-
 configs/qemu_m68k_mcf5208_defconfig       | 2 +-
 configs/qemu_m68k_q800_defconfig          | 2 +-
 configs/qemu_microblazebe_mmu_defconfig   | 2 +-
 configs/qemu_microblazeel_mmu_defconfig   | 2 +-
 configs/qemu_mips32r2_malta_defconfig     | 2 +-
 configs/qemu_mips32r2el_malta_defconfig   | 2 +-
 configs/qemu_mips32r6_malta_defconfig     | 2 +-
 configs/qemu_mips32r6el_malta_defconfig   | 2 +-
 configs/qemu_mips64_malta_defconfig       | 2 +-
 configs/qemu_mips64el_malta_defconfig     | 2 +-
 configs/qemu_mips64r6_malta_defconfig     | 2 +-
 configs/qemu_mips64r6el_malta_defconfig   | 2 +-
 configs/qemu_or1k_defconfig               | 2 +-
 configs/qemu_ppc64_e5500_defconfig        | 2 +-
 configs/qemu_ppc64_pseries_defconfig      | 2 +-
 configs/qemu_ppc64le_powernv8_defconfig   | 2 +-
 configs/qemu_ppc64le_pseries_defconfig    | 2 +-
 configs/qemu_ppc_bamboo_defconfig         | 2 +-
 configs/qemu_ppc_e500mc_defconfig         | 2 +-
 configs/qemu_ppc_g3beige_defconfig        | 2 +-
 configs/qemu_ppc_mac99_defconfig          | 2 +-
 configs/qemu_ppc_mpc8544ds_defconfig      | 2 +-
 configs/qemu_riscv32_nommu_virt_defconfig | 2 +-
 configs/qemu_riscv32_virt_defconfig       | 2 +-
 configs/qemu_riscv64_nommu_virt_defconfig | 2 +-
 configs/qemu_riscv64_virt_defconfig       | 2 +-
 configs/qemu_riscv64_virt_efi_defconfig   | 2 +-
 configs/qemu_s390x_defconfig              | 2 +-
 configs/qemu_sh4_r2d_defconfig            | 2 +-
 configs/qemu_sh4eb_r2d_defconfig          | 2 +-
 configs/qemu_sparc64_sun4u_defconfig      | 2 +-
 configs/qemu_sparc_ss10_defconfig         | 2 +-
 configs/qemu_x86_64_defconfig             | 2 +-
 configs/qemu_x86_defconfig                | 2 +-
 configs/qemu_xtensa_lx60_defconfig        | 2 +-
 configs/qemu_xtensa_lx60_nommu_defconfig  | 2 +-
 44 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/board/qemu/patches/linux/linux.hash b/board/qemu/patches/linux/linux.hash
index 464f5e4cd3..48552f63e3 100644
--- a/board/qemu/patches/linux/linux.hash
+++ b/board/qemu/patches/linux/linux.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  87be0360df0931b340d2bac35161a548070fbc3a8c352c49e21e96666c26aeb4  linux-6.12.9.tar.xz
+sha256  8f4655a4cc7f93d72f515bbca54756de26ddaf5949790da6a17f766e3c33dc79  linux-6.12.27.tar.xz
 
 # sha256 locally computed
 sha256  a76052c0c71d4025b117dcfc18ca7e189ac495a7645fa98c1bdaddca15cce815  xtensa_dc233c.tar.gz
diff --git a/configs/qemu_aarch64_ebbr_defconfig b/configs/qemu_aarch64_ebbr_defconfig
index d807f220bc..80e7c101ee 100644
--- a/configs/qemu_aarch64_ebbr_defconfig
+++ b/configs/qemu_aarch64_ebbr_defconfig
@@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-ebbr/p
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-ebbr/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_OPTEE_CLIENT=y
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 802f8c3d56..49511f87af 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-sbsa/a
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-sbsa/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index fb9db3f0fc..78b2a62047 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_arm_ebbr_defconfig b/configs/qemu_arm_ebbr_defconfig
index 587690a5d3..dc1b917ef1 100644
--- a/configs/qemu_arm_ebbr_defconfig
+++ b/configs/qemu_arm_ebbr_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/arm-ebbr/post-
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/arm-ebbr/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-ebbr/linux.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index febce57f92..998c337ca9 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_DEFCONFIG="versatile"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-versatile/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index b65d893967..63bfdc41de 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index 8ad9fbd220..e5de1a45b0 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
 BR2_PACKAGE_OPENSSL=y
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index be2eec0935..f50809809c 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux.config"
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
index a440b0f071..9cb7b61f13 100644
--- a/configs/qemu_m68k_q800_defconfig
+++ b/configs/qemu_m68k_q800_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux.config"
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 6a218ef40f..9d67d71920 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index bc8e40eaf0..46befedd57 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
index 1a3c1bbc3e..4ec4322dbb 100644
--- a/configs/qemu_mips32r2_malta_defconfig
+++ b/configs/qemu_mips32r2_malta_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
index 127006ec73..2901a5ff03 100644
--- a/configs/qemu_mips32r2el_malta_defconfig
+++ b/configs/qemu_mips32r2el_malta_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
index 7cb1d83b7d..bdbaa4030d 100644
--- a/configs/qemu_mips32r6_malta_defconfig
+++ b/configs/qemu_mips32r6_malta_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
index 80c3e33269..5ec51d34a5 100644
--- a/configs/qemu_mips32r6el_malta_defconfig
+++ b/configs/qemu_mips32r6el_malta_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 2341d2790f..a9c48afcd3 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 983ac8b8d3..61edea24fa 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
index f3015c9102..342140c957 100644
--- a/configs/qemu_mips64r6_malta_defconfig
+++ b/configs/qemu_mips64r6_malta_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
index 3ad6f3652f..e0dd72b981 100644
--- a/configs/qemu_mips64r6el_malta_defconfig
+++ b/configs/qemu_mips64r6el_malta_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
index 2ea8bfa190..42dc6ce969 100644
--- a/configs/qemu_or1k_defconfig
+++ b/configs/qemu_or1k_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux.config"
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
index e3fb1490e1..9237cdc2e5 100644
--- a/configs/qemu_ppc64_e5500_defconfig
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index d3f8f57232..eb6f2fe14e 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_ppc64le_powernv8_defconfig b/configs/qemu_ppc64le_powernv8_defconfig
index e1a9cfe661..d9586884e3 100644
--- a/configs/qemu_ppc64le_powernv8_defconfig
+++ b/configs/qemu_ppc64le_powernv8_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_DEFCONFIG="powernv"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
index 86952b3461..b7bc8e5d94 100644
--- a/configs/qemu_ppc64le_pseries_defconfig
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_ppc_bamboo_defconfig b/configs/qemu_ppc_bamboo_defconfig
index 7d2c61aa79..d851e4e4f9 100644
--- a/configs/qemu_ppc_bamboo_defconfig
+++ b/configs/qemu_ppc_bamboo_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_DEFCONFIG="44x/bamboo"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-bamboo/linux.fragment"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_e500mc_defconfig b/configs/qemu_ppc_e500mc_defconfig
index 590a049239..4728501ac9 100644
--- a/configs/qemu_ppc_e500mc_defconfig
+++ b/configs/qemu_ppc_e500mc_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_DEFCONFIG="corenet32_smp"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-e500mc/linux.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 9df8b8bc86..5d3fefc374 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99_defconfig
index 85c63aefa3..a28a58d268 100644
--- a/configs/qemu_ppc_mac99_defconfig
+++ b/configs/qemu_ppc_mac99_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_DEFCONFIG="pmac32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-mac99/linux.fragment"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 11808718e7..ad453efb69 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_riscv32_nommu_virt_defconfig b/configs/qemu_riscv32_nommu_virt_defconfig
index 3115f20066..dcf37c7b2d 100644
--- a/configs/qemu_riscv32_nommu_virt_defconfig
+++ b/configs/qemu_riscv32_nommu_virt_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv32-virt/linux-nommu.config"
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index a171ef4525..ac431413a4 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_DEFCONFIG="rv32"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_OPENSBI=y
diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
index 169eead244..9367010c27 100644
--- a/configs/qemu_riscv64_nommu_virt_defconfig
+++ b/configs/qemu_riscv64_nommu_virt_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv64-virt/linux-nommu.config"
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 82c289e1af..fd093a6162 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_OPENSBI=y
diff --git a/configs/qemu_riscv64_virt_efi_defconfig b/configs/qemu_riscv64_virt_efi_defconfig
index d7fdc861c6..8b9b232853 100644
--- a/configs/qemu_riscv64_virt_efi_defconfig
+++ b/configs/qemu_riscv64_virt_efi_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/riscv64-virt-e
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/riscv64-virt-efi/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
index a86df53aae..f9609075d6 100644
--- a/configs/qemu_s390x_defconfig
+++ b/configs/qemu_s390x_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 8762cc2ea9..63b9fa1b29 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index 01302a2e98..97cbd6bd8a 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index bea866eea9..469575ff61 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux.config"
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 90d98ce6fa..e8650652d5 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 7c7fc374d9..18bd7f2734 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 0a31327e88..70bc173037 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 4a3e530aea..d731499e5e 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 363ab27513..e2979d21c7 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-nommu.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
