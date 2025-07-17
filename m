Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9720EC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 16:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DC0C60813;
	Thu, 17 Jul 2025 16:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BW9DnyVVm8MR; Thu, 17 Jul 2025 16:07:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 599EB607E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 599EB607E6;
	Thu, 17 Jul 2025 16:07:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2667C95B
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 16:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0899140D2E
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 16:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ToHUpTXh7Kj6 for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 16:07:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0393D4051A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0393D4051A
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0393D4051A
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 16:07:47 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-611f74c1837so2016719a12.3
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 09:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752768466; x=1753373266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9yXdnizrFgsKSd9ySIpsuLVY2LygyPWYxC0VRE5USA8=;
 b=LOwfJgsmaVVRMkb9S4M/s/k26uNn+xG8sYNaeoyWxn/dSECWOv/jw8c43UzRa6kRbC
 JRUOzkU4VFQqNd6aQ4jfGyYs4ch+A9L70DeBflEYQ/IZu4Ss9txpOUydsw75AuRYdL7i
 bpjMbe+5sC0x21s1ELFLqq7aec/yzs+eWniweeKrFuu08+mJL+TMEJiykdBAxFLIi7gB
 wb4xqjwE/+/QtJCZsWUocYQrUI6OaOD+vHYnFa1g5nPGLGEna3ZyBfc9bHwwCAM8LzQU
 rE8zua0b9+mZCpZQbpl8TBkzQeVd9GipvsnOCl3MQP365YxfrROS0V+GjvDxp/AoJQS2
 8KfA==
X-Gm-Message-State: AOJu0YxbK16mcumEwmjOa0Slebq/ZZCigELYNJ0sILODC9tYHTsmQFXQ
 aK37VIC9u2B+Cubb0lloKjwPdMrlvBIrrt31CW68gPR15ZXb4P9PWIwCb9NfsFIbu5sWaRw1zcf
 TKKtm
X-Gm-Gg: ASbGncstfsrZkCNLMIAN0WUSZKZh1Z20EYl+9mLK89SGIHLMGax8LSogTXbMwH33BrL
 iKTBdyu+6K0j7elZcvTXv9xJ36oGdhkNspU87pKzlk0Uqx27nhokosTZzAYWtwtNwgcj7RFTfuJ
 gp5tybuX/qNmXT/fOjs3QjLcYEw3GUgkpkkV/Q7xCNCc2N1uzt0yZiknWk9WI9Vbm8ovJuR0tno
 Di49P0pR9INpop59uHh3vU0DkvIy4OPN9eKQYjmeMgeVgaP4lPELIHUWLwk8EHY27kSGM7TDvnU
 5maS2fGLn4IvBYXAqYZJDgoUnlN54CqUkiusbybeAfr5/53AnuDkaN56QgwUZt9Jl2/NVFTcJ1W
 KIZhSkEFixjvaZMWbddSGh/dwi2gp7ZrDfT/favuEryDRT/2yMkxWTSHXKOPlvWbQeSqgc3FVOU
 05ksz3LOfyC5ZQmGmVHImqMh7yVi9XSMUuyISsZ1CEp4vlqJZrm3wqWbkzkA==
X-Google-Smtp-Source: AGHT+IEzt3HOCwMHaTu6gxjTiUvRbk3sW2RQwK9l0WA/vTZgqtDrd/lneGwthqT+xxm3eEt+aO09mA==
X-Received: by 2002:a05:6402:2102:b0:60b:9cf8:b218 with SMTP id
 4fb4d7f45d1cf-61281ea83f2mr6985762a12.7.1752768465714; 
 Thu, 17 Jul 2025 09:07:45 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611c95232d8sm10270701a12.18.2025.07.17.09.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 09:07:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 17 Jul 2025 18:07:39 +0200
Message-ID: <20250717160739.1420750-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1752768466; x=1753373266;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9yXdnizrFgsKSd9ySIpsuLVY2LygyPWYxC0VRE5USA8=;
 b=S+5wbJRR9F5ztQHl+aDVb7TL/PFbFukYC+d7FP8DyhxCryz3+hbfBZu1r86xLNcKm0
 5siwD4bvzHHTnRHTjxH+zEDOjHOye7h7YOy2cpZC31SuvwUjxVrkacVtnCVciNjF3jS6
 iBj8PCXTwf5Xo9U2d5W+xQcWDQtYs5+sktzBY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=S+5wbJRR
Subject: [Buildroot] [PATCH 1/1] configs/imx6ulz_bsh_smm_m2: bump Linux to
 6.12.36 and U-Boot to 2025.07
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

The patch bumps the Linux kernel to version 6.12.36 and U-Boot to
version 2025.07.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash | 2 +-
 board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash | 2 +-
 configs/imx6ulz_bsh_smm_m2_defconfig                  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
index 8ad0e7d8c000..32ed4d2a08d8 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  e8a099182562aecff781de72ce769461e706d97af42d740dff20eb450dd5771e  linux-6.12.28.tar.xz
+sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
index 80ea21b7cb4c..440526977bd9 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
index 8a1ae36f8cdc..22d6c6263c1c 100644
--- a/configs/imx6ulz_bsh_smm_m2_defconfig
+++ b/configs/imx6ulz_bsh_smm_m2_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx6ulz-bsh-smm-m2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.28"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/bsh/imx6ulz-bsh-smm-m2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ulz_smm_m2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
