Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD66D111BC
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 08:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41220605E1;
	Mon,  4 Nov 2024 08:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_mOS4ypYUHS; Mon,  4 Nov 2024 08:15:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F59A605E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F59A605E5;
	Mon,  4 Nov 2024 08:15:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A75A0962
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 08:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 949C3605E5
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 08:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_ueUW_zSXWl for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 08:15:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2408::624;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 96B10605E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96B10605E1
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::624])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96B10605E1
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 08:15:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wi0R5lSV/3DiEnb0opxNmzb62uqSSnuyuWdP+UdPfBB8RuaBGHgYlp4dJ0K0cWhYH36PGoRbEqaLU6j4DZARp6zyWgJUDy3cwBsvtyhjGqMPdVGgpZgNc0TNFy7GfKAtirl1eUYZbfkt1Fop7TIVcYSyEoayNWq4dST8ZDQu6S/Y0sRzTT1iMXehQohFqlzemQKlXegmgzlOWHYYd7AGBlkPxIzRQqcHS6CGsl3uM549d8x9cNQLHHU7IvcNhg3k8A6Ilry/rwivtLvX/oEgWSLSA3RV7JzZBoa3nfej2AYNKyfs/Au8qdeWkngBtoYbZGeYW4+Tsr7HhLGEAfw7yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMrPIBDUEGJL3USpass2T/NRJsCG2di+6PlHId218yg=;
 b=kQLi81Y1x6WuUdJq8CvbgCH+mhi3Jy46xuMToJ8cMowx/EH2OSt2pMivAz82XEWLXgSZUNZLn17oCopihMR7T9mwOxtLD5p+5NGg6GQbm+2+glxAJbc7fVdSPX+VrHTUnbru6m/NDzbozrAmp/HvDHGJbxRCNFP6GnckbIc6sKX1WPDJK9VLf7SPhMMmxc/H2Xgf1RGdYycQ+voRyynWi5oNNmD9iB46lPHK4jN3EduZlmmCpnOl+R99T0Az9CgaBhW2UpUGBSR5rZeVdKcowr/pf2C1qbX0tWPLguwvQBVKYMR6Lq4+ArCbKLXxD5gquO1Q8Hp62oaWsHbA4PBnrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL1P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::31)
 by DM4PR12MB5841.namprd12.prod.outlook.com (2603:10b6:8:64::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 08:15:04 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:208:2c7:cafe::2a) by BL1P222CA0026.outlook.office365.com
 (2603:10b6:208:2c7::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Mon, 4 Nov 2024 08:15:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Mon, 4 Nov 2024 08:15:03 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Nov
 2024 02:15:02 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 4 Nov 2024 02:15:01 -0600
To: <buildroot@buildroot.org>
Date: Mon, 4 Nov 2024 08:14:52 +0000
Message-ID: <20241104081453.430619-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|DM4PR12MB5841:EE_
X-MS-Office365-Filtering-Correlation-Id: 70625c6f-ca4a-47f9-6006-08dcfca8c8c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2VaSnPKgmDhZf2c3ep/b4qyfbdSxCA/0I4xWvvT1tY9yfkz1ltftAKZbJMIc?=
 =?us-ascii?Q?evIaid+/rcnugOrUCM3pR002eOTywJv3YyreK6xR4qdmgOTm5/1lNz9bc1SG?=
 =?us-ascii?Q?HNQkTyAwiskSDLrrxPEjb6Yaa3kNMjC9FjazO/dtPntSkTOMQCEUj51A7xxz?=
 =?us-ascii?Q?1isxOB79ymmxJG4KgDP1biXzFSTiGAxDXws0suxcKpjdMiYaqJz0UUu/2vUI?=
 =?us-ascii?Q?X0H3Yhm+8zuikpIlZbUAMTQEcH3Sohay9JPmrlECP6WJeuV0Zv148O+rjoot?=
 =?us-ascii?Q?ZS38qDl/JYSn7CVIpZkE1ZLQf4zal+A29OYCkmYmzSt/qOFyetjPgMgDWl4q?=
 =?us-ascii?Q?Nw95bwQX/MEngxx+0cYNdWblFrzNm5YfREZmAc53yyS3hxU/hc3izsJK8VPa?=
 =?us-ascii?Q?x5Os7Y0Hhe06f3qsnt1EJkOO1jP4mxh/OEv/AnQoHVl0JalxNuaG+6AxvXDe?=
 =?us-ascii?Q?6CbkJqsIpUMHXFzrmIMWNo3mgnHhIOqipOocW6/R+teG354TWYlefgBaB4LU?=
 =?us-ascii?Q?CIvdvOv5QmhWtxdHeSR4Qb1WHGj4glrICk6Q4rZxhOUPFqkIAeZ99WhuCrl6?=
 =?us-ascii?Q?ZhufLkgXvMS30NYW3DvAnhAvPMywfi9gYHswNBetR3ixDBLTFfxtvpO1hVhD?=
 =?us-ascii?Q?lOCk5ZZ8S1Q+zRDDJudwncCLPTxc3wiMuLvnEIJvYODEYpiQrraihnGZ39dP?=
 =?us-ascii?Q?mrQwInGvT7Cq2QupO2EOC4uCgiAKbeN8xSBnpQFv9LCLvBx6SF5m+t3ZKsI2?=
 =?us-ascii?Q?31l1LkKJxH8+kOPfco8e5tgTdzjwQuiAuBmoQXCv5L1n7uoSFN1+IB8VAcqj?=
 =?us-ascii?Q?ztxILEPmo4KwAy7bCmnwMyaH8AB228Pbjq2ad6D2UcmQMlONuHoDcGXQfit1?=
 =?us-ascii?Q?5pH8efaFFmIfEgzpp7goExJ+YK5Ti/vpBVG7+oYNbhwYBFFHf3t5g8di8xoz?=
 =?us-ascii?Q?Wqtl5rMkrXkflSN/C8skRwNhOgvxpyAyUXS0b5XM45x+NfCt9T1ECaIZ/mZv?=
 =?us-ascii?Q?28iiTKnD7WqvH9siD0KNyGZQpD4WBldScxuAvap+GMXd/JyfhJeRutFRFINZ?=
 =?us-ascii?Q?KdRBtWM04ENfeXX8EQKoHAL6AFoy0Xfk7P3uIsV/3Y9yWmOzBEVIko2B83PR?=
 =?us-ascii?Q?bIy9HPg7Ng3XMgStZCIo5OpiejqPQr3fLup6RTBbLMy2waekvl4NwAV8tKUO?=
 =?us-ascii?Q?x1q/cOuI7kOeivoB5S+lLL7ho5I5Af4eZPevEZFkcClB7UXjaL239v0NrvNF?=
 =?us-ascii?Q?I+uu+k2md9E9ch0XegONcKSGLQ6nhvCQVl+slY483SCZqMBzk2hpmVkaZfcx?=
 =?us-ascii?Q?TZstNcEWfulqSPOXvFN007wsSHLiHJ4V0BGgS8Daz93vNbscKh4oGRcfbZV8?=
 =?us-ascii?Q?/rlC1kkYFOTncfHugFMifOsUj9kT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 08:15:03.2095 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70625c6f-ca4a-47f9-6006-08dcfca8c8c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5841
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMrPIBDUEGJL3USpass2T/NRJsCG2di+6PlHId218yg=;
 b=BQh7YV+l3tXpIOqy5ybnC43W+utck2M+f1x5ISzdxbs7+6fmqtlYqglIpEaI/EG6x6m+IqJJ8xRzluaX3Az5QkPSRB5dCoKwEQ3HsItWAKszSDUNRu58O6fL6lQlrOrGGMwuCCG8/aDRVbTx3u0V003jorn9Ms8h/06ip5aX7s0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BQh7YV+l
Subject: [Buildroot] [PATCH v1 1/2] configs/versal: re-adding
 xilinx-prebuilt version
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The regenerate all defconfigs commit removed the xilinx-prebuilt version from
the versal defconfigs.  If the version is not defined in the defconfig, then
it is not possible to change the xilinx-prebuilt default version number
independently of the board configs.  For this reason, this patch re-adds
the xilinx-prebuilt version to the versal defconfigs.

Also, the vck190 board name has been added to the versal_vck190_defconfig in
case the default versal board name ever changes.

https://github.com/buildroot/buildroot/commit/edc0a6b1a43689fb832bc024b5997312e0770e99

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal_vck190_defconfig | 2 ++
 configs/versal_vpk180_defconfig | 1 +
 2 files changed, 3 insertions(+)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 697b6c5169..448195d6ac 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -35,7 +35,9 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
+BR2_TARGET_XILINX_PREBUILT_BOARD="vck190"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 9fc694a898..a4a6ed98ff 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -35,6 +35,7 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk180-revA"
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vpk180"
 BR2_PACKAGE_HOST_BOOTGEN=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
