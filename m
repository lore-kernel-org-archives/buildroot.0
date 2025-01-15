Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BEAC02185
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 09:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD14541612;
	Wed, 15 Jan 2025 09:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x1liw0a6tH7g; Wed, 15 Jan 2025 09:50:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF6FD41601
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF6FD41601;
	Wed, 15 Jan 2025 09:50:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9611C94B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 09:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75612415E6
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 09:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B66Rosmmtrqd for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 09:50:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::600;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 40925404A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40925404A2
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40925404A2
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 09:50:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=apHezVcRp29t62VAuZOXJ17gP4Ldo4/41KZAHDAOogmGk+tfWzYTRQ2x2l+lNAUe/5J9XY/5RytmKXV/3NoOeHfIRTZd295MIOl+/s/vwwkz0t8rtnwYUjZyVYstDRCf8K8LRiWZ6W3P1BgrWpaY1ZRYjewvwhRhZVei6rHirkWh75RGFOK6PUEuXOuMpEZC61KFgidyeiHEaY+6U+gdK/0vJM8ni7bw4hf3mQKDTKOV8DOCiUIPSlQKNso7XOKXtgICbeEUldcOdsBp11O2SNPawIljNXmPhRmL5xli9mXw+w5p6Bmk6QEwWtc0COPEvhjmTtowkCK1RyNvUnY0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aofypatGOjH8Ap7b+JCqkEyT4Tr0KlgrAZQWxLPkH4k=;
 b=o8nkUCSNraf0bXsp6yLDvy/3f9KjAcBeh3iM1mhiMueyae2s3OTqYHV32UvPSINDt9TNnUcPVGQ0hM28+EiZjKISNqOwTdlrMor6Cg1dbUIfcpsceW6x1B9d7Ho0b6iGAwAn2ZNIbmZ5SRnM/pWiMjt/r1RQcjlwIMWoq1z4k40TC+wgVMIfScVaiKV2CcUFonzfqt4gp00HqJf2yd06ChTuKtkNDbPC7i/EojV2N7xeSt1T9AbNsaCUIBPwUoZ+Wb1UNMj7T0/wVHaVRFSrhi56n97BeXb3TFKPIDz8qQgRHVp5Dj3AzPhLwtDZZ5NKv//pv4X1nNwB91c557XhSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA0PR11CA0028.namprd11.prod.outlook.com (2603:10b6:806:d3::33)
 by BY5PR12MB4289.namprd12.prod.outlook.com (2603:10b6:a03:204::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.19; Wed, 15 Jan
 2025 09:50:04 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:d3:cafe::f0) by SA0PR11CA0028.outlook.office365.com
 (2603:10b6:806:d3::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Wed,
 15 Jan 2025 09:50:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 09:50:02 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 03:50:02 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 15 Jan 2025 03:50:00 -0600
To: <buildroot@buildroot.org>
Date: Wed, 15 Jan 2025 09:49:55 +0000
Message-ID: <20250115094956.2468555-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250115094956.2468555-1-neal.frager@amd.com>
References: <20250115094956.2468555-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|BY5PR12MB4289:EE_
X-MS-Office365-Filtering-Correlation-Id: 17114dc0-08ba-4222-a273-08dd3549fbd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+U5LE7BbdTnMlAYOrn7gEXy0KBVjg7HRcZKghJKAuIdqtncN6ZV3BbLsyX4D?=
 =?us-ascii?Q?BIPBHcCUIT/cZ46iGfqgnsBfVDJ3DbH2c24arbKm1IAm9evNB2xos3+CSt3X?=
 =?us-ascii?Q?hUbh/SStiXJcVvvMpChArMMBZr0oWHqP3vORkUEKqVGVwwqPR1jXKOm8+Vt3?=
 =?us-ascii?Q?SYNX2NkNbeTUzL11Lnnz+o+WSguezJhqX1o/EPKZ9PnEsxHboQrwjdYgBGSY?=
 =?us-ascii?Q?Uy2ucWhQmmxTYBua5uCIIi99nudkzU9uxoGffoyJVWZFrCwPRWwl6eNeEUbb?=
 =?us-ascii?Q?I1h23M4Q5FSBcUsU/4QsQWsOXKs8k0qrH1bF8Uwph0+M9rG670bsXzS+phfU?=
 =?us-ascii?Q?0ZB0DrXdCLBRJrL4T4KunoGHysO3vfvB1VkDEcevPR6XE0Sg6AfxJ7BRCdyE?=
 =?us-ascii?Q?YtzLx1h1UTocWYAXq3PggYk0caGa2VlMKPjtI+BfaqDfcfHnxoGpGGyG8nuz?=
 =?us-ascii?Q?mGcHHPvv8q+neGQDznGXDqyIReKMXbtGKxs8PSaMX6MIIATETJKUIfiuktya?=
 =?us-ascii?Q?TFSAvENyZgSPkm1mEUpwaQ5vCNY/i5+g5xgibaoP3bDJHM+pt0Jw/Fy3Lgvh?=
 =?us-ascii?Q?jLg0xEEC2n2VLRdhAiEPNyviOgB4h7SR7TPh9AF3dj/j0w9FZFO8cet7EkjZ?=
 =?us-ascii?Q?PN+RAPjdohsXbK5I/y01+3FQr17hxre7JRBNPHWIkVIG7QOKHJiRDqauQd/u?=
 =?us-ascii?Q?CG0tNy746poYc93J9yo9JqUah76toiKyNNVSymBAXMWSn3+fDwn5ys2kpDx8?=
 =?us-ascii?Q?qI6YF3F0aRJ2tAtqy7+SCjWqCRORYjS6rw2ekvObytFbIuJjbq65CS6ITDZY?=
 =?us-ascii?Q?6ByX1dJ+ICCae/94GxvNuROIrvP1ZXJEp2wCRHKJ9G4HfiwjVXt5ojDXHUl8?=
 =?us-ascii?Q?rPhBMz9hklrcE1aMOBd+xwguc4SI6BP6Zrr7bLFFGtP1gU7j8VO76+MAna8w?=
 =?us-ascii?Q?rGhyP054lsqkZMy9n7hlwhMTxLNw2j91d58GyLpsrT5MA4/y3XOMpDQgvisF?=
 =?us-ascii?Q?Iv8OEkc00fGV6Ko+BENPu+Knhif/N6jwGcmSKhYiwFxS/LCz7wtBr9NwPcMM?=
 =?us-ascii?Q?c2XThaJ65nozNGQRx0uRXuRt1wiwxvjYbLbJ3xBD/sxiySDnfnz6FYu2mgyw?=
 =?us-ascii?Q?WHXdjp9pxncepw037PNFSxTPGzUROtQu0EmkMdhDEeElfJ54jW0xqDFNtDhk?=
 =?us-ascii?Q?75ZZR48cZLLF1FpV3wVvjIjzXVJMrhwNB3d/W+yPcy64i7OhphTtShNa9HnI?=
 =?us-ascii?Q?b/SNDTUeZpmgLEgTqyqYpCOd0Cl+Ea51ovaCelcvgaZhcNhUM0CSeJokhsLG?=
 =?us-ascii?Q?UJDlGQWhCG2AaJXtESXFCyMs1L1Rk/SLYtg7DL0glFeLEB4c93MwoN4Tuj8Q?=
 =?us-ascii?Q?gwaIByb6oROHCDA6X6cCUQ65LkGFd9QpWDUW8euQxAI3xyrtyEAuD1REBjUL?=
 =?us-ascii?Q?X0lRnMiChk8LkT0DQZOckiblnK3xHfkbmpdrkZ7Fts16Z2d3JbKtdMEi7khE?=
 =?us-ascii?Q?ms/pD/XQQJGLRUuFWu/h6POY5cGf2w4gdh2/?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 09:50:02.9467 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17114dc0-08ba-4222-a273-08dd3549fbd2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4289
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aofypatGOjH8Ap7b+JCqkEyT4Tr0KlgrAZQWxLPkH4k=;
 b=Cp1AAXbqntT4xbQhSEgXDRqRXA4h7hqIVDC+qC34c1SUZT1bYgmEQystQI9t579QO1CDH4w4IJfUUyEUXvugBPaOHFQTZoDwIWt08zn08cNI+Q8m12UtSGdXW5KsUSgC46yLP0B/NoWXiZKNviv6g30Yk4AyrgVfoaRDiMkuswo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Cp1AAXbq
Subject: [Buildroot] [PATCH v1 2/3] configs/versal_vek280_defconfig: bump to
 Linux 6.6.60
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

This patch bumps the versal_vek280_defconfig to Linux kernel 6.6.60.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal_vek280_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index e90408e6b4..0ca9d30b2d 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
