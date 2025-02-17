Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05852C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 14:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5D6480EAF;
	Mon, 17 Feb 2025 14:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFmbK_rb7u9X; Mon, 17 Feb 2025 14:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B3F980EB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B3F980EB0;
	Mon, 17 Feb 2025 14:35:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 824E872
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 14:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7619C40422
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 14:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HezSO8zbhlR5 for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 14:35:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 749A640410
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 749A640410
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 749A640410
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 14:35:07 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e589c258663so4749571276.1
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 06:35:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739802906; x=1740407706;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2spS9nu9XqKhSAYa2NSA2eVl7lKy4lxTrtOaGWGmJ0M=;
 b=YmurcVP2xoOjjxiz9mKHHn5htxF+OzycTB6coI+67BeYInJbkKnVdWuZnY2Yn1Hcqv
 lRQKrP0TVV850Tm3OH9NI/YOQfF2Cq7mrh+x4I/q6cgKk16fpx9yPLVzlPxgqysty2r0
 yUCEod6urL4IJ4UjoDQgHRzy+LQSjpoQupqkJHHNOHQsSLG+4dNho9JT3EHOZEm+lDde
 RBLQ30oZtQZyBQflRWDVplTFrJ1G0YWhOjdqkOOfk5cA++wAxp0WJBKvsVgHukNHE53s
 J+TM25jlq9tqDUEPNU/hgDrxqO2xm43ws3HJoC5GPePcOILaw83N5gcKgX5CXo0mwMEv
 dFJQ==
X-Gm-Message-State: AOJu0YxMWj5ChHkhtaOA4V28fQ2Kl9nlCgOPH1t+ci3fBm0DpFMxbif3
 wnGoumoRVIiRhVT8vrY0qGvqOyvzMTv+i5TWjTOh2EjEzrJEG6cSX//YnA==
X-Gm-Gg: ASbGncudaopVt5njBe1MgRqcOp0a7nmSJjXAHeVzSheRwFdil2UaokGHEGGHhWm6P4Y
 14YeH/ntSFA9fTHFcPIk5uBMBU4shb6ZGz9tw9LjQt4g4Xel4FP8WcNPonyBolU4IQTuCsNPcZ1
 vdLwbOrDUZ/K7eqOsIKPH5kDq3WPcv9+mS0gOw2Lt8SGwMNaBsvlqM7O3OVLga6/gD6EPFCoW5S
 IJ56hPf6dDPJJwwseflUZ/BqnG2JwSNkRM/RDIqSVWsePEDhBv2g9mg6yOeB06pq1szbRc/BVcg
 Wzdk7zGEk3Ju
X-Google-Smtp-Source: AGHT+IGpJ/QWDejsBnzmV1I/BCIu/x4F083Etk3Og2jLD/kwZcH16aQljLnsGrZXxpgXcuiFCkKYqQ==
X-Received: by 2002:a05:6902:a09:b0:e5b:1858:9f34 with SMTP id
 3f1490d57ef6-e5dc9043ee1mr6442358276.16.1739802905788; 
 Mon, 17 Feb 2025 06:35:05 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e5dade8af9dsm2575839276.9.2025.02.17.06.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:35:05 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Mon, 17 Feb 2025 22:34:57 +0800
Message-ID: <20250217143459.1870672-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739802906; x=1740407706; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2spS9nu9XqKhSAYa2NSA2eVl7lKy4lxTrtOaGWGmJ0M=;
 b=FaUflzZnkf7OmGv5aDtPiEbGOjBn7ekADeu57UkEDdtegn9kL1MrA5wvnKb5IMqfC0
 waTwaGKRhIjNTkO9wIptbZW3tialUxVhmfxqzG0uMKpU109z2rUv/heXqPCh/lWqEoMa
 LXJXBl/VSfnF4EIMZXW6atmIaQkP0iHOoiEgoWu95LpeEc2nrmu/eQJ9Qwp1vyp04c4D
 QdmAJawgragvDN8FXSecw6gXX6BgBIz10K5vcFNQTageRKVNy6gPVfSgxlHnUnmuOUrm
 ZJPnP9i1b4U3ranm1jVSk/AxIULYcuUaEzWDOF4AmQYDbnbRl4KOdClZpXAAqhXkuopd
 fjIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FaUflzZn
Subject: [Buildroot] [PATCH] configs/cubieboard2: bump Linux to 6.12.14 and
 U-Boot to 2025.01
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
 board/cubietech/cubieboard2/patches/linux/linux.hash | 2 +-
 board/cubietech/cubieboard2/patches/uboot/uboot.hash | 2 +-
 configs/cubieboard2_defconfig                        | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/cubietech/cubieboard2/patches/linux/linux.hash b/board/cubietech/cubieboard2/patches/linux/linux.hash
index 450cb12423..2e30d90bb1 100644
--- a/board/cubietech/cubieboard2/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  39207fce1ce42838e085261bae0af5ce4a0843aa777cfc0f5c49bc7729602bcd  linux-6.12.5.tar.xz
+sha256  9423f4bfb4d875417e39cb0b017b5499fea47da56119f0cd28a201735d898f14  linux-6.12.14.tar.xz
diff --git a/board/cubietech/cubieboard2/patches/uboot/uboot.hash b/board/cubietech/cubieboard2/patches/uboot/uboot.hash
index 904fa56c02..50674352d7 100644
--- a/board/cubietech/cubieboard2/patches/uboot/uboot.hash
+++ b/board/cubietech/cubieboard2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index bace740ce9..6161e3a559 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard2/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.14"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-cubieboard2"
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
