Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B2FFED9EC
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 16:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66B6040C85;
	Tue, 17 Mar 2026 16:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMQCcqWFq5RN; Tue, 17 Mar 2026 16:27:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50D4C40A14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773764832;
	bh=HoJJvZCWbJ3TnKol0hKiIDl+abKZEFvLh5wB/yziQEQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W2FCahspn8gZhxLLKKAjp4Aq4BCusxBfybX4ndtHTFRJRcxD3s7Xf3MiG8IOLffiI
	 eGapXAO4QAo/Zaw0PtA14MH/d1f0CzZ0wk066OoDuSykD3Y3+7VzUDjQvIDe1W5X9o
	 izKIfm6b1OLFNet5HKvt3xqe94/GI6sTxjm0AlT3NqeSECVel+Z6VuTNHVZPdfLjdu
	 eaFIXx3yUOOfQHus5jg7C0L1I2p+woOFNcohsyx3eSP9t3GLfMeBnaV1gjIFAeS5rJ
	 Nujtbs0CqMKqIbtGxrqpwBejYmxC0fyrXq0ct1vBVH3hV9DFNdFUsos0E9LKENZr0b
	 oQPFZY2GILXnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50D4C40A14;
	Tue, 17 Mar 2026 16:27:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id 634CAD3
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 16:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with UTF8SMTP id 47A0983DA7
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 16:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id iSfUFFgD1eCS for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 16:27:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=162.62.57.87;
 helo=out162-62-57-87.mail.qq.com; envelope-from=wangdong115@foxmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B48D82207
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B48D82207
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com
 [162.62.57.87])
 by smtp1.osuosl.org (Postfix) with UTF8SMTPS id 2B48D82207
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 16:27:06 +0000 (UTC)
Received: from DW-MiBook.lan ([240e:305:188b:e000:8bad:9e8a:6182:9856])
 by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
 id 4D9122CF; Wed, 18 Mar 2026 00:19:25 +0800
X-QQ-mid: xmsmtpt1773764366tqrl3kkdh
Message-ID: <tencent_050C53AA1542B502959C63391A9BC01BC208@qq.com>
X-QQ-XMAILINFO: OeJ9zRfntlNPUK9l/Z9xiC73Srt6CAr4D9S4G6Nz9NDJ3+tgzzGDdRPssRKDlW
 QltjhWK685P9aqjTuHdYD+83LM84b892kP5qmlWA24PgpQuiXt6QGaDdtR226n7mVwzCCEINea6P
 cDoTDwQSKm39uCaPTPAqqKxEBm6slj9I477j9I/9mqToULe5sTqoq4EACC0T1MLfIPQw3OGm1z+O
 rsdyISzi5XLWl73yaE/ziK7eHz4HUmafsEruZwnI4YSSmh6TMwfebH4NqNo1kohnuyM4Z/4g12pQ
 g6RiN7xc/QMiwZbIaUSQCo8su2QmJosvvmOy7MRjSw2hWA7z43f4EYXmmiJ6b1T7iQwuOQELgMod
 kLti2VZ0rtPAh1PWTJGaAEGkzJ7Uj2G9sdDi1laST5yF44dM+f3/kzkxeHhVPxswv1X6VTRFnraZ
 fsovDojSrNWTXXGL4fyaS7kGq0x4K6mZGvWuTwWp+c8328SHd5Ubc/MEsFLY9hJElgqsH4ucLYvR
 QL8P5SauzlEexXNFRI7yvLEHaLCjQK+zStStmJfPJYHmcenaj8lM2PtpyNbbEoa6EY9XxfojzskS
 gAEX819WJRQcIRKmQrZvzmhKNrDntE187R1gF3f4cIhepLJiJp5X0AHnNqaDN2anvrGlXj4m6Mex
 lN2m8VriciZx+hdDUDmw43/leW6nAT5iciigG0TwqwDnhHClGfb2DXvUU8i+AyrrxYP2cD9Cq2t+
 oMPHGQ61Aqyu4285uNoLYet6cyQO4hYp31jYQBjp021fFrJKEytEeweDf2jDfyr+G7WqWBvPRVQu
 EApp+6ht/AZdjg/Z/Pscg2vJKWTZRHauoBltfPKsGqjxQ2cNb4BK2YZuHO/oIZFrQsMnUulaeknv
 6lwAcVeSQPnQbYTxF2dSj7QwFCIKdWWRRlLXhnQ6CZNUvMrbOLDIO2nebbM7FGdRbViGPI9HoELp
 +cjGXOmGQQorLQoHHHQ/H9bQ34AFu2v9jXBwrgpIp8vzWIwqjUCE4NCY5NaLBrdeDMY5Or9RNiqy
 Tm23PiQpwoqkkC9hr26b1nC43fjg9boB6P+o8r5BBuPXakbaDMa5ontF738RpYTYf/pKBxOM1nKg
 XTtRbHDC8uZRWEohJEZRdHvUAGzeAwbD3LtSg1JQX7xlg7Teh+Jozo6rWmKSMeSekefIrgqhcQDa
 n+77A=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Dong Wang <wangdong115@foxmail.com>
