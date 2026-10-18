Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930CDCCF2CF
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 13:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E1B16067A;
	Sun, 18 Oct 2026 13:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7sNRBqhk0Vy; Sun, 18 Oct 2026 13:39:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 677BA6068F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792330788;
	b=BhKYvSYu/FIXBZ4fW3BgO40tPetzfE5mfguniAkSkZmSNVsqEljhzNE/AxkjCycmm3zm
	 /TwNpLIq8+V4fsNYr1Itqi2TpKw0DKAehCZBXDQmsFALNQvhhb2KPsgsfXLfMZeSL5Gdw
	 rdseGgB/D//F4iq7nRTZpLvynF3e0BNVuLlO50sITa8K/QkJUZM2HekiLBI07mztP5tCU
	 zZuee6Ixf2i8PTuUhAob12BgUiFSDWiQTYKZlASXx878qWCzGex2GkLnEXRIvCMwJNMct
	 RRYjy1VZSlBDsrDxf0Mb13ipwK0YxIp+vxHgQzClFjnFxPkzQG6DMLnmhlmqXcedWmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792330788;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XnNk9E/TYvG14Wyb6m15G+/CHiQ4uT0LkzRyQJMVDog=;
	b=Mnt7RReCjqxrVZ6wCuLUFNGJaASsT0POCLF+i/WppRGf9sE2OhdAnJVSTEyTwV8ie8nJ
	 3fCZUNYNmnJEpfIw4rA0SjUUqPEcjk0/ZpcpbUgtLyoeU7H7HmSYGolDNPbX/UG7sK/Hv
	 NPzRLLIMQATxXxDXvGcMjjk6C4SG/P4qrVPbugj6HxPVhRd/EzjwOR7j2jZqhNrVe2XEL
	 +SXRra6K+7kvPeIkcrAGYncVcs70cq3x75pFhLXw9zcmRu0ZoahBJ/86cROuFtknhsul+
	 R7qFaj7KAFvClEFxDVHvrX8hsosJoMimvFtk2qDyZjUFiuSszBK1Wtbi9dxIzUNbJ/w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792330788;
	bh=XnNk9E/TYvG14Wyb6m15G+/CHiQ4uT0LkzRyQJMVDog=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sx/98kMPVax1Q+p+Lib9Y2fyZDf9mxWQSyT2PGnTByiFC47otAaKSsWP4X22w4N7S
	 PNhSK4YOTyLVGiWDiAM1nawxP+07AbXe1YTzeynlt4Kpq/ENQkAdJFqndWd3/5Vdz8
	 3PFX6S8XzPKYQgWNXQ7VfH68KEMy7qwxNd7AjdTcCBYL+XRhHHjH3ZRGOlEbNV/D/N
	 jntqwN1czIABUhq6P/KE+a9ouG2lBmwx/dOjaa40BUNb61Yu5S0lo7WBbopjXIWq+0
	 ns/tjsGQSV8ocgFwkpm99WU+f8skA/Vq9iYEjZy88JnQJ1fdBVKLtDxJncNrHQ/nSX
	 5a4r71VFBuJFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 677BA6068F;
	Sun, 18 Oct 2026 13:39:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B4EA255
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 719F66061B
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqR3jq1Xx0U4 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 13:39:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AD475605D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792330783;
 b=OYVBT61CH0gYb2/TiBIW8Rwm2Qhjq8L4dA7qgC2CZFVc/YEqobh6scItg5SG2JanNkMx
 qkqA/bVYb/37yqVccUFq9CmZPIJcQeZAA6VtnHy28AZ3jIfKbi0AzoqUohpHjNQ0TJ/SC
 8mME2eOco/OQqajkuRrXKJnHhpEo7OEq51JUa8mC6pQcfOu8GwU2lmPS8X0yXj4EKLmMk
 /u3Z6p0i6wZN5tKIyo3J0Zh18c8/gh1UMGphmOWf/qyyZp00AAcNuN3uEdZ9HkDIz6a3n
 Gh5CTQxTxXWmED5ULKoeVAoXEifqp1k/Bz7KpavvbAMYIsTIMtu5xBO4A/ttVkvDGEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792330783;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9hB4EP4mZ9Yb1OPeSF8K/MGkA3Iw00XfO0Z6ONq3Zjg=;
 b=f3fLzRKU5UeWiy3B8g4bpdDhaUMLyqKQaynh5CWtWyoLRovPtT9PS7Urfs68ge9H+xHf
 jHrBpXE6kMJi/9PL8HIsiZgB31vyS8nH1sGmWACXFaWzYDmOR7oofrawGr1YVlJQFGGB1
 6vLiUF5uzOp1w9Q3WdpssEwDz0mKb1NV2rcbDZlTopXxnJ7RnuK3uiaANZYli+931xKAD
 GEdgphm4PQPNlxFo0FeQ4eGSOeQRH02yPlj8x1x5z3oCCJoAwgQElN1iA+QXhjIDNx7fC
 iMCIUGg/qiO1EUq2s/KgXATSdgxHR9M019elz2QwmHhRQN4ouuwtP9CjDeCBNccgk1w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD475605D2
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:39:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 929149769B; Sun, 18 Oct 2026 13:38:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:37:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 914949f12bfddce7d455c5fa6331cbdda01041b5
X-Git-Newrev: 5700f6e375874b10bffabbfd5341e673ca234653
X-Patchwork-Hint: ignore
Message-Id: <20261018133821.929149769B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32h747_disco_sd: bump Linux to
 6.18.56 and U-Boot to 2026.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5700f6e375874b10bffabbfd5341e673ca234653
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch bumps the Linux kernel to version 6.18.56 and U-Boot to
version 2026.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash | 2 +-
 board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash | 2 +-
 configs/stm32h747_disco_sd_defconfig                              | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
index 0daaa94e97..d89fbda1a7 100644
--- a/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a7a7e3d2ae9d95e74197223a8d4eb5f6be7aac21b6e6de27e9685d001c1f8cb0  linux-6.18.39.tar.xz
+sha256  4633bbda2ab95eaf2a7af4041236451d6759c72e6946265531af4b3aacefbf89  linux-6.18.56.tar.xz
diff --git a/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
index ff6e4ed2e2..66c72d3afd 100644
--- a/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/stm32h747_disco_sd_defconfig b/configs/stm32h747_disco_sd_defconfig
index cd882aa5ac..a3b46f94e1 100644
--- a/configs/stm32h747_disco_sd_defconfig
+++ b/configs/stm32h747_disco_sd_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32h747-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.39"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.56"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xd0000000.config board/stmicroelectronics/stm32h747-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -25,7 +25,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32h747-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
