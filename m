Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F47C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 10:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B930481E5B;
	Sat, 24 Feb 2024 10:56:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MjAJI4cZrUv9; Sat, 24 Feb 2024 10:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E50AD82003
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E50AD82003;
	Sat, 24 Feb 2024 10:56:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66EF31BF33B
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 10:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 545FC82003
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 10:56:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OpR319R6BiEv for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 10:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 720D281E5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 720D281E5B
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 720D281E5B
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 10:56:18 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6e48eef8be5so1302877b3a.1
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 02:56:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708772177; x=1709376977;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=koOcvaU5ZsWMRo2u/d8HUs1hrFc6ee48yN3Kli+gTSY=;
 b=tfuy7Ftw2c9rh9A2KO/6HJFNl89jo3wthXH6mbDsh1pMQF13JUnWffuc1X+hu8tcLc
 2reMQQs+kdzp65bbMLK2ZRjQUt6ahGC5Mk8URfFz9mw5wCb+YxtToNcC+SF8Y+OenIaD
 avLHML2f7l4zr2DKHSy78mFRAHpWWv2neX9936NRleYUCcsmhiMk7QXVbQR1splWEGhl
 fWlGe7vMj8usjcQtkIJdXZTEY0eEI3SKyL5jkuy+bDlCHUcZYxEqAYGO4fZ6tHmH7F1V
 LQWV7p2g6KrlTirOvUtl3JPYRzGJ5T7LcF/5pcl1+RipDNt1bUVMDGwHWGjznpeN79hQ
 pThA==
X-Gm-Message-State: AOJu0Yxk/UW9vbEzn5L+iHhQCjWZxTc5xKgEqScBsRRlxCdREZG73L3z
 I7DpWkTaKhBBcW1Qi7swwrrGgNMjRbLgiSGZ77kKjjlkzdxjQRQrUjVUjPz1Cao=
X-Google-Smtp-Source: AGHT+IGldvJEJ2GiCg9ORc7PqUkz47uHUTejKOUYuBT0wUfhuE/1viowLgc5zFrdcseH8g/ERosPHw==
X-Received: by 2002:a05:6a00:22d4:b0:6e4:f307:f552 with SMTP id
 f20-20020a056a0022d400b006e4f307f552mr1921206pfj.0.1708772177103; 
 Sat, 24 Feb 2024 02:56:17 -0800 (PST)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 r22-20020aa78b96000000b006dddf2ed8f0sm885036pfd.154.2024.02.24.02.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 02:56:16 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 18:55:53 +0800
Message-Id: <20240224105554.17996-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708772177; x=1709376977; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=koOcvaU5ZsWMRo2u/d8HUs1hrFc6ee48yN3Kli+gTSY=;
 b=XXlqZnB5hrc6FDFOSO+0X5uV5V3VZeYFBh7P/NttGrZ2MO9JYuFQY0cCT0dZeY69Qc
 kPql7iEKAbB9iSAOmFmPXAIzIfHjGhJjKdZhzM+HvDjbho/ukI0KuHgXdBjQBssmXkoD
 7Xj2t55I4rTw5DrsVCH/0drBY5HpqGU8wtU9fP8yHSQMmgTzEaNQpMcgUJlc2Ybs2/ae
 uNdq5KqI8nvE20lcV9gk4m9azDyBbGOkY62pxRLQvWIiw1B5wHTRnxFdaBbVpbUY6MQ/
 6W6Bukg2iSWivNVgi4QL4/hU90BjXHTFc6/XeF/j8jOci2c+5Sx7rQmgnBbv+owhQ6K3
 wc8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XXlqZnB5
Subject: [Buildroot] [PATCH] configs/beaglebone_defconfig: bump Linux to
 6.1.69-ti-r25 and U-Boot to 2024.01
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
Cc: giulio.benetti@benettiengineering.com,
 Lothar Felten <lothar.felten@gmail.com>, Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested on beaglebone black.

[1] https://github.com/beagleboard/linux/releases/tag/6.1.69-ti-r25

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 configs/beaglebone_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index e2d67019b1..cdd6591f6d 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -17,7 +17,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.1.46-ti-r13)/linux-6.1.46-ti-r13.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.1.69-ti-r25)/linux-6.1.69-ti-r25.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
@@ -31,7 +31,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
