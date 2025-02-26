Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E24C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 15:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5682541345;
	Wed, 26 Feb 2025 15:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id obR6Jzu4S1ua; Wed, 26 Feb 2025 15:13:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44E4841347
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44E4841347;
	Wed, 26 Feb 2025 15:13:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FE2968
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5CBA4129B
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yAmilPSh1Y5e for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 15:13:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::62e;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 034F841294
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 034F841294
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 034F841294
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWErKgyCEvJkmURlWKNOfyr/LfpGamPXEN4QXpt5mdynEYGfmFw0ZK3X6pXfLCWz4TQ/UzXeDxGJgIESKzyLiMpvW3eVyEp/CojUg02OiTBryqP9O2/7Kw7Kyk8h/crFZLSbQM8TIbp+kTy2Nl0qjLYvItYRdNTU4LGdBjOMmfPspslmJp/GCN6lhOM8qyIAhn5jGKTDEY12eGFe/ph+C9YU/mWIRpvEZmHb1dJNIaDW4BIlDrZreSUrtbzV74v4SeGErjkjP6RSQbvv+isaTH/nOmc06oJn/CHq/gUDevv+ghpJQsWpDsmQHDSvbAh5WXBVgZ1jCT/RXzrbOaPprQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qZzL4q8U4VZz7Ja5Vpwo3ZVjCIQuAhXhc0zKFTO7AA=;
 b=OgZG7a9lWphL7l+nQ68mBDA0pi6mtv96CTFXhKZxyOFI5nYMRSBKfWos2twiwYpQsPC2ud6EkSE+J4kaAgIKvIsqGKeMRNXHFdQN9uACflVulN3eECa4X3kKQEPIkhN0m0+Yao7I/eWh/pV7Sf/C67oplaaTtVUjl4fBdlR9uhmsCBKEj0xqS/P+kjb4dDpua51/SWSFJ58+lPBka6h365p7RhmX+14L2bcCS4Hk0cb9XsDoaqjmAlVzLllZnS0EimoXcxK7Iv5T2ikcT+aCfpn2zJSnfQxIAcQECqUP8U/MfKJpjAV6qs6qdaJzK/+CRFHZWr3OZn1QZQk4F0BCBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY3PR05CA0055.namprd05.prod.outlook.com (2603:10b6:a03:39b::30)
 by BY5PR12MB4180.namprd12.prod.outlook.com (2603:10b6:a03:213::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 15:13:10 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::d7) by BY3PR05CA0055.outlook.office365.com
 (2603:10b6:a03:39b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.15 via Frontend Transport; Wed,
 26 Feb 2025 15:13:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 15:13:10 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 09:13:07 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 09:13:07 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 09:13:05 -0600
To: <buildroot@buildroot.org>
Date: Wed, 26 Feb 2025 15:12:57 +0000
Message-ID: <20250226151257.2536298-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226151257.2536298-1-neal.frager@amd.com>
References: <20250226151257.2536298-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|BY5PR12MB4180:EE_
X-MS-Office365-Filtering-Correlation-Id: 52683904-e46d-46f1-bd92-08dd5678151f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rMRGusFAee6yM98vlC9ZQrZwfvW4ZayewEui8Z7aOJDApKN/sgVqUYJGHeZc?=
 =?us-ascii?Q?Hqoj7XbPvhQYK5v+lezCHZ54CfRLFyPl3ySDZecYPAeMR5TexsnMTSHTIgsO?=
 =?us-ascii?Q?yj4MseAO7A5XG6/hOXlZXeq9vfJOLA7P9PlSwYuZnDtejgd4m/MDuHUWEVIR?=
 =?us-ascii?Q?rg9P8VKqOoclVO3sqW/AxZLRM6QRfdlAzw/IRKm0Eesiy07BRDV3hmn7iqOR?=
 =?us-ascii?Q?nJihhGFo6MNUv+OM8GGHxdLbFgz7F0ftMkDGLlEMPrU5vCQQclw7PwTCVQ0/?=
 =?us-ascii?Q?JegTBGQv8IOQi8w/IzR1b6gOxc9cdunNQd92qOvnWLW58k1hMwLTKWQK2Tdl?=
 =?us-ascii?Q?5lvVsMlpNB2rvRIhIs+XuBekDFEUmSI6auwd9b72OhMKP+Lh2ocOToHy9l1A?=
 =?us-ascii?Q?2Q57ZxU8wDrHYmlyyZxo5U3uvHlGbeHY1RB3nr+nCnp0B0+B074mgkEL8xre?=
 =?us-ascii?Q?CQP617Q2grGPa912Q6LwhakZo5s58EJhl00KIM+3F09Gesl5Bs/6E5Bpk7B9?=
 =?us-ascii?Q?v8xLU97GbwCWAc3CsuQd73w7zBvKvlrH/D0kjT8zn81Op59+U7i6t+KxyWND?=
 =?us-ascii?Q?SkpcxfUQcbsYF448XpiMVFn7wv0B87/oRP0q6sEYLBchDS9owwpOwibhLW7r?=
 =?us-ascii?Q?m5PAZA76pyB17xBd5PnjgHcV8Zgbd4K8lIoZiS70AEt1RRwKV4L/ZlEn7opP?=
 =?us-ascii?Q?Ns6f4BRxqPHUcwtqeb//Bx3Okq2EI6/q577q0MwW8XQrCOym2urOnrCGklql?=
 =?us-ascii?Q?oL3rBCLS3/K6M+mp57sgp+1K+I23X+m/Xk3szksL6eQ+Lgd1YdPro9h8Xi1X?=
 =?us-ascii?Q?abaiGfswGECRyr29UmXd81NwzRN6Dj08COueDMg2g2+btbI/Fnur+L83EP0d?=
 =?us-ascii?Q?sK+5O7yMHRplvjWqfdc1N8K0b/zFjvpPt/mMumK6iISg4iMNLr4mCaipsC/X?=
 =?us-ascii?Q?h7PeV1hEdZfGcM0gLdTlNrFfXrYaBX9Un7fGj1D1Q0ODZgsOCbzM9VwNpeyI?=
 =?us-ascii?Q?J3gU0n1V1nH1xxVl1ZrrHpPAXI9VuPB8nrlUWAb52EvQHDnq8mUq69ckz2rK?=
 =?us-ascii?Q?4XR3cxzW0yLgYTsZtXIUrK2dFpImYrRop3pFaJSMG5oG/PKWTxC5dTIs70Kq?=
 =?us-ascii?Q?86ZxfUfkMu5vYX9Zyu+RXbpxxPDEL3Z1foVGdve+vtu8pH4xLoEPS1Mj6BH7?=
 =?us-ascii?Q?+pdX2rk4h/NxZ9Ke/Em/faa1xEBiANL8nTGe/vj2S15UciBfFZLEVrWy7Wc5?=
 =?us-ascii?Q?sT5Tygg/VWGgL59uixyyLUheyc8VaYOfKYOsnVmiJfccJRnvpe/Kzar0F40j?=
 =?us-ascii?Q?ZMOcja7BVbdu0sGohH/gWHz5YHV/ObKaGptcx40CskVwp9uurTqELxOU9wpg?=
 =?us-ascii?Q?+7NZfaQ7gYirL2lFoVCnwMhRHF/Ua1400IwdVi8kaPnJ6dNOpVIe6Kt5OuDu?=
 =?us-ascii?Q?jiQUplS30sxqcbs+mVrVkv86YYoMwXvUOtZ4Tkm6ukHg9KwWZpfWwDBL1nMH?=
 =?us-ascii?Q?6KiUh53RSoPVjcn+w11rz0HH1/xciZlEsZW1?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:13:10.4444 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52683904-e46d-46f1-bd92-08dd5678151f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qZzL4q8U4VZz7Ja5Vpwo3ZVjCIQuAhXhc0zKFTO7AA=;
 b=pU0yT8tuGqXf8rS+JjvWuT4WHULQZcWds+nQPhz6vO+HkYmhhbejyL6SdUrnF+WatCYtkxkVP1mcWDdDUdx3w7SRNPbBl1Awk/svNVZQ43DYZcd2v1lDfd+9IHSRFPbQfBZRT8INqdPvHiqdx7NaTMPZThVSLMumb1NtkOWiA6w=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pU0yT8tu
Subject: [Buildroot] [PATCH v1 3/3] configs/zynqmp_zcu106_defconfig: bump to
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

This patch bumps the zynqmp_zcu106_defconfig to Linux kernel 6.6.70.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu106_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 2669afe1f6..51287fdffb 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
