Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EA4C52D73
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 10:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3258F81326;
	Wed,  7 Aug 2024 10:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9641I4d4QMfG; Wed,  7 Aug 2024 10:58:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CFA681324
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CFA681324;
	Wed,  7 Aug 2024 10:58:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D06D11BF97F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD9FC40A97
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id laidCfOyEEoC for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 10:58:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::626;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A0D294019A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0D294019A
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::626])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0D294019A
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 10:58:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOYTxZ3uef7Yc9UUewLRzdbnAN7tw6SF/W1MqprbS1i3AMcw1k/lpNk84XWMShUPQKI/TpMVv+BI5d/LcMZF4Nrup/kOnn9mS4Ptxe/93Mo9K46hB7hPLrg7xJ8Fob+Qqi8B6SsBbfvPaaAYIJRFv5zk1g1SZnDC3nh91Fl0irZO37EkRNiCcH4XXsRwQy2M5F4IfCGAI9JGxX2BHWCd48GLCLEoMhrRwnM5o2/8Ybr/IdGHYsg4PoWV34zfwqz5JvP7nIn24rxxS6VhTqfTT/n0fiOaJie6Vy/+pz6PSUStEeKo8wzJAlu6ZDm/EnrKtGQ105rkVUUY77w3AFSbsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5Y0ED96G5R7Mv56Z8EgjA7VqysDYPD8e+I9HSvGvUc=;
 b=wTGXn9jwfLJglAD6GNDwT/IanSFeHWhqPVSqjqPGATrzWv2sNIwf71sUMzMWsO10p40zr4LIV5drqmp3PvYVAYYh4cdFriXB8zO2Bs+THmX38cOasD6wTXEw8HEDv2eim9g+065jcsVFW6Bfca1d7P1PN8PlJ8xdbfEmI+QFeSEI01yDfRosFpXQUXZD8wmkX4gwIWothVdXb0vmOyVSGeR/PdxoOc4WVuMGbjUA68bLE6mx96Vc1fG82k0Hbutr6Xps+DjRi5Pt473eIzDB5ivsxOE28bCPD29780BgYYZLaLMXkCly4ukF2HE3PtkRjQVgVsCUTErpuUz7und4bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR05CA0056.namprd05.prod.outlook.com (2603:10b6:610:38::33)
 by PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.23; Wed, 7 Aug
 2024 10:58:30 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::b) by CH2PR05CA0056.outlook.office365.com
 (2603:10b6:610:38::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.11 via Frontend
 Transport; Wed, 7 Aug 2024 10:58:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 10:58:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 05:58:27 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 7 Aug 2024 05:58:26 -0500
To: <buildroot@buildroot.org>
Date: Wed, 7 Aug 2024 11:58:12 +0100
Message-ID: <20240807105813.3844985-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240807105813.3844985-1-neal.frager@amd.com>
References: <20240807105813.3844985-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 75987d89-a2e9-4329-5fed-08dcb6cfde8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AIWIcNKS8Wa5+tcTky/sK8zE0s/bAD98cMiKlmh15dBJKmnBM8Gha0BXejjT?=
 =?us-ascii?Q?hom5YGfQe5bRjwGnCWtJfg27orpMDdTGM3rNg8kvjfMcl5797o9CwkFVal9d?=
 =?us-ascii?Q?W4AHCvIQZ2504Vp+obP6UNyNlOxwySlaqLCX/IC25a1XQpOeUPvQ6YiLp9iw?=
 =?us-ascii?Q?brUrXrVDI/JbmEBjNOaHya3fzH6LamAaqZah2ZzSokjAfDu4iPu2EPnkH1N3?=
 =?us-ascii?Q?c+aBfVBbzOa4wCrmpGL/L/GD0F1INfkFuOBs+LYs8xH+BgWQepirCC+S9oWJ?=
 =?us-ascii?Q?+Sw1tjQIbVXkkEVoLMzo/1W6K6vzv8yIbwKBhH2et2PsBkqNkf1UMbFORo29?=
 =?us-ascii?Q?ntOM6HqjTyafJzGHwGXbEP3R5JrSA3MYB6OW3ue9kgTb1QBhCcD9JXOnmRgr?=
 =?us-ascii?Q?YBdAiz35m9Tm8lCBsmDtRwKw7heM0o0KMK8Jh7LXSuPmOfsbgrCDJq8TixXK?=
 =?us-ascii?Q?TrQojzg4q/O7zGBzJ8o5/Wo2bp0SIStIMEteOkftz+tsVvdKtyKXxIK7Om0N?=
 =?us-ascii?Q?fJXC8Kg1vlMeLEUtUjtqN6SOwV+LKoPJe3uQmJSw2l9mpAtmFy/1jud4xiAk?=
 =?us-ascii?Q?ycXH2hxtFwYvLYVtFzwLG2xYxwhUN5OShDPs6GT7EvCBZqOdxkydbB7dEAOL?=
 =?us-ascii?Q?Tp0piikgKCUwa+UlgrdyugMICnNoH4NV7dDnWg7rDD1tJJScw4scOqBdDfiz?=
 =?us-ascii?Q?XOikasnWdxE1dNnga5hBKa40PVUfDEv/sbFx7Dbrj9+LL3pGoGl8WjubMZMy?=
 =?us-ascii?Q?oiPpIEJX5ENE+F6KmWKeT4z2sGmk87FTRuUAxJV9vRjo/dZC/5Iad0o+g/1N?=
 =?us-ascii?Q?UP/Lm5LDOrPWcsK+ZEyvE/grZEQNQhxN15PksJX680iC7kkPtIdnX0JJzSzQ?=
 =?us-ascii?Q?6qFSzjq7qQvDNuGRe7zsxsVCpUSAwo1wouatHCJzOUZtl7T/A22eWO0u+r35?=
 =?us-ascii?Q?DffyQgA6hjvopi/fEZImkNwFraEud9Oe3EhnhlSGlwUjjJ9eWLusU1tlXMGC?=
 =?us-ascii?Q?Q4hKMBc9jEC6THDhGY3OfUybP6gkF3gc6ya2vjIHxNrawRZ+PUj4evhtRPB+?=
 =?us-ascii?Q?n+2Mc+7PnwFAuYzF3wb6hwzfzJ4I9JmVie6BVzUvSeLV7ywFbrr/vU3KQiAZ?=
 =?us-ascii?Q?nVyl0Ggtmfdo25gjqw5cNNdp/AbRVFyOA2k4fVdd3SpykHIcutnJWjDDehWe?=
 =?us-ascii?Q?wSxn+IoeVcIx0Q9ZsOUN8tAo2Avs3hyuky/EBwPcnTkHKZ3b4LsadHMCogwd?=
 =?us-ascii?Q?loccM+6qNkZXILwqhr2wlzZJm0CoWDMi14SolmoWwZ2KtcPXUl1ALiagHjL6?=
 =?us-ascii?Q?4jUy2LWNnTUCbjD6pi558nFiijhKK565/O7X8Pd7n2Wi4PGyKQlLy6lAST1m?=
 =?us-ascii?Q?M848d01b+3dc1rIEbCCG6A65/h2QVgiwinJy9iUammccDKa1qUIVbpx8wWrQ?=
 =?us-ascii?Q?PY/Xl/qZlZ/oNRL8ygsC8yUI+c4WePW9v8LWOgrZCH2ZKhX2M31BUg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 10:58:28.7122 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75987d89-a2e9-4329-5fed-08dcb6cfde8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5Y0ED96G5R7Mv56Z8EgjA7VqysDYPD8e+I9HSvGvUc=;
 b=1y6ikeiWn9BtQXIjyQu5v45O9lre1nwRw4x0GPx8XSMzpdxVkA//DvSrTiidkGv4jfLqarU0wrKd/uHrHPq7vtApgipKXXkjeiaey8iZFs5PfvVol3mWBDRHzIU9B6tPaEJHmwjJdRRujXVoUXP2/nkJheenpcl6ymR3y0oyuKk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=1y6ikeiW
Subject: [Buildroot] [PATCH v1 4/5] configs/zynq_microzed_defconfig: bump to
 6.6.40
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynq_microzed_defconfig to Linux kernel 6.6.40.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_microzed_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index f955a0c4ad..71a5d880b3 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
