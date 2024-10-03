Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40495CF34AE
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 14:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59E2A81D72;
	Thu,  3 Oct 2024 14:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnkMbcJHCsnK; Thu,  3 Oct 2024 14:01:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0F7B81EE3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0F7B81EE3;
	Thu,  3 Oct 2024 14:01:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 354141BF311
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 14:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31C2981DF2
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 14:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4ZN8Q2LjKgV for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 14:01:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=9995b4c5d=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7CE9981D72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CE9981D72
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CE9981D72
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 14:01:01 +0000 (UTC)
X-CSE-ConnectionGUID: NiscRaAjQZiGXxxVmBGdTg==
X-CSE-MsgGUID: O1lg8ZYiTACyyCFfYvy6LA==
X-IronPort-AV: E=Sophos;i="6.11,174,1725292800"; d="scan'208";a="29066248"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Oct 2024 22:01:01 +0800
IronPort-SDR: 66fe955c_a6e+DKA7/JtsfrklUVzuadby7Gl+q2porrXYRdV/PyVcevp
 g6E0vsNOyB4E62c0gG5A7xuOD30We1RutDGlooA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2024 06:00:12 -0700
WDCIronportException: Internal
Received: from unknown (HELO ryzen.lan) ([10.224.3.161])
 by uls-op-cesaip02.wdc.com with ESMTP; 03 Oct 2024 07:01:00 -0700
To: buildroot@buildroot.org
Date: Thu,  3 Oct 2024 16:00:51 +0200
Message-ID: <20241003140054.250140-2-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003140054.250140-1-niklas.cassel@wdc.com>
References: <20241003140054.250140-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1727964061; x=1759500061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HL2j7jmalPz4KKg3Fh43OQMNfIoGvQFt9k31MkooFjE=;
 b=oncRPNZiuFrEclygg5phT6aLp4wbjcie+KV5n+wQpR5Zqthq3EjoT828
 n/iBu3EmhrV4c35ltFx6QntEm7QYGJmW6/thb2G9PPT4RdM5UjqrtBFkZ
 1S0DQBy65OhwGjAkJ10PAIWe7JoEq3DyP8dtBGe/KAeRCXhJCf4US7pD2
 h7Jh2jlGrkeu5L0H6tgLFRDrUuJ2HAdjYcaJ2mutpT48vb/fDZ/BHQd/o
 yfNBc54Ezq7O5gO4eCLcI0bB5k7s4E2ekHaoS1HVeKQeETNbBjVl1BQNF
 PWMMkTJLytMl36eEKRjE44VGB4jnkVdx68BFjV1w7cIUa6WJR9HmkQ2im
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=oncRPNZi
Subject: [Buildroot] [PATCH 1/4] configs/rock5b: update to linux 6.10.10
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
