Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0C2CF34AD
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 20:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02B5C60847;
	Thu,  3 Oct 2024 20:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5xmVQzZhY74; Thu,  3 Oct 2024 20:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0429B607EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0429B607EB;
	Thu,  3 Oct 2024 20:45:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7C0E1BF41D
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3AD5607E8
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SpibZHUqQBnX for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 20:45:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=9995b4c5d=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 082DD60787
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 082DD60787
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 082DD60787
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 20:45:24 +0000 (UTC)
X-CSE-ConnectionGUID: QplGnzUMT0OJgzxDBNM7DQ==
X-CSE-MsgGUID: /f/RZDrDRAqwjVCDUS+hlQ==
X-IronPort-AV: E=Sophos;i="6.11,175,1725292800"; d="scan'208";a="29091915"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 Oct 2024 04:45:24 +0800
IronPort-SDR: 66fef569_iOJeFz9ASvHEoezwtggUQL0KuCOkviMXm7HU30Z+WE8CWHd
 5tF0q6KUGU6k5VQ88AF1W6wcbE3GPdIQLRLHI0w==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2024 12:50:02 -0700
WDCIronportException: Internal
Received: from 5cg1443rlm.ad.shared (HELO ryzen.lan) ([10.224.3.162])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Oct 2024 13:45:24 -0700
To: buildroot@buildroot.org
Date: Thu,  3 Oct 2024 22:45:12 +0200
Message-ID: <20241003204515.403551-2-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003204515.403551-1-niklas.cassel@wdc.com>
References: <20241003204515.403551-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1727988324; x=1759524324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HL2j7jmalPz4KKg3Fh43OQMNfIoGvQFt9k31MkooFjE=;
 b=FifuNZFgvmwpKK9/9Q6jpwwBq2kThyIb4WwRy8iZQm3OBKkAvoilC+iP
 Y7JG09Z3SQdKzZl58VxT07xKgUobvH404drlPrbQ1CE3meNMtmgfiFG23
 9i3U9pFtZMNkkc9CnWXecqf0sQFiaTM6SVW2OU5UNP92cisDewd/Mqnj2
 Cw+86RsnupDN6ZmW5r6UzyFMCuKOLcTeshzwRdrY5rvLGTRS029gONY0k
 TcHUrOhJpWPWVf5h3J7yVA9SAA8AUI5jhK976ofbbtn8CXukgTSkfQP9M
 vJZfEtdWIaTI9vu9AkyVz8FHEVJoJ/kvIJQF32otxZOKw8ZnQC8ErCfOQ
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=FifuNZFg
Subject: [Buildroot] [PATCH v2 1/4] configs/rock5b: update to linux 6.10.10
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

A bunch of new hardware has been enabled for rock5b in linux 6.10,
most notably USB3 host controller support and GPU support.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 board/radxa/rock5b/patches/linux/linux.hash | 2 +-
 configs/rock5b_defconfig                    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/radxa/rock5b/patches/linux/linux.hash b/board/radxa/rock5b/patches/linux/linux.hash
index ba90c84f54..5296620e47 100644
--- a/board/radxa/rock5b/patches/linux/linux.hash
+++ b/board/radxa/rock5b/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f68d9f5ffc0a24f850699b86c8aea8b8687de7384158d5ed3bede37de098d60c  linux-6.7.4.tar.xz
+sha256  e687e735b5eb9efb6d67b42433c93fc9118106a995514f062652873b5e809bcd  linux-6.10.10.tar.xz
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 4d5e7ca583..c0c6877d81 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a76_a55=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
 BR2_GLOBAL_PATCH_DIR="board/radxa/rock5b/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="rock5b"
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock5b/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.7.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
