Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6EFC02182
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 18:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECBED831C1;
	Mon, 20 Jan 2025 18:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Be_UF1bPKkyi; Mon, 20 Jan 2025 18:40:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74493831E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74493831E3;
	Mon, 20 Jan 2025 18:40:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D36A9959
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 18:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCAC74094B
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 18:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_c-6W4Dqvlt for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 18:40:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1EA2E408FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EA2E408FB
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EA2E408FB
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 18:40:03 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38789e5b6a7so2712751f8f.1
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 10:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737398402; x=1738003202;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hVT5AT77mOd6jl0JAwiNu6pi/ND/6lEGmnJzMPIxi2c=;
 b=v9kcW4QgLq6j+DvxUkI+gEQQ6VAyvJg8q6kdah06LF41MbGKeIaIUFboRsCdrPqHVH
 G4w3C06cdSEKIzzNloZ1N0vh6IErRQpaLcCOOVO9VdYgjzXi8mBJI4rfnQEUjisHQU38
 P5zhNcqmfqkR7kYjGLZqwrdQOJaIUhjRhLpFtPnCHi5e8FhOaRJvhxecHmQqbSzjYpyr
 6VXKhJy0FUXIq1vwlVUIwqxwUP9cnvnpUxpnJ7BU3FfyYI12aCTwY2yi2fNcxgmhp6LP
 BQcwfqAE5XLZ5UxknHKhIe/GhIanu1uVEoRrYizlgtFk/mtmo3BmJmUQSNAx8DCcXYyH
 oazg==
X-Gm-Message-State: AOJu0YxKF3Dz3y4JfaTRK8WT1o5T3h9w+P3ahlLtcj5wpcfNEwVVyexm
 vCRkABGj/AREMwUsOzA2LPc9GUg/TeNmmbEsHkgy4c9MjibVniE8/R15DdFI8fQ/WM2jEFnyMiZ
 D
X-Gm-Gg: ASbGncuw7Wuaa1gG685U79ed7/zKZ5iY1BBxygglsngD1/ueSxn/0bnqEBTsG974gqN
 endwwsS6JT9ZfyTkejGD5ZPQs1aZHA8IIJKGSNh3QBlMFTtbFFn6/uYK1lkaEUp/plLCG26KDuR
 F9GzqkHgeBq4oo262061pzw06h0MJ2Nd1q8qMqkmSuJonjvtnuwKF6eQvNjEJdpF0ZTwgXducnx
 wdJXph497LHrzyIOC/pJsUG4Tsm4br+jDZZ91AescHanqrdA4WAtCUHvCsmfMJWDlET6xs/R+X4
 opgPfVN9ACBy+NZDaAJNcTl71JgUA0GhuYGQJjxEMyCVsK+UvodaUN48KLcu
X-Google-Smtp-Source: AGHT+IHNEofj1mh+BTJbkKdSDxXGQbill9D8tsajRvsuQFiqxvwL/J0GYDa8LzXdFi3/jPZrtxZYSw==
X-Received: by 2002:a05:6000:1863:b0:385:faad:bfb9 with SMTP id
 ffacd0b85a97d-38bf564cc03mr13061462f8f.8.1737398401836; 
 Mon, 20 Jan 2025 10:40:01 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.136])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890420412sm152446365e9.18.2025.01.20.10.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 10:40:00 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 20 Jan 2025 19:39:58 +0100
Message-ID: <20250120183958.3344525-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1737398402; x=1738003202;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hVT5AT77mOd6jl0JAwiNu6pi/ND/6lEGmnJzMPIxi2c=;
 b=JQNJa1BWdNt4hRcX2uTuu4VWXd9j5LdA4j7YzSCXdb4cU2/xyqmoox90rXR3LTOnZO
 5WIDthBQCQZRibuGVa+K7G4ZPGE//Wzx0H8nyh1t1vaJ8QvuuXmOB2IMZKsWC+63pX/z
 a7f3+IRMmWmBZ7bUmTlUt97KrkRLXE89ZGD0U=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=JQNJa1BW
Subject: [Buildroot] [PATCH 1/1] configs/stm32f429_disco_xip: bump Linux to
 6.1.126
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

The patch bumps the Linux kernel to version 6.1.126. The size of xipImage
has increased by only 284 bytes (1670242 bytes compared to 1670242 in
version 6.1.112).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stmicroelectronics/stm32f429-disco/patches/linux/linux.hash | 2 +-
 configs/stm32f429_disco_xip_defconfig                           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
index fc2057c3f249..9330b9749e76 100644
--- a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  8bd8de3562fb006653e550a934e66ed9f80b7576258a03e2caa2e3ce1c1f9f24  linux-6.1.112.tar.xz
+sha256  c91920b34aec412fa6deb6ae3f22ffb41879bf07115a5e224edf4f2778be1790  linux-6.1.126.tar.xz
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 33f725e18530..7ba5d4ee3f12 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.112"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.126"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
