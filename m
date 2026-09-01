Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DE2C61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 08:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B09E06073F;
	Tue,  1 Sep 2026 08:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tW2JLST2edmZ; Tue,  1 Sep 2026 08:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788252302;
	bh=7mezO96CPXn+0unqIfVhdYIxpKGlemHHGG3YMBcBoe8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=IElkWAJVwFoQo9VoWSuUNCATFcd4L9rSZZFoB+XP+1UKLfscFAvUQeftt9fhi18iy
	 mgD8HBG4Ww6Xu5HOUbllaS+QO6soFTRnsOl0k8qD6egjzSmr4R0V0b0FTop7mWsLX5
	 92z894/JGGSZdJ6L6oDSoZzP/RmQl/Rg9zIl9BFqgf+Z91kElCFWtzU5BMwvUG20m4
	 UejEPUqANANaZgF8RbzsFmDRV55jY0M+BP/2SFORjc7ua4EsTMrZpBnsljQ0fAsQ3A
	 /kpSsjAwmB/+EIlfZdQmYNRed3Nca4Nddb2BOYSTTL4hurgs4L8UNbQopeZseE/S1L
	 TytFRc/wx7Trw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C03A60741;
	Tue,  1 Sep 2026 08:45:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22FA22AA
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 08:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 131C84009C
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 08:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEeJ3vJycYAA for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 08:44:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::5;
 helo=cy7pr03cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54F044006B
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 08:44:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfOpEjR83fF6ZETtpJqvqWaFrG8gVygYPh7ZaR95eo/P/HC2BHX/Ead1fbfMgS/aaiqVzOe8V1TT5m0PXk9oqQ0HEgZevqXoJ6dMZCYTwV9pwxIatvBhAer2mcLsVTXYuNGbpm0kN7ZUEWeNca8wcafpJBdIeReuXxtehbINOKHJLRYHAwrV8hXaFUcJN+FRlIlwY3LvhA34PTQaDDx8/8QUyLGuIBGkazmzcD5k8aUVRvO3MPV2yscOaobdIPbSWUpFNwnVOJ4A4pBakAywSGAtqoDez2eUB/EDeZeTz1n+ZxAOAR96HElaf57RY4u4VLXk69PgfoBF0ZMJ4cuNgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50lTVh1sCovqzAU22zKq28UCi9vIQiPs/FGIkn0NZlE=;
 b=ueP7ZROd2sjjXgvddmpvx8/67o9eHaxXaBMp8JAPxwerAG29bWGoQUxhdo7aew8LFTX0x39fkRpWBl2qbgw9+mpOBEXDeGAwPl35sjLcxhRhko8COmDLYx2euPwaJpI+XYzfaFf8P7PmjaxclADFutAOnCV0vIkNahFbvJvZQ/PAwrg97p9ngShQ9/WlcB/8nj8D7NkatxplHfULGab0DD8yn0sj5wKR8p2UnQ1nZAMHeMWSMSGYVrm0JboYP9kSy4EAG5+9nVo8AdYxkz4UQCbd4s1dVpCwpwhl1ko9axfAwg1O9jQU7KhMfhdBgXUS/1TeDpIMIbfQ2tCmsIa6Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ2PR07CA0005.namprd07.prod.outlook.com (2603:10b6:a03:505::29)
 by SN7PR12MB6792.namprd12.prod.outlook.com (2603:10b6:806:267::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 08:44:53 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::94) by SJ2PR07CA0005.outlook.office365.com
 (2603:10b6:a03:505::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 08:44:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 08:44:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 1 Sep
 2026 03:44:51 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 1 Sep 2026 03:44:50 -0500
To: <buildroot@buildroot.org>
Date: Tue, 1 Sep 2026 09:44:39 +0100
Message-ID: <20260901084443.584247-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901084443.584247-1-neal.frager@amd.com>
References: <20260901084443.584247-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|SN7PR12MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: b9e47244-4618-4f1b-0d14-08df08054a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|10067099003|11063799006|56012099006|18002099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info: 3kJjJFcaSjDxBFHsBcCPD/IONh+v5AGH9J0p/QcecX9S0j3G7xuj3I+NzzRz14RXJxqJkTbkjL48Ikckdhmn6g8wbx4/H9GUTbqO4cB0Xjzmlh86zID0mB+ignDft4hWW5BgJ5DuGjAru/JjNyqjBaN+iGDe229RUULSepxTy3fb3T7OtdfQIofRPHsVOthIFZ7W44nWcHDJDe+rO1WkIvztSYwr+eXbBtWT2ekgKOwEPuR0Gt/Jfzdnwz2SQPTeIBKL6leHzpBvGgLnpPOA7ihQGwFczkToPGsejWKo7VLRNISMH1jyIQ7h0vuwNspM1pShT25qp7ClAwL1CGAJN57VSmOx7nptjlmd94F4gWjePhdqBYXdbOSBO6cQdU/Ei3BqngdDXFGfRtlx6GulxjD3eEacsZJ1+jpmL3GNbUrGqXV9AX6JuQBjuGq7X+ycjEUdkfYciPRm/3useKE8990A/E5gm/OociLR9/ns98P3u/Uwwa+ov6blOVN1pa8upsRgBKn/oc4bHmdww1MjPbUdIn3R7c1LXQaBj9qeTH/MVQvXb52Ubt9t2WbWXxNLwwA0NjRoJY6szKMsDaZ1Lyum45GbbP3ke7H2yBszZ/sqW51VcaW9+QaRf+Ybig280qD+D9L45qYSY1pvidLOq5AwfF5+OV8Eg1AFMJZ3clXCda2xVxXo6dCiToiL3YTvvO5gd4tC/RsRrRiDtYCzOAkMBTGcWYFME6zRPqF7GhJAvvJ1I3vq/WCpIwLmUQEG
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yOW0v+Lju/JwZ4PH5x5IwvpnUMPb9UZs2j/LL1jy3ZwBs3uAq0CSnx1kTGk02+XeDPipoWOatQTrA9hh9DswwVCoMBA3gXjJJsNZ0XKPynzoS4qt5ABWgdj8+W6tCg6VORqf9727gBT6zT8F8HyrQJcdQUJ2f86X850O+msH4wu2OhLYo2CKdxRt3tCkvEYX5142tLMg4tFJfuX4a8xTnFFG0zK3cZfPhmOxvzJju4Et2gazh6OH40ObLE727TyweCTfwHdq96MZoQZrPLk5Zl20EpKlcE+EvjxxeB9ldeBYLHmzhGsskf+ZI3aLzeO7S9C19p9L8bPAuu3W2kx+J9PTTvyg9/zGlQc5/m0038NrRE1WGAX8N4/sAkDqtEF6aHU0/Pw+q0W6wTTsvYFRewaaa67IGVIlmwIh4ZxuK3vjC2yw/tdbeoh27CVRfDwy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 08:44:52.1553 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e47244-4618-4f1b-0d14-08df08054a36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6792
Subject: [Buildroot] [PATCH v1 2/6] configs/zynq_*: bump to Linux 6.18.40
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
 thomas.petazzoni@bootlin.com, arnout@rnout.be, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the zynq defconfigs to Linux 6.18.40.

Run-tested on a ZC702 Evaluation Board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_microzed_defconfig | 4 ++--
 configs/zynq_zc702_defconfig    | 4 ++--
 configs/zynq_zc706_defconfig    | 4 ++--
 configs/zynq_zed_defconfig      | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 6c49eeeb14..fae1abc60f 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -5,13 +5,13 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1)/xlnx_rebase_v6.18_LTS_2026.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index ac08e14a84..e3fe95dabf 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -5,13 +5,13 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1)/xlnx_rebase_v6.18_LTS_2026.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 7dc43e542c..2bb670d8d9 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -5,13 +5,13 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1)/xlnx_rebase_v6.18_LTS_2026.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index c96267c125..2c4db8bdad 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -5,13 +5,13 @@ BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1)/xlnx_rebase_v6.18_LTS_2026.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
