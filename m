Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0BBD6EBF1
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 09:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA45F811B2;
	Fri, 29 Nov 2024 09:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5i9ZK5IPHCC; Fri, 29 Nov 2024 09:53:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDF3D811C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDF3D811C7;
	Fri, 29 Nov 2024 09:53:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 75C81A6A
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 09:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 709DA811C7
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 09:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RypT5PonWobX for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 09:53:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2409::62f;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 733E6811B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 733E6811B2
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 733E6811B2
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 09:53:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BzWUvciHeBG9GcQ8YFsAILVXW2AEFvAaDRQuWtUsid3vyescqPim9DpZ1JgGD0bIu+EfUS2kECA5hvQBiPsB0oK1K8q/wo8qHM2QZ6ruAaQCz7dUDqNllr5wsldtOFmj1+79CLeJrgfhe1NIbySrml9GqozhvSqki31Tfcn2r+cUf5aiCaOTGo9e2AJ4Jns5Cg0UuAyjRgXNIqdS2ApVl0I11BNJfr7luGqYrm0yvAFL6H0lJA8eKY865NfjZ4hDzRSCWkmcmhSWlJ3BgtcpJxwYzkH8hnlsLLfRMT0G99+rMBcmz3JUo3ITUuv0yF2rnMBTpeliu33iDHE4EF60Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5OAHdzFX985mCNpeJi/bojX/O8tGHMgke597w4TTbw=;
 b=CQloNKnzrSP7gBNb+PMI2JSr3r/zcaCvX69ZobFcwIHKIkpdP5JwZZoQx3FXnIoB0tYwmyLpJvKXTHxv15kRVJRWbRjGy5ze0B1jLodKxIpXVaZ33hgsXFNNL8IZC+P9MZ4IUyGEZvjaqo/V+5hBYQfeZuvX/VnOBJ9Y3BJ04Ocs5PPgwtGXzBiCGq+FmesCy/Dbig0/XxlVHDXAX9VzHzkOlymu9xAJzWv7WBZ+mcYxugi/vYylE0weGsvuhqoUm4JNKtrwnI1e6XwWrrVLhAD2pYsIW8BjFjwca0cwAQLiqgtsMatJ3Bp/PWQPucngTTXtpxMS9+aaNss4mFekqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR07CA0046.namprd07.prod.outlook.com (2603:10b6:610:5b::20)
 by BY5PR12MB4082.namprd12.prod.outlook.com (2603:10b6:a03:212::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Fri, 29 Nov
 2024 09:53:17 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:5b:cafe::ea) by CH2PR07CA0046.outlook.office365.com
 (2603:10b6:610:5b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.13 via Frontend Transport; Fri,
 29 Nov 2024 09:53:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.0 via Frontend Transport; Fri, 29 Nov 2024 09:53:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Nov
 2024 03:53:16 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 29 Nov 2024 03:53:15 -0600
To: <buildroot@buildroot.org>
Date: Fri, 29 Nov 2024 09:53:02 +0000
Message-ID: <20241129095304.950313-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241129095304.950313-1-neal.frager@amd.com>
References: <20241129095304.950313-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|BY5PR12MB4082:EE_
X-MS-Office365-Filtering-Correlation-Id: 806abe0c-c475-44bc-024f-08dd105ba653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WrTuREKIQ0TCSFNM8XbkHolGJ0XWX4T+M15HOK7kJu/hM6AAVoyqNwk0Zb+/?=
 =?us-ascii?Q?svrKhIz0vPbUuiNEIHSuofrgb/1nyq8EKXzWyuGo81TmqNJJGb5AlgltHxaX?=
 =?us-ascii?Q?7uuINOIFlRwoz3NuZNBewDc9QxArfpJwd4rJiuKhnUzQPlYWc6NkW5j+MLM2?=
 =?us-ascii?Q?b3ZrtEQZB7hGET8qq3Z6PcWGUbgsv+p/IhIZAlSXHlzVnyPX9e0nWavZX6hW?=
 =?us-ascii?Q?cONyd8hitE5T41t24pJdP9h7oPABTRK1XE6eSpC2AXBUYexqoj8mPKPURaAB?=
 =?us-ascii?Q?L8A7LmqcNy4aWrQGMkRuotc7uapo9YcuX1LDUMYKWAa9CZ2tbmWIrALOvth/?=
 =?us-ascii?Q?33HYGc5HlFYgiNZwQVNZggvgrJAE9AG0MRR9XXtjXUCSSHAvPWTvTbHnFQpb?=
 =?us-ascii?Q?zkwkUm3o9Qzk3jxXfPrxSbugEuHiFHWw4fG8A63wP9sX25wOl3O7XeQAvIyE?=
 =?us-ascii?Q?EOiTkDqyYBFcZAUtVAz8uYKU9ftQsdmDyRivCbAcxtOcNRRP8ITbvf5wjxVK?=
 =?us-ascii?Q?rBjHNBE4y1Hs2x/TpBzfySd/6R8Ahc2LRZwbDVg9cAoH3Iq8oOv0Ov7Du22d?=
 =?us-ascii?Q?um2TPkiQ8eNNGMpDIM++L2AfWqOQjwP7mZBKt/la7etdCHCGzsbC5yywjGxQ?=
 =?us-ascii?Q?/akjD9Gv98WPnpOkPTtSezjCYvfgw3WrGV3Sw5TK1P1HlQ48X2vBGBxaPAoz?=
 =?us-ascii?Q?5kJIbDCASpjyoiDHo2dsyf6rCg20lz3DwGBKaoFBXOxJk2rI4yBbZ0GXqbjZ?=
 =?us-ascii?Q?upjaICqvMjxUCCuZheOEXwTIpkkG535dL1UnhOYCG9/Jld4fWrZ8VKb/dT/s?=
 =?us-ascii?Q?Bcxb3AjEjPOsRvycDfSVXATuuhmzpGmORJSgzRwOSNSx6IKZqaAsAwkxbtg+?=
 =?us-ascii?Q?w4FKYVseZq6BgpGSCDqB3/kUDGi/3KLNw1aA4MAIdULE0wLLYfh+KW345Ay/?=
 =?us-ascii?Q?tBqsuTKY8wwtbkM+FphEaM884JrkWw6xvq6z+xfpVoWUkOmOo7YwfZKs0xKK?=
 =?us-ascii?Q?B/UzCtOp2BWv+3tOfIUFtBUNeW5BMiq1N6ewXout05u9ZDSBrbMDS2oLNMBB?=
 =?us-ascii?Q?Sz7cbqfj0kMckprcQEJuXg1aPkvqOm2YDCtt6/o6mPpY5OA08bOkN/pqijb+?=
 =?us-ascii?Q?e+fg5E+O06VseFmvU2d146i7lipwJahGXvl75qPYCWjGKdPX4WIzO8K8+Y5p?=
 =?us-ascii?Q?6O24r4sgo/8rqhR2oRy8y1XnItjckfddEydLBJEN2o47Am33AMMwQQF987ew?=
 =?us-ascii?Q?BMu56/4WsDyGgqvnhxdaRog+l58DglboyDze/PXOXWdkqNLicCXEZEfdda6P?=
 =?us-ascii?Q?qCwGYa9HE00YKbGYe98uk+xQm0Nta3f6yXfDTZ/0rYR6RZG8CFfnxeHO+qZX?=
 =?us-ascii?Q?mLEbDcb6HjdVNJSnSLiHLCnDN65JF4tbQlfPpVOC8NZ67CT1+xaNsJ9aJkvi?=
 =?us-ascii?Q?vD+t//sRifUQwRyyT0kwWlJ5rNJ9PF/JhJ5Nb5ptYrzx+ZDcCnLFiA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 09:53:17.4067 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 806abe0c-c475-44bc-024f-08dd105ba653
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4082
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5OAHdzFX985mCNpeJi/bojX/O8tGHMgke597w4TTbw=;
 b=MIlWG0+hLDvK2DyhNvknEIxr0hor/pIkpSXoXWuogXq6WNMRBu4/l1bk66loHsYolyCMZ6qj8uX9HMPMnQ+Yxx+rLkdV1luI+LVQi42MwLibNJleYdhfBKFoa00coAIXtLf9dF72XsBwuSVMr8elhRPEAxTcJEnj/MMl01WEhY4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MIlWG0+h
Subject: [Buildroot] [PATCH v1 2/4] configs/zynqmp_kria_kr260_defconfig:
 bump to xilinx-v2024.2
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

This patch bumps the zynqmp_kria_kr260_defconfig to xilinx-v2024.2 which
includes the following updates:

- ATF v2.10
- Linux v6.6.40
- U-Boot v2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kr260_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index d5a292b143..6f2e88b47e 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
@@ -17,14 +17,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.2)/xlnx_rebase_v2.10_2024.2.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_kria"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
