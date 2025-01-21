Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2190BC02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 09:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D862F849BD;
	Tue, 21 Jan 2025 09:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CBi_GrAXSQkE; Tue, 21 Jan 2025 09:09:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07006849C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07006849C1;
	Tue, 21 Jan 2025 09:09:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 438CA959
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 09:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3726409F3
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 09:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7rljrI_3Bph for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 09:09:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=1098f6abb=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B93DC40A91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B93DC40A91
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B93DC40A91
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 09:09:48 +0000 (UTC)
X-CSE-ConnectionGUID: EKfiuyhISJSGu431ctdL0A==
X-CSE-MsgGUID: ZnsAjQrWTkuM8p5h8Txygw==
X-IronPort-AV: E=Sophos;i="6.13,221,1732604400"; d="scan'208";a="204253193"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jan 2025 02:02:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 21 Jan 2025 02:02:11 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 21 Jan 2025 02:02:09 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, "Jamie
 Gibbons" <jamie.gibbons@microchip.com>, Conor Dooley
 <conor.dooley@microchip.com>
Date: Tue, 21 Jan 2025 09:05:12 +0000
Message-ID: <20250121090513.3375533-3-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121090513.3375533-1-jamie.gibbons@microchip.com>
References: <20250121090513.3375533-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1737450588; x=1768986588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aMPuhFl2ZMHMVnZCqi9/Ep+sKcQZ1/AjCvEorKmXKJc=;
 b=pIjixhsHsoBtEbn+o6Pb6pHyE35rzNcLM5Yr8Y3vY4u6Q+cYBGo2QZtb
 1O1BWgnirRNk0pp+q1exWgWywvF1d/oujTd4bKYM2NeoXzq945/5tVaL1
 +PIo44WQ+utZowNbbBwOGLDC7PsYBqTnneN7HdZGz4vsB6SxUK62dflgn
 5yl12mznii6ZjxNNKQNEuw1cRq2f9bD9NCsg3Ohl9Avz8nAb2Q9OtjLgY
 uVc2HGh4uPLZiFwifDkm+qNbZ0j31Sp4zDLS2DudriuZ7g4KCHHKHACsV
 x+rvfaeMcgr8Ta7eejbwn/xRszN6oL3Qf0ZqYuL0HN6Hxl+nlsBgsbblc
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=pIjixhsH
Subject: [Buildroot] [PATCH v2 2/3] configs/beaglev_fire: add support for
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
The updated update-gateware script no longer uses `stat` and
therefore, coreutils is no longer necessary.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
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
