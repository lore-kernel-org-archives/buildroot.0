Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD091E6ADF5
	for <buildroot@archiver.kernel.org>; Sat, 23 Nov 2024 11:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87EB242D3B;
	Sat, 23 Nov 2024 11:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yg42u9bUxhxc; Sat, 23 Nov 2024 11:12:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81C6542D56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81C6542D56;
	Sat, 23 Nov 2024 11:12:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E45A01D8B
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF53142D5A
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLlE10rPf_b2 for <buildroot@buildroot.org>;
 Sat, 23 Nov 2024 11:12:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::617;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F1B9E40894
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1B9E40894
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::617])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1B9E40894
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:12:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utb/mw8eMyzkuobuvd+c5otvEap/2aJuGbjHTk3w0xMNZwMVvPeC2sPEbHvDxhiJtb2P0529aVQFDz/GTfXhjrjJMgNLHkxEfEYqiVDeZJdN8XWQLJZrNNAelxMDNDFC9QrUJzoZUSn/eV5DDC1+wRAzmypJd6hGMrR2ImLE28n//T7tASm5me/Xf2SXe5tmJzCOUXwEBM3QfLeXIY2ehQrTophKHcokk/xhKh10cLer1KoME0yqyxBfbN2Kt9xE3uk3QijvTZeFx2cPKMGIpnNs4+gAQVqxs8fVC6CuDvxq9RJhVbBRlUJ5l+E9cenmAsfm+wCMKeCx2ME3C19y+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iq6ks73qBP+wLUQ3d9WqBdC1WOJKwZgJrzIYZyNvpsI=;
 b=Lyw95aQ8nDVxlHIefMpP5Yzc/UUri4CSr/2s9Gjmm+OyplPkYwmCSH248bX7OiPNMd9lamsr7uOGij3EVnZvs+qgDzW719b9g6rrCouXXKtBf07Gu0GM+PJmsvnIgBpw+mIHvPdcYdTpTjYnQHkuWkOzhFznnuIKgXNjOjL7dr7Qj74vVsdgeFKdoV+POmbYlIKzbiWhuj+S23xA2WQSMahsJEV/D8qhl1s7+D+AoZu8NKh4JnOZ0dznpp9tpJAgLC8/loQ5iUsHs+3F2nbqo8TTzUVs5ynZHS4ZIMaxiSDju2EzSMoO0NKY9YrH60OUDFMBk0zZK14cBzoo1KFIqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR04CA0028.namprd04.prod.outlook.com (2603:10b6:610:52::38)
 by DS7PR12MB8231.namprd12.prod.outlook.com (2603:10b6:8:db::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Sat, 23 Nov
 2024 11:12:13 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:52:cafe::c) by CH2PR04CA0028.outlook.office365.com
 (2603:10b6:610:52::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.16 via Frontend Transport; Sat,
 23 Nov 2024 11:12:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.0 via Frontend Transport; Sat, 23 Nov 2024 11:12:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 23 Nov
 2024 05:12:09 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 23 Nov
 2024 05:12:09 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 23 Nov 2024 05:12:08 -0600
To: <buildroot@buildroot.org>
Date: Sat, 23 Nov 2024 11:11:50 +0000
Message-ID: <20241123111150.2124027-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241123111150.2124027-1-neal.frager@amd.com>
References: <20241123111150.2124027-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|DS7PR12MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b7ef26-dc6b-41c0-164f-08dd0bafaea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c3bxOnrMW34Fbpv9UJMI1NFObeH7uVwPHya0r30FK1TIBvuVdr7rrmvljOBU?=
 =?us-ascii?Q?JCK2gwMJDBnMq1mbAVPE41iIgtjgDtnUgl2wjlbrLUYarqa1lcARO1ww4Zka?=
 =?us-ascii?Q?LSq2FE4d/jCnPC5cfuiV+itGvZrYfeOJtdvkHXNhYgAiNLblYkr/+Qy/JAK8?=
 =?us-ascii?Q?ZM/3TbjdjH5QwWXNj15EUpEChDXtT+rf+gICkyVC9FhAiHDCx2bZ+24gGwDx?=
 =?us-ascii?Q?fiYKA7NInaESutrXW3ieVHDGdRs9qG/e2Q5lT4P7UiTlsdxYY6ilLPEbPzWN?=
 =?us-ascii?Q?1Haj6BX1+Z7DPykJCcwgo+c9mVaG8B3k4EE8nSWloOIMGEv1iOoFTnIwvcmH?=
 =?us-ascii?Q?L0MRHb3dJ1PRSloJjDwKi+J6KYlx3q62KkHHnRVMsmU6/1Qiy4hXie0QeFSl?=
 =?us-ascii?Q?0qrUl8asSi+0o8mAPq1mL/oe0BbgmLZ+hz2edzm63Z2Pq5pbR+qeT3beV5vk?=
 =?us-ascii?Q?ieEnKrHD0LgKqOOW5E5uL7fTLWBrlr/PStQnKUrUnrQ4Eql/4taxL7Rpqtwn?=
 =?us-ascii?Q?opJkvoqBrGm+chgH2hrgvHyrNBDCMqCmIKQjB/rNytNsX617AlcWvTuMBLWz?=
 =?us-ascii?Q?2xUH5q5+sJ3G7yMJi4jUmz2lVfrwdmLaxUfXu0yFpVuELTcgqi60ve3wz6fi?=
 =?us-ascii?Q?pHi8ZuF30osu5O4bTkou8hxhspifrRHbqXSH0pjC+5uvtafltDt4iWBq5yZM?=
 =?us-ascii?Q?D8x4tuIhGxNAngijdj3Vxt1DPkv0tfY5oiydaXZCrAhxGgMwlSj5ATP5ewk6?=
 =?us-ascii?Q?B5sJL/kCv8pH+qYwRJB6JF9JBLPZ3mpzCXmryYU5Qm6y31SYbEHJFkCJ3iw/?=
 =?us-ascii?Q?3rOv99eDJTOEqKD1ElB5sdqb3pTdFln75xgUO83yn2WzXJrKgeb3gghRD5ov?=
 =?us-ascii?Q?t+XXDGhHbY5DNHpno9uRB/7hJCfs57iV+JQ9zMXU9a7B4QdYQV8VlP5mlw+2?=
 =?us-ascii?Q?CnIlf2hndUxLT/7rRkq79YeB3Ypwk9ZUckxyNJqDLt/2GqdGCSvQSbIHIQyD?=
 =?us-ascii?Q?HHN5tOweZOA4kCOmb1n1GKK99L6WXJD4RnRCkyeerTBNP1tIcfHDcZTYwV1T?=
 =?us-ascii?Q?Gm2tmQ3ZN4G6C644YdUzRZWXhyvQ3GynE+UWvi2th91Sj+GjwopzROCsGCn7?=
 =?us-ascii?Q?YsXHVAz7xFN5m77V8k9LYA7DYmrxivbzT/BSF13eJTYq0V9f0PXKIuVX9kat?=
 =?us-ascii?Q?28fmASF3DjeE0lfDgAyhbTofCH8Tb6wVEoFcT4BVY7nj02xwUkyKoxS8h7gW?=
 =?us-ascii?Q?uv92NDcpp6NTfM5B4TGc0auQNtkcn30TZ/DCZKt+mTFfmuIu9Z/hwj/CFV4y?=
 =?us-ascii?Q?uuCsVSBsUUq5UZKWlwuHG3ZvE1yRNQrvV3H9Poxl4npczJt8ZtQZjbrmCMFH?=
 =?us-ascii?Q?GzP8cRX4E8qxMI8X6IZiqcL4+Z/yZhBMVoz5f9v0PWTpcuVTXYSZ5S1N5HHi?=
 =?us-ascii?Q?cat8AF2es6SxIHklnlZodhrq/exP7r+k9paK2M8vk9mErUVf2LBPlA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.12; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:atlvpn-bp.amd.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2024 11:12:13.2909 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b7ef26-dc6b-41c0-164f-08dd0bafaea7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.12];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8231
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iq6ks73qBP+wLUQ3d9WqBdC1WOJKwZgJrzIYZyNvpsI=;
 b=en7npIyyc8WzOlktG1uXmBGtWqom0AQOtqdn68cYQOLmISgsnSU00hXMA08VRGIq3Rucsz2ktpSiA2YEqmYguFzsfx5XSTh1Odq9A7ym2THgUIusHu+BsdmdjtyBHzEtVNdasLeL/XG72RIgXOJqJpz4gaWe3F3tgkKvG3PyhEg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=en7npIyy
Subject: [Buildroot] [PATCH v1 6/6] configs/versal_vpk180_defconfig: bump to
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

This patch bumps the versal_vpk180_defconfig to xilinx-v2024.2 which includes
the following updates:

- ATF v2.10
- Linux v6.6.40
- PLM xilinx-v2024.2
- PSMFW xilinx-v2024.2
- U-Boot v2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal_vpk180_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 9fc694a898..604e5f69c7 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
@@ -18,13 +18,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.2)/xlnx_rebase_v2.10_2024.2.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -35,6 +35,7 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk180-revA"
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vpk180"
 BR2_PACKAGE_HOST_BOOTGEN=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
