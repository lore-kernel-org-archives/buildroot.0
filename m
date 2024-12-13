Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59752E7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 08:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A89F841B9;
	Fri, 13 Dec 2024 08:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FU_j-i1F7zXd; Fri, 13 Dec 2024 08:34:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ED9E841B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ED9E841B5;
	Fri, 13 Dec 2024 08:34:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 32FC375
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 08:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2184C841B0
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 08:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4dHEXkwBM5cp for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 08:34:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=07052b375=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B505F841A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B505F841A6
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B505F841A6
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 08:34:47 +0000 (UTC)
X-CSE-ConnectionGUID: 8uLPwSvsS7yl1n7ZUaGPgg==
X-CSE-MsgGUID: Ub3Dhsk0TtubZ/753+ABcQ==
X-IronPort-AV: E=Sophos;i="6.12,230,1728921600"; d="scan'208";a="33082309"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2024 16:34:47 +0800
IronPort-SDR: 675be2f8_haRkj+q/B8h3aW4MaAkFN0P5I6Bklsd7mi9qpdRjXNUutF9
 Rct5KxF5gk9fTukB4Ssmn9a894ZJQeHtq6NLmYQ==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Dec 2024 23:32:08 -0800
WDCIronportException: Internal
Received: from ftxvgv4yxy.ad.shared (HELO ryzen.lan) ([10.224.3.234])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2024 00:34:46 -0800
To: buildroot@buildroot.org
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Walle <michael@walle.cc>, Niklas Cassel <cassel@kernel.org>
Date: Fri, 13 Dec 2024 09:34:30 +0100
Message-ID: <20241213083430.4121422-2-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241213083430.4121422-1-niklas.cassel@wdc.com>
References: <20241213083430.4121422-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1734078887; x=1765614887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zi8l5gJdsHnrAkV7Tx81Np5tqD1h/FeKrBZs0Luno9I=;
 b=qwf/CQFQZfiW3kc+v6/Udo/6ortYl7CILxhlGIop5JXTgQXiO0+Eou4o
 gLCoRPQYMsrRAilPJBX52FZhB7yOynVVZAjJv7SFU0dfmSpmH0C0rx0E/
 ZCw2M9lzO3I481dMxdSzGUNkJ1jyLfWgTNEXJ6c4BoKtBl5bW8As10sdk
 pn96itec5zZvQx88ZKVVKDA81Ny9kGBxwJ6fvpXJSlWM9Rtpr7OcE2nEO
 zLi5bzHu37uwTMKfUimcK+5Z3piVs+DZb+cUIvxcxr8Q5Kkf8RVASt4jH
 Xd3SIuJ5U/+Sj9vDnlXHjg8KWP/CniP1qnvAZN1qpF1oGsnaadF/COlCm
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=qwf/CQFQ
Subject: [Buildroot] [PATCH v3 2/2] configs/rock5b: build and install rock5b
 device tree overlays
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

Build and install all in-tree rock5b device tree overlays.

The device tree overlays will be available in /boot, such that it is
possible for u-boot to apply one (or many) of them before booting Linux.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
Changes since v2:
-New patch.

 configs/rock5b_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 38b5aad206..ea0ca26d97 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -17,6 +17,7 @@ BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3588-rock-5b"
+BR2_LINUX_KERNEL_INTREE_DTSO_NAMES="rockchip/rk3588-rock-5b-pcie-srns rockchip/rk3588-rock-5b-pcie-ep"
 BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
