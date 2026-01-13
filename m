Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67380D0C857
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 11:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4D2A6F5B7;
	Tue, 13 Jan 2026 11:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jg54bbr1XAXh; Tue, 13 Jan 2026 11:29:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24F016F599
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768303765;
	bh=r4fA6WQoxAbc7ktXQfdusWC8tZ9krSSquQdVyCt0Wzg=;
	h=To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RVqefPtJeEJMCihujslet2eb8phlyhzktyhppAKZ1PQnzu6LhDAOY/7abwpdlO852
	 LaqiTKdXFxZ9BBuKPThd5xDoOQyXZGoA0IymQlIrbfzczt4iVqNINAhixIYTBEhUMo
	 Q7C4y/E8pJvAKW8ksbaIzHp4A+65Cwbog0qpdJDfciisHJzRLPtkLJByL95FnnSyEZ
	 RFH+R9FJwk/QzJ6mg+0i9fzCnzLk4+421E1dsQqVluFXw5DX0lgAARPRcdPVloJ0Fh
	 k4DuN6oZ5eXUBtLfVNY7VPqhABb3IyRTWnPJEORt08Oh8dy0DGudhEXr5Dbs/lODJ+
	 aVy/lAypK70aQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24F016F599;
	Tue, 13 Jan 2026 11:29:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10665231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 11:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B93E42A62
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 11:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khY10qxwvZXR for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 11:29:21 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 13 Jan 2026 11:29:20 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0F6942A63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0F6942A63
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=4667d680c=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0F6942A63
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 11:29:20 +0000 (UTC)
X-CSE-ConnectionGUID: 0yeimWqJTFqgigneZrHUpQ==
X-CSE-MsgGUID: ZLolE30tRjuTSCOrUVhS/A==
X-IronPort-AV: E=Sophos;i="6.21,222,1763449200"; d="scan'208";a="52237242"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jan 2026 04:22:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 13 Jan 2026 04:21:50 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Jan 2026 04:21:48 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, "Cyril
 Jean" <cyril.jean@microchip.com>, Jamie Gibbons <jamie.gibbons@microchip.com>
Date: Tue, 13 Jan 2026 11:26:18 +0000
Message-ID: <20260113112621.347651-3-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113112621.347651-1-jamie.gibbons@microchip.com>
References: <20260113112621.347651-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1768303761; x=1799839761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qqiurm36Tvq3cLAJNQb3gE0cu2SdlkOjT2cuVzA2sAY=;
 b=T6PVBaGVWBNToX6sm8Gk7vuYrIgtBN9N82ABYN2IsA93VhU9X4pT8RDD
 ZTqfZL4ZeussUrIODpReWXSGvZ+d8QbgjWzQGoAMpZXilaVDZYZu4rRia
 DzRP8vEoPk3Jqk/CEgji9lfp5bXyK1zY7q+q9UqX8PojUZx9KGXAbWFQt
 6mpJ8c0vQWgyWh6UUBqQGiR6SwW/zWreIGnisT2MRRDCoBzoWNE5egoDW
 DwciA8qgWFasAitDZaBTN8XYcoDFieboiKZ8+7DWN2NKolqK3qcc9dqYJ
 GarkVlP/ZrKwvNAKu9GT9MQlJrD4S/Z67wFFGtVNFP51Im7Ed/Vg4MP9q
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=T6PVBaGV
Subject: [Buildroot] [PATCH 2/5] configs/microchip_mpfs_icicle: Bump Linux
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

Bump Linux to latest release tag linux4microchip+fpga-2025.10. This
includes the latest features and bug fixes. Included is a kernel version
buump to v6.12.48 and a GPIO driver fix.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 board/microchip/mpfs_icicle/patches/linux/linux.hash | 2 +-
 configs/microchip_mpfs_icicle_defconfig              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/microchip/mpfs_icicle/patches/linux/linux.hash b/board/microchip/mpfs_icicle/patches/linux/linux.hash
index d0e2d5693c..2902da56b6 100644
--- a/board/microchip/mpfs_icicle/patches/linux/linux.hash
+++ b/board/microchip/mpfs_icicle/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  7789cc2844cb9633aa8c146e194c9ad3482bf06ace707d66d0ca6039ed16833d  linux-linux4microchip+fpga-2025.07.tar.gz
+sha256  37191994758d521dc7223cb5010a67ef83bd061bf70194ea522abc9ef2b17391  linux-linux4microchip+fpga-2025.10.tar.gz
diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
index b5a7562b7e..1d8937c3d1 100644
--- a/configs/microchip_mpfs_icicle_defconfig
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -7,7 +7,7 @@ BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/microchip/mpfs_icicle/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2025.07)/linux-linux4microchip+fpga-2025.07.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2025.10)/linux-linux4microchip+fpga-2025.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
