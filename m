Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15567C369D7
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 08:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A337682CEC;
	Wed, 23 Apr 2025 08:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9FQKHNSkXg6; Wed, 23 Apr 2025 08:25:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF06A82BFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF06A82BFD;
	Wed, 23 Apr 2025 08:25:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F31919F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 08:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFB5D82BFD
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 08:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqqld9Zo4kZ7 for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 08:25:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0575582D7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0575582D7C
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0575582D7C
 for <buildroot@busybox.net>; Wed, 23 Apr 2025 08:25:15 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso58358555e9.2
 for <buildroot@busybox.net>; Wed, 23 Apr 2025 01:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745396714; x=1746001514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fywW4ozpGvjIW4ts/YfqCCZwQLPRPl8lNG2mDMXfpV8=;
 b=uGqVrBkNwgUPzOg+lkKS7P6lRAnEQzToDbaoDpdhJFTzJ5wBYthfDbl4HXY3eWQh2W
 1ujOFpr/P/k9C1pKoxCpiRCs6IiUfr7FUMhpR9le8ZTPTPd7WYUfTBMzkNtcuFYqplIp
 lbSZDJ0wp5KWtct0bI4Y+cEXKwX9fsPYeC5qXwQpjX4kcxoesDcu4+ASC+B5nQ8XyFLh
 KLl9d11/7Q9HF1WlanUSfLvhHRisgJYZHuMNwLEGFgRschnZ2y5rJMlGjodHgBKFD9B2
 VdmcgPDQXA7eAgatu2s/0n3hIWNXsezLMuLkU2D2V8pMic0BlV/MSyvUbuzXgr/SXQWx
 Ss9g==
X-Gm-Message-State: AOJu0YxdxvgscTiBcJF1HBceSPpDgu9hq/k9ZEAPHLQOw0aDfcf6vUzD
 vO8s3ug2PLRUjCubxuKb7rDz0oovnGEzqfgLcqEf7xbjpsRHBtFIsg35EMmB09gW+vj7jX3zW4M
 h5g==
X-Gm-Gg: ASbGnct3I3nY1671vvYp1mNx4Svont4TG+gJG31gU4lB79XoEZqKejq+cXa0otokq6i
 MVJbXhw489xqn/c22poRmAxkk+/uNpUU2PxqnF8eVO363dXMTY5w9csEBI4uZESQJse8WipmXo9
 SElQNQVwKHyTi53JkFGji4RR+j36m5I59J85d2+giEoCcDrjF/g1/4WC/l1c/kPAlyBFQ8aVOal
 wM+e1bCIjEcA7fE8QZc87JqdDzGNWuLVTDF1kflmsAHZb3R6tOPGG2Neq+y0XxLehHxlXYlEEwY
 PjI+B6kHSFfE+U8jjlis3WB2bMOBPzr5hJK9VZGnu5jKytEDmtB4lANgz9Rb2gaUIi6fWBXqk9S
 4jQuC+sD/NbND
X-Google-Smtp-Source: AGHT+IFuhtM1L7qbQYXqwlresjDpB7abVWE/cWIctRCFcFVCbxOm22CwH5erY44Wq9/EDwsMUUDjGw==
X-Received: by 2002:a05:600c:3b8c:b0:43d:1f1:8cd with SMTP id
 5b1f17b1804b1-4406abfa4d0mr149641205e9.24.1745396714073; 
 Wed, 23 Apr 2025 01:25:14 -0700 (PDT)
Received: from vm-2404.. (151.187.66.37.rev.sfr.net. [37.66.187.151])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d16b67sm17152015e9.5.2025.04.23.01.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 01:25:13 -0700 (PDT)
To: buildroot@busybox.net
Date: Wed, 23 Apr 2025 10:25:05 +0200
Message-ID: <20250423082506.1879122-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423082506.1879122-1-francois.perrad@gadz.org>
References: <20250423082506.1879122-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1745396714; x=1746001514; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fywW4ozpGvjIW4ts/YfqCCZwQLPRPl8lNG2mDMXfpV8=;
 b=OS0XNOrnh/nzWlN2LYW75g7xWFRVn77+7KGirRgcN8MA6j6COgjAyo8ARgNXgTu5rN
 YHYr8OaXHJuW0XC498wDICNSGYkOsfSmxXRMJAKkOCpE3lC8B43PiRzJ8SGSo800vAZi
 cltPzbVXmUOgChIwz5yOhprvD4w9SzIgWHI+XaFrwvsflQq9Jnc/Gp+1HRdxafV2IOkf
 /TpEq/tL/EVuQBgJehA3IQ/EwoXSXqyM//2PqWVoHYCPGDDEthXCQp8SYW6F9ysJ35IZ
 WLuDbIBcTPcLTwoD9b6xDToIOtgIoHi3BneCEkdhXpvDqBfIR/9XXBFs8fQ2MpJ+kONh
 ngog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=OS0XNOrn
Subject: [Buildroot] [PATCH 2/2] configs/olimex_a20_olinuxino_lime*: bump
 Linux and U-Boot
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/olimex/a20_olinuxino/patches/linux/linux.hash | 2 +-
 board/olimex/a20_olinuxino/patches/uboot/uboot.hash | 2 +-
 configs/olimex_a20_olinuxino_lime2_defconfig        | 4 ++--
 configs/olimex_a20_olinuxino_lime_defconfig         | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/olimex/a20_olinuxino/patches/linux/linux.hash b/board/olimex/a20_olinuxino/patches/linux/linux.hash
index 0bc60586f..023d24499 100644
--- a/board/olimex/a20_olinuxino/patches/linux/linux.hash
+++ b/board/olimex/a20_olinuxino/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  9c6305567b75d99514cde6eb9de39973f3d5c857a75bd9dcdfca57041f8d4f34  linux-6.6.69.tar.xz
+sha256  49e3ad7423e40735faada0cd39665c071d47efd84ec3548acf119c9704f13e68  linux-6.6.86.tar.xz
diff --git a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
index 2f55c44ba..ef267a2cb 100644
--- a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
+++ b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 0d54e6ca9..9d22683ab 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.69"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.86"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 05d311ad4..b3a5fdf4e 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.69"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.86"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
