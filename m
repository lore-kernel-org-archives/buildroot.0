Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14F9C27C52
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 11:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6162E414F9;
	Mon,  3 Jun 2024 11:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LLdiHmcjVP5n; Mon,  3 Jun 2024 11:52:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2681414FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2681414FD;
	Mon,  3 Jun 2024 11:52:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A3EDB1BF383
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97CED40CBD
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOqFzIDsXSCH for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 11:52:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:7e88::62b;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 67DD840AB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67DD840AB8
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67DD840AB8
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 11:52:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fREit78nvxNLwhRsAtWtrSkhYsKO4cRgzxXhIq30yAsaBdqvJwrHNE9szhPwbxHhJpmP8wnxmbQCZ+Xn5IUNyST43hiwZHr5flPQnyDMuxaPjGT67c6hyDonOGL2Z14GBN19jpE0ljgkHbNpNHeITL5pLihHdi6GIUzOCWGZ3SWd5Umuw+YGI3rn3PuL7JsnyH6ejn5R4pdBXNE3PHactq+Ctpq/RZpgvNpVx81jybkcHMkwhpuV/5p2KWzU2rz7qtCBPOn+GQE5eGlVDKokGIcVtdVjbhg8mUKn4SQPd2NXmjD+nb6Dad8ggM08tGtIMEOmJaWvk5OsEzg1WdI7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58+A8YAXwMVQFqhLCA2pexeVNUNgc+98skskXEW1BZ8=;
 b=JvdGtOYXuafqpml2q9DtbicErCwsE/k3mdgz/8X8qw1uI8rkeFK41FxewXOgFhxpxZwKEgyFtiFK/G5/X8CcVspJP2eGuiEV3wV1onBgYQKmfncFNZ307YXn8swzYNsvFUj6gou2IZ8ikpRjDIoVupRduB1yglCy8aJfte0woNQzK39YtGKcZAcJgcQ5laDBor/SZtmLTicYFEc6KMdzk9z1dkvVCXgb3mGv2ixzMyzXa8ieSvbvVasqwLzIEHDIWajbBDPlSfBcnK/9oXVva/37LoJVEOJwCio6Ho1sDvw3IFBo/ih54KjozGDaWoEiTi9/0PQ5DcSFhIxdVb2L3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BLAPR03CA0034.namprd03.prod.outlook.com (2603:10b6:208:32d::9)
 by PH7PR12MB7914.namprd12.prod.outlook.com (2603:10b6:510:27d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Mon, 3 Jun
 2024 11:52:22 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::38) by BLAPR03CA0034.outlook.office365.com
 (2603:10b6:208:32d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27 via Frontend
 Transport; Mon, 3 Jun 2024 11:52:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Mon, 3 Jun 2024 11:52:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 06:52:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 06:52:19 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 3 Jun 2024 06:52:18 -0500
To: <buildroot@buildroot.org>
Date: Mon, 3 Jun 2024 12:52:12 +0100
Message-ID: <20240603115212.184529-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240603115212.184529-1-neal.frager@amd.com>
References: <20240603115212.184529-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|PH7PR12MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 8642765d-30b8-4bce-4082-08dc83c3a06f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|82310400017|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6xXEYaRObN5rg4EadATPhjwVZbY3qSuNEHiylzjaXGdxGx0lliQS2nIEYNIJ?=
 =?us-ascii?Q?T05ty5OMp4suq/cdD9fkj00thPqU9hCNG4xrOK7z4I2nV6gRQCWyytdTYKWh?=
 =?us-ascii?Q?T8eArXPJhkAF4bdYLQnYdtcnxln49yrPdqADVniSobd+A6N5V7q1Z8ZSpPAH?=
 =?us-ascii?Q?yxbamoXgHVuFntdheRyHJu+tHsGB7NMQHOZY2eYQK6QcqtplAzGUb+g9eRWS?=
 =?us-ascii?Q?0PYpDVXd+BtvByUbP+HEVUhOjkoYmL7yQOvbO0ifjp6pvAllC10p/xSlLwjt?=
 =?us-ascii?Q?BOOgaNSQvzxMXgvPuPLD0pG/12oMY1W2ZDntnhlxLg6udmW70ekeZcJ6YWDP?=
 =?us-ascii?Q?LkioN68cnwjQpOn2JcbFIru16zDEY1672sM6m4f0xggUWg8VT2vx8p9i9JZX?=
 =?us-ascii?Q?pJsp5Q+QpQTsWbeFhPOm2CfcogNT3MBdIEDlTaSLrqWhTiXvUMF7UowVzemS?=
 =?us-ascii?Q?ylhfEB6Z0xdnfAqOuHh1QR+bQxLp5XR8VilMz2YZA8LNn0a5FxxZIFC9MUhg?=
 =?us-ascii?Q?Y3htItfgsd9Wyuy2mHe3hPLOVq0NUICM5FpL9xQy3IW4ETOZ8esciGWuT4TA?=
 =?us-ascii?Q?vxMYVWzCoLW3AvT1V3q4pGKesIwar0e09ausEk+8nG2mOMsR1gdYUNzF4qJV?=
 =?us-ascii?Q?f8llBjEcyq4R2aYQU4x58MTRRNFGkrpfrxnh7PQL4qZc3SgoGFlWwRRsKa8S?=
 =?us-ascii?Q?J6DeeDfsGUX2rixb/QLW7BS35Jg+1EQDae61qzWhTMdBrYVbLD+yUl+HnsTu?=
 =?us-ascii?Q?3Zdz3UqokoBqW3pcLdcfAXzeomWkx0mbisKh6rmBMVesChYSei3EYNR/3bU0?=
 =?us-ascii?Q?GLj0yfow7oGeVz577RaJZu6VTPX+LfPlxsZ1jT8HwRJeA8sCSmRwc/oEPFh4?=
 =?us-ascii?Q?QsT72fUyz9CgeOKkmBUhqf+A1iZo9le5rYfdN7TxZhFSEihJb6NSgmg9PxaL?=
 =?us-ascii?Q?KKEAGrLU8nD9YVRH8fAjAZzM+KMOUHYKh+IZjQUsbQTZB9wWDuf3R7FT0DH5?=
 =?us-ascii?Q?64tJMw6yPlF2OECmUYU7si8YPbsFvZqkUBd2ae0k8wvVLIPshdfGR6AGhHjs?=
 =?us-ascii?Q?aiGg3PBfjmcPSNQbEGtfyZrHbkt2AtEsw4O/QKhypo6rS3IwuE5CIbf9WJsk?=
 =?us-ascii?Q?TtVnkg5hBEJ5tvR09l1f/UxZnwRAF2nkN/y4eUfd/+An0pWRd1/A+sffJIqr?=
 =?us-ascii?Q?kGrlMrm/qY0oJ9BH1lkqXQnWWfcwVZFVWcowkFqEfRmnYndLffv/cT3/9YNI?=
 =?us-ascii?Q?H82PLBxd313OD4I8o6d384cP+mnX7OqL15CT+5xz74UzlYJcpEboAjE3fb5S?=
 =?us-ascii?Q?zHUp9ujONJ+P2IQ93P1v58IIxCXBh/YxTJqiBditRP5u+LLdw/+xyBw8afOs?=
 =?us-ascii?Q?HNqzp9TIoQv+wFIVTE3kLigp2O5v?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400017)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 11:52:21.2805 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8642765d-30b8-4bce-4082-08dc83c3a06f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7914
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58+A8YAXwMVQFqhLCA2pexeVNUNgc+98skskXEW1BZ8=;
 b=G2vTL+5bwNYRw55hzQAZ+xs9SH6mTCi27I6vy0OvK6X/hIKZQFTQYCLKSfGAyGbOJc23z7WfAWKKkP94dCeay7FWgHnYLixEFpqmDQnSAsP+FUsDEQaZrUYZBqPpUXnHRPfCQDnBd2uhwQcfT7/S6g3+VW/pOeJF6Dg7ZuPmlJk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=G2vTL+5b
Subject: [Buildroot] [PATCH v1 3/3] configs/zynqmp_zcu106_defconfig: bump to
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynqmp_zcu106_defconfig to xilinx-v2024.1 which includes
the following updates:

- Linux v6.6.10
- U-Boot v2024.01
- ATF v2.10
- PMUFW xilinx-v2024.1

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu106_defconfig | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 011c7f0fae..07c595436f 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -1,11 +1,11 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
@@ -15,13 +15,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.2)/xlnx_rebase_v2.8_2023.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
@@ -30,11 +30,10 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/zcu106-zynqmp/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/zcu106-zynqmp/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
