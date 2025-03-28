Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF49C28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 19:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE67185142;
	Fri, 28 Mar 2025 19:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mQDVCfG-Y1tW; Fri, 28 Mar 2025 19:57:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E7FB8598F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E7FB8598F;
	Fri, 28 Mar 2025 19:57:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A43DA19A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 19:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96BA9405B1
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 19:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MWhyvxOGeEJh for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 19:57:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=francois.dugast.foss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D1A0D40147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1A0D40147
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1A0D40147
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 19:57:48 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39c0dfad22aso673577f8f.2
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 12:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743191867; x=1743796667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U4o8GTFaD3nByBot8WlA5hCAd9eR53sVDscwTo6CK7M=;
 b=a7fMh5wLpJi2WKcLubVmurp+j8TrzwPdP3Q3gEXVh+VOTGp4xC0cbDuKq9/Tzd7Qyy
 8IqpvPQT0Aye9XS16gHldQEawy0MpQynKGCMAOeVDuNBxJSVuqSTRjlNPBad0+3DufX6
 0C7XUarFylTpHCQ1rCSh2JyZcTQanNuWIcYUq79lj9DaEs6jca3vU9fDf7JxJh6BI1aj
 /l18AAlQ2YyRlBU1lGVbQiLOgSLqFQHvku8h5D1ZUU0ZX5zlx/vs0lJgpAdeIJl6vN6P
 6BkxhMM5pi77G33Kv3kR9BWOf+xxAlHIZnj8ndinotnPwX2ffV37CRJDWhBV0qsJwE13
 rJ+Q==
X-Gm-Message-State: AOJu0YwT7E4mAwTTFfN2UMTa34bbkQ2P6PQC3HSWYj0g9uhO1/LeUn3g
 1JVBhL1vPa5TYuhUYtWXFNRjuIv/5Mq+PjQKQvRfJBlX7UtNnhoKHyO+ZA==
X-Gm-Gg: ASbGncvXNo1ttr9i3lRoz8EYEH6qbqjnNtlN5l8cp1/a95cY5v3x+p+oKDZwreNdvNp
 AXXcNwYYAmQWZYLwmYRn549lhyDnJQ0ualM5FLVWq8yephgLF6D261OFYdoujLJUfI5nHGPoA+t
 l0KyTKTNIkmNFYiJKAme0hGWRsaZsZneIoPwBw62NACbjnhbq7H03zfgfqREDAnRy3bTR4DLr6j
 FZCN1l2JyAl5hrgL/g9Gntg8EWauj0LsqZ50SnwxOKo6y9//9LlYsCaZyacRlSmOiLjP/sjkCom
 b9F2vYCasm5DsaygCviwECOSUi9xc6GcDBaFe6h4Oi7W2vUCU89iaT5D0E9/QuYWM0mY7EZb2x4
 Lv0Xp09q+Kb8uZyjbbE0yNBbrbhQd
X-Google-Smtp-Source: AGHT+IG/NImXOaTZj7/1mSAuiVGwT0/GqBLeFz7+F+/wVMN85iy/Nhmbtu7brn5R5SqBYBfcLwInMw==
X-Received: by 2002:a5d:6d8e:0:b0:39c:cc7:3c5f with SMTP id
 ffacd0b85a97d-39c1211cf98mr333380f8f.45.1743191866457; 
 Fri, 28 Mar 2025 12:57:46 -0700 (PDT)
