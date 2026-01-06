Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4316ACE9D71
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 15:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13C4B60BCF;
	Tue,  6 Jan 2026 15:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1jbsdt1hRDVz; Tue,  6 Jan 2026 15:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED94B60BAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767715019;
	bh=CTgEBYFkMP10tGvQeIcp4o9aU5r9qgxfSLxX8lHf93U=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ZqzEekYfvstnyNO92/2qfQ+J1wzpFobxmm4UpGzDy6jd73ax5U5gxelmvRTS0Zgg8
	 Pf6uVJdDm/BHIl2APRaXLbBdnpAQMarZEGGTbTYIiC9EjZdBy63xXhzknHcn1UiuZW
	 WLSxbMvHGWcftcTLgJ5o5IPa/rkCpX5dckCXmBeU/XUI4yNg5+KQsB1dcPSZSDVheq
	 1dp8PBdrfopTBttAi4y9ogG2o6m1W3ItF2iYYdZ/eIgpR7NAl9wc03L7F+Bghu1OFd
	 W5DauiTFKs7JkY/VIh7RH0RfL5/kle05ZZbFjva06TTAKg4Kt2k3tyli3KUzQSF7rr
	 MOERS+73XgRBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED94B60BAC;
	Tue,  6 Jan 2026 15:56:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 933D9E7
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A29C40417
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AOQUeLWgf5n9 for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 15:56:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::1;
 helo=ch1pr05cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C6E1840060
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6E1840060
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6E1840060
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:56:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMA/ZFD0KG7qJwTZ30Tyy1htM8m/T1j9URNy9zoAXjNHMcwerSGx0+jIzP8WEleAhFE3X/kCDauY3d9BXaloWogvvvKeKcG1kplZQ5n6sivyf4nYjeaeHN9goRBWNcOjql/+efOB19gapGDg4rB6xbb0a/O/WMgUAbA5apRHDxzyIWpJv2+N7eekqQTqRLm5syW3emWmUfLMtlsOcWpZVGaM/Timji+kwPMVyhdoLh2McSraGfsWVhlsXP/V370HraM/eVPhhrUmXdpWCHJoaCpdCWAymQ6sOFS2O0CflpQb1qsG4+vLbcfHgIoX0frQq0ldpTldPDw2Z0eAFo5QkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOXXUawZEigBkPbmlTcKXRdfXDMcuHWnJNoP+dk+nJs=;
 b=JnbrhFMxiW2qV5K3z65OXwBERN+O6875lbOp/kjZ1mbzplxIPrXCFZg6H9GMx4bNhAFKgYFBt24NBIIlD25Kx+1vfHUbhkmfz7cuZX1MmgThbi9A6bJlsB5YEu2gu5wC51hYKiESs7acWCyOf7O42bQcwUJNlwCzSJQS8vL5j+zno1ogU+3OCpW6J488QrZxmyt7MQDxFzJOj9B7MxmrXvvKsiz1bYbEK3uJbWe77gvJA0Q/tI4byOYJ0Vs213NQwVePJylcPt2bcGoTjqGK0rWyjD1bP9v7OLYimSVmbGmJF0nZYCo7IEmUQLRCziTBDDiAQssPZCuxhOdkyRXGmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0063.namprd04.prod.outlook.com (2603:10b6:303:6b::8)
 by LV2PR12MB5943.namprd12.prod.outlook.com (2603:10b6:408:170::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 15:56:49 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:303:6b:cafe::41) by MW4PR04CA0063.outlook.office365.com
 (2603:10b6:303:6b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.5 via Frontend Transport; Tue, 6
 Jan 2026 15:56:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 15:56:48 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 09:56:44 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 07:56:44 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 6 Jan 2026 07:56:43 -0800
To: <buildroot@buildroot.org>
Date: Tue, 6 Jan 2026 15:56:30 +0000
Message-ID: <20260106155630.2404514-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260106155630.2404514-1-neal.frager@amd.com>
References: <20260106155630.2404514-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|LV2PR12MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: b6eab3b7-3785-4204-d8f4-08de4d3c3370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ph1lrFOCR9t544tyPg29+nvJh36kPgaVESjL0O1N3DBNT2fVsdJcbgRiERv7?=
 =?us-ascii?Q?fWoVjpfvGKStEZeQ51f2XOnGEiT6dZvD0an3wILuR+Fz3sry/geCPSDXFb1N?=
 =?us-ascii?Q?GT9NCdi9xPjfQiQGXwUrlCg6LXpgiFy7YShPp8hfInouM/H10YzN1/LeWwb5?=
 =?us-ascii?Q?SiYDr9l1qO4ZWhoBlTIQgOXXH/dVXD2OnxExH5uXT2kQKJzcxzfrmScdIMV8?=
 =?us-ascii?Q?JMcHFMY10H6mk4EdWGSmhQnuTFKc9nJtzJ+MpDFDjel1pRU8KD7/Eyx/sajx?=
 =?us-ascii?Q?ZfEkn58h1CdBsF3+aSahg4ECyS33EwDc+vt6xvuC2o0wdtUfy7aJoe4Yln01?=
 =?us-ascii?Q?sAohISLYsv/Nk2c20EFA01DiMxreR4gaNlxGckgMzY8rc5zDJS2WePiKLEJs?=
 =?us-ascii?Q?o8tYyMhC91z8r4UNnaS5is13WEMbCB7mx3Tql2bIIkUdXaINiZd4GtNcaCwo?=
 =?us-ascii?Q?sNlkm6mFQ7sGkXc2uNix3ri7JygzLR1UwdxhIezQV/UtDibQazoq9nh3BZDi?=
 =?us-ascii?Q?AYs5xtmiw6mIniS8qB+XFyG/kJf4Oa9JU1Kp4WMgZFNyRRq3AOyDC83xE2m+?=
 =?us-ascii?Q?dLPatXCvSRd1slnhv5uGNyMFYUK2W2AutjKasleQFPxyosUWPkX2lRE15XND?=
 =?us-ascii?Q?LMH1ypTmiHVGW/5CeNUiuJPbr4N2jDElzH9XIB/2gbyYS09EBa0FhzWyJaPh?=
 =?us-ascii?Q?RyiZXhrq7u8fPJOtiQOCvxst/DVFdXAEuglpYOJ3v1iR9TPoDb6ZFrndqbh8?=
 =?us-ascii?Q?NBAQFUbX7ZZgp4cBDFdeVejxdF5xFUtnMeA0r+Tcl2zUiJV2gbRA3M/Xd1ho?=
 =?us-ascii?Q?JAgzMCD+11qAt9TO6v0Mw7fRRjIiCtOj5WavjoDAwvtkkCafCLMOfVzQDhur?=
 =?us-ascii?Q?NPgFFAiMtUsd80NCPuVWpc7LFiyCMDsVqE3Yk1hdOWg5TxeSERGOHXjow3DS?=
 =?us-ascii?Q?krXGTjEYafl1Y/M4OIaARxVUljXZUO+SEaCtXNlg9P9uuRoipi3AyERTuskh?=
 =?us-ascii?Q?HsUaHN1F0gvGmqnUSR1XIz7Ou/zllThx18yC5I7qYl5NEldJhTO+tUJxGTrD?=
 =?us-ascii?Q?Q+Ckzz+0lU6UTefE541XV8+4YICEXyY13hD9VJlfK5rETHtLaTYJ8zKCdG7s?=
 =?us-ascii?Q?P5oKiq2XcUszc38DxXh4J0+3lkMHQpP9yBKcNxUwOut3IveclNX+4AzxgGpt?=
 =?us-ascii?Q?67DPeavWTsWK7N/w0YrEm1mpRF3Z1ylYnnwjR+H/ijidlOnHC8ewt/GcrVRR?=
 =?us-ascii?Q?VTSMUKEaS3UXkbt7qWLli+tu2r51/oC2IbeDBxlJ6YwoKmgKpMlb0qSU7ItX?=
 =?us-ascii?Q?JeZ1+T09/E+laL5smbf0pyCfB4oRGPdht0VjDPd0/ugoHzeqEsoONrtwUhr/?=
 =?us-ascii?Q?6G3S46+ZN1rPZJVk21QKO+q73VSSwGlqTzxxhRdUlbK+AFTyR2LTdOkzSqzO?=
 =?us-ascii?Q?ieFgg70A920Dp57Sgs+kVyOPH9vab+RhnbezOYMZnX51pD0koXGS8VjnyOtr?=
 =?us-ascii?Q?VtVkiZWk29RUnZNE8lgMU8RNRzUWrugVMqQcbYxVZOjTvaitEYLjYRfAySU1?=
 =?us-ascii?Q?WvmnlgW6+4dUI56nS5PZ8ymji4W0wnn9VsBreeJV?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 15:56:48.8238 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6eab3b7-3785-4204-d8f4-08de4d3c3370
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5943
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOXXUawZEigBkPbmlTcKXRdfXDMcuHWnJNoP+dk+nJs=;
 b=sYRBTvwvHr2Pxe4SF0dKAwnwW+xleE8kzgpV8n+EfvbhSD17K+jSCzf8BXMYV+n/iqdt0U0Hg/XeExssVttfr6y/wQVhJCrTcxK96J7LwSUqElqXD9QW559GC/1B1kf4P5vwKoiXNJ0wwftQzavgjx6iy/iP6IHXCWRtLaB9U28=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=sYRBTvwv
Subject: [Buildroot] [PATCH v1 4/4] configs/versal_*: bump to Linux 6.12.60
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

Bump the versal defconfigs to Linux 6.12.60.

Run tested on a versal vek280 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal_vck190_defconfig | 2 +-
 configs/versal_vek280_defconfig | 2 +-
 configs/versal_vpk180_defconfig | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index f9256254f0..5f0ab2e962 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 222297b768..a096fc0788 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 020279c3b5..648b9b0aeb 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
