Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED9DCC6B39
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 16:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA24C608F3;
	Thu, 15 Oct 2026 16:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y027hGlDH8ql; Thu, 15 Oct 2026 16:02:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D5F6260888
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792080166;
	b=O0o7UTATtFiXyMxooneAPP5L/P4bOJQCtpMySfnPykioKfWOYtabxtCAyT2J+JyqBrEf
	 DmNULwuO/lurIxf+D3Q1c2qmQgk1qA+gbdGKP+a4kvpoGc94xH8N4GBBYl4o24AuKjeJ8
	 UFqUzagbpVwYUOD9WGJw0LT58ypKKkH6gABbdJm8Wv5p79TMJEwnel8Ah8uz8RB1TpPkQ
	 4edhtPN4DjfG11Th203qzEUWXEP8jCfc7S9sI51VfBuddC6Wtk99eGZEOHazsgYMs0yx5
	 bz+AoNMy7BqfZtXUtPOKKzC2aOaBb8sAFcpMzc+cuCt57sB71bWUhAkgTzRw4nC5HhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792080166;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=yJeyzrRIPvkYLyYYu4chVpGorkerX07kDH/3Lyej/hc=;
	b=kVFMnWp2kkveWy40XKg8rlCXtmTXZrvJInGPohb6xeVT/0iOxKw4Txo0P+BfbhfiNO4h
	 PnhEw97qXg4rwk0NM2pl3mZsmrRd9mTFWpQF8OvJUgwxRzR6LGgf14nGyOuxrqfDJ5+jh
	 jbXhOenm2uFKiT8XCBn0yrd+24e2/bz7y+Nb7FDghxkLTcAsR921BHA/DikLOWqmMXHmj
	 +f6YDmFeA9SVjLmwVL7uWyhuN7isqjSrL30hcAWz3RzPAfQEYbRn3QS2NnkLaBou3fWzu
	 WBurF1kpPjuRkOCYLp4wNq4d4rGGPjGJCckjWxsORE200ywaTP9V8MOyTODfQK3rXew==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792080165;
	bh=yJeyzrRIPvkYLyYYu4chVpGorkerX07kDH/3Lyej/hc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LSwxCwxFbvHEv24I1wkWKeWcanlI+pVK1fGAFLJ0CKEBFo0O6hF4x1SjUZzX30aYH
	 FvgMPJKf04SvbXGqsekZSO5O5Ezcolm8JvDAfu8Dzw0tF2ss/lymMLs78tcJ2Au2Hp
	 a8tpwdkaAsrawlohve8cafasK7eFqNuWBxZXlv9YwuAcqPXbr38C7Jr7FJtfHi6qJt
	 +sJdK0IsyuVPRcnctjBlHvIizLWSmn/bigqJ7dO9LpF6LVarhzOA25B3VHArV6uW2v
	 pSJvJFpzGKWpiQmHUkDRYwog3Mv4SxMLBkm5Ji3fxcWuWBtvIi28UgPwoZVhboeax4
	 PZO3hJ4iiNWBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5F6260888;
	Thu, 15 Oct 2026 16:02:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F3998263
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 16:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E56E680F7F
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 16:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AaP98nOMlLAL for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 16:02:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 19C7780F70
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792080164;
 b=b46yIoQVp2V7Lw8RygzWj4di8HASRtM924Ja0ffPEqK+HX3gOUALCcfChtenEzmCGBde
 eA/kZvM5jf5EUBgv7nk0ClfS6pzWwC9ukWdpJUZQgeQt3T3Fk/IPi3UVf2s0k01c6FgQr
 mlaIgzxs3SfNmF8/hOts9lpYo7glRSMpG9NoBkO7DetFYkdFFHu1wXk+NOJne7kWT+4Nm
 kJ4F1ULD3n1YBx9h8rOJOdKZXwy0PHjLbHi8FwqfNngmSSS0J9pSwhY4b1Sbo67PqrxVf
 SvCF0J9cBMt2RtBwQduHeM59lEt1sdpeS3xYRBoyYsE7hZIslNQjkepjpeMwLtgGQ0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792080164;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=22ofjDE+LgeX1u/hlf/q7fOzC9Zguz2psyisS8Xz0QQ=;
 b=GVR7syl1cgXN32Z6t3gWO0UIpBZJIGIWcsSJkS9lb2TWNY0ruPPFqJ2bBg4QkC+Win0f
 3Y9U5gv/OEliaAuIj0GmpgroU2Ed8UDEHgkBHR8/9u4aviSj5oRd/v7l7zJumJuYUi4q/
 dsqzoQtm6IwwCYS/2RRgZRD3yLSKKNxZH36+7b6Q+yA2sUuI4Lbp9YXPu4rXD/UQ4jkyV
 9lJ4dYoSvTnQgD/wd7FB4MU9KXCWoLogkrN4DFPsnV8pM8NXgt/Bydx1yI6CzwnhxpNgc
 dpA0v4K5EbnxpSld54sNr9G5yL2iiI6FRzlrAz50PXeGnBW+czywsB6Zan/XFz+6nIA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19C7780F70
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 16:02:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E3BE95CC1; Thu, 15 Oct 2026 16:01:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 18:00:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 751131d6cf210aa2c0d4622d4546f0970e137e0d
X-Git-Newrev: 98a583e982420334c9ab24ec9e54826dc09c36cd
X-Patchwork-Hint: ignore
Message-Id: <20261015160123.4E3BE95CC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx6ulz_bsh_smm_m2: bump Linux to
 6.12.112 and U-Boot to 2026.10
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/98a583e982420334c9ab24ec9e54826dc09c36cd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch bumps the Linux kernel to version 6.12.112 and U-Boot to
version 2026.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash | 2 +-
 board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash | 2 +-
 configs/imx6ulz_bsh_smm_m2_defconfig                  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
index 5adce2bab4..1a1d6e9a3e 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  7d2e1b5d5ab36b3a01856e71782dad2a54e634fb2b37c0a42998def3bbf957c1  linux-6.12.96.tar.xz
+sha256  164dc9d1f6c93c61a15e1f071c48379b467f2b17c469cce7223471968208ed03  linux-6.12.112.tar.xz
diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
index ff6e4ed2e2..66c72d3afd 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
index 23c23cd758..9b817e9d02 100644
--- a/configs/imx6ulz_bsh_smm_m2_defconfig
+++ b/configs/imx6ulz_bsh_smm_m2_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx6ulz-bsh-smm-m2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.96"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.112"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/bsh/imx6ulz-bsh-smm-m2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ulz_smm_m2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
