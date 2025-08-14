Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915F2CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 12:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6122B60AA8;
	Thu, 14 Aug 2025 12:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNLUIMirutFO; Thu, 14 Aug 2025 12:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9435560AAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9435560AAE;
	Thu, 14 Aug 2025 12:20:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83F6B271
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 12:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 471D883E65
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 12:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rv_lr3zJ1KAI for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 12:19:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=314aab60a=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9933A840DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9933A840DD
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9933A840DD
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 12:19:58 +0000 (UTC)
X-CSE-ConnectionGUID: TQIC9rrWQ0uPj2LhEUDt9g==
X-CSE-MsgGUID: RcrFsN5iQ+e1vVhiS3GeIw==
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="45784402"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2025 05:12:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 14 Aug 2025 05:12:38 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 14 Aug 2025 05:12:37 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, "Jamie
 Gibbons" <jamie.gibbons@microchip.com>
Date: Thu, 14 Aug 2025 13:16:37 +0100
Message-ID: <20250814121637.3775660-4-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814121637.3775660-1-jamie.gibbons@microchip.com>
References: <20250814121637.3775660-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1755173998; x=1786709998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6L0w7wh7jHGFcxAgDotyf2+79DstbSJvB+yiZCppDWA=;
 b=H9LgYZHJAyf3d2Adwp/UNBenfgnWPocCLnb7BjDZiiYzN+YF8Q4rF/D7
 1pQvFMqPPqUJskviW3m7JILUkbXZ6jtLVzUGExKgw7djnKaZYg2ryKrIQ
 TgLu6+R87Y8Oqz7HAxqZm0ylplPy3Ib+vhqGKJuDahdIJT5vX8PKihY6f
 vRqASld18TGdQMAikZmlLYbh5w2Td6c26UdmFAs8PKYRUso0887P0qVot
 3I7YauGJ6yvCpdVCPvk55iZV9Jm6jGjbcOLfC+mrua1HjoWxEJQWEBNEI
 TjQ3XIDOH9aG4voBPKsCwVDsXgi1z4rA1/RzwwQRlzdCIAhF1dRXNXYwc
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=H9LgYZHJ
Subject: [Buildroot] [PATCH 3/3] configs/microchip_mpfs_icicle: add support
 for production silicon Icicle kit
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

Include the compilation of the production silicon Icicle kit device
tree to support this device.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 configs/microchip_mpfs_icicle_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
index 4d465016c7..52b865ef77 100644
--- a/configs/microchip_mpfs_icicle_defconfig
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -11,7 +11,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,li
 BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/mpfs-icicle-kit"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/mpfs-icicle-kit microchip/mpfs-icicle-kit-prod"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
