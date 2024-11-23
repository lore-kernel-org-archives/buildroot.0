Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8327E6ADF4
	for <buildroot@archiver.kernel.org>; Sat, 23 Nov 2024 11:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3330242D3B;
	Sat, 23 Nov 2024 11:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yAnufvhL1S8m; Sat, 23 Nov 2024 11:12:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CE184089D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CE184089D;
	Sat, 23 Nov 2024 11:12:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77C45E11
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 577966149F
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDCFjlCEGKwJ for <buildroot@buildroot.org>;
 Sat, 23 Nov 2024 11:12:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::623;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3264F61480
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3264F61480
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::623])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3264F61480
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:12:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhQ9J854cF0ViveTS5FYLp5y9CwEK4wGZF4bq+QcAH5UEVzlE2hlgeC9m0Efe3ekl0tC5B5ebVtxbKxVOrmzUvdzSdnm2yLMhzrn/On06CLFodQT09DwXuydbJ0tx7iMCVLJ3rZ8Mo5c0V1TSdrbUTlIaCqPAZzUrN2gZ82pbGsFaBtml9+K0yj9Ra+iqLJb4xh54S02y1z0S64aIz3Mp20i+m1lFJL03MOZYgsXPNdbJ5IV9WpotAuj8NhVfz2+vp9YAyQx27V+xG2QpDO9aHpDUS7Ae1T8yGbj0C02rWuyQZIRKPIxg60/zIUcaAQkzPWsp1oUhYcu40NEKz9iqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANYdzxESv2an7bElowg+LwBdLjTLvlux+mAUUetKvCk=;
 b=Z1Sq97z3Gj8D2tqN6D/tbetPjQMrP55qZU+fplrvaDfX5wflWTURQW4dHjoRBU+UUZXFDs1Xq4nMixqrYm/UeksmKbIr2Nzgnz/4oL/VCgf8G9FID2BKYChK7lvCUsBmS/XI2HvouKrOiaDu/4M/wmn2bhFiJEXMN3QLeIdJOaO9516rBkmlN3sIO+BIANt8EfVPIaSFjUC8aMm/L67YRuLVXKUwSYukulxIkcmwg49Lsa/byzP0yVZ/GbOmbzPzPDjJ+vfn8lv0fGk06xp3LH9/SF/uOyOMTtzA5BeS3koeseqMAHBhHESuTZwES2LKDDVcwAE/sJzUSOYjMG4pHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR04CA0026.namprd04.prod.outlook.com (2603:10b6:610:52::36)
 by DM4PR12MB6424.namprd12.prod.outlook.com (2603:10b6:8:be::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Sat, 23 Nov
 2024 11:12:02 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:52:cafe::a3) by CH2PR04CA0026.outlook.office365.com
 (2603:10b6:610:52::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.18 via Frontend Transport; Sat,
 23 Nov 2024 11:12:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.0 via Frontend Transport; Sat, 23 Nov 2024 11:12:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 23 Nov
 2024 05:12:01 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 23 Nov
 2024 05:12:00 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 23 Nov 2024 05:11:59 -0600
To: <buildroot@buildroot.org>
Date: Sat, 23 Nov 2024 11:11:46 +0000
Message-ID: <20241123111150.2124027-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241123111150.2124027-1-neal.frager@amd.com>
References: <20241123111150.2124027-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|DM4PR12MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a77900-4936-4201-ba0d-08dd0bafa7ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wEw7WvCoLrfU90oCt415i92+BZrwGkFzuR5D30zK72OynUkWGX2zDtYDkwUW?=
 =?us-ascii?Q?nrDWhhF4xIxrtA1IP/yIGsJS/zCI9KXbu3P4SwzjARYKRSGobSJtXYClx8mZ?=
 =?us-ascii?Q?5n8q9GP71SBaNbE/lgekvX0QX/ZoZMcqLbfl6wspYlDcH/LOLC+LrC/CKovV?=
 =?us-ascii?Q?UBqhWe7uQ6vgwFm4mLVIktpz7Q8pvgQuZvxi5mh/WA8QLiHDEjdKfvz/5oCd?=
 =?us-ascii?Q?+tcOFRxSbY2RWxNIiVzt64rcuQcDva+ZqZWw12j4C4YTDaftVfaLfB2FWo0e?=
 =?us-ascii?Q?O6vxxaOD2R76KhGE2PXcFb5BDzBu82hYST/ANzA+WAUrgP+NL/NlqpRljZbe?=
 =?us-ascii?Q?XV75ZqYkUGSPdIAXP/xITzmv84RNWrp2MmO1Au4c7OnSdst4V4fmzbXExZkR?=
 =?us-ascii?Q?ge7QE+b38+6PUqfj+7Jo94zsvwJ0GQy7wZbsifOsRdljH6l88tnnqvA/p3G2?=
 =?us-ascii?Q?SOhkfcvnzpaKAYTUkq2autJ7D7KupBGeQY/K6V5mDanSjFXt4fEuaiXuSxaE?=
 =?us-ascii?Q?tAFmKVmlF8tyVqb+/g/xDZaOqJ//uFaVdVzmMNji1X5T44G5gfEGYu3H09CV?=
 =?us-ascii?Q?vjXHFpG7igok8Pm0Uw+VpX60EUUzavzBhIDGe4fWzVtU5aocrojfA30MBQPp?=
 =?us-ascii?Q?xJEOUBLCXWI+HpZYYJBwKIv+Nx7fvegFNkRxuZWEkI+lfB+Qe2kQZ8XR0aMA?=
 =?us-ascii?Q?3BB0HgrM1k//l7KxWd+bVUthxgYNnjoFgfFam1mvXQVzjQsuxizLair5uSpU?=
 =?us-ascii?Q?VeEifvcDrrs8ayoJO1WV719Mk8zxICC3giZSbYqdu7NSptqW2LotVAlayAR/?=
 =?us-ascii?Q?R0wEFkFO6ESzxG/N1bKeoUcDtl556rMlIW0yHWAycwrTsnci3p6vBgzrb8S7?=
 =?us-ascii?Q?JGbQ+OMA79OG4my56B9l4xPmd6UA44tfPLOE8rhvok2HYNFu0ND16FfkERdt?=
 =?us-ascii?Q?wVoqjtbpUzsAnM8dww9YNv1e4iP48+jYhNw419ao9Dn8DNL0vlF7rtNZK2Sa?=
 =?us-ascii?Q?KKpn6Fa17V66n4ZvuRPvAhCqJeM8Cdixu9WcSi8rB8nfiGeG991E9w+uefu9?=
 =?us-ascii?Q?TnN5Uhc68h9xpYOjT2B6kN3oL5ejTvGkrmzvs/IAGu5OBcqqWRcJSfsPyF5P?=
 =?us-ascii?Q?NBVkkzQtYm9qkY/QwKhFBA4wrtUotFVz7a77uxCirI1NHoyILRK+20VgX07V?=
 =?us-ascii?Q?tosmJRgfBJWvmGo4aZaKyWmyniu/DxBAvtMRi5GwMpQLX/TZIhoykXoww2kR?=
 =?us-ascii?Q?nKweSXDWJWmNw15K6I2C32S6MPOCRo3qpKmbrKR7ds8hhb5t0xE3zIglyscb?=
 =?us-ascii?Q?ai2PX3YEsyTbqA1MqpzSnCuBjv9O1iAcS/Bed8s8/DVYVFK6FNOa86p0ZLPl?=
 =?us-ascii?Q?5RaCc0k18PUdhPQ2Sknet9nTSUtpvzyPHwOTgvfZoeCPVY8UMLTuPVOwBmZr?=
 =?us-ascii?Q?DQixClU0eCSOXhWk9G78iyDwChCCB3cKS/P2KjisT2WTvz7ie19x5Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.12; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:atlvpn-bp.amd.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2024 11:12:01.8066 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a77900-4936-4201-ba0d-08dd0bafa7ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.12];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6424
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANYdzxESv2an7bElowg+LwBdLjTLvlux+mAUUetKvCk=;
 b=3BL54kbY1Ms/Qfx+a6QMD63OtQib/RfuQoTy7vJYj1FjrZEfnq2Iy1ntL2TGrO6NttDGXVmUBzezh67oy0V6DGMA7mQmjkmY401PrmdENEhZofCJf3i3NVyPrmr/T/tQ7S9kWcrxIvrdlYqF/SoyU8U4Myxl/9LI/796doCI7M4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3BL54kbY
Subject: [Buildroot] [PATCH v1 2/6] configs/zynqmp_zcu102_defconfig: bump to
 xilinx-v2024.2
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynqmp_zcu102_defconfig to xilinx-v2024.2 which includes
the following updates:

- ATF v2.10
- Linux v6.6.40
- PMUFW xilinx-v2024.2
- U-Boot v2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu102_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index c7a25eefb1..1ad2a064fc 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
@@ -17,13 +17,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.2)/xlnx_rebase_v2.10_2024.2.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -38,6 +38,7 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
