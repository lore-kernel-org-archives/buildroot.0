Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8981DC27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 10:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D59D640018;
	Wed, 19 Jun 2024 10:14:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yVdZnZUm3Zbi; Wed, 19 Jun 2024 10:13:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 763B840139
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 763B840139;
	Wed, 19 Jun 2024 10:13:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B360B1BF2CD
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 10:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD05E80D8E
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 10:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sp_28aIgHpri for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 10:13:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::623;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4660680D34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4660680D34
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::623])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4660680D34
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 10:13:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3pNK6NcZFZmllrKY84nKiXsvIXLvVW3ztBGLsaw+daNrxF4MacUviXjn/UPUmhoz1lS/MhvrFmO1kVxq0wuZEKN9OikOBBKepQLxyZ/ScpWF8rsN9l0YbZfVPMmiaqIlXWt2qEHG6T4xFk5ofUhBesYz+wmPdn3Imno1X0Ew2DtgvX8Xr1U9cF6sIhQaXklSg+tCYTcJotkwPpFLRmJ33RI/hibaFdvpgQ2jTR8uqRghCWoUUQs+3OZR8blQGddtsluxgyDjDTmErAaFywn9Jwm20pmcxhSyOMfUkBXnE8IM2Jc6BICCugy+XVGEV5JhoMC1tAhTCyTnwRXvrBRIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJdU1TrxmBR3XO+n935kAKxgclYtq5BS71dvKa7fXw8=;
 b=i1Nzvmx8apwIOkK+tLUJewvc63WD+/l+hoAeUx6JDg9occpYOZ4xcXnbrZMFuFSqVUQu9UzHiRZgMenkJ1AnFMELULTOK17jwMH80AV1sHxGeRqr2ly7wPxw+CINq4//eXUd6qQ3/MvM6l49AWedAZkskx5RLomDcFt0O60j6ylM1mnWsjq/K42E0xY5M4Yj4qXXph6kByzqXo0nsCv6aqmsrwYDgx/CbL4wLfCuGxB10E/0GMnp9SLEoGnrIWnzhkHZShOWVJbanYC8quoMH61tdW+/BR3LyrFEMY2xu3fn5cERR/Ro5rWvSbl7zCT0Qt8pCJaoK9/aGCGmM6QtrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR18CA0004.namprd18.prod.outlook.com (2603:10b6:5:15b::17)
 by CY5PR12MB6129.namprd12.prod.outlook.com (2603:10b6:930:27::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 10:13:53 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:15b:cafe::74) by DM6PR18CA0004.outlook.office365.com
 (2603:10b6:5:15b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33 via Frontend
 Transport; Wed, 19 Jun 2024 10:13:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 19 Jun 2024 10:13:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Jun
 2024 05:13:51 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 19 Jun 2024 05:13:50 -0500
To: <buildroot@buildroot.org>
Date: Wed, 19 Jun 2024 11:13:43 +0100
Message-ID: <20240619101343.1240550-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|CY5PR12MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: c1642390-319a-4862-d736-08dc9048852e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|1800799021|82310400023|36860700010|376011|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mKPrO+mcC8UbRhtAFVjl1iBGedgOt3k5KnZDTuVcajPUpaKw9F8zGDhI2vbr?=
 =?us-ascii?Q?FuRynvUn8D8veHnYdRRGKewGjXHVUgNdtf/LwK7q9srWh0tfFMSEm5TneIml?=
 =?us-ascii?Q?KOhyzu6PqMXWm2LRIA2znRevQqRWp/rww/HXXpY4WjlQjXhKhwLDpgCcrhSm?=
 =?us-ascii?Q?oWTiikmnv1g7LEWcFEP93qgaAhP9QtPPO+TV5CxF8i44FpD9/ekUP9uBDy9l?=
 =?us-ascii?Q?TePffMgunuBv0/fcpH7F3ALvRXPMx8JeVt4QsuOfQhjRYo0cOsNnHwq1MTj5?=
 =?us-ascii?Q?Vhq5j2Ya0ggsFt+hw2YiUGlq4jLVcLMkyD6twqqXSIBcMMZ/U4GaGpZen3y9?=
 =?us-ascii?Q?cw/b34LI8r/aQ0fdg4jH83gsGeGLDs4YCR6xqs6HeP10BnuEVkLQRfGivM4k?=
 =?us-ascii?Q?QInoVikp5FukPJes7ZtREyq2vCDPSKgWALkFXhmak4qcK/XRxT5Th1MxI3od?=
 =?us-ascii?Q?aI1gfoXbS4aFfK/GWOIK3/k2U9osVhLv2t8ZTsmTSiKdBZLBa4BMc7n2WIy5?=
 =?us-ascii?Q?9l3Ujguzd2p3M9wQ99yrFxejH1N3U781XWffOUgqp0eYju7HsvuQK3TjvPOq?=
 =?us-ascii?Q?pgekg1AEvm9jEkmlbGC7LstB+892KhPrfMPWsRqugK/+sOOJJ34RdT6f5sTO?=
 =?us-ascii?Q?i2YzoPIz3xRVIQvnkLDmLIcH3gfYbxuPLPmxso+io1qvoL9U3zJXSR0BXTPr?=
 =?us-ascii?Q?MxUGsh16s8A9Ja3Sln+SlpxIJb3c6rzrCUbP+5IU/SEV+/kN90vF8xPwrl0s?=
 =?us-ascii?Q?Fbg9l1FEGcte5fmC2762xUHZyCiZDIdkQ0Lon+2pzVeDdl2j6Jncxo5vPfqZ?=
 =?us-ascii?Q?xFpdhvblgi8eqLRSkVqRDmelxbCsiIRyVTPYw4cMI2JPIRmCLXgGEplI7Biu?=
 =?us-ascii?Q?rAgIy3ERAWjhJCxFTCRA3G78i/AyCTagNe4SNwvA8iobioOOI3JBbcDQzzD6?=
 =?us-ascii?Q?oiH7NleZezQxrORPd4P7Fotad4m/49mfAJIoRJANuC85M7JPqnzimT1iuoZK?=
 =?us-ascii?Q?o88JfPCD4byHlnAqtQpfxyyWa1YGCysr7CDU/m+2icjkKIpu/Caebw5TzM7u?=
 =?us-ascii?Q?5hNwOt2IDizIPRreAtOcFsiMIxTaQcgdVp8uIysuDuyJ8APh7s8H+Lu5gB4q?=
 =?us-ascii?Q?hPFA44/R70RvUuNuJ2leXVsWlZQMetgicaK0DaSMeibUn8fz3kDfT0O6bUaQ?=
 =?us-ascii?Q?tO27c0lRPwnY/N0sxAnvE0GplI5nS40WFBvTgWoR/vCh5hOK6sQP9lshPNrv?=
 =?us-ascii?Q?MnNwJQh3sKfTi1qpHnWBPS1zz7jc5veAuDMDLOqklETDY1xGgzobGehXu/7T?=
 =?us-ascii?Q?glVN0rkcqcgOQdukXB6zpd5vLTsPtHfeL/RwekR0fbGWCpqF4gTc6JA6MuSf?=
 =?us-ascii?Q?M0p4VuokXaFFEOcH5+2+jpIgjttG?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(1800799021)(82310400023)(36860700010)(376011)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 10:13:52.5158 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1642390-319a-4862-d736-08dc9048852e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6129
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJdU1TrxmBR3XO+n935kAKxgclYtq5BS71dvKa7fXw8=;
 b=UdVrqJ/vCoOoaTpjbfYmuKA+cK+GDELTMvr6UaP6CuCCo7fLgpmTinmzU94QPohTQ2LliNvCJMMWtUtber1KNiiXdsvLuSE1HpUQXF1BZ8+7yUsNh+rhuxyL/BduEftyTDsg1Oqo4hSctSenbYt9Axe/XBgevLrpYeZFOna5bGU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UdVrqJ/v
Subject: [Buildroot] [PATCH v1 1/1] configs/versal_vpk180_defconfig: new
 defconfig
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
Cc: andy.a.kennedy@collins.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for Xilinx Versal VPK180 Evaluation Kit.

VPK180 features can be found here:
https://www.xilinx.com/products/boards-and-kits/vpk180.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS                      |  1 +
 board/versal/readme.txt         | 16 +++++++-----
 configs/versal_vpk180_defconfig | 44 +++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 6 deletions(-)
 create mode 100644 configs/versal_vpk180_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 8bfd36f1d8..708a02162a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2341,6 +2341,7 @@ F:	board/zynq/
 F:	board/zynqmp/
 F:	boot/xilinx-prebuilt/
 F:	configs/versal_vck190_defconfig
+F:	configs/versal_vpk180_defconfig
 F:	configs/zynq_zc702_defconfig
 F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_kria_kd240_defconfig
diff --git a/board/versal/readme.txt b/board/versal/readme.txt
index 9f234be620..9cf499b35b 100644
--- a/board/versal/readme.txt
+++ b/board/versal/readme.txt
@@ -1,16 +1,20 @@
+This document describes the Buildroot support for the following
+Xilinx Versal boards:
+
 ******************************************
-Xilinx VCK190 board - Versal
+Supported Versal Boards:
+Xilinx VCK190 board
+Xilinx VPK180 board
 ******************************************
 
-This document describes the Buildroot support for the VCK190
-board by Xilinx, based on Versal.  It has been tested with the 
-VCK190 production board.
-
-Evaluation board features can be found here with the link below.
+Evaluation board features can be found here with the links below.
 
 VCK190:
 https://www.xilinx.com/products/boards-and-kits/vck190.html
 
+VPK180:
+https://www.xilinx.com/products/boards-and-kits/vpk180.html
+
 
 How to build it
 ===============
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
new file mode 100644
index 0000000000..253a6d2cff
--- /dev/null
+++ b/configs/versal_vpk180_defconfig
@@ -0,0 +1,44 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk180-revA"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
+BR2_TARGET_UBOOT_FORMAT_DTB=y
+BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
+BR2_TARGET_XILINX_PREBUILT_BOARD="vpk180"
+BR2_TARGET_XILINX_PREBUILT_VERSAL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_BOOTGEN=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
