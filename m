Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36616C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 16:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7858400E0;
	Thu,  2 May 2024 16:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xtbS8vc5nMMX; Thu,  2 May 2024 16:27:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B6274012D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B6274012D;
	Thu,  2 May 2024 16:27:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F9981BF296
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6921482F11
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcRBstYsAYfY for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:27:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ABC4C82F03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABC4C82F03
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABC4C82F03
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:27:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442GRDiO005191;
 Thu, 2 May 2024 11:27:13 -0500
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442GRD25131045
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 2 May 2024 11:27:13 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 11:27:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 11:27:13 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442GRD7W109057;
 Thu, 2 May 2024 11:27:13 -0500
Date: Thu, 2 May 2024 11:26:57 -0500
MIME-Version: 1.0
Message-ID: <20240430-optee-update-v2-7-5bdc2f940db1@ti.com>
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
In-Reply-To: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
To: Etienne Carriere <etienne.carriere@foss.st.com>, Anand Gadiyar
 <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, Romain Naour
 <romain.naour@smile.fr>, <buildroot@buildroot.org>, Bryan Brattlof
 <bb@ti.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1049; i=bb@ti.com;
 h=from:subject:message-id; bh=904mwlMK7tVzDvETrwIitLOR8Txo0LNxwQGSNdOk+nY=;
 b=owNCWmg5MUFZJlNZ4erASQAAav///v//GvP2nH2///r7/23XK3765O71/Nft+t59j5p7vX+wA
 RmYx2oaAaaAAAAGgBoaDQMgANGgAGjQAGQDRoAaaAAB6mgaPRPUeiNpM02pCBoyGmQ0G1NGmTTE
 AGjTT1MgaGhppoGgAABkHqMjJtQDQAANGhoekPUBpo0HqAAZIepppo0yZANNAyaaNGRoBpmoaGm
 gGIGgAGg0DQ00DQ0GTRppkZAZBkMmgaNAAAg9QmCrH58SDA4wUwB9caUrSZKrEq7NJnC3+GGgCt
 LR6QxcynOz0g2mXgmpolOa0C7AzGYgWxnUusH0iVAiwCUEOSTC4sWEXtSwe5ZdcAOXNPYvIiwCy
 V15MNfttHerbYilzvBD1JHC0MPvW5MBgAJcDrNUnPg+IWblCCb8mL6fpg833RW2TrfyEp5ahkEP
 u2Rm8tAKGSBXsMFq2IA8PqF5trsa696M1G5AqowQZB4GWuF0FCp27b3IPFZJGiVLi6YhiSxeQbG
 OHwqlh9XLGV55b0CnE02azVPcsSNQgAoCs79JgHttaGnLO6ncFEV/UmyH60onaUGueMyVpUfrXX
 BdAPVlsHRWITrmKNfxhoJevOjmFycICRachSh9RYwgVGDimgEEs0Dg0iAKMERgNOyAQMSlyyVAG
 YXuPEfxsAfJVA7/F3JFOFCQ4erASQ==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1714667233;
 bh=JBAytwYOm3KAIWEIA6fAu4IKQ2cpKxl7rcSj75neODY=;
 h=From:Date:Subject:References:In-Reply-To:To;
 b=USnFxc0i4rzrqqkwTvDmobhP5fMxXv+P82Nln31B1UBljWzZ7V3yZgNyTq61ClmO7
 9qUG45JrUJG73UlsLugDWEpLETqlJdHu2NM/pWlvVy+0ZPUW6AXrhGnSlNX/ABfrcB
 HIx46EwbvUnd2ymjlCgNTVY0cf3ALxZPJVilGcPo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=USnFxc0i
Subject: [Buildroot] [PATCH RESEND v2 07/11] configs/ti_am62x_sk_defconfig:
 update U-Boot to v2024.04
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to the latest release from U-Boot

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 configs/ti_am62x_sk_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index e169b6834d89c..fbceca791161e 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -27,12 +27,12 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
