Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135E7C27C44
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 08:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9CEF41DDC;
	Fri, 31 May 2024 08:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gcmk0yLtFDxE; Fri, 31 May 2024 08:44:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B36140346
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B36140346;
	Fri, 31 May 2024 08:44:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 862AA1D4F97
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 08:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 733FA40436
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 08:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_Ok1tFF95XA for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 08:44:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::600;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A93D1400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A93D1400DA
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A93D1400DA
 for <buildroot@buildroot.org>; Fri, 31 May 2024 08:44:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLaLNw4uM3SODr4rxQ7igJYFOYwom6IRINeqApc52+S/KWWP/iQmWxxLl8ZTnIi7AVbEFt8ZHCWaUXJpMocWNIB3nd4SPu5/UCXI+TLheEvIId1n45Naz7LhAoNgLp3spy20fu1waV7YtWJsVn+MBaxPhUSsbA8myZUwiJx4+wbqkreTSjf3BKrbalu5eiJMBOF2S0ZGr7seDFOGYy2/m8KXYXRYZw3eLWTvbICr4558VgTyqSEmZdxEvE04tEANO58ii0d4IvWf1YimDsz1CP0nvVPojefxYgD4GgnWlGDLVRdcxMLTiMyb2UQFPizGEWNgOyuynuyi4TA6LhmLrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRV9PXu+uVeCErFpDy5aqBWpuEOEmOL/op/1SEAnY1w=;
 b=er9Uj43ObSw+UfpE9Y2FSF3D/h6exLHr9uHqVcA+jqBz4ow/E8kjCptHYKWIUJaDF2nZfMVcHGF6ZdVRdwoFzoUx/u+Is43BVFcTgM1+wAHnqj+6rhIB4pGXOgzpZXDSfuO4aFJi4x6fA64sO3WEn8icz+6gXxrxm7RtC9GxwNsb/elh7k75nVBF8eSW9JB3fLK+veDUpCOZnfNdfuVG4DeA57XlKrrAUjZHXd4AthF3NZlWkOCLbkENOjMdxBwfBhJeme/bdkWkCjZAoHJ9bwZ93/IxSMd0uPvU8uDnLI50MIUZb91CfxGpHMAoz5oU7QaoyDbdxMwt38ki3gbhAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR05CA0009.namprd05.prod.outlook.com (2603:10b6:a03:c0::22)
 by MN0PR12MB5715.namprd12.prod.outlook.com (2603:10b6:208:372::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 31 May
 2024 08:44:05 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::5) by BYAPR05CA0009.outlook.office365.com
 (2603:10b6:a03:c0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.9 via Frontend
 Transport; Fri, 31 May 2024 08:44:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 31 May 2024 08:44:04 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 03:44:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 03:44:02 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 03:44:01 -0500
To: <buildroot@buildroot.org>
Date: Fri, 31 May 2024 09:43:48 +0100
Message-ID: <20240531084350.3703469-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531084350.3703469-1-neal.frager@amd.com>
References: <20240531084350.3703469-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|MN0PR12MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: 4041dfb2-e3de-412f-457c-08dc814dd3f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|36860700004|82310400017|1800799015|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q/ZdEzWeDCJfnmkCQqSND50g+QAY60WFpg5EDRCiTYzTOh6UK/pKueQ5bvAd?=
 =?us-ascii?Q?NZR75jNFRrU0K5FxFr3B4ncNJyb2Mwy5jEfFTR50k1VM1wzUe9wJizql34cs?=
 =?us-ascii?Q?iLlfUo7+NItfIvCnqXrww/yi3VKqdYEproyiNCbihguITWLv4ezB8az8A7hZ?=
 =?us-ascii?Q?9d0bHEJQ3y3BLQIMH4wsc/mZ3YC13VLxNwU70bk+JrD6DKogqbAWoflxK1o3?=
 =?us-ascii?Q?svYHgD9lsLv2qRHj9R8F4L0gI1/RNqMoqsnT39FS9LcytqpW93DXZKp9FdwM?=
 =?us-ascii?Q?zmT/IwelLC0R/6Zheukorb5ENC5E1PyTkxUlzB9UEFHbVKEwPassK+HqrY8k?=
 =?us-ascii?Q?OL8Eca8DL4W4zedWLKYGD0TUFRWwFY2rtME/Tmz6xNudq5MSvPSEHkmaYYY/?=
 =?us-ascii?Q?bLHP93f+NnzTcrzIurviqBu06qPG44H1toH9553D0EdbMBUwu3cvXW8BsZSL?=
 =?us-ascii?Q?VvipSCkeGRCFUsTkHKbHSg5CkcdHjKouJW2n4WaAHs7SbquXKldCMJ27lJMs?=
 =?us-ascii?Q?15gcJ3DtACJwFPBTq9RMzI4lIqf9/sBiJs8+rBnJA8/651TFjGz9V2b59K/Q?=
 =?us-ascii?Q?DII3flz5TwZ7hrn5k/qXDsgkRixKGLOUJrwagRL2uOoTvPXkU8CGYGqDHnQH?=
 =?us-ascii?Q?4bHNqOFnA2GxTbTvbTLNyot32ZEBWcBj2AnK7w2ZcbZpeYUOe3zH1B3/m8J9?=
 =?us-ascii?Q?HOBIudu7ALt+2/iAxxt4K5+k3esB6gZ/zsS4J1xEp1TJRFu2Td52No8Jw0df?=
 =?us-ascii?Q?weYOQp2aHFMheiX5RcL3dmVAakIp7fcSUwr6FA67vSSaDUa8wqdMKYBUKIyD?=
 =?us-ascii?Q?dh52Lifl18xY1/q2lRZ/Zptwaf95ze9d/AlYpQksMyNW4hmfw9K6W6S5tG+L?=
 =?us-ascii?Q?GypSddOO+gHWCI6PQzymVqO+Fk9qZo8LWdCFPNdW0t2fx2zWGRwzRXwJ5HBP?=
 =?us-ascii?Q?CudC4vucl829P7ykYNmHkg/IGWx8mWtv501H0ALh0Opks116U5yCVS77PI2d?=
 =?us-ascii?Q?vDVTQ3Z065DgWcDjCGHypRwlTS8QPlSlCDp0Qa1PnuOw6Pm/0vGuXrY+NiYL?=
 =?us-ascii?Q?CsUaf+5K+kxJd31/gFt4dsbVlc5BjZpXhJT2oD9oHxVNBRGC5TwqdJx7eyJg?=
 =?us-ascii?Q?V/bp7oJSR0OIrbIksT0Q3G6vOAcBaXlgGyy76v3tdN+IjITnnSb1j1BrkXHM?=
 =?us-ascii?Q?W0odK1EO9gJzXidrnzPX1NANHQ5RW6bMLJMWh5ohL/oK68oE9OjtWNJCxR0x?=
 =?us-ascii?Q?6dMNLD9gjOdjwAFP/Ffr5d1IHlbjGC00+NHx/Vrr+X8hOKewvqJwcnLxYtei?=
 =?us-ascii?Q?bdxJSV2Bah9s00JInhiLhZKbrYem8ywVgv59DWgftL5YTxu63C7f3AUMkycT?=
 =?us-ascii?Q?xn82yzz1EZey8cUplxnPms+1Cfz9e03pPfv86JwPSu8/oLUA5Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400017)(1800799015)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 08:44:04.7180 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4041dfb2-e3de-412f-457c-08dc814dd3f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5715
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRV9PXu+uVeCErFpDy5aqBWpuEOEmOL/op/1SEAnY1w=;
 b=ZaLJXVk/GlUMUjfbWiNY/UT7CRakaIcy00IStg0EoPEe+yprvimeQKKqJyISq5Oe4CUh609VZq5vqcrnb8+yTM2b7DMdfvUgZ+wP+YwxKgE9A+aaMfI78M1pYTJ9RrboxCowbZyrKazIxzEqlh9fcp4JiXC3LEdXSJsofS6QhKk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ZaLJXVk/
Subject: [Buildroot] [PATCH v1 4/6] configs/zynq_zed_defconfig: bump to
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
 configs/zynq_zed_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 33e7aa02e0..23428846dd 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
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
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
