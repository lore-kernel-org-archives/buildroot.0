Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB28C021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 14:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A7D360D87;
	Sat,  1 Mar 2025 14:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FcFJyJXLaED1; Sat,  1 Mar 2025 14:27:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 656BC70750
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 656BC70750;
	Sat,  1 Mar 2025 14:27:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 554A368
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 394B684EE2
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhJALuKynGSF for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 14:27:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::935; helo=mail-ua1-x935.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5AACF84DF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AACF84DF8
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AACF84DF8
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 14:27:16 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-86112ab1ad4so1238103241.1
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 06:27:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839235; x=1741444035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NP99GblYJiCc4YyWKcAy7QB4nMlK+UN6obmA1tYv1Uo=;
 b=rI8GWkf575XjX36wHtqAwClJvLYnJ5R+LNZrlXzS1Hen5izxbTNxiSCtPL2qNmw5Wy
 Q7h4CWy2tfeYTb2dBb7tu4sGnV7fggae/TcQz0nuLWB58USaSMXK0Ul5e+xR4ZIn3ubG
 AdtBHfYbXGyi2nzPul+tSZ5e9BGfSbVv9hGhJv0I4XBvZyLXuTRyxpN+IcZQTUPuwR8/
 93CHzuyLuDOUmectNuOro6IB1+705zj38Rp3v7XYCZttpxEna8fMDvBX9ixYZDXomk6i
 mpxImlC+j15p1oixuDy5wj66pRHgNS4zSXRrgmfEN8qKkMcaMo41lxP8O4DQhUC/mOuU
 A36w==
X-Gm-Message-State: AOJu0Yxt4wKvP1kI719Afi1ItNCkUCU8F/RkLhBdea3rU4nl6yV4GKdv
 2KpB3ri8PIRq9ECA0YYsEEEFsNkDo2Vg8Q4/YkXOsw8k7pHEGq+XukPyODtfxSY=
X-Gm-Gg: ASbGncvE/OIyDX/s8lDya/0fULBVvdKKQGQs5Jc3pw+ISeRU8eSRFoVeKARFVcYTP1j
 dP+P9TFvK8mXjT7ouu4u3fki4gIGHKuDjyuAk6C01QnEvjCer8y8pLYmHioIqawGfWwTy7aU9M0
 78eA3Yx5jeRHA7ZgGmypJ5sM6wREwWcs2YKUathS6FbYPrGqhgP1WCXOPkVUWt1iMBanoMp7xeR
 7qvVapmK3j5pVjKuUE0fVQNqC6DQcmXG5wFGVnWzEYOxXXkpLa1JPyjoyrC/gt5QK0xEtPtqmZa
 8f0wNdTthl0NsnlJXRX4QeQDeQuXY1fF9WkjmvPzgqkygCS02PpvkwqwtU8/wPq2sA==
X-Google-Smtp-Source: AGHT+IE7XzHGihnrWQwTKoIjOCVI4HwnCebehCPjhNc+6YgLMPyrOVlJCXzKqIF820KazihaWNRrtA==
X-Received: by 2002:a05:6102:6e89:b0:4c1:76a4:aee4 with SMTP id
 ada2fe7eead31-4c176a4b0b8mr1156910137.19.1740839234776; 
 Sat, 01 Mar 2025 06:27:14 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:148d:1710:e8e3:b53d:c3e3:1bc3])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-86b3dc1359esm858841241.10.2025.03.01.06.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:27:13 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Sat,  1 Mar 2025 10:26:17 -0400
Message-ID: <20250301142619.72570-10-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250301142619.72570-1-gilles.talis@gmail.com>
References: <20250301142619.72570-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839235; x=1741444035; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NP99GblYJiCc4YyWKcAy7QB4nMlK+UN6obmA1tYv1Uo=;
 b=VWEBqFhufzBBilEZJBuqY6YrgxUi8Dsd2xpvgWTveVXe7aqOtK4H9FucxxCzoN5VW8
 U58apImg8D6r8Obi7rKvWmMKDQXcpUOVVIv6vr3yDIXmffNOKLHJRn918nuN09I4FR/7
 xqHpcEfXUcklSRUeZthCQx+jqvCg0ZERwer53IC9IAC0xVeMwDX2ZGBmz0T0lxF+KKjN
 h9z0o9JUGDVRZOsYO+TnW5pz4rL7+E/MNKhNpZrAOYuKqrU+kcD+DZjcc+GRggfXs1Ga
 yePcKXl6TT6oIrLECt3kl2FFCjWV3FQkPN5vmu4DJVcNnZHVyz+kqy+HY+LpIcLk8AhZ
 +PzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VWEBqFhu
Subject: [Buildroot] [PATCH 09/11] configs/freescale_imx7dsabresd: bump BSP
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
 board/freescale/imx7dsdb/patches/linux/linux.hash | 2 +-
 board/freescale/imx7dsdb/patches/uboot/uboot.hash | 2 +-
 configs/freescale_imx7dsabresd_defconfig          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/freescale/imx7dsdb/patches/linux/linux.hash b/board/freescale/imx7dsdb/patches/linux/linux.hash
index 3c4223976b..620a7377ef 100644
--- a/board/freescale/imx7dsdb/patches/linux/linux.hash
+++ b/board/freescale/imx7dsdb/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c70adedadce88f8685cb26d9703b930292c1349138e2c55ed9b4cd6e277de3bd  linux-imx-lf-6.6.23-2.0.0.tar.gz
+sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/imx7dsdb/patches/uboot/uboot.hash b/board/freescale/imx7dsdb/patches/uboot/uboot.hash
index 4e0d729ca0..4b763ba3ba 100644
--- a/board/freescale/imx7dsdb/patches/uboot/uboot.hash
+++ b/board/freescale/imx7dsdb/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  179b6531ef1d4ce681d139741ac7b4144220c90b7223297df28b61e98e8d37fc  uboot-imx-lf-6.6.23-2.0.0.tar.gz
+sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
diff --git a/configs/freescale_imx7dsabresd_defconfig b/configs/freescale_imx7dsabresd_defconfig
index a9df6671ce..83a3f4494a 100644
--- a/configs/freescale_imx7dsabresd_defconfig
+++ b/configs/freescale_imx7dsabresd_defconfig
@@ -7,7 +7,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx7d-sdb"
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx7dsabresd"
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
