Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36F5C44501
	for <buildroot@archiver.kernel.org>; Sat, 11 Jul 2026 04:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52EB860B5A;
	Sat, 11 Jul 2026 04:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ipUxGrBaveIx; Sat, 11 Jul 2026 04:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2854460B57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783745114;
	bh=R1ls70zLdZ850HJKbvwsIEQ8cvkBNOc5+Iz+1Wo8V6E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=HIzUidIuIFcOpcxSNbT4v8TSbXwOdDXSuOY0rzWwtbI4OLIloRBKrWC88Pvz9micF
	 Iq9zw3xsaNderGGes/rGD6Pi8fL7maix5f5w9z4kO0b4EW+6CnZNkwg7XcIPKE+uqx
	 M3yT3NUXgkOIL9Z3nvsHemb46E/5hVhrmXa5dohwCq73gQxoKhWomHdQTGNbH8Umct
	 s7HzAzERouG6cYyDlE/rcnypzDzSYIL8ojFjy7vag+0K31X+1znAz36gYCWTYk0yyN
	 cNmDwuPG9Z+U41YHUkA+di8Av3wbe4SgWn6oXKBclvZqwT/CuMLYU8w2jjxsbVuHOx
	 OZirB3HWGVuFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2854460B57;
	Sat, 11 Jul 2026 04:45:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23F072FE
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 04:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15A2D400E5
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 04:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXXJLjzmWWGz for <buildroot@buildroot.org>;
 Sat, 11 Jul 2026 04:45:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E8C86400E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8C86400E2
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8C86400E2
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 04:45:11 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-47defd0c1c5so1037905f8f.3
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 21:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783745109; x=1784349909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VELSRUITvXM5kcwK1MjgLBs+SMZ77XRDu2KvMcvw+44=;
 b=Pp49rDEOq9CoX1moLQdvL1oCXbrztgbcvGlDCvAbqiUCCpR2hbZm9BPAxldyM4JYfH
 WxaxLLrxhST6vqNiN8Eyn59Nx+Msua6EMp6/eSXdzhUwV8UjlJTB/oMQiB0LgCPo5xjj
 wMMf1hBX/c5F2G+LFrhzbdkpKZkBryV3PBMjSYiUzICtjqVdhgjqBKlidk6Hv+n0YdwV
 Cbr3FxG3GqwUrIUUds8QBd4v0bQVbbZy/grHSNehV/ZDMs7WwzvSePE3Y7nMcZuQ4bFp
 F2RcujCTCpBIieg75sMrUGDCEqwAsEyBwDJTWN+57dqRkdXvdk7hPlCh1Nz4786iDXgn
 zZ4A==
X-Gm-Message-State: AOJu0YwKU85lHCiIDSarYSTFub8XdDTUyUSIEfCdZUz3YTiYsqB1zhHC
 JG+C0x7+Uw+cKRQ+6vKkvenB1rfKG0LS71COdqI3wvNoe9ojzoAsvnxxo0BNBwsxca2y98pqdj2
 AqJpyb3Q=
X-Gm-Gg: AfdE7ckk+9TrjiDJKbscl8UszuPIgxxWWDqge0q8XMclINnTzN7CriY5bkCvKy7dJNX
 oewLXRxJidvR7iO7WRHkTZTZCDsWm4FHW/HGKR9CDAdMEo5XixevgGIgnx0kbj/TZqUJRQVfXps
 bP4w/R1ttlaixj9ZbpZpw3Q/9Rikg8pPtgsrxyvYCmhSkgCDKLHvIf2WPP3KpIgX/M6+++7q/3H
 +7jZSxHIiXhCnWX6QBW1Nfwx3x1QgE+iz5fUaejvPXv4kqgeqShhcf4In7vIDLlNTufQkIsX/Jx
 vxnXnwXOhIU4fXHq32Iza54h/qpChrgmHa9YcHNTZQx/5p4IioUC1908mSMgZa7tdUBS+Etu/h6
 //3pLk/hx54CU5kLhC/XzWtOiGICogvnqFyL0B55OVJBmWPwjVVxSSzJd3Pt0fmyzDsQsvUBi3+
 ftXJNYsN2z1i1CeH+abrtsSCGesbmXI5KepPJJGLwE+U9ZkW5EZJ7AyM3xZJABpJmpbXii1q6Jm
 WFj9LOOJ30JbcO46r0GLfFCvDy49Lggg8I5Z/b0TkrQ
X-Received: by 2002:a05:6000:420a:b0:47f:285c:9769 with SMTP id
 ffacd0b85a97d-47f2dc8d86bmr1512379f8f.10.1783745109579; 
 Fri, 10 Jul 2026 21:45:09 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 ([95.236.93.155]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f273195d9sm8637519f8f.3.2026.07.10.21.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 21:45:08 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jul 2026 06:45:05 +0200
Message-ID: <20260711044505.69824-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1783745109; x=1784349909;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=VELSRUITvXM5kcwK1MjgLBs+SMZ77XRDu2KvMcvw+44=;
 b=ONIPMCJZczexAhphHYxRatE5JR0BX4oDsfQGRLyoPAc4uJl2qHnfLnNig4FuqWrdPs
 xixI9tF+oJPzcd023mOhNIDs2CYaHSA7enBfANL9cQVpuuYfvYKO6JlKQU68jn6iSTdj
 UJkVM8wRKs2vbkImeNXBCQcNLaX1vH9Odnovo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ONIPMCJZ
Subject: [Buildroot] [PATCH 1/1] configs/beaglebone: bump Linux to 6.18.38
 and U-Boot to 2026.07
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
 linux-amarula@amarulasolutions.com, Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 6.18.38 and U-Boot to
version 2026.07.

Tested on beaglebone black.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/beagleboard/beaglebone/patches/linux/linux.hash | 2 +-
 board/beagleboard/beaglebone/patches/uboot/uboot.hash | 2 +-
 configs/beaglebone_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
index 72849b3e27b1..00eecaae3b46 100644
--- a/board/beagleboard/beaglebone/patches/linux/linux.hash
+++ b/board/beagleboard/beaglebone/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  1c38214fb137bae85b82b82537b5987358621b915ab2a8e4f09e60697c19474f  linux-6.18.21.tar.xz
+sha256  ac26e508abd56e9f8b89872b6e10c49fc823bcc70d8068a5d8504c1a7c4ff045  linux-6.18.38.tar.xz
diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
index 36322a6a904c..ff6e4ed2e2f6 100644
--- a/board/beagleboard/beaglebone/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 57dab7abaf8a..1bae3e3bf8df 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.38"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless ti/omap/am335x-bonegreen-eco"
@@ -27,7 +27,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
