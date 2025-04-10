Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E983C3601E
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 16:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CAF283FAC;
	Thu, 10 Apr 2025 16:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cM108BlCXdNA; Thu, 10 Apr 2025 16:16:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DC7B83FFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DC7B83FFE;
	Thu, 10 Apr 2025 16:16:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EEA4138
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 16:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E520660BBF
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 16:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7Ve5bJBfWXh for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 16:16:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 169A461B04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 169A461B04
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 169A461B04
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 16:16:28 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39c13fa05ebso635244f8f.0
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 09:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744301787; x=1744906587;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HKLgOGKckIjt8IBk2XgVR1ckxKE8PB0y19W5RFG6UZM=;
 b=RMzbQ2INtMHXwYZKK7xAsCJ6o0i944b/KtnbmON6bwWgVjRdwAra9omscWCuwtbq4E
 by0W/9dBDIwtNrysXPaF9WgVPCGf0rUwNtsCR7zmJEqWtStCi1TDzEhcZeGLoCOrDDG4
 K3tkzLuNp1d0n/NE3lU8P7J5lSjH5y8RWXyXtlmJrtmQS/ip5g0jK+HihCaSHWhQ4ahS
 +yl1UR92oYxjtigW32Sblgkxw/VgTjGYaZnMJ2kSJoxAgwbQUZcwUBeprQHgjEsGuuVW
 r3pZjDEHwFy9m624jFLY7NarVvCD366rnEarKwe9WU6ndlv21e06YDhl2QEJ2UMl4Ziu
 LblA==
X-Gm-Message-State: AOJu0YxKSqy1aFDFa+zExRvD0ajshp97QINFIQKZddTbY4n24vlcGPSQ
 hZ8JSPyEDvDfohjg15QWHaAOE5IKOUqYO01s8Azy4tHYlxYrFMexZQ1ALysaWQF2B/qcs2vLTy4
 L
X-Gm-Gg: ASbGncvw1NaGjrccNLSpMkl5AeUPmTP+/5XbqQmf6QcoBDntcGlGZWnhSmN4rWxihOm
 jOD3k5fZ3GZVyZG+tDokt2s7EdUJtMb6qI6SCA1YFys5cLXgJNPFUVL73sRnc9990YQejHtmBjd
 5xQKDgusbzuQq07sDsR4TXjOiChtTYiKCLT+jd1dRUXLW1n2Yin21o/amzVJw09b3scJVkforHv
 MJ6FUDE0f03CbAWyjXtnue/kJPm2EiumqQEV4OWJBbIm3XQw+9f7OQQZ2NIzlAxoEWHGAr0she7
 xBHvd1pCzEFJWk5lVEv3AmGJqZ7CO0pFhHA39onqucMhDQBBTRX/WUGfbTK+BpL6zeOuWpRERHM
 nBQBy9GXUWKQrWa02YyHoWKZTQBbybQ==
X-Google-Smtp-Source: AGHT+IHlezFL1KHXJhr5tO8UP59BPEdEa/wU6r2z1pSL0fcorsxFaTBwMnUQN2uv7sqW92PE1BnnHQ==
X-Received: by 2002:a05:6000:40cc:b0:38f:3c01:fb1f with SMTP id
 ffacd0b85a97d-39d8f498aa8mr2875411f8f.30.1744301786682; 
 Thu, 10 Apr 2025 09:16:26 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.44])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893fdfcesm5134539f8f.87.2025.04.10.09.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 09:16:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 10 Apr 2025 18:16:23 +0200
Message-ID: <20250410161623.1940341-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1744301787; x=1744906587;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HKLgOGKckIjt8IBk2XgVR1ckxKE8PB0y19W5RFG6UZM=;
 b=o0cuch06EmpnudBoItkby+4Kn1arNX4rk9AgZJ0RwhQk3sV81rI0VHAJDH7gG9Zt7i
 17+he/WM6f1aBeyNb3RvNz2z5hGIjiEQ4W+b7xpBSJfR2Mxft0UQRJAzNEAx/BtZEwMN
 hE1qDP/A6U9GKJaLT7r42FRhvDT6Vb80TaZWA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=o0cuch06
Subject: [Buildroot] [PATCH 1/1] configs/stm32f429_disco_xip: bump Linux to
 6.1.133
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

The patch bumps the Linux kernel to version 6.1.133. The size of xipImage
has increased by only 22 bytes (1671804 bytes compared to 1671782 in
version 6.1.126).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stmicroelectronics/stm32f429-disco/patches/linux/linux.hash | 2 +-
 configs/stm32f429_disco_xip_defconfig                           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
index 9330b9749e76..7855de012d5c 100644
--- a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c91920b34aec412fa6deb6ae3f22ffb41879bf07115a5e224edf4f2778be1790  linux-6.1.126.tar.xz
+sha256  97b59faf3f1925f296442a73a64439a447366f1d434be579803877097c5abe70  linux-6.1.133.tar.xz
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 7ba5d4ee3f12..69266f567ea9 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.126"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.133"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
