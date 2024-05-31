Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EA0C25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 08:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3E6242390;
	Fri, 31 May 2024 08:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1nlDOvpD6A8; Fri, 31 May 2024 08:44:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEE844238D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEE844238D;
	Fri, 31 May 2024 08:44:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F089A1D4F98
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 08:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9B88417BE
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 08:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yaf3KdaE1C1D for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 08:44:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::600;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1117340762
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1117340762
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1117340762
 for <buildroot@buildroot.org>; Fri, 31 May 2024 08:44:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjJaZZzyKYWVCrued0ol51Dd89MxMkkFqutIzzpjB1DZUgFiMsOzIyEx6mfMZHKscX0QNCnkbriaj063wRJnAzCowgvBtHXLkW+uW94yOx91a2gUha2kr8gcty3+gs4Q8thegLpougYrql2UXOpatSngqQ7Yn2Aw2XIKdQaEfT8mmTg2Dy/KQQ0K4Ccz2IyfWfmh8YhDrkIZXVVofy90sYk5Nnc6Ia2uTbmHNDP1BCuOMB20ocBrIP02qJNmy3W3i5kCIogxfIFzsHElZhxpM3lf3Dha6dr1trtGHxh0M13QhLQEyZXSz8zKfUAMnyDoSkqXTfhSdvLJD/Mn6axY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5J+Iag3OijjwEvD+K4MFd8mYM3bsm8gLONanoE16+9Q=;
 b=UPVQXaXxtH9ZxyLdphnJtG5untg/3mfnYhGQoGwYWaHlBRi3mz88gF1LALxtsEQaYbjGOqeN5claDNoXKqwPzFDsZKEythHXTAzQCzWnb0JqgiGEMNJkfXRJ6BV0JDnysHkGFHDspH04uZ0Ju36MNVeWxAAFm4RlIIEaOVd/ugR8fsWeOaV+xU+ZdPxxdfxiAX18w88uRi2FsQqjfm0j25NiJG7S+l51iPuWnOOSbJLLhzlHtTQlSZfY0tq5qw7icXTvg3n3zef+6IWOegHAwiShw7kZEeCCmZBFXrLfDqhtyFueUI91qV/faHd3tOdB7nz992s+uT9y9MMG9w578A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA1PR02CA0009.namprd02.prod.outlook.com (2603:10b6:806:2cf::14)
 by MN2PR12MB4093.namprd12.prod.outlook.com (2603:10b6:208:198::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 08:44:06 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:2cf:cafe::a8) by SA1PR02CA0009.outlook.office365.com
 (2603:10b6:806:2cf::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Fri, 31 May 2024 08:44:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 31 May 2024 08:44:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 03:44:04 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 03:44:03 -0500
To: <buildroot@buildroot.org>
Date: Fri, 31 May 2024 09:43:49 +0100
Message-ID: <20240531084350.3703469-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531084350.3703469-1-neal.frager@amd.com>
References: <20240531084350.3703469-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|MN2PR12MB4093:EE_
X-MS-Office365-Filtering-Correlation-Id: e8246d27-831f-47bf-c2c5-08dc814dd430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|1800799015|36860700004|82310400017|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j7IA2DYZFyBi5nZa6YpaKLBTbTgPXOuekcZY+ZGhN1hhr8rH1YY1+OUSkpoU?=
 =?us-ascii?Q?FvbF9k1iP8O44ZlaXWrv9DZXudDUFvRJ8EOsIy14k9iTtZF+KBBOeayIQne+?=
 =?us-ascii?Q?G8xct/+D45DH9nvCt6hNvp9lefD3Un5VRAw3H2CQu9Rm8XBYg6s4P8lMgE+I?=
 =?us-ascii?Q?JlZjWHymGH4ePutrjq2BQrjbZu/4hXa5qElWNmKESHOP0EL7FeMIPA8uCUlz?=
 =?us-ascii?Q?18oLFwx8ms6vq5uZN9lH4E8N6GYBZ6cZbZ9QY/xFzzxKPrWk5SMMqIcij5Kk?=
 =?us-ascii?Q?TT48ttk37cUGXUuR1RtHlM3ZhWGZLzQsDJnqoL4+EuVZSwsY5YEzHgGnXIqI?=
 =?us-ascii?Q?1chpmp/ycdNxiEO8FS39cWSt3Sz+Jmh2HEb+PPB5Q992dJS1SKM+eTj+1IrF?=
 =?us-ascii?Q?otGgROfBcCGEP0tJ/pq5bspxc8J3NIJ+NaLAObge5GokRHTvqzpzHyBe8fgB?=
 =?us-ascii?Q?MXcHNh2RMORy4MZDcVfA5V3gw0JfAWEuCGIWYRe2Nli1QuMFEPvxqfaLoh0f?=
 =?us-ascii?Q?ZRKF9F/t7pSS2eLQYlhutbgS3+XHhbJfXg9RYOpMUmVGYBm+z/WMJ9vh8j1E?=
 =?us-ascii?Q?G6fOHViAJw0GpxUIlnrRog6YkyG86aNVZ4RyLw8JxH+qhUnl3scEItHWl9a7?=
 =?us-ascii?Q?9s3zAkK3VDjrfKpN2dI0gBqS+izyIWkz6rAw4mUM1KVOasK8fRLEStxoqMR+?=
 =?us-ascii?Q?DTqeox2DiEnLcMOMy1rEozGvhah8mse18prNil70I4dR/7HRhseAz6aBr01r?=
 =?us-ascii?Q?gXTu2VlEfNjD5Yl2RstN+ClYAdxvvDKzUhEcqSZbWLXxEIo01rR7tgOb9lI3?=
 =?us-ascii?Q?Aq/L6JqfBJ5KUm39COvsO9K/cfzrytXuNv+3B/J6bYmdt8EGk1jBmB+aypPj?=
 =?us-ascii?Q?yCxwnC4Ys5qnOLO5UnLPySa6rHWehjUfCt4eRvOgELjGzeTg6lfeQwV0fw49?=
 =?us-ascii?Q?rC6LvYDaxYPI9pZSDTl/qGD17tOcTshp8TvPLEDdV9JNyYlEJfFUVc+4dsQq?=
 =?us-ascii?Q?7ZfgCRyg9qeGM92hZrjcW5X0bIyPGOKNC1imsIjRYib2BIWoYLGKRMICvhtK?=
 =?us-ascii?Q?XliQn+pch7D5sxs2eocQZyOrMqo/trt5U3C/sevIEtcLxUMDW02r5f57xuNn?=
 =?us-ascii?Q?C6Aan7auqjetD+j2ZB1gUmrtWjOmaE8kVaO2wjlUVyfcAHID+jHup0m2ipVE?=
 =?us-ascii?Q?lT6QuOOhWPo6pNhslCCxxkz4P1XGmHcqtFUSf7gpXz5v0MSGSsSMRhLeyKAy?=
 =?us-ascii?Q?S/8H/wExLL/fGsnPwNbfFZAi1bJlqMD7iVvUyzeGLDDlu23m0Zx0S6SOL0ut?=
 =?us-ascii?Q?wQFes4QpCkCVCv0Rjp/zT6ox7TdNO80A1XCaHYnWJ3DWH8jV+JXheHoP1rZK?=
 =?us-ascii?Q?clUl+2P3RlUgHaFggWI9Eqs5DPy1+F/5JiXdQCfxqPtasszLJg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(36860700004)(82310400017)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 08:44:05.1573 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8246d27-831f-47bf-c2c5-08dc814dd430
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4093
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5J+Iag3OijjwEvD+K4MFd8mYM3bsm8gLONanoE16+9Q=;
 b=hZimn42wvU3/9h1fKbWHmXi7v2Uid+Ke4/+8JceOqSE7rhfVDMIH3rky9X6JNEgEklQDU4JTGLaz7NJda2/AOJpgIDUmhwq5NlrpcZhshDTai+uh6gIKoXgySYgPIOw5uZIjVKn+x6JEjT38Jk7M2ajZe1e3h8iZyryB8Wkct1E=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hZimn42w
Subject: [Buildroot] [PATCH v1 5/6] configs/zynq_microzed_defconfig: bump to
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

This patch bumps the zynq_microzed_defconfig to xilinx-v2024.1 which includes
the following updates:

- Linux v6.6.10
- U-Boot v2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_microzed_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 8fb9bc49dc..9adfc3814b 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
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
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-microzed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
