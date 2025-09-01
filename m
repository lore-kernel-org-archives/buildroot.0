Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFB3CA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 08:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60F1041438;
	Mon,  1 Sep 2025 08:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0n3SFnKa4yTj; Mon,  1 Sep 2025 08:03:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7904741442
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7904741442;
	Mon,  1 Sep 2025 08:03:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B579B10E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C05140455
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvCMJQdma_oF for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 08:03:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::62f;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 086F34020F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 086F34020F
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 086F34020F
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:03:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrvF8jBbjQAjs3Sc43SXTae5JwUfSWh6bUJMNtmbIwVW+4RWucNwle4zPnlVxPfRKZtm2bmL5jmABSPAEqyrM9cuyhcdvrIfK7OyU9xxd8P9Qj2ayrvUic5L3o8cFPw4/OTHChcXkh/RhqyntmpnkZBPFirK5K1VxA49m717Ytcd2/r2lMVGU7B3DzL+cn7sXgnIs1mJGTTqbyW78PYU+g6YEGq8+VGcQZrxbIP+SQ4qUQrb6WG0wXNPLZRvhTf1PSbWOQQqxGsj3y4JViDwGLCX5puNssUVPQWHEVKQJaJc6JfCjJ8DlpMD0wa5tntcwcqL1vrCGcZEmibtS09wJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29paw6BqdSsL+p6c6UchYF8CYqL9o6Yoc9VXDGr3rl8=;
 b=ftWQYolJURuyBQcBPer4FzM7EwZhYtSxPxymot01K/jiodyA7XElZtMUVmmIffa/SbVEOYjtMdnMwdOF+RkEOIKNkDUpfb1FcjJbP2IUPxTIt38d4aOhVRTpow2mNIkTdFNSfeYsRI7FqPPIoRG4NnNAg78RBS7iTpQ/fYZGbEVkbAD31GU+/5FnUWJvlmBX/OoBomV5HzPGtBWrrzb2tgKdDj1hYf4ckmbuo6vQycLzW6fQ4nyXsljwaFavHoY4mVXm240g4osRsdyHdue16v7OR8Jn+F6VhD+34QsWDs3MmhrvNvCCXvC4nJhjiX/R1A9MLocwWwpt65+KzjjDRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY1P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::7)
 by DS4PR12MB9795.namprd12.prod.outlook.com (2603:10b6:8:29e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 08:03:02 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::e7) by BY1P220CA0020.outlook.office365.com
 (2603:10b6:a03:5c3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 08:03:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Mon, 1 Sep 2025 08:03:02 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 03:03:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 01:03:00 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Sep 2025 03:02:59 -0500
To: <buildroot@buildroot.org>
Date: Mon, 1 Sep 2025 09:02:46 +0100
Message-ID: <20250901080249.454090-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250901080249.454090-1-neal.frager@amd.com>
References: <20250901080249.454090-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|DS4PR12MB9795:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a17e2c7-1362-40fe-7f93-08dde92df93f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3D2LbWEdTPuURF12BT2lBAUqhnTH1M1PWIPsclHk5KSRyMeDDbWE38dsNcOd?=
 =?us-ascii?Q?SW2aLxxkNvrG4Ywt67YOarLd1Q2nBHHJ5uTjDtVu6DwezXaQPLL406wDeX3S?=
 =?us-ascii?Q?giov0p5s5DhdSplMfWbItH9T5GqJdoAi0BYQ0qFl1A/M+xKCXxMxKk6j8Vsr?=
 =?us-ascii?Q?4LW1FVV2GXoCvb2YuGlxFlozzGx2OpxC5761o6uuvWzNwpVHaYttNc+YBrww?=
 =?us-ascii?Q?Zias5BocMkQGEJ04mZW2EnlipisJyACT7b4PusfJYRxLqSSaT4yjCEScW41+?=
 =?us-ascii?Q?sOccSs5Idvk/h9acssMF+GIHFLeLNdsk3VBbG5LM4IhS5k4dv5chqGRztHsc?=
 =?us-ascii?Q?oL+wWXfoHg+rhKLfzoWBPMYaDh/qDDQ/g4K0i7u8m3KPTcEbPafZ/hyJy35Z?=
 =?us-ascii?Q?qTVU0NNMKpBRcIxkrKB8NAKHdEipHE14fe43ZeV+SgaD2NlSsD9NZCz7JOWA?=
 =?us-ascii?Q?mY0DnA3DijUWlVJoRHGM85Sz3n/FjeL1ioDPTHoOwjRXv+kFUR3efUOfDTzO?=
 =?us-ascii?Q?v9X1DJ78qCsLEKQTFEbmKCkJxB94vLdXU1k7uVTg7YFgg4iBAJvJdZoulBuN?=
 =?us-ascii?Q?ZFtyDCCMTW7u4TzwiTkwiSI1pSVHe0/3XGLV7yX480H3p5BrBdf7M0cu+i6n?=
 =?us-ascii?Q?i8xBZ4ryXJWzrLoHaSvTs+EGKGaN9oeOVpqPhKYG6A5SVywBJ2l6oRXGEWSQ?=
 =?us-ascii?Q?832WxzNekx0jvyRKYQGID9A/XyrNgTUX5ZQ22QQqbqhodTSZ64dqeBERa00z?=
 =?us-ascii?Q?GZqgs92FvL/gzgSKb/69id3zUVPfjE6gpJ2HOMJTn/yQTcp8/8jelopwbf+R?=
 =?us-ascii?Q?nnmjYNya9ADpFaUpnLJmRJvKQHU028VFNHXebiIwDhhkNTa2/jvbmAfRwY0X?=
 =?us-ascii?Q?leN1mdIQQbE5YOmleiV+jhg/W2pvkDiHZhdTCARpm/gQRD40xMBzQYLjZ9Q9?=
 =?us-ascii?Q?wJxK3JDAwwAUa1kZ92L6wmnZvqMsrUCOvLK8QtenrenzzozVbJ1APBZF3daL?=
 =?us-ascii?Q?FVVzwXhoXQQvPyY6B3U3DHeq8Ho47mUiSnO4HdOI9iz9jKuaEhaPSV3AwNCQ?=
 =?us-ascii?Q?TV+9EQMYeorvfpYyVxbuzd+ooYrzsJC2OTJaN2qrP5Vg0wst0DPhij7+oip5?=
 =?us-ascii?Q?Wd7pbElp6M0HDAsJgVEarYw5LSvN6vpA417ty2v3W4dXqsjCr94F5Q8zq2gn?=
 =?us-ascii?Q?5je23FOA/boVBs2/XtE/wbKB4JK3K+PHU4qfRNl70eIBw01H9nRBSbYUrU1t?=
 =?us-ascii?Q?TWjk6iYLn9h/b9yo8ZyPk3fe1FsccTSyZXukQHi3ygwj7EKQ0y47zG6jD2e5?=
 =?us-ascii?Q?bSScxCDzloFQRgCTCEI2hq3zhqMfHuVUyfRBuiMERtJznNjmTkI4Ywb9fOOY?=
 =?us-ascii?Q?okhT4nYEmo0SYSb7dbY2SLGcY0mpUt5smUppyo61b+vv91rcscCuyPE2lib7?=
 =?us-ascii?Q?tPZ52DukxrT3Q/DJK40mpqWQNPLGljuVtPRqDiznVf259oGeT7hYReSGNxmd?=
 =?us-ascii?Q?zzpjfg7DXu/QEbNquQnbG7heyMluo5CTD7nvEOe+3sbxudjn3p973o/a89Mp?=
 =?us-ascii?Q?yhszobo81JLT3UtPLCHmmGphBXB6rNBHC5EIwekaDC8ZGAZ5+qEClbbaZkvP?=
 =?us-ascii?Q?Dv7J21GrBIlKxM/ZgQPggr75QzezsMEsS0a/D2NDQQQ+fr17dvC1nfQnpTp5?=
 =?us-ascii?Q?0XTHTEH/5OYKNLB+9/rDelKGGuzMShKrhinVoUnrrTNC6GiIiRK0eLjDDBTN?=
 =?us-ascii?Q?NOkLtFtTFirGy9CxbynO1R4/YSk8R5Ar40lR5Zuna122Zy9Mstzgd8cg+mxW?=
 =?us-ascii?Q?3hPHUGJgadCtAON1JybgRUP/Rcku0WnA3dBotrg9J5QAh2IIesLv/UWH?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 08:03:02.0084 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a17e2c7-1362-40fe-7f93-08dde92df93f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9795
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29paw6BqdSsL+p6c6UchYF8CYqL9o6Yoc9VXDGr3rl8=;
 b=RyIWRWeaj1UwwHNV28HWX2KwXO+8lJEkp3lauZA9kJks8LDKU4yvG5dCsTNVYwuf0epLj1x7x7UYkyY3vQrkSaQN0BWe9pgUEW3uOf44GR8mjHzgE+0mSnb8XEBRqKSVovQK5+gGplc8i0xpQE/Q2Bg9aV/iLwulx5YXne/Dp7U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=RyIWRWea
Subject: [Buildroot] [PATCH v7 2/5] boot/xilinx-embeddedsw: only allow apps
 for device family
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

Add an architecture cpu dependency to each application to make sure that users
can only build applications which are applicable to their target device
family.

The versal_plm and versal_psmfw applications are specific to versal devices
which are based on BR2_cortex_a72.

The zynqmp_pmufw application is specific to zynqmp devices which are based on
BR2_cortex_a53.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- Replaced new family variant config option with an architecture cpu
  dependency, so no new configs are needed.
- Updated patch title and commit message accordingly.
V2->V3:
- Changed package dependency to only appear if the cpu is BR2_cortex_a53
  or BR2_cortex_a72. This way, the xilinx-embeddedsw package will not
  appear with zero application options if another BR2_aarch64 cpu is
  selected.
V3->V4:
- Added BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS, so that all arch
  dependencies are in one place
V4->V5:
- Replace leading space copy paste error with tabs
V5->V6:
- Take advantage of BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS from
  boot/Config.in to remove dependencies on BR2_aarch64.
V6->V7:
- aarch64 dependency removed in first patch of series
- improved commit message
---
 boot/xilinx-embeddedsw/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 5f115726e1..3826f2e18e 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -28,6 +28,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 	bool "versal plm"
+	depends on BR2_cortex_a72
 	help
 	  Build versal plm application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
@@ -38,6 +39,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 	bool "versal psmfw"
+	depends on BR2_cortex_a72
 	help
 	  Build versal psmfw application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
@@ -48,6 +50,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
 	bool "zynqmp pmufw"
+	depends on BR2_cortex_a53
 	help
 	  Build zynqmp pmufw application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
