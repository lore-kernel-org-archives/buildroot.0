Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFB6C0218E
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 22:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44A2560B79;
	Sat, 25 Jan 2025 22:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2HqX3R2Nsrh; Sat, 25 Jan 2025 22:16:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3630D60BA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3630D60BA2;
	Sat, 25 Jan 2025 22:16:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EED04941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCC9581F08
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DlvzASw0ryZl for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 22:16:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::602;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A34D81F01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A34D81F01
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::602])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A34D81F01
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:16:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBT3S8tU0h+ajgy3vLFtZDE6ndKd+QqfmX/a4NUKHO8JMKH3zMeqc4ieahRn3/CJFuVsDCeDAfgvBwDQgEkGOBJsUvfaNfzh/e+o9VcXD+9a4kB61YcInSaKQuONVCgP0MVPuwuEt2SdVxHlNoo8SH58ER4HyKuTSYZaf+EVKFgI73LwUWbqANg5JnHGff4m+uHv6DmYdE2hv1XWrStyTCUi8sV0sR7E/kCrHuT/XW4NNoJLshxF/lUffuRnZr2E1aAp0Y8aWM9WA1kNUFJ8hIP3FfdJQUI4+yewcNAqac5F93tgyiNlYICOjaS6wUhEu6yiJ+w9w7qoD5V3rpwYJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdiMTCUADBJd3O3QN7Ab3nTWSb/aJO9w+aIwQdR0L0Y=;
 b=dYB3kEpFvLbYlIdfIdj7ROz9Jmkz5OF7efwoKUOtkaYj6z2DCHiEM7+6PW8hbMreVs0CmDMVyaMvVd36zX7bTN/YWEXZxTAgY4EAybLAjHdLlVk5bmF50bRiofxtZ7Y22NByx0Ms5Q54WRlhV3e1DSLN1ZOUciNrkQbpGIh5s3Vg1VJ3SZ/Xsky4HUMs4ZdkD80WSrYXj84R1auF70I2x0bj4Ncd6DbnzHbITmJOzycIZgzVNixrviMzaNNXV/XosgEvBgjXaH24frEf9YUbIxwZFuxaPiPMMAy/GkrYADdhqDEnKpgt+R6jnYcRz9rug/AOVB7eZhY0EvaX95ElCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY5PR13CA0033.namprd13.prod.outlook.com (2603:10b6:a03:180::46)
 by SJ0PR12MB8616.namprd12.prod.outlook.com (2603:10b6:a03:485::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Sat, 25 Jan
 2025 22:16:40 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::2e) by BY5PR13CA0033.outlook.office365.com
 (2603:10b6:a03:180::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.13 via Frontend Transport; Sat,
 25 Jan 2025 22:16:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Sat, 25 Jan 2025 22:16:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 25 Jan
 2025 16:16:35 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 25 Jan 2025 16:16:34 -0600
From: Neal Frager <neal.frager@amd.com>
To: <buildroot@buildroot.org>
Date: Sat, 25 Jan 2025 22:16:26 +0000
Message-ID: <20250125221627.3315039-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250125221627.3315039-1-neal.frager@amd.com>
References: <20250125221627.3315039-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|SJ0PR12MB8616:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc25654-0bda-45ee-96a7-08dd3d8df116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fv8bU4ehO7NB2RsmlFyNYvUmGIC6L/zCAw9jGvFW8tDYI40+m32ozKO2YP3s?=
 =?us-ascii?Q?R66HqQfPDHdjppnLLTjfh4oeb39jZTC9+oNVlTDdOevG9x9n2GVchqg49i6z?=
 =?us-ascii?Q?mip8Jbvr5OPHIWXug4yaGl93p/zP5TOHTNwxxvd/zCCJhDg/rJwxgDhYE3aE?=
 =?us-ascii?Q?uRTSvKPOrHI30roQRWVTJ48OwhCU6vZYE+aa6GdMO8QXJ57NOKrDpFTIZlNa?=
 =?us-ascii?Q?3199dPgYEjQM4TP/9IcLIUPABtkylcMkAs89U3j7BoPxbuBn4Y6a1Lco6Yio?=
 =?us-ascii?Q?KRwkZnMDRqnnhlAcIQ/G0SKAkU0LQfswgC8wExpcspmgIRsWgy+Mz/PVMgMI?=
 =?us-ascii?Q?uyGhcjioetCQUdC/KKXrjcZdicqIkv2VgSPsY/wzHmNkS6PwJfv/jC2KOfnM?=
 =?us-ascii?Q?afD+9V3viYRe8bAWiVKa/xuwtr7nmLKgA1z0NEqmsvLRRqGAVcnfBDrgQxxF?=
 =?us-ascii?Q?IKDDXFaDRQFI9neckvLahb8sDNX1eHF69i9X6mCT/1WXfG7TrLkiSBbI+GRG?=
 =?us-ascii?Q?rf/9Nsuw+/Z122RWTVkrV5Gocs3TFkAswYSjybwHXOHEeJ95BLfGRviQRstn?=
 =?us-ascii?Q?krygzkZpBsIPwwtAUy5cwwgzL/JnBcafHdghmNpULM50gvf0zwW9WA76o60r?=
 =?us-ascii?Q?e2lGONG8dDiGQkwK5I5wdb6NkU8lHYz6CNACt1QhQ2dlH41eRqBbYbvC5Bli?=
 =?us-ascii?Q?QG5+2aum9mgjs9FmmukuHN3/ctEJVJLhas2xTQhkRKb7Vg+LoW+u1X1z2b/1?=
 =?us-ascii?Q?rD3odlQn149h+U68wDmurvfzfB9L+NvouDK7M1+rWQfREEnb+td1WOfNKPhi?=
 =?us-ascii?Q?WNb06ZkV0cNl9hAuoFvGYMcGiMKKS5BrTkSJcIThdgpmJ8ZkuDfg4MeSNUAA?=
 =?us-ascii?Q?M80Nkah9ED/cnAvy4yCh5y+nRXi/wWi9TH2iFXe8HPuXm6UgUNrMYy8y7sAq?=
 =?us-ascii?Q?hfTpuVXcpObYp+sKxtOYD3eewxGLnobGdz6g7QVF2cunw2df0xLbOqqtnrDZ?=
 =?us-ascii?Q?8IPiP72SXW3SwVE0+qYU1UxWQrMRqR/5q816Jt1MDysQkFtpXomNR2aRux/s?=
 =?us-ascii?Q?UssFIVs4oLRJxPhLbj9BbVkDVE0YQMG+dSCivgz/yC3QQ6ZEcHJJ9BZfKwQG?=
 =?us-ascii?Q?nlj4a07TTrFJk5SUtHC61OZXG8mVT7H0Zm8mD8cPSZf0ccE1a4GME8+qOZcp?=
 =?us-ascii?Q?1ptIHcAvCZtSRa4C2268VYoF6hIiDhA3JOWjJ/KUa2KDOuX8HTkbeHYQC+Iy?=
 =?us-ascii?Q?Jzhr78e4cl3XfR9vlefLlMBW5kV7vVbtWGYcwr9MkI/285xhDQnZiBFupmRZ?=
 =?us-ascii?Q?MPgZZC8LxMRJzomOtTBhRpwnirX+XkPqy5V41hhKbD0BcOqcue3dxW4TXjLp?=
 =?us-ascii?Q?3gvHlqlGnr8AKt2G77LmQIiFECoLSYO1/HnUFYqbF3xijVctg9SQTDARbH/I?=
 =?us-ascii?Q?K3cIqRjbUwVrXYj4CdABm1IMtGh6aaFOLYFKu16x/HB9myUP14DwgIsHfezz?=
 =?us-ascii?Q?psvl2qqINAvEVdPBwHaUdI3w2YTA2WN9wljx?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2025 22:16:39.9388 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc25654-0bda-45ee-96a7-08dd3d8df116
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8616
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdiMTCUADBJd3O3QN7Ab3nTWSb/aJO9w+aIwQdR0L0Y=;
 b=0oBF5HUiiPo5wB5PltS3SEMsNEnTtj+T21HA5EC5t5RJwCGvjulFQ5jNVdj5iikCrJt9wyZBNjnQyU1ju9J+86Zsb1jU20fh01HwO22+vx7qBejt/OCPlZnEZoeZa+2XmBxgO39ZyDww1jaQRYEPZ3ORRXbCsNk+UxG4PHots1o=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0oBF5HUi
Subject: [Buildroot] [PATCH v2 3/4] configs/versal: bump xilinx-prebuilt to
 xilinx_v2024.2_update1
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

Bump the versal defconfigs to use the xilinx-prebuilt xilinx_v2024.2_update1
release tag instead of the xilinx_v2024.2 release tag.

The zynqmp defconfigs are now using xilinx-embeddedsw for building the zynqmp
pmufw, so unlike versal, the zynqmp defconfigs no longer use xilinx-prebuilt.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- With rebase, this patch no longer applies to the zynqmp defconfigs.
- board/xilinx xilinx-prebuilt.hash file no longer exists
---
 configs/versal_vck190_defconfig | 1 -
 configs/versal_vek280_defconfig | 1 -
 configs/versal_vpk180_defconfig | 1 -
 3 files changed, 3 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 100fa1fa35..0967407304 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -40,7 +40,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 38bb7c0e75..c0c850e586 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -40,7 +40,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
 BR2_PACKAGE_HOST_BOOTGEN=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index e70b3aa0f8..2d77580fab 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -40,7 +40,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vpk180"
 BR2_PACKAGE_HOST_BOOTGEN=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
