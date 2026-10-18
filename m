Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88768CCF2D1
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 13:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BDBF605D2;
	Sun, 18 Oct 2026 13:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gnryuOaAtnoH; Sun, 18 Oct 2026 13:39:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1C3D2605D3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792330786;
	b=jA1T/pQAJf2daftq7o6+br85MKVgKXB6KQEVQxUwnBGnDtfQYRGZXE5xmrc2GD38zU0w
	 ny+zZL4MKrH5avMjO/QnBhwNtWb1gdR2lBmCpBj5Z5+YwPzaqRJTNMcWhTqtc7iBc/2lD
	 gSo/quocYFvMCdOUfOpYTcRqhvfMsFpGNPFV2BEE6X9brKUgH98oznQZCewJyVzmPMBVb
	 03EAM7zDqAoTH8+SAeXS59peEno5vrv5SHHc7eb9aP+OZNbXMu6AMzpRqY2Z9nfnKg7Yq
	 3lj1LPhgdYVu3SN8mx/8B/dBvvvl+vqsg8CBIvmS1jHAnKWv4pirCHU/1ATBKXIlxdw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792330786;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EyRD8/NIIYZaDeh0F1koZeGawPQieA3FaLY5mtYU+sk=;
	b=nTS5qw793D+V5d+2BJhpVhPX7kF2fNN/4U5aLktzPUeP7Gh3PwUMg8utywO3Swe+9Riq
	 Sp5vhsQmyXq0he7lMAjaccSP5AuCAaXW6Wl+wY8pIh+Jh/c1Nd9cKGsOw3LvcqhJXv+AL
	 qwEf6VqUjfMCUnXJzprT+CrdqUjN2uJ/JzboCsBzCaUDH9WFo2+tqlITgsrhMypXJn8Jj
	 zH520C9kTfocvHiU2WY7oWsniQ/FRZcbdwPU1SeFA45liFr0vioOM4/nZZdy8/qvhKuz0
	 UmpuMbXQpQkHT/e8j/dE9+pTXkVrtGNGrKHOv92BZPnqhniIfyfAUYLK2jTFNM2VLGQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792330786;
	bh=EyRD8/NIIYZaDeh0F1koZeGawPQieA3FaLY5mtYU+sk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MNdxbI/bMXtVZz8eLWyLlUZgmQYrN4IJCd3BsnYXu8jO8pVhuuakFrbwjwlehtYWa
	 p5F8ho+YiDBlGmZfSXOrF9DmBhRf/nNUKm7g1zq9yml9F3SdFKi8Xf5dG42Zq3vuDB
	 dG8Sd6Tc2JQvKFCsxR2az1vfPx3yJ+SIa6ZGacyi0ae5DswDa0/1hGMgZi8cOWAOOb
	 HUrJ0wJojYzWLaweKsP+83AG82Xj7XB8dkWAYnYT+C6t0O62bAoJHDOFIfHpiRZdP9
	 H1++yHUA6b8KYKaaJvmWYm99fRO8pkGM0kg5LG4cfU1JDlRQTQepkU2rKAF8NjfXrg
	 WgwgcXY+j+Jmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C3D2605D3;
	Sun, 18 Oct 2026 13:39:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 87E4961
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E44B605D3
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5ua_bZziaWC for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 13:39:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6E942605D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792330782;
 b=QcGftb1YOnwsHryDSja+k/v0dHv9a7u4urjq8mdwdhquNE3yqnyGSOsW6HaIlj6QAx++
 ytOTYot6PVdyaLh/HEz9VTXoDmOoo6akwiwRSj1ELcZSqK7/FtPRWMSk9J1uzvTrHGJCS
 /cg8yZD93hWdqzV9ZUoLHUEG/5b7qawtwWiBEzV3APhtKLKKyudW3SiMiJc8p0I2IqgHV
 JSWKvjjwLuYNcnVPW1cSuov5V2lWvCfSQuHGUGHzDwcNjGj7MRcxgrDO8z8U4pAsExjkQ
 bkmDoq+j+QLTWfXjtVr7pr19acgJ/++Lp+zsHU5aDiAtrOEhrYP5ROFWVbClkTKMtBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792330782;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=cPhUh8dKFQJveROgEiCPuf05439ooO1Sb0XgiUZmtcA=;
 b=iZmgQTadXYAoPu3NK2YQpt+STZhGtTxsHXUhCYdUyZAH1GmT3dbxSk+YVahM3j8COGLD
 jW+8pibEtjHeqJ5fnrrnFKDu6mjjbm/GPU+q5dvwm4xm+k8PpsCgDndDDvjZxTj9v8EWP
 J+NZx9f1ylKHtd1VmfIC9BUXqTZnf/sLeEdelA+BnO80CO8/H09U6oQ60E3OnY5Teu6JK
 Nn1diieA3Qsrh7/BP0+tA4cD4ZTQMJjRWJSDmI+nMLNdNnPkQUu6vHF2+oOt1Neanx/a2
 Ul/OWJeg54k1CRHDNAKioBmsOl8B3UyUBgL9Ngfoxr9QwqFTtAOBeEFi9LQ4PIYlhxQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E942605D2
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:39:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 359969769C; Sun, 18 Oct 2026 13:38:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:37:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a019024561fb8a8738f5f341fbba965c7d348c75
X-Git-Newrev: 914949f12bfddce7d455c5fa6331cbdda01041b5
X-Patchwork-Hint: ignore
Message-Id: <20261018133820.359969769C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32f769_disco_sd: bump Linux to
 5.15.222 and U-Boot to 2026.10
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/914949f12bfddce7d455c5fa6331cbdda01041b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch bumps the Linux kernel to version 5.15.222 and U-Boot to
version 2026.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash | 2 +-
 board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash | 2 +-
 configs/stm32f769_disco_sd_defconfig                              | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
index b4a6bbd3f7..20f03bc1d4 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  beb954e53617928b751944a89b6670bf9a9c7177c641b24c5dba504e46f1d961  linux-5.15.211.tar.xz
+sha256  4d6ec07679bd008524391cb67597106018646c6378b3953c23ec69b9259cdf84  linux-5.15.222.tar.xz
diff --git a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
index ff6e4ed2e2..66c72d3afd 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index a025bd7802..6732314c28 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f769-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.211"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.222"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xc0000000.config board/stmicroelectronics/stm32f769-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f769-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
