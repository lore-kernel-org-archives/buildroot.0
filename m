Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810C1C61CE7
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 05:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD37040B6C;
	Thu,  5 Jun 2025 05:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1W-q3R5zx2t7; Thu,  5 Jun 2025 05:48:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9A9040B23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9A9040B23;
	Thu,  5 Jun 2025 05:48:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89BA2DA
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 05:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BC9B400A5
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 05:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wn6n126hZUP0 for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 05:48:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::604;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75B3840058
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75B3840058
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::604])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75B3840058
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 05:48:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmurYHTzSwIGv8Lwm+F8F7rfrRjW/dD0TB3id28pRKHbYHMT2pt/E3h+P8MiivFjz6ddVB7GKh9f9E+HMUV0ZoK8iSdcg1i86evOT7cYELmcrrJtnW1E9clHAUrao2oac/cmTHRFzgpUzR2vbe2O7RbUbvznowSM8ewsb2o8feGdo7+JfQ06isok/RGVii2XDkMaOIZcJN55ZcJPe2CfOIefeAegOk+9/Jho7pJ5gz34h9uCdv4G+o/LVGKnWooRKwONZKgbyUDiBXcIBcQshQFmGcsNMtBIN1LjrFpyQpfT3zHthD7CxsAuwnPXamCyKnppM42xju11gDIMvKGITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZcTiinnzl3Sut1Yu58Any9Hd2LbDqc03Mh/bpKQRag=;
 b=Gq6Uy+XtuPEG9XDGNspSdXbO/6Ctjy4g5sva4QcLd99VrEElXRoGvLk/2bnTCFg1etAn64Df2WTrG6eLmQe5V/9LWs4o4hfTgp7AnB4avKkBdGiCmZ77tfxpIq3eGQ7H0m1Xd/l4p9MuT/gERVukr/Nupgg4G8/aq8Zytxpwd5Dwczfh8cKPkEeY9eg2C9r+OD1E1j8JlEssuBK3bp7cjupJdW7lbuN5OTGCWCayOAqpuZMAS+pjgLeMHvhhMRSZyMsj1DAwycWrC04cWM5YKHpHAcYMDw6DIbY+/6xlZ17LgS0GUrcL5Ju9XVskzdjCofB2mGUc7PJYheulJenzhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR08CA0030.namprd08.prod.outlook.com (2603:10b6:610:5a::40)
 by PH0PR12MB7012.namprd12.prod.outlook.com (2603:10b6:510:21c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Thu, 5 Jun
 2025 05:48:42 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::6a) by CH2PR08CA0030.outlook.office365.com
 (2603:10b6:610:5a::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Thu,
 5 Jun 2025 05:48:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 05:48:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 00:48:40 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 5 Jun 2025 00:48:38 -0500
To: <buildroot@buildroot.org>
Date: Thu, 5 Jun 2025 06:48:28 +0100
Message-ID: <20250605054828.4181912-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250605054828.4181912-1-neal.frager@amd.com>
References: <20250605054828.4181912-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|PH0PR12MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: e258d640-1b10-4b08-efef-08dda3f4a0e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o/ByiGuIw3TMV1xhPkY2wXwJUX5tb2UwEgSyL8xLVXwPBWGU6adHyw8ye5mC?=
 =?us-ascii?Q?E5b5woPevh4qNXAM62q2gR67yOGNcyErS2oCcvVLRYDzgoYjZrQy7sVYpPnK?=
 =?us-ascii?Q?t9tgDfryjGf6gkYy1xPSOaUBK93Gg5twHItkUZCc6kDOduq+JnXoXoadwzuV?=
 =?us-ascii?Q?eeoSsmJqYMKCWoHfYikt9wziSapJcK6bb23hIFAN1nn4F4cRsdjrB8JVUkr8?=
 =?us-ascii?Q?gOEuIFZfdJTeVdn4Gczaq0EwmoFWDyW7XvpguSWopvTDd5hR81x92AP6s6S/?=
 =?us-ascii?Q?v5in24ykeC7mWjIiIvIPvRu1/AxcaKxGjmSfoqDyYJ7E4sVgkcnxiZ63BGT0?=
 =?us-ascii?Q?GKKG+6YxBR3mHKrIlhNroOoCQLRvB1VAnedP8mGnlXwtWNPxXK1foabXJ0Sb?=
 =?us-ascii?Q?qqmWu980HM/JoRroJtGaFt68gswwnXtxmiElCLTxsrFr8fIP+mPeJclbt4VO?=
 =?us-ascii?Q?fhqZo4+M4zMgLsH9xV974CrlO78dbAfeikET0TJYfqca1X++i+YlR7YK0Ot3?=
 =?us-ascii?Q?BMj4HPJMvMwkLigyThI6ZUDTjsCmVrty6UKeCK0qzpOGdGe3WHphXAxmh+U4?=
 =?us-ascii?Q?y64l55mv3YDBmXa/pndiUqHl02PwR+4U9CNCixbgz2UeksTXIL4rw6sRMajz?=
 =?us-ascii?Q?Qd8/NBa2E5chrqfgC/JpcqZ+BJMCLPJvKDqionMd37gBAYVv1DI1bne+ooAn?=
 =?us-ascii?Q?0qQOS/5oyC1lxUM/0tvNWoqxC/wdyHvvB7dZsy/B2+b3h3C56InAlrW+/iFq?=
 =?us-ascii?Q?G2sK/YpzLuH7D7xm47WpMrKkLjTuhRlWnadW890MF7chMrR1pZ4FlqtPT5f5?=
 =?us-ascii?Q?WixLeSCeAgFIj60WfASTUmPAQwtZEj/7eT1Yc1EnJhzF1Ut1qI9ONW1dJ5kt?=
 =?us-ascii?Q?GvC9+LT1J+CiVNNUvQ74bGVJrPIzNSOmHjEWZ90zFBm745PLQsOWvXThk54p?=
 =?us-ascii?Q?A8twrI7Fj2446YZaaVoGrf48x0cPHljd9BUJk6aOQONJGj9Yw1bHEl6fuyHe?=
 =?us-ascii?Q?i4+0YI/BWuwydRA9moxVtAheEKVvn26dPGwBOUNsTbfZ7L7V5tY0DHOw2ECk?=
 =?us-ascii?Q?taratPftL0e9nHLhxGqEj+bTjK13LJy5BnQlcwXjvG4aUB/4/qaDdY028h72?=
 =?us-ascii?Q?ORokt87hZNWtIz0Zhg7AVh3d8MpE+Kal2hd19vYRypd69vU1sn7IQhk+Ttm1?=
 =?us-ascii?Q?i5QUZ3qEs38kv0i69yALhuXHERH6xONrnSmnekONYwsCC2EHKisml9Ch2K2t?=
 =?us-ascii?Q?GN10+kS/2/5mJyulVSYKyhp835+SyLHTponk1JcLdNjS1hSdouXVztCWqy4m?=
 =?us-ascii?Q?Ityy37uDoxTd8Bov9GOMJwpFMewUKSRcREGEgbKe3rhjBHWQAuI5h63GPAdv?=
 =?us-ascii?Q?0jxSKnFOW31dLN21vM1hw4T6lJx/N+rLRsUe08BodmuI1YjBmvtGdu9wTfww?=
 =?us-ascii?Q?wedyHRfmNIV1EPcGRw5+Mroc3Fw35eOlDsfe2lcYXvR8uOWNZMTj69Xom0pA?=
 =?us-ascii?Q?xd44EOWnTXyS1lOmsyKcA6xsnHx7OMXpfx3ZwKypEPWFlXvsGg0RXwcbb46I?=
 =?us-ascii?Q?1cDSO0sAefzWwJGvPOE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 05:48:42.2700 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e258d640-1b10-4b08-efef-08dda3f4a0e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7012
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZcTiinnzl3Sut1Yu58Any9Hd2LbDqc03Mh/bpKQRag=;
 b=GV3A1av+PpbnJEl7/OzAefMgp2Y6e0eHlWaNURkPTwWlyAGhcMLDRXtQlGsNUrNvodwyr4ts8N/6IucxU0bfhFos3Cqvj8ZDV6cd3EB1EdOSgLUSp6NoWZIzqhqTKT30PKhQ8vyDGOiozLn1+AcOKmvF+PjtKOKD3o/gzFLOwbU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=GV3A1av+
Subject: [Buildroot] [PATCH v1 5/5] boot/xilinx-prebuilt: bump default to
 xilinx_v2025.1
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that all versal defconfigs have been bumped to xilinx_v2025.1, this patch
bumps the xilinx-prebuilt default version to xilinx_v2025.1.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
Please only apply this series after the following two series have been applied:
https://patchwork.ozlabs.org/project/buildroot/list/?series=459217
https://patchwork.ozlabs.org/project/buildroot/list/?series=459345
---
 boot/xilinx-prebuilt/Config.in            | 2 +-
 boot/xilinx-prebuilt/xilinx-prebuilt.hash | 1 -
 configs/versal_vck190_defconfig           | 1 -
 configs/versal_vek280_defconfig           | 1 -
 configs/versal_vpk180_defconfig           | 1 -
 5 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index b95df5cbf4..d350935534 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -18,7 +18,7 @@ if BR2_TARGET_XILINX_PREBUILT
 
 config BR2_TARGET_XILINX_PREBUILT_VERSION
 	string "prebuilt version"
-	default "xilinx_v2024.2_update1"
+	default "xilinx_v2025.1"
 	help
 	  Release version of Xilinx firmware.
 	  Must be xilinx_v2023.1 or newer.
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
index 8e8940e5ed..9f12e88e7a 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.hash
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -1,5 +1,4 @@
 # Locally calculated
-sha256  86ee9629366aa8c0d70b87202152a793804ed4090e3a6fdac4eaf855bcc4d458  xilinx-prebuilt-xilinx_v2024.2_update1.tar.gz
 sha256  b9e2572885ad12243e10d48d9fccb24771a528b9f27aae1b29b45f0806ce9f1f  xilinx-prebuilt-xilinx_v2025.1.tar.gz
 
 # Locally calculated
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 4bcdc32fc8..5cc4ec48f3 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -42,7 +42,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 25fdeabe69..0879f6bbdb 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -42,7 +42,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
 BR2_PACKAGE_HOST_BOOTGEN=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index d9e246fe27..571f585872 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -42,7 +42,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vpk180"
 BR2_PACKAGE_HOST_BOOTGEN=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
