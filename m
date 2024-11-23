Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24ED9E6ADF4
	for <buildroot@archiver.kernel.org>; Sat, 23 Nov 2024 11:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DED6A42D67;
	Sat, 23 Nov 2024 11:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZFdtS3ghGEE; Sat, 23 Nov 2024 11:12:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36EFA42D5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36EFA42D5F;
	Sat, 23 Nov 2024 11:12:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15247E11
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03F6D84BBA
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-DJb9DxuAj1 for <buildroot@buildroot.org>;
 Sat, 23 Nov 2024 11:12:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2405::62f;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E5E784BB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E5E784BB4
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E5E784BB4
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:12:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JICDrXrnkIiWchNNYdj86Vqe8GCtMIj7RIgQ3RKTQ7Yz8zSlPh/IJnEiLTDet5C9rYr5hksEW0up4HiTDlu66DdLaH+BudahTdtu84Nh36+7IkF8LOkFQf+F6VURP8U/auvma67YDj/kPGajLY6+fwtH6S0ncT9h8q7itoFYZrVZ0rrsP6hVK1yJvd1ZBE7iQsmigCGlaSKO/xHMXN++j99tZvXZQR9z+H2qUnT9O8AUbt9D+dnw+MalDlhNEa6n15j6T9YrnyWZPrj3K0UD78f/BKR0ZKX72R7A5y0RY+ZI7QgYDiCgTDYbtoaJkIvQqzpM0bLXVbhfr7WltZWjPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZOT/nHFH7mcz1LBVMb5Ir6C84IyglS8/xK745c9vu8=;
 b=qVgQk5DNFMNVhUYdWsbZ32/uOJN1zUaMwXakgAKl+lURvHOf+SHwZITwAW8ZCYIwg7yj28y5e1DqY/mg8thC7EVFHT5BYi4ETB2bWrW+DK/cCz2Iy2ZH0+dEMkCjx4FgFmPSt3strv/16/aAQ5VNRXCMa28JVeqwGtx3xOamAZISRHo0EOnjEVc5qNAiWxluuPJ4hv/boKXr2A09LJEQjaGzgQg5F8wS50QrFHKG+t8Aj503dhcbJzbKGjoii5HjLCe6EIIAIJWozgLt/HIuSXvp11r6rErnLnUKHE14gS3tZir9eG97VGe42uvgHUP/vnZ3JUAxGyunhhswtcv1rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH5PR03CA0014.namprd03.prod.outlook.com (2603:10b6:610:1f1::16)
 by DM3PR12MB9435.namprd12.prod.outlook.com (2603:10b6:0:40::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.18; Sat, 23 Nov 2024 11:12:12 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:1f1:cafe::bd) by CH5PR03CA0014.outlook.office365.com
 (2603:10b6:610:1f1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend Transport; Sat,
 23 Nov 2024 11:12:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.0 via Frontend Transport; Sat, 23 Nov 2024 11:12:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 23 Nov
 2024 05:12:07 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 23 Nov 2024 05:12:06 -0600
To: <buildroot@buildroot.org>
Date: Sat, 23 Nov 2024 11:11:49 +0000
Message-ID: <20241123111150.2124027-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241123111150.2124027-1-neal.frager@amd.com>
References: <20241123111150.2124027-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|DM3PR12MB9435:EE_
X-MS-Office365-Filtering-Correlation-Id: d90af1d2-2f75-441b-f497-08dd0bafade9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/PTSvYwE4Bm0zbqLEFnVtSFHae6zBz5AUEya0nCWIaAviVmrye/RGZKYPuAi?=
 =?us-ascii?Q?xz4FLycuC/8HBMoANACqLFjIH8QhmHS+zGImZgsAAOWtED74AS/v/Edq9CbS?=
 =?us-ascii?Q?TZG0kzBRdSnYL2XFKzzw5Ly0K/5j58cqT4KmuQ1mVDgVMcGk3k/H1LVOgaGu?=
 =?us-ascii?Q?zOds/IcTPxiX8dhgfEtEHMQAmfvqe0ypAt31swbTmJSPeJt7sYjiV1YtWES2?=
 =?us-ascii?Q?Gi1nbDabaJ4dga/jdLmbo0FU9Od+Tw+TriVTjsdEGJ0dtLXDUlRTRY61Xqb7?=
 =?us-ascii?Q?I0+ChFdvRqi+1aLgg0UOSKR7PZ/bwL7GL61EhDBuL5zKqihYRXR2TdcnlNWC?=
 =?us-ascii?Q?WD+I0DxSlRAuY15x5QeWm6i7ANkD4zKT7qdAgrF1ho2pjakpNTp448JU81IX?=
 =?us-ascii?Q?CC3GckUs/THuzniJFB+xrm0unOhooYGpmBJs+I0RoM+TZZz8DBawKDyRNnBE?=
 =?us-ascii?Q?vTCuNJt3gVcQvXw21uFNuZB3up0RgH3H63gWfmR8IU+eCcaC1Zgg6VyMxOEt?=
 =?us-ascii?Q?wkBAEDN4byW/6I2jLmon3eUQlOoddrFhDWa3I18njI+OU+5OgmUVp78xnu7d?=
 =?us-ascii?Q?5TjIr9+fx+ibShTFTO1/Yk2gEhYZcD6xC32ah/VeNXpdE6eKPujAI9JgwJTB?=
 =?us-ascii?Q?Jg9cP4Dn5m8SDlqa1h1UcD9S40KV+m4K5FeYboHg5fWQgzV+wAR+t5k9v+Qb?=
 =?us-ascii?Q?+LG9hMHo9IhIXsPj6Y2uNbSig7WsaE1WtZ3zERNpEEyOt/vfBRdEcvbAt2KC?=
 =?us-ascii?Q?o9IQNFbQ7025GFfw1EPGyDsQlk2l8GhULCHujSk5oeJSjGKITbMZovg3bML8?=
 =?us-ascii?Q?u0uyYB0ginV72D+r+rpCnQ05F/S+YIMWbBdLBpauJDarKI+FOy2jthzPnvrS?=
 =?us-ascii?Q?AHzqBjrhWKw9/qPdDdFEp78835M07uI84eexhsfRNV6Ytjr+YVdlIm5eokPq?=
 =?us-ascii?Q?639MmE9BZ4ITXdAKbpTd2iJt+j6fyqThphmVOW7nff91JixZ7hLPBpUhP3fQ?=
 =?us-ascii?Q?/8c//N/GzBRBvqILLKRROmMwe8iOE88FUgulDT+1iUep1qPoO0e2NKOPQpPX?=
 =?us-ascii?Q?mzrBxh+T3a5UKQgVRS3CBDRDsNQBJ9yre9Q75htCVfeorIZtkjzkWcD5++SU?=
 =?us-ascii?Q?kj1UvXlk4b+Q17NbTPzs2CeQ7eTDz/yxU5XUroULc/zFrBro8Q6qXDy2NHIw?=
 =?us-ascii?Q?gJMSATSZpPEQSrK7Qk1xiUn7C5MJRkqMLIimge55O9y4rTvBuJChGJZhGmdd?=
 =?us-ascii?Q?r/kx8REGHTlBJcNXhH0D5bb2/S8Sg3+ndYTSR80vxv8b7Mh/aF9afhP5TlGX?=
 =?us-ascii?Q?u48o+K8rO61wMusiGkFG3/USw5VDzDGiVi7b+L1HSA54YQT4Kf9ZJE77FER/?=
 =?us-ascii?Q?RfN5i+rf+YIQKTP2QiNOBNedOp3USevx2k/AbFtCJl5sQORYru2DCzpb5Je8?=
 =?us-ascii?Q?zjO8aaw3oG2/RYtzxnoWUPMjBPr6WM6yn5XJdwwnhL85bNCq/BX4+g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.12; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:atlvpn-bp.amd.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2024 11:12:12.0670 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d90af1d2-2f75-441b-f497-08dd0bafade9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.12];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9435
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZOT/nHFH7mcz1LBVMb5Ir6C84IyglS8/xK745c9vu8=;
 b=uP0PfnHDN8TG4hFUfhGg2Uv/sOrEcVyvvaRkdeuPwj6/qIyqCBPaSBZMQg3grvQt6gBuAUDPKGDv52RYzXz3fok8RhHuJNI/ZcBQlAqtONnLeO/YDmvw4k8yC3pZRYyMAdSpymCpD4ccdE4TQ1erLtnpPkwau5oGhJNm0q7XVfE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uP0PfnHD
Subject: [Buildroot] [PATCH v1 5/6] configs/versal_vck190_defconfig: bump to
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

This patch bumps the versal_vck190_defconfig to xilinx-v2024.2 which includes
the following updates:

- ATF v2.10
- Linux v6.6.40
- PLM xilinx-v2024.2
- PSMFW xilinx-v2024.2
- U-Boot v2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal_vck190_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 697b6c5169..21fc202b30 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
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
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
 BR2_TARGET_XILINX_PREBUILT=y
+BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
