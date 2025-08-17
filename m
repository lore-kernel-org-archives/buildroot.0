Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F60BCA0EDC
	for <buildroot@archiver.kernel.org>; Sun, 17 Aug 2025 13:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 875594196B;
	Sun, 17 Aug 2025 13:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CxKqsGmCqzvh; Sun, 17 Aug 2025 13:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A956241911
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A956241911;
	Sun, 17 Aug 2025 13:35:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 233E4E2
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 13:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1553041606
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 13:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhE7v0iUmDC5 for <buildroot@buildroot.org>;
 Sun, 17 Aug 2025 13:35:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D338400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D338400F9
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D338400F9
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 13:35:20 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-323266b6ff5so1916680a91.0
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 06:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755437719; x=1756042519;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=STjGtErgJTNWlMVm8HtZp+u8BQ7raRz24vHeG2Jozdk=;
 b=NsV3hwNK3RQqP1oLkzO1yYtuTmV+UshwB5latcMw4y34BJhRlGBDiKgDXuwyaiIVxe
 FvhfPrsaXoJWNSGQtd2UJjZAV+hHLn4YbjiGVLKv2zgaNxgan02TXm01dUtsvbo0u8oM
 SOJSt23aqCQ3MyPI6JnvVwyev13L/ujVZDK4GnaLFuY5J0zCgtTQoJg+vUJm99VD9fU+
 EVetAO2SgVMnOPT8EZqZaYdePZzEd53Xes/hw8whi+Ot7gKifgO7a+LZiIMOWSIZ5q/d
 Ni1C/vW/BOlxCtBkQYANmQ9bnXbz6FSMQz5cCslHTQovhi1UzUlgBlig8ZbAgspC7Hx7
 pXvg==
X-Gm-Message-State: AOJu0Yxu38B2VgvMzYOFmWLGkXY+i9pxo8Afo7yolB12EoIXx5sHsvWm
 uF1fyH3tx2ghhA9tbOAiMlFKgs5tdRsrm7uxH97nIOoarR7Z5fBHxHfjbPNIiw==
X-Gm-Gg: ASbGncszXW02MPz4mbgxGdgZkHvSNMV7ZzoW1H1p/yUtS1YRHsTD1HaRbbdjKUDBeQj
 F5xEVA4i+PdlG0ZIFKPUP46m7bUxQb6e1XFkZhtkdtn0PA+toVC3IcOwOHe+meXHX0ShGwr4dKb
 skM8WGmSkMjsqAf04lsgcQMxw1k8xhNJEf+4souqe2mFU7Jgw+1ZGwCeD3Y5qNDhZu8aVXamPeu
 BnemSb1PT1SCXScb+SdQBTSmUijSzM6/VV0muJBtOzUCAowyCeqB5TEwHCmV0LxqA2WNiouMsQr
 LNkVCKz5r7PmmrUblfvOzIDrn4yN5JH+fa4G5FGtGuPE1eQk5Dyk7VqGBunmvP0zT2Ex7KnLxFR
 1Ke9O/Qws6SBHiM2xvtY=
X-Google-Smtp-Source: AGHT+IHT4Z6UQEw3aL5vb80ioqiwSSPxZb/J5/+hhOodrciXLemID77dxljwsw9m5sxUEFQihVPp2A==
X-Received: by 2002:a17:90b:4d8d:b0:321:3715:9a3 with SMTP id
 98e67ed59e1d1-323407d1528mr12657036a91.17.1755437719100; 
 Sun, 17 Aug 2025 06:35:19 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b472d76f1d5sm5908395a12.40.2025.08.17.06.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 06:35:18 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Gero Schwaericke <gero.schwaericke@posteo.de>
Date: Sun, 17 Aug 2025 21:34:47 +0800
Message-ID: <20250817133507.1211690-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755437719; x=1756042519; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=STjGtErgJTNWlMVm8HtZp+u8BQ7raRz24vHeG2Jozdk=;
 b=Ppb8t4kGrm4vPsBy4Jte4Ol5FWuZ2YF3JaD4wXaRlZL0RuYjjOmGkGcrWduuuqLq+6
 4tFS1Tv9QNmFYqJ3CJSTWea9G/V2eZjq5zw0sc9rqASsToWIaVOYSsE+j8y+/UbuX6jY
 hYUCYF+GTZRkQU69oUrgj2hkqOy3rrNWzTT4YisnYfASMDAeam6ydXglHYENhJQs/Pgz
 LLCDzFHIf3W7aHXIikgDMohiykt38OyjYI4AcOyCcFJFbT98STQeEBqMfjt/xIFAl3y+
 /jtPlg3OLdPx8gSiBfzm/s47BEsB7OwashrhxKj5slAqYa8v26d+4n9VtLbc6dDFZVXj
 2M1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ppb8t4kG
Subject: [Buildroot] [PATCH] configs/cubieboard1: bump Linux to 6.12.42 and
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
 board/cubietech/cubieboard1/patches/linux/linux.hash | 2 +-
 board/cubietech/cubieboard1/patches/uboot/uboot.hash | 2 +-
 configs/cubieboard1_defconfig                        | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/cubietech/cubieboard1/patches/linux/linux.hash b/board/cubietech/cubieboard1/patches/linux/linux.hash
index 1213da86b1..823f6a55a3 100644
--- a/board/cubietech/cubieboard1/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard1/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  643142c1b5991560dd12f950825cc19e4497b95b82641918ecff1177f4130c1d  linux-6.12.24.tar.xz
+sha256  4804528a29cd20309a0b41c30e5aeffc35fa21ee3358f4a706d4586d003bc1fb  linux-6.12.42.tar.xz
diff --git a/board/cubietech/cubieboard1/patches/uboot/uboot.hash b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
index 80ea21b7cb..440526977b 100644
--- a/board/cubietech/cubieboard1/patches/uboot/uboot.hash
+++ b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/configs/cubieboard1_defconfig b/configs/cubieboard1_defconfig
index 9f3ad65386..8a25129311 100644
--- a/configs/cubieboard1_defconfig
+++ b/configs/cubieboard1_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard1/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.24"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.42"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
@@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
