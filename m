Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD697C5B552
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 07:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DA8183ACA;
	Tue, 10 Jun 2025 07:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-9q8LxyclQD; Tue, 10 Jun 2025 07:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FBAF83AC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FBAF83AC1;
	Tue, 10 Jun 2025 07:09:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 553E41F2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 07:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4846783AD2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 07:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_3AfCoWjdyd for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 07:09:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2406::622;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3DA4082189
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DA4082189
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::622])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DA4082189
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 07:09:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkRJ3JiChETmx0Ldg1Xr+hklm8kdpZS1kOymRAUSijzdmBivjwW9yLyvyBKuSIaEoUp0vsuMxKK0Or4cdCzkVNEbrZFDdPry3extpqDCnWJk00fVLxWl3CR3f9DrJMmqJvnnCYLgoYt0XXPcoyl3nwdThYmZGmIIFK+gLnSlqvsovsL8Fms6x2hcGIRB7+XOSmD1XciPjOrvylxPbDV0JOwBnJDmD6/mDgHpzNN6sSlGwzW+nMnX86RL8S+PVHkTn4EEbHzasrhOKP2yEtxgRmMVbcBrfBq7/pd1B2mYB1rfLU/GcA85sYn4+ByeZ5yUM1kOYtPkYJj0fFwr5/gJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4Fy/d4WUPCLG83YnWFQOeU9DL5vEFLzawPG4vkcP0g=;
 b=Jlyuu+I43fs5AFxYz5Nl0jK/Sw/cQjkD/sJK6799pCgqeNmUu1+/6znnHnUH8pAu3jA7W0j3G50m9zxz37R7YvKc8GZBt2cBvmGbPLk1dkQuB1P6/g/hJA/XWYX3WwwSfT4ZCq2UaJYpEV2+NhFwRDc83rUUx7mNpjBBe++iBZFGNBdodi64pLVzna/4qur8xuaXf2ZK12KOCwFEWWTfHtm4qPdmptgd4KmUopRFhPQY8WpjtEkqirZ2LEoAFOQ+497wuan+x4bi7rfH3rUB8KeuE/+keGKTHUOUzKEp+BR+K502If6E1QtNNoMV/SoGoJHWZQSgwnjWGrbdgDCpXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0175.namprd03.prod.outlook.com (2603:10b6:408:f4::30)
 by SJ0PR12MB8615.namprd12.prod.outlook.com (2603:10b6:a03:484::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Tue, 10 Jun
 2025 07:09:23 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:f4:cafe::b5) by BN9PR03CA0175.outlook.office365.com
 (2603:10b6:408:f4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 10 Jun 2025 07:09:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 07:09:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 02:09:20 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 02:09:18 -0500
To: <buildroot@buildroot.org>
Date: Tue, 10 Jun 2025 08:09:16 +0100
Message-ID: <20250610070916.3460517-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|SJ0PR12MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: d0bd4f26-a7f1-44d5-1f54-08dda7edb9ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rU5miI3hJwrxWJik8wG2dD1fR80ob9jhlH+f5Lna28epGWb7ab9/1njkkrUy?=
 =?us-ascii?Q?y163VFM9S1S8+T6Gm3XsFEAEFS4mH9Yt3s93ZW9OM6YO0Q2qNWlF7WsbCa3/?=
 =?us-ascii?Q?nHvhBkKIDgsz5ip1d/SfpvKUzMZS7YCEU3UbA68EiANTpMcmERaUXXpQHycH?=
 =?us-ascii?Q?LGSKZo4GfKn/IO+xvFY1f0Ez3+4NjHpjgRR4DEsx9ND5bPbqheY9WeHtL7FN?=
 =?us-ascii?Q?9l/G9gp+ZjDwTZj40rrG2/ARssEAW+NJSEC2ShYklJroImwOgaQFXrYOs+c5?=
 =?us-ascii?Q?H4QPaunBYjgP3td9cBiRwcrSPIZxArZH0QceYspRkmXpB4Tj14LuF0fZhLnI?=
 =?us-ascii?Q?bLuV97wTlnMBS7lVpvLFK7I7j68PgT1MsJCMjrAoawQ/mqksy3uyI/LeWuEi?=
 =?us-ascii?Q?KCFNVOTjXHkjdOuk9AwoT5zdvR0iRHOEVMGdERUFiQ8q2dMA37AYLmsv5kes?=
 =?us-ascii?Q?JdLa6alAHybu0VEk9JI8ThohJBTkg6PFXdIvwCT69VVmTPdvXe8NI9EGG0aQ?=
 =?us-ascii?Q?XV+7fTjoqFYf4Q91KbXVYCCksbVob+qZTh08wCvg7trzVrGr62xgCwl9HEUZ?=
 =?us-ascii?Q?J0IyCaZ3FtG+VQ7fC+c7C1d5Nw1f0dPeuUYAI2cJQRR3lYYi2xQnkuYLVhfd?=
 =?us-ascii?Q?DlVKLuU6aYBmpcn5hXHvPvsYwbRvt8aF8kPz7h+j3WscbEZgxKgl1LnADDuW?=
 =?us-ascii?Q?yYtc1CnqtWUH+jLlTt6lX2Zcq64XEZLwkilnBZkIIMcoj1juSFVZzH5cXr68?=
 =?us-ascii?Q?ek+DtS2agPwPEOGpklKzihxCE9fAc+VugBVy3j2ATDn/Zmu1MZOrHeGfVYdb?=
 =?us-ascii?Q?6I+D/gCwshTcj92SN6ya73yntkSEPPTb3DhwG+SEfJJNbJsCknYjKY/b+bIp?=
 =?us-ascii?Q?XP2jNCR69L1rf82DRdKWuVeoKt63CY9XBunuvZ6v8Qpa9xmxk37FoWh6rWpf?=
 =?us-ascii?Q?56eqqQRqqCNkcfBX99lxmI0Mc+PjqAM85S82e00nsm/dcn78m/QVdbtPWRsX?=
 =?us-ascii?Q?+swPBc3Bmq2xBN78D+pjCOo/MurAnJJ36dF9KTLFp9z5N5lPubxWgNffueU1?=
 =?us-ascii?Q?vq28i/xts532TR8pWL4tTV4aI3pSUUi0NJo5T6hHF3oCAGHUDGC7bjO+Km/7?=
 =?us-ascii?Q?/XjCz2zo2odmCe9M4KToNfAT94QI+RgNyum8hTpBVU7hXhshyv4Xi5sMUjwN?=
 =?us-ascii?Q?JjqCD9gpyrIJzl75lYc2F+sQTVCiSduSELi56Kb0I5Nhx2NGd+72md0SxSOQ?=
 =?us-ascii?Q?CoKWxn8FDfH6L0CJ1ArbvFBoHCoMLRzC0VkWJdYp+Amz8pcmN9KiUPzm/YLC?=
 =?us-ascii?Q?qb99f27BqRbACW/pK775Ejv9yRv343TBa1/GD/YtwNHdQBXCxY+rOjm8GvmP?=
 =?us-ascii?Q?qwGwt/3YeQbALUHeSLOQuH3sj8SvUIOgJl9pIpqe3lI/wFCe5+C9vGjZP2sW?=
 =?us-ascii?Q?5Ks71B7ocxLcnzOrKYcWGrWkDIqAcfyiNAjgMxdVUEtZEHt6s0vuwUR/vxIh?=
 =?us-ascii?Q?mQd9Pm0M90JHSqs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 07:09:22.4530 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0bd4f26-a7f1-44d5-1f54-08dda7edb9ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8615
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4Fy/d4WUPCLG83YnWFQOeU9DL5vEFLzawPG4vkcP0g=;
 b=sr1fvCbdO18+mTTumK+9s/Ro8/zScCJTuq5t9QL/Zq+P87ygRwm69f1ZJ6Oo+ODhcIYQt3tzhyz/doseFy5k0xlvH+9crv2VN8R7ER/QsZS1h+WBinJiaZe6t1+gsU4Pv+J/ZgeqomPfwKnxC1RHhmvhxflouaKPv2dsqIdmXNA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=sr1fvCbd
Subject: [Buildroot] [PATCH v1 1/1] configs/zynq_*: move to external Bootlin
 stable toochain
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

This moves the zynq defconfigs to the Bootlin glibc stable external toolchain
as per[1].

[1]: https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

This patch has been run-tested on the zc702 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
This patch is to be applied to the next branch.
---
 configs/zynq_microzed_defconfig | 4 +++-
 configs/zynq_zc702_defconfig    | 4 +++-
 configs/zynq_zc706_defconfig    | 4 +++-
 configs/zynq_zed_defconfig      | 4 +++-
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 404e09b7be..fb324b5a3c 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -2,7 +2,9 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index ac3304f293..f908a39a7f 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -2,7 +2,9 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 600b521fac..7d7f468805 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -2,7 +2,9 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index ea15865535..1a5d48e424 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -2,7 +2,9 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
