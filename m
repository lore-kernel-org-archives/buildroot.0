Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE00E7719C
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 08:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA254407D6;
	Fri, 10 Jan 2025 08:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lW-bLAN6whQU; Fri, 10 Jan 2025 08:12:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 891EA407E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 891EA407E4;
	Fri, 10 Jan 2025 08:12:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 14185942
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0298960B0C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QrGhT9DzY0UP for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 08:12:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::62b;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2D83660AF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D83660AF6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D83660AF6
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:12:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iR1dMyEUtUWptbmqaqe5DtC9cBRe9W8ejUFAsBeyxJ5GpvOoPG7OaUEGg1y7VIYtah0erc1Y/DBQNX2g5yo3xciGRRgSwxnbh4rXsC3D1MNjpkRJ3lKM11MXgSTV0GKHpCZ3wC6eanBnEZqoJcXVi9cfg4i7+/JJk88Kd2q3b8XDpis/Kd3pHKPaJ2AjBOTEtEPk69jdxxTkczMuIcIGMoeDNA/x2zivIP5hZXEeRSiHmvjgRGHkyCfTJGid6kSAaTCXwWnI8lKGw1HbOYnHy0yvM6MKdgkmn9L7g6lu5/5shBxqxrbRADF/23QfCa8wMAM9qP06552ogoE5tARLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V137fyteKLDgR44sW+x/O24CzYS7MMHZ5P1HE2krYtw=;
 b=LYhePm35MJivASxbxxP5CIzokPp0773j4cEClQYeaPlkYPJpLp01sQ+eukg5jCm3G1iITv5KRsHEJehZNbHDLBl41gDKfogAUUURYOqo5YUH9xaEGhl7aZsPNzE1000jxgnPwDLtBseE0K/+pYvInNfgVbCUF8RQO8FZxQhXupfAdcyQ3hyAmqDYbQjv8rxr9wBUFMSz6CWBCEvBYXb2tVcDLY3Jo3Chu7j0mGCgsCHDvQgoLH9ZgtXOXSz/KcQqY8mDxi7KeVYS+C4s7XqyTB1YHWfMMprbnG8HYJYA1KcVYKYZkMMyzgZhg9AwZpSYaWSjyFsrsLhkx8G65qdNBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN8PR07CA0034.namprd07.prod.outlook.com (2603:10b6:408:ac::47)
 by MW3PR12MB4444.namprd12.prod.outlook.com (2603:10b6:303:5c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 08:12:13 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:ac:cafe::f3) by BN8PR07CA0034.outlook.office365.com
 (2603:10b6:408:ac::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Fri,
 10 Jan 2025 08:12:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 08:12:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 02:12:07 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 02:12:07 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 10 Jan 2025 02:12:05 -0600
To: <buildroot@buildroot.org>
Date: Fri, 10 Jan 2025 08:11:54 +0000
Message-ID: <20250110081154.2481-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250110081154.2481-1-neal.frager@amd.com>
References: <20250110081154.2481-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|MW3PR12MB4444:EE_
X-MS-Office365-Filtering-Correlation-Id: 382a93d8-cbbe-45f9-b611-08dd314e7d00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HCnICPglEas7RbWVA0BhDrm4z2aSUk5KDb1WoXp1LlwpqpbjL9Y28TpE5gTn?=
 =?us-ascii?Q?IAjM38uBGB7Myj2hQoVpMW6OwSlCTyM1MFSB5bN+DRg73KepMIkL8qMgrKTF?=
 =?us-ascii?Q?ZFcyJq9g2kRKDwgLNubRARSSrkQh/j61kIy0ewZHaxkXsC7mt1x0wmz0q5ak?=
 =?us-ascii?Q?W4VYfzhaB1OuxB8I9uuB/f/B5lvNGc6YKqMrIgKGkX8+e49zTFqSVQlqEqIc?=
 =?us-ascii?Q?WRzGZiy0pTjfiFRq7xJ/IcxghdVlBLJ5liI6L1fs6jV8/xRchl4XCyNEI/kP?=
 =?us-ascii?Q?2mX1wja/W0d5lIUCScJcT9PZP8yFwHtY4vHeLy2s445adQUdyaYQxD+RzQ61?=
 =?us-ascii?Q?yE3OdHyK2FtnkG6aWpqBprG+FsOVntebnC+XK8nw0dS3CClfV2ptoZgfHB6M?=
 =?us-ascii?Q?nHFAvRYRCwwec5TYbSqkyw+ksT0CttlIq5zN1+nAlQCvUXhqKon72QdGXhet?=
 =?us-ascii?Q?u70PJo/TzY1quOTKY9GfYQ8vld6CMvRX6YWBUN7+n24cc8dHjHK+uRJGUd90?=
 =?us-ascii?Q?TDUqFBSlFLzVrMLhwPczuLVIly5eVAbsqbH7adRWlqrj40XS9b3SAp+FQdmk?=
 =?us-ascii?Q?xb4ihvx+Z9Psbt5q5uTDiv0ozsLHOfgbxbLoF6CfWrBH9niQfqNB426bO2Rx?=
 =?us-ascii?Q?AKvEfWO0DLDPRM13gXLKNJN9/E+/eZhyAWleJNGWgauXv5vHu0Fj1qrTsSfc?=
 =?us-ascii?Q?lrQYvLJSvpfdaw5DXAuhkCKw5oQBBxSorbKTgujpyci+W9toWYl8GZd25UAT?=
 =?us-ascii?Q?QPDdnWebkq4lum2Js017XfgKyKmOUtxUIojMWoj4vj8bfB4s3MHB5UFAGC2U?=
 =?us-ascii?Q?aClnii5zJMtv8W7BLEE9R+qU2dJbYyS6DikLOt4gQvBP+e/slleTFmX1Yx+r?=
 =?us-ascii?Q?/15p0ufd84vmKv/c2cyT4LIO8eQh1zvehfTrCCw+kam3SgvsVvvBnyIY1QPj?=
 =?us-ascii?Q?TmYrUc939ZKyaPbPCmlf41fQvQ84c+KHHMrhzJmj4XO4d/QeHlGpnnkpjPQM?=
 =?us-ascii?Q?+Za79paHsFgtPASxyH4uNsKY/HHDlPcWu1O63/vBoOXAorRY6mWOGaXJ30wx?=
 =?us-ascii?Q?aUD089Bjxl9ej3kDYtVZ3uk32InT/UdkvNQL/5iUU4aD7HKB10MGJGkD3+u2?=
 =?us-ascii?Q?UW99kv+FCUnnNeQIhAaKWv28zafDtwEd/VKIhO6R3AAZoMvzfH0EicY01xZ9?=
 =?us-ascii?Q?iz7nD+UaUQIzndZ9mE5vh3EtfH1o4tG4uZl43rQP5eRW/w4t9psmJXYz9/zy?=
 =?us-ascii?Q?XwoSZVi6rT1NzUetTkl8Wxqx20kiMJHRjMIvxhM3C6gAaQPiOUlP0lfqchOi?=
 =?us-ascii?Q?I6lFAr9cSTRUf1yiKp/ZoYcnIR+sNZkEmZBsqu/L/zQI4MjEVSw4z2ttFRBS?=
 =?us-ascii?Q?d7gdm/0Z6YyZgh6WQ0t/w4ZdTpxZ4f8MjvHuN2A1F0l3nzUnWd6Bgr85aG50?=
 =?us-ascii?Q?trPLd8XEkbXd2q5jsXOfPd0UDz/04d3VLnXIBp6RJMYvWIQ/T814uqDcFwcn?=
 =?us-ascii?Q?xYAWK2Nq8a/IKwbXdKl8DiTLK4dwyPdhLWSG?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 08:12:13.0262 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 382a93d8-cbbe-45f9-b611-08dd314e7d00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4444
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V137fyteKLDgR44sW+x/O24CzYS7MMHZ5P1HE2krYtw=;
 b=bXNmcffwON9l0inAylOqZbfSb4p0JahA5J6Di09Rj66ba6dS3jq10rdIbfPkvmMvle0MHiCkpPSWmb/6ZqC6R+uZlYjIep9jypqIcgbTYV+01UNJjawl+3KlIyEXtAtu7dEfCen2xw3PdVrblUkAJC8qLAQtffzJ3A3KXyd/vfA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bXNmcffw
Subject: [Buildroot] [PATCH v1 5/5] configs/zynq_zed_defconfig: bump to
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

This patch bumps the zynq_zed_defconfig to Linux kernel 6.6.60.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zed_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index fb0f52a0cd..ef74c73b3b 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
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
