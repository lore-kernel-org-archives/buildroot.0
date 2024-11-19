Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D77D4415E
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 13:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09817856BF;
	Tue, 19 Nov 2024 13:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOZDj6T9Jl3U; Tue, 19 Nov 2024 13:49:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20394856C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20394856C1;
	Tue, 19 Nov 2024 13:49:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1107DB2
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 13:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91FC24ECF9
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 13:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5C2FscQnCnQG for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 13:49:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::614;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A77124ECF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A77124ECF6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::614])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A77124ECF6
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 13:49:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLa/w6DnJ0+jSXTPRZKTSVu0I0Z+wFYaiDxE8IijkKFfbDRaWeKsk/RFLItZ+wiZhMbnA0ycSGqFt+ZhfJfnRsGtoPmjUBc+1S+t+VLJOjghkWzXMJwVOQ1ROQxaI67ptdBibPdkyLvhFdxqycVyypjD+d2aj4QAXwNx3HNT1ZytoQuwQcHwlgsZ5WuIN9lIGNV0XfkY/9PokIkSsTMtqgJFtLQj0sEOpKoe1jdfKm58xlhlv+iP+C4FlwhsQ0wqs0GgHnqyL3LVzsVsxPMQKHAuIOpqF8NeUFshNvNdCwubSiuBniTRw2bsSg9eQIE+qcP9SyO3wJOEeA9Q4wgS/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=feMEau4/CAc2QF1TeIPxvzYFy4m71OMB65L2+dBOsOA=;
 b=ZALZhDdn7M/JczKoS78s/PfU6NT7IrXF8R24fjzYJWsUnlLE22c5CuCOcrVJ+xphAZHUeYSEONA6TiIV24HTGO7Io2tDNfvEJPzgBnrKJPzl+luYOPCU+eYnv8ihBngh+M0qcgbDUog7SKqTyK/YrcbdYrSpOMIdxBoOjD0Tgf99VyGMGP56Py5k3OKJPYxG4NNpYa8VVAzEJA8h8ksQXeUIbyC4ywxntP7ECg28wxojA4fm1zWlBtbm4moAnurEyRehEwMoeePfzd5BedBw8HmicmuTVJPnKkvoWZYJPxDzPesMIdndSKZ3pIpzpqGAnn7rSlwgFS91aMyr3CuM1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL1PR13CA0289.namprd13.prod.outlook.com (2603:10b6:208:2bc::24)
 by IA1PR12MB7543.namprd12.prod.outlook.com (2603:10b6:208:42d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 13:49:07 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:208:2bc:cafe::91) by BL1PR13CA0289.outlook.office365.com
 (2603:10b6:208:2bc::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.10 via Frontend
 Transport; Tue, 19 Nov 2024 13:49:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 13:49:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 07:49:06 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 07:49:05 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 19 Nov 2024 07:49:04 -0600
To: <buildroot@buildroot.org>
Date: Tue, 19 Nov 2024 13:49:02 +0000
Message-ID: <20241119134902.3894638-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|IA1PR12MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d0e810-a512-4a1c-4f6d-08dd08a0efd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cdF9uoVk2Vb9SWE3Bl+/xTh9H9XPjFblMiN/ZKonsVZDZJb3I3i04QVGSrZX?=
 =?us-ascii?Q?P11V9hZhZKYpnECl38gyeSdoy1Vy7Y1ZYfxh+9rsDeWkkYnNgEfiMr8EnsDW?=
 =?us-ascii?Q?DIaDiUwz+Fhfakces1PQTNC1657w+cdZcWKDDLKrGiEukH+YOElwfZ9t3L3y?=
 =?us-ascii?Q?6J/DTIbcilfBg3tpm9z4rZKE2OuHSkYaSGChN2WpAos8reUmL0d5GqKX3DgH?=
 =?us-ascii?Q?cPm5JmJnGp09qqTWvJNMQOtiAcl8CS/xccqr1UQlHa0MqUAA8jvjOQfW/sRo?=
 =?us-ascii?Q?5MV76UEPwBLObquqUk+hOx2zsqpi09ZA7ZL8yF3Qi1AiLZ2DLGGOQ05Rt5qc?=
 =?us-ascii?Q?bxypOK46ROG0wGLkd3hfjjuX0zwl/DezE5wTbU1wTcVbRHfAcmilaZ3mivNq?=
 =?us-ascii?Q?ErT0mH/tyHH9sB68zXzLqgsDogxKS2JWaTeLmS5VQZk1iDt4vs8AtgAdWxdl?=
 =?us-ascii?Q?QjyapAF+iKyn2GpjMCAsLlZGs+1ozTQghAkJVrkqp/CQzLON6rGzJXMT0CPD?=
 =?us-ascii?Q?4MeL+XJEu9UD7OkW6FtfmkqgxE8w1KHUGA+n1nCcyzn/Qqv3CD4iTRjI7aE2?=
 =?us-ascii?Q?/bb0HNnysT2VdUvw/qsNglbQ7fRnEKyit2zLt5ehKrZBNFsFM3tcVi6d2U3G?=
 =?us-ascii?Q?Mn4QQQaUpMT48p2lC7u0WT6rFR3Mg4aAX140ToXu4yUYBqsKzr/9tCzHSDIP?=
 =?us-ascii?Q?7ICow7f+rRmUldG2mivRptPMJAhZsnp/qcSO/3MBfGoCiSzISHb3aMhviEEj?=
 =?us-ascii?Q?q6qkyDvmMSZbUkMmmZmxL16Vd4XSI7O+iYNVu8Xmy6zUADW3H12fdHBAONcQ?=
 =?us-ascii?Q?9NiVmT02UV9JofWFk8CknyTkSlqQ5ozRG2OtbUq8cYu7s6/hJiU7lM+c6O/1?=
 =?us-ascii?Q?QEuWHwqH5NxjuUKmXTUVs0tCt8IfUtdRGI+FkGhvry45jgP5WvMSmjBsA6b1?=
 =?us-ascii?Q?ZhkDJ+G7cD0OsIraWWAgxp8uOC0konZa9j3Akq9mvCX9QacmlYPNs5DQmXVw?=
 =?us-ascii?Q?pMsMVc8CxtY0IVLKx8C6NHAIDmuCDgJDCHnhKtQB2p6FAEY3c0puLvZD+ORw?=
 =?us-ascii?Q?VDOcfaYHdLACFGJZvEa7k7h/YspSA/r5sY9MGw5BK8k2SkVvORSG77DZQI4W?=
 =?us-ascii?Q?InvgfgaVMKD1H36tpEDpPrv6TGNauN8NrSDfSJojUEeWGFjUF/qTLxBSrBKO?=
 =?us-ascii?Q?etGl3jy4QmMO8AvqA8lgXHzN+JGaPN8LX78Op8d7iiO/LJHecnFQ6g6m474Q?=
 =?us-ascii?Q?l4dt4Xztlm2mdh14RB+b6nibSbqSex71+WId9MNxgMqe0UMCK664HZZBAZoK?=
 =?us-ascii?Q?JEVYzBFvzj8efNYb1Sw/OqNY3T8+DU8G+wJNCWiwqtuvfW+llAGQbxjrCcdv?=
 =?us-ascii?Q?fA7Zmhbp2ZSUjJBoSUzS0ZChdJDYff2A0+RCuJCVPiVtAn60v74v82LqemrT?=
 =?us-ascii?Q?zXtzqKSvBiSpIbAx49lDvpC1cSzCqGpn?=
X-Forefront-Antispam-Report: CIP:165.204.84.12; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:atlvpn-bp.amd.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 13:49:06.7573 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d0e810-a512-4a1c-4f6d-08dd08a0efd8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.12];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7543
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feMEau4/CAc2QF1TeIPxvzYFy4m71OMB65L2+dBOsOA=;
 b=MliOrte8UHxbfSu4H/rDFfbj5f8wg79P+u/l0Z+XHFA/Db50PVQbZW2ymYOZDNbSG/nt2tJIPOKWuQ/QOGWYAn8ZQZEOHsK5Kh9i5dDbD5SYEsxsJ68d5pBIQOhLAaQs0oPpR5E2f0dtTff/0oxcis1tFrACElQ2wMgK5zfJL7s=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MliOrte8
Subject: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to xilinx_v2024.2
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump bootgen to xilinx_v2024.2 release.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/bootgen/bootgen.hash | 2 +-
 package/bootgen/bootgen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
index 506aae8a84..d040a2e280 100644
--- a/package/bootgen/bootgen.hash
+++ b/package/bootgen/bootgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7879c7d40642bcf7adcec177a51cf73f95bd45d315f75d125d3fc1680c0a9b24  bootgen-xilinx_v2024.1.tar.gz
+sha256  2c8345a3bea4fcec6ceb6c8f8e727a610aaca3ec71cdf7f892d7f89f88438650  bootgen-xilinx_v2024.2.tar.gz
 sha256  4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a59aa3  LICENSE
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
index 912e2e31b3..51eacde462 100644
--- a/package/bootgen/bootgen.mk
+++ b/package/bootgen/bootgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOTGEN_VERSION = xilinx_v2024.1
+BOOTGEN_VERSION = xilinx_v2024.2
 BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
 BOOTGEN_LICENSE = Apache-2.0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
