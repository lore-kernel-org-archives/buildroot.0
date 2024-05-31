Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22870C25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 08:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9A49416D6;
	Fri, 31 May 2024 08:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AnfhID9xzbEz; Fri, 31 May 2024 08:44:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82AED417BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82AED417BE;
	Fri, 31 May 2024 08:44:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F36AE1D4F97
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 08:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC75040708
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 08:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgyt9DpwctgS for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 08:44:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::616;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E0A04066B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E0A04066B
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::616])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E0A04066B
 for <buildroot@buildroot.org>; Fri, 31 May 2024 08:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmeEbcbH7CgBc+hn92oA2C05jfABbqO8PNzTY++IdsFcnknKkKWT5t7yblSOe3mrtlZgSZFWdkqjbdVU/vHJjRfFmoAabh3y+qzsPpDYxri0Ptp7MYUHbywwE8CGOsZrYgDuI5w1R4zhdaqhCion5E+Y+Bz0frQnqMZcQjhOu+1l7coH6nIQcC2n9XCwMS1GyVULEC3H1DNRS2IRt/ITvf6ETvwaePBV9Uc3shLmNt4ZtHgXZz/nGPQCV+PcumCLNnqYRgN/cROJ0qXbFOiiCXkeKUxBOxRFet29+HXdVET9ENq1g+ytrtw2EIMKka4hgxo44EKQjSO5YHoFLyUOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9jM5i3UF/DxZu/VMbEQWh6WgPaCzvO0NCPqd0f6VNk=;
 b=Af4t8OhA9W88bW5bRG3OiDrCaE9najlXrEHxdCjWmiRRffONfT1YaNgrehfvFcDZReubTpbvNl+lD/Uo1MjfEW+/SM0+Lx00cV+vc2ZyL5fliv83WAD3RmRLdtW+2p74amP9AH5POzPE1hoAqFs/dMYE+5Ae9IDqid8jMKy/9riVpbZEb13rb42WNGXxxLaoXW2670ay3zLL/UYI0bsHx2P9AQ/Qn+Q5UTmk7FtbvZNQT/auTyRXvE3zp6gwnJjr4ShOl2iRQelKjzXog0OxQ1y+FEQrgR6ByAn6n8A3/RdIIFWewjXRjHlx+C41JxN/itWTAmpgb5L9w0fU7n+Pxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA0PR11CA0113.namprd11.prod.outlook.com (2603:10b6:806:d1::28)
 by MW4PR12MB7467.namprd12.prod.outlook.com (2603:10b6:303:212::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 08:43:59 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:d1:cafe::75) by SA0PR11CA0113.outlook.office365.com
 (2603:10b6:806:d1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22 via Frontend
 Transport; Fri, 31 May 2024 08:43:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 31 May 2024 08:43:58 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 03:43:58 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 03:43:57 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 03:43:56 -0500
To: <buildroot@buildroot.org>
Date: Fri, 31 May 2024 09:43:46 +0100
Message-ID: <20240531084350.3703469-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531084350.3703469-1-neal.frager@amd.com>
References: <20240531084350.3703469-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|MW4PR12MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d211da0-d449-4ff7-43ab-08dc814dd043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|82310400017|36860700004|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dhGIbLTkzsazdEZcOfLRljwqXKvILXu1FMjao3ibNgOou6wyHgxmDzjH6EWW?=
 =?us-ascii?Q?RTjFQPPm7KN+eK+qwweXOGwW+xc38oa3IGlFRfFhWo4iy7aoLX1t5YGyWClW?=
 =?us-ascii?Q?i6C9OD3g/4rZkztb4oXj9ZtuHYsAzr5/3YcBIdWsH4LGdNnhNqvaD9nlk5dP?=
 =?us-ascii?Q?qc2pxCq62/4VjV/kVyAFzyJHCR9SvPMVYb3/FAnaC+W9a+Wi5iur/rEiH6El?=
 =?us-ascii?Q?Fx6WlZg3SFcw7+DWzYZsOjhlFTe/ER1iHPewoY6yQ4jVY9uMk6jfJdO+cXf6?=
 =?us-ascii?Q?7fM/aDTu8FBmhCihbYAEaiZB9PjAsliWV9++LH+HwDqrvWiz1Mhj/11xOfpk?=
 =?us-ascii?Q?RJoI29fzO/1Es08Ko3ubbKnXNMhBXduIXVRv88Snl/Cif+a7oqVZlK+67DkS?=
 =?us-ascii?Q?/R6PjSPb2JnYfpzGM5GVfdz4Tysxm6S0fjCPr7bI82ox1W4aZXMdWJZc7nDj?=
 =?us-ascii?Q?T6V6NnNtY3YilUhGr3WSJLgu240I2AZi1gTvsH3cBWc31+Hr6Jd71pNz9qay?=
 =?us-ascii?Q?3ja/6G9H30WpT8uSzCUEmdnnfppMdMO55AFfZmhk9zECkBsZmYWZhH5Bi67u?=
 =?us-ascii?Q?xmaOyifHCR2gHdq7ZmAMet1LGgzJTpN8HSq1pbt/KrXf3j6k15baTV4Y9uVy?=
 =?us-ascii?Q?lrrNv/hbrdaCwKh3s7zueyuphXkyh20w8HkMgwhZpuSE8gsBLyrGde5K40oj?=
 =?us-ascii?Q?nDqEUwufTQlShJfgBMGCHyr8XbwVT+U8cdTb/12O5sHgGQwAGWATGx98tgUv?=
 =?us-ascii?Q?gUZYTDrySOGA48HXZ2I9Mkto1o/4ngq+C/ePJE3gKhMH7kvmXbXL1YK67JQD?=
 =?us-ascii?Q?Vg5YjTWGEWcIUp7fvyraVFvrN/FUtp4Ez9Y1wjh8bYBBbkR6jToiUiOcgGDG?=
 =?us-ascii?Q?tILVupAtlvqYwX/zIVNUU0LLXJOfWjFKkAVzrb1EFI13NGBJu1ZPeUG6OFwp?=
 =?us-ascii?Q?R785J488eVQMriQlhgdRNNJj5N2Pr5NC7Glfy+zBw6WgNUI6UFNGDJtzuHfz?=
 =?us-ascii?Q?v7T34zfycGKVl+MHrd1NqJnfehQH7/C8EqO4dQOsUolHplQdfdAshSVVfD2T?=
 =?us-ascii?Q?bX45e1bRKcI7vtm3idcJ13ocSVrj6tBEeXrpC+jO14oMadfBr+Omsm1OEfHg?=
 =?us-ascii?Q?PidetyB+H7WY+YYHK1UmRn4CqQmeKsL8nKwi8tASVGLZqFW9AKO8AkkxJQPx?=
 =?us-ascii?Q?0dIAtrtcVp7Vx9nt3EVxxJsD4hIH5SD007qqPaY05mtX+nlRdN+lfA6yGr17?=
 =?us-ascii?Q?uz8Wfnw2ZRrpLai60gKgojmWKpip60FE/yyWtXYwLULd9DjNSy3w6HE/mWQM?=
 =?us-ascii?Q?wDQAZnefwWWeBHRlHWky1v3VZ3+ekWj6n/DUE3z2ajNDTIIe83TGa/HXrjiJ?=
 =?us-ascii?Q?IeGe6j3stGkPdMNrwxonw6NRNLncxzSofFoGXtp7lTFbBBrDkQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400017)(36860700004)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 08:43:58.5676 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d211da0-d449-4ff7-43ab-08dc814dd043
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7467
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9jM5i3UF/DxZu/VMbEQWh6WgPaCzvO0NCPqd0f6VNk=;
 b=2lY0hhKHFcdzVrxMwH+P7U4UKrlOWDlzyLgreeEfHB/GrxuHH0gbJkQEqg/IMh8wdc+VOg/hNrLH4MINx35cHbz+0f+qSCyO1RhINBhWTsBCoj8V64tldGKdYI70FgFlF0sOWVfX7Iyo7Fk7FfHMr/xogQi9hc32cWZiO/ULwPs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2lY0hhKH
Subject: [Buildroot] [PATCH v1 2/6] configs/zynq_zc702_defconfig: bump to
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

This patch bumps the zynq_zc702_defconfig to xilinx-v2024.1 which includes
the following updates:

- Linux v6.6.10
- U-Boot v2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zc702_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index 84c8843ced..5f7a12cb4d 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
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
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zc702"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
