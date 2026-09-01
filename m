Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6358BC61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 08:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC5D36075A;
	Tue,  1 Sep 2026 08:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2x3jgubwFbP; Tue,  1 Sep 2026 08:45:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788252308;
	bh=KPyRDDtJMlm0OBP22WeS4QWXlzgMuKk7Y77hPGSIZOQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=LXx7mZa8SnTcU74SSlYDSHW5agb1D+rWTqn0eqz9tctC2Qs/7mX+Xbd0mPhJYjZ0x
	 PST1tnQdwRRh4Z+bQ8s7A5fRX7gAFVoIsS/mDk1uctilyLZVChTN4/tawD9RieicqG
	 M17kiHiGjCWCC3t889tBAuHWlTwxiX4R6kU2rwSqYAAsIKTVhhtf/YdO4qc0KXJPJn
	 7eIybJDXlatrpnXf6Vjaad2uA2FwZWUhD2Ckmppcq5SQJI9/3CVTduf/3UjJjc1dH1
	 1PF1IVHSG8f/NVg4F+lxLPpol/oILBOt6evYgDE/cF4ZroUiJB3xNARpNwEjM47fOX
	 hwAEG8rcqKirQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5C2A60737;
	Tue,  1 Sep 2026 08:45:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F09B2AA
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 08:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A6DB80B75
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 08:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dX9fj3mQ_Hyj for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 08:45:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::9;
 helo=ph7pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::9])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78CD280B91
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 08:45:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJBLjk49l3yNQqQsofSYJG4qYpXXMHGEadmn21AiY4w9CGb+kP/BuMRET3i9AYRueqODwI+3PRquvEz0/1aG1C/xObP5EnUzO6nRCyC6EaEoZprKBG3v+NNTQGaUN4jTCpzwTCEnT7036jKMnPf0Qdetx9/0YZimzLWZnLLKCm5ZWjI8jkUAzf+JBH/1Qag8RcRmQXer60b3DqirTZERevxyWEShYGtrcx7oOsgczIGnhPVshOfepuD4d2ut9LOzZ5h3sxSblUrXmcxHK0MEqcGfn9ndc4EHu9nX+/pQKSGY+Vakaijc+tn3LkzlgRVl216Qm+gxdLYF4YAM8doyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+4owGbgF/D0MqhHw6QHAtTgTiQObfbPcsQN3An22CE=;
 b=KnzpSHRjZj++xlwQtzaqjIQQ4vOCZYpjA4XLLnNywpZooCJFOJ63u14ZmlK3Wt/KGEG5qwbl+372ezY3/CGoURnjefvmwzZE82e0xReAK/w7kUVUlUPEA2m4KoF2HXxT3HB2ShXVUKpKawRWUu6CvxfH67/m/BKvc1nMn0D/J2x2wJiiXRTlox4F2cI2sRNMSAReIo+2xpcYh/HTLgGUc2OB3FIJPGKEOq2YOh6Kz7f4Iwg63fe9sM4iUdaLMXdE7BmQ6cEn5+Co6s7e5feea1R5xRdAPOPTlNyuKAZ3GGN9BdyNYvSIAxNyi1vK7WH6bYVByjtnD0SrpWopYIpkxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY1P220CA0050.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::12)
 by DM4PR12MB6230.namprd12.prod.outlook.com (2603:10b6:8:a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 08:44:58 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:59e:cafe::47) by BY1P220CA0050.outlook.office365.com
 (2603:10b6:a03:59e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 08:44:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 08:44:57 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 1 Sep
 2026 03:44:56 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 1 Sep 2026 03:44:55 -0500
To: <buildroot@buildroot.org>
Date: Tue, 1 Sep 2026 09:44:41 +0100
Message-ID: <20260901084443.584247-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901084443.584247-1-neal.frager@amd.com>
References: <20260901084443.584247-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|DM4PR12MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: 848dfb6d-dd7a-45f4-9576-08df08054d3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|22082099003|18002099003|11063799006|56012099006|10067099003|41080700001;
X-Microsoft-Antispam-Message-Info: H6nF31UlDH+8xPShlzcm85mRc1lSkVdqOsDRcvNDdDgMGWybdU1K3qwHnpRCh3/Iv52NOr8FoVsf//4q9SuEcJfrcJUsJusOeA5NiX6N8LIjuRWajkKunYaCVL6DWyk/5QjLZlwzvZodQEXdb1SgEf3kn4Lm1ehcSyWFKxM+alfrJx4kIWZ6kygqsDxoIsFhxH3TABtwdrbsKgUrTgjUoaNp8P9i5YFmBYDZ676AFXtDPyVcKJ4zJ24aw1ySrVeQ2FPhoxvP3rsevd32gL9Z7clLlQzPoCs6/GWqHSi1z8gUFs1qUcRj+BpAKW+T+TNUWh65ejfJfyMa/Qg/sLsL+6nBwZnNTn2MCJ/hCvUcBJD4huiihx07gXChMHPqJtzqQ4Q7N6AjjTQ6nAX33jmEPITK89+Lg69EWBQpy62VyKv8ufy9+nJqDNtdvYdsGPCUjWEJb2DfjNwdJTwh6eYMnLUTdVhwMj1ggFDIAB3Fwq5fr383blN/yOViN1Nyc3Svcg69W5QK8lQzzMI8sMKORLSY7kYg8B4kx5bMS7RPNJif2IwGkR66T3u0M0ohiKKw1G9QwtkgNHBX+RafTa6AY1EKUco8gxfGsmQSA5eTS9FfaV9/Cs4v4gIPMSWA/E7NfPWPvuM8pQ84fMprbPkmgP0Rh7ROrw98E5JdAKFFFs3P+kC91p5V7ZKpgQDTmhQm7nAXSeNGHAsMmyO+bqBmGwotu4ewDmB4DIEogydcIgxC4Fmwz3pqow7OfbRRhsjYtw7swVfTC3o2enZs6MmumQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZG5DcsVZ27/3WpnYOvEk/ZeV5dkcwMn7f7yLiFoCKSm1/vZlnZuqzfVElFCJMYgxozSbgXDXaxBwCaqF08grMiQwJ+EcWgNwekkzlSqZ3cQ3ipTsmEnGviwNjo7chURt8QYotmV8YjnWhsbiMz60wI3Ed91r8Qg4EkiG1XKkDTROuOA/NnWvgSJTA0/0zeKX7Mye4owJSmkpenlZ/AehWqnvVl5+TCmmHU7vhMuXY7lM3RyFbOsRfnkGlGnCxoa255YKy2MmSgsAN07tO2n1PcyFFY+GjhxQ/4Ybc5wpzx200n8Hhfke3QzzEE/Ui4I7dXRoemYxk1bRWaQlaCakvd3uIRqHwjDLYQ7K3y4StzzqukdF3Eo0QX3I1TAuzpccRC4M4hV1OQH0Kc04brnXV/K/TnlXfoDGOmOkeU6SFn4pFIIIyk62u8R5+6OzF4EY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 08:44:57.2317 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 848dfb6d-dd7a-45f4-9576-08df08054d3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6230
Subject: [Buildroot] [PATCH v1 4/6] configs/versal_*: bump to Linux 6.18.40
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

Bump the versal defconfigs to Linux 6.18.40.

Run tested on a versal vek280 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal_vck190_defconfig | 4 ++--
 configs/versal_vek280_defconfig | 4 ++--
 configs/versal_vpk120_defconfig | 4 ++--
 configs/versal_vpk180_defconfig | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 100af782cf..5499f1a229 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -5,14 +5,14 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1)/xlnx_rebase_v6.18_LTS_2026.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 42562603d6..4072e7cb22 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -5,14 +5,14 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1)/xlnx_rebase_v6.18_LTS_2026.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
diff --git a/configs/versal_vpk120_defconfig b/configs/versal_vpk120_defconfig
index 67dfd9e424..37f353fb21 100644
--- a/configs/versal_vpk120_defconfig
+++ b/configs/versal_vpk120_defconfig
@@ -5,14 +5,14 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1)/xlnx_rebase_v6.18_LTS_2026.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk120-revB"
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 0537fce6e0..1a67d54bbc 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -5,14 +5,14 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1)/xlnx_rebase_v6.18_LTS_2026.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
