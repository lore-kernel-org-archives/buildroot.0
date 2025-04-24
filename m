Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BDFC369AB
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 06:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DECCD410BE;
	Thu, 24 Apr 2025 06:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HR7RSWs_Isxu; Thu, 24 Apr 2025 06:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9A2340E02
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9A2340E02;
	Thu, 24 Apr 2025 06:36:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B86C8EC
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 06:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C89960756
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 06:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1J_vem2ddq1t for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 06:36:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::617;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D2F6607A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D2F6607A4
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::617])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D2F6607A4
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 06:36:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxldHn6VEPa0aYFfXiIQDEs5rNuUcfEsxaNzNGmilt96DWLmMkCv5tsLYgd/9qFzbgoTOOIxboWuQz1L+t5q6ji5o3bf+CeRMvL1ysDTMLizafRkFPR+7/4KiQSzMJPsLYr/f3dBPPgqKlfEFcJVjnD4VEcRXtrHtvW8jOXNo95ntzqKZ7khrYZ/rChbv9jMpnHOro5FBgoaI6BBlM8srb23ul5x1D1+Z9Xfp1kklRi8/+DqRexhchPGRWEUy88TeFuovVdn5dLV5+hmHkYq0OdxLgwLOSk4n8t+jPtVWSR0raR7XOEhm/xgjagBRudesPmSuPQ0cC5A3YlZtO9rMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sb5mRhIuhjfl7VqwPwEGj2Eys9tW6gk3GcFY1Gqfkcg=;
 b=uGuQKi0HXibCCOCKH2Xzrk45305UTB2+Gx36R+k1b3bY8QimPP7HL0ej9WNUdrOLNS3unUwnVWCOZYLpJwjJBrX/VOT0vl9b+wIEKXnvjBXo3kIwrzq+93oDoxcdDIuyLbyYvBF/ZSlitMOFqUbczwXOlbVp6f8G0/Z+YVqxUrEi4ghyTbp41L1N6B4ZPdOynYEPxdRrs0VDXIdrIM39XQEA/LlHw3HNSt0RmA51ASw73Q1TQRijp9tt8eabSFFiRAe0bdE5vTCjLDuT5jDir2henT/g3JuK9DnZVRK6McaSGddqUiPtMzAwlbHu7b3mToeWLbq48IQbhLmiK74BlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN0PR02CA0020.namprd02.prod.outlook.com (2603:10b6:208:530::31)
 by DS5PPFDB3A23D1A.namprd12.prod.outlook.com (2603:10b6:f:fc00::663)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 06:36:30 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::99) by MN0PR02CA0020.outlook.office365.com
 (2603:10b6:208:530::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Thu,
 24 Apr 2025 06:36:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 06:36:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 01:36:28 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 01:36:28 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Apr 2025 01:36:25 -0500
To: <buildroot@buildroot.org>
Date: Thu, 24 Apr 2025 07:36:19 +0100
Message-ID: <20250424063619.789456-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424063619.789456-1-neal.frager@amd.com>
References: <20250424063619.789456-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|DS5PPFDB3A23D1A:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aa6749c-5bbe-4361-e1b0-08dd82fa5870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PZ+zcDhHxk8jEP5apRwpBg5ac1cw9KzAQ6nT1XF4xAGnTi8VwwWX6tL9TTR7?=
 =?us-ascii?Q?TdRikTx3kBSjvQ3Sk41ysMRf+PDeLaqc55ZYKIBdYDnlDKfrpbkPUbvQAxVC?=
 =?us-ascii?Q?RNDrHI27ifdiUqqBgUsOoJN+Ys/0b4+d5Da/UIukVkB5zdPl5VycVmYCTtBf?=
 =?us-ascii?Q?FCiqF+YjMxduNRZfAN1/N0vF3MTMpJ09Wa+zvBc4tbfvs1yLyMj81L2dwQ9b?=
 =?us-ascii?Q?/yeo2h9B9gpLmpMqavKI2o0v2VBfy/D9k9g3iUQHorNC/tHVBGWeAamS4wu2?=
 =?us-ascii?Q?ZYrAydJknJbXUm7bJFocanmjjTRfkllYeEl8iLT2qcf48N5FWKvU+5xmrL1z?=
 =?us-ascii?Q?Y/YUJiHqnjFlqGTdzgRXB+x17rD7zDmcsd4X97T39KaAM9+g/d2Lg9hZML3u?=
 =?us-ascii?Q?GJgxUixI//NKDLd8pp5eqIjAsBsrhabB/Ty3Aa4Oqqj2q2beMhTO+OXqOKR5?=
 =?us-ascii?Q?cHATUeQsKgdNZfHUd3rrBdqr1I+blCw8CdF/IicjopNMLGG06/E0TtFV6Yo5?=
 =?us-ascii?Q?wiUUF07u7MlQPNoT2j796kfk/gpwf8XaI+mUcdFuVh0WpIzSmyqrWwvK+i8p?=
 =?us-ascii?Q?3OejRpGVf7xBoM3SYtJ3vmNDvFHLGPKS4iyLBazQQ5iWyr7cn26Va03HDuO6?=
 =?us-ascii?Q?HL0yGVJ1szWgCWrxfwfLkKCZ2WaJXVYOMT8HUYiK+dJ2QQJB0xLOZVBWi26G?=
 =?us-ascii?Q?WiFUW4RITnQr0mvk9om0rEUaJQkvpFk+Teeqc11Dfh/LwkS2ZoUYjHF9njMl?=
 =?us-ascii?Q?WPJM7y84WZapF5Uqcdh9UI7uSdFqRUBpQO7G6cdlSax43b2Iy2y8bPs65uzN?=
 =?us-ascii?Q?0JeIQuncujYttJ0rNuQ8tFonWa7uR/IzPkfUjEmbrAzYWLIDCLq1GEQf5s85?=
 =?us-ascii?Q?QoCkMvSJ2yDzWg0uF0YBnxPmsDLpkrKUb8z5q9RZJiMtQ5I6M96QHwyi0WNo?=
 =?us-ascii?Q?NgMSsd3cVgdhAwi9ls7X4AiQ/Y5phySMEvwr+5lx+QbQeOFW+qkHTWkOJayW?=
 =?us-ascii?Q?/7EPZg6oLuY0WAL9LrSTOhPuDkOeEiAua2phf/CvjGo2QwmJobOnam30irc6?=
 =?us-ascii?Q?9CCNTKnrDxYjQiU8Mp1sieGFt7spm2m1nS5IXBxNDg5vHTv6gfX90OcI9iYR?=
 =?us-ascii?Q?l6itXb+ToBundKF3Lo7ZzuTNLXh8hU0dV006TIhWCbBwx/qkTDTs2GqmdyUk?=
 =?us-ascii?Q?8C1hPs18E4X87BVrWc6fCRPtnCGJJnXwrV1fhiC3iuUA3BNe8f8HnnRbyFKF?=
 =?us-ascii?Q?pD7OuH8lxf2FmoWRtD+J8O5pAMFUkjvxfoZhsb05sizCYH2FWyLTO7vwIwxH?=
 =?us-ascii?Q?joVWZBjZLGCNmDVmp+Sd+5hc4inbNIV1ICqha7aejEsPFmlemFTegwkstGW4?=
 =?us-ascii?Q?afacOzD7Choh6ep0W88H1Ejrk75ntpOGopKmIedaQE0SLitH678XznaRluKy?=
 =?us-ascii?Q?DtuocF9WelYTj8bjDJYFQwNCfeTSFcGJ9YhtYIcK63lop/mXlvCqzIaURfdk?=
 =?us-ascii?Q?+FAiog0lwT5i3c/6rVr59N/E1uwRmxarvP9lRERL17pfsJuwn53Z/fXXvWNy?=
 =?us-ascii?Q?dVfydEZmo33BV+a1lIA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 06:36:29.3282 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa6749c-5bbe-4361-e1b0-08dd82fa5870
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFDB3A23D1A
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sb5mRhIuhjfl7VqwPwEGj2Eys9tW6gk3GcFY1Gqfkcg=;
 b=2yxU7rdpBITccCZre90anjZMoHvxS5nAmdT+cbIhwh8JSQBXY9RAFbR/lPgGdBGOS9xxbyKyfAHfDZoGDCx9Nw11TzgnRVOY1om4i6pm1Aqy2NRpTAQzWnPZLiOvsDtrn2w3r/6KvKh9TY1Egi5/Bw0Y49bw31fTkWwImJWVO7g=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2yxU7rdp
Subject: [Buildroot] [PATCH v2 2/2] configs/xilinx: add xilinx-fpgautil to
 xilinx defconfigs
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
 Neal Frager <neal.frager@amd.com>, fabio.caccamo@amd.com,
 romain.naour@smile.fr, michal.simek@amd.com, arnout@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds the xilinx-fpgautil application to all Xilinx zynq, zynqmp and
versal defconfigs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- use new xilinx-fpgautil package name
---
 configs/versal_vck190_defconfig     | 1 +
 configs/versal_vek280_defconfig     | 1 +
 configs/versal_vpk180_defconfig     | 1 +
 configs/zynq_microzed_defconfig     | 1 +
 configs/zynq_zc702_defconfig        | 1 +
 configs/zynq_zc706_defconfig        | 1 +
 configs/zynq_zed_defconfig          | 1 +
 configs/zynqmp_kria_kd240_defconfig | 1 +
 configs/zynqmp_kria_kr260_defconfig | 1 +
 configs/zynqmp_kria_kv260_defconfig | 1 +
 configs/zynqmp_zcu102_defconfig     | 1 +
 configs/zynqmp_zcu104_defconfig     | 1 +
 configs/zynqmp_zcu106_defconfig     | 1 +
 13 files changed, 13 insertions(+)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 2f40c210a8..368133e916 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index af8bed884f..1d83e55499 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index afa606ec8c..7729c655c3 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index b9b2da3849..f9be297b99 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-microzed"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index ab42abe655..4c6361a9b7 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-zc702"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index d7ce9cf11a..bc853f522d 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-zc706"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index c9e8e7ea2c..d0fbaf2ea5 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-zed"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 261b73d6cf..4ba4be861f 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 2cf2b98aa5..fdd868bbb5 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index ef6a23f2a2..ff03f87b54 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 762a54d968..856c1d896d 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 92e0d41736..c21058be74 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu104-revC"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 51287fdffb..5e13c39a1a 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
