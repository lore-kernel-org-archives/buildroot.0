Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C87C021A4
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 11:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAE9F40903;
	Mon, 24 Feb 2025 11:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2stgd4WV7cnM; Mon, 24 Feb 2025 11:45:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B73F9408F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B73F9408F5;
	Mon, 24 Feb 2025 11:45:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BF48920
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 11:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B78C40BDE
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 11:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqTC_Vo2tPYS for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 11:45:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::62b;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4BE6240BA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BE6240BA5
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BE6240BA5
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 11:45:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozGF+mN18Xlfc7k3YeI6aQNZb1gJt8mIRYkH/EVxzaNbXTGQDm/E95d15ki0uH+/bCOmrbv95zhjcpvprqSDdp5Z3A1uHAmv59NPpUJbg1ggvdlNgP/HxyhtaFF9fB8XZKdVdxl6JHsMJhiJjuMSgGHuY3MY5p8ZacCZHuf4s3qH2DSmSUQWBXNGwYQ3DSOBQvv4Ndyj7hbBWW8syX8s6/iEA2BJeM1mEr6D7bo0hFqVMtRTQDOknMEH349vOC+EpETXiQsK3nuEeP2tp5Wlyt8XKcmdfUiPPXVKmm8jbLpa6o7aMmi/IqJgmV3BowDEwQ5Dmwfh2Zv6YPAHIrC8zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bss72Ywprn4UIQE60tmq88ONNexcpImem/RCwkIoQAs=;
 b=xE2CrHKB0wDQVWkTQwgLmg72vPHBCkEDch7NqU/9wu71MpfWFQhXn35ut1jeQ5AJf9iIE14xENSPluPJBbd64H+THG1JJ1MK2LS4Jc/S0p+xXvwuHq5nPTGMrvvcFPjN+7Y4yjyPCPA6jEufDmMpmdE1e9Jzh1XE+xm1Q5B1KftjWjYFSWpgKc2R4VgUYzQcrMw5N2U1vAPSj1cLzFeOJa4IX3EaCgHIqKo7WZqysgGnIe5jEjZJtIVCpxPjf3qJedEcikV8LLxb0+3n+P6dOXEIjtkHI1uP/g1xxffBevlV0IQ0CyCAlFrlPBce/z3Zp1HRdbEqFEOhFa8D/FNhRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH8PR07CA0004.namprd07.prod.outlook.com (2603:10b6:510:2cd::13)
 by IA1PR12MB6116.namprd12.prod.outlook.com (2603:10b6:208:3e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 11:45:38 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::79) by PH8PR07CA0004.outlook.office365.com
 (2603:10b6:510:2cd::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.19 via Frontend Transport; Mon,
 24 Feb 2025 11:45:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Mon, 24 Feb 2025 11:45:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 05:45:33 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 05:45:15 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 24 Feb 2025 05:45:14 -0600
To: <buildroot@buildroot.org>
Date: Mon, 24 Feb 2025 11:45:08 +0000
Message-ID: <20250224114509.3416189-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250224114509.3416189-1-neal.frager@amd.com>
References: <20250224114509.3416189-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|IA1PR12MB6116:EE_
X-MS-Office365-Filtering-Correlation-Id: fddec858-6c0b-4030-e57a-08dd54c8c172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kqVbiukkNgAqRLtvAkouOgQp/UPVTIKDCAklBxceXXNrZTLhyR+cipHCK03H?=
 =?us-ascii?Q?PLqgVlSml35sQNxhG+3KJCkOKFLXhQ8L56Nfxwvx5ONJHSbFKfuyuciswVMg?=
 =?us-ascii?Q?xmruLsSf7eVM7m9bY2RVWog4iz2hASbC0nFrBk0KvuXAM0HcoVa4qaSgHyPo?=
 =?us-ascii?Q?GKyHFN0bqIa1Tz2kegRHkModAcpJ5rLycCFqGaFPrgMqTI1hVGmEnLEaSwgb?=
 =?us-ascii?Q?5yh4CkaGA9Zqpqu0CYpeN89RSBotuxRGxBfY/YEHRTAb9ZZtbxESITAgcEz5?=
 =?us-ascii?Q?VWwfgCjXLvHJyMAIUTYlhWIZtxAU+LJa0lRxeQ4ZHO39xzeGc9s3dF4KurFf?=
 =?us-ascii?Q?9MYk5nZeygTqg4kQWJzfnoZCl7kcfA1v1c3a2QrtZ1VouB4+54RTSRybjofx?=
 =?us-ascii?Q?tdR+iKBms0hNUGJHqYQioS4bCawj5y2GG0DpveREwZgJIFDdpf7IVl2SkySN?=
 =?us-ascii?Q?wQwD3dn4dFUvYn1MiMzcLWkDANZH0goBeYY2OKJqoYA28rz0Ehchsh27eB9Z?=
 =?us-ascii?Q?UUO4ggwPHIFgZI7Kg5YSzFQtfID8rboCb3drYVNg13THA/Av7GGrqS+Dlb1R?=
 =?us-ascii?Q?xt9aY5KwE6fi7uzByGosHDKkagftcZ311drmDFwB+VoQrVsPE//3SaNEtb41?=
 =?us-ascii?Q?e8vWzgdrraRQfPJMckBxepIycbMOMZiZiRfhXIxai51C/ej+B6a3hFBGiPqu?=
 =?us-ascii?Q?1+gZIyInqfzy57R0AQthoBco0OD+aGp7dQkOSOc1c+kmm/bEi8K2tbduqHYJ?=
 =?us-ascii?Q?RsrokmsVi86uEVGz0KGzyYhVfOzzYu+jvyrSHmOQE0tISu2t0pVT/AIutqwN?=
 =?us-ascii?Q?KuZ3k7erSz8S+q+4xAHlrFlsHPRy1nSCXIjXDKW2T34n7Zf7+/sNYVggkQFp?=
 =?us-ascii?Q?xDdYWPJiXLYhpew/O0wlAh8zwBFgth9FyqhzxZkjOXC/Cmc/mdAv4s3M2D0m?=
 =?us-ascii?Q?dTOrojfP2OaL6HicRuWjbjBJa4Fb+7MKF18gbZta9U2WLHX1Pjnkoy8j2BV6?=
 =?us-ascii?Q?Op0nsvjkD2WzDivsAz6yekc/my9g1Pn/4uyq25i3wIcSPjdTI+9uT+2uSnXY?=
 =?us-ascii?Q?WT60siVWZSo//A8xGVtJwZAvyYobWex//nf8BabOL2XCK1+EUebGtlpnUr5m?=
 =?us-ascii?Q?5Ku4uynQDBBI8b4EQziEKWZ8j3VFxaAV8o9gXu+6UJp35+6xTxJQzq18EuGK?=
 =?us-ascii?Q?dYX5aSZAfGhnk50SwyjW5F9STk0Yq0h7sN1uh1eIFtqmvwBTk3lSwbKzIPq/?=
 =?us-ascii?Q?3hP3qPl9NnAiHyJj/mElV5uveUT4z1UlRufL5VgxQGxiduDXQktBFdcXi/ZW?=
 =?us-ascii?Q?s3RtwZA5oWoWLjnVDaDOzzTftAUqIz5zg0Mh3wsWHuaQOPPHC2QUYtadv078?=
 =?us-ascii?Q?WU0esje7si+1a+L6sBi+vxQKALQ9XAAsyV7BTvaj1JgRXezsBuCsC1wm/P0m?=
 =?us-ascii?Q?/aGSRIp+7MS9OXDN2KhZqDN7/kl89FeYFt1ieE6dp8MTkZxNL/Tm1+GS3OJh?=
 =?us-ascii?Q?tMV4EJoMzLRbgCsC7YI28L+UT1J7FQEWFL/U?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 11:45:37.1266 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fddec858-6c0b-4030-e57a-08dd54c8c172
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6116
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bss72Ywprn4UIQE60tmq88ONNexcpImem/RCwkIoQAs=;
 b=BacnATFSIMsU/f7FWEwEsbUjbthK33PNxvR2/RubrKFmSQ8zbYorgCLDITJNCaXUp3zlknI4BoY3jUO61Lw72VVTRRCb7J8f+ful9nwUN+xe/gQ3A3OWltPDlYzJLX+22ccsVCb+Vt+IOdD1rpZMHmd1DbGoOhuDj4NcXt/fvwk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BacnATFS
Subject: [Buildroot] [PATCH v3 2/3]
 toolchain/toolchain-bare-metal-buildroot: rename example vendor to
 buildroot
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
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that xilinx-embeddedsw is compatible with the toolchain vendor buildroot,
this patch modifies the toolchain-bare-metal-buildroot help example to use
the microblazeel-buildroot-elf tuple.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V3:
- new to series with V3
---
 toolchain/toolchain-bare-metal-buildroot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index c86c5d725c..19c97410c6 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -10,7 +10,7 @@ config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
 
 	  For example, to build both a Microblaze and a RISC-V bare
 	  metal toolchain, use the following definition:
-	  "microblazeel-xilinx-elf riscv32-buldroot-elf"
+	  "microblazeel-buildroot-elf riscv32-buildroot-elf"
 
 source "package/newlib-bare-metal/Config.in"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
