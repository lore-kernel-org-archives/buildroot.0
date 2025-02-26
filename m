Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F426C18E7C
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 15:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4682D8361C;
	Wed, 26 Feb 2025 15:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SPM6-H-oF0ff; Wed, 26 Feb 2025 15:13:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F59F83696
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F59F83696;
	Wed, 26 Feb 2025 15:13:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 723F194F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 559A84129F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56rYp2dDAAnJ for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 15:13:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::609;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4045341294
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4045341294
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::609])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4045341294
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDGSvRKG2f2J4MZk7Df1Niqlo8MkuTO8Y06TbvWfPwOG37rm3/LeZQYRc5PK8Q/iCL4IGdsBhEJiuQ65QX9j4egrkwc+0AE+9VGB09RjQHi9gfogjVMUZwpH5uQgzRGym8pcEHQScbjNhAWR8J/2PgmR8iYlKfLwSoY5TT4s3EnK0KPDwhog4CKcmejoVknDW3JT+XGJBBRC2qTdSMRDKUqJfSFCpWdzID5Jn6G3iBK75SkiPUyAmYlH49FFAI6frtWrjwuEhbHeUtQiTMP1JlOp04L1jq71poKmlOmJryOxAYlJlwiOFHFtJigWp3S/vs1upbRACXlLgvCrnOFI9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewSod8eeX9gm4zvjHENFAs2I3n5lUjCIC4bCtXWZB8o=;
 b=cG4NEoIhGjT2PFpq8YIqrMwCD08G9EneL4JMgVe4ygzkcsnJVzjhw6CASVHK1dJcNiLbxZZueLRVmwm+b3CXiOhs9FJ1Obtv5B4wsxxljIajOC804sRvpVp8AYtdE4Gf4BpIhW3yKRGBMh7RXlJPvGft0+urbDKIFPHRrjaAKOKlck6r5D5E5X54DvUX9rxnthf7EusnGlA7VfqAaKtVPIKbfJ6yRxfwfpSg+fSecQ9OazBJ7XS090ZGjW0Yq0nXQ1Rifh4OCvI6YciBiK37hBElZA19peXVYXjfqD/y4yMJMXs3XA69Z8dA4gDkcUJvGTqqup4elPkQ1ze7IyAzlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CY5PR16CA0018.namprd16.prod.outlook.com (2603:10b6:930:10::19)
 by PH7PR12MB5927.namprd12.prod.outlook.com (2603:10b6:510:1da::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 15:13:29 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:930:10:cafe::d8) by CY5PR16CA0018.outlook.office365.com
 (2603:10b6:930:10::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.20 via Frontend Transport; Wed,
 26 Feb 2025 15:13:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 15:13:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 09:13:24 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 09:13:23 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 09:13:22 -0600
To: <buildroot@buildroot.org>
Date: Wed, 26 Feb 2025 15:13:14 +0000
Message-ID: <20250226151315.2537267-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226151315.2537267-1-neal.frager@amd.com>
References: <20250226151315.2537267-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|PH7PR12MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec98668-3ac4-446f-d9f9-08dd56781fe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i5yLVSGwo3JTQEXElGjFj1hyPZEzPNgBaFT7vtsqWivRvIEbKJ3rfGkjk7BF?=
 =?us-ascii?Q?8JkHCPN0CtkXf8MkwGHzhCORuf4/gEOzZ/B217EemOKy6keNGIPUGULA6aD5?=
 =?us-ascii?Q?gutXf4j62MnKoo3kEMvJsq1/5aPRQgPyd6h5J/DU2ujjvN8mp+NqBPeLJ2cI?=
 =?us-ascii?Q?T4u2wqhn55JTcgwT2VGwnEZn69Kel4WWH9OaANTp8OgUPxEHcIyOI+3VPVv7?=
 =?us-ascii?Q?0bvYqcbnE+JwFwLUQB9pspEQHR4rmyck6EvjVbSTEv8bPyhlCKNt1vzp65+t?=
 =?us-ascii?Q?ZltQ7nbMWi92iuEFFeR0An3707r4PrFZKs/CMNgsWtJRuUyz9dkvcHwOTUwJ?=
 =?us-ascii?Q?Aum1ghIW2vHao+ovKS5AJtGCUILp0ebQoXK8/aFw0Prcw7JT1Ll72tgY9aXl?=
 =?us-ascii?Q?5qP0dK8sbugll3TI3T2jYLJW4efl6T2K+69hWQUZOIWkTBvQyZ5Hl0aid8kY?=
 =?us-ascii?Q?6dlAhTN8xNBQgIjnLMS291mssmAEEMDvYHVdCdwSUdhQP5Wwprs6PH/iCtQh?=
 =?us-ascii?Q?ry8eh1xF+b9EW1EjnLuw0CRjwWpWh/MwMxuEWvIXSqGEalbms5XxUmsS5rma?=
 =?us-ascii?Q?ncVB4yb6qlY4hoabB4uMTMz6v/sytRKmuzmem/pTwwow7f6IF/3RZREgxuj3?=
 =?us-ascii?Q?1XQjU0+A4NRRpYfl9JvXQh1TLHL9txVbbrErWQjWl/bX65LCb9IqqZC1tY/p?=
 =?us-ascii?Q?hgCmi41rG5e6GwuOzQemhPNIrbRUuvEXeJe8amWaAJcOyS8vTQIyXzh7ot8T?=
 =?us-ascii?Q?TxFDnUeTHQwgcTFznUmQqklvZdKk36aZKp4sSo/cNDludbqF2fqG84QqbuGl?=
 =?us-ascii?Q?969qGZXaXwPM2dQ1D9I2zcAXxprnad52hD4e16HYIwvxEyFChup6xs9n042o?=
 =?us-ascii?Q?4gSNoHoHWVwr/1H/UPuojIILNAa7azThY/iNN81g8rAMilTcZiJ1ofqwMOZd?=
 =?us-ascii?Q?T/nCpEvYVNfvbowMESAAE988K+NIl7cKeSpgV0XuM4ABYdNJR8HaPts0E25X?=
 =?us-ascii?Q?z4VQE+h7q9R2HCiwRWrFtEBnyw+hzVXRrFoi4gVOx5yGFJEWeNlXcmR2grd4?=
 =?us-ascii?Q?7Q8eq7RrMybkcAR9CaewbB06c4AEObi/Sz4s1uR4No6G6z9qKvyTTFvkM2I4?=
 =?us-ascii?Q?klk7tgmxxzFsmuSrz4LwJxgrbH6K5BBJY6BBDaxd6R2kbtFje0ONQ3MhPSaG?=
 =?us-ascii?Q?vGAa9wTtZu+O+SkTZh7InaOHz/6pNNMqQ/1bKKekTh1oAriAUvgLFWMQFMp4?=
 =?us-ascii?Q?T1rG/FUbKrqw6rULSIOYq3XUez6qMOlcIacUy4c42ZMgZ1GveO/UaUkjrxnd?=
 =?us-ascii?Q?PmNwwkd3qeFfmKE3UHPkyHlTF1SuR3gZQT7YYdfi2G3yBsqJf0P+5E5TULxU?=
 =?us-ascii?Q?HzcHxLjLDWXEL3aL4ySP0ngCEqOQGFa4JrulHBylY35WyfZPtOqQNDrGMXF1?=
 =?us-ascii?Q?YL85QTFUISc+ySLaoSUM2KXvOQIhg4c+byIzCnzZS5eeIz/IYMNgWOuKRqlW?=
 =?us-ascii?Q?YwPhlGjtIG1XWPxhmRVTYPOx+fBFwcxD4JhP?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:13:28.6318 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec98668-3ac4-446f-d9f9-08dd56781fe3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5927
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewSod8eeX9gm4zvjHENFAs2I3n5lUjCIC4bCtXWZB8o=;
 b=wRXjudEadOhigcEvmiFkunmspjIt+1MvMvW7Z6BVXxrT+9aBu9TTsBnCZqPP3LLIPHYOUwjXekwV3Ng1X0uoIxYOcweCSdWzjqoK+BVDZ6Ij1dIbPTCLgQZuxCjHGNRyXWNFz3Zo1sg9hnsb5xS+hpxJl4CEeAz6NiPznby86M4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wRXjudEa
Subject: [Buildroot] [PATCH v1 2/3] configs/zynqmp_kria_kr260_defconfig:
 bump to Linux 6.6.70
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

This patch bumps the zynqmp_kria_kr260_defconfig to Linux kernel 6.6.70.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kr260_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index c5cfe2fe86..2cf2b98aa5 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
