Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05490C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 13:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32DAF60611;
	Sun, 14 Jul 2024 13:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gNcIbzNg971W; Sun, 14 Jul 2024 13:39:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 966AD6061C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 966AD6061C;
	Sun, 14 Jul 2024 13:39:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 139181BF3D8
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 13:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3C6F80DD4
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 13:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9ky4JYv33ee for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 13:39:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 135C480DC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 135C480DC6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 135C480DC6
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 13:39:34 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52ea2b6a9f5so3631014e87.0
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 06:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720964373; x=1721569173;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aRx5M/wfatyQd3+K65CYT8n4LVDL6tfvcIMcdBXd6pI=;
 b=l6VfrQEfYAhQyHI+72qGTVX9/Dkgt4kLxu9H/IX6cL5BLNgX5ikSDN1Lf3wMLLc7QX
 XbXQQG4e8lZwj+uC3dNpvLrZzN95+fyOeW5WeWIrB2H7SGhzqxHQ6IHayGQf9HzEu9FL
 fSTD3UxmzMZGtcouFIqEl0W+MsZZZFikpYn3Dy5LMmwqgej9ryLvPIdCqac1lByBeJgw
 BEqv5hWxjOYh2rb0cUWvnnfrusAzc5dEN7sI2CSCuFLc19KPHQxJkCiq4RVPeZC6U/WM
 vUHq3bMD8c/bRHqqBUyhOVw1CPd/B4q72CyMLTcB6MPinMpxSKccgv+KX5VIWDOuAgdo
 Up7g==
X-Gm-Message-State: AOJu0Yx2LFQoJ4Y7DwFMaYoGDK0g3wfkIraEZgWeSlbS7n9KZp1aEVzP
 Cg8vSqa6wbIIrzs94oSv+EbdQ42HvN6w0fKMaLaykP7ZZGXCLqNHQRXf0L+vvuk2l465Gshc5qJ
 h/8M=
X-Google-Smtp-Source: AGHT+IEejcVVyWvDtf6d0TBx8V6xZv/0d7HR1I7IKG3BKPSRJHWczfiMoXU0NSc8OudANhdvP3AE9g==
X-Received: by 2002:a19:9105:0:b0:52c:d617:f4da with SMTP id
 2adb3069b0e04-52eb99a3100mr9115583e87.41.1720964372469; 
 Sun, 14 Jul 2024 06:39:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-44-29-159.retail.telecomitalia.it. [79.44.29.159])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b255275ccsm2069032a12.49.2024.07.14.06.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 06:39:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 15:39:27 +0200
Message-ID: <20240714133927.3024714-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720964373; x=1721569173;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aRx5M/wfatyQd3+K65CYT8n4LVDL6tfvcIMcdBXd6pI=;
 b=MrgEhoxeezz/ewj5AM1Kn8WZiARv0Wt7SyWzuNZ9ZBwt/5ViQiPYK7xOfgDkUuGqDW
 6NYkECN4KB9nCI4H8oshVRyMo+JV6u7oYttZ2UKKOC+e0LMqmOMRpyvPKXRzQAtc6kiW
 S+D1gfk+yNX+9RExjTz6Jd9VbstogH6wKccNY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=MrgEhoxe
Subject: [Buildroot] [PATCH 1/1] configs/stm32f429_disco_xip: bump Linux to
 6.1.98
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 6.1.98.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stmicroelectronics/stm32f429-disco/patches/linux/linux.hash | 2 +-
 configs/stm32f429_disco_xip_defconfig                           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
index c1bd9f9100d5..88e1ba4660dc 100644
--- a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c2b74b96dd3d0cc9f300914ef7c4eef76d5fac9de6047961f49e69447ce9f905  linux-6.1.27.tar.xz
+sha256  97cdc9127c7700556ea0891267a0c24cf372f4b81636fb8203a914f3a69f3406  linux-6.1.98.tar.xz
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 11ec6c4bf728..41970d469d90 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.27"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.98"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