To: buildroot@buildroot.org
Cc: Dong Wang <wangdong115@foxmail.com>, Gilles Talis <gilles.talis@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Mar 2026 00:17:58 +0800
X-OQ-MSGID: <20260317161759.36050-2-wangdong115@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317161759.36050-1-wangdong115@foxmail.com>
References: <20260317161759.36050-1-wangdong115@foxmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foxmail.com; s=s201512; t=1773764822;
 bh=+WI/K6bF+9ftKrFQaMCLp2SCh29ZM+MkC342Sr/sIJo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=y0slM8OoItMd6A4mH3pmjuDqEC5rnPHkVVKd5a7SNT87Tu9phPyfz2zfnqzW7E4ep
 sSEmbksvN6a+F1p/xcTjkd/4ZccNeEs8EJEQ6/YvhxJQbnhXX2AaRjQNYGGgOhYtrP
 EsnUBarUVGOpFXsiNCcRvMr9Ep2e0ZYb6ZfBEQ6A=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foxmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=y0slM8Oo
Subject: [Buildroot] [PATCH 1/2] configs/friendlyarm_nanopi_neo: bump to
 kernel 6.18.18 and U-Boot 2026.01
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

This commit:
- bumps the Linux kernel to 6.18.18
- bumps the U-Boot to 2026.01
- switches to a stable glibc Bootlin external toolchain

The updated U-Boot should also fix the CI build of the board.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392712

Run-tested on the board.

Signed-off-by: Dong Wang <wangdong115@foxmail.com>
---
 .../nanopi-neo/patches/linux-headers/linux-headers.hash   | 1 -
 board/friendlyarm/nanopi-neo/patches/linux/linux.hash     | 4 ++--
 board/friendlyarm/nanopi-neo/patches/uboot/uboot.hash     | 2 +-
 configs/friendlyarm_nanopi_neo_defconfig                  | 8 +++++---
 4 files changed, 8 insertions(+), 7 deletions(-)
 delete mode 120000 board/friendlyarm/nanopi-neo/patches/linux-headers/linux-headers.hash

diff --git a/board/friendlyarm/nanopi-neo/patches/linux-headers/linux-headers.hash b/board/friendlyarm/nanopi-neo/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/friendlyarm/nanopi-neo/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/friendlyarm/nanopi-neo/patches/linux/linux.hash b/board/friendlyarm/nanopi-neo/patches/linux/linux.hash
index ecff37638a..020dc72386 100644
--- a/board/friendlyarm/nanopi-neo/patches/linux/linux.hash
+++ b/board/friendlyarm/nanopi-neo/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  93218296934915636fe6ba08e125948424cc270fd8948502c0ab91087a9fccd8  linux-6.6.44.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  f4855f382c1b735c84072bdef36db5bcd5dc7b0c37e42f5104317149a0a486ef  linux-6.18.18.tar.xz
diff --git a/board/friendlyarm/nanopi-neo/patches/uboot/uboot.hash b/board/friendlyarm/nanopi-neo/patches/uboot/uboot.hash
index fe9b4f53dc..b6a925ea4e 100644
--- a/board/friendlyarm/nanopi-neo/patches/uboot/uboot.hash
+++ b/board/friendlyarm/nanopi-neo/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/friendlyarm_nanopi_neo_defconfig b/configs/friendlyarm_nanopi_neo_defconfig
index 9aed25b30c..4874a144eb 100644
--- a/configs/friendlyarm_nanopi_neo_defconfig
+++ b/configs/friendlyarm_nanopi_neo_defconfig
@@ -1,7 +1,9 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-neo/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="nanopi-neo"
@@ -11,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.44"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h3-nanopi-neo"
@@ -21,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
