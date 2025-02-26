Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C40CC18E7C
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 15:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F11C060FDA;
	Wed, 26 Feb 2025 15:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdFGviQbi05k; Wed, 26 Feb 2025 15:13:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F137F610AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F137F610AE;
	Wed, 26 Feb 2025 15:13:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F3D2B94F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC790412A2
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zx7IW_K16VFe for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 15:13:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::627;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DB60B4129F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB60B4129F
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::627])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB60B4129F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZwN3sRnLcp87IIzVGS8B14pC5soFTCg+M+l/DaelmUKTTo08VEdoaE4gmu6GS2Sc+zADyxL6Ky/BHMtsJW1Rfjepp4wNxqYsZ4nNa7YGhBn3vfp5+Q1W0eURQqIVsSgxWDh54p2xi7mqUFmzEc5Lump6LY18ZDRR6iZxAKXAB46uoepNdS1z4NUyGJgA8MbQwU5F5j/or3qHJ2wHgnLw9LAAMCIb1nRl0XpXLkvz0Z/TH1c36Knln/Sb0iWG4kr4pW7S/YMNZhpyCjNWZ8ceMWKnh4VTsTETTJ3aibXMNPzuknJhDATlhcSogE7TSYQ7XpKwfFk5pYP/q1Pqdcm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpuSPm9uEqZt2dFrM0lFalswhQffx8zr5Oterx502g4=;
 b=XByH7Qkls+/EvKxK6aZ1aEatP2twRGxn8wkpuMU/OUj4yVoWxdxPrHCgTHUaAjIeZ7rx1LMn98+Z6eXvoDmXrHcwPXheuIb1tU9mlIHeokmRLlDFJ/b3/C3/5JXxKU+HgBIN9pj84lI1mqdSQ5wmGHUL9s/9/1OcYsSyTWxIu5T4vPOa6A7F2UxlZLj2qnLJE7pSvkLuFL4ADFDSRd0FOHwBpui5ok+ZVkj6WwED11zSU03THfW0o9QqgEJ9jW7jHLueMCUi4ZyiJKvpYOh+BctNaQVMQP6J9v5oHYMFyZquB/rn7bZoNohUBcD2tosCfSfL43JlnPI0M9kAZcEeNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR06CA0011.namprd06.prod.outlook.com (2603:10b6:a03:d4::24)
 by LV3PR12MB9236.namprd12.prod.outlook.com (2603:10b6:408:1a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 15:13:37 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::89) by BYAPR06CA0011.outlook.office365.com
 (2603:10b6:a03:d4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.21 via Frontend Transport; Wed,
 26 Feb 2025 15:13:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 15:13:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 09:13:35 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 09:13:34 -0600
To: <buildroot@buildroot.org>
Date: Wed, 26 Feb 2025 15:13:30 +0000
Message-ID: <20250226151332.2538312-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|LV3PR12MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d146ad-30b3-42b4-dfcd-08dd5678249a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Gs2cTrvJROurZuysk6nQBwZhO5zh7M8g6Jz8b6pdyAWcPisx7J1IEKgizx7s?=
 =?us-ascii?Q?7CoT7Ji47DP9E04e6Evab520ZHQQJaYBebFW5AiuM8FVGspqguLt130YHqcU?=
 =?us-ascii?Q?hs5vZUYUsLd3rE/pAMpqmdW0B8eV69wnZ9dLf/Z88tOb5aLCtlWZOA/huz/V?=
 =?us-ascii?Q?DbsZzqNtr7tk+1T8Es1amvJHoF8wrpK/A15Cj8BUOC+edznQDS4OdGXhvIy1?=
 =?us-ascii?Q?R7o2h5HIJB6asUpaBuTURr6jbLo0Il0JRRT5cBtff7LabuuiYMUB5vkqZPGp?=
 =?us-ascii?Q?pwJheA6RrzkoxnDFN803XpPJ214vZzgd+TIJiEJevOVZPhlTbI+FRrfBmgDO?=
 =?us-ascii?Q?GRFHkqHyjwXAQmmb6LHmWQVEQ8Ax2891c8fvgdoh9ro+kXfZ9I6v+Rkut3U4?=
 =?us-ascii?Q?CoKGYpNA+mpfin9r4Ep6Q7kDhVZsjocV0Pktqa6wvCi6Pj4jbIxrbQw3V3+H?=
 =?us-ascii?Q?WKipXho7f7GdFV1tJNVFKCJr+a9gd6ARRWNHGEXZR9TddhpD5B5QkvgLkwiM?=
 =?us-ascii?Q?AEYfkXi/4T7P88rHd4EnxAmyhUosnxlr+NtVYl9h+rq0mlXxp8h7Urvj++KA?=
 =?us-ascii?Q?Fif98fz1YLn3FhVjfXCN5x1oSIO4+YbqPTZz16xreQtmCD5MSDYgRaSVd1hX?=
 =?us-ascii?Q?th7d4GD8me1e4DDcVQqiZHV+S4TLnt5fjWCGRs+X1bwxL6WWaSanZyAY/QHp?=
 =?us-ascii?Q?nH63nVgid/A9/FHkodW4dQLV7i/Ddc2noa9jVv5PF1mihnF36n/2elkwFb8v?=
 =?us-ascii?Q?kPeasz7GWIeqwBPyFkTGvE64AmE7O4uIJp9jWjr6v4VDeKwX14IobSXNDIbz?=
 =?us-ascii?Q?WnKUFslygYixTk5amxThaSM+2bFVIjZrQw/D5K7yehu7306y3CLwRi5fZopP?=
 =?us-ascii?Q?OSYIEORIEfaCLlot90zxkec7rfxPED2UQnD/4tXHW8QoA72C3CFq7aN1astl?=
 =?us-ascii?Q?D9ayNMoPbRafqsrFFjEh1rxcMtjOBprzRFsEMu/5GwOARMmNNHS85iWYpbhR?=
 =?us-ascii?Q?vWEt71fm0SCEklhKX6+Gwkk4t4v8sGraQYZFRRLR/XBQlP3v7utQcLczZZRJ?=
 =?us-ascii?Q?Mlnt4eJ17FUCcI9rhCTda0TkI6HqYk7d4bBjK+YnRk/XFHP4J2WA8xuYchgt?=
 =?us-ascii?Q?hPEqKBdNrLouTorwz2TtUkPJlU9AKQOD7a9g5Dd2ge4qHXeIeZG/Y90bLI5l?=
 =?us-ascii?Q?lwThZJqJ8NuQLmBQrospkWuqqMrEJ4ZVym6E6t1aj+BoN+hJ+QmUwpxGnEFE?=
 =?us-ascii?Q?fZzrlaV7JpbUTGYk4PaxUYCvUHiCWMBvkZ21/rsssap+xGA7394yOwOH7NbE?=
 =?us-ascii?Q?B6m+xUN9PIXiALZhsEiT2kTuTq7G0ntMlwoa9GiTSdyFEjEOPvwVzhAf536i?=
 =?us-ascii?Q?6SbuBNwdFcdjQ8JepC9ipuiVuj4wGcbiv/jcSyKUh/FTyKsGKF3S6UsS1Us5?=
 =?us-ascii?Q?UoXxi7kRGY/DvI58UjoOLg2XE4GJmlFKqGi72AdJdlSdwhimk+aX2cQ/ayRR?=
 =?us-ascii?Q?y61uG/rH9WOxhkgB+EwOnu5Pl1dkjB/0rs4M?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:13:36.5109 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d146ad-30b3-42b4-dfcd-08dd5678249a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9236
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpuSPm9uEqZt2dFrM0lFalswhQffx8zr5Oterx502g4=;
 b=Q3+qhQCxp2WjTPGAiCM3COrUWuJpicjXTioh6TzRU5aiGVPJdudPRA+JSChqxDjj6SFsnt0zRqz/RcmKEKkCruW4UgwGq6QklOEhI1CqRYxxPxwlqN35DzV0AEU0Qj8uzr5epkNJjSaIO6woyB46fXzfvIpNEAolrb1cGRvVFOY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Q3+qhQCx
Subject: [Buildroot] [PATCH v1 1/3] configs/versal_vck190_defconfig: bump to
 Linux 6.6.70
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

This patch bumps the versal_vck190_defconfig to Linux kernel 6.6.70.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal_vck190_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 0967407304..2f40c210a8 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
