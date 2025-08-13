Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316D7CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 08:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8D4C6078A;
	Wed, 13 Aug 2025 08:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mGjX460JrIJ; Wed, 13 Aug 2025 08:44:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0899A6077E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0899A6077E;
	Wed, 13 Aug 2025 08:44:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3767F938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 08:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 142756077E
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 08:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TgtSSZGm-mc for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 08:44:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::62d;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E386606F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E386606F2
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E386606F2
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 08:44:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5VmkLndo2TDk4myU7hrbN32bPVEytspEZ13pVeZ6IoSkhBR5GfFruunWpm3StIVkI6xPjs70JJ8QGgwwRJAM+O1ppbf822hN9vGfJ1r6JELNOteNnIfxoA81hs/Lc1XHl6Y/oUjyd1jllDYMAxHoMARy4EuZq++JJCVBk6Inl5pNeEDMU7Gb37Mthiz6LjzUEMtTp4OcgpD/ilyxkxUlPmUU2VQEhSsOQCW0DlQdGhc8NiFgmoRmq680S4vAkQsfgInJID9R8M4nBE9pH/WXUDnqQphiT4mPX8Yp4tmJXTjVyb3r7skCsY9FimdVT1kEVyagBVPVVCke3qC62dB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8U8FO5WxDPg0/Fkivp3WhCgVWnsxj3pj9MK9/hqyMpA=;
 b=dOL3p9Q7fpqmPqaW4Q85xI7jy7i/yuSIdr8OEUpweA86wMmjOaknK3IoMxrpAW0rQVwt9zjo/HL5xvEQNi5DMPfCNPETUeeLxlUUHlXjQ8dAkqnuUwFb+s6lWgf4H/LPQMnXZggRQqb3AVX28MiFBVPwLiZynh+SlskXDJl7F01m2nLtymt9VwsxiVHOBZV5ieCdm/b9E9xWkHFgYLFkBIuDVK3MS3kGtvgxjm89Dw0a7GDBXll0MMWseLoqCykimYmSmFcsZqrhuxOA2UCd0r9e3C5suPOEBfoNdKhDpKxm8G9fDQlCvGpmtn5MMj1a7SAYAblKW3ViJHATVN4ruQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL6PEPF0001641C.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:11) by SJ2PR12MB7824.namprd12.prod.outlook.com
 (2603:10b6:a03:4c4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Wed, 13 Aug
 2025 08:44:00 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2a01:111:f403:f903::2) by BL6PEPF0001641C.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.14 via Frontend Transport; Wed,
 13 Aug 2025 08:43:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Wed, 13 Aug 2025 08:43:58 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Aug
 2025 03:43:58 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Aug 2025 03:43:56 -0500
