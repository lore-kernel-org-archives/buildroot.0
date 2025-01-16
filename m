Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E008C02187
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 15:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7F8460B5A;
	Thu, 16 Jan 2025 15:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yaorg_PkS2v; Thu, 16 Jan 2025 15:01:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2E726FA74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2E726FA74;
	Thu, 16 Jan 2025 15:01:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A5902BA6
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 15:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4802040187
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 15:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJFtjxDG-PgX for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 15:01:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::613;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4774140BE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4774140BE2
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::613])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4774140BE2
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 15:01:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2s5xWEz561D18P1xGKcwzVDJh7MMVwpABfPcPyn5Y+/JzpI/TmwjeKlODbhq42jNJcY5ACjiqz44z/qbSYfxsoc2Y2RbK4y4ImTNu+MJHuH/SKY2T3HYNvK60JeCOcThP00FTdzJ5KHJIFuToRUzWwe4uCeB5EemSUqWf9JatK313sATNs01k/oA2aiKKnJsmoE/vKq5XOM/ASoPkVH1qBzdDVkFB87ZgUBCwG/287gENWxPohA9mQVI1OszYAdbVOzQClqKG4xDHbPkhj1qfhWBhicFavjezNe1lwApFfXtrvW1OQdF410dJqAo7DAVAdftZ+gM/K7m3l3codlLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcAj5u0uWqUek+pivwQWFrHDOQZW3aSL02tA1eCRkxI=;
 b=MiswVVjq40X0ca0b2q43kWil8iOG1FJFmglvxpm4i32uwJxHjJZDyN/zwXDgQik8LzjBrXAijabMg024muoMMlI9O1XumOtOtKCR1EL16IL3jtn0Ctug+S4yVkTlNdivS3RdQRyMcKMHg2asS23nfmd4Ds2726+40Zz/makCRcRjSy7xU6FiR+l147/vPpWJW8CxmbkCqQ7tRr06C396vBO0x+AT0JHQFFcokmv1H2RL9Bg2NkTp4nO4ZbX+C0LZFhItjcf0FMYOpEGa3NzTKyq32PpZhxVeGFPeY/xjUNdXSnxehLJ+3CpXIWfIcGJTo9Yr6tZ/kHYuHP9LJpNv/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0915.namprd03.prod.outlook.com (2603:10b6:408:107::20)
 by LV8PR12MB9156.namprd12.prod.outlook.com (2603:10b6:408:181::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 15:01:49 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:408:107:cafe::81) by BN9PR03CA0915.outlook.office365.com
 (2603:10b6:408:107::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Thu,
 16 Jan 2025 15:01:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.0 via Frontend Transport; Thu, 16 Jan 2025 15:01:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 16 Jan
 2025 09:01:42 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 16 Jan
 2025 09:01:42 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 16 Jan 2025 09:01:40 -0600
To: <buildroot@buildroot.org>
Date: Thu, 16 Jan 2025 15:01:33 +0000
Message-ID: <20250116150133.3828534-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250116150133.3828534-1-neal.frager@amd.com>
References: <20250116150133.3828534-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|LV8PR12MB9156:EE_
X-MS-Office365-Filtering-Correlation-Id: 746a44ac-4f00-41c3-1b72-08dd363eb402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YuKoJWExfEOsJKfNotE+vzyemVstOFfK0uc9cCymlHB5+nz7TfiqbzVZQfQE?=
 =?us-ascii?Q?Vm5Yk5z7PJzSnXFEF+ZTwqkdF575chm0zGIAPbwfFXtF4rqZZi6FjIv8u9/T?=
 =?us-ascii?Q?WghV0os//+es0bKmUNJrSTYyRp+ast7kCuSz9z7qRo/pT4jpAUD5ru0YXguS?=
 =?us-ascii?Q?Bpw4o8ZYhJK7Hs5JrPEmN6Y6m0y56//WLCnXyc8SCCLb6ZmSemNV7PAac2qk?=
 =?us-ascii?Q?quHtCTk2KVsFLQJDqs0thYGJYVCq4Qh+6KxLeMBCbHjnuOiRoCR22zGW0pwc?=
 =?us-ascii?Q?x1YCevW+2Yz3MJma5bwFNRXe3jI5eHMfZO6wyFIp9k0MRqT0fldpH5dS2jCD?=
 =?us-ascii?Q?i57aQSAMsLOGuBXjyhlPMefI5kajMO/vuJkkpT4Sb7YxGkCWCbrVi14evffq?=
 =?us-ascii?Q?yuixpFjyqE/5fy0Hb3xAhyO6AJOa4X0klHjbCzjHRK2tVQ0pXuzjjKAwRFn1?=
 =?us-ascii?Q?kep84MwUFR6iJ2IZ1kg7bH8igUTHvDcKOuq8xhgsKs4BPhvThNArzM2yLYM4?=
 =?us-ascii?Q?BJPrcJpaqhHn74NnQCrIFT0/lkdwjnQ/uA5NVyKmxS69udIF/h53Z0PTnCQ5?=
 =?us-ascii?Q?n3iHlpXo8sF2/q2fn0cTN4H3fh0HftQQASXhzOwcR6mrmMzkuTWsvwgHkU8P?=
 =?us-ascii?Q?n/VZWG+ivIoaHi07IGOymNJPLBkc9ndnMDFIJ47FTSSrxHK9brXWbPCZljS4?=
 =?us-ascii?Q?SkDiiqwumJn/Y6qdLVmaJCtjxbVPng79oWarEOGyMLXC8kD83OTMEAG1xRk4?=
 =?us-ascii?Q?BXb2kT2TTGFJo198I0tI0HY8jCaPtfPnpUcFXs5XDoRPxuGT5sdKnVxXs/vL?=
 =?us-ascii?Q?y8RO1+eQ0BChKt9DMx9M6+Hnc0rYSW0qWESD1gBemiz4OtZLVlcIzP45c7E2?=
 =?us-ascii?Q?L5vJZ82a6lkTKWKQhKlpq7J8IlnEWncaRi7lg5KSR4bcqASuA09bQ6ctXqvo?=
 =?us-ascii?Q?pM9HBsc/eBsD20yBJZNqo0leb6qe4FWLIc5FikxJ4E4VRpMj+EB0ZZZT/m8o?=
 =?us-ascii?Q?BKOyd4CIqWlYkANU5WCO/rBh9CJwaJmJx3bZ+/sSUF7i1On5dUiw8ftaWAsM?=
 =?us-ascii?Q?xRkbVwZMV6LrAwPibnWBaFDNFqx/xoJJxVXQZ0WKAYq4E7MG466f4qpjlPSl?=
 =?us-ascii?Q?xFERw/Lk8u1BS7rJrzCuSgsuU3kq/mtEsoytjJPSLixO3lnN8KSKsnru/INX?=
 =?us-ascii?Q?72A6YclKukpmNlXD3+pVCZwpSZQ5N91Kh/Oi7I07lwTNK4igwKVK7BLNlKlv?=
 =?us-ascii?Q?U753oYuGYIzzQ693V8EhnBW84hBVlWONo79OjOhuo1euRcaWmGdqrZ1cvlG5?=
 =?us-ascii?Q?v/4fk1zQdehwC6ELQRTlOCbUz5acEQQJYQ1CsB3bGnxjJfD5MLIJD/BJxHLs?=
 =?us-ascii?Q?kniux8Ymk29xx56IkjXXZ0AKjdEf4dkUp5ZQlsBKijq0trazECdG6YKRTDhO?=
 =?us-ascii?Q?W8V0OYvbu0PNGHrtxmGgip8hMGCjvst5YwUjJElgNCJ245hpqHPd+KUyfX+9?=
 =?us-ascii?Q?51syBti7rpMNE1h3g4dewiIvWFFH2DflxoMg?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 15:01:49.1293 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 746a44ac-4f00-41c3-1b72-08dd363eb402
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9156
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcAj5u0uWqUek+pivwQWFrHDOQZW3aSL02tA1eCRkxI=;
 b=rtJS0KPNOOeNeEjwjxJ3s9liIPI1zdnhPY/4TJeAl++YjzL/FGxKS4nubp0VAYvSdETgKBOXpjf4t99qxZXyTBijhOEvOa8IJ0ibw7NipccmYrLXiwZbh0bxhu1zV8k4IMGFjjHNK0SMHyYNu7ga6lA5cqTrQ1PINRYFL9VGeC8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rtJS0KPN
Subject: [Buildroot] [PATCH v1 3/3] configs/zynqmp_kria_kv260_defconfig:
 bump to Linux 6.6.60
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
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynqmp_kria_kv260_defconfig to Linux kernel 6.6.60.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kv260_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 92d44c2b64..711f43c3a6 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.2)/xlnx_rebase_v6.6_LTS_2024.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
