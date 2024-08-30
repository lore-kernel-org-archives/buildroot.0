Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2A7CA0EC5
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 10:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97DD561242;
	Fri, 30 Aug 2024 10:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qr9UPnGJgwb2; Fri, 30 Aug 2024 10:21:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 752EE6134F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 752EE6134F;
	Fri, 30 Aug 2024 10:21:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 19D4F1BF3B0
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 10:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06521423DD
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 10:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2eazYtKAa5RC for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 10:20:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=965de3954=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 347DD423E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 347DD423E0
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 347DD423E0
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 10:20:51 +0000 (UTC)
X-CSE-ConnectionGUID: EmMhP/AbTW2Q2oSczEBl7Q==
X-CSE-MsgGUID: wMtN9NnTQficKdq9PE7ygQ==
X-IronPort-AV: E=Sophos;i="6.10,188,1719849600"; d="scan'208";a="25938674"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2024 18:13:46 +0800
IronPort-SDR: 66d18e97_1Gj97qDc8wpwKRKCw1h9jlMwMC31xgJNgq3SUosNj/47rjl
 3xSuHXZlcZgMy4DgGgexXLrMRZ9i0vV0IVaMHdw==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Aug 2024 02:19:20 -0700
WDCIronportException: Internal
Received: from unknown (HELO ryzen.wdc.com) ([10.224.3.215])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 Aug 2024 03:13:45 -0700
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 12:13:27 +0200
Message-ID: <20240830101327.2000179-5-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830101327.2000179-1-niklas.cassel@wdc.com>
References: <20240830101327.2000179-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725013251; x=1756549251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3Ru2VQ/iQtb7HMqESpB3y10NKVbon8KZaOeg4r0rA4Y=;
 b=JjHVQefySGbIldsV67aW0uyTtzEqcs977mOqRkaPYxYYsKlwpkaFSMyU
 M/w6K1EdjIGZqIkBi/aso4SIrw44h/CCQJRA7w5SIhAUJ60cQGwzI8VPc
 RR5YicI0MBomSorgaw7Dyrqf9tQi2iL8sa1hjbSNvx8S6G3+pwlbKiVVB
 GOV0rf5J7wFUI9b8E9ihzn82XBjXYUPOZrNB60z7ofIYPAd6L2J//vCE1
 yB6xPeMu1xUnxa1o1xM7l6mH28fS0h7merhKw8abc0pAxkQbRTUEKX5r1
 UUo9qWFsnTiZLDBX32/msUpnlbvUYmmrtuvUlFGfJRRIEuDNrJa04Qe1P
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=JjHVQefy
Subject: [Buildroot] [PATCH 4/4] configs/rock5b: add firmware for the
 RTL8125 NIC
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
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Niklas Cassel <cassel@kernel.org>

Add the proper firmware to avoid the following warning + error during
boot:
r8169 0004:41:00.0: Direct firmware load for rtl_nic/rtl8125b-2.fw failed with error -2
r8169 0004:41:00.0: Unable to load firmware rtl_nic/rtl8125b-2.fw (-2)

Note that the NIC appears functional even without the proper firmware.
However, add the firmware anyway, since the error messages are distracting
and clutters dmesg.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 configs/rock5b_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 0778e8afdf..899537c001 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -22,6 +22,8 @@ BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
 BR2_PACKAGE_ROCKCHIP_RKBIN=y
 BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin"
 BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME="bin/rk35/rk3588_bl31_v1.40.elf"
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
