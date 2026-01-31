Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4805CE7C6EB
	for <buildroot@archiver.kernel.org>; Sat, 31 Jan 2026 20:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45B2360B8F;
	Sat, 31 Jan 2026 20:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7Me7wdUECFK; Sat, 31 Jan 2026 20:50:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8278A60B83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769892656;
	bh=2YK/3V9bQQvCokcgVdTfnsq3AXrcZhjsMaBlwqiMUuc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TIcG0c+kkXiQLkpEVrrY1R3UO0QmxSFd5AJUMrMio51s1ROSGrFp+/70+gSuEPi+M
	 D18Foy9adi2vsEPbjyHTn12ZscQftvaS4f8mlLQOeEZNe0LKbnl9NX9N71SMt05f6N
	 QnQ8GyLrS+wWOEXeyQz+Gm6RdbNLyVb0oUSkkc4WhMF+D7+Mfw+LyP1gZqiaqJbszQ
	 tMjkhP/d7MdY0zjNFEbIDW6iNSC3jEyZ4yQQUgZTWu7W0A1+z08NvgqQskOCv89+uz
	 9P+p9kGsCgjmZKYO6Q3ezfFy0UDXEkjbmRWE+CH4F3ttnDJAA+HkgOGyE19sJhm4u/
	 Q1mw9Tmk2wlww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8278A60B83;
	Sat, 31 Jan 2026 20:50:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3AD31E0
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 20:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87A0340864
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 20:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSL8CSzpN8zg for <buildroot@buildroot.org>;
 Sat, 31 Jan 2026 20:50:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=johan.patrik.olsson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E5C34034D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E5C34034D
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E5C34034D
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 20:50:54 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-38316445a67so27157331fa.3
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 12:50:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769892652; x=1770497452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rkDMi0GTFEa050M87hiu5qHm8Ghzs4Hzbpv6tPPpMUo=;
 b=fMPwvIRQBX+MbHbZJKvht7PVHeuUVOETHVYuji3YAX0six+1ua/ZDv8N3/36aqwbUD
 rK92x4mXu4+S0GDG5L0Zmi/SsmpBsVwlk9daxXUxeaMhO9QK+WhnQPhwJqL2LO5+EBaG
 y3HVc7iMOQ8OmyB2wDXJXzLGcEo4n2sqrzRyOy2yCOT0p9TfhEHtjdifvOp7ayA5zn0a
 NtDDrV57UH6eviQZNdfpI61VPn8p+psoXbXqHK5dmkneUzv9uQZFNg7UBdZ9Ss7TRajE
 d05qNHLfoIQTrK79DESXvBCrWQpUbUn/79KGQP54XT2CAyRFi1qQg7dOPkoTkoUFNTxE
 LhvA==
X-Gm-Message-State: AOJu0YzgmcADcorKoK4o0kNgCKXiVc7JwFB3/x+j6P836BvdTpyzBCXb
 bpUYAJnFjp2nf6ND/zUhT/hJ2VPP9BHKMzJSYSErnnTPuKLg6D/a27BuHoh/qw==
X-Gm-Gg: AZuq6aItNY95xYG/UEHUsSetNSMmNEFNZNFWHFrxjwOvr7MGijr8YHQG06NrBxx5/aY
 6WsbUGcHBsZUw2BABiyl9lpj5mYQV2+zV3WyEGyPm30vx4za2IutNCdJDuhDJLLsqT80ZtOBM0y
 VURxItakl/nqFzVx6p7yUpWOWsRjoRYKZ/8hP3PXa0j8aLb+lC7VaTiVAUH21Y3x/HARUjOtotU
 bo3VHTKT0pH0KNcJcdhAZY0KGOJVzrHd39PUHhoN3VGLx3YEC+uMFPRCe8cWYwkPlI7MVnxjCxy
 Vyqmy8kmA6rU7QIT2HKCjZa8nhzGUXVWkiEuDQmWCIa1hqSI5Eu1gHiIU6GyJTzj2aC0KbGsf9g
 xqnSGW9sBwQjnyo3/dOTmqip+dFSvW8wdCfBO8E1vSbM254A7Q4POHXOy/9lSw9+qkrkbIzpfGb
 OICg6jBnnfslMxa6h1v1Kw8toy7A3HzryOkqTEoizml4W+OvxmEpDz/Y+/Ql6/d/F8JNzpCQ==
