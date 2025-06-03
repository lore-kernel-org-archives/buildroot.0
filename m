Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38044C5B559
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 07:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86A64615AF;
	Tue,  3 Jun 2025 07:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ssK0Pf8Cszn; Tue,  3 Jun 2025 07:36:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 900E661509
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 900E661509;
	Tue,  3 Jun 2025 07:36:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 28EAB15F
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2650641192
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZP2VnvpTM6b for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 07:36:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::62d;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2777540378
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2777540378
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2777540378
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 07:36:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oc5UyAUyo2tKusSS7MS5tanyi3a6lkpSNB0IwBvqdC0vVmb/pcrCytSPOpe66pl41TvLoAv2af98qnzQrVvgaEachdHzTvyup/H1nF2iXSKS2CfjxmerGFCRUUOy0rzW+Ytp5EWWmONUrbNJVFUyKLFmUG/z8yi6nqGb6ymtb7ZySG9YzFh2InTSyDS9u1Nc73WkxAQ7TZErUAVA4ujLPKyNc5EfxcGytIota8koyp94e2USi9SP12xJYUPcryPTTTquZVfg2TBqcWmc5Y8mCFsvKE2cq1gsdoy/h8/Sj7H7Adp1nK368R+8l1wrU9Ucp5z14R72OjIhgvwPJ+mF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdGf4MZQrzBbd4qpaTWeBQLBLufyUWoxV6wnMi1ivQw=;
 b=dh8p+FT5vJeUQjYxpq8wTcjXGcP7UTqqnaSLLFp6zhBTL8i7Jg37cWBVnoS4B6k7VH4Oq5Vly+KQvurF3/VOAm/5nqp9nA81vmLf/QcUkbKAk6WIu+JWNhnm9rbEgYZk5v8qXK62fEDACw6hQOeXCESK4dI5vI98ONfwV5SPc30PLtypfswZVSViJsP6kdPeo+wFkdAm4SqgsyiVa/rPmioOyfqIVtmNHnrcpFTxDu4JBgBS4lervZhDJsWzZXmCERdlbFv809ODfVzGdMJs81Fn5Jfk7cX7BlquN0aaSb6TvSdSzZtIdYk1Bjt7DB3hJn4zSuK4Gvhjz2VxMGxu6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0088.namprd03.prod.outlook.com (2603:10b6:a03:331::33)
 by MN0PR12MB5714.namprd12.prod.outlook.com (2603:10b6:208:371::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Tue, 3 Jun
 2025 07:36:27 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::8a) by SJ0PR03CA0088.outlook.office365.com
 (2603:10b6:a03:331::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 3 Jun 2025 07:36:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 07:36:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 02:36:23 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 02:36:23 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Jun 2025 02:36:22 -0500
To: <buildroot@buildroot.org>
Date: Tue, 3 Jun 2025 08:36:01 +0100
Message-ID: <20250603073606.2679424-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250603073606.2679424-1-neal.frager@amd.com>
References: <20250603073606.2679424-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|MN0PR12MB5714:EE_
X-MS-Office365-Filtering-Correlation-Id: 43143e0e-6283-4775-0574-08dda271594f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DKhMy75jLxS9PycvrNlGMJTV38o+ZA9+wsNmsJVqqGspHAnzhMn99E+E2XNW?=
 =?us-ascii?Q?EE4q/bEc9spNDQggbEiIF+ZDTuJc0939wh//oiUrqAmOQZetbORjHp4fP49I?=
 =?us-ascii?Q?WBYGJlS1RlUgrpfTcQ+o4MrEbNIci989m81eqBgSURWap5/+sngn0IbPY7U4?=
 =?us-ascii?Q?XoxxnOzucltA0onMnNdkKcEseXBoG+YYI2uYvACmKz7oHG0VcRpMNFSgin0H?=
 =?us-ascii?Q?bQ0FZ7NOH925SUYYLUeuUdK74DJ+rGmQY7xZ4vlw8kX3Y9wf2i8SNOAyXOmx?=
 =?us-ascii?Q?WcV3CS/xPNaqBzmamC26N12t7MxN1CJBxS1XfCs9/h7lmIOG8en2NWNe+Fv1?=
 =?us-ascii?Q?ianQnE9umwIOovGOMyBZCgXIqMZ9R6pgxrBMsRyfBJ3TvbIjq6cw6CchtdV7?=
 =?us-ascii?Q?i+q6mp4/4U5fKlK3sLaHYa+iG8IdZVe2c+Bq17EZS5zoyjhG7FQzl5wslneC?=
 =?us-ascii?Q?nbsd2FiiqndddFCVLsfPBIvvPelRqGMcmoqMjFJBUk+HBemEkEgz+kKkbMP9?=
 =?us-ascii?Q?JyDLpRwAHkiuexBLcy1II79lk5ekWpMiLz8h7djZqCdKgpCi75VEq1x2BQAZ?=
 =?us-ascii?Q?nn3HKLcx7zvCunHjurWPpsa+R/Uq4+GeoAcpxH704DaYNEWKaDVunF5mGCmq?=
 =?us-ascii?Q?zDshlJwlpz5ARghj//BD5qvHfKzl+7+obVk8NwmtwCDtw2KSBjOvtjCluTSI?=
 =?us-ascii?Q?vBIVMpVroJUUnqGORdoFfkaitZxXmeFKFFP0r1FNCOwPOAgPegDOxBWNrsIk?=
 =?us-ascii?Q?9IK8vfQiyHnB78nhQHA7zwNe/n8fxszHMr9HrerRe8cmRAOGRaMfbB4MGwAC?=
 =?us-ascii?Q?z0aV+dse/bjR75M47SiJdHxtmHKGq7iNRSsCAvEoqWD2MTTtPqTRhI/r7c8G?=
 =?us-ascii?Q?GD2/C/RlXSSZLzr7CrTPvdAC02MQmv4RCHxySsgVlrVC33S5YLFg8tBi4vpB?=
 =?us-ascii?Q?Z8pS+wxL9zm7CerSH5TvpYhjc65n4v+Mhm/DrTPL8IUg1JVzVYk2Hs5cRlrf?=
 =?us-ascii?Q?q+hVPgZ2PaF95VHSYFIbPID19xqXFdWovi1mK9U8S7x8NQEwa1wqUQ6GvCDS?=
 =?us-ascii?Q?wRsQspGlQL4hOAcFbJeB7UdFHX3qR2dygk2j8HuzRI6fE/5+83VImZoozsud?=
 =?us-ascii?Q?UJ8HcWucPZQtOz0DdPGxlH7ZvkL7zPBag3U6Pje3J7WSm+2jDX+5tqAQ7oRE?=
 =?us-ascii?Q?5BW6YzAg90s5wRHpZyYFAcoM/aCEcRW3u3+C4IkyHvPAkOlh6qc5jvbtF2aE?=
 =?us-ascii?Q?RCVtuePsX0QBmvZM5HlfE12qHD4tU3mwmO3kS3UNPJ6p1b8JTC+3/+iDgCor?=
 =?us-ascii?Q?B1Zs5cfMy3DyBPri4kibHtXiRNmPfNalHTCW9ra6wYbwtGHYl9ojrjsIWXiA?=
 =?us-ascii?Q?xv9p4SSm1zeZRgRVCKpA1yT7Lx3bx1i4G78wGu9HUY3VYainVsHN7V/mFTbp?=
 =?us-ascii?Q?iQdjHFYbPZmC7t4wU3Xtm/6CZcwDvv7gsOLgW2Z3KKt3U3cSIDIA7P+CHVa5?=
 =?us-ascii?Q?9YKwXXUNUp3r/CgTt82zaQZSpUCrJp1gOZpDEVJvgHHIKR3kxo+NJmIh4CjL?=
 =?us-ascii?Q?HYDvTdIbDmDEhOi4HPg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 07:36:26.8360 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43143e0e-6283-4775-0574-08dda271594f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5714
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdGf4MZQrzBbd4qpaTWeBQLBLufyUWoxV6wnMi1ivQw=;
 b=VFf6kTKV44W4qaPSL1qouGJ9abgOXBuBwcSN3GCce2eJafFG/NSXY9VkmOLzZZGN1Sox/a/jYZIeTt1RkfVdtU2Hca6UH1Ejs82SdF90ypC6U5yTJoVZriHM4nksTH1Ayx8pjYQeozwNzIX5SmbWCNu2YGC/3bkpMzfIEyNYftU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VFf6kTKV
Subject: [Buildroot] [PATCH v1 4/9] configs/zynqmp_kria_kr260_defconfig:
 bump to xilinx-v2025.1
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
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynqmp_kria_kr260_defconfig to xilinx-v2025.1 which
includes the following updates:

- ATF v2.12
- Linux v6.12.10
- PMUFW xilinx_v2025.1
- U-Boot v2025.01

The Xilinx specific Linux 6.12 patch has been added to this defconfig:
board/xilinx/linux_6.12/patches/linux/0001-include-uapi-linux-xlnx-ai-engine.h-fix-CONFIG_XILIN.patch

The kria specific u-boot patch is no longer necessary, as it is
included with the xilinx-v2025.1 release tag.

The following patch has thus been removed from the defconfig:
board/zynqmp/kria/patches/uboot/0001-video-zynqmp-add-support-for-reset.patch

The zynqmp specific u-boot binman patches are also included with the
xilinx-v2025.1 release tag, so these patches can also be removed.

The following patches have thus been removed from the defconfig:
board/zynqmp/patches/uboot/*

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
Please only apply this series after the following series has been applied:
https://patchwork.ozlabs.org/project/buildroot/list/?series=459217
---
 configs/zynqmp_kria_kr260_defconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index fdd868bbb5..1e23608cc3 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -1,15 +1,15 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
@@ -20,14 +20,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.2)/xlnx_rebase_v2.10_2024.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.12_2025.1)/xlnx_rebase_v2.12_2025.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.1)/xlnx_rebase_v2025.01_2025.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_kria"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -44,6 +44,7 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kr260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2025.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK26_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
