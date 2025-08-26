Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A82CA0EFA
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 04:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EE8E6F714;
	Tue, 26 Aug 2025 04:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQj1PTDMYZHi; Tue, 26 Aug 2025 04:17:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 139016F711
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 139016F711;
	Tue, 26 Aug 2025 04:17:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5332B0B
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 04:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A723741926
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 04:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gc15e_TFQxxS for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 04:17:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::619;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A59D541933
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A59D541933
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::619])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A59D541933
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 04:17:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aii4jI46RbQQ5afREsg4xl+5BJtyGrDhuHYnigurESUys5KSo8ozylMQ6lcyQUtmVNFmMl0IU10Aw4FmzD0SEEg2li7ZyHGPHT8jnVefygi1fu8upiBz6B6Gb3mPoBJ6n0SibyBcN6dFjq+xgARMUvnGGLqEp2RiFRdRe9n1xLTQHP+5EKBx/4v7umJeYekyOh1MtR0mWW7mK9D95yDNG8mLG9PaAAYOsd6vE+ZtRkGfunS4EjAWfHlZUAevh2nWYewuzKrWpRWIqcG/XwTij43NJoNgro9GwS2fLRqonNR6VV5GvnKuwK/HTiXzO/a/b+CI06pCLTEX7FdysfHkkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAFe1QR7bAMwgRo/VNjcXzABk9XFf91iDA7514WqRaw=;
 b=I7wYWXTSeSY7mClVA1eRFYYQRdFiDnwr/OIo6P6VgGEl4ItckYVkUfe81CIZHjOzvGjR0sO8X25nx57uhQbdtBrZYxzJh++ExobCSdqRMS42IN3yGhJs3VV5lYYRWCT6c5HZzk1lr2hkS+67Dp7+C1ndYEuHx4zFgryxj72lzBGnbsAIJHDSk+goazajqIzV400gHhtZTkkpwWsedEPf50+vAve7zkroLtmEymzhiR78476NM/uBd2W61qzLAubrrhq7xccOE2vuQd+FTXAwjVXK7Rda9FDddAIBQNWihpzCV3LfUUSJ6dmodvoxBUNMlok7GO3En7M9Mr6EE+Tpmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DS7PR05CA0011.namprd05.prod.outlook.com (2603:10b6:5:3b9::16)
 by DS7PR12MB5742.namprd12.prod.outlook.com (2603:10b6:8:71::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Tue, 26 Aug
 2025 04:17:17 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::9d) by DS7PR05CA0011.outlook.office365.com
 (2603:10b6:5:3b9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Tue,
 26 Aug 2025 04:17:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 04:17:16 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 23:17:15 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 25 Aug
 2025 21:17:15 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Aug 2025 23:17:14 -0500
To: <buildroot@buildroot.org>
Date: Tue, 26 Aug 2025 05:17:09 +0100
Message-ID: <20250826041709.163460-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250826041709.163460-1-neal.frager@amd.com>
References: <20250826041709.163460-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|DS7PR12MB5742:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d6a72a9-a407-47ac-44b3-08dde45770fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7hgubKc36ybZae72fM5wyZ0F+pikNy2MCPXO7i7e9JMmkIJmLjmOE/o46nV6?=
 =?us-ascii?Q?nz5d268crfv+aeMjRRGsMLTm/CgjQ/aKoCJUDTrc+9Beb+jEqzM8BDdaH628?=
 =?us-ascii?Q?tRgVfCtchxPVJi+uC3B180pwLQPM5/JNX/W1CqRqafHG+UnAdbSVFiw5PVC5?=
 =?us-ascii?Q?PfaMdECurjqEibkWF4SCbnV0BL5kqmwmf/zemHn9TDoC0Zh0lfkE7FwjNI9F?=
 =?us-ascii?Q?YBfA72xuLANfOgAZince8K4tRWSPxYcpVT7n+1ZJMSnJJ7c5OZGa35z3GsCx?=
 =?us-ascii?Q?b3xst7Qg7bgvFMq1mfmCoIT+jbVd8t6ME/xrZSRE0iPjhldzXVHp/aHvMwLU?=
 =?us-ascii?Q?1HhPWU6PyAxfkax/rsb1+2ZMjZOgohPlijak2NhF5aCcl4cT1lQ89wEo4ZjN?=
 =?us-ascii?Q?TZSYtt8r8bq73dmMbpTxZHN/8WEm2GiY/gSNUjZvguqTzqi0w06ASE2zqub0?=
 =?us-ascii?Q?exPHBu7hZl9kABQaK5fFLO7wJyahe5n64LU9qDojbfrCz547x6poCOxRwRta?=
 =?us-ascii?Q?inrt/+YzliX2BAeEz8g+FPplPIg1ZSOBFcs3kW0AfiXJhuppIW5mtF5ZfODT?=
 =?us-ascii?Q?109vJ8wrCbuud+1KV63E0W6B8UkBWiQdlt/FeuvKszk7/S2PW7mKfsm3Aeuy?=
 =?us-ascii?Q?JDUtGZkINloc2Flpx+VUYCuKnzJI5eUOliokxbDyYtx7nGC33eLns08e7uZ6?=
 =?us-ascii?Q?BFh+eAe9d8zeDb9iAr2gZxFkdevr/+p6vCJ0jJoyyFDg7aAGB0Jrdns0HXoR?=
 =?us-ascii?Q?84xPd/PP72KbzMHLJBTJTkTpsoeYwz5M7o8E5I1UnWGp+RnTo/SIR0yogrvf?=
 =?us-ascii?Q?RYPNz+twM+ae7CS7I9ivR7959I+deT4oy1pTjiUEfaBDUvPKvev3d4cyNoHz?=
 =?us-ascii?Q?AyRYZ8Xtmein3SO71STkf65O+AxbI+g/2pvTzrYGJ9beLESYcpKerXVJKmyq?=
 =?us-ascii?Q?0rNfGMMJ5vJmO+hRfJ8d+3wds8GLUW9WtOeNM07S9PEOBaJ88JGWAFrEtBVV?=
 =?us-ascii?Q?qSni0VfiOqEQB6BJDsJ6RfpjMui4LvhMVX+NGT/SjxwaLycc/gcAhuo2BDlU?=
 =?us-ascii?Q?4ZUtAwcAQY+FdehuF4lODEKbEKnktqNTugdUyw5tebmuwRGwG6gSHxlUOGxg?=
 =?us-ascii?Q?7VGlfhWeYRbWigEYx4+Lx1V7NLtpDK1A7gNENK788Oyclw/r+SGZEXTEKjwP?=
 =?us-ascii?Q?JMk09UWIC3mj+Wuuck4/N/M97gI/OH3LrcIQa9XmSj9hMUwgyimp78zhSh41?=
 =?us-ascii?Q?oSFJHK+t4jhdabEvZU1EHVGJCtNV6IGLmIJhI87WSX4Zq5j7dBQ5ojTOMEgM?=
 =?us-ascii?Q?ZModuyObuZ3V53Bd0pluYpgMUUbzALyw6fhPtgdKxXLB9aG19B/5hqeHD1Mb?=
 =?us-ascii?Q?SZVBTUFOJvPfPHtsWguCHgHynDniYh1JHCCePMwco594LiWDEgmnQ5WM54AW?=
 =?us-ascii?Q?B8mGKi9ZUpqL0v3hd0Dilj//p1J+4eW+OUNxeZh7MtMkcG+VyenQk418JzSF?=
 =?us-ascii?Q?sgutJm7Q4X4JSdQHPdfOGyDEnGQ9lajz+PukxyNUH0p3aQCPmS+AIEGIFa7v?=
 =?us-ascii?Q?H3Lgpy1mdJyiAzPPpMU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:17:16.4467 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6a72a9-a407-47ac-44b3-08dde45770fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5742
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAFe1QR7bAMwgRo/VNjcXzABk9XFf91iDA7514WqRaw=;
 b=gDZPuzHeawG4Nft2nTpY6znMxv1z/WCESpXj/T39wXxF5vVMn9LN0B5YLySOvsNgIObGFUgJ9YpUP4VQp4+EGhbJrY2/J/ACGULgzylS2ajvnmmQMsgbsYcIX+2tBhWYNpp5l3etXyCRPUBDhcr0ks55pdzcE5X3tLY9ITlM3LA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=gDZPuzHe
Subject: [Buildroot] [PATCH v1 2/2] configs/zynq_*: bump to Linux 6.12.40
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
Cc: martin.chabot@gmail.com, michal.simek@amd.com,
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 juju@cotds.org, thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynq defconfigs to Linux 6.12.40.

The memory leak patch is included with the Linux 6.12.40 release tag, so it no
longer needs to be applied to these defconfigs:
https://github.com/Xilinx/linux-xlnx/commit/9691533f6e6fd0a596ac7688e82eeea53f22c434

This patch has been run tested on the zynq zc702 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_microzed_defconfig | 4 ++--
 configs/zynq_zc702_defconfig    | 4 ++--
 configs/zynq_zc706_defconfig    | 4 ++--
 configs/zynq_zed_defconfig      | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 87a06fa255..b7bf70efcd 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -5,13 +5,13 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.40)/xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index afc13db1d4..f968ae1a08 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -5,13 +5,13 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.40)/xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index e0ebedf0de..fe40dc99aa 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -5,13 +5,13 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.40)/xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index a9fe0d352c..53653036ba 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -5,13 +5,13 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12.10/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.40)/xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
