Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EA1C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 08:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 305DC41D95;
	Fri, 31 May 2024 08:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yUrrRZ40jwr6; Fri, 31 May 2024 08:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F3D741A4A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F3D741A4A;
	Fri, 31 May 2024 08:44:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FFC71D4F98
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 08:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C6B94043C
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 08:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8sz-E25DiwW for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 08:44:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::600;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8A1B2400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A1B2400DA
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A1B2400DA
 for <buildroot@buildroot.org>; Fri, 31 May 2024 08:44:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBRagUcQXc9J1G9ZIE4rL5Qr6L05ktoIO7kMXXsqjh3UZiAulXMpBYrxwuDZGaHl6393sA0ehuDbibLW9fAE1t7VAKMzF7CtLhjaO+zpF2Dyw7VVU6AF2YPQWUaMU9w5pHjS+eH2K0Dmge1DIf2LcwS0vl/bOgJnzKcClMg2vi5sBGyCEYXBS0GIzI49CdNtvvwyti28c0/WisWW/JYRB+tIDrTJknE+53iN5sH+SNq3JdOt6wT8SM6G9iJiDIwc0q8gGbUXXGZC4ySo+ML+sBiZqPO36bMDw/5YrySl7rs6gsPJTIl10PUAKGPw4LYVshDEfS8s1vwhl+GO6wN1Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pi6I0Vc2EylAVQQnFIG3e9GkxEGvZn5fmNXGF5rzX9A=;
 b=T+bhQHlHNFQ9cvd8q6YNuaBaWGuACl01/H8ZqD5hbEmPI4sCrqFkfx3ED0whgO0GFKvX5f+TkLqyXve0OBPkNRF4sDBxssucpq2PjMphEegTo9OrofmIjBkSpV5Tcd03E9r7oddEfZ5JryFLR2qc8bVX20PQsRVaLlWnpMMHizuztAvV7vObnqONEuu6hv4Ewvm1BRON5YXLMKO0MmBhJ1ecMU0isuuzh5sg6251KcdNHDh8jOC1TKNN8P2jGNBdvOZ0rEN33B5D4CaU3py/elY3tnY4UZfEh9F1+ReMGqeAXdba9qg0KykRIWF5wAmTflKmUCrCsj5Zo4VWKhcEaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR05CA0030.namprd05.prod.outlook.com (2603:10b6:a03:c0::43)
 by MN0PR12MB6245.namprd12.prod.outlook.com (2603:10b6:208:3c3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 31 May
 2024 08:44:02 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::9) by BYAPR05CA0030.outlook.office365.com
 (2603:10b6:a03:c0::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.10 via Frontend
 Transport; Fri, 31 May 2024 08:44:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 31 May 2024 08:44:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 03:44:00 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 03:43:58 -0500
To: <buildroot@buildroot.org>
Date: Fri, 31 May 2024 09:43:47 +0100
Message-ID: <20240531084350.3703469-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531084350.3703469-1-neal.frager@amd.com>
References: <20240531084350.3703469-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|MN0PR12MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: 288743ac-532a-4566-ea3f-08dc814dd1b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|82310400017|376005|1800799015|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aUXGjnFEhwbSeaa74ApX5tM2YyAXGtehjQ7j6OMZTHPjUBb5jbdO8MFmSn67?=
 =?us-ascii?Q?gde0IyApx0j9qYwDY+dJtFJokTrlhWxfvcljE6UIfQqfQtGI9N9RaDBPUJJw?=
 =?us-ascii?Q?H32bQrO9c7Dq3h2/Vzx4/c3MyKVifywy4v66e5nBd2bIQ2P9i9eDhMFlmVFj?=
 =?us-ascii?Q?AJmm8OPaAY8fmZHyBSRfxW3dMmsDwIkrfioU3C0V+z7lFtUqXpUflMDSYl7D?=
 =?us-ascii?Q?0+rYdsxOVvLz8D5WlvgaRKAfKWA3F8+sCQ4ZZjwb+B18Izy18csPXYPNmuy+?=
 =?us-ascii?Q?/boETS22qrXcS8T+lR8d74OKK2VUfITolgssGVAFKgVizPAr23pNhA4VR/Wf?=
 =?us-ascii?Q?v1KgEDKMA7uEas8f5GFS35pl+Nm5oYKqSU5qsirARebwTANP4746C++EsDEJ?=
 =?us-ascii?Q?+GduAzhi1ZxJ8lj/030zjrZEaNhs/uWW2oFzgdU3i86kIm+EfTB7/STiLZbY?=
 =?us-ascii?Q?rL5FeykFq1Ir69GkXq+Vk+d6XKtWoy/V1WwIDIMq4jev6WNOgHBdw72dVDSp?=
 =?us-ascii?Q?Bga7RfB0T8MTFzOegZDe7OoijckprayJanEKgCj451XfwPvjuinuAhe1X1OV?=
 =?us-ascii?Q?I+DNO5qgwwdbO/iTglkgndYu79YQr55rvqI0NEOl+ZWYilpom17XzAApNCH1?=
 =?us-ascii?Q?1z/WLBLSvPo1Re5flfa7fePvf0AuYWO3aRzKK2r2WuzjiuWTVKSy2M72fVfB?=
 =?us-ascii?Q?T+rGJS//aLPEcvHmV3MmnrRcYIbWTyzHqJKOFloQsaV7h//+0ajVtmXSJH6E?=
 =?us-ascii?Q?yJkmd8oHfRXFmUElkdLmRN7umMTzDhz31e8b2MC3T0xfCw3TP0CR83HhiAOK?=
 =?us-ascii?Q?u27523ySYcfsH4Us9brEMnmLtJe1DG7ZDZoJ+hlv/wRbcW9q97FVD3zfORvW?=
 =?us-ascii?Q?xGLBfw7GAzDzeKSilrwtWUzyr141SDamUKuc33BM+3VApYQ3z1JnRtJDCqmD?=
 =?us-ascii?Q?9kO10+7fUECn6c/7pFQpvez3lZ0scHwOPDE+TyL8Jo5JDDCG7Ox0ClKNGyyY?=
 =?us-ascii?Q?aPo18vHcbpyZ8SMUnJbuTjN2Ea1GFVHVDwL2cCsZDhhqqYhN+XYKS5KCNIIl?=
 =?us-ascii?Q?23q8IMLDfImMVREt/Mg+EiCUPnKfBehT/38M9737dYDjOVBnCxo8/vdYoPe3?=
 =?us-ascii?Q?FIV+GQLSB2dLR/is2lguRAixZhAwmJbEyDczaGAcLHlsn5GFfZP9SxV5cJUb?=
 =?us-ascii?Q?iK6gNZ3BxBDeCx+krmYSgYdIPhvkhxZH0Cwyyq9G5jwSX0DqcVT1Ud+9+pZo?=
 =?us-ascii?Q?CLihjHNmeVX9lPRfLK2t+/G3d8ngHoAdJv+2Z6R5MmYAoRE+YjkKoum9qQs3?=
 =?us-ascii?Q?nLeo9lN4ERGJaZE6pbWo3Jk03U9+b6SRVOVFdtIooT0f/Zi5uq58dfY9uvtm?=
 =?us-ascii?Q?ue9bHPd8+yC/5ouOuhMVj/pa7SL8Zokwcg0rM2OhHK918HIvUA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400017)(376005)(1800799015)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 08:44:00.9211 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 288743ac-532a-4566-ea3f-08dc814dd1b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6245
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pi6I0Vc2EylAVQQnFIG3e9GkxEGvZn5fmNXGF5rzX9A=;
 b=biLDeqLBGOTEsCKcgyeUyzG62C1e9+ScOTRBcvVd3umH9H3jc74F0CW/5gui7U4t9EQ8cYyD6xFWNMAdFVSRIjs4F27pJ7i9l1Ia9VkpeAEz7blqJB5fxYgr5LNUobep4/JX4KghZ3dDpuSwOaSKPRNMMWPNP6oyDoxpzgZ3LZc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=biLDeqLB
Subject: [Buildroot] [PATCH v1 3/6] configs/zynq_zc706_defconfig: bump to
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

This patch bumps the zynq_zc706_defconfig to xilinx-v2024.1 which includes
the following updates:

- Linux v6.6.10
- U-Boot v2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zc706_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index e22ba7a3d9..5f7f79a35d 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -2,14 +2,14 @@ BR2_arm=y
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
@@ -21,7 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zc706"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
