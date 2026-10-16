Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577AECC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 06:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB85C812A3;
	Fri, 16 Oct 2026 06:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIt1yzgVhfwG; Fri, 16 Oct 2026 06:52:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0C20C812A7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792133524;
	b=Jc00fXtsZS2HwFbBhKb8XwsQelaJwZHQkebr7Qf9KTITbkbfiUqJ85/2cdAFpbpIo7Pb
	 g4uL/YH4wqQKQbnVwQ4AiKEYfpbqUflGqPJQ8HVpGX67UFMRncVd7H3YOIigUIamMzbtF
	 EEs0VuDvYRrTmem3V8lPpEVqJ+D4NvsQt65wdHSR1Mkr8/MRNu4Jkc/33OCsc+4cnhI1g
	 rEG/pYDidywRieAneZ9AUf3qTZ7kVHdXJGpYHug6AsLzNbvbC+fIYrWsrSOpd7+OSYdKz
	 3Gj4KZYAfNJ55a23w3F7eYnsBH6X82Ke+Qnp4IGD/k/tEPDxucvGdyh4jzNtM52TBoA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792133524;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+/tgKYSWhOwYZ+fGD3mOfusn2WAyGUeI2ouNw49DFU4=;
	b=QvYk7fDkT3l6qMmlegulSxUve3eZZcGShbKOg4Gr2jGp+7lhVmycv4E4AiA+a+jdf543
	 doDbSd6P5JjnjcIpbUgzVNgldmBVgfeIALSoJko/FXCh5Rkj9jNI3zdiLC+9zHAxsTl63
	 joszTB2TezQlW8b4oUqkdCDPySh5Z/+z0HovBaNOKTq61l1QwXiZJXoc9DIfoq5MSDwjp
	 R5CS9vBfqKdqc0L/DB4+fsXrxcjK4ir64lEoywlVnSVGMofQ/AyovFlvQT4gjFzwkw519
	 E0dEIy0gT68V1A+LeFk3YX9VpgqUohY49RsoF3CHW8P1wgGGCBEEUkd/6m4S84ck6+Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792133524;
	bh=+/tgKYSWhOwYZ+fGD3mOfusn2WAyGUeI2ouNw49DFU4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F2GfEEljDyzFx0T71eDeS2Z/Y9FtRrmv3345qEd46lkVFFAIkHH+0tGG9Ih/TPC2L
	 h2+z54dG0yD2T4PEWhI/I37LWF5SxiH/SjiFx3Dm6TvV+K5jmsP9PtYekn75f6c4Z+
	 CiRTTZWQK95ITBzXG3klkRGOgzsqz8EaNoQq9HjmWZtHB+NF28L527+VHI7isdChzm
	 P09+s6NuQy7rM63gDWRYUJZUDMyyaeURvdrftbcUb+kmm+2Lwh/4rr7lC75oC2pFGT
	 4EGzIu/ZhrbEkFzIuI65/F6lJ8d2NkmKft8dzlgzw16/aNDdfXLL+jNExjbACRE8Z9
	 yFAeJoDtkhP2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C20C812A7;
	Fri, 16 Oct 2026 06:52:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 64D95263
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 06:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 572F940960
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 06:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQmTM7a5mcSd for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 06:52:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EE61640851
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792133521;
 b=N5GldpfNpe5nUQ3f8ErJVT3CqPfUlsiy82gFYRjOycz17kex0sf8m8o5DJTMJEPHb+Qz
 99ZtVlhOPSDeX24R1Qg+OFveL/+AfvQOccgzWOUGnEaYYn40byzG0tl/pNIFX5uBRq7H+
 QoI7eXnCSVu/ukXOnz8KCXIQ81nrFApxYn85wDGo3QkhDzaZ/dtPChInjzF51P2Km4vkJ
 a3zgmYIaQB5ItC17eSggKXoaexHT6eCUNZ9mAwu8lI6JhfzkGT5Kgu+O2SeIFpizU6YGh
 VyMlbcZKg+94S79kjjV5y6MKWM2cEKm4k65dFqnLsRSJyAR1G+SgZ3iGenxeGtNfzvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792133521;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=d1HvI6kMk9GvJ5SjR+Z3qrxwuzlp66atEoHpsfr5fF8=;
 b=dogl4+/jH2QIKoBj0kn8snW0wXBWxMC1Q3pGcTR7bJTM2Ungrt3N/0Gsxchi8mOjTSx6
 qPcyT24QE/X1m/tIfYvMjiMIH6FmTz9PtGXhkjwvIlXJtteVKmkmwH5KT1Bb38PNKVxps
 X7E/LH2bKk0QA+n/83boIO93ZhMDkMTy9+pLh0P8L/vke/KcxTvaGPMl2Q4MBflu7BkDy
 NVShRXARa7CM8aT38qNcgvY/71fqo8q/bMMr9J9zNBf78LYURj6WyD9JJLDXEw+8W1lVj
 213+Ap8XNYN4Gi19DrS4PEH2XF8hJcEgVeeysXjNbVqBvzbc1PIIkzPMj1bk9UB+ggA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=KaVYCnVk; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=KaVYCnVk
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE61640851
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 06:52:00 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a020e65269so39868435e9.2
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 23:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1792133518; x=1792738318;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=d1HvI6kMk9GvJ5SjR+Z3qrxwuzlp66atEoHpsfr5fF8=;
 b=KaVYCnVkocSFO+EdcMmx7fpwfrhPR8chRaDz5fwUFDWubaurbcZyE8gb2C74jKE0mU
 wHdVeZ1IXYonsETPJPBMr1LJghMSiqfXPgUpL/9Yx+z801q/H+n0FXEYP+NyuDUnHwsn
 bQRrc0tvTa/9Pr7oN3X2yCJQNeeSypi2KgeEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792133518; x=1792738318;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=d1HvI6kMk9GvJ5SjR+Z3qrxwuzlp66atEoHpsfr5fF8=;
 b=cBGGoOqEQm/dvTukbCg2qBuzqiMm3bUEpApz4/WaqT4svvTfMjKxXgoUhc+4Vcvi/v
 p0fOmMGPSRejU+4uHyPYpMR43vG3H6gacK68eI7aLVsdlBcjH+u6JhKOcTuUbqRx876X
 r0JwfPLqTpryqPrsOe0IZTY/d2LSr5njA2/HN+GnEIH8985LpmtgUMyJhHNSUBMa9/NL
 x9BufsT4fJRStfj/0vW2PjgXM0yv/yIBx6STLO5vTkz4JBEzRjlPu6cyHtzs1J390FYM
 JAScEgNAobe3774DYBFhRW6jebQ2y+ZVg87II0RS3X+D08pQuJ3NlQ6qdZlvRUpeWa0c
 2/ew==
