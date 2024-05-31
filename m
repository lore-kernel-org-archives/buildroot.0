Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EAFC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 09:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C35044165F;
	Fri, 31 May 2024 09:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DpNNXSYUDWEk; Fri, 31 May 2024 09:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B46CC41664
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B46CC41664;
	Fri, 31 May 2024 09:48:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A3AA1D504E
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00F8F844E1
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12xgWRVjn3e9 for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 09:48:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::61b;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 380CE844D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 380CE844D2
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::61b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 380CE844D2
 for <buildroot@buildroot.org>; Fri, 31 May 2024 09:48:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgP201Mo3wo3kcwQyjuoJCcB48LLq/Qoo5fH/41lgPi/StTroRMgyGgUG+H7JVvAherYJ8Hvw3QgHzBWPesf2ll5mUkXgeKUiQY32Tn9HeydRraZYPlammma77Ixbq05IBbvP9JyvYgTm8IzJH8mAB+ta2T3ws1bA6pZdxnLBE1+lR7vjWOPJyWOOJdAX7SL5tEZs6vWTZ94E0249a5p36iG4XF2PqnclIglgfiqFd9tnhZKErYC5Jz4ObThGi63wlZsunzyekAqtRDKrQmPubdSTIik6eiYdvTLy3LMBwFKiR+JPZdgFxrAprQ7H15BIAyjHShRxcWTT/FNzTv0mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxPKiPFBJ9j6nBqeBl4rcYYN3lR23iQTnAvL1Hi9qAc=;
 b=iWIfVX0156gV+zuCRxDMcWW2ztPJBquKpjmBN1mdScdkX/EbdEAW2Ng31kW9s2opvzq7Z+6HF6bQuNUbZIxAYfBG8BbbpKiD8qtl7trO2BLcfYdYyGIoWsPLvBxLOh1aplSl2dK99dkXuEDLlLEtDzs0MmV2Qx82qXyIKanhHXCAb03AO2u3R45YHuyQ5N8ktVMicgo/H8jRLTmO/Li86PUTwUac2ejwSJjrbKLreV4ObT23ME93MyNYikw9XM3zzpwKx+TOxB6e/nksB0geVEDH+55a9hBhOnSMfh0HYqDQZsIiwXMHNe6TR3RFI3l6ACTPMVxU3pm3tdiobTODeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA9PR13CA0097.namprd13.prod.outlook.com (2603:10b6:806:24::12)
 by CH2PR12MB4151.namprd12.prod.outlook.com (2603:10b6:610:78::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Fri, 31 May
 2024 09:48:07 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:24:cafe::eb) by SA9PR13CA0097.outlook.office365.com
 (2603:10b6:806:24::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.20 via Frontend
 Transport; Fri, 31 May 2024 09:48:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 31 May 2024 09:48:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 04:48:05 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 04:48:04 -0500
To: <buildroot@buildroot.org>
Date: Fri, 31 May 2024 10:47:50 +0100
Message-ID: <20240531094752.3760287-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531094752.3760287-1-neal.frager@amd.com>
References: <20240531094752.3760287-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|CH2PR12MB4151:EE_
X-MS-Office365-Filtering-Correlation-Id: cc43828e-8af8-4264-92fc-08dc8156c5a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|376005|36860700004|1800799015|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BOz0Rg/Vk/X69noSXjsrLeBRflsIuBLqZhk72o+MtxMWBCaOyINtcHqd6Z6x?=
 =?us-ascii?Q?jQmqpjupW1MX8Cp02Sb80uAqYWHGq9pyIJrmwWeoD1jQtglRAadbUbWh1AIG?=
 =?us-ascii?Q?JDOahrCA0StLzgMhieM5tPDjxm1g2zPoDSrMpWh3CnfOlZqQrEKAyiTNl9OP?=
 =?us-ascii?Q?9pfB92/AFKmYYnOlYYPYXOU2rN3YB8L3AYSohXFVMiMpprCHfEvxGtBnA4YA?=
 =?us-ascii?Q?IspB6nSU0AEkjHwJFJkb1now9eLbmJnaJHZG6dfqJQSebDDMedkZRFwXRwpb?=
 =?us-ascii?Q?oMGGPQtCzsyYypPriv6Kx7XTh9GPREEVcZIF0XsnOB2YKY3O/azUDWvXKflF?=
 =?us-ascii?Q?wnASfFkZQF5hFg0GXZLhPnsXoSbni29WIcevX3SVdZtYw4+YxTthW3/QYdxV?=
 =?us-ascii?Q?qnyIEJWd1gzMitZRgS7tpu1H0fnHIRAsManwMKXcPKDDm58c5nXdM6zxT10X?=
 =?us-ascii?Q?Yl2RyfwYvpVnYD76f1XFQ4eokJFDW3W+SzPYjA5+s+mNGEabxACXKr5ASQYw?=
 =?us-ascii?Q?Mn1LNy66XNI55by0icMwXRw54F4zM+zIkLvxm+mxSz8uU7r5ko5EX4FD90ML?=
 =?us-ascii?Q?y7enzXNgOdAsyHRilWlJVSNqTV/MiaBdhO4Al0fbVdmAdEyIAN9Sq/aUSaVq?=
 =?us-ascii?Q?WqNfKdovARIp9EdPApA8v0TGYx5XH7kGQZy53Wh6Mrr+52dY7VoiPEytTqTo?=
 =?us-ascii?Q?Lb8hiBCOVwRVLlj1qFKNFMd+Rb737cePK3WLcfMvoprm/l0eLH9nl/SuB260?=
 =?us-ascii?Q?ThOyt74FKEpINp/xPPPwMNhHJGSSK2QZVEURf/5Jw4Oo60iDCFXzaQxuYN0d?=
 =?us-ascii?Q?IdnA2u/8Tgg1Aw4HPlCISFfBnIYlT4Vj4U8HkgfvgTEaZn4h//KhXuSsE+NQ?=
 =?us-ascii?Q?mlddBero85w4Xy9XI+ClSUWO/AXrpL/BrAETmPIgW91QKNWlaASF5XCSv2BJ?=
 =?us-ascii?Q?ZrbS905+byeq2R7KR4iUP6W45k3HRG+VRNa+n/VE97sgSHgCiy16m4CCVhV0?=
 =?us-ascii?Q?4W+RnnPYiwzwUjhexOa+4P5d0IAqLoUtHJ0/wm5th7fF/ECzpBFotYqZTNCO?=
 =?us-ascii?Q?P+HMujNgK2MZLMRc8my6PIljfWtvO12W3XcyRq+bAq6UNpiiTrlnC8MlE1t2?=
 =?us-ascii?Q?9x5ad2MzZEeThyMHJ6yTGnYf7FL4JaPVEL+0+6sK47RIA9Yalt1Vxc4aNvwt?=
 =?us-ascii?Q?Kc37Z4Kj0/HQkqjzwwHlcImUv+2WZDmbLFKgLrpO5LR3s3ux+XITVg6YafGT?=
 =?us-ascii?Q?mAHuGdGY71co4btjVG+5DbIvgE6tzv4p8LSDrsbEMb+9MlAnXNwwBTZlOn2g?=
 =?us-ascii?Q?A2Wh9tlxMxbXs4FqoFjad2JR9xwAiMw6IW1EYkpJVcraM2HPTRORVtRaXiHF?=
 =?us-ascii?Q?eXp3YPsiI46Sg1k/KpsCZZduPYAlOckf+GXXEYN2XZNrYtqFYg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 09:48:06.2015 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc43828e-8af8-4264-92fc-08dc8156c5a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4151
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxPKiPFBJ9j6nBqeBl4rcYYN3lR23iQTnAvL1Hi9qAc=;
 b=RKow75ax5mllENRpOg/Kz+MKLOmso7PPTaWxev1euSG1fUvJ3zMOK1WHHGFqPBLBVyEY7dZ6AblZseEotmmbiH3XDVGG8opH7DZtTzSpGimFa/sxreldXWqZi72nkFobQ2s1r9a0JyglNKI4XhKBbk+QXPBmVkbb+uGu2frkSU0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=RKow75ax
Subject: [Buildroot] [PATCH v2 5/7] configs/zynq_zed_defconfig: bump to
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

This patch bumps the zynq_zed_defconfig to xilinx-v2024.1 which includes
the following updates:

- Linux v6.6.10
- U-Boot v2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- update linux dts name to include new xilinx directory
---
 configs/zynq_zed_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 33e7aa02e0..95606caf5c 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
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
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zed"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynq-zed"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
