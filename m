Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AC6C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 19:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B95682F11;
	Mon, 19 May 2025 19:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QG1650wufKdE; Mon, 19 May 2025 19:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8066A82CA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8066A82CA5;
	Mon, 19 May 2025 19:38:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B12F193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 19:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7083B40DA1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 19:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XGamZsY5jFUj for <buildroot@buildroot.org>;
 Mon, 19 May 2025 19:38:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::600;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AB80040D91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB80040D91
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB80040D91
 for <buildroot@buildroot.org>; Mon, 19 May 2025 19:38:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q40wg2K8gTTZgxu8VNQOQtfyoVe5lx8ApBD2OY+YxXODQSiTMyRaq0VMqneT4ROrIu7vpJ7e50chqJZ5Yt/+VoO2ibATCwkx0PFMvmV0BbawOyIEuz3RwnEr6b7wpwvZN90LKbLLbc4uqZhcd7YdjuhHd4WjQqmpXpl00G/PeTmqNk9xOXhEKyoyI9q1G4/GZEqRrG3cnNy472CDd7cXD1ccPFkfIrRPRoEqy+RJjdSxv78i64RnDVkrfSwuc+R6Wj8FYLnG9VSbEHbixwl8Zu4VVkQoFbrBHcDmEZ5clPh7tEbpJU++D7USgwaVyL+kfVTuyZGQoEJEWqc/+tyUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mqqs+FeAR1FnFJ6QoUWXO+1wPTmTGIqcqp48bD91pV8=;
 b=leiLte961GCSCSClQ/lj0VytY/dEUu30QlA9XS//1cngfewCrAnmDsIZxW6vyYLgSxYgLhK6vFENB39VDbdu8aVMI+MswL10NOLKjz2v+r+lr9YC1fllv2Fuq0HJpVDMUwAB5MKp5MKWEqF7toqhefw3DYAwigbpwnmx0a7x6ZSz2BB1Fio1T6+osGh4DMSuMRUyAy37S0DknVF+IwRwOjEFHwbzUcPnTD4/hr1vvrvT+f+7htNGeDV/L6BpK0eZMV4uIoGcJeIsZm/cEpVv5lxBQ+VI+oriXNjo6Z3tF8gxjoW+/bG9z3zlJspjinSl+LYogjMCDSt3jMrMybyV2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA9P223CA0017.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::22)
 by IA0PR12MB8645.namprd12.prod.outlook.com (2603:10b6:208:48f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 19:38:44 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:806:26:cafe::eb) by SA9P223CA0017.outlook.office365.com
 (2603:10b6:806:26::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27 via Frontend Transport; Mon,
 19 May 2025 19:38:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 19 May 2025 19:38:43 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 14:38:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 14:38:41 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 May 2025 14:38:40 -0500
To: <buildroot@buildroot.org>
Date: Mon, 19 May 2025 20:38:18 +0100
Message-ID: <20250519193818.3192717-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250519193818.3192717-1-neal.frager@amd.com>
References: <20250519193818.3192717-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|IA0PR12MB8645:EE_
X-MS-Office365-Filtering-Correlation-Id: cf41b19f-f527-40fa-36a7-08dd970cc3f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mUnM1+VGIje8CNWMDKdJYTXykpBoK7xB8746zuMo29O9I41cRZ1iAPLKowao?=
 =?us-ascii?Q?jhQRSEN3pxPgMhzyIHnlAxnSdHg3+IXnyikE2cfNuYHvpesMZDwVRbvamYr+?=
 =?us-ascii?Q?rS9MBs8S0y7unwZv5YMxFjcZkxs8oF48ln6jlAfahdoLgRqm7Zc8M0QZu/EK?=
 =?us-ascii?Q?BhodMBVok7VsiAvMU6HNVUtn6weG89utZwGKJWXPWxpyiRyyL0eZdqzZPf1O?=
 =?us-ascii?Q?31J/uncqRCEXO/1lKkS2JaDQiA0ZM09dm1H0WcCG3gQf8KbTZOz1rlCGtBaU?=
 =?us-ascii?Q?J41ipHqT8tzbqAOcGg3UL1JtmE6FqMlf7IYPUSHQ+yEmqpXlZ4Rmw1OCtpjY?=
 =?us-ascii?Q?EGdR7dIpAezmz3NwikhETlcNSMKRmRHavn8Ea8Rf63J3p6IvPVByL5Q9DEBG?=
 =?us-ascii?Q?KitVQK/zfmbnAy6flwbHQ59gs+GqerLNZhjrK4jTBW9h52+9e0PA1BKbIk3p?=
 =?us-ascii?Q?82watCOhJPMRJ0I4MYalVa6aA4HGZuGfy2ahazZXDBHaQJohesm7bM6Al/HG?=
 =?us-ascii?Q?Y8csalGv3k7dpVc2VV2kKPpz7EuyEc7BxHpiSW54Na8e343GH+w5xQSqPlm9?=
 =?us-ascii?Q?oNomte+QlVVXMFWLBSxCP1Jaiot9CnZfm3Xe0ikgw6V5rfbt90M3LCvs8hVj?=
 =?us-ascii?Q?NWptEcYS3/KpMsKFAHXzSFR2aBQHXlMFstgdqLkHGCviy26s57jbqyCOMVHt?=
 =?us-ascii?Q?EZtNeoXy3cMXAWt/EpSgUexU8yh206a/zoCu4UtiwY8iCTj7IbYoxTLHlLwp?=
 =?us-ascii?Q?h/bVFp3vOuMqg7ZASM1R1KrWswM7AE7LoJ/ipM/9uV9fwZ/Rbq3EaHhUbhK2?=
 =?us-ascii?Q?9B81MNd1Vn4kzb+dc6YDr/bDEq/5b6RmqitXIj3LNknctgDFTkJTfmV8dIOW?=
 =?us-ascii?Q?6yTUDBvMPOWMems9LuM0fiDHBr0CRamGPzBooTDrEOUXDGuc6yPfCYjjvTWq?=
 =?us-ascii?Q?cRZQi1v+1uLpV3S9VuGzlU1p7LPvpnBXVN9WSfgqZDnXq1RYzD9DuvWAyy8R?=
 =?us-ascii?Q?XVpbQ6o2yC/DlH2YZUBOnn10dlbfszs9eMXCoR2iRpLlIEXRukT7Vjyn+TgU?=
 =?us-ascii?Q?pLvwnls4DAfPXZc7KcpdWPZbnf9ieWlocnPSJcOCgHUlQKdqBnl3eyaBTY4b?=
 =?us-ascii?Q?EejeFRZ/ci8bTpCquY56cOkXV6m68UHety8ytT/xBwpG/zCV6CUhHVQbQrrh?=
 =?us-ascii?Q?HIQbLtsR58aTjsETb2X5LBcFHHVsWYI9oNjY0by0/JNMYNIESqOJijMa3RGS?=
 =?us-ascii?Q?fmO0k+3GxODIm1NhsE7ICkvQJBgwk/d9aJVeACptYconP0fjZQSkKQE3po8c?=
 =?us-ascii?Q?AOxS0F0mDtmvzTw0Q+xQwnMVz3y+0uo4wRUA7/wn86u21krmI6d5HLdo3GS3?=
 =?us-ascii?Q?00/yD2zOpdM4R0Y4pDEOmBdiSmHybprHyeG1sruM89eBulAOssdNx4hnROzo?=
 =?us-ascii?Q?N8tisVkG+dUlzowWRHUCXaq7rbKgP4nbmjWeVEsxIefkKJ2tsk5jd/YkPfuG?=
 =?us-ascii?Q?DKxN3XWk1cfxP8YWUWuvgCShtm0rnmOrSsQ4TlYl/luLyiUusbvfyD72iVKn?=
 =?us-ascii?Q?sOdUzxPLCnPU8y8nTyU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 19:38:43.8459 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf41b19f-f527-40fa-36a7-08dd970cc3f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8645
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mqqs+FeAR1FnFJ6QoUWXO+1wPTmTGIqcqp48bD91pV8=;
 b=chc7iP+HqiQOlVaksN0wO1UtRfmx1g5f/hP75UMPch8QlwPXEmqQJBaV/WGsxbVUOLiEjIzw74uvhhHbjtNFvCqkYWv747L21R+hfuUsRO8b3ChQxKnCmFpQzxHnM5N8gri1ahg022qNQ4VfBGAnNtVO84wyTaJURGm9ot0I/Oc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=chc7iP+H
Subject: [Buildroot] [PATCH v6 4/4] boot/xilinx-embeddedsw: remove support
 for xilinx vendor name
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

This patch removes the support for the microblazeel-xilinx-elf arch tuple.
Users will now get an error message telling them to change their configuration
to the microblazeel-buildroot-elf arch tuple.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V6:
- New to patch series
---
 boot/xilinx-embeddedsw/Config.in            | 1 -
 boot/xilinx-embeddedsw/xilinx-embeddedsw.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 31b12baaf2..98d39331fe 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,6 +1,5 @@
 comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
-	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
 
 menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
 	bool "xilinx-embeddedsw"
diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
index 03acb153d1..abcfee255d 100644
--- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
@@ -20,7 +20,7 @@ XILINX_EMBEDDEDSW_MICROBLAZE_AR = $(XILINX_EMBEDDEDSW_MICROBLAZE_CC)-ar
 
 ifeq ($(basename $(notdir $(XILINX_EMBEDDEDSW_MICROBLAZE_CC))),microblazeel-xilinx-elf-gcc)
 $(warning microblazeel-xilinx-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is not supported anymore!)
-$(warning Replace microblazeel-xilinx-elf with microblazeel-buildroot-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH)
+$(error Replace microblazeel-xilinx-elf with microblazeel-buildroot-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH)
 endif
 
 # ZYNQMP_PMUFW application allows users to add cflags
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
