Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B17CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 13:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1193E406A2;
	Sun, 18 Oct 2026 13:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oa6okAllZfhU; Sun, 18 Oct 2026 13:39:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1D9224080E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792330790;
	b=X3w5s7Vcnhh6SWzQolPn9dL+wryZmomwnoR/UrmorH2ts2r5T7uBNFWe3DCe11jzVWhV
	 kLQwJFx4nn1pux8EHufYnK78Dlyg1n2rNUGtXJXJgmP8XjSt16Tjh5plRhI4BxiEeHohC
	 9U6r626TdqB5FBzIx2cr9okOJXoahw1E7tiDBoV2OZy4Vra93LrtjaMzd41IVU6ijVNpI
	 6RcrT3G4domVSh14it02kXDqbHVUrUlIKHwdM2kWEnEStbStwICrJWXNmaa3uiVtsqkmM
	 JBqiCcrazdlnibEkpZ/vOmyNNIFanmzMfkQRzjPr0k5ai+Q3uEOH78VVtMWGY8qslxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792330790;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hcUpERKckbwO70uMp9LRJ5O/woscGkuVPQTA30QhgEY=;
	b=DnQEZDnkfEyrKnFLqiCuBXG5yGgi7YPXWf2OI1yqroZpC8eYWb5AUpulYYSmyN4ofYr5
	 BJdUWipcAl+QqEf2bDG8wawCBA5q6Pf99rrVHE51vHq/udraiCP/2dqTpwDgtZ94FJI2M
	 /NgUG20tXQDf6Mm6pGq0PTyjsLi7kdKRZrrutYlJrgUkzHHdvJWL6p5Qq5y/WGJLocIsw
	 X4+JKbmLj36ibDhkW8B4tkdoh2da7HxptlAYMG06RXK8BhBUDA64IMIXNrIlM2dxDHxe0
	 hbdfcbrMKtkwcZg3fnwEvwy+B4Chqt/u3toTFMkMMsY+IQmgOb3/Bqy6Fl1CGZ88uqw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792330790;
	bh=hcUpERKckbwO70uMp9LRJ5O/woscGkuVPQTA30QhgEY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DkpELvZrCWgdR1PtbHhcn4ioI3hmSapFn7jTlcaJaAzc0HfffGMfBpKG0Vm0EjAYp
	 ijlkrlSDuFJ8xdtSwwJUysnZoJiCjKLpv80D7o+0or/MNhEXX0+HLfL7gcniAsPV6i
	 I+BklYuRix6sjM2iDdgtJ2jBbRdmL5KSUpsDm34ZIJojystBBxecyGtRcAlnTU8sSI
	 LzH6Fj06csgZhXOMEPpBjhoXDShJsw3DT/PoBessJCjLky3BY+HTiuyiEWvDjXbn/W
	 EPhFgf9HC5H4IozhqH5Q7m3w0Y+UMGZJZPbyymFzxePbmzkQUj7dKolRmvnlhEppOP
	 3BaLPvthiTxSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D9224080E;
	Sun, 18 Oct 2026 13:39:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1FCE255
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3E8A605D2
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WUILCx69-irv for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 13:39:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D9B1F605D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792330783;
 b=sLpY+5/FL3MSyxj51k/9pDJhAU9q2MU57ittXEf/mcFaLc6yM6bOPY4QXFZz9zTKSEJW
 PxhNNion2cCSH37FOrquKNGJlzwMks+PsjSAokP+/0oCJGQDzBx7IKzzf1a0eTMeuPUrt
 QJzuW9Ma5ptn6a/5+wfA8NJRJaq1xdHKFH8QXZNMDYGlF61FSRQ33J+PDMls24prwpPAy
 A8Z6rXxy7DY3UR8MhM6xHx63Q/pLkBJBJGqg2zXpDJQzZHX0ycz5K7jNstLi9b8aSIkWR
 zQ+b10dNx95ilq5Cc0qgVQIlxw7DlM4D1/3mRRwC4G+OU33pBIY1GyOG2mhaISTSo1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792330783;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NJ1BYW34O7N1UfwVRU9JNVqPtiaPJQ5yx+6BKFY0scg=;
 b=f0WjJGPgXdjBp193NnPgd1USfmatXDcvkAinGqRaO/sYMJQnfLI7lo4nJ0T9hAJmI7W7
 xOndhDv/yNZT0T2bRlRu0adr4rC5LxNcLWYmV+uA7RTM91CpBw42kVUCbfh+Quv/dmd4D
 OfNVLY5T/TpkMwTwn1VNgWA8LApE4ecD8Y14K0F/lvif2S9w5S3Nn1E6jASHluA7HY+0h
 FXyEqh6NsZdvGQf8kME9KbKd7s7OOVPLJOU5JlChOQrSAaq8T4iqXxma1Tz0qAhb+5/0a
 6QewcIvQ17P4vrxV7JdkGqyBhrZ9vys7sMRMxasW1iDQBgJTeIDPbBwHIDnM3YwBDxw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9B1F605D3
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:39:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C112B9769B; Sun, 18 Oct 2026 13:38:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:37:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5700f6e375874b10bffabbfd5341e673ca234653
X-Git-Newrev: 8f3fbc351fafc7fefb080b2a4c68d2d0c15e01ba
X-Patchwork-Hint: ignore
Message-Id: <20261018133821.C112B9769B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32f746_disco_sd: bump Linux to
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8f3fbc351fafc7fefb080b2a4c68d2d0c15e01ba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch bumps the Linux kernel to version 5.15.222 and U-Boot to
version 2026.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash | 2 +-
 board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash | 2 +-
 configs/stm32f746_disco_sd_defconfig                              | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
index b4a6bbd3f7..20f03bc1d4 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  beb954e53617928b751944a89b6670bf9a9c7177c641b24c5dba504e46f1d961  linux-5.15.211.tar.xz
+sha256  4d6ec07679bd008524391cb67597106018646c6378b3953c23ec69b9259cdf84  linux-5.15.222.tar.xz
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
index ff6e4ed2e2..66c72d3afd 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/stm32f746_disco_sd_defconfig b/configs/stm32f746_disco_sd_defconfig
index e0c257787a..75c309a34c 100644
--- a/configs/stm32f746_disco_sd_defconfig
+++ b/configs/stm32f746_disco_sd_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f746-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.211"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.222"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f746-disco/linux.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f746-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
