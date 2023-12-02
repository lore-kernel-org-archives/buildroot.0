Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75CFC4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 12:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A192A60A7B;
	Sat,  2 Dec 2023 12:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A192A60A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nzs75vVdYIGh; Sat,  2 Dec 2023 12:34:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC39560D6C;
	Sat,  2 Dec 2023 12:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC39560D6C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E3E21BF299
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 12:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 052F0400D7
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 12:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 052F0400D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aao_Oak7TopO for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 12:34:12 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5CF2404B0
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 12:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5CF2404B0
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50be58a751cso625084e87.2
 for <buildroot@buildroot.org>; Sat, 02 Dec 2023 04:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701520449; x=1702125249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R2oWniPbi0daWZMXy4+smx/fABvKsWsSLegSQ6uJkhI=;
 b=s49G4iJkeUfVPTlce0QWYCzXZfn9K0eq+ZCa/Y9+gMapNcaQSFeFsmbGVdBCEGn7kb
 /K+oigFd3/icVa1wDZa0V61LOwAX8MeVCFE81na0DE+55MYKpBZKVuRIJNZ94nNAg9De
 gCIgzVVLTD+FhoV4xFgtgJ8xA/Xzqilbai6J2XK8sCpmaFYrHIGaNHktNY5jTxryq5z2
 yyxijfrhohM+7BupKPuHI7P7hZ9ZcQDsc7O1coddqueGdFVLTimQ/jN7hnChjQTCbSU5
 Cxk4dOrV+XQ7I+2x8mQVse7VDG7MqZb+NqhguMyBDOFBkrcqkUU+Nwqc+MzMfKCxLCGP
 KkLA==
X-Gm-Message-State: AOJu0Yy2sS366UF55haQSx+5DBAv0HvSiTN+mXE2zeQCNqTY2CuKehXM
 JYFA6A5J4YFNASn2dbzdkyXNnC4yRK0=
X-Google-Smtp-Source: AGHT+IHyLOQKjNxo/FvME+88Vbuq6RZtym99lmNm2WXccyBQ9apxxtDwA1YaaPqR2vQ/Hd+bGXUjsg==
X-Received: by 2002:ac2:4c24:0:b0:50b:e6e0:cadc with SMTP id
 u4-20020ac24c24000000b0050be6e0cadcmr321786lfq.121.1701520449106; 
 Sat, 02 Dec 2023 04:34:09 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 e14-20020ac2546e000000b0050bbcd68e8bsm705672lfn.47.2023.12.02.04.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 04:34:08 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 15:31:39 +0300
Message-ID: <20231202123400.2327151-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231202123400.2327151-1-geomatsi@gmail.com>
References: <20231202123400.2327151-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701520449; x=1702125249; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R2oWniPbi0daWZMXy4+smx/fABvKsWsSLegSQ6uJkhI=;
 b=MeMYeBeqLpgmCfykc2B9HMYEZ0TVkQc2VFxsCP7Ulq+3+qInjnmLUvZ5xywqVFPh67
 N+DoN1pNEi2ge4h8dL6kUeu19L99fgpspNkNbfZ3OPCGxuiiY+mr2zc0sRySjzpfv0jd
 Fm05s6bjIdycFEXFzDnv8yJRVN0OPDqD5KDf69+lJMziDCMEwcLRursQ757wUV4vcdm4
 WoAF3xvFKdG49zcEH/hQQ7flGGzHmOvA4jLf4DJW25HbSdgmuBytEojA4mzvCfemjfdF
 ksy54uBMtkt6OPCiIBk1nU6fNT2+SSRvv/5QxTiUrzO/F2lWN+5Mnk6lJwFWRCi9ille
 Szqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MeMYeBeq
Subject: [Buildroot] [PATCH 3/5] configs/orangepi_one_defconfig: bump BSP
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the new Linux LTS release 6.6.3. Swtich to the
latest U-Boot 2023.10.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/orangepi_one_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/orangepi_one_defconfig b/configs/orangepi_one_defconfig
index ea988e87ea..1431619620 100644
--- a/configs/orangepi_one_defconfig
+++ b/configs/orangepi_one_defconfig
@@ -1,16 +1,16 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_One"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi One"
 BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-one"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h3-orangepi-one"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_one"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.42.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
