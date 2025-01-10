Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A27E7719C
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 08:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21EF360B0C;
	Fri, 10 Jan 2025 08:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EcYS36bKKkmz; Fri, 10 Jan 2025 08:12:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B7E660B18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B7E660B18;
	Fri, 10 Jan 2025 08:12:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B644B942
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 925DE40B0F
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id irbZ-xU4Kukc for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 08:12:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::606;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 811C740112
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 811C740112
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::606])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 811C740112
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:12:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gP9BQN31xuD3vuFuePqqDxPTL9Vri7Hi2STfRXiQ3mnKXhB5pPV3nnj1xSBfQIDT1djKOPGPHlUPvB1Ty/xCESZT5u06fv+Re3QUG7hspC96d4tQKtAKS7nWwO1+tHj29qlTGJf7UkHxwKGAG8VGvq9kWy2LF6bBzXO56PTssgh7lZIlvEQedYpavg4S0X6X5S1Z33SpadLv7Tbg0Knz9wKYfGpQHRXgNTh1ZXVd9Mly/84k6ECSykwLkwk6Hy4qsN/+SBc9lDz8+pWkOFPuF3Fqhf8mBNH8KpkqcAun3x5CCAxwi4wo/a5eCxDogDBE6ykxQA2pu6MvS8AH1pcCTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vDkqpaFYeTDuSzGP/TTK4n6c8q8GdKCJX+KiwXEJL0=;
 b=u+5eBu4uTEZH9i5+TDBD6C+2Gg+7WjcR9PDWOgwpWFvSU9wyFFl3XSrIm04mEYnpG0Er1nRPt2wsF8hNl5TqC4j3RJWe9xSqbHWPfFnAxLlzAgI4ehzI91hkmHgfzj19MKnk6ooyk19TUs25z/ePWvA1QbdTaG5ZuMsvT6Z6xf6h6jvinAJwGVxsNzXBdb4vUD2DLtTX8R/TZQEWRdDohHgH7Rdd0oa9WMeVa1DQr5M+oPFZOqqxAlw3WvBY2DHXK8IBTAl8iIKDvLXJYrrLePNDD+/085PXypsv40QdxJ0LdStLPc1aVxqbZN1NJF4bHRORERKpjIYLS1DEggAdPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN8PR07CA0006.namprd07.prod.outlook.com (2603:10b6:408:ac::19)
 by CYYPR12MB8964.namprd12.prod.outlook.com (2603:10b6:930:bc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 08:12:12 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:ac:cafe::9e) by BN8PR07CA0006.outlook.office365.com
 (2603:10b6:408:ac::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Fri,
 10 Jan 2025 08:12:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 08:12:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 02:12:05 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 02:12:04 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 10 Jan 2025 02:12:03 -0600
To: <buildroot@buildroot.org>
Date: Fri, 10 Jan 2025 08:11:53 +0000
Message-ID: <20250110081154.2481-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250110081154.2481-1-neal.frager@amd.com>
References: <20250110081154.2481-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|CYYPR12MB8964:EE_
X-MS-Office365-Filtering-Correlation-Id: 74b33244-d35f-4c91-bc04-08dd314e7c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cEBS/U4b2lb3NXH/kyN12n6GOVqJEkFIDUezOrvIgu3NtMUrftD2gda7+bHy?=
 =?us-ascii?Q?hrqcIwRJv5vYYngGD7aQdS7lmBk71yJVge5Y5/YeXIOYJ4h6H9Y5YQscj6FR?=
 =?us-ascii?Q?cHSl19pPq0fOBCdXtd5fyKFnQHkcuuPVFG7OboQ92SNG0/vUGhPtgDvSCdxE?=
 =?us-ascii?Q?dshXqS8KOMIOuaILLGB+swNtNQNH6iTam1uYT6zO6bLXZqXPhDkd23HjHVXh?=
 =?us-ascii?Q?2iJysNP61FjiDv3TQ/VP2wEMTPbMd4YU37y+ECFfLPrEfEP3INAqYlZkVbGb?=
 =?us-ascii?Q?xB6sNk4UOE1uq5cP0w4O4IfdiEO6RE71IfHinjvhH/i1GYgfo/PC15JXtDJ1?=
 =?us-ascii?Q?iriQyEb8z2UkDuhXkr9hN2gN+JP5zUN/U0k3ySh3DVVp8e1iUxJvAKY/i3IB?=
 =?us-ascii?Q?AuEtLuKxiG+yJ2+cpfj44WoiFX//snCW0cXgpeNcP2D+CZSUM9Qbzh8iDVpe?=
 =?us-ascii?Q?m/dD+XwnCRZW5kF8aTKliOFAQgfiTq7q+Wac+rRQvqfG/vyG8l2yf63AZKW9?=
 =?us-ascii?Q?yLVLdQaznB8QNrtw4l/46qBWi9y8j3Q3XXKswMusbCO8p+xfW/AjeGxt6uZ7?=
 =?us-ascii?Q?tnNpIFAK5AONr3NFH25Q9n0+EUOowa1ssliXfyMeyGCq5Ygm9gLt9vn0qhmf?=
 =?us-ascii?Q?ac12i+yOs6Bd0YNpAVzf2OCP3954x4xG1GLNOfuG51aeyrxA8G1iBsqQh5hB?=
 =?us-ascii?Q?ngjB5h5QtiJ8Qra89Q7QL9JEJkCKWUxbImomH9YzD+jbmhaE0VZZ05mLvVcw?=
 =?us-ascii?Q?RGdu3ZTuOrWWHU9U6X//XWZp+4PT9rGqSpMe471mmmKTkDsN1wvk5ElbrY8N?=
 =?us-ascii?Q?BhSiBHD5hElbMJkPsT+b9XjCYTP9dZKR5eNYDsL9ve5seVfcRlThQhRQ8F+P?=
 =?us-ascii?Q?YwdJXhKsix7nyZqRGA53QTAwyQ9F8/+yYguovBYpdAewsr5vI/BOiwyAagq4?=
 =?us-ascii?Q?H8jI9Y8hBhSx1zRA0fmOYR8VsALsa8n4fuJTaTlsx5/FNERfyl9AidhgWWjv?=
 =?us-ascii?Q?0rDSvvPAxxtarH3doe8XZtzrXCkqiUfmF11dI7Rk+GL3LGBrtr/u6McU0N/a?=
 =?us-ascii?Q?h7v0Wjw7L07Yrp3zEqGv9jjHEwMKTGriBNXk4KcfRE5GDY5Lj3cvqCIIEgMG?=
 =?us-ascii?Q?xldXfwJIyekcRX3ehWGMIQFvZq6tMqts6IZ3Jr1C7c1mDRIaW8GxoOtttypm?=
 =?us-ascii?Q?c1Dixx2vYoUl/KNQQTXeEB3pgH4iFivDNKVmbJZfPeycA/4aYY16DNOnAsV8?=
 =?us-ascii?Q?SmuOG9kM68FW63urRjk99+YdwiAyQ1R8k9YfPHWYPJcBO965I8SJlXHNj8gN?=
 =?us-ascii?Q?TvqZjokVczwPiTR9b3P+2hV5Iw8yjfMWuFk+YJ3lYQuau+iZx4wN/SYytfdH?=
 =?us-ascii?Q?tny+PdttNKkT0si5vIOoCrCgq0s1WBCpb6Uc2bXNTpVqCgtcE1AFXH4vtNRL?=
 =?us-ascii?Q?v3gXpDi/BPXt0BaD4DdiCh2nSyoDceLSOn9gB7Ig7IGcNOm9o/TYa9YiE01I?=
 =?us-ascii?Q?fIYVCEiVmMF7RZXeSGf4uB8RrlsTUHwqIF6N?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 08:12:12.1980 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b33244-d35f-4c91-bc04-08dd314e7c84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8964
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vDkqpaFYeTDuSzGP/TTK4n6c8q8GdKCJX+KiwXEJL0=;
 b=aCw5AgFHh1X4EgnsAGk03AwsmMz4f8YKpNQdSVDQqFxUPoSsS2bFOgztHd9lWRbwrLpAQY/OxT+jKe2gd5jidyjDCFrdNCDhJpK7EFuDikMs9zsi60zWeqs4mxuNgBwZi1D8nKk0cXv4LlJHQnoJidwUkeuL/NMfzGI5//6fkgY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=aCw5AgFH
Subject: [Buildroot] [PATCH v1 4/5] configs/zynq_microzed_defconfig: bump to
 6.6.60
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
Cc: martin.chabot@gmail.com, brandon.maier@collins.com, ju.o@free.fr,
 juju@cotds.org, michal.simek@amd.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynq_microzed_defconfig to Linux kernel 6.6.60.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_microzed_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 7d08331cd6..18148b5fbd 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
