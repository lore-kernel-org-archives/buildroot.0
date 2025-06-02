Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A9EC54FB3
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 13:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6974F40AD6;
	Mon,  2 Jun 2025 13:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0YEEiEEmLYK; Mon,  2 Jun 2025 13:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89D8940A41
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89D8940A41;
	Mon,  2 Jun 2025 13:51:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7D3A222
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 13:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C994C4042C
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 13:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-fDFxEeAyBh for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 13:51:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::60f;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D98A403FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D98A403FF
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::60f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D98A403FF
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 13:51:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzTDIm7Xn0OXPSmp2R6go9eBdefLB/otCLVL3St72njHkg6hOTEihERinud1Tyo1+CtgMN22saO1wUTY6tRoY34j2h36fkNMmvazi8RLgHLzsl25Wv8GXijaVmENE76Uh1mJ4vlJhOMgmrFRDkJds8ItA9mUYHhpTmFuN3Ef9fOOHUk3XVTOQztwY+6OrujmSJuPjKFsVS9i8DNowpH364fqvE2D6wVZnWmK6Z5wth5ucuyRMGE89GciqC6vdFEp+jDhEtESjLTSOoyHXnSG1XxbEHpa53zMDgcN87rd4DkOJWFCtv2jjt/W64+G4J9q7JhlNunB3aIhvg4PYSlBXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaDpiWQLnFz7n3ocq3zWXsnedH7L9XA7x97C+M18XcA=;
 b=r2YmpfnmAEjGTB0qv7FEatwjyPZPhqDcMf+YviPm/ve/1Au1OmWRxUgdX48nTbIvrCxCyBX7E/sFgBy1n5L6WnBF9Le0lxU/fA/mkKVGTuEokYzredGbfKfOhfHIy6BekBaGrh7kkCGucvXJzLL3uuXpzz7q/hG7Wgpm9c1bgqW3+6snU7Gn9aHsmLZY/tLINO8I6UBBWojXNjRdUviuAC2VtTyNeGnBMJrinzX2ctBgwvsuEiXWLihPkBNEF1i/++kvNuKt+U/XrI1gdvFnlZayBC59ViPhp6wLWH0uqitH1ZtlQj1hwiqa2oVsEn7J9fiEB1vVAGvvj4Zo6xmyDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0003.namprd03.prod.outlook.com (2603:10b6:a03:33a::8)
 by SJ5PPF0C60B25BF.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::98a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 2 Jun
 2025 13:51:21 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::b0) by SJ0PR03CA0003.outlook.office365.com
 (2603:10b6:a03:33a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 2 Jun 2025 13:51:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 13:51:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 08:51:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 08:51:09 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 2 Jun 2025 08:51:08 -0500
To: <buildroot@buildroot.org>
Date: Mon, 2 Jun 2025 14:50:56 +0100
Message-ID: <20250602135056.404165-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250602135056.404165-1-neal.frager@amd.com>
References: <20250602135056.404165-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|SJ5PPF0C60B25BF:EE_
X-MS-Office365-Filtering-Correlation-Id: cb2b047e-0e83-4e68-0190-08dda1dc8e8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cmC3taB0lNfZeGgzL0TUTnA3CYYi6uSVep00+C6+3KGnmzMv/fNpeu7Eg5Cg?=
 =?us-ascii?Q?GCiDKLyM0FMHhxdpVGjORL1jwYiguK0Oi8SjqrhpbhQCbnBVjQu56sFpsgKC?=
 =?us-ascii?Q?BWIap9s9hQvHcC0DsnzfjELM0U8Zh48g4LwbkWVtMhxPPSb751p/1tteFFXG?=
 =?us-ascii?Q?8ddIjkq45ezHbEJ6zF7Lx/p7jzGPIeyy1k3WxGHYXSO7pykTDits8orO/Ipm?=
 =?us-ascii?Q?XchM1ZqDP5nD7HsowXfZV2ZBJpJgELfv06u6YC6sRcD00NXGne5dQ+RcBLb9?=
 =?us-ascii?Q?GAR1eVq6x/JkdtHhneKtkdTUR6iNqrUMYe8LDwIxfmFrGKPTlu8pLJfmHtNB?=
 =?us-ascii?Q?0Fho0GmuyoXTiJ5PkqsmXFiCf1LXjW1y5yoJ/4bJQh9IIa0xySD8GGG9e2j5?=
 =?us-ascii?Q?WEqhSSI2sMzzuln3kvoOBSYklOZs6iKop1sRXwbgjWvhE+km+6HZLkoxqJyo?=
 =?us-ascii?Q?aqxc8BtoxoS/nT4UveCiUP8Zam8RZmwqPZYvazgypZq/kr8NONraTlP+lg/H?=
 =?us-ascii?Q?PJObG4eEPFOgT6xuOUyPpRbfLWsVo8Hh3gRnceZrZNvG67K7Q0scaDr4s1AK?=
 =?us-ascii?Q?LkaOpMptx2PcjhQEKgD6CQRy0F6XKLZnM1zHETIhdRg+vGtZUqLZ4rQmk4Lw?=
 =?us-ascii?Q?XG/yryNDbwremsJTPQs5bLNX3Xy5T1ZWPF1sy3AegDcKGZEq9Q5Ub/YWJ30A?=
 =?us-ascii?Q?+X2oBwjX6JcMfk3lbFjByzFH+768G8Nh2ls3oyedoRM/Lz97jjugJrRHpLKa?=
 =?us-ascii?Q?TWMkUEV1cspHGeSfW8EyWGv21gabxeDUDubDMreSiUURZ29bMSpGfSVZNlv4?=
 =?us-ascii?Q?EOc55O5/e5mE8VqGwokH58YQkETgDBXDFqAk2hWV2EM9p6qQN3ooZ4752AD3?=
 =?us-ascii?Q?E4jqmJ93OjS8BfRagr4vBqxVmzCoBv5E4nksj14ASJwjlrg4bcuqeqWC6R/z?=
 =?us-ascii?Q?fLmit+n7EBo/DEuobuIzL0n7gzA8maXIV/+sU2P/oHqFA4z+qMY9q7KmAHuG?=
 =?us-ascii?Q?sU9wwJQSPXMutkcyl3osjPWDt3aGj8vsbxxjGm+oElZaeu5E5mXkXDDKjoZy?=
 =?us-ascii?Q?UfbtMSZ4bt6d1N/Tj0SB+iyN6O31BqbFlAfMotL8z8oBrA5oPQgVmx3MWbO5?=
 =?us-ascii?Q?nXO1Kx9DG5ZE6bNlGwzsk90cCeu/FLtAJ2KvvH7MwELBFmdwKoAAQPBWcRVa?=
 =?us-ascii?Q?D0wIG6WMhQIY8gzgaLmGLb406fAyHjtFp3SwzVz3k1nfpvln7RJSxs6uxgT+?=
 =?us-ascii?Q?bqmD037beYvsBJv6r5sLo9M2WFDpwclk/Y9d0xzMzHgRHhdDgWcKi5uCZ87O?=
 =?us-ascii?Q?Gnq0rOrkt25pUCuB3maZe6BHPuVA4+aVYL1YNiFe8AzVYq3hzY7eNvw35YDn?=
 =?us-ascii?Q?dJ/C4U4fC7nAI8hC3qysBA7fXlt9y7IpWP7cEpHYITjq+SyEmFSHaRmWfvuu?=
 =?us-ascii?Q?uzFpvvBTHJTR3GsScBBc4p5M91xZ42mhQ/k96aHbnY1okBPKss9iIB0yV4/o?=
 =?us-ascii?Q?oKdx78CvliXLGWXDQ1DMRnfdP3VAaCCtzIrSO8nPVU7BW/tyUSstdSd7OhFm?=
 =?us-ascii?Q?xo3Kd8N8d9iLbAzaIMg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 13:51:21.1361 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2b047e-0e83-4e68-0190-08dda1dc8e8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0C60B25BF
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaDpiWQLnFz7n3ocq3zWXsnedH7L9XA7x97C+M18XcA=;
 b=TbadItcMkxDtCs7RGuyJHzeRIpn4+bE5pRVQjE0qSgdp2bxq8/OOuw0mm3mNb/60mvcTahuBGIVuPi55xSEv3QYUEg2FG9MoN1kX1cfVNtZklw3b2mySZk95OV58AkAURwzAL7h0VMCksAo50NmziKgEGR8MhvfypL/9i/7K5T8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=TbadItcM
Subject: [Buildroot] [PATCH v1 5/5] configs/zynq_zed_defconfig: bump to
 xilinx-v2025.1
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

This patch bumps the zynq_microzed_defconfig to xilinx-v2025.1 which includes
the following updates:

- Linux v6.12.10
- U-Boot v2025.01

The xilinx-v2025.1 Linux 6.12.10 release tag requires a patch to fix a
leak of the Kconfig CONFIG_XILINX_AIE, so this patch is now included.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zed_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index d0fbaf2ea5..ea15865535 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -2,14 +2,14 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.1)/xlnx_rebase_v6.12_LTS_2025.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -22,7 +22,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.2)/xlnx_rebase_v2024.01_2024.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.1)/xlnx_rebase_v2025.01_2025.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
