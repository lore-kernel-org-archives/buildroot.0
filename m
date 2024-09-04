Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8670ACD37B4
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 14:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CB1780BEB;
	Wed,  4 Sep 2024 14:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGQHG5q3H_j0; Wed,  4 Sep 2024 14:25:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E6FD80B69
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E6FD80B69;
	Wed,  4 Sep 2024 14:25:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FB471BF267
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 14:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D2F380B69
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 14:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZCAM3JkcfNo for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 14:25:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC2B280B62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC2B280B62
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC2B280B62
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 14:25:13 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c2535b081fso488845a12.2
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 07:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725459911; x=1726064711;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oyLvmzdsVpvzHaMukcX7AGcOSwYFq6R4YLGIr1H597w=;
 b=LE999S1nMdTV49BZiR6DTEVoXD4gLdEvIa21US2xW5QzodYudejqIFFO8dDLn+sC1w
 gzvZtRtieKBXA5D6avvTOepxwsvr/sC208Z49UGu0HI7PEoZ23t8edVf8UHeMi3rpAuY
 gINJtHg4XpK5/Fz2CkQ18QYsKFwTBjnc4QbYUZKds3LJUUOaH8PkDbJ7ZSdxQFqxZwQp
 5gROJRrodcNXrdZe/JjaBDrpQfjRszmq/rar07Esr8wI2/ek/rRzC2YaTHEZAjWL3iQs
 qosf7RttxH1npHLn3LoEIauBm5Sgc6qF1/VDviw00lV6vGTtKdvZlG0OzOGTHRxLwFiR
 tt1A==
X-Gm-Message-State: AOJu0YynOPhO01eMHqEQHmijzIO1G64utezX1g5X7Bkx/4sXYClY3qCV
 rNDzuzZdCHLzsXDLhcE2BiFOisSn7/1oGwRyys0jxtXx9xSagnX6ZpiKdPYsaf7hTaSsM4+N3In
 ofsFUHg==
X-Google-Smtp-Source: AGHT+IHfDXrKN6QHI1yeD8lLYtPAAGXtLSUV3sW+GkU8FRDRVU3tZru5i4HSf4fQkawHhZTYMCTwZg==
X-Received: by 2002:a05:6402:50c9:b0:5c2:6f74:7818 with SMTP id
 4fb4d7f45d1cf-5c26f747933mr2009626a12.5.1725459910713; 
 Wed, 04 Sep 2024 07:25:10 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ce96ddsm7564644a12.94.2024.09.04.07.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 07:25:10 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 16:25:05 +0200
Message-ID: <20240904142509.3295502-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725459911; x=1726064711;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oyLvmzdsVpvzHaMukcX7AGcOSwYFq6R4YLGIr1H597w=;
 b=pgzzzLI6HqycTQsD3fQPApUovOJR06Y5f/mIolR90a4YQ2Nv9V8nmAMvmJioJGblrp
 2cVr8wsMICZeM5D+at3v0NwynAm7TpGiMgSZ0ozN4NuFxw4OBKEyIzKnIsJh8nI5Rkl/
 E6qsL/DBOTiKkNwryHzopuseMwePOc8rRRwlg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=pgzzzLI6
Subject: [Buildroot] [PATCH v2 1/5] configs/mender_x86_64_efi_defconfig:
 Update kernel to 6.6.49
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the kernel to the latest 6.6 LTS version

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Remove BR2_TOOLCHAIN_BUILDROOT_CXX=y. This was part of a
          botched refactor.

 configs/mender_x86_64_efi_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index 25a463abb3..de432ffa8c 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -2,7 +2,7 @@
 BR2_x86_64=y
 
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_18=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -39,7 +39,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --device-type=buildroot-x86_64
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.49"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/x86_64/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
