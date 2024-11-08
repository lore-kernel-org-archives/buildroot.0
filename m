Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05069D5C0F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 15:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABCBA611AF;
	Fri,  8 Nov 2024 15:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulUTbgJv61A9; Fri,  8 Nov 2024 15:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90F5F61212
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90F5F61212;
	Fri,  8 Nov 2024 15:54:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DCC0C2
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 15:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E9FE61212
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 15:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTX6KiKnnPab for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 15:54:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D1909611AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1909611AF
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1909611AF
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 15:54:41 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-20c7edf2872so28830995ad.1
 for <buildroot@buildroot.org>; Fri, 08 Nov 2024 07:54:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731081280; x=1731686080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dKjBtWO/dKF8VYT4z8xJtgsrcNfA+oX3DUMCeNvGKqA=;
 b=fSLiP3bOdNYkVP7/DDWRc0/rgdm3oAwF34dP6FSMxaClIK+SMRzqq/W3Hs9MzpEFjt
 xuadW9DVdaltq+hm94EgUmZD+WR7rv29KvnnnDA+DO38HIkQfGbslAWkitEciLT4kVri
 w9JzQsDaEAdkbaseczNCoJ7slklnpcrXbnpBchg6iUxqk1SuvvPSflLEPVQZIi/bzh9V
 bVIbzHlnDx5+R6FYA+u1mHLs+jpe6VW0QHZk+PXvY6pOH9zfXX+HqRDmgumYWa2bVmLU
 XeMQlTN69myV9Sx7ECstO3RhSMAt/WDznCCCg74vd9GKr5F95YGpng6A/owsQDNCTqBK
 LX/Q==
X-Gm-Message-State: AOJu0YziFiBsbQLRwM9kaZcLzkgfbUF1F6NiKc3fRiTOyEjosxMShaZi
 fmBYyVSXK4asu3FGIxg2r+LtdePa76MdXNiSLQe7GXOsQkhP2P88NJDDtw==
X-Google-Smtp-Source: AGHT+IESWS/ShfVcfD1WlS9volYa2GvpkQyFNAacJBJhtJtxIf79wwJbk/BW7zrOERee/herxZZ7Rg==
X-Received: by 2002:a17:90b:3b42:b0:2e0:89f2:f60c with SMTP id
 98e67ed59e1d1-2e9b1f64f78mr5318872a91.11.1731081280395; 
 Fri, 08 Nov 2024 07:54:40 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e9a5fd180fsm3641897a91.33.2024.11.08.07.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 07:54:39 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Fri,  8 Nov 2024 23:54:31 +0800
Message-ID: <20241108155434.1924823-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731081280; x=1731686080; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dKjBtWO/dKF8VYT4z8xJtgsrcNfA+oX3DUMCeNvGKqA=;
 b=YUzdApRQWgHbXRH7tCs1D4HAk7c6Covzl5bTuemYUjQyBMK/Sb4Kpae1TLbZiumNl4
 Y/BxBqW+Lqqsa7gW9V8Zx1PPE7l6kD3XDcIqnFaIUvFgksvcaXnL9JA/t2wiB4/U3p+N
 HwH4JwCJq7dIaMjluL1psylAQGCoNTieB0mkKWX8N1M3IzwUCxrq6e2C92kAVSxblcxp
 OnKZa7xLXpqohkvB1N4qk9R+BeQYRYs3tbM088uhfHzIuKZnbsDe3DigWobriilQG6IL
 z7QxpI7hmnOFdSR8wAHwkGxtXCJWy20SIry4sIIQWr6y74d7IpcXF/8lVkcCy/i9QM7m
 Y5PQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YUzdApRQ
Subject: [Buildroot] [PATCH 1/2] configs/cubieboard2: bump Linux to 6.11.6
 and U-Boot to 2024.10
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

The boot.vfat image size is not enough now. The new zImage file
is over 10M, so it is expanded to 16M.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 board/cubietech/cubieboard2/genimage.cfg | 2 +-
 configs/cubieboard2_defconfig            | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/cubietech/cubieboard2/genimage.cfg b/board/cubietech/cubieboard2/genimage.cfg
index 0ba74d6be3..f8a8ec05c8 100644
--- a/board/cubietech/cubieboard2/genimage.cfg
+++ b/board/cubietech/cubieboard2/genimage.cfg
@@ -10,7 +10,7 @@ image boot.vfat {
 		}
 	}
 
-	size = 10M
+	size = 16M
 }
 
 image sdcard.img {
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index 14d080d2d4..152075503e 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -1,23 +1,23 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
 BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard2!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard2/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.6"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-cubieboard2"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-cubieboard2"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
