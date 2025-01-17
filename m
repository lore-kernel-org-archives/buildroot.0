Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C91C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 08:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 728B061AEA;
	Fri, 17 Jan 2025 08:00:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkynYHvc4Pe1; Fri, 17 Jan 2025 08:00:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A72461222
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A72461222;
	Fri, 17 Jan 2025 08:00:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BCAC94B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6E4741680
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LSBxQeTITCE1 for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 08:00:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::62e;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7EB4B417C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EB4B417C2
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EB4B417C2
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:00:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRmcjdCkYsSBXPMFNBtkTUkl1in0VmDYeYkSM+p47NCWVYsJ8uvZJBuVBW9Q/lrhD3gxw7bA/JT2nxkVR7PeH+QYzmzknqXFgrmVWRkS/idOIqKLEXxIihCSS6eEjdKHftqvxa8XhXGo3UV97oxPukfPYSeBv3PZrDgs2GLCaNcSPpxtjiZnSkuQHROIXqPieW596wF8GunG/QylUjaPytBd/ltWP1cXP1EOqBzMcgPKwJMP4778KvHiGQZC82XU75YcqzChWXixxQMJgkSDu7OsfMOTwNulI0yFp/IlwcEAwODSo7eD4VkwXcQIbF/GwqVOUoRDIUMtYwlxZBF85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7+ecgC+VHu7q8ElcY0ABxqp6nce3/2Jru2y3cDEKE4=;
 b=uYZhhLz6FGFrTouEa62blU8RtMXr69ddcpoSshqKySBc5SgfZqSUuE80sl1Q9KRrbMCpBiYhgA1EKfJOFssMhqjLdAgZwatxQitjQrhOC8pmHvei0Gl61Iwg17ZHpJfY0cowk6ntczvDHdly1XvyYfIyitlFkb9JX/Q7B9IVeGP+FqeVadeucXPIA16cIiC39tctW6imvpuG5OCrLFIJ6F4FeJpz6M9xzosGlIOhzl+8/xZ0OGWQHXVGmSitHiooBUo1xLISroi2B/6liJukZakpWBMG+PF74Ivvkzk/54RisbblQxwZR+7yxHZPXcwOK6f96NKJhTMxQs2xE8Dyxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0146.namprd03.prod.outlook.com (2603:10b6:303:8c::31)
 by SA1PR12MB9245.namprd12.prod.outlook.com (2603:10b6:806:3a7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 08:00:24 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:303:8c:cafe::95) by MW4PR03CA0146.outlook.office365.com
 (2603:10b6:303:8c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.16 via Frontend Transport; Fri,
 17 Jan 2025 08:00:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Fri, 17 Jan 2025 08:00:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 17 Jan
 2025 02:00:21 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 17 Jan 2025 02:00:20 -0600
To: <buildroot@buildroot.org>
Date: Fri, 17 Jan 2025 08:00:08 +0000
Message-ID: <20250117080009.774814-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250117080009.774814-1-neal.frager@amd.com>
References: <20250117080009.774814-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|SA1PR12MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: 243be948-5f8c-4169-c03f-08dd36ccff5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qr0Qfcv/5F7kgRvpMVX8tS6XddxmEzPz3js2rv5GZNuiPsa0ISY+xbN7QV9L?=
 =?us-ascii?Q?UJWqCdNvWW5NM/5udkQdKKYC8uTVtVSQz2iQBm9hVtjg1jumMJZBjxvT09MG?=
 =?us-ascii?Q?LUOzGokjuw6ZF/SV5KjwMd4VgNBiVBQUR+QvKZEUVEyeEvUSz61u7L9iQDlW?=
 =?us-ascii?Q?8RfkUG4PErd2fogVU2I9hQOWeHYE0f5dLXq3dAdPametXfgrh7jGsoNZ8xfL?=
 =?us-ascii?Q?LyTYxZejzjblh03+QlQb251EG2y6ISEiInikiS8QOh3X9iMqfFS7kZ+sgc8O?=
 =?us-ascii?Q?6KVS76xXlAS6SuQ6ROzoSk5tnmPhz4WK6/n8IrRp1VzCaFwjfV/VaF8BnJfb?=
 =?us-ascii?Q?zFHC4on7ess17RK9KEulHYVIaw/kgzK0rHTFm7FLWcsp/A1ckMrnHqDK3Jga?=
 =?us-ascii?Q?9ENs5Kf3W/xO3hMYCXjnMRGMn8iiwhr6Xyp7hUYuShqxzBlgzF4ysaHiPFAa?=
 =?us-ascii?Q?lHNSDNSUlA0UCqD6jiLw7nDtXr+lXGk1OVx1+WtdIWlykSY5GwTqCRJGImr2?=
 =?us-ascii?Q?jGr8CnT33KnZU6A3Y4ySGIWi01pS1d9lYQpUIqVK/YmprClJorgTCnUXMyAJ?=
 =?us-ascii?Q?rfX76ifiHYgcvO1hluRIbmeFym1n4HTHbzMLdYJkIxrxsF7BBbhzrXfEewUZ?=
 =?us-ascii?Q?bNHIOYDavogSoGAEMtm8jkQ407+cOm/ion1mPPbXk5KXkG63RLtwpmByly0R?=
 =?us-ascii?Q?ffE7wR5T98zBOkcX7C4oXzmKOrTVrNP4twTEQX2A3c1ceSEkhiJIjZjBpbwf?=
 =?us-ascii?Q?XIeS8ixMAeErkyz3F9DEmSvJxa6AI7psLJIte4GyU3Vn/qh0zs375xb9gV48?=
 =?us-ascii?Q?V1ZZVkzJwmdoGI6EFG574xHVmNF19SeUBwh1sJ8Wu7EtbbUXrZ+4NAjEbdnv?=
 =?us-ascii?Q?xR5JIlCQGmrQhhVk9dfv8wo4X4yJtL+lqOYlXRCmyVblt0JCfNOfHmi2BOd0?=
 =?us-ascii?Q?8efM8rWQw4K7ljUaTYC05oHqkfLmIWi0QbFLbwpCIpA6Ijrc2y59+eiaE+OT?=
 =?us-ascii?Q?AUWWk6WTeH6/dB5qapl3Q3OSKtzFFn9kM3/Gwxh0WMY33idyVSlbCrodH3uY?=
 =?us-ascii?Q?qTOvEqASpTprSBqGHdgEGxACS76eDWHOKxs1Z4rVdlEPn3pPSiZgpZPgwHlt?=
 =?us-ascii?Q?zeirVnOwdcTVowFXxnCdXDmYTmh/jp9KmFwFmPTf2VibhiYKR6eZzmY7hqcB?=
 =?us-ascii?Q?soA/U+8VIfv9RDk2q6sFyQ5YmtvUDUaIVp7l7rZ6WnJDo0H9ozhQXpQFV/6l?=
 =?us-ascii?Q?sQUcMqwyHAmG24Qj96l36uh3Xqf5T0HJ/aotiYDq9RoXJOQo4V2jWHLIuOqv?=
 =?us-ascii?Q?hqj4Rg0G5guaMGPj0QvT/kr2QVbqkMsSf4POkv2sptvLLADN5EUUEnl7jM+l?=
 =?us-ascii?Q?OrW8ck90nOq7wZ9Jo+b0ihBsxWJIL4zkXXnpFCBEiubPahuQWtMKsnYIHR8n?=
 =?us-ascii?Q?QnlClDoKjHi7mprW3qxuUWCvgqDAgxtT9C1z1XTlCZ0C6eIoFoXNiw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 08:00:24.0412 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 243be948-5f8c-4169-c03f-08dd36ccff5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9245
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7+ecgC+VHu7q8ElcY0ABxqp6nce3/2Jru2y3cDEKE4=;
 b=kgdcrN7fvoVSXOwxrc0wXVuMaY9aA5VwbvLYu4E/2ee5i0X6hLmQKwt4+AiSWBKwPROMhkQodSyjv5QKJTklvoprQO3MMUl7wL60TndSBZlg/S0L52hMja8+PaIHh70xZS2BoXqtiM+R+hcJExNAQAVBrPbn/wfmoBVU+34x3rQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kgdcrN7f
Subject: [Buildroot] [PATCH v5 5/6] board/zynqmp: add new qspi.bin binary to
 images
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

This patch adds the new qspi.bin file to the zynqmp sdcard.img.

For SD card booting, the qspi.bin file is unnecessary and can just be ignored.
For QSPI booting, only the qspi.bin file needs to be written to the flash.

This patch enables the Kria BIRT tool for Kria SOM reflashing using qspi.bin
as either "ImageA" or "ImageB".

Kria BIRT (Boot Image Recovery Tool):
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+SOMs+Starter+Kits#Boot-FW-Update-Process

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - new to patch series
V2->V3:
 - corrected commit message to use BIRT instead of SBIRT
V3->V4:
 - changed config to BR2_TARGET_UBOOT_FORMAT_QSPI_BIN
V4->V5:
 - no changes
---
 board/zynqmp/genimage.cfg           | 1 +
 configs/zynqmp_kria_kd240_defconfig | 1 +
 configs/zynqmp_kria_kr260_defconfig | 1 +
 configs/zynqmp_kria_kv260_defconfig | 1 +
 configs/zynqmp_zcu102_defconfig     | 1 +
 configs/zynqmp_zcu104_defconfig     | 1 +
 configs/zynqmp_zcu106_defconfig     | 1 +
 7 files changed, 7 insertions(+)

diff --git a/board/zynqmp/genimage.cfg b/board/zynqmp/genimage.cfg
index 20d8352c08..0a6aea7a29 100644
--- a/board/zynqmp/genimage.cfg
+++ b/board/zynqmp/genimage.cfg
@@ -3,6 +3,7 @@ image boot.vfat {
 		files = {
 			"boot.bin",
 			"u-boot.itb",
+			"qspi.bin",
 			"system.dtb",
 			"Image"
 		}
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 48717eaea0..3668ae6eb1 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -33,6 +33,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index cd1b6e6f7f..637d5cb394 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -33,6 +33,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index cd5ff8b07a..c25c6938d8 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -33,6 +33,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 0a4c4bd9cd..141ec1e2fb 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -32,6 +32,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 2bf00b1b75..a31ddec2b7 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -32,6 +32,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 0117ce0d51..0af4b59b49 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -32,6 +32,7 @@ BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
