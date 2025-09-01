Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1F7CA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 08:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAC3C8110C;
	Mon,  1 Sep 2025 08:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cEIrVk58FFXu; Mon,  1 Sep 2025 08:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0CEC811B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0CEC811B4;
	Mon,  1 Sep 2025 08:03:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 088D5169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2BED4145B
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwd6zQDEXSO6 for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 08:03:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::627;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A4F814143B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4F814143B
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::627])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4F814143B
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:03:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBxTuuJugpcmlENjbPXckzzmuJ1I7VFFuLrrANC2Sj6Zhe1o3ryXdrfOenjwH9VnUv2BGwNnl/MQVYI7pGyDjdC4+yi0DFsVmpjQMCPeMITQSMQ9RnLksXU5Ncc3Ceg3btibFuQGzb8a/KmCp9+yhL507FwfjShMOIfQCaQDNaq6bYGxJ2KDLLVXK9AcQICkgDyzFRCVnT1pSFqJVOWt9rJweIYClZGdsW2mtVmpgruwIENmV+4do3jNnzc6W0m6p3R+kMEjemVrZQ5HmsVgpnlhn0fYzh1SNhLuRumGgFbi/gnwJ82AXbsDiouoCxqxEs2w7EHuEPJbNQUQgiKxWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaRJ8IkJUpJhVm5hgiNgVCN+hN1+Wo3omPvqdTOTas4=;
 b=x3hIMcbcRigbKHNT/PJETbU+oGeyOeCzBK4E9EWaFlAht8OAEFu43ZgW1nhe/h/ZDriTMoTUxJTuzzyYeJyp3IiTI6xvwxzkmD0dO73FKy4T3ttmjD6z3zG+zsJF78jZ4GATY/QEHWHmmuqYE+tA2mDkn+jGjfZmnTcbyvZiEfwEDyWxgiZSsB5kRDgOcgAr/X+RMCDwsZSu2crXZdsBMAj31X4Nocrqw7jbTYzvYyArrjI87WUzCB091dlSVSsOeTr5qYLoT7eGMHjWVkQDn9oDcmfjtkaHxV0z6qcGtgbqyUGTy6QjxRr1pHR1pu+sPOVwuH0vsKsYlQzwhAxJmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY3PR05CA0018.namprd05.prod.outlook.com (2603:10b6:a03:254::23)
 by CY8PR12MB8066.namprd12.prod.outlook.com (2603:10b6:930:70::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Mon, 1 Sep
 2025 08:03:10 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:254:cafe::f6) by BY3PR05CA0018.outlook.office365.com
 (2603:10b6:a03:254::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.15 via Frontend Transport; Mon,
 1 Sep 2025 08:03:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 08:03:09 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 03:03:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 01:03:05 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Sep 2025 03:03:04 -0500
To: <buildroot@buildroot.org>
Date: Mon, 1 Sep 2025 09:02:48 +0100
Message-ID: <20250901080249.454090-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250901080249.454090-1-neal.frager@amd.com>
References: <20250901080249.454090-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|CY8PR12MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d8c5482-d206-4670-76cd-08dde92dfda8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EWWH0LxIpd7ytpIq/HLpTXs2fFwJCWkWF5kfpr5rw5U6KSgdE1PjKEYbi52B?=
 =?us-ascii?Q?LJlUVMKoNBcDjkY4gM8bTrkhOpRxPaX6Li9Ngz1kjJ+e68Ys/vBNQpU7nTNS?=
 =?us-ascii?Q?KVHHCB377YTKputrjYWUOZpRSiwjpWjksL6ZLmHHUs1yk84sfVw2QLMKQch3?=
 =?us-ascii?Q?ohcAQBGS0fU+buPa56FiFHtxo/Fbpae959abIHjLb9E9jjIxsygSDxzio5/B?=
 =?us-ascii?Q?jyLIrYxBgnzartOEbASXvCc+W+NphCdaxJcllRYCsK9ehIgfb/po2P6gv3o8?=
 =?us-ascii?Q?ABNXYOI631BqEjYcz09B4IUWS8qVve/Zf32bwTAg+01z8mImZHcMgYzRuAN8?=
 =?us-ascii?Q?EwynNpZhe/+cAqpvXgZxek6P42RAcrZ97AZHCtm+X7CFxkFXPTIuqOfEZAYq?=
 =?us-ascii?Q?nB2FepaVlrDl3Ekk1LIW2TX86jzVUYJTuc0dRN0vo0W481jMZdRaA3pGsvSk?=
 =?us-ascii?Q?Gpg2xFkhB/nKF9fkfO7Xf4nQm3deFVQ5sGLia4JlfrGtxLBueiLwJ/p2ebL2?=
 =?us-ascii?Q?Wvt89nELkabIIaEEFYSDSW9U1BDYwnlUVu4opBMtbqSb2sFXUZ9PipLuKvff?=
 =?us-ascii?Q?0BkSnKHNwR2Am+r3mzw6Mgxp+srJ/5PaZrNfClbVrkE5lX7Lj6OeMo2nHe19?=
 =?us-ascii?Q?z9UpEP/EsRE6IMKRQ4b7l+kg6lOcZbM/oJA7U7uANaq0W0jPHX41biHxhV5K?=
 =?us-ascii?Q?GJaXwQdRxWANWqKkbandvx5AZ/BXOqQXgcSSYtpyvodU9dJ/tDzSYvP24TyK?=
 =?us-ascii?Q?oXOtwLwkKvG/Zd/iYs2VW5xnfZ01nhB3dLB0A8M+jQg7V2WHD57Zkw/Ve7UD?=
 =?us-ascii?Q?6sD0uykX7pWRpaGlpozLIr/skKF9wwQdG8lsz5UeSTAIukhN6rlFna0JxzMN?=
 =?us-ascii?Q?ks17wMte/Jdc8voKu7h0lX8IgWPJ7OUEcw6Yohqtwqnpv9sMPxCTqxHQKyAZ?=
 =?us-ascii?Q?fn5UvyH6JFnXGzWvg/pRaUyNjQhfNrNGPqk8ToWLRPGen/vYZ+fUBgm1FuhZ?=
 =?us-ascii?Q?/laojlVhPsZNK2TvsnP6HYdzhLsgLZwYrS4AmTSl8zeczZU6HwFwN2xZ2z0x?=
 =?us-ascii?Q?gp1AAHZoNx6JK/0QvkmRGz6dvZBUbKGVl7tmyOZ880ZV2jwFfv1le0Ick1+f?=
 =?us-ascii?Q?IuC4sDwg6OPsp4Im3XhuZjLVRuynSmrV70Ku0H9mxV/awSN+OkK0sP+FSnGq?=
 =?us-ascii?Q?X4xSMlMIMlZYNwBSmOCdi7eaZPN5fQbnTmIGV8WXlJwpwkLyrKU05dlCvg2l?=
 =?us-ascii?Q?UeRw4ooJ0CEspnMiQycjoTej9E2CEqpSJmqveIp18z7PONjPbpmx0/zCxssL?=
 =?us-ascii?Q?1jgkBWFWZHccSEBUPeYQ8j02SOHQF8SNh0JT+DvEWmrJ2JciiP1ZknzgnXBw?=
 =?us-ascii?Q?XMGvUOtQjkMc8U8HZIlYy/T5ElhAmAfSQwn/Tv1eysLfMQusRswwABLrc7R8?=
 =?us-ascii?Q?2sm8xcenw1Y9A/M+EECjzPauSN0xQFQ1WRWSrLubmrtAE93cN5fNuIgPuzzM?=
 =?us-ascii?Q?hUiZxX9Byu6TQYFhIgCJ8gsVNYYtDrj/YtK2SatTdgJkzWs246Gy/5LSmNNA?=
 =?us-ascii?Q?m6cA8PSJAS8zOroA0Z0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 08:03:09.3611 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8c5482-d206-4670-76cd-08dde92dfda8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8066
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaRJ8IkJUpJhVm5hgiNgVCN+hN1+Wo3omPvqdTOTas4=;
 b=GXc/m3/KvVTPOVq1S/bgL5PSXfYN9TNaoxp8PyQnnFr/6h3cCKjBAthHz7abGpZ+/iU4yY9T0GYzIda/TmZM2eduvAXx8OFXrB5q5CdzXfRed0VhC1XKdQrU9V2/5XISzpe5xJraFM5evORsIcHsu79fEDMk8Goehl/qV4cDuQM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=GXc/m3/K
Subject: [Buildroot] [PATCH v7 4/5] configs/versal_*: make savedefconfig
 cleaning
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the new cpu dependencies included in the xilinx-prebuilt package,
BR2_TARGET_XILINX_PREBUILT_VERSAL is now default when BR2_cortex_a72 is
selected. This means that BR2_TARGET_XILINX_PREBUILT_VERSAL is not needed
in the versal_*_defconfig files anymore.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
V6:
- new patch added to series
V6->V7:
- no changes
---
 configs/versal_vck190_defconfig | 1 -
 configs/versal_vek280_defconfig | 1 -
 configs/versal_vpk180_defconfig | 1 -
 3 files changed, 3 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index c9d99876d5..7a08501547 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 4aa25f8d67..16283de2e5 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 500298c2f4..3efe9dd875 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vpk180"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
