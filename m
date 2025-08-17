Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A23CA0EE4
	for <buildroot@archiver.kernel.org>; Sun, 17 Aug 2025 13:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE82441974;
	Sun, 17 Aug 2025 13:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u02Mh91oJnUo; Sun, 17 Aug 2025 13:35:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 205684196D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 205684196D;
	Sun, 17 Aug 2025 13:35:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F9AE75
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 13:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8579841970
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 13:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6PINEOjsKC0 for <buildroot@buildroot.org>;
 Sun, 17 Aug 2025 13:35:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 032B3418FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 032B3418FC
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 032B3418FC
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 13:35:38 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-76e2ea6ccb7so2325148b3a.2
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 06:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755437738; x=1756042538;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3m1lkW1WbNcH9gOxGuKhSIoHxr2IJ29EifT6i2KzOpk=;
 b=a/xL3wd2KxqMATyysTprcKRzy+cLuZN0Gacm1oWZ0ZA2MH7E7wG/nqMZlZPZ45tPhq
 MIyqlPy87iXHRJpaCqR+NopqF+auQR2oSL+yxCSbt5luY+wbAG315TtaIaWHrfYZAkXR
 4mENtNFWpaVMmkRS78ga08MbEhXkZsSt/aYw2SaMsW+/BIktjZxKUUcm9XHjHhAQUifM
 aO6l0PWDFq9+HW5UHk6mZQbV37Rv+yEAG1eZvLkYEbRTBtpVTpf9EHqR3Vj5FP0AQat0
 1YPqn5fPa7rgJEqvV4ZTYFo2KZnf5GyrXPZXNvVAfj/OMiO+x+OgQ5u0t0VbxaaLKeYy
 D1MA==
X-Gm-Message-State: AOJu0Yz90EvBLGUQVRi1ylMg8y0tsbCoQ+RfsSCfx1kmyw8wRs56C6n1
 386irtnxmMlnF74QnkAsXYIJog+itLV5abiTYHHazvBMXIqe7z3Gn8EnpUgpcQ==
X-Gm-Gg: ASbGncswmva7dYUnIJXPM9dd+o7ctt2gw8BuhxVRy+kMU5OL0iAWlUP8yXyOaiC1UgS
 9t87BTOlXYFslCa8kP6znkWi7NCOpZB8klzOnBuE4ACLhS1NrUuX8mC9ASo3N/m4qJlRK3EKqjQ
 xKaAKyQorfRUvWTOcibDq8zYY0ixboFa2Ms1QoZapamUU76dgTKACEk27tkus5mZi5FMQi7cyPP
 1Mzou90RbeKLGfO2WOJCNnHx5lSKNB52nTnix71yxPXuD9mzbU97eQq2mMMoN4sZFXGX9YpALVc
 3OKE26dF5kCORoPqZlTcn/od3kva1D9rPxoaRM39JC2gthiLaALowrmHkNdGZpObTcL4aDLFmCh
 R2KRlg49KwDc9jKrptnI=
X-Google-Smtp-Source: AGHT+IF4mrNqAmIVfzhcgR5p92I9Bf3Rd8tHD3Y51ICF+Oh1zJx11D4eE0n1R6m26gzxkD+uagI+EA==
X-Received: by 2002:a05:6a00:1492:b0:748:ff39:a0f7 with SMTP id
 d2e1a72fcca58-76e446e2bddmr9855822b3a.9.1755437737943; 
 Sun, 17 Aug 2025 06:35:37 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e45565813sm5065057b3a.59.2025.08.17.06.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 06:35:37 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Sun, 17 Aug 2025 21:35:30 +0800
Message-ID: <20250817133532.1211976-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755437738; x=1756042538; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3m1lkW1WbNcH9gOxGuKhSIoHxr2IJ29EifT6i2KzOpk=;
 b=G6Gww1CE4myPKKgilOb1sIr70w6P8qdNH/f3vLeTDSFx0D46nl6F80hCwhR0YKoL6g
 8WGNDbawVRMXGN93SLUzE+7Z1b0R1cmyTpulRY25QY4GJXPBkJS1e+uxl1wC2/T6D7hX
 jzcbSip32mMdV6ebM7Ad23yMCQzH1H5WQQTWSNoIUFFt6cTM6FymI83o5d1XrUv23xXO
 qSji73FtA1o5a2fb92Maikes8jLVhHk6ZHCvQUWxRM1tfgFGQNSDwGDyAaMYv/kekR+X
 O36UyTJ8pH9kOPdiHSrtax1AKLPxH1Ox6OYPcNs5AZFuXFhYyd0wRBBRz9Pj9Aas1wmV
 78QQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=G6Gww1CE
Subject: [Buildroot] [PATCH] configs/cubieboard2: bump Linux to 6.12.42 and
 U-Boot to 2025.07
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
index 1213da86b1..823f6a55a3 100644
--- a/board/cubietech/cubieboard2/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  643142c1b5991560dd12f950825cc19e4497b95b82641918ecff1177f4130c1d  linux-6.12.24.tar.xz
+sha256  4804528a29cd20309a0b41c30e5aeffc35fa21ee3358f4a706d4586d003bc1fb  linux-6.12.42.tar.xz
diff --git a/board/cubietech/cubieboard2/patches/uboot/uboot.hash b/board/cubietech/cubieboard2/patches/uboot/uboot.hash
index 80ea21b7cb..440526977b 100644
--- a/board/cubietech/cubieboard2/patches/uboot/uboot.hash
+++ b/board/cubietech/cubieboard2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index 180677923a..de8af36eb3 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard2/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.24"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.42"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-cubieboard2"
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
