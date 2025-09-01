Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1304FCA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 08:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D45AB411F3;
	Mon,  1 Sep 2025 08:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzC_Ik7Mokop; Mon,  1 Sep 2025 08:37:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A4D341214
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A4D341214;
	Mon,  1 Sep 2025 08:37:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 630F710E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51E2460D9A
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4N55zeUKUCCH for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 08:37:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::615;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8621361350
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8621361350
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::615])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8621361350
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:37:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkFfGhFRgfMvevPD1vasmFug+siXaP1UmEIXmwamQMKelmBUqWpubdOe5gdxYqNPMyuZ9p6+iV0Oeh5QWp4RVC94wiX9uKt9/nercvGsceY4lsLsanyUTK9N7J0erpt+3M6v5XUGzMQGu+VdYfMP+8woxpPSngaFDOH4nmbkEMjXNTjtN+lLZWPVtNWfZQdij6y9X5kougXCNlXF0/RXrl3ViICGmLgTyzS/p1HzxRwBGPjdh32cebrvZ7aTUeyDM+JVqFkg8Dqi/ghsY3IQgnDhozsYekh4QetIftXLjrE2JaCvkNyJJsNZ/vuxYII+5PWXgrebKzpo+UOkUotidA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEStgYcNXWFNM8p+AwBvkFcSSe09paeuhErltRXA+aA=;
 b=LiM8Ly+FSeXFRq5yAZGZHgSUZ0U7tQniP0aLTB+pQbE9HzjP02t62g4liIuAKZXASO26KKjoShb6Fd61KZ5Fq2Ajl5zzmbxRaM+2giisn5sUJRoj4tkiEWvxM7oax+oONm1BGSsuMF8kKl5dJZ47PFN237RE0J4Xft49vWAIW1aJ+8wde3sh+I/XGq6kI4+5iLX1Z8+ggcFYjmRRJrcnQAHRrGmwNzwykG5o0jz2yvedRIIPUVhlzQl9fvJ2j2uxklN/e0cb2l2tZduRRY/sfcp2i+scM88I8xfPDRq930SY/s12JeiEdXsYBAEU9MReYaf/3Agxhl2h15976unDgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BLAPR05CA0015.namprd05.prod.outlook.com (2603:10b6:208:36e::15)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Mon, 1 Sep
 2025 08:37:02 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:208:36e:cafe::d7) by BLAPR05CA0015.outlook.office365.com
 (2603:10b6:208:36e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Mon,
 1 Sep 2025 08:36:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Mon, 1 Sep 2025 08:37:00 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 03:37:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 03:36:59 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Sep 2025 03:36:58 -0500
To: <buildroot@buildroot.org>
Date: Mon, 1 Sep 2025 09:36:48 +0100
Message-ID: <20250901083648.458639-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250901083648.458639-1-neal.frager@amd.com>
References: <20250901083648.458639-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|PH0PR12MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 02c826ee-4dbe-4965-28e9-08dde932b83f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pHwcCoLu2ukIqm8ogb2LdOEZ82DRzl9umWWlzpRilGC2+SvqtmEhI1c1efgh?=
 =?us-ascii?Q?QPPARuex7vHSpf7cBZBxnZIjf2OxfluHS9rEJZPjNywOqTUHlAQXKZFLeCR2?=
 =?us-ascii?Q?Jt38yCTp9gDoCTTsFqAL6KduLH+0wVbzdbzB1lYSIuq3e6OnJved8N1fhHvs?=
 =?us-ascii?Q?LvEcADBgZaMN4Yf3fItKC3EUZb8HdWdIPKaexNL2bt1CNxTuJ/1aT92kSVV0?=
 =?us-ascii?Q?G9RYP1vF7qaaI4Md1md9g+KQIfLVJ2nso6YyTuzd4way6Ia5U6dVgBIhfNKq?=
 =?us-ascii?Q?fKf3p2fhmJE+s+rySkJXjgD9AMWh+BFr2mbv+zmSiaxJ3Dj1bqthKIDrzLaA?=
 =?us-ascii?Q?bnBYkvSLtzMNtj+MKvmF83766yBzd6zz74FjTcfVJcnaqCDCkJhwHmhXqXZ4?=
 =?us-ascii?Q?Oz6S0e8kbyAZkPp9UgvxaMlZ0Ev5YYT0/6uTk7+rHkUMiSlyexj4RMJskSH8?=
 =?us-ascii?Q?sN7GAVZ2bBU2mGzNJO+BYwE0O9p1TUUN+bXPY6SE1rGWabQIPF3LJguK2IjH?=
 =?us-ascii?Q?g2ErOq80JyUEvWovDSOVXgQnHtYHSBsXVQROc3TouZg0Rp1YVA4gdGfJMVag?=
 =?us-ascii?Q?ghvVlrcpt5uRPIbk9UhXukAkJ7B815Nl4Txg5twbYQAV/mIpTD6mwooKiM9C?=
 =?us-ascii?Q?uYvaDRMz0Bm9mG+TerlDlj9ktnXJ0HuuvrLMToNnKAPWAb32y/aRbMP0DMTH?=
 =?us-ascii?Q?dH7U+gWfbzM4tBCgdPxL0n7p3+AlYQV5dD03BH9pE8MjwLdmqTrAdhktiWJi?=
 =?us-ascii?Q?gIjFUXNGs1ppvnj0b+iHR0+TaRWwxJ3VRgplSIwbLPvqcpuU24TDnLDA3ZTX?=
 =?us-ascii?Q?PVOLjqlD+X7YSAjvHjhEBgOefFuIaKF8M6e1Ihq8v9ulPnwHYrsmCSk5hoCH?=
 =?us-ascii?Q?WIYDRz+niHiFYbfYmiBj07QwYlR0gYdkbEaHokuArX2mTZkYVvHjTewXasj6?=
 =?us-ascii?Q?/EPkjil4r1DJ7rb/8+zE6d42QCX7lqQMC4GaoZNRTvKJGz0fGROJDJ/wnzUS?=
 =?us-ascii?Q?GMQPp7ogP6jeM+3cLMuIdvHsVgKrN1chzpmr8Em5lq4N2qYPDalYIAPK8R5W?=
 =?us-ascii?Q?7AqQOMadSzJ5UYePlYbEw9gjKr9csJKPGEJ0Eit1whnRpEQl3uKEEs+YV1Eq?=
 =?us-ascii?Q?cHhAGLgFWdrobBxjHStTOLamijDSYY8Uv3BnrP0qnEskzKktu6H7KDle7PMX?=
 =?us-ascii?Q?IKXgsZseRGcgmQ7Zw5QJMVX/UcNtpRbLaa7aI8AGSzLW3Fp8NB5PYhVh4T/U?=
 =?us-ascii?Q?yDPyePxcOQA8I3y/XYbZET5WCy8eCxyNn+VgQNN4nAXfDUkc1OfD2E5kkyPn?=
 =?us-ascii?Q?FpI7FZh7I1ShUVSJ51eOnOXTD00MpBoVzpc7ljzLHXA6Ec+tjqd94zxWyKES?=
 =?us-ascii?Q?ONlyAz+zpqHjuDNxbhKisDBoJnRhpnH7W7dGs4nNUFvs+AT3eLMgn6Odd07h?=
 =?us-ascii?Q?Xy5E/BttSKKjfZClhxpzF6BzmhOboQjr/0wTAVSS1OZbq2OgoI8l3xfJgzIS?=
 =?us-ascii?Q?x+xK49+DiL0U5jM+gPQ0L1tzGj7UI6ocdW6qYeTEOOXxdC64hntla4Kkm8YE?=
 =?us-ascii?Q?FoS+jsQEx0O0ymWNTyY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 08:37:00.4830 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c826ee-4dbe-4965-28e9-08dde932b83f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEStgYcNXWFNM8p+AwBvkFcSSe09paeuhErltRXA+aA=;
 b=s5lxs5Rg0l7gwSinnuBvR9tqDsEl6y0MxiFqzj2wtHaz5dzPSS2ypEauSbR2sjmif7fDgC9jryhPxmK/JYCXw9BzSdMDdq4xQyspF6clYdy6q/LCixeKs6//+fQ30atKnyVE4VIAETB8x1jKMwxBTsmaL1DuO+Ac9oOgiPyWugQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=s5lxs5Rg
Subject: [Buildroot] [PATCH v3 4/4] boot/xilinx-prebuilt: bump default
 version to xilinx_v2025.1_update1
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

Bump the xilinx-prebuilt default version to xilinx_v2025.1_update1, so that
all versal defconfigs use this new release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- new to patch series
V2->V3:
- squashed the 4th and 5th patches of the series together
- improved commit message
---
 boot/xilinx-prebuilt/Config.in            | 2 +-
 boot/xilinx-prebuilt/xilinx-prebuilt.hash | 1 -
 configs/versal_vek280_defconfig           | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index 836cd8b68a..1bc6b3b8e8 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -18,7 +18,7 @@ if BR2_TARGET_XILINX_PREBUILT
 
 config BR2_TARGET_XILINX_PREBUILT_VERSION
 	string "prebuilt version"
-	default "xilinx_v2025.1"
+	default "xilinx_v2025.1_update1"
 	help
 	  Release version of Xilinx firmware.
 	  Must be xilinx_v2023.1 or newer.
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
index a8dee8f129..6879b88d83 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.hash
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -1,5 +1,4 @@
 # Locally calculated
-sha256  b9e2572885ad12243e10d48d9fccb24771a528b9f27aae1b29b45f0806ce9f1f  xilinx-prebuilt-xilinx_v2025.1.tar.gz
 sha256  48fd698a16f79b9a828c35ca5b2b50fe832149d1a2938c94c0bb6a2e249b0bed  xilinx-prebuilt-xilinx_v2025.1_update1.tar.gz
 
 # Locally calculated
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index f0c156910f..7d4f699af9 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2025.1_update1"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
 BR2_PACKAGE_HOST_BOOTGEN=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
