Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E61E7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 07:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3AC0606E6;
	Fri, 13 Dec 2024 07:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNoWm9FlUE_h; Fri, 13 Dec 2024 07:03:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6684606EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6684606EA;
	Fri, 13 Dec 2024 07:03:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01441ECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 07:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE8AE400EC
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 07:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBV6FLbVqbOw for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 07:03:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=07052b375=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94EA040251
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94EA040251
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94EA040251
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 07:03:12 +0000 (UTC)
X-CSE-ConnectionGUID: tpoNHO2pQFS/go43Xps1Yw==
X-CSE-MsgGUID: KtIHub4dS0ipYi1nzQs/wg==
X-IronPort-AV: E=Sophos;i="6.12,230,1728921600"; d="scan'208";a="34882630"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2024 15:03:11 +0800
IronPort-SDR: 675bceca_ggE9e7Jl3YiIIoNDSYWb98DkGA+DkowhsWZjzLGwpknrWIL
 CZBLIZx+r2YLzNzaNO04OYmRamwPNRlcGmn6uFg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Dec 2024 22:06:02 -0800
WDCIronportException: Internal
Received: from unknown (HELO ryzen.lan) ([10.224.3.233])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Dec 2024 23:03:09 -0800
To: buildroot@buildroot.org
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Niklas Cassel <cassel@kernel.org>
Date: Fri, 13 Dec 2024 08:02:41 +0100
Message-ID: <20241213070241.3261032-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1734073392; x=1765609392;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=epBHc0KQN3mlGyC06tjevF6MYlI9r/YnlbuEwEPfxRA=;
 b=Tz6FEGEe6Uvv6U8nz3NYmrRsmRX8E5+aBvHer0RmeRhyDX9AndbjYFUt
 8Qx7qPhbpIALqVcIyVKZ/LtZEE/LYYtRzXa/loizLXj7as29T6aKyf954
 zIEqs6wlJ+WSQuFERd5R3z7ym15J/7/Ym/dmmSxHWGAOu4+kX4CYmra1w
 H5ae+qXMO+7Yhb2DKS9ibd6FUxb+BHPrJYkG/RvHI3Od77eZJhbJeQHNv
 u7UYKzUEiYbGTFVIXrhuorMAWI7buL8ZHo+gm8zR3eI6HzlPte2nrSAgI
 24BDYrgco7/fRiIeJOVBPqaT1u0FUKSVA5RmY6A7ADQLCSeGDZEn6bk9s
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=Tz6FEGEe
Subject: [Buildroot] [PATCH] configs/rock5b: update to linux 6.12.4
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <niklas.cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Niklas Cassel <cassel@kernel.org>

Update to Linux 6.12, which also happens to be a LTS release.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 board/radxa/rock5b/patches/linux/linux.hash | 2 +-
 configs/rock5b_defconfig                    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/radxa/rock5b/patches/linux/linux.hash b/board/radxa/rock5b/patches/linux/linux.hash
index 005667b1f1..d00eed9a49 100644
--- a/board/radxa/rock5b/patches/linux/linux.hash
+++ b/board/radxa/rock5b/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  057263d0afc17d5253794afd3d239ba4da4aa734b22fa36c1665f41b95449b73  linux-6.11.3.tar.xz
+sha256  6f35f821433d8421be7167990747c7c4a0c451958fb96883446301af13d71152  linux-6.12.4.tar.xz
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 38b5aad206..f898e86c8c 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a76_a55=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/radxa/rock5b/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="rock5b"
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock5b/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.4"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
