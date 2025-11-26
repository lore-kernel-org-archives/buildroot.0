Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE469D11196
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 20:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C133E61516;
	Wed, 26 Nov 2025 20:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqdN0Dofjo9F; Wed, 26 Nov 2025 20:23:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 982A36149A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 982A36149A;
	Wed, 26 Nov 2025 20:23:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D19C359
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 20:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32C5541212
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 20:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTa7c0a5qqKl for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 20:23:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::1;
 helo=sn4pr2101cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 25B2D411E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25B2D411E8
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25B2D411E8
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 20:23:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPsyrCB9qt2y8RatbbMcgDSIovXOCCLkj4+QnODKAFaWVTNbB3aGLlIT0Z9/g2NY9PldpyZg2+eYzl5mSWkt5ZyticfmGNvEHGuKUDFHWmCxJem805T7o2jOrlZDwLYGn2Vw0Vu334hvQMu0iKjiFT3gk8/ZNJpwUg5qnEhiN2SXyQlxkvzcOir53MCps8yI+KlIwUkqS7Pk4jIMaOyFlfvJfq3arM/44/zVODNnLJMAbYV3IbFMm+rlX9xAn+HqmOIKXuXjajCOq1ED82kC2yFxfwL/5y2xKmSntDiflieRlF7t30clXfbO5h4KFCSuwilYAchokUjBn9Tril3yNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTCsHQh7OLuq+W42fAbApit7DxcWlodBLmmPmDrtAqw=;
 b=am+HDKJVcbh0MxjTW7FN4gYu5cE0C/GtQYHElz9IZnf+7W3nsJURSyiwvldJzo7bLFoWIgna27BIeCOsrIqB2bwwjkVPsgrtvUhsFGAy2l96q3elNAuZA7bUvPnDTpx/l8bh6QWdXpvAgSquXWdRK3+sf0wSLaTZ+neVQzmEC4bsmiVZLXEzvBzVehv7+ms+ijyFlo9/qKy7yR8jXZE0VI/+1HB3zbIYn42s8cjXqqgdyNP4aoo/gm7izSYIIuzhNNwRYaqRJItp+NHgiVjtURUsgf4HZW0/QXaw9BLmIN9sIvSbSFkuJDLVkcBcuOvMBESZazPoZT31K+7u+1Ec6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0135.namprd03.prod.outlook.com (2603:10b6:a03:33c::20)
 by PH8PR12MB6961.namprd12.prod.outlook.com (2603:10b6:510:1bc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 26 Nov
 2025 20:23:27 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::a9) by SJ0PR03CA0135.outlook.office365.com
 (2603:10b6:a03:33c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 20:23:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 20:23:27 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 14:23:22 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 12:23:22 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 26 Nov 2025 12:23:20 -0800
To: <buildroot@buildroot.org>
Date: Wed, 26 Nov 2025 20:23:07 +0000
Message-ID: <20251126202307.1269790-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251126202307.1269790-1-neal.frager@amd.com>
References: <20251126202307.1269790-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|PH8PR12MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 030a2e62-e147-432e-1ba4-08de2d29a835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|7416014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OSdFRBBko2UrdE21DYzAqvzGVe4uG1Jrf0mnmoNntdfe4nQs/9OjsgG9S+HL?=
 =?us-ascii?Q?jCOQFHkMTR/+5ZtThr6SK8yqDBfnmkblyg64uZbr9fEyix5YCjoQr/Vocodw?=
 =?us-ascii?Q?zJ6LkhUBGk51fFFQawbe6czS8UEW/k2PWmowkDj0+5fAR95xN/DoYoyIY59o?=
 =?us-ascii?Q?6K/k7oW9bo5geN9a3tTe3uqRHLmNDkI90rol3yoPPtsFPue6UKsL918pC2U1?=
 =?us-ascii?Q?+uhI1WnHakIWhzF5B50sRsTZDq8xE2Y48ArLh/iPJsNfb5cSZ86OXLjzOY+I?=
 =?us-ascii?Q?l6LWJYeItWn0TEifRuKY61wpzfYrHMhbqEuFn7O9N8zO6c2MbEAwh2DZ3cdD?=
 =?us-ascii?Q?W7b9zbQOSluibOxdS2cYDKlRml+xXsNkZrkX+/VZdSY56ANaMUvkohqyNQKK?=
 =?us-ascii?Q?PXdzPKHBMnKcnu9THbKWwumSsED3oUw3hHkclpllUTTYLtWnb8VmPHqFno1F?=
 =?us-ascii?Q?nEYhDxuZG7AkRnzDVoeXFWpI2moJDS368JS2B+JymcZOOHDHsdqy/Rp75toZ?=
 =?us-ascii?Q?aGSbjS9bHyQ/MIijvViLFpp0+X+I2fdVnysWBXCCJTVzzrXkT8tSvZBUrIx8?=
 =?us-ascii?Q?aSNsCCvlS13NZUItV9OxPFM+q5vhiYyzC9cuybOrQqArjJ9LIZrAt+7OXcIK?=
 =?us-ascii?Q?hWR+odgS4/uQMxP04jEF0Fg1Hz1N06wffHKaTXDqyemS9zE7SYN1yT6tVs81?=
 =?us-ascii?Q?iR0wb6CHU/7c846sb7DHtxlUGUIL/cJVqCAht3AgxEXrVfPuGj/Ig6ozQC5T?=
 =?us-ascii?Q?EB832On+B5FlbZpEyVp5pvuM54JecJV1SrZQqCTag18mWLyFkVgEdJiar2YB?=
 =?us-ascii?Q?pjR+81Vzfn88DrvpaPNPyBS3l/lQjPt9hB6vLafOmme/bPUXe/2Xm0kudEvH?=
 =?us-ascii?Q?IfeUns24+LSE9JQocwDTk38Fz1Ms/7S9ij1n/wQkkD4XhPAW5sdf3Q1sWA/b?=
 =?us-ascii?Q?w2b2N8ICFREDYclW1xCZGNEL0rZ78wGEuIHGBliTCW3FKTrI0/eaxejzaHd/?=
 =?us-ascii?Q?DI5T3LI/OFgXNTrsfzojl8JPrfR9fZtolGFKFgZNx+vQVejo32XS5xksrtWz?=
 =?us-ascii?Q?8Sc7ZU0QiBeN9ocdj5s5CJcgpvjn+Oz+ZxNDAXgSzQ/iImeNWSTJW53tM3Dl?=
 =?us-ascii?Q?Jy8dFpRTjmfyLZ52oMRvlNI4/mM0h1IFyKcSgKINid8B86nICmqfJ6OeMBR2?=
 =?us-ascii?Q?qTsWq1kC7i7deoownwboFIj18ps7RygghJaBfT5xqKG+mnW6F/zaDlnyXguJ?=
 =?us-ascii?Q?BpYTsIwziKb9eFD6YqLa489ya9qAOfcRF5lBBKg5L89pFpA/vfAXgbNMnZgX?=
 =?us-ascii?Q?+We2aVmAQjzYlE0766uuwlA6vGjehe60jl2hN3LrgwhOoBGQ0mtrDFp2kuf3?=
 =?us-ascii?Q?mK8DyJXZQKA6oIggzkKK0fPpwmFiSGGdPUVLmLBq1AStiQmbcFMZbRmWIPzI?=
 =?us-ascii?Q?OhMFGB+mQR2J1ns47KDW7UjQCafiUzzz8BHfq3CGl7xzWiCHwdv4jk9QZV5X?=
 =?us-ascii?Q?FZIv0HTVQor2EkEotqNk0HE1S9eRQA2s2vjhKbnV/b6J+19+ZYPXaOQ+o9Tt?=
 =?us-ascii?Q?HoBqjxUV8JfU4MvV4mfO9zYuzuxngow7aXqX/FaA?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(7416014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 20:23:27.0813 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 030a2e62-e147-432e-1ba4-08de2d29a835
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6961
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTCsHQh7OLuq+W42fAbApit7DxcWlodBLmmPmDrtAqw=;
 b=cfC/iU/imqhYhcsvu/ao3o9Df7XN51bNew+fWxgNOIRT6GG4u4qn5UxPJn7572Dyjm8AvhkVLfYaQM4Nb4yntOhXJLJQ14UrsSYVRPtLylVyFzFMAt2XIqh9WPtxowvsBBSRxEI0b2y67ZQ4Ai3UiE/5+FMM5I4omIdnPhi/0jM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=cfC/iU/i
Subject: [Buildroot] [PATCH v1 3/3] boot/xilinx-prebuilt: bump default to
 xilinx_v2025.2
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that all Xilinx board configs have been bumped to xilinx_v2025.2, bump the
default version of xilinx-prebuilt to xilinx_v2025.2.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
To be applied to next branch
---
 boot/xilinx-prebuilt/Config.in                               | 2 +-
 .../xilinx_v2025.1_update1/xilinx-prebuilt.hash              | 5 -----
 configs/versal_vck190_defconfig                              | 1 -
 configs/versal_vek280_defconfig                              | 1 -
 configs/versal_vpk180_defconfig                              | 1 -
 5 files changed, 1 insertion(+), 9 deletions(-)
 delete mode 100644 boot/xilinx-prebuilt/xilinx_v2025.1_update1/xilinx-prebuilt.hash

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index b218458ba5..e742a66ca7 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -17,7 +17,7 @@ if BR2_TARGET_XILINX_PREBUILT
 
 config BR2_TARGET_XILINX_PREBUILT_VERSION
 	string "prebuilt version"
-	default "xilinx_v2025.1_update1"
+	default "xilinx_v2025.2"
 	help
 	  Release version of Xilinx firmware.
 	  Must be xilinx_v2023.1 or newer.
diff --git a/boot/xilinx-prebuilt/xilinx_v2025.1_update1/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx_v2025.1_update1/xilinx-prebuilt.hash
deleted file mode 100644
index 6879b88d83..0000000000
--- a/boot/xilinx-prebuilt/xilinx_v2025.1_update1/xilinx-prebuilt.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Locally calculated
-sha256  48fd698a16f79b9a828c35ca5b2b50fe832149d1a2938c94c0bb6a2e249b0bed  xilinx-prebuilt-xilinx_v2025.1_update1.tar.gz
-
-# Locally calculated
-sha256  7b2074b607264a07347e1a7ef0323229585942793469f34b2cf9628f7623e05f  LICENSE
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index f0b9f1298c..f9256254f0 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2025.2"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 474fd1e8cb..222297b768 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2025.2"
 BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 2e4a6db51d..020279c3b5 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2025.2"
 BR2_TARGET_XILINX_PREBUILT_BOARD="vpk180"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
