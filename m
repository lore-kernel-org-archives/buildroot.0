Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FAFCE9D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 15:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2BC260AA1;
	Tue,  6 Jan 2026 15:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZr_WuLFwscD; Tue,  6 Jan 2026 15:56:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBA2B60AB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767715014;
	bh=iDPlbAJeJ0RigNnbc9BYPW0zoPt2N9Gu8KkMSxtW1z4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=AYz5BcPLwbroMWoK7cBiiQcu0pGzC2HSLygi/bW3El2EGdyR0QrYjUVuFSmO3hJmf
	 aJ6KuLMtOcb71IGOsYIYRC0DKntvauCh5LLTw2oAzz0k62hwQcKAtF5b6Lluz40VpF
	 DNvFnvD1WXllu5rw2DfHc0eurZFClW7yCP60Ff5VbssFMw0D29SftmZ9zwy+PbsPWF
	 dbWnef9ztssWNr97baHoL7cMEidODrUTQtSyZH3KlDZAGDaZk/AhuRuqwqlcHUSd9X
	 D/905cBvJlEfUhIi55s9xmlWAC7ZeDRzKRlYrtkCHCpFqWmxficoTUQFUkEHn8xTOz
	 zb9yQ9DAr9ALw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBA2B60AB9;
	Tue,  6 Jan 2026 15:56:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7873E7
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE81B40417
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2k6QWorELeGd for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 15:56:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::9;
 helo=ph7pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9857440060
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9857440060
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9857440060
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:56:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGOPK8bDNbrXn1sBmGEPj3bn9nmPt9uMt49qHAKCF0QAFmnlbjzrYoqNCQhYw3SBSrkNgBEc/Wi81bg5p4+xPiumbPmpgGxDZVTEHooE5JoP9nhHsiG3qsbvEgZLPkCB67rTr2z/fmQ6BiW3Lbo8+WvMRRy3VLwyyMAh2JVSPsWNU6sYde8mBU0+M9YR+k7+/AurLir7Tiem1k/enacGAREvz81HXS2WeoubBmqfk3LzJRruvEyyLDKvvr6u3JFBVrWTJqDgoR7xvaumlqOoqPHCWO/yUJZCbEtZKJ2kTwm/3R6G9zJEr+Iu7rAYptv6ssuawMfxdnM34rDQpi49Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CK/DlKgS1RxoSqWJGyYvgH7O9RsyRlVMrHw7+uWk9ZA=;
 b=QE/y6EfmMmSjMCViZoOdM1pwC4QLAoFIIfRC71gGE7S1a5l0iF3/nNBvplK3a5uqUjpI7rfuB7ZBBGLdkUoKlgy6coPWAO5OfCLL1ZvVaqA1zcyAYyjSBaRA4HxsVibdyU33PCH8WSn2wzRDA+/LxoD9adi9b/rGyOMuRCt8bckX2gXZTmN/tiCoTza/LtIXiAW4ZDwCSItEWOtC0yPt1NSTAT8x0P2fjEsR2WP2ZEQsBjSMleOBY0Au5lSh+NxEtw3m8dqx2P0jY+dpGYVUO6dUTF75cRKiW+vOKJUP26yNKhf9GLQHvHitHfgFI9E3iT48mHKBynevwokvJ59xJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0075.namprd04.prod.outlook.com (2603:10b6:303:6b::20)
 by BY5PR12MB4308.namprd12.prod.outlook.com (2603:10b6:a03:20a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 15:56:45 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:303:6b:cafe::dc) by MW4PR04CA0075.outlook.office365.com
 (2603:10b6:303:6b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 15:56:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 15:56:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 6 Jan
 2026 09:56:42 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Jan
 2026 09:56:42 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 6 Jan 2026 07:56:41 -0800
To: <buildroot@buildroot.org>
Date: Tue, 6 Jan 2026 15:56:29 +0000
Message-ID: <20260106155630.2404514-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260106155630.2404514-1-neal.frager@amd.com>
References: <20260106155630.2404514-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|BY5PR12MB4308:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b2663c0-5448-4544-a292-08de4d3c30f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sIZz13a0PjHI0zGmySBOWdvf6KccWsuOcU3Q+xXW7fJ1cspQGF0u/hRVzwqn?=
 =?us-ascii?Q?UqK5UJrZz/4r0zfjp3bsw0rba+7ahYxyX+Iz8wnpA+Im4igE4Fd3HJKSnABk?=
 =?us-ascii?Q?s20qHzVFqTM9KjzLYaOrcNoBZCEXi2hYSG4M4hVz1p7CTa6b+tSQYDS4nZVV?=
 =?us-ascii?Q?k5LQWI0eNR49dMYXYkLgtGVnRbo/dhiFyG8TyaN2qdHwr/6vd7GByDr1CzZX?=
 =?us-ascii?Q?qWkRBkpdgKuRn2yT1k769oZknxdOVyftSBIiJSBcDt8i2IWF9cq6+1ob9oJD?=
 =?us-ascii?Q?8cGC6aPc6QFTf5mLE6oy6fxqZjOHp/Fp/nON9hpgroiEvfH8CMqvPxJmD3z/?=
 =?us-ascii?Q?OPjL9PTGP8OG/xi/+75auUgDaMLLa/8tTl0m+OCvC7gW77VucG6bRzEAWmSP?=
 =?us-ascii?Q?i1XPogtTN9gM/RswPojsN9M2OUbps0Xa2gK6fk+ggz5HAF6jfkQysyH8Z7yb?=
 =?us-ascii?Q?yapqvQ5UsweGVNp3Y05NkYhJvqQGVU7VZpYpEYJUBI0L/GsgINI0CldvT2FW?=
 =?us-ascii?Q?XE5+V7vB15ml8IkeD550Z06oyNsfe2VUSAorR2l6grUUMBhBA6lZ5Vm4oQ91?=
 =?us-ascii?Q?as6kkFvpl2QM6kvytpoML5DFjDib8xaQLJgGnhCgRbdzvJLJ+CN5mJLEvXwp?=
 =?us-ascii?Q?skngKURhVCs6lh203HSplUdXuDwtFTxmVig/xF4uEttPIVuIBm1RSDcgDSjI?=
 =?us-ascii?Q?SFURHLhKM0p2ykV/qVNffaTbnvAbPavfA44gNOLnn9Mx3vfjjF6AEaFROihN?=
 =?us-ascii?Q?jEn2jY3lVVPlYRUg4jmXLBVUDV2CjPKV+AlqCKt9CSACLcgReeU2xNYcbAgO?=
 =?us-ascii?Q?kKTFwBf+1ZXCpBbyTmE457R9epViBshovtXUZUje/mPQCnuv7e70Gk3KqHlp?=
 =?us-ascii?Q?yPr+fj6nixkqmeEIWYPi8hTWw3RthUvSIgMA/OoFdna9eWuPkMvEOCYmfd1Z?=
 =?us-ascii?Q?NfApWD5m5x/2A4glR7jcT+b2pEEB5XzCOgNaTrygjbpUk5Uvxrfmd33pz7cM?=
 =?us-ascii?Q?90N/DvlSr8179MVejDPcjRJJFMj9MAJZbTHGFixRaWPPDFQPNwvdraWb83hL?=
 =?us-ascii?Q?0h+P2SZHO2QNfprnlDpWN/XiyjKp9IEgoTlaY0zQ1R6Lh7TB3N5kZubuN3IG?=
 =?us-ascii?Q?oHQVd40LScp2MumaJc3cduXvYWlhCcvG5VXzJKX4whgohy96tr0aqi4lFLEf?=
 =?us-ascii?Q?XLjbbmjlL8+udrZ0B+Hjvt3yhZ5/nOGYG3GFmddIyIDy+ycSDih/hcJSQkjN?=
 =?us-ascii?Q?cC1TYf6fC/8Hm44lv9WF9VTf9/Ok/xVWd/ZGNj3qwBrMuH1AQDEDRLn3YL3R?=
 =?us-ascii?Q?secizTWi5ZjLtsdhQBh/YifJ8tb0/Z9P+nnVnYqBAI+4r7UU9GJpDSI0FUAd?=
 =?us-ascii?Q?mj/cpoa44VDOFjk22x8m3o8O4Ha8pEtjrIuaSRff4aEMDZBvJXtfgF3zPX85?=
 =?us-ascii?Q?DSviWd2Xf2IV9yS1jkZAZUTuNlIZOApnPhlvSCF090o/qP/Kz9P3rrLu9D1W?=
 =?us-ascii?Q?3+0ydPduQMYtLXg6prZGOlVsiwbvY5CtfTo/mYn9T9K2Sm0pe7/czZTvR+Ib?=
 =?us-ascii?Q?e+HshY6guki22Sy4GxJik6Yp60orQX4LRw3IBobk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 15:56:44.6658 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2663c0-5448-4544-a292-08de4d3c30f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4308
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CK/DlKgS1RxoSqWJGyYvgH7O9RsyRlVMrHw7+uWk9ZA=;
 b=U+zuqsFt/MlSaiqNjEDBJEky+wrjRfO7PEBw+8aJ46vK9mVlTE5ARF+2RU/S4eSHwEaoaQvrZD4F0E0LT+btUBEsdwgEY0htsaxKu87OY2DhCjkUL58yV3gfj/Mfp1AWA60wqOqQNguEMnCtOY6y6Ap/K63rEGl7ZH95DSC+PHI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=U+zuqsFt
Subject: [Buildroot] [PATCH v1 3/4] configs/zynqmp_*: bump to Linux 6.12.60
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

Bump the zynqmp defconfigs to Linux 6.12.60.

Run tested on a zynqmp zcu102 evaluation board.
Run tested on a kria kv260 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kd240_defconfig | 2 +-
 configs/zynqmp_kria_kr260_defconfig | 2 +-
 configs/zynqmp_kria_kv260_defconfig | 2 +-
 configs/zynqmp_zcu102_defconfig     | 2 +-
 configs/zynqmp_zcu104_defconfig     | 2 +-
 configs/zynqmp_zcu106_defconfig     | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 95cb7ea50a..08a5714387 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 00862b07b8..85caab689e 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index bd7c43e2fa..d5bdca42d3 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 8e9cc3be36..a0c99ac01d 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index d425ee13c7..acb8721225 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu104-revC"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index c8652d5502..9caac719d7 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
