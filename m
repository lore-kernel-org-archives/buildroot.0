Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B6AD1CDD3
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 10:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40F8080ECE;
	Tue, 22 Oct 2024 10:29:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GV8B6pHSrq0; Tue, 22 Oct 2024 10:29:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FB4280EA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FB4280EA1;
	Tue, 22 Oct 2024 10:29:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7703F71F
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 10:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 660BD400DD
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 10:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPEVotmkmN6Z for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 10:29:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=018f217b1=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5195440135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5195440135
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5195440135
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 10:29:28 +0000 (UTC)
X-CSE-ConnectionGUID: c+qRROuNRZ2d3z6tLWfXNg==
X-CSE-MsgGUID: d3NwLSu8Riq1dlxuuF3hcg==
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="200750578"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Oct 2024 03:22:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 22 Oct 2024 03:21:56 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 22 Oct 2024 03:21:55 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Conor Dooley
 <Conor.Dooley@microchip.com>, Valentina Fernandez Alanis
 <Valentina.FernandezAlanis@microchip.com>, Jamie Gibbons
 <jamie.gibbons@microchip.com>
Date: Tue, 22 Oct 2024 11:24:25 +0100
Message-ID: <20241022102426.220196-3-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022102426.220196-1-jamie.gibbons@microchip.com>
References: <20241022102426.220196-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1729592968; x=1761128968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r7aY754XqubbSv2fRS+9dmZ0uEqSEk1hrq9+hjmBAWs=;
 b=iD71/bCUQnTI13RN3LCflrjDE7In490kfdiZyVU79hOIeVDBKEzzrlZF
 jAWzoKagakyei0aRSvljFk8dqd5CDOj7jimejqvug2ErMhNOHgwu3v+FR
 g+VEfrUaRXzcBpKE0wDFJCaMDeuDjFXvZ/xqlMJjlsVGpM9IPCS7y1VYm
 tTRa4s9/aNq3l4VDxfaiYNl9Z8RE3xSo0nLUJ/BOPsjpXEttRu8FW7NFK
 +XqkJC0DwB0CRXGT4gRy3j2flArv2eA8og5BP2CDs1cP1HZvSsh/hvmoP
 1rOcW09BPgYqjjZM953D8y5DN9xSh/5NZbT++86b8CMtipvdnbWCJjXUx
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=iD71/bCU
Subject: [Buildroot] [PATCH 2/3] configs/beaglev_fire: add support for
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
The updated update-gateware script uses `stat` on the target to get the
size of firmware files, enable coreutils and it's dependency to make use
of this package on the target  when this script is used.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 configs/beaglev_fire_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/beaglev_fire_defconfig b/configs/beaglev_fire_defconfig
index 5e1faf41b9..5d7115b914 100644
--- a/configs/beaglev_fire_defconfig
+++ b/configs/beaglev_fire_defconfig
@@ -12,7 +12,10 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,li
 BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/mpfs-beaglev-fire"
+BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 BR2_PACKAGE_MTD=y
+BR2_PACKAGE_COREUTILS=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
