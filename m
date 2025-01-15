Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16C2C02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 09:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DC584160B;
	Wed, 15 Jan 2025 09:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mkvn4Xtw4ZOA; Wed, 15 Jan 2025 09:50:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F1E241674
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F1E241674;
	Wed, 15 Jan 2025 09:50:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D683B8B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 09:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C56B404D1
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 09:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BgJ9WDvI5Wnf for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 09:50:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2405::60d;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 56DE440454
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56DE440454
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::60d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56DE440454
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 09:50:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDC23ClmHvnAw7P9QVmMvIAf6CQW92s3p9fxjGzCl+Z0uYvFyUha6WoSj8TbLArEqwkZ2SAyV/tKwyoA8P0+TdcfUHwW8YNP1dy5S0pHJJXvaDNZAmOdPRL+OKKxtrU2d4mt5vs5121QtCYESSkCaSVe8beZfHAy5KlUkFi0+/LDkikRCoWbz4mDTWSTvjaByl0WeRwjZPjqqM/l7kpGK9r5KXZs0E7UAMCLjTBoBC2u/Ll0pJ06Ue92n/RdNRUEz/XKX0b8OexeaBCrYR0ACrepQMmwSm5gZXGxS73b+Kk/noqweeFd5/sGwV+BVJPAlaeYsmsaQdrXolJRoDPeew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36kwk5lsG+GHUN3hELdwAR2qL9BNV4XwzEfwLtDMwdw=;
 b=ci9Dhh1Ohw/WSJ3oVEQKFKoEfOxccu+m+af7iqdrMNX82/+WowtABC+crh6W2dnzNpH0HZ5bdal6K698I0T+U2pMliGnElU9otS9AnyAIyI7Tg7fUe6VttHSkixIcWjCjquTRnfwBwCGkGoTB7fw+O0FXm9u56s7ljev4lF7TG1ptZ8yzs+c9ICOW2nnbxoqFQ+ExO/kM9W++it1bSHjKNZ98Dnpdz4gfrdWvbY0Vh1iga7P7muXRwWb36ir4fvgoMTftRGfOh4c3CphwmpWxqcrDFW2r3UcRgcG+nzOiwFJrjSjKopGTsX+byUTaneKKp7eugCHKu+ooY9AUJ3b3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SN7P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::23)
 by IA0PR12MB8208.namprd12.prod.outlook.com (2603:10b6:208:409::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 09:50:18 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:123:cafe::24) by SN7P220CA0018.outlook.office365.com
 (2603:10b6:806:123::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Wed,
 15 Jan 2025 09:50:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 09:50:17 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 03:50:17 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 03:50:16 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 15 Jan 2025 03:50:15 -0600
From: Neal Frager <neal.frager@amd.com>
To: <buildroot@buildroot.org>
Date: Wed, 15 Jan 2025 09:50:10 +0000
Message-ID: <20250115095011.2469162-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250115095011.2469162-1-neal.frager@amd.com>
References: <20250115095011.2469162-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|IA0PR12MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 007a3df6-f435-4381-05a5-08dd354a048b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c8dB4CpuBF6+Ny5FrZ6PgfYcs6bjSmEPpyEykYUOuzkGDUqRpxxgYSp8QWoq?=
 =?us-ascii?Q?WztlZ2JXAHg0dfN8v83hdbqf/FALl+OPhZRHUOlBXHyO5tn7dGsviRXXc0jH?=
 =?us-ascii?Q?2dbDsk53hAQC2uSISqpIuyped7u5jDGAWEWMir1RCEWmVLag+fxz9nsoQXXz?=
 =?us-ascii?Q?CRHD1rf8JJDVAiCS1KYPEzPOjrhhvCtm1T1UTnvktv5hq/h46HUTn0VDMuor?=
 =?us-ascii?Q?3R+Bt477z8Mjj0ZC2VuXQB5sA+Xr2/XKHhG8VThOyxGiCNbYOomlOLpJaEbd?=
 =?us-ascii?Q?nrsUe/Y5H0/Z94ZMc2dUgdrvyarFB9XCJ2VrL6N0ZkdoD+ylJLBAX3vKllza?=
 =?us-ascii?Q?ZcsFgQ773/6AY8MKcDHYiMrDGOIBuhqlicvOjC78KGAvkIAIb9w+42jMVjdf?=
 =?us-ascii?Q?h0pDI0KqBocPVe0TkdE3ydAWpn8lhpkQn0kKqSgnZCklEHI5Dl4FzmGvDOBe?=
 =?us-ascii?Q?T83+kOhnisR+wyBDPCZZQyHKGwqefXBDD6y/q3NwPbOgz7aVSciadW+tte3I?=
 =?us-ascii?Q?Ufbg56R0IPssG7ArQxuFQInBvuuS4PPSTRz6ZC6MkIBbLac+zeTJGOma0dSY?=
 =?us-ascii?Q?cXcJ0B0rxzZCLZE8VrzAotm6zRoxsfL5HcGVcwiEJHvSqlGDd1snV5bbQoFR?=
 =?us-ascii?Q?MX2HJEEwQNJ+/dv9T69R4WAvH7C3GY8+h5AgiX6u0Idz9d0po1V7pCbGfDxd?=
 =?us-ascii?Q?2b3vd7WhzlYqcn5GllwRI/Ic64R2P6sS2xGSbj46gKV9rUkEc+2GykzXNdVw?=
 =?us-ascii?Q?gjSuZJY+mARAhs98ifK3S2ocr2BHhBvZNoYum43Jc5Nt+9xRXVfxcIa3x6cM?=
 =?us-ascii?Q?lyIe+Qb1kFWQ0CNXA5BB6X9EpxEPIu8k2iJH1+yzJ2Pf6IMc4czEcQLVRy9d?=
 =?us-ascii?Q?2GBWQ/YsTb2a+E2PY4nU9WFbWCrtV/1uKyjPjWI3R6pXYXMrv4qhIVWnjmp2?=
 =?us-ascii?Q?3Tqwf7/CzKfTTWHNIFGxeOYcjDCd2rloGWy6CHgrFWpTevAuEuhWfGmsTNYD?=
 =?us-ascii?Q?24tha7Tcwv0lkTAHIoddhICOczV1HzUW7eLGW31NXFPEh9tdIQjP+Hnzjc+3?=
 =?us-ascii?Q?h0f4zDcJsKsVFrBKq8EAED1rntgokE05KHaCqvNtzR/q1oUur/Z1oruVgCMd?=
 =?us-ascii?Q?s01+gDmPbo1wKCJTKT9kXQx6bdZJg6P4UkMZR4xT8a/sMrf8RzI4uSk31wnf?=
 =?us-ascii?Q?Posj6Lhe/I5zNtGxDVKt1rqbOFAmerDrIZz4V03qT65yCSOWAvtjAUJZbWEm?=
 =?us-ascii?Q?gRe0sVhby9/fMrCDBwgT9k3TmUlqdtrNt1FYzOcAftd/vRcGr0s1fIVJePXC?=
 =?us-ascii?Q?Db39z4IdUYCBbUo6PuVjX7aKO/0m54GBKHF0+I1ygph1yzVsKiWTndRkEYsC?=
 =?us-ascii?Q?MhJKGamWxyq/pn13434/01Yy6ldNqbZ1dVEyfOPDkC0HWCMnLzXPvXvCoBjl?=
 =?us-ascii?Q?ENpanaPkx7VJvEWz5VRBrc4OoQd0HONcg7N0QQbyRxC28s1D/I/5WmwLrY2i?=
 =?us-ascii?Q?BO61QcT1tvcSjHgI14aduuYciINgVsD56TTf?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 09:50:17.5769 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 007a3df6-f435-4381-05a5-08dd354a048b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8208
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36kwk5lsG+GHUN3hELdwAR2qL9BNV4XwzEfwLtDMwdw=;
 b=a3OSgUOm0Y7vbd9Zz5b3TT+JT3KR0bKRop0cIztWMYEEYWUOzxNqAYmmzz1VdoI2ol7vYspnvZRd7Tu3wHXcTFQbgrdJW75fgN+bcButUkwPIVq4b8nKK8MNfK4bkbzX+Mj02+PEO4VBPT8BomFIf/VB6hBUpOAWEDnA/aeFuIo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=a3OSgUOm
Subject: [Buildroot] [PATCH v1 2/3] configs/zynqmp_zcu104_defconfig: bump to
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynqmp_zcu104_defconfig to Linux kernel 6.6.60.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu104_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 4856c9b958..c52bac1462 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu104-revC"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
