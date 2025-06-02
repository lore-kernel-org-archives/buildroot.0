Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF08C5B559
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 13:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA943806DF;
	Mon,  2 Jun 2025 13:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g45WtW3Wy0W9; Mon,  2 Jun 2025 13:51:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E080B806C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E080B806C3;
	Mon,  2 Jun 2025 13:51:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00F45127
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 13:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBB5260DE6
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 13:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LeqfjgAOD1KF for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 13:51:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::62f;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E5AE60D50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E5AE60D50
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E5AE60D50
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 13:51:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VD2Ce2N4trBU8IH36beVgXfuF8gKxSeb7u8L9Yok+010E07oTLja211u4nTFL184+1Yg7H9sNI1fQ2lPP8cwKXuKOd3zGZ0mv/L4RiwJ99fJ05yEqwR0Q0o5i7Qto09lxGWZE9XJN009A3uQh5exQTUFQxuFTq+QzB+l2sovz1I8rlcXd53uNJDj14WR2dtzjHOP5RaK7IbFcfGSdfdf0qXQuFK2pn+TsIN0uh/aXtelZ9FBn2kB0OAyuQr+9gZXhVz80JBUkU2qRt+/3Wq+x6gITC2PrCtdDWqFLHA3jjqNovyv79AoChdbsV69yGBZ1M4qFXkZ7tEd7ewdw4EFOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7S3X1BEJjDUP1XzlDVkneQ0K4QdSkvnNu3O4pHFHi4=;
 b=B4dU1v/pmZvBagtwZUjB5HaQ9l8SPT4tisqBWDXPFDxC1VGfWceetzg09mflULyTAMvOBELmrg97clBxCj97L6h3rMPzsIILB1SrgIWu0xjvIDmuT8i4/lODJBzx7vkTzyAbGep6/CNHJsozeJKhibwLot0l8ndo1qC4E+mmXhYQw5kXT2dLSte5B6KSTyfDy0zBsWX1Dm8E/zRn4tYAn2RELLpWkYxFmtZMMTlPiJmwkNqfi8UohGqbsk2gj1aZm8NqUKJgOmhH35JRfiCUzYlvoiu8FKMzLVJ4J0ZHTdhTuASXWbnvN/uYQ6QILI5PUt9AtW259RmcyScJtojiZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:33a::31)
 by DS4PR12MB9660.namprd12.prod.outlook.com (2603:10b6:8:281::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 13:51:07 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::d2) by SJ0PR03CA0026.outlook.office365.com
 (2603:10b6:a03:33a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.27 via Frontend Transport; Mon,
 2 Jun 2025 13:51:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 13:51:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 08:51:01 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 2 Jun 2025 08:51:00 -0500
To: <buildroot@buildroot.org>
Date: Mon, 2 Jun 2025 14:50:53 +0100
Message-ID: <20250602135056.404165-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250602135056.404165-1-neal.frager@amd.com>
References: <20250602135056.404165-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|DS4PR12MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e29f2d-a31c-4bb2-e944-08dda1dc8607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?99z98iM+QmwFYs114zGwNGzI9/5R7zFzBj2hamkgEFmtZUEKD6pFt16xT4tL?=
 =?us-ascii?Q?mBk5SLBus61JJFssZyw6b/rae0sQNnJ1pv6zMSmzIhbFV7RI4+Y79p4XT8QE?=
 =?us-ascii?Q?F+zCqiBqabR4n80LYITe9ACWlqprG/+e7zLraBG2VTNQpADMKduWNdUKv96S?=
 =?us-ascii?Q?UPd0TL9m3mQUzgz2eeQZt7tnAr8UAxc4HBYIBSdXw/6HinQnb2HX58NfJLSc?=
 =?us-ascii?Q?jIHrrSTRCSl/jFVtqx1kW9Pp0myVc9ZG1PRPnN/qk6wVqQWNdfiMSt/d0/JP?=
 =?us-ascii?Q?I3DkemRFdZl+F+t+3a1V1BILE9VPQG74ez2rjwbqS934+kRkYwgmMNFEZwrL?=
 =?us-ascii?Q?yzEWNbe+trpV5gKMhI/0387eNkcZCmTQzzRTlNaqc9Fn1PPNba4MLBflEtmU?=
 =?us-ascii?Q?U1wlgS1XPSj0WZlY/6cHu2RrfZje62blcpXugU7XDxfDslzrIY7A4VbMWzHJ?=
 =?us-ascii?Q?rP317iiftKmKZGRhEDd6DZnm5zXi29aGJcgpfUUkL0JcFmOsZOD6bCIMH34Q?=
 =?us-ascii?Q?kBG0GKYrOepv8yhy2a6p6d5w4l15xcaqQTZMYve2vXOotDMxZa6sAlmKrGH6?=
 =?us-ascii?Q?KDUgHywn7qGRlq28VE14c672sLOgdAyj/kGRC1mIe1BQzQmQhVO7su1X1bMh?=
 =?us-ascii?Q?nX80cPvy+RgqJnWgWhJX2bKa9RoFyCTLGGObZJ5ftCddx63hkGu7nA5xKiAR?=
 =?us-ascii?Q?kOdn1MeiiyG1hGZ+Vxu9Ds1DkgnFEPXFn1sHp3sb0na2E5feSTPjSlOxWo3n?=
 =?us-ascii?Q?zwVU+AnkjukjRFZr8xvGYtxuC/zgWCD1dxzNN4GCNTQvd7ls2CFQH1hInBtd?=
 =?us-ascii?Q?o9tT4Jq45hKallP3WPrYHAm+mJ1JKC3vVaC4pPuX8FnjcP7cK3QHGAxz+8xI?=
 =?us-ascii?Q?b9WInHhyruiA632qQiFQWknQtcJr7XXpReo1rBFawHdP8Kp+dduy04sD0qdF?=
 =?us-ascii?Q?B4iaKQSCb6grTIPpwqaGpf6yxslFb0NFa0xRm0pumttN8M4ny3uHa3n8qC/L?=
 =?us-ascii?Q?h46MpFzPPMNseav7F5r/aMElXz2jDZFqLhzM7H7ccIkmpYyOZI3h/LB0m8um?=
 =?us-ascii?Q?p2GQZttGSAw3dt1u/V6U5nCCc0klnQCrnaKb/gMZrsKdarp5AGtgd904sQ7v?=
 =?us-ascii?Q?QVFjpvrNMNZ+yO/0wr5gAZtx4gvyUxaxY9OPd4qWywheQnK8viB5mSrOCp2I?=
 =?us-ascii?Q?UzlfKgip38Q0A2eA3sfhjLhA5NJroHhPSv1AWsYxxT4cXLhdvdknk/iqLB+M?=
 =?us-ascii?Q?ESKqJa7S/NPCUtxXqBQOvClziyEdhkXl8VLZCKePwDZ44bfuCPVqHaiuMp1Z?=
 =?us-ascii?Q?5iFmJxjWcJsnwNi7YWT1Q8WF28G4vhkx/hT9WeBcVZZClq2DcI+Jt4hwpAyM?=
 =?us-ascii?Q?3IYVjDi4ZtpBb2DQUCACvKbWDa3SSZCCzQgjU/H4KrRr7Iz0kn9T7qH6ecNH?=
 =?us-ascii?Q?xeV73/Eo7otF6NYsNEqu7uuoUIZFwSaiwQH/02sPLHP0R3Vdi7fG2qF39IOR?=
 =?us-ascii?Q?zszbwjHoRutaG7RdsCpt3QyWIGjXYixRB0Ml9AK/IjFH5pzXEgj3da3UR5OX?=
 =?us-ascii?Q?KMNYThbI9l/phmOlPjM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 13:51:06.8546 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e29f2d-a31c-4bb2-e944-08dda1dc8607
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9660
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7S3X1BEJjDUP1XzlDVkneQ0K4QdSkvnNu3O4pHFHi4=;
 b=MB6ezPVc/srociD4Jbx36fZiBoCxGkK7VjRIDTYJyDBmLfcIpv8elnFVN3d55jjiu3WPbuqSZm/l78tr5RfNXg5t6InF11wc0BUOdhXTsHzOW2qPbZGDGib+0h+pwDdldY5NxTByhzL64J0Bm3cJrY/07nF0bXdkNMDgdvCN7zM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MB6ezPVc
Subject: [Buildroot] [PATCH v1 2/5] configs/zynq_zc702_defconfig: bump to
 xilinx-v2025.1
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

This patch bumps the zynq_zc702_defconfig to xilinx-v2025.1 which includes
the following updates:

- Linux v6.12.10
- U-Boot v2025.01

The xilinx-v2025.1 Linux 6.12.10 release tag requires a patch to fix a
leak of the Kconfig CONFIG_XILINX_AIE, so this patch is now included.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zc702_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index 4c6361a9b7..ac3304f293 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -2,14 +2,14 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -22,7 +22,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.1)/xlnx_rebase_v2025.01_2025.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
