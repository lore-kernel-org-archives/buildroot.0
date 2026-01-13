Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA204D0C857
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 11:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB23E42A81;
	Tue, 13 Jan 2026 11:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCCeN3ddjs3m; Tue, 13 Jan 2026 11:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52C2642A62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768303773;
	bh=VXoeO/ITXXeoFYQtuSm3XXCpJI7iOJ6M4KiZoZipG6U=;
	h=To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RrZ1marFGVTJPRtYhuVqPW5nLE8AnqDer5l2Lm4VGdOkNdMHREN14izAWbcuXvkAI
	 9HNrxwwIbEFHwFKXAsEkp4vo6xraSmQDanVbRyWQaRgbjKJh/xiYWwH7WjT7mFBhMq
	 hwZt6ESU/6bNBP0JLyIdZyemnEBY+OOSGxXZbRZO4+KVDDgYVnHn/f69SdFtlUe9nQ
	 659lHw9qstgj+CfnOlszjiwrbepscPnfSSPOgjJ1I6Nq1Jn4Xyjyi48Buc/I0iaGKC
	 v+OtBhLfE6VC+wQxPoof1CNs94Fdi2FrloyEYgYBHLizZ1JwD9DzZIsBi3NbIob97C
	 31RGa8fUHCWrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52C2642A62;
	Tue, 13 Jan 2026 11:29:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 818791CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 11:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7288442229
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 11:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zpAY3_awfYQx for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 11:29:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=4667d680c=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 27FC742226
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27FC742226
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27FC742226
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 11:29:30 +0000 (UTC)
X-CSE-ConnectionGUID: cTQDs4XQQli5p3Zg0vahaw==
X-CSE-MsgGUID: 3iNvOyriR1et7GhiPoxNrQ==
X-IronPort-AV: E=Sophos;i="6.21,222,1763449200"; d="scan'208";a="219092415"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:22:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Tue, 13 Jan 2026 04:22:00 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Jan 2026 04:21:58 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, "Cyril
 Jean" <cyril.jean@microchip.com>, Jamie Gibbons <jamie.gibbons@microchip.com>
Date: Tue, 13 Jan 2026 11:26:20 +0000
Message-ID: <20260113112621.347651-5-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113112621.347651-1-jamie.gibbons@microchip.com>
References: <20260113112621.347651-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1768303771; x=1799839771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cI/XU4cJi3CJA3uMJw0bwFw0l1DyKg2CbGMHF8mjCiE=;
 b=N4QkW9CWAJA4lvwrZpvCMoR+QDUPkCbFUyZZXmjvUWPAfs+7VwwHvj6H
 CeG13D/jAVX8ixJ8Yv65K/SzosT64x0titA8/aagWVzQHB1w52t9X5wUI
 t8PAoCCVoZqKNFdowHtFc7iEbgOrci5fLHqL6s1M+uc9uhZHowDpL/wcB
 DehtUmo6puTqaNHBsuP65df02/hLNCKwggEbsABdGyP1eoCqs6sQqKQ+n
 imIzagFTQBiydpectUxSq0VIprcuRsusFE4T5a0Y//RwXFHLOl8Ahwer/
 uDhveYwdq+mGOYIDfX1yZ5CSk+AmglgyLnXXhU86hIaowgBwpi7rgw6q8
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=N4QkW9CW
Subject: [Buildroot] [PATCH 4/5] configs/beaglev_fire: Bump Linux
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

Bump Linux to latest release tag: linux4microchip+fpga-2025.10. This
includes the latest features and bug fixes. Included is a kernel bump to
v6.12.48.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 board/beagleboard/beaglev_fire/patches/linux/linux.hash | 2 +-
 configs/beaglev_fire_defconfig                          | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/beagleboard/beaglev_fire/patches/linux/linux.hash b/board/beagleboard/beaglev_fire/patches/linux/linux.hash
index 9ee63df23d..2902da56b6 100644
--- a/board/beagleboard/beaglev_fire/patches/linux/linux.hash
+++ b/board/beagleboard/beaglev_fire/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  7bd234a93bc6351d6a830f9ef18e9e780d70c478d280a6513a30bc2f945fb050  linux-linux4microchip+fpga-2024.09.1.tar.gz
+sha256  37191994758d521dc7223cb5010a67ef83bd061bf70194ea522abc9ef2b17391  linux-linux4microchip+fpga-2025.10.tar.gz
diff --git a/configs/beaglev_fire_defconfig b/configs/beaglev_fire_defconfig
index 4fc33969d0..a5cda23242 100644
--- a/configs/beaglev_fire_defconfig
+++ b/configs/beaglev_fire_defconfig
@@ -1,6 +1,6 @@
 BR2_riscv=y
 BR2_RISCV_ISA_RVC=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglev_fire/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -8,7 +8,7 @@ BR2_ROOTFS_OVERLAY="board/beagleboard/beaglev_fire/rootfs-overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beagleboard/beaglev_fire/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2024.09.1)/linux-linux4microchip+fpga-2024.09.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2025.10)/linux-linux4microchip+fpga-2025.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/mpfs-beaglev-fire"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