X-Received: by 2002:a05:651c:19a5:b0:385:f7ce:f318 with SMTP id
 38308e7fff4ca-386467184b8mr25816561fa.42.1769892651576; 
 Sat, 31 Jan 2026 12:50:51 -0800 (PST)
Received: from DESKTOP.localdomain (94-255-240-210.cust.bredband2.com.
 [94.255.240.210]) by smtp.googlemail.com with ESMTPSA id
 38308e7fff4ca-38625c74bb2sm23999821fa.17.2026.01.31.12.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jan 2026 12:50:51 -0800 (PST)
From: Patrik Olsson <johan.patrik.olsson@gmail.com>
To: buildroot@buildroot.org
Cc: Patrik Olsson <johan.patrik.olsson@gmail.com>
Date: Sat, 31 Jan 2026 21:50:47 +0100
Message-ID: <20260131205047.9112-1-johan.patrik.olsson@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769892652; x=1770497452; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rkDMi0GTFEa050M87hiu5qHm8Ghzs4Hzbpv6tPPpMUo=;
 b=jJEIlWKr/5z+djnNkpLaJp0rXoXJ6/SmGWwKpwgm3Lh7bnSV9UZyp2Xkf3IYEAzc7o
 4BXEQgk65ljLtWf8BgICQAvuVKi3VLN4QnBh91oLfl56ecXbIKpgY1AekSFcnJJueEhY
 pBrydL5252qIf5fno5pLx6dfG9hn7Sm2EVYkdhGFIYMNEcXOxBuD5RFhZ5jcu85wD8WJ
 JmXlEGInBjp1JlkCGkxbbqDePK0onAu+DdpFfhiH7symVfWhSHBYNW/rjN4JYMqxntoD
 E8CvsV0kOuD/dyNr7ZFlZjMVjIDcnzUfKVqVn2YIetxyb7SuU8cjrXyJwrRZGiZYI9O6
 FSPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jJEIlWKr
Subject: [Buildroot] [PATCH 1/1] configs/rock4se: bump Linux to 6.18.8 and
 U-Boot to 2026.01
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

This patch bumps the Linux kernel to version 6.18.8 and U-Boot to version 2026.01.

Tested on Radxa ROCK 4SE.

Signed-off-by: Patrik Olsson <johan.patrik.olsson@gmail.com>
---
 board/radxa/rock4se/patches/linux/linux.hash | 2 +-
 board/radxa/rock4se/patches/uboot/uboot.hash | 2 +-
 configs/rock4se_defconfig                    | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/radxa/rock4se/patches/linux/linux.hash b/board/radxa/rock4se/patches/linux/linux.hash
index 8ad0e7d8c0..f83883b936 100644
--- a/board/radxa/rock4se/patches/linux/linux.hash
+++ b/board/radxa/rock4se/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  e8a099182562aecff781de72ce769461e706d97af42d740dff20eb450dd5771e  linux-6.12.28.tar.xz
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/radxa/rock4se/patches/uboot/uboot.hash b/board/radxa/rock4se/patches/uboot/uboot.hash
index 80ea21b7cb..b6a925ea4e 100644
--- a/board/radxa/rock4se/patches/uboot/uboot.hash
+++ b/board/radxa/rock4se/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/rock4se_defconfig b/configs/rock4se_defconfig
index 29437b9be3..c4e13f6a39 100644
--- a/configs/rock4se_defconfig
+++ b/configs/rock4se_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock4se/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.28"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rock-4se"
@@ -29,7 +29,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock-4se-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
