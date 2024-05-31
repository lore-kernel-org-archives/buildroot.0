Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A427AC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 09:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CCE34162B;
	Fri, 31 May 2024 09:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zo7rBjySzXp1; Fri, 31 May 2024 09:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D289F41651
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D289F41651;
	Fri, 31 May 2024 09:48:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1DF81D5049
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E57160641
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PtSzs8muOw9o for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 09:48:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::600;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9695D60612
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9695D60612
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9695D60612
 for <buildroot@buildroot.org>; Fri, 31 May 2024 09:48:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxgh5s3bvafxTgaiu72o4JqFsU4J3Fxc6AWvKFCO3+tVjXeNmyt+UcfaaxWTNgfLtezzAZ9Jiajiw+m+xk4D177JdUlPPSIMudTKit4FuwhXt1Rylv95UzsAj/5CaOyMb/JVz9vRMYCPYaHGlTcR9TQrLETTM1iz6I4X9Ed7IWWlDQeEMf1gzA+cIU91GUxTfUJGPy7efMMr+hBb/OE1ydfsdRWPwmcPvidHbuLrIrby/T8hsltcI963WNy93KTmd6qD0gFbFi8XFusJTXhs2R4wjuiW74vA8ZE443Bw8L1pXHBR29ByqcuICERintGnHXFP3ArJB9ViLmb+fuBmwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQV3FwxFyjdh8K2hO7k3lM5PXW3fVFAGc99HU83scCE=;
 b=MQ1N+GAG/q6cCHITmy1HiZNt7P0imtyb5OnwMDt28NBfUw9qGtZQxbtgoPqShT5t0wqyQ2YaQrU22H5tnp9bd8v4YhuJ6CjI80Qpg/bFbpGKhgFYP5XG40nososqxhXB5URR04hWNtAJM1W8Jt9QQzsmGS8YxxWmkJbfmveRGtVDzWZbk3QW7OSYuCsQ0zOI1NsQDgOU6R2WO2LwJuufUp/zvrqVccd0RI9HPL6haG4KMlm7rbdoedHMcBmPqzlE3h9P0WZ3KLdxGMcmHxRnYDAldSPCX9VGk+35KWOc36yjqviuTfnZcmo3nSqNfaLc1n39uD7d4IKTKmOFZoiMgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR13CA0043.namprd13.prod.outlook.com (2603:10b6:610:b2::18)
 by SJ0PR12MB7457.namprd12.prod.outlook.com (2603:10b6:a03:48d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Fri, 31 May
 2024 09:48:03 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::5f) by CH0PR13CA0043.outlook.office365.com
 (2603:10b6:610:b2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.7 via Frontend
 Transport; Fri, 31 May 2024 09:48:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 31 May 2024 09:48:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 04:48:01 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 04:47:59 -0500
To: <buildroot@buildroot.org>
Date: Fri, 31 May 2024 10:47:48 +0100
Message-ID: <20240531094752.3760287-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531094752.3760287-1-neal.frager@amd.com>
References: <20240531094752.3760287-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|SJ0PR12MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bfef879-2d87-46c8-85aa-08dc8156c315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|1800799015|82310400017|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZFKrGOjif0FqZvwPHDJJkBarEsrm98zl5KpE16Q+o51Hx1dNMkS/JeJRRy2f?=
 =?us-ascii?Q?iBhZoGxwpUIU31xRqZx0P0+ywtOpITfMV3IZDSwysj58tDy7IN4njTgccl11?=
 =?us-ascii?Q?4volgHPxamS46jVPHPIoLTVx/qLyFYEvXTghcPaLTCML/TwS6bdhojB6dSp2?=
 =?us-ascii?Q?c2WlEdUwuKnMG/8+GQelMQBOeczZ0GcAatyT539ynpQgQc44oMcslPgbBRDT?=
 =?us-ascii?Q?L28JBjMQ2NszBdogawCO1t8yp+euOKfJNjnbkk17domktuvyuPCkCcrA61uJ?=
 =?us-ascii?Q?s0S7F9oYMXFGEz0gWXxqGaIkYK0gl3nn+zdo5uWMaP7Uo4Glkk27unc5Vva7?=
 =?us-ascii?Q?NgdkB66lJt+b7xzPwgk5wLnJVWfv5TtnbutzzniWp8yS2l+QlyNH6dMPCnxI?=
 =?us-ascii?Q?afPhbWYZNOg3i16ph2ns9iDts6Fs5RHXfUzO7oCYlJ2yr8+ePhPq17RTXPE2?=
 =?us-ascii?Q?ECSTMG/FZ7jFkH8NIE1BOHuyCC6YX06mWFN77POvyT5h3lOOxhadmgEl6i5t?=
 =?us-ascii?Q?UpDn785wJmnteYJEDcrmGoEp0ZADzNDBK/KdNzdAP9HqI3sf0VlfNaUOw9Fv?=
 =?us-ascii?Q?RY9VbG2JE/OwGgUDElxABbiu3E1x1OBpC4zsGWEM9hx9amQ+AGeFMoAlJOXz?=
 =?us-ascii?Q?jSus9qUclvLUHvOn1Z+AyVXmTq74CtQL03N7L+Z4JYCHTpUOn1SBKx0JyTEY?=
 =?us-ascii?Q?IUIIU8KMAkKIxFAgmI90pGAczXyl8gggbHuJXEgMgwetqDXtBPnxe2bic39p?=
 =?us-ascii?Q?Q0QiaN0vo6OPhUBtPAGK93ckCbdRDJJuaBxyLUs6YgmMMJ2UOrngVpEy9RR4?=
 =?us-ascii?Q?yCxYyFuKUU1sWmifDhnYw/HX1QgM1s30/opDWAOLr3PPwJVZ0R0kycBUObtF?=
 =?us-ascii?Q?2sJt++Njz7qVJIxVZpK+DHkDks078AOrcpS3HH+HGSBd/ZAywYTb8/j8HPYc?=
 =?us-ascii?Q?zOjynaSyrwoWxnISIoAYzMAMyJ3j52XQPGpqwNsASknyafYFvbHeEJsVxp0R?=
 =?us-ascii?Q?BSzdjVjzf+l9aA8Dw1tlk2jbzunjl1ZCeXKZ55Ki5Sy0vx1nvHDjclDNKH6H?=
 =?us-ascii?Q?bSdDUwG4v7i9vDbFqQRqhgm7DEPiDdOew5DskpJi0SRCvuWVz+xqAgjJJluX?=
 =?us-ascii?Q?g7xsn9BAYI/EuOOxWtqm6NQHiPN094rhT/NzVnb5HCRMzLzhpjatlVIVfVGC?=
 =?us-ascii?Q?yNHZW2Rj9iS31ho49rBYUXKy2TTzWaddE+VdKLwGrWLCHtVt3Jyag+XIPVZp?=
 =?us-ascii?Q?0ejG1t/hRpCMwzx/u3KyWuemRVfTmM7Q5gNWOVDj//UOL767rw+D4piU+WpP?=
 =?us-ascii?Q?ASU8/KMAWIAc9wxDgP17/5LZqQHfPZpqHS59mSbBrhlMSw93zwm3gvzLC4mk?=
 =?us-ascii?Q?qYOjGdRywiGBvgDpGYDVKv0vLRHYkGcm2zRK9OEdDm8zNwicuw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 09:48:01.9124 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bfef879-2d87-46c8-85aa-08dc8156c315
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7457
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQV3FwxFyjdh8K2hO7k3lM5PXW3fVFAGc99HU83scCE=;
 b=Vr5afhkzHW/z8VOG4BBy+fgzbK1OeUTCu82tMHd4so/3KsLPIyPnt/1WEeyj3Zf/YMo0cucMqnWzYJCNxQMHzdfeH+mhotrWb23sgxTJLfbyCsPWEwnGp9Rl4m8OeNuiuLEDXp+e2aDw7i9JDd01VvVYToREXUPozPjfRPVJHpM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Vr5afhkz
Subject: [Buildroot] [PATCH v2 3/7] configs/zynq_zc702_defconfig: bump to
 xilinx-v2024.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: martin.chabot@gmail.com, brandon.maier@collins.com, ju.o@free.fr,
 juju@cotds.org, michal.simek@amd.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynq_zc702_defconfig to xilinx-v2024.1 which includes
the following updates:

- Linux v6.6.10
- U-Boot v2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- update linux dts name to include new xilinx directory
---
 configs/zynq_zc702_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index 84c8843ced..9e37678d9b 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -2,26 +2,26 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/zynq/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_merge_6.1.70)/xlnx_rebase_v6.1_LTS_merge_6.1.70.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zc702"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-zc702"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zc702"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