To: <buildroot@buildroot.org>
Date: Wed, 13 Aug 2025 09:43:54 +0100
Message-ID: <20250813084354.2739722-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|SJ2PR12MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c858c7-6eae-4b88-243e-08ddda458bae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r5JgkRvepggENQErfPN5TPENOWTe1dZazrR6myPEE+kGmB6hMKRszL+sWjx9?=
 =?us-ascii?Q?+d6WwPGH0fHokeDExiBOjVBZLNAqrQG4S4X7ZztcwUa5wucW7/8XqPKmscGG?=
 =?us-ascii?Q?jOZ/jBDswKb2WcrgA1AMv3y1vnvPs+ZaiBm8NsCSx6BH2EaTp0iXRxWJGNtW?=
 =?us-ascii?Q?urOLUZd5PZLRMKxFnFQY+RVULAjiKN1kR27tZqWn3Z821QFSLUSN/X6ZxKFV?=
 =?us-ascii?Q?klB5aqL+kaEFieVRfYzsLGuvBZV4anuDfH8bQ+9+iX+MEOu5QFrLQm3ZEb7m?=
 =?us-ascii?Q?BvENfF4nULXxSIGkgfI+i2qtnxP2Egh+4ogJxpRqZY59Qmr7ikyn24G40QLe?=
 =?us-ascii?Q?W+3SYkU4PAaGNYnDa4rYx2QkZJxKc5cWeETrBbOfnXikGxNSeKjc9NZ34Dla?=
 =?us-ascii?Q?3Grzf6uNt/VKS6MG1rLAMBcMO4/y3LdRd2eH65D3XugiViLsec8MLWTbDGAl?=
 =?us-ascii?Q?DhMs1hrDV2+Hw6L+uvlOQwncegt6qni4P83pqqG0YB0VCrBUaIJ7A/UIo2u7?=
 =?us-ascii?Q?noWNfOOqVs9jRoPZAJYnRf7ONGhjdehLX3NMbvf1HZbxPJugAaDLmOZYv+nk?=
 =?us-ascii?Q?iXCA7+pnZvakkzZEhGSBwnK1FHuYq/ZeYgYNhXWD2B6iclL5mKxNAprUzup4?=
 =?us-ascii?Q?LwgcgcOtsGFyQc9Aq/ahn8DDcT5n5TzpDaWLlyMeoozu2WaVzLF3C3P2dwUa?=
 =?us-ascii?Q?0ODQ/lV7nNxts9wmz2E1CXZIJNOiiMoi4Bmzo7/f8YweZhuwF2jrCAbKa5eO?=
 =?us-ascii?Q?U5jKcvWL17iviqdQKj0mzLUjvf6tfGe6VS1sZHm5XPpG4ue4K42h5tGaY6Uk?=
 =?us-ascii?Q?+OovELnCOHQJVH3N9SXtFjy3//N76OgJQXEqAgOHjPJMqUESbZx9uEosC3Pn?=
 =?us-ascii?Q?x6BzkjFyWKE3b4jTFpzSIkApDD4FTRTS2coaHEv7C6H+LxghSTP0aQ4NWqw7?=
 =?us-ascii?Q?j6GFnqrHxbglu+prplWeRghY6b8axug41VannG7uaLdDHhVkHOrVmT2CjO5h?=
 =?us-ascii?Q?wnKxX+wjhTnLU+B0Cnq0IeylA+D0R68dcxpcuZqWytn4AvTwG1BYx0YuYrYD?=
 =?us-ascii?Q?tn26FV6cbZPDIoKIKJweGml+Mjs0um4MqeeZvjTgy63oUzYSkv8mQEyfiWVc?=
 =?us-ascii?Q?8G8jOAvrjG5MBwxqoYBZJfhpMgoxjylzTALxkMxsKefvvnFebB1LhQMNm+Dp?=
 =?us-ascii?Q?5r7sDZf5mkwrbAF0Z0Lz0siEnBY9r6ZnTIVJX/fdTOZog+Pzyk4OOfNNTLOv?=
 =?us-ascii?Q?SR1o4icjjyE+virCvTkKN6kD2XXG2WgFyZUhzuSf7jQyKp9p1NEknRjGRi8Z?=
 =?us-ascii?Q?cH2UBxMbK19BR0H2yGkB6yXwqq6YbvNCjJ7vO79Id1NVmpm+Vdd3UruFxZrg?=
 =?us-ascii?Q?OxMm7nUsQSi4fJWtPRKxgsKEiSCUAburhgp9zPgQx48CUL5MQX8Yc3tDpM0A?=
 =?us-ascii?Q?nKfTBAKw/mLLu668S9IBbA4+O9Ersz/mq8j2IElbWvH5k6BQTehmEaE/2OhG?=
 =?us-ascii?Q?kn3e5CjHSB1xMRMGQgU2+N1aiwbmdnw4TscexBIumDZCJ8OPwznFDAgw58Mx?=
 =?us-ascii?Q?i9qrYEUXNfVC7bXLt6c=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 08:43:58.7078 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c858c7-6eae-4b88-243e-08ddda458bae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7824
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8U8FO5WxDPg0/Fkivp3WhCgVWnsxj3pj9MK9/hqyMpA=;
 b=ShVz+f6RTB69WFhjyPvh/ENSIOBh03fHJvT/o8BQLRHsi3SFYbl+vbTXO7HJ8Ov9SySj/BDknzJ0q/Qa5Avh3wIFzn7w4DC5Hwa1MDv+EcLVxXggRg6oKzhUYgZx2nzrNdPsK+Z1OZAtRj5EuS8yRK/C2z3tyHwJx51Sz5JfNwM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ShVz+f6R
Subject: [Buildroot] [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow apps
 for device family
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
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds an architecture cpu dependency to each application to make
sure that users can only build applications which are applicable to their
target device family.

The versal_plm and versal_psmfw applications are specific to versal devices
which are based on BR2_cortex_a72.

The zynqmp_pmufw application is specific to zynqmp devices which are based on
BR2_cortex_a53.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- Replaced new family variant config option with an architecture cpu
  dependency, so no new configs are needed.
- Updated patch title and commit message accordingly.
V2->V3:
- Changed package dependency to only appear if the cpu is BR2_cortex_a53
  or BR2_cortex_a72. This way, the xilinx-embeddedsw package will not
  appear with zero application options if another BR2_aarch64 cpu is
  selected.
---
 boot/xilinx-embeddedsw/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 0dd6433608..96e9ca2fb0 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -5,7 +5,7 @@ comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-b
 
 menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
 	bool "xilinx-embeddedsw"
-	depends on BR2_aarch64
+	depends on BR2_cortex_a53 || BR2_cortex_a72
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 	help
 	  Build boot firmware applications from source for Xilinx
@@ -30,6 +30,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 	bool "versal plm"
+	depends on BR2_cortex_a72
 	help
 	  Build versal plm application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
@@ -40,6 +41,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 	bool "versal psmfw"
+	depends on BR2_cortex_a72
 	help
 	  Build versal psmfw application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
@@ -50,6 +52,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
 	bool "zynqmp pmufw"
+	depends on BR2_cortex_a53
 	help
 	  Build zynqmp pmufw application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
