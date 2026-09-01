Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029AEC79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD41F811E3;
	Fri,  4 Sep 2026 16:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQ_mUSzspRaE; Fri,  4 Sep 2026 16:22:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B607D811B4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538972;
	b=JGvpCi/+xNTJSTMhjD3C4uhTRN+KicdvxLQIz4C5dLzSonrP5ohxfYMF9O79mNavWffY
	 essbTUUilk1D1qWP0pO6Nx4mOSZq8VUBVOwNiVeI4GWEv/hNODz+f1Xl2J9YikqpD7/WP
	 E7yTSxirtxIaqnrNtcx51j3I5NFGRSoXeiYcE2/L0jp6XXet1JtNLMZ0Xx1gxEwXDBQvT
	 G9BlJXnrZ9nO9WjWJqxhsJjNL8eKr50EIb24YikIh8OpMdOg4L9gQX+a/c5v9gJcOn4ww
	 LQU1GRijr1TxFEOkl8KFdJCpcF5KNpOVjGFGJe0h3tJnpKFkQBJrDoMfqbW8BUhfp6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538972;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=FpjnOCwnq6wip9k9/EnqGGZwOonCww1WEFYZAZc6o+s=;
	b=cSuz++IYN5JmO7o6UIAVpTGrDntZACDu4Wvd4nirU6k4MQgR1834IrVDP4XRVbss+qxC
	 URV2g4Nk6ZlOsjTHI2kW6yrZkr/j+CH+9AJQ8cQb9EvfD7j0CsllNRHvgeh+j1g/fBetV
	 0lM7E84202m1OOZMbJiUn9whBwQxBifywx3oslSD05RpiMQebJE9LYIrP7v+pL+gKp5w/
	 yhYbNL/dL4THk1Se6KwtMM1q9k9VDuTnfq+bjtcf36iZNcvNQFKG2D508FyRLvoFFsYmP
	 kT966OvoOFalIjpHkmAUOP9XECePt+hb+67Bcfi4sKDq0P5oF6+cEfXb5GITH9PCkNw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538972;
	bh=FpjnOCwnq6wip9k9/EnqGGZwOonCww1WEFYZAZc6o+s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YqhhximKybBF4zrq2ueF+vykzKFVHcv+ngCSsqNloswVtSw3BSbSaGL37jvvyuVQ8
	 lysnCLkyV3zxdy0zjeorwvWBf49q4OruwO2rfOSPuKp7+UGLAh+vrUZ4RZLSsv/jCT
	 H58Tz5TkNoPEkXw4ezDvl16h17uPR9L9ZdryyaEUwU6Qkby166P+lPpzjnd+SvUlNA
	 ehAW40VG2FSNdvAgWe7aiKvcA1ofKtZ2TQSLMDnD/qFFR1EykK1QIGRVzCAjY2k4qe
	 Vx409b74Qpqn8BF+GV8yue2F+JQHhb0w/3wqvWRolcMqMucm2luZUT0BnDJe33xPnI
	 LrUf387W3vI3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B607D811B4;
	Fri,  4 Sep 2026 16:22:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AB54B2C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BAC640A61
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id axm2oMPxszJQ for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0BB0A40B11
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538928;
 b=hj2mdW2rUxIQMzwSq//qMg1nOtEVg3Z7hTEyaiFafhcknfDtz+wvQiQq2o8TLyO9bIyZ
 ZA4vFCrFYl8AfSjuCTeNMWHzLc+VAEshDmSNQkr1Jn7a9NaEmnnXdJlbZqZ2VwRIQ4MNm
 nN5arCWEFjryQPbI/3Yei4YZVxzHksZjiJHHbGv2E7EO6tI2naOyRAIjitG4rrbpxFbBI
 fSg7jXIK3wzak/Y9xvcCf+4tOzxlwOxcJTF3OAN07RcRU7+2R6CbyCQ381MTjWSECwWHf
 GrRyTidoDk8PaZtjd+oqGSUf/2Ot6Pjjrh70wViYJmrnnGGSPkIlwerVjCVcwluscpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538928;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=plWj2quSL0DmPut7FcSUCNCPMZPClg6Eo1GkOwbHRXk=;
 b=YE8IUOXgZpHLRFAbiaOiTJtyJ5ej/nztPixQPeQVVCL4HLyeyOjFnf59UkEIaVMfOee5
 T7IgdxAEcGbnUMR/e74L23NqRTXX1Jws69LsAM09hjZjv6jhRjZdYMNaVZAQu0XXjcfH8
 t3huC8rqclQSTnRgLgDqs8yVb5Lsyd9qWLaO5E7fdlTRzTSJhdTlN8ATvzlkOCD2zWqVJ
 0qUVSAuU9nkMJB40ThavI2oEXhoSPSMsmuOkRCT+fvwa5Qqz7Cj3C/W0fFOan9BiYVgEh
 mlhZJ+/VfiWaDAPIqbAUsoIYAdOIuLhIUShTRdmo6Fm97gszzHw11nuHbcQxvVmiG/Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BB0A40B11
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DEFC94C87; Fri,  4 Sep 2026 16:21:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 1 Sep 2026 20:10:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1009287df7fda4e90ce3e95bbae1f08288a78dc
X-Git-Newrev: 0dae674d98c951699bb12d9c2686fbdc2f4d036f
X-Patchwork-Hint: ignore
Message-Id: <20260904162107.7DEFC94C87@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/versal_*: bump to Linux 6.18.40
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0dae674d98c951699bb12d9c2686fbdc2f4d036f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump the versal defconfigs to Linux 6.18.40.

Run tested on a versal vek280 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/versal_vck190_defconfig | 4 ++--
 configs/versal_vek280_defconfig | 4 ++--
 configs/versal_vpk120_defconfig | 4 ++--
 configs/versal_vpk180_defconfig | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 100af782cf..5499f1a229 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -5,14 +5,14 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1)/xlnx_rebase_v6.18_LTS_2026.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 42562603d6..4072e7cb22 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -5,14 +5,14 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1)/xlnx_rebase_v6.18_LTS_2026.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
diff --git a/configs/versal_vpk120_defconfig b/configs/versal_vpk120_defconfig
index 67dfd9e424..37f353fb21 100644
--- a/configs/versal_vpk120_defconfig
+++ b/configs/versal_vpk120_defconfig
@@ -5,14 +5,14 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1)/xlnx_rebase_v6.18_LTS_2026.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk120-revB"
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 0537fce6e0..1a67d54bbc 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -5,14 +5,14 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1)/xlnx_rebase_v6.18_LTS_2026.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
