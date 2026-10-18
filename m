Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B714CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1767460656;
	Sun, 18 Oct 2026 20:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5zOqQ0W0v5I; Sun, 18 Oct 2026 20:20:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3577F6060B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792354819;
	b=HxMfngTxdLS/rfM7hiyRq+gNjJzxi7CrbInWIHB/Dodn6EmTa09HkCBYFxEg5hNFt7+u
	 933ajYe/Op4Pvwvg9g4GHqSVCxDp8lalA6kdrKv+gP6G7mWzpTwVfhB2PcgUYm3kB0yP+
	 TszyCfceymvqJbsA6gM0jjuo1KWGTmC4VuGcOMNnlhFGGNc2HlTTsa+I0xAwIeKT88bQS
	 aVdLe+s61ikipkb3w6XKGmiX0xdZ3yRATdRcGVogtjwca40MIgrtBsC3uaTdFyT2cXEJE
	 pj+ZnxLhlIb/Lnbaqa2L+ZP6tdrRrYlrUEzeM+EDalmBT0cL53FXybwUwG9DvnAkxRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792354819;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=30P9IxlXoDZ4fqL5ew7PVliIFLJ+OcmnWXdeojRUKRs=;
	b=OjL+akpIPXcR2MQ1z1G6jVpwqJP8hYeryXYeP3HXMf+KXwXMH7ow5xuK1CLaJwzYJFE5
	 AaawfVgUi8+gl1HTTXOjGN8cgzalTexicfjZ7HVe6f9kYQu182+SxgVGt2R5nzQFiaZsa
	 TR2jnrhfXoVDiKxvpAGN12P0QjBvEOoFvK840cIeX4cFbI9mnAr+eQqQQWQh5WAnBntuU
	 1x9GmDBb/Ui/I7xjT3/2pXDW8ablUPcPSHQ0bUSOC1QKOsP+NM9VTU7ElYAmWXajJo6En
	 xSpqRYyguqKWfXrHiCeOIVxBx0TKM1EzF6szyCDOvSuJQOR7pSznY6R2fb4O066lEeg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792354819;
	bh=30P9IxlXoDZ4fqL5ew7PVliIFLJ+OcmnWXdeojRUKRs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hEy0zFRTg3Mmx004e2Lm2EQwW0PvTprnz9kEsDndKYPl3IyrYrfm/m0WxZ2cLvmq/
	 sjisl39Ipcoct5wP6qGWBVNLJvyGrjWUTqslhZGqfmSji6gN4ltnsz8tLl/4JpkV4O
	 HFxO4lgMQJZgFZB8ehFLNXmcGDe10FgfOShYrp6N5QEALctRoNQA1Es0oeJtt92+NO
	 jR31R1G0dMCwvBA+71EtN6lMRIgn2pL+42wzNw/j4W4WSUDvLMECBV87Rmym42ugXl
	 iZAsxZDggkOwXNqmJoOn6mdeq+dAVAU62tyB1HRLpJ8mVusub5X8erEcyGGnmUQvaD
	 KcQ/vxio0OUNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3577F6060B;
	Sun, 18 Oct 2026 20:20:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A6DC279
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2005A4065B
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3JH1y73YmJ5 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:20:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 00CE740650
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792354817;
 b=OW1Gud4Wem04WpOHWZRNmfzVKaRfwyhflHXdkh17efQ2CZPZt53qa2O9bq7kTuK5ibxF
 BHhhclKfM/jKN1aKPJnjGq9ZTTQA4N4QNxdAVqY2xzMgw1D4evNJ4FDRebuiK+jPjhAM1
 Ra01snVIGFbNGp11JL0S7o42QIM4OATkvGDeUSRqwjrQQJo1QCKT4L5Kugd/6zN8kYmke
 14alWIQye28hQsUDVtJmOEoZbDJtNkxdKrmLOoF60pt2zC2+QwVpXoF/e7sOeUqGaRJFZ
 bTmLWPONpilaWZ0+IZikA+VOJ0SIZZ8v4r4BsHAXwyYltSXLHHhE3WfHmYofLACyXyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792354817;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bjh3e1Z8u3fM0fryF7iMIpTOP9HUxBvy647bOze/85U=;
 b=TjoPJqQmq1Q9vJIZG2VNO7M0uUzsnKpCa75/VCJiNBoZte+IaaYJ23PkIn2hwq88N9jB
 MEyF+H60QbNDjrWgAQWXWJb5iy01ainkBP5spsYZrt7UAGRo0hHTOzZBAcfcUovxMh4EW
 ubiZ8fPUKuek2QQ9GkX2xTYlM53zcXzWOcXNeCJ/Z9CABGWveHu7ft4H+/d4RdnDSSLb2
 jSDQknAtfKnfjen+AVsOB7N/lDEQOTmTP1uaGLwvN3nvD/P0Zv+3WvXgMiPat5n1uhkrJ
 dlqijye0+V/4zXufNWkd08680XtVuOknOBRDM4EhvLhrvT2Fh4fboXsJ2Kf8zocGVBg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00CE740650
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:20:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8C33983F3; Sun, 18 Oct 2026 20:18:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 22:19:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b68bde564339e96397929b45c04d137bb65df43e
X-Git-Newrev: 93c3e0384ff897bfab441c75a61ec16723669cd0
X-Patchwork-Hint: ignore
Message-Id: <20261018201854.A8C33983F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_am62x_sk: bump U-Boot and Linux
 versions
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93c3e0384ff897bfab441c75a61ec16723669cd0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This patch bumps:

- U-Boot to version v2026.10
- Linux kernel to version 6.12.112 (LTS)

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien: add link to upstream hash source in linux.hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/ti/am62x-sk/patches/linux/linux.hash | 4 ++--
 board/ti/am62x-sk/patches/uboot/uboot.hash | 2 +-
 configs/ti_am62x_sk_defconfig              | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
index 08483293cf..1a1d6e9a3e 100644
--- a/board/ti/am62x-sk/patches/linux/linux.hash
+++ b/board/ti/am62x-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  a9e8c51fcb1e695d1d35dde5886cba579cb6f29c9646c5889f39d63841d4b9f6  linux-6.12.95.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  164dc9d1f6c93c61a15e1f071c48379b467f2b17c469cce7223471968208ed03  linux-6.12.112.tar.xz
diff --git a/board/ti/am62x-sk/patches/uboot/uboot.hash b/board/ti/am62x-sk/patches/uboot/uboot.hash
index ff6e4ed2e2..66c72d3afd 100644
--- a/board/ti/am62x-sk/patches/uboot/uboot.hash
+++ b/board/ti/am62x-sk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index ddabba238f..72df755117 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.95"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.112"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
@@ -28,12 +28,12 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
