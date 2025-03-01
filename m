Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A239C021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 14:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECB654F083;
	Sat,  1 Mar 2025 14:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jv8VJs-lhyI5; Sat,  1 Mar 2025 14:27:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B80044F09A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B80044F09A;
	Sat,  1 Mar 2025 14:27:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 029F768
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8EBC40AFE
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXATaTFUZMV5 for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 14:27:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::933; helo=mail-ua1-x933.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA50340118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA50340118
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA50340118
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:27:18 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-86b5515dd5fso433485241.1
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 06:27:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839237; x=1741444037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S7hVQnN243eVcZI/OrTetK6ZhICzmfut2LsHobQDHLc=;
 b=xOq6W0CsF3odjur565tUQLE144GSajcFL+ryx7EkzC9mxA8AsQlu1yy8BggxWwtIIK
 ZKtWvZz6PfJeWjVUCZ/AY13VuDrJXeeKRh3G0pBi3IlIqIf58NAN0CWEFUFTttLz2UhL
 PMFuItuAcvZ6382KES+FI2QqcS0PMyIHYR/iiWTDmiBgNLqEM0bqEeorQtxZOnDMLUQF
 gmXGlrca5lA264O2TV9v7xAlievCZWlM2ZVndqnOe5GiHFUn6QTYKeL76ddFV6tbqiyv
 faEtlB1lxMcfDCTQAdLuNOmly13Ks5r8VVRhiX2xrTyuRwpadL5lTWJ1v8r8BJqRUajU
 Tcpw==
X-Gm-Message-State: AOJu0YyRcp88BlKkAToJgBuWGRK1UXcbR/YCSuao2YKYayGucR/nviWG
 juaN/oz8+zG+p8KRjTh0YIFp28xlX+oqkmzXcm2VSM/EZG++L5NKY4qE1LrZuyw=
X-Gm-Gg: ASbGncud1x0JaBz1v8QNBzGP6PcBZC5jutANc+bhiUZS/hRkCWCLYfQG/qtstvHcGMJ
 h9j0Hbrbyx62U3xG+ckNKKRcTQ5ninCGDQCpjT4V22X6902eD52EAeqmJuzUE5NdnjDYBpgVJcf
 mAm1HGCISv9w942k9Yl646zxlJhCuWb3/BdoNEZXJgh3q/YwaruViITG4teApYj6vISKpJdSMcI
 f+JqFRHOehCOvo55/GRbgdKcI4h162PiQ0KwdiQvumo1cBGDuuXeJTYdZknIz8sYfpzcTw65mxI
 vLrAKleJKbcolkRkbNh48wbiBNjgwEa5Bbakv+XISZ21UDbAamJtV/3J0kWk6HjL6A==
X-Google-Smtp-Source: AGHT+IGFvCJhbSaPF0pWoJlf22f2tynigesC5eyqj/jttBFmEMl2NkmL/QPaPjkR8GOXxxXNaO5XPA==
X-Received: by 2002:a05:6102:440b:b0:4bb:dfd8:418f with SMTP id
 ada2fe7eead31-4c044f481c5mr5098393137.23.1740839237263; 
 Sat, 01 Mar 2025 06:27:17 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:148d:1710:e8e3:b53d:c3e3:1bc3])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-86b3dc1359esm858841241.10.2025.03.01.06.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:27:16 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Sat,  1 Mar 2025 10:26:18 -0400
Message-ID: <20250301142619.72570-11-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250301142619.72570-1-gilles.talis@gmail.com>
References: <20250301142619.72570-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839237; x=1741444037; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S7hVQnN243eVcZI/OrTetK6ZhICzmfut2LsHobQDHLc=;
 b=DxeeRAHZBmxIPc+Ru7HwLjOGDCOINhdSPPLaNg39yyTmOw6HpX29rKduDQlCbyUTkj
 Y8E8QM2+dFQSPebuD2/e1GBioMlrmYBzSDVeFZLYRwt+d8yFoTvN9XRYX2gGjv7k9oLt
 3aFkDYecEQOBSaVjreIHZQtu66Q2M7/6GcAzcvKoUmkwY6b7ciZUs7IYLp0+Nfxnjvaa
 5L+vauZlnCfj/PAtoQPEXeBYVUI3bIYUQ6ZCbI32eKQFA7eMV4vPeqXmOvYguWggtAqC
 Ub0svmIIwDSruAIvno7EZqA3ZbnyjVGngQlzRkmPBXZGxnCRHpR3oWwenldoefiRKT2R
 EdwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DxeeRAHZ
Subject: [Buildroot] [PATCH 10/11] configs/freescale_imx6ullevk: bump BSP
 components to lf-6.6.52-2.2.0
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

Bump U-Boot and Linux kernel to the NXP BSP lf-6.6.52-2.2.0 versions.

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 board/freescale/imx6ullevk/patches/linux/linux.hash | 2 +-
 board/freescale/imx6ullevk/patches/uboot/uboot.hash | 2 +-
 configs/freescale_imx6ullevk_defconfig              | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/freescale/imx6ullevk/patches/linux/linux.hash b/board/freescale/imx6ullevk/patches/linux/linux.hash
index 3c4223976b..620a7377ef 100644
--- a/board/freescale/imx6ullevk/patches/linux/linux.hash
+++ b/board/freescale/imx6ullevk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c70adedadce88f8685cb26d9703b930292c1349138e2c55ed9b4cd6e277de3bd  linux-imx-lf-6.6.23-2.0.0.tar.gz
+sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/imx6ullevk/patches/uboot/uboot.hash b/board/freescale/imx6ullevk/patches/uboot/uboot.hash
index 4e0d729ca0..4b763ba3ba 100644
--- a/board/freescale/imx6ullevk/patches/uboot/uboot.hash
+++ b/board/freescale/imx6ullevk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  179b6531ef1d4ce681d139741ac7b4144220c90b7223297df28b61e98e8d37fc  uboot-imx-lf-6.6.23-2.0.0.tar.gz
+sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
diff --git a/configs/freescale_imx6ullevk_defconfig b/configs/freescale_imx6ullevk_defconfig
index e29a9898fc..6474228c64 100644
--- a/configs/freescale_imx6ullevk_defconfig
+++ b/configs/freescale_imx6ullevk_defconfig
@@ -8,7 +8,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx6ullevk/linux_sdma.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -22,7 +22,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
