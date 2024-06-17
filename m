Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4779CC27C79
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 20:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCD6E60A6A;
	Mon, 17 Jun 2024 20:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8oR3DT-uRol; Mon, 17 Jun 2024 20:12:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC0E060A7A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC0E060A7A;
	Mon, 17 Jun 2024 20:12:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0CF31BF290
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 20:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9AAC40AE9
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 20:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HwYZToSllhIc for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 20:12:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=francois.dugast.foss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8EC5840AE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EC5840AE4
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EC5840AE4
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 20:12:47 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52c525257feso6150413e87.1
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 13:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718655165; x=1719259965;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rhLjiTs1wDyDUpyY3g39AiO+eTU7tlKIWjH/3+VLTP0=;
 b=BGDCKfdkj/BBZWU9OeaZ7Q9uEzXsTv2rjqkJTsb1EGAP6H3z40+3jo8KFWocRLj3JJ
 kotg0kUpHOVUuyR1Hrjmcvsc4Bivoge+6M7VHDxMZU4pTnTgejKgaMD1CRuE8jkxUejU
 Q2c3OLZOHSOVZWbGoa430j3nnkT4nAHQknJy9qxBZQBsq+KP1Zk2+nD9ifyuSIXBNVc1
 Tr61gUi5k+2QWIEo4Ik0nJoCbtkARSiZ3KhOYrsDyGdXb6hNqB2rT3XtV+MN4VEV0CIR
 UTbtnV2Me2s7BDeShO+PQTfiEFB/LVluTeOQtbSyYnmUEHCzDpZq2A9aysnFEWJFVpJF
 +1KQ==
X-Gm-Message-State: AOJu0Yx2WoefrUkVkrap12rs7hvalDqti15k6XRiAcYfJT4DLo4aUwOP
 cziQkkQuc/H/dK6y3GJcwqOJ4YIx8pSIlqQuky1aG8fGW6Jr5huvvfdkPQ==
X-Google-Smtp-Source: AGHT+IH4Nwok5lzCvnGh0D1/NCZvIXczMf8itjrGPZ9w2l5XHxwxazT32/WX1RHH3cGm8XfJ/CnBsA==
X-Received: by 2002:a19:6b14:0:b0:52c:9d61:271f with SMTP id
 2adb3069b0e04-52ca6e656c8mr6060905e87.27.1718655165019; 
 Mon, 17 Jun 2024 13:12:45 -0700 (PDT)
Received: from comet.lan (lfbn-ren-1-1629-205.w86-253.abo.wanadoo.fr.
 [86.253.181.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750f23cdsm12636048f8f.77.2024.06.17.13.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 13:12:44 -0700 (PDT)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jun 2024 22:12:30 +0200
Message-Id: <20240617201232.1804524-1-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718655165; x=1719259965; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rhLjiTs1wDyDUpyY3g39AiO+eTU7tlKIWjH/3+VLTP0=;
 b=MuQI7n6JhWGRQ4GMq1dxYEuLR4A9qmUR3+OLHw+kI6+eGdIZvSPBvZpNjGM4CoMihN
 TkA4xedRxSazwsQqpRvYfFeCN/ZHaUc2tpzixwCaKSYEuwwsMnkZlQEZpRnnGk31uzWY
 CbJBTy6PogaQ5HVJZ+bRbAgQX796S3k2rXT4HIiGtlB7hMXowN86+81d6syTrIY6mqNX
 c99AIw8vRt/mGhI0t4VdGSa/blgMEZPB5EMxKrltuStbyVqGx4YqvU4t9s23zWi+eC7B
 Xdq0OuilAayztzN5j/6cUUZfjveabLC9fsngGU5mvJXTtnieVlPh4caRfnIWANtQ0axA
 nLYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MuQI7n6J
Subject: [Buildroot] [PATCH 1/3] configs/hifive_unleashed: extract common
 configuration
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Francois Dugast <francois.dugast.foss@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Move the generic part of the configuration into a new "common"
directory so that it is easier to add similar boards without
duplicating the files.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
---
 .../sifive/{hifive-unleashed => common}/genimage_sdcard.cfg | 0
 .../{hifive-unleashed => common}/genimage_spi-nor.cfg       | 0
 .../{hifive-unleashed => common}/linux.config.fragment      | 0
 board/sifive/{hifive-unleashed => common}/post-build.sh     | 0
 configs/hifive_unleashed_defconfig                          | 6 +++---
 5 files changed, 3 insertions(+), 3 deletions(-)
 rename board/sifive/{hifive-unleashed => common}/genimage_sdcard.cfg (100%)
 rename board/sifive/{hifive-unleashed => common}/genimage_spi-nor.cfg (100%)
 rename board/sifive/{hifive-unleashed => common}/linux.config.fragment (100%)
 rename board/sifive/{hifive-unleashed => common}/post-build.sh (100%)

diff --git a/board/sifive/hifive-unleashed/genimage_sdcard.cfg b/board/sifive/common/genimage_sdcard.cfg
similarity index 100%
rename from board/sifive/hifive-unleashed/genimage_sdcard.cfg
rename to board/sifive/common/genimage_sdcard.cfg
diff --git a/board/sifive/hifive-unleashed/genimage_spi-nor.cfg b/board/sifive/common/genimage_spi-nor.cfg
similarity index 100%
rename from board/sifive/hifive-unleashed/genimage_spi-nor.cfg
rename to board/sifive/common/genimage_spi-nor.cfg
diff --git a/board/sifive/hifive-unleashed/linux.config.fragment b/board/sifive/common/linux.config.fragment
similarity index 100%
rename from board/sifive/hifive-unleashed/linux.config.fragment
rename to board/sifive/common/linux.config.fragment
diff --git a/board/sifive/hifive-unleashed/post-build.sh b/board/sifive/common/post-build.sh
similarity index 100%
rename from board/sifive/hifive-unleashed/post-build.sh
rename to board/sifive/common/post-build.sh
diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index 1aa06f59e7..dabd1aefd4 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -13,9 +13,9 @@ BR2_RISCV_ABI_LP64D=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttySIF0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/hifive-unleashed/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/hifive-unleashed/genimage_sdcard.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/common/genimage_sdcard.cfg"
 
 # Filesystem
 BR2_TARGET_ROOTFS_CPIO=y
@@ -30,7 +30,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.190"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/hifive-unleashed/linux.config.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/common/linux.config.fragment"
 BR2_LINUX_KERNEL_IMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sifive/hifive-unleashed-a00"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
