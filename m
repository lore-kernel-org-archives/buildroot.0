Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F6AC369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 11:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CAA660AC9;
	Mon, 21 Apr 2025 11:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMV6HJQIZ04Y; Mon, 21 Apr 2025 11:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6F7A60ABB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6F7A60ABB;
	Mon, 21 Apr 2025 11:09:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 45D1168
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 11:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BDB460ABB
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 11:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RR0DcUnm0nAY for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 11:09:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A241860AB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A241860AB9
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A241860AB9
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 11:09:29 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22c33ac23edso36951355ad.0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 04:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745233768; x=1745838568;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/O2JQkAusPYhowG/sFYjMAsRgl0kbtxMy+0DDPiW5UI=;
 b=g+C4o5wAd/jrMa694tiWPNOYTimj9O1dRzUReLfB9P0caUtLs/uc6TTbnjGo95JUK0
 PkGlIuviPuc+5unE2kAuWaZXFbl+7wqaPMeAWICrakpF+z8UbC+jv016yPqqWq2CGtfu
 LBu92UXQgXtNCXt+pouF4iZaAY7Q86tmSD7xJd6qXkIPD2kGc1xY9TVF0KWXgG6vjS1H
 4xhowXFACv65L4M9QPKike+0KlIowdnlbsFgX7VKJdpJeMnUi1p0IJBQ2n5Nze9L8s+W
 ujj7SGr1m2L8vBleL/66i/VSDMtvtFV8KL2eUafHu+Y/ObQuBAnGFAlpwY16Vg0M18MT
 QJfg==
X-Gm-Message-State: AOJu0Yz54fxqG6TeRXJWvk1m2yU5ZZ0zdsF6TtWME/c2W+7uSbYyGeuj
 hJL59jHIfecAim9goCgdX3FeRZb4LpYtOzqouHBXO9pHb7PLMNsFtZTxBw==
X-Gm-Gg: ASbGncssvqQq6C5+05oGKasKjLRSCC6g5z3YeGEaS1g6fLXRXGL1KU2c9Py0qciOoLK
 KAMS5eK+wpZai1SG7v7PWaQtFC1Nm7nnqYiaRh0BFhCQ1JNLaPFe6q3B0U6JHujWbf24xeeerfU
 +MmrQoncSDvDlzFJloyqasNktIcf8GXnYWVsWZT/4vB+KjWmDaDFGoH9lfR63hUjuApzY/PyH/w
 3alS70LZYnGLLW2PSl0y7EW2dJUUPgspPR5r5DsDWkFKQsoe7YHtNMPWFnQSscWV1fgtE7/szCX
 ByuXNjVLISn96KvvEkE9WCJGUcgvy9yssChLfQ==
X-Google-Smtp-Source: AGHT+IFMrvGRJ8l8Ypp5Gcs9KIgUH+F1l5dQbjmrQgHNw8tQfXtkessAD/WP9vT8BjfJvxJQzdULCA==
X-Received: by 2002:a17:902:ebcb:b0:224:249f:9734 with SMTP id
 d9443c01a7336-22c53573964mr179555935ad.4.1745233768446; 
 Mon, 21 Apr 2025 04:09:28 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50eb4a46sm63000885ad.147.2025.04.21.04.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 04:09:27 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Gero Schwaericke <gero.schwaericke@posteo.de>
Date: Mon, 21 Apr 2025 19:08:55 +0800
Message-ID: <20250421110915.6696-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745233768; x=1745838568; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/O2JQkAusPYhowG/sFYjMAsRgl0kbtxMy+0DDPiW5UI=;
 b=KP9TuUK4DRVKTr825o4k2Zs7u4jEANbIkUtPCickhWYBWlav9UJx6RTVOMc9zz/AgN
 /UYtxGMdCLGjGPKb0DkunC5rKL/Z/LywPNFwsoY8IK9dRIwJsJSt5MH9vPu1MIs6nB4X
 Obe6jZU2dCNP9D6xaYcEcJ4jRw7DT9gi5Wyrwgwq96NHOh8kWGp9UT7/KyJxE8VUeO9b
 ASnurssowjS5Wq5lPGdci1D/W9jnNQlSAPxlDNOXnTKq+N9hj4tz8tbEUIhGqXrC6sOX
 3oqpDxUg33a3GkkRL1KZbMRLR0RZCQA6A3cx6ksVs2TCnxHi+gTpA+hVda13JmEgGEk2
 QM5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KP9TuUK4
Subject: [Buildroot] [PATCH] configs/cubieboard1: bump Linux to 6.12.24 and
 U-Boot to 2025.04
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

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 board/cubietech/cubieboard1/patches/linux/linux.hash | 2 +-
 board/cubietech/cubieboard1/patches/uboot/uboot.hash | 2 +-
 configs/cubieboard1_defconfig                        | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/cubietech/cubieboard1/patches/linux/linux.hash b/board/cubietech/cubieboard1/patches/linux/linux.hash
index 2e30d90bb1..1213da86b1 100644
--- a/board/cubietech/cubieboard1/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard1/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9423f4bfb4d875417e39cb0b017b5499fea47da56119f0cd28a201735d898f14  linux-6.12.14.tar.xz
+sha256  643142c1b5991560dd12f950825cc19e4497b95b82641918ecff1177f4130c1d  linux-6.12.24.tar.xz
diff --git a/board/cubietech/cubieboard1/patches/uboot/uboot.hash b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
index 50674352d7..80ea21b7cb 100644
--- a/board/cubietech/cubieboard1/patches/uboot/uboot.hash
+++ b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/cubieboard1_defconfig b/configs/cubieboard1_defconfig
index 4a4d932f32..9f3ad65386 100644
--- a/configs/cubieboard1_defconfig
+++ b/configs/cubieboard1_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard1/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.24"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
@@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
