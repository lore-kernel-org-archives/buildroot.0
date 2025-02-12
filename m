Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5472C021A1
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 09:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 568706101E;
	Wed, 12 Feb 2025 09:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3rp3J4giJDJ1; Wed, 12 Feb 2025 09:25:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 540106101F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 540106101F;
	Wed, 12 Feb 2025 09:25:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50108194
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 09:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DE3A410D8
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 09:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fDvaEG8EZ6E for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 09:25:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=131dbbb23=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5895441214
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5895441214
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5895441214
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 09:25:26 +0000 (UTC)
X-CSE-ConnectionGUID: 8On2WiCATZeye62J/tHISQ==
X-CSE-MsgGUID: 44k4+MPLQMCRsZEnMKpoVA==
X-IronPort-AV: E=Sophos;i="6.13,279,1732604400"; d="scan'208";a="268932246"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Feb 2025 02:18:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 12 Feb 2025 02:18:16 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 12 Feb 2025 02:18:15 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, "Jamie
 Gibbons" <jamie.gibbons@microchip.com>, Conor Dooley
 <conor.dooley@microchip.com>
Date: Wed, 12 Feb 2025 09:21:19 +0000
Message-ID: <20250212092121.11699-2-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212092121.11699-1-jamie.gibbons@microchip.com>
References: <20250212092121.11699-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1739352327; x=1770888327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kTBEWi7D0Yc18Qh2ZIcb9JFZyKZwKqL7V0223GGXVWE=;
 b=A084VrPNyN9pbtaPQVqCcWKNsxr1/a2mG7p7fwLWPr2FTKcoawqNWYAn
 6Y0oIZKGSJp709mG5TH9q16kOptglkEm451CFHgBAjpZAQurh89XY8uhV
 vBbU5JPDdmpJ3/9g4R3JR1leWtCnVnPptdTnfqllweeqW697HBrKO34eT
 qy1C9ofXBo+Q2y3Oolkhkiyqz2npOiz4H8twEQMCJf7tZihWXE20hP3o8
 Cdl3NMq08wF6mPqc/zG8302O5IaOkDWCBHpd3LF/m5V5lcDQi0TLO1TKI
 Gt843yWJOhhJ1O5pLgjVmQks5CIQqsx80Idl+SowffZ1fyAiEXgGP4s6F
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=A084VrPN
Subject: [Buildroot] [PATCH v3 1/3] configs/beaglev_fire: add support for
 overlays and update script
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
From: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Reply-To: Jamie Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When applying overlays at boot time all dtbs need to be compiled with
the `-@` flag. Set the appropriate config to do this.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
Changelog:
- V1 updated update-gateware script used `stat` on the target to get the
 size of firmware files. Therefore, v1 enabled coreutils and it's dependency
 to make use of this package on the target when this script was used.
- V2 updated update-gateware script no longer used `stat` and
 therefore, coreutils was no longer necessary.

 configs/beaglev_fire_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglev_fire_defconfig b/configs/beaglev_fire_defconfig
index 1d26a78f07..bfaa8208e9 100644
--- a/configs/beaglev_fire_defconfig
+++ b/configs/beaglev_fire_defconfig
@@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,li
 BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/mpfs-beaglev-fire"
+BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
 BR2_PACKAGE_MTD=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