Received: from comet.lan (lfbn-ren-1-1629-205.w86-253.abo.wanadoo.fr.
 [86.253.181.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e0dcsm3552272f8f.64.2025.03.28.12.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 12:57:46 -0700 (PDT)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>, ju.o@free.fr,
 Francois Dugast <francois.dugast.foss@gmail.com>
Date: Fri, 28 Mar 2025 20:57:41 +0100
Message-Id: <20250328195741.3921731-5-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328195741.3921731-1-francois.dugast.foss@gmail.com>
References: <20250328195741.3921731-1-francois.dugast.foss@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743191867; x=1743796667; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U4o8GTFaD3nByBot8WlA5hCAd9eR53sVDscwTo6CK7M=;
 b=bCH6rL1U2RT2I9iy5ZGPyfoMNj/godzAajk/qf+v1d5U0IBG9NM/kwtJlyhG7IG1Sp
 ENbEU4Y7H6lQrw7Hh6Py1wPE6SXHYEaf2KtADIRYoqsHaJ7f7rcBwP9wttDmAlud4vTA
 9QCoi/1er/Bo06HLRpYTcmnYU7xmMiVNDQ2gsslyesMjTUQ+DfcJZYCpXdwXE24lAYpw
 4b5QXf+8JAa12vW11Nwwk4fQmzzuRG2G+cpjs+I8GaaVNokecPI6Ev5qhPqfXZrChjHU
 Na4LoIrIaPJb4vDpNhxJdyyIQClseu3okKCKSo37Pjc7lVkPW0lmgkYALKW9DNZGgc71
 cLGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bCH6rL1U
Subject: [Buildroot] [PATCH 4/4] configs/hifive_unleashed: enable
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
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

Comply with the rule to use BR2_DOWNLOAD_FORCE_CHECK_HASHES in
defconfigs.

Also, align uboot and kernel versions to those used in the Hifive
Unmatched defconfig to make maintenance easier.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
---
 .checkpackageignore                                       | 1 -
 .../patches/linux-headers/linux-headers.hash              | 2 ++
 board/sifive/hifive-unleashed/patches/linux/linux.hash    | 2 ++
 .../sifive/hifive-unleashed/patches/opensbi/opensbi.hash  | 2 ++
 configs/hifive_unleashed_defconfig                        | 8 +++++---
 5 files changed, 11 insertions(+), 4 deletions(-)
 create mode 100644 board/sifive/hifive-unleashed/patches/linux-headers/linux-headers.hash
 create mode 100644 board/sifive/hifive-unleashed/patches/linux/linux.hash
 create mode 100644 board/sifive/hifive-unleashed/patches/opensbi/opensbi.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 14f1a40a7c..5ee192e437 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -146,7 +146,6 @@ configs/freescale_t2080_qds_rdb_defconfig lib_defconfig.ForceCheckHash
 configs/friendlyarm_nanopi_r2s_defconfig lib_defconfig.ForceCheckHash
 configs/galileo_defconfig lib_defconfig.ForceCheckHash
 configs/globalscale_espressobin_defconfig lib_defconfig.ForceCheckHash
-configs/hifive_unleashed_defconfig lib_defconfig.ForceCheckHash
 configs/imx23evk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6-sabreauto_defconfig lib_defconfig.ForceCheckHash
 configs/imx6-sabresd_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/sifive/hifive-unleashed/patches/linux-headers/linux-headers.hash b/board/sifive/hifive-unleashed/patches/linux-headers/linux-headers.hash
new file mode 100644
index 0000000000..2c68ef093b
--- /dev/null
+++ b/board/sifive/hifive-unleashed/patches/linux-headers/linux-headers.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  230e89b07b0ab82e74f07ecc1bee3105dca81d0ef4a97f900929c407249b6ac7  linux-6.12.20.tar.xz
diff --git a/board/sifive/hifive-unleashed/patches/linux/linux.hash b/board/sifive/hifive-unleashed/patches/linux/linux.hash
new file mode 100644
index 0000000000..2c68ef093b
--- /dev/null
+++ b/board/sifive/hifive-unleashed/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  230e89b07b0ab82e74f07ecc1bee3105dca81d0ef4a97f900929c407249b6ac7  linux-6.12.20.tar.xz
diff --git a/board/sifive/hifive-unleashed/patches/opensbi/opensbi.hash b/board/sifive/hifive-unleashed/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..1408f547b8
--- /dev/null
+++ b/board/sifive/hifive-unleashed/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  8fcbce598a73acc2c7f7d5607d46b9d5107d3ecbede8f68f42631dcfc25ef2b2  opensbi-1.2.tar.gz
diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index f96e171e43..6e201a3e16 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -5,7 +5,9 @@ BR2_RISCV_ISA_RVA=y
 BR2_RISCV_ISA_RVF=y
 BR2_RISCV_ISA_RVD=y
 BR2_RISCV_ISA_RVC=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/sifive/hifive-unleashed/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttySIF0"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/common/post-build.sh"
@@ -13,7 +15,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/common/genimage_sdcard.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.190"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.20"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/common/linux.config.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -29,7 +31,7 @@ BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sifive_unleashed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
