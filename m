Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C607CD1297
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 17:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C02E040634;
	Sat, 31 Aug 2024 17:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swbPoqZ4IE3E; Sat, 31 Aug 2024 17:56:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99AFE40651
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99AFE40651;
	Sat, 31 Aug 2024 17:56:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BF2D1BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79B68819BE
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35LMvAWhozv3 for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 17:56:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C48B819BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C48B819BC
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C48B819BC
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 17:56:11 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-71433096e89so2397000b3a.3
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 10:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725126970; x=1725731770;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x7dWwx9hnatxtBLLKjGbGZt9IVTemSkbI78PX7uNSW0=;
 b=ZXDuMwUgLYPQoM2hamKNLrmpUpCs4VoVU9uviyNK6QodpOJvsxxNYZ5DAgK4cc/xok
 YfrB2h8snmd3e4XD6M2dp0RgPC1OpIbxY++dOMB8J+bHrYQsNQG83zMnmatA/oXk4lhU
 Mno/GMhKG37LoRjGJk+WKndtGfHfEJ8pUMNul87ChRsP1o7u8BxrhKmTW4SRbDRtYuZp
 z49eIKrZn4hxNgJll4rThVrKaIMFgAHULmL0wmENis+w/A5Ww38KRmv8TuXv+vy/EgVX
 bGYm7qkQqukSd9VBtJPDbxvE0QpEv+yZXmy92cLl0/fva9wJ0Rp3TJxCIhFgmRH3kqkp
 BBKQ==
X-Gm-Message-State: AOJu0YyDJvPyubyPfoZhtlJP7oDoA9ubR8AWNVgD9hxGXhsElbKSRYYA
 zL8pCtSIxq629cQKnx2wF7CmmDKWVbsBPF4Shny2Y8zUaCAzlp+3sfY15g==
X-Google-Smtp-Source: AGHT+IGshx2PUmQPMtwze05XfTO6vv57P0kEwYo2J9YDiUaP7u26LaIK3CqQIARIV1D2av4HkAnd2w==
X-Received: by 2002:a05:6a21:6f83:b0:1ce:cce2:f182 with SMTP id
 adf61e73a8af0-1cece5e2fd9mr2689239637.50.1725126969850; 
 Sat, 31 Aug 2024 10:56:09 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:4b64:e272:399d:79be])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d6f76sm4820087a12.91.2024.08.31.10.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2024 10:56:09 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 14:56:00 -0300
Message-Id: <20240831175600.3952894-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725126970; x=1725731770; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x7dWwx9hnatxtBLLKjGbGZt9IVTemSkbI78PX7uNSW0=;
 b=fP722YGraqduGMaGgjGfFuAvHTapXz5myhVw5E+xqh2ko0UYMGmgGDAwMc4PtBfQdX
 OxkzCKSKfEgnbkMKPvCqn/iDknSSQtTNWiNvbK6xukd1a7BIuDP1o7fZjf01RY8UPdMz
 +Pyspv2KHWZtcBrqAPNJ4WYQzpmJfYuCeLn+0kjhDOrSB/eUQAZt9a46YqPg/u1fmk/Z
 UsiFn6Qns857eHjkIoorE/WwR2zeA6cDhjZNbeiKpSVkC68D/FSKnvlnlGr52ohT9VW+
 qNad0vBoGrw1zbuftk3jbkplLqSf7jrKPa2h8bneKOjGPVzUqPz6RIDxjwKhTwl5DEaq
 cbKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fP722YGr
Subject: [Buildroot] [PATCH] configs/imx6sx-sdb: bump U-Boot and kernel
 versions
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump U-Boot to version 2024.07 and kernel to 6.6.46.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6sx-sdb_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/imx6sx-sdb_defconfig b/configs/imx6sx-sdb_defconfig
index c36520a165dc..14a5c5f2718a 100644
--- a/configs/imx6sx-sdb_defconfig
+++ b/configs/imx6sx-sdb_defconfig
@@ -3,23 +3,23 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sxsabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.46"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-sdb imx6sx-sdb-reva"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6sx-sdb nxp/imx/imx6sx-sdb-reva"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 # required tools to create the SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
