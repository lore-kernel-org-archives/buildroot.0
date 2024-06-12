Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB17FC27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 16:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 747FC81E69;
	Wed, 12 Jun 2024 16:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkgQ631e4wb4; Wed, 12 Jun 2024 16:52:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A26E81E77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A26E81E77;
	Wed, 12 Jun 2024 16:52:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B543D1BF376
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 16:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A302E608E4
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 16:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USkbr93ZNH6G for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 16:52:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9DA706088E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DA706088E
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DA706088E
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 16:52:12 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5751bcb3139so3178637a12.1
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 09:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718211130; x=1718815930;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+tIZYP57enHVeugWsggIILMXFKzOT1ZCFDhcum3cuz8=;
 b=oJfF2Kyhj/MEI+2ZRZP7cbrBgL4v0LS0SdznXCSRNhHU6fZG/jXfljg6KSafK0bwZz
 h3tcUA6ypgEEDxL+6YoduYHShzucNjDpFBXNXrAZht8qPZVsPl2x6ukokFzYqurU2xH/
 lKI2qq6Wsl2YOU47r05QLJE2s3JyuK9Slr/3seyuLbmjJQZhUBHv2kLIg4dcAJxpZ9Sy
 SPLbfVnY4EPEPgUSUsltQWRTqO3lk2+XL1Cr1cawh0uBNnRY5mTY42DgJI8/WBQIVzWS
 GsCtc/ibLD8DH29tN8KgTIEXNKISdOzKj0vOJx/kxQ8/EEvM0hB2XiJDjwT7bqTjf7Ik
 cDqw==
X-Gm-Message-State: AOJu0YzvH/JSOVKmnfdf5lUmPdFoYZhoFQL5oYaEud+0KsyVLvzSCwqn
 9N9PqQvndVU0qxxgPpgCTwuYW9ItmAiPqGIeFYxG3i5z/9HyKd1+yZwr5TB21GvfayfMYFepaEB
 2
X-Google-Smtp-Source: AGHT+IHlvqb8R0SeUiMhfS042l2khGVRwA1Iyc2co/DPzE+PJZ+qfYT5nEsIxtwWX4I58ZghNAdWCw==
X-Received: by 2002:a50:d58a:0:b0:57c:6bd6:d8e2 with SMTP id
 4fb4d7f45d1cf-57ca8dfe191mr1549783a12.0.1718211130366; 
 Wed, 12 Jun 2024 09:52:10 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.113])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57caea18496sm653003a12.95.2024.06.12.09.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 09:52:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jun 2024 18:51:57 +0200
Message-ID: <20240612165157.3698008-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1718211130; x=1718815930;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+tIZYP57enHVeugWsggIILMXFKzOT1ZCFDhcum3cuz8=;
 b=OGegJX1MllLftXXKQ07U9QqQsP2kyMXkDXsyWgL7VeIRUQ7jvNMXHlED/w+a0gRwf/
 D6oVPYEWM9plMeiHnPfw1L/onse0/qHJ0PzTWLma1Bz7rFd/Ed2tMHDx7sC6DVTEokuX
 H/7dXjF6Ah7VQmTQrVxC5+FcNVZCMGdUG1Uu8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=OGegJX1M
Subject: [Buildroot] [PATCH 1/1] configs: stm32f429_disco_xip: use same
 headers as kernel
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

Instead of downloading a different version of the kernel for the headers
as for the headers itself, use the same one. By doing so, we now need to
add the hash file for linux-headers.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f429-disco/patches/linux-headers/linux-headers.hash    | 1 +
 configs/stm32f429_disco_xip_defconfig                           | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
 create mode 120000 board/stmicroelectronics/stm32f429-disco/patches/linux-headers/linux-headers.hash

diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux-headers/linux-headers.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/stmicroelectronics/stm32f429-disco/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index e3d3cc38ff8e..11ec6c4bf728 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_m4=y
-BR2_KERNEL_HEADERS_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_ENABLE_LTO=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
