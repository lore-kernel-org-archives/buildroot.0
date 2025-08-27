Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B868CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 27 Aug 2025 18:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F435610DE;
	Wed, 27 Aug 2025 18:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMBy5vUV9RBt; Wed, 27 Aug 2025 18:52:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C775B610CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C775B610CA;
	Wed, 27 Aug 2025 18:52:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 87E13114
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 18:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E2F940532
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 18:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQiBL2FDo5Ki for <buildroot@buildroot.org>;
 Wed, 27 Aug 2025 18:52:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5897140523
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5897140523
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5897140523
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 18:52:00 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45b4a25ccceso652585e9.3
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 11:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756320718; x=1756925518;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=teZHSnneSwmhgWnOiZpYFrlEULy3RQO59TNOFBgXGi4=;
 b=cGPiUu+AX/qhrURHQtWabULCaH+yARKrFwxbHeUtrvCayaHpFUjbZHFuNnMltthzyu
 UDbOr5CW12DRgRQnVmf/NRV+AG3VRs7/N3y6n7c91Hs2KmMa6CCvUcYO9H0PoETXc6Wl
 ss6eCHrNYezgtzFRN0sU0Xgfh9qG0lgCqvEwTd1Gk4dVHWVkA3uMUBNJ8G7kwA8AV96E
 0PLMCMEEn2W92kqf7lvWru1OEU7T7QtRn90hwQSFgBzbxW00op6U5RdceNNx3uqh1Ans
 bSxc7VI5pbhESRvmcMjG+Na8Yl1hAQNh5VPDY2Wq4QZya85JXMd9UVoXa3lbPxfbPPZt
 5psQ==
X-Gm-Message-State: AOJu0Yy59ogqP1BFUuLAnMFO9L74leT/sKaG+DOuj6/qfuBCYNbKQ6qP
 p795C7B2HJvjm/T0Hx+Hs1WKMkBo5e0cWI62XCIkbgMlDu3qAwNomHbAZTgYNg==
X-Gm-Gg: ASbGnctLp1RvQPPP5xWRJWWYQjqI3nJwugEgtiRyDN1iYV3vOzBQAjy8KDKqtPJi1be
 cimxquGycIMvqx5l80MLrmqBVYDkn1WiaCkOX3pi/Mvd8tR701pU3UZ/PTAwQwS5iQ/D/+l4KSa
 4dgBV0mMtHOfbx4lx15MSOGbZBpxT/2jLLTS7P3dxtyC/ezseGNlSmkHaNVQV9/GI0o7GoD7WeT
 Sc9Myu42wMFk8mARafUCh/LPZcfw+VN23KAB+arPu+7b79Id4912vDWpBoohaNZgUrmB3ZAo07m
 qJsAzlLhp8YVv1/x9Gs5Ltt54vKXR0/x7qQJkKVdTP68jeiN4lSXr91TEkIUvsS4cyWjogRitO/
 RhzriXVwiGhexcuYwhUd6Xg==
X-Google-Smtp-Source: AGHT+IH1kkalUG9yki2d7cPYsN94F/eHCNh9UV/3AMeG6gI1lh2IRjseMwIMTw33UlMlzZf9Kz4nxA==
X-Received: by 2002:a05:600c:a06:b0:456:76c:84f2 with SMTP id
 5b1f17b1804b1-45b517d9b9fmr200519425e9.30.1756320717898; 
 Wed, 27 Aug 2025 11:51:57 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b6b1bb9fbsm24457175e9.1.2025.08.27.11.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 11:51:57 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Aug 2025 20:51:47 +0200
Message-ID: <20250827185147.396784-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756320718; x=1756925518; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=teZHSnneSwmhgWnOiZpYFrlEULy3RQO59TNOFBgXGi4=;
 b=fmWJuQHulJxxrKjvPnx0MjVwo/aHbvx1/k9lS6zD7PyzKsITwt/As/EwuxuDEtd2wE
 DIeQW0tKDSmNM0tV8N5ptq5ItYAoFJzu93gRxxWeG9S/ID/bTFQzZ+b6MIX6GnI86IaC
 ZF/dsZSIvOHMqF/jUjbWxswtmJ38Bf5cdhjKeRnLj+sKQvG7TPlbcIxsAVtg9lbgpfWe
 wtH4cBi5j2JCF/Z4SFNH74xKh3jz3b02zYcGreRHLVWBFErv4RwE/Zufa60LdDvPGNzH
 2y287ol4Y0Yg+59fSRRfGbDKaVsDkX2wSYw0FWR6M/SsQVHsJEG0uPafpZy6CLw1QEmm
 5jEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fmWJuQHu
Subject: [Buildroot] [PATCH] configs/stm32mp1*_dk*: switch to external
 Bootlin stable toolchain
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

As Arnout stated[1], defconfigs should use a Bootlin toolchain (stable, glibc).

[1] https://lore.kernel.org/buildroot/e9576c4f-243b-4a89-a74d-3fee591100a8@mind.be/

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 configs/stm32mp135f_dk_defconfig  | 4 +++-
 configs/stm32mp157a_dk1_defconfig | 4 +++-
 configs/stm32mp157c_dk2_defconfig | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/configs/stm32mp135f_dk_defconfig b/configs/stm32mp135f_dk_defconfig
index 3ba1acac81..d4631e8e5c 100644
--- a/configs/stm32mp135f_dk_defconfig
+++ b/configs/stm32mp135f_dk_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp1xx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index d96ff54dc9..bc1311c52d 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp1xx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 183e3ab862..95ff645808 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp1xx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
