Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C69ACCD192
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 13:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA84261013;
	Tue, 14 Oct 2025 13:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FSjwjjYBxAHp; Tue, 14 Oct 2025 13:44:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC8DC60F25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC8DC60F25;
	Tue, 14 Oct 2025 13:44:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C45D294
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 13:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8241940B3F
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 13:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bKuCOf2AIZJe for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 13:44:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB0BD40B0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB0BD40B0D
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB0BD40B0D
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 13:44:18 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-3324523dfb2so5231935a91.0
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 06:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760449458; x=1761054258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H2JXTp9C5KrxYFPjYntB8iDDxueFDlpsErPS+Wf0/aw=;
 b=YvELImV3ivJtuQ2/RkMBsfbrUQHdR62pNodKzlPUY16PBnU+cPmW1Eg5m+FPL9XQ8s
 tCCXkpzf9JDmicwlOKigcSfm3htjfSDIrFl9ih+PdMFXdFdw/pQzAaOFRSUvLy1AbhYD
 yyGfhywTtvEGfi9v/zLQE2tb2TECThJdIwCvgs4Qqzop+ePRzb3CxU4quKxJS+c+aoM+
 DfgG4Yc2zqEvDSHmDcsw+SExTqPmb9ph9SVGpHLVTULEnNH0N/8rePjFmaEhl5RH8Iie
 fgFo2imdQ+y/VgcsY/vOMidP5liF4oO+2T+xtikfjhRKiYWIEhcvzNNJ7hNR39OnXWDb
 CgJg==
X-Gm-Message-State: AOJu0YyO0ZU3JOvnrOzaXfja4wlPYfQhctlTtGBdfYbS2i4fxAOg7dOf
 RAQ8mL0vZ+7acyYrYj+eA8NwxGQoQHk34vtrfnjsrTWhPtR9CWFGVR3L0mmaSg==
X-Gm-Gg: ASbGncu8xtNQ/HkCXfGXHwfn6f+tXKwW4h1jcxNcVEiPDHHi+6kNB+RNa0auELwAf7/
 SxRaoMl43J9vgjEX1vmklxqq5XbHiS8av1Htsc52+xCs6YFvYhIzcPLyV26zVqx9Mp4fxwlGCxs
 /rI0LVL+LP0rWJ2E4dk8SgFrCuOBpxl7Lhe2AXLP8jb9ImPB223Bc6zy3BAC4vLzczHaHkUTMSq
 O2Z4Ow9sFETTbzjfJgx7kidWgkrSDY0Y5/r/ClZcVJBlGPsYbXI1/K88t/LokSaTv4KFVISJryI
 VqKPcqh+UFWVylBIosjs4/+N3sZ8/QkCe/9NC5p4qUj+E5Wr296cs1XllyFF0fnhmNs62xW8ntX
 94XltPkwWdNMV/M3fUyrkfWDXALeDHnLkXpltxQbq6qpaYEqxmhQNCKYoRZ8=
X-Google-Smtp-Source: AGHT+IFSpk74BMDbdWMl+2XLG//SWaKpihFHjyH1smZXj0QvJxf/QrwB9PMZp+/CkI8vLJaY2HQaPQ==
X-Received: by 2002:a17:90b:3ec5:b0:334:29f0:a7e4 with SMTP id
 98e67ed59e1d1-33b5138e32cmr32059571a91.21.1760449457443; 
 Tue, 14 Oct 2025 06:44:17 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61b12756sm16010049a91.25.2025.10.14.06.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 06:44:16 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 21:43:48 +0800
Message-ID: <20251014134349.728861-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760449458; x=1761054258; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H2JXTp9C5KrxYFPjYntB8iDDxueFDlpsErPS+Wf0/aw=;
 b=V3QCo427ujU4w5ej+c/rxdk2up9zCN/7F5KLdslClqrQzWZ5EnVIqi3WmyKFcInKzK
 cD+5QChHqFMq4dlHBio/l6qzKSq2+p8kHUay4JvaASAUDoKV3lzSLpHaPZfmZ636LdTj
 MbKyeLAM9iPoecOQrZYKFUq5bfBo3Vi/hhakVvA4K19eo/w326N4BBO+oyrX9XzMl7yg
 gsdU5GoxaCN5cQPkCdcTTjO9ILecTVpo2JBDxfDtq1Dg5CA6bMPysLN9qx0v7S8XdVEF
 hrsRMfswlkHVvZm2eCALsmwJcRz2qEpr/3zJ+QrJjZL445h3ORKD9ULh/PCJpu3wBFAG
 Rvqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V3QCo427
Subject: [Buildroot] [PATCH 1/2] configs/beaglebone: bump Linux to
 6.12.34-ti-arm32-r12 and U-Boot to 2025.10
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
Cc: Lothar Felten <lothar.felten@gmail.com>, Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 6.12.34-ti-arm32-r12 and
U-Boot to version 2025.10.

Tested on beaglebone black.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 board/beagleboard/beaglebone/patches/linux/linux.hash | 2 +-
 board/beagleboard/beaglebone/patches/uboot/uboot.hash | 2 +-
 configs/beaglebone_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
index f2c09d9872..e70a999129 100644
--- a/board/beagleboard/beaglebone/patches/linux/linux.hash
+++ b/board/beagleboard/beaglebone/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  3654ca31003d90d20b195b23f8d60b78fcffbf0fd7fed6116c22719e20ac933d  linux-6.12.23-ti-arm32-r11.tar.gz
+sha256  1db327d0743e97ec725fefe05065a6fb779abe3063845fc3b551a4a716247c0a  linux-6.12.34-ti-arm32-r12.tar.gz
diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
index 440526977b..98a5c53aaf 100644
--- a/board/beagleboard/beaglebone/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index bb63fda375..86bf6bce9a 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.12.23-ti-arm32-r11)/linux-6.12.23-ti-arm32-r11.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.12.34-ti-arm32-r12)/linux-6.12.34-ti-arm32-r12.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
