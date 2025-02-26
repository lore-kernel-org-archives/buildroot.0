Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8CDC18E7C
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 15:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3144060FDA;
	Wed, 26 Feb 2025 15:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11pPHMkh44vp; Wed, 26 Feb 2025 15:13:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24E4C600B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24E4C600B3;
	Wed, 26 Feb 2025 15:13:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4223C94F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CB868361C
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBOJq-TS026c for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 15:13:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2409::602;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07FCD83668
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07FCD83668
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::602])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07FCD83668
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kY+jTkDcuvYA1OXGi+OOo2sX0rQYWhvHGQhGf5/LyMJDMO5aTn11xiabUELyjEckLvuo4y2k2i1LJBahvhRCaRx3bJxasL+j+d3J+wq5fm1oxpPKKu/DZh/ohhLojOhF6Wh7itLE6VEnBAIudlrACN8+u74ysUyWxCnQz6h0wFnwT4U1LBrY+vo95MrEaI3JR6bGLu3cOgGqvqby7VSRB6m+Fi05IJptbA0vQRbz8LtN6QEiUi0ZuTXnPpfrdMa/YET6VU38azavojE4VzK5eTVU6hfvIcu79BCcAuIek3JgHWeVPq9PKxdA3LrZ+rA5/ACC0XFC+W1cdds1gqhdAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uup+RBxFaEzotEvkulQV6uJu4Kx414OSKg9W2e9bZ4I=;
 b=mQF2vaZViZJCbnBOjiK3Tp9BQY3YTwIa/tKsPbo2UhMZrEgAO9DQ84Dt6TeJNVbijsQLLl2jExN1v/c0UEObWSDVw6chdobYVfwQpUDQLPUkT82dKtXV4/w4eq0bwfR7q2zVjHK5NrdR92YXRBRUDMPNNBY9sxjvbuegWChbOOzviOXs/35nrcKDV7rQIrbvov4kRHxQ7kZcuPeqaeO+BB8pS0ELN29Gwjlys+nYwmQqfDuTbFr1IIZ+gdo1L/czFmXiVvYPv/rYYEwT9FkNSWMFzkDSV1HV4rqbmxuAz/zdcralW2CeWdWBXzn0ctxy+kuW7sM/RvT44FaQA88dcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CY5PR10CA0014.namprd10.prod.outlook.com (2603:10b6:930:1c::29)
 by LV8PR12MB9262.namprd12.prod.outlook.com (2603:10b6:408:1e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 15:13:06 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:930:1c:cafe::a8) by CY5PR10CA0014.outlook.office365.com
 (2603:10b6:930:1c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Wed,
 26 Feb 2025 15:13:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 15:13:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 09:13:03 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 09:13:02 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 09:13:01 -0600
To: <buildroot@buildroot.org>
Date: Wed, 26 Feb 2025 15:12:55 +0000
Message-ID: <20250226151257.2536298-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|LV8PR12MB9262:EE_
X-MS-Office365-Filtering-Correlation-Id: c4b605ba-381c-4ca5-8322-08dd56781266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EIVdAGZGua4fi4e10VMMPGTP+xvtMRJhXJ7bYo/D9Jl37Xyyl6vZIgvbIUNT?=
 =?us-ascii?Q?PFO0j+hzG4ZN8qjxfOTxp66A/4l9HrFGfwqfx6tLuyQ++N0HVXq2vti7p623?=
 =?us-ascii?Q?7WTQo5p2Hw2o/DavtGn2AcKraBwwaUqqGtM49EjCh2p4lMu4c7VpR4nD46i2?=
 =?us-ascii?Q?Vdgu/+D0q3/5aMfk2U9L9ROO/X5pw7IyUSRX56dtmjaYcMT8oxjiarJjhsbQ?=
 =?us-ascii?Q?zhW/V1AO9G+hlq7xUg/6K9l1yJ8L/ToY4oGtUTlsbFj0dRvBUTR7AZrZ5H3B?=
 =?us-ascii?Q?4YWBmnIq87cHQ4bLeHlLuY2JXI9df2Z095iRYOSc20E0fCNw/u8btxaQ5fZ2?=
 =?us-ascii?Q?20QsbE0lWW2wMR7CIygwt64avgtmw18A6QZqRL4ZBQg50IifnhigCjSP4zKz?=
 =?us-ascii?Q?MG8j8PRdnrDpw6l5kF1BFV3qk6SwEEAx4RXe+OigFXjI3nObkRgpxptLD33x?=
 =?us-ascii?Q?AcVbOW/Hpwi8b4iti82U8eqhzoPvq46pj1LsviHLLrKvBttsDY+wqyfqEzxJ?=
 =?us-ascii?Q?5OjElR8iTv8VwCQtXup1uZIZnSExt7pYo58GzH0jQZhU5YXmr93X4+Ch97hZ?=
 =?us-ascii?Q?++pAYltpK4NqrTJv4PaGqYri3y9pmyvhnUXscjbilwnBi1WEw4pfDVCTvFv9?=
 =?us-ascii?Q?a0yDRlz7dxgSnDlnfHV0XNEuFVUG0OygnbIXcadVn4NpIoyebPF84dmkWAts?=
 =?us-ascii?Q?2IHF0Bg10WLG44HEbDU4lV08OBvnUPSf+HD60/FQ64VSngBuuRxE5AS40Yjz?=
 =?us-ascii?Q?anZ/HGTjmCjs23+VBE/bhF5w7YkwBSBCW52xpipO1tWzHN4o1X/GRGDZYota?=
 =?us-ascii?Q?uOXw1m3jUb5jn2GtYoi2/5l24h2eDpTaEhs+cHkifROgBQbX856a9cbgdK0d?=
 =?us-ascii?Q?5vuu3U0jvK8YhQqC3k/mb5Q5jnoUQ6rAixfstmE0WGN2qlge7WMg9iN0pp79?=
 =?us-ascii?Q?jsfywTqgNdS7HB1gqnNrtznDta8XHYDe7OZHkv/C8NMDFziim6ULQxj0Aa9G?=
 =?us-ascii?Q?JmnzYdP1ZEw9KYtPSfC/L1eWK/zzrVDkDwUQkiCOrzzYnLBmkvBMxWv7dakV?=
 =?us-ascii?Q?8cVNSamKwJLh9q6s+cqJZl0sGYje77dbC9ncHwl2rd8xAw09eQrjYa7D+A7g?=
 =?us-ascii?Q?ga7Wf4/mOohrLKSFlv78lrgsHjSW9eZpk1mWQO5TOGpYTO2eiFc5rz4SbUjC?=
 =?us-ascii?Q?hyuI5TwLxRkzVL0oJgQep3n3rqsK/DAKcmZW+lGkuj1RB3hX13wl8b51whP7?=
 =?us-ascii?Q?WuL3DWGP3F9EmTHCH24pmqTUfltJA7wKXJtp74lBaQLBTnxxvkG6juW1aPDb?=
 =?us-ascii?Q?7MUI3lcv95w+S3A+G23OELD+EZs1120yXFrd0Fu1dT1ef9KPM50W2BvJ1FG1?=
 =?us-ascii?Q?3YRpDnlux012Dg2mui6C8BmYaQxZT56FU3FRxzR/za7PvIlfujqloAX8oAXV?=
 =?us-ascii?Q?b5Pf+vZco1th1ExvTr6UVddz3n/5+WQupC/Jt6HP88AkQUOPtMtChIKJu+cB?=
 =?us-ascii?Q?JQ8kqKdqU8idDbQlgj1nZJd6UtEy8I9p4qi9?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:13:06.0157 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b605ba-381c-4ca5-8322-08dd56781266
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9262
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uup+RBxFaEzotEvkulQV6uJu4Kx414OSKg9W2e9bZ4I=;
 b=UHtMKgWRn55slbpKFzXXelOPjZvx1pNQhPM8awx4pu4ZE2ptOvtLFuzndabrCcvHGjDt+H8T+aZoqe1rGUN+HcOfYpBXNsbgwi52Z04S8dc2iqd1HbcYRL4rEm3Dj8r8H2/wtRVAKKMbJbIl9uKii//iEVjq0Zqx+xQTYUb47CE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UHtMKgWR
Subject: [Buildroot] [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig: bump to
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

This patch bumps the zynqmp_zcu102_defconfig to Linux kernel 6.6.70.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu102_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 1e453adeb0..762a54d968 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