X-Gm-Message-State: AFq9FYJxpy+810Vn5DGsrCfojO0rTzEqdQNTD0VvB1wnWeYLbkHOFRIx
 0Qj47tc9iLCEJmvkWqUeBnBwoX14KpQdK69ArbdYYFI+xw4wmido6m5gyRmgfup20y1KTg5UxyT
 jJdIQ
X-Gm-Gg: AYBFou3YcLsIifIjhGDyZpHXljY7rLCuC0qlBtW2+y6ADG2Jl0mt41OTFfZUK0Cc3YO
 MUJ9eohW0EncYwZZ8W1sdxoArpbPSIpu7S2qUwScjt43g3LaxTRJd4LCcBhtI82VjHS/JJVIA4U
 jloUYR8Wnc3w0un+GMlec38PI/sLWQ/MZJdBPfO2VWFeAjxUp9JNV0PCe7UWWiSvVa1hpSN3fKF
 mtLgRLgNDG1oF8fV3U5bnCKqh1OPbDpx4quR1tUu5H0J6epQH/xtnDyUfoyh0s4neHDo63VQQA9
 /qGZ8xe+4w03lmKRQqjn+XEszLbEHqQEwKXNQ0VznldMvuZV9mJRwD0KZAEE8mpnmKOmyjIcvYv
 /w1dt2mgpb0tdatU9Mj7qkIi7LA8znfaMsqLMSbqKdnGUWkVYaUozucKpG6kpzH08XCnqqBqXDh
 FfR/Ny9w7Et1DGGnjuuXDGqgJPGj5w2oBrXkpUf4eTYi/OYAQei5gs/YvoBgYnv51AwMu0WPhEe
 opHE8cEZjAeGvvT7bIZMNIUg4edMjnN3hraVfWtMlgMjKWVU2I4SnroA017HIMAwFEdEXxC0EPO
 iIgsNlYpXClumOwn+nkk0OC5qwNtfjDRTSaRux64q63I8g+HJaPxHE+eSqNr1EiI0o2O8ck=
X-Received: by 2002:a05:600c:1911:b0:49f:faa3:3ca2 with SMTP id
 5b1f17b1804b1-4a18e4aae7emr458659415e9.13.1792133518071; 
 Thu, 15 Oct 2026 23:51:58 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1cf983b88sm17291965e9.7.2026.10.15.23.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 23:51:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Fri, 16 Oct 2026 08:51:54 +0200
Message-ID: <20261016065154.2826814-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: bump Linux
 to 6.12.112 and U-Boot to 2026.10
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

The patch bumps the Linux kernel to version 6.12.112 and U-Boot to
version 2026.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash | 2 +-
 board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash | 2 +-
 configs/imx8mn_bsh_smm_s2_defconfig                         | 4 ++--
 configs/imx8mn_bsh_smm_s2_pro_defconfig                     | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
index e675afabcfe2..50ea35890f91 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  7d2e1b5d5ab36b3a01856e71782dad2a54e634fb2b37c0a42998def3bbf957c1  linux-6.12.96.tar.xz
+sha256  164dc9d1f6c93c61a15e1f071c48379b467f2b17c469cce7223471968208ed03  linux-6.12.112.tar.xz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
index ff6e4ed2e2f6..66c72d3afd51 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index 50a5eb2d9b9b..3364ad15cfae 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -6,7 +6,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.96"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.112"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
index 6a4a662b923b..17f834130de4 100644
--- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.96"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.112"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -29,7 +29,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2pro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
