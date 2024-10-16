Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EAED1AD56
	for <buildroot@archiver.kernel.org>; Wed, 16 Oct 2024 13:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F75080F51;
	Wed, 16 Oct 2024 13:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHzZxXPYSsbi; Wed, 16 Oct 2024 13:25:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E949F80E29
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E949F80E29;
	Wed, 16 Oct 2024 13:24:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4ADAE1BF306
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 13:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A7A580E29
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 13:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXMcYE_m9Xx1 for <buildroot@lists.busybox.net>;
 Wed, 16 Oct 2024 13:24:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com; envelope-from=prvs=012b9cad8=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 605A580E3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 605A580E3F
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 605A580E3F
 for <buildroot@buildroot.org>; Wed, 16 Oct 2024 13:24:52 +0000 (UTC)
X-CSE-ConnectionGUID: 30Y/bL/dS1uqQUDP5OVF3w==
X-CSE-MsgGUID: ZoiW8kdKT8SZdD8VmCNvrA==
X-IronPort-AV: E=Sophos;i="6.11,208,1725292800"; d="scan'208";a="29192764"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Oct 2024 21:24:51 +0800
IronPort-SDR: 670fb053_ZeVXIcPzslYAR4xlTbPQ6CXWGHrf0HMo9MiJtQuIK7EeaGS
 Len2R1QT3V343XEWNfs34MZ30UHpTxKwj8HJu6Q==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2024 05:23:47 -0700
WDCIronportException: Internal
Received: from 5cg1421gq2.ad.shared (HELO ryzen.wdc.com) ([10.224.3.238])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Oct 2024 06:24:51 -0700
To: buildroot@buildroot.org
Date: Wed, 16 Oct 2024 15:24:40 +0200
Message-ID: <20241016132443.3859149-2-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241016132443.3859149-1-niklas.cassel@wdc.com>
References: <20241016132443.3859149-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1729085091; x=1760621091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1+fSspB2/qEDfoXnyBkpwM7ZeamTloy8rLIkTLXy8NI=;
 b=cD15tYaFUa+njBrJq9oA1+4u9z9baVUVVQwE7Jt7ElKXVsmTSJTBHvHx
 qaNl0m3bevG6pEP1XEcWC6nYl43ykCQEaFP6NtJTjoymOPxJbvg/U5vzn
 ygfVdP2+/YA4z+3blT/YrHevWFFzM5DeoVfqDVtwN85dXl32dggJNmD8E
 sisV8qlR7bmkIFZvH0zY/aSn9JyacFzZTuCHSv+8qkKGg7/y1QwHNq5vA
 3acN40d7PdphBTW5NJe1W7uNXvgXS4TeVDMqhRRR5FH9I0aQbNBKwU2ql
 DRq+vURj1tMPShIANFJEEFZfuLN+GmLg9iaRxn4RgTtGtQAPLFdLmcTmv
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=cD15tYaF
Subject: [Buildroot] [PATCH v3 1/4] configs/rock5b: update to linux 6.11.3
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Niklas Cassel <cassel@kernel.org>

A bunch of new hardware has been enabled for rock5b in linux 6.11,
most notably USB3 host controller support, GPU support, cpufreq
support, and PCIe endpoint mode support.

Add the dependency on host python3 that is new since linux 6.10.

Also add the missing dependency on openssl (which has been needed for
a long time, since we are using arm64 defconfig, but only shows up as
an error if the host system doesn't have extract-cert installed.)

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 board/radxa/rock5b/patches/linux/linux.hash | 4 ++--
 configs/rock5b_defconfig                    | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/board/radxa/rock5b/patches/linux/linux.hash b/board/radxa/rock5b/patches/linux/linux.hash
index ba90c84f54..005667b1f1 100644
--- a/board/radxa/rock5b/patches/linux/linux.hash
+++ b/board/radxa/rock5b/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  f68d9f5ffc0a24f850699b86c8aea8b8687de7384158d5ed3bede37de098d60c  linux-6.7.4.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  057263d0afc17d5253794afd3d239ba4da4aa734b22fa36c1665f41b95449b73  linux-6.11.3.tar.xz
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 4d5e7ca583..bc7b73d652 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a76_a55=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
 BR2_GLOBAL_PATCH_DIR="board/radxa/rock5b/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="rock5b"
@@ -12,13 +12,15 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock5b/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.7.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.3"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3588-rock-5b"
 BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 BR2_PACKAGE_ROCKCHIP_RKBIN=y
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
