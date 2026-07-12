Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1CDC43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 16:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 171D240953;
	Sun, 12 Jul 2026 16:00:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5Cw5eaEsJGC; Sun, 12 Jul 2026 16:00:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B1D540954
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783872056;
	bh=vKimplDiwfJsQRpEeXr1140mi3ZdpIpHP/A2kEVebcY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Qn1UKKwgsN08rjfFh10iBie16fjWvFTdc6w8n83q+EV/ntLqRDg4JnF2I27Uqn7V0
	 /ho3YUQCicwYvN9BC401q276ULi9Df0Tehm+4MxVHvoWXnTKHQZuDN/c4sJA9dptaF
	 v8EGq0bUS95oJgdvucGhfjsPIpktBSgPrhaq00jVmoJN+uHdbnBkAqaATB5++hesao
	 GsTCKAwkXUN+wEmsK/HxcnvkIFbAZj+8M3xFHVUKfhEq2FHOpc0Glje66L+ZPNmpei
	 ASRrJeLcBj03cpbmvX3bxlDg9FCUBHPhQX+vKlpUU27ExW61XjPzMj1kixDIQy3fM5
	 GUZhzVzdpPV5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B1D540954;
	Sun, 12 Jul 2026 16:00:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B0F2D22F
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 16:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2AAB40954
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 16:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8oVnKtdsD_G for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 16:00:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF5FA40953
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF5FA40953
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF5FA40953
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 16:00:53 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-47c2b362ee2so2191435f8f.1
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 09:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783872051; x=1784476851;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=X5h+GrN0NC738BkIic5TpUnaHcUHM3tzQZzTS6NVVhI=;
 b=K3MMgswuMZwarwXm9rDahIpbhiRu8rGVGtp4ZIlXuorHVGdyHi3isoW4BNHOeCWcAO
 2uLrFnrKUL3iYT9sBu9iYTW9nnVBLjald0toC3ZBIHYhXb/z1FSeFtd1kEjSG+VHEqeB
 Gqq45JHMt5UDO24rHDgQVV6dVp6tZ951abMM65eS82L3sksOWN4OGQwtBfX6ShmjEmPG
 x7najmLf/BQ2SmcKmsEr0+TxjHhsPXvjeUJD9K+dS7kvdocOtxNkiKKLVKKL3jFVJQTj
 4Ogheg2d3Zt7lT0q5hgi+hNr8faa4FMnSq5SQJKuwYP5O1yYnkMKhUf4tiVM69Ps7bW0
 KTKw==
X-Gm-Message-State: AOJu0YzM++m3ZyRABnQTIEsCAhioC/+5aObqqB6026A3lNTW4Y6aN3Rk
 suDueOVWAurDSu6VpmaaOsX8TqyQ9dfcMad6S9SJ/flhqRCFLcIo6i5ARPo6v9aBRO3RlRjBX0P
 N5GSdaPQ=
X-Gm-Gg: AfdE7ckEmYF41r+Z7GfluxiXL6iffG1ORiTyzNvPIQhHy68ah7QnMqcV2vyuUKBO+CN
 A5MUGvAFpcok0vKLYPmJpVZcifX05nb7qRsZ0NOl/yavTtstqrUnj1JIkj7GIup7crtwGvoaKmB
 vVQwacj54e+vThCgGPvTG5VVtfxAqU+74e/REXF9jYCljdJQoQNxUldK2w6mdta8uePBkeOxXc8
 AJaxAMKKFYiFJ3sO+iedzdtIwrSz7HDTNSGcriwGRAyhO88uu2gFeM7N7n2frHVW3NsvwP9L8s2
 XkRmAdBNVDBa9pCS6+xFqQPi6JKIw/ejBR4c+mN/tATo67Dks31oqe2HI8SyBqm9KZ/xVbKLxDc
 5TwxvP9Z5jOHJj1LzruWklwQ05LCAkkhqLqvrfNOJKLndx/eZWKA8Eb7Ypa/VLvpQVYdwAoBxyF
 YO/BdjC+D9T32a3HW5vjUrNBYse4KJ2QapPLQpuFN5gBZYaQAaKlyUa+cWO8Aj5sx5lEUT9RMbL
 onRNB6O8ndP3f20cZRaGs5okYyThfS9pAd8ORXlm/QP
X-Received: by 2002:a05:6000:4203:b0:472:90af:e406 with SMTP id
 ffacd0b85a97d-47f2dce7e26mr6534954f8f.37.1783872051338; 
 Sun, 12 Jul 2026 09:00:51 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 ([95.236.93.155]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0f213e8sm76309131f8f.34.2026.07.12.09.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2026 09:00:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 12 Jul 2026 18:00:44 +0200
Message-ID: <20260712160044.2562619-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1783872051; x=1784476851;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=X5h+GrN0NC738BkIic5TpUnaHcUHM3tzQZzTS6NVVhI=;
 b=a2kczseg8do1Attg1fMBMwrF0uSYRzPRXsQ+CT0AG0KSE0d9+G5dHZEDmecflK6IE5
 fMwMIcfyMJYvpjvM/2qUNE6wO7cOXNjsyRyrhlWP/gMCNvH4L9Wm90xOyxrK5SGTIdsK
 4elTP0sLGPoHX0J75vDziqsuDxjz09WkQOWDo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=a2kczseg
Subject: [Buildroot] [PATCH 1/1] configs/stm32f746_disco_sd: bump Linux to
 5.15.211 and U-Boot to 2026.07
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 5.15.211 and U-Boot to
version 2026.07.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f746-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f746-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f746_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
index 7929b2b9e344..b4a6bbd3f783 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
+sha256  beb954e53617928b751944a89b6670bf9a9c7177c641b24c5dba504e46f1d961  linux-5.15.211.tar.xz
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
index 36322a6a904c..ff6e4ed2e2f6 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/configs/stm32f746_disco_sd_defconfig b/configs/stm32f746_disco_sd_defconfig
index 820a7e83e3fb..e0c257787a6c 100644
--- a/configs/stm32f746_disco_sd_defconfig
+++ b/configs/stm32f746_disco_sd_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f746-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.202"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.211"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f746-disco/linux.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f746-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
