Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE9DC19F2E
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 15:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FF038361C;
	Wed, 26 Feb 2025 15:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MlvU70GlcmNH; Wed, 26 Feb 2025 15:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7556483668
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7556483668;
	Wed, 26 Feb 2025 15:13:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6C8A68
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D27914129B
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCmmBKaebx2b for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 15:13:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::62d;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9386541294
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9386541294
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9386541294
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hpm/BLjEEVS8R+2K4BQPrnPKiF1QL/lvqtxexpK+HUtMWX7Y3VHqel5gtayHC6uA/kWDrhLkimcwXq+4ASlSNooKcinWog4pZGbXyogEbUOMxXNsvcvj01AkmkOmvESDEXSZmZ3drIhi32/6Fw5NJLdva7KmIJ/rLJGX2sy+uViWdisbF8pzxFy+yBX87qzpEcNAJdG2WFXLOYiH3ON03ayiZ3nnheRuN44OduVG0xMFN/gYHhSUVu/KIfU2iRHx2bLrCuZU7QT8mZ0owse3QRlpqSNAJpp4jTX2M7HsztOv/lvTypW9ZUK0+JrvvrwsHgitLCu+aXaL2DfYW+wt3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rtkx52IbjdkuyUu9I73ogS0kFFyg8RDIvHrj/rC0bKk=;
 b=Pfbx0WlnQzSbFJF5C9DeR57XkhZT8FgiJyuXcEn2u/dZVO5jA9jup+2W0a51tcV+PR0NuEq9QjRF/WrMszss3vKp71PqsMwN2cx6PptYFCe9l6HVKLluquH3M+qzjcioech/Yhl/HxIAxjWKKk4+fsUA+JTMOK93qwfiEEovYB27yZnZMXC4vkQW6i7yTlTL3yIJyAsV13Rc/DErPaCmKTnNFis5Q7l/dnHX2Vz+5OILMZ7vmS2Wl1AO5WnMsEeuMRzydvlij6zlh2AchKMKsj9+FYPtNbR2uqol11bHLN5VPXBPCBNWLHzkzkujUiUi0ffKyYbXVeJZ5PfysbZJEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY3PR05CA0038.namprd05.prod.outlook.com (2603:10b6:a03:39b::13)
 by PH7PR12MB6693.namprd12.prod.outlook.com (2603:10b6:510:1b0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 15:13:08 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::75) by BY3PR05CA0038.outlook.office365.com
 (2603:10b6:a03:39b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16 via Frontend Transport; Wed,
 26 Feb 2025 15:13:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 15:13:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 09:13:05 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 09:13:03 -0600
To: <buildroot@buildroot.org>
Date: Wed, 26 Feb 2025 15:12:56 +0000
Message-ID: <20250226151257.2536298-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226151257.2536298-1-neal.frager@amd.com>
References: <20250226151257.2536298-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|PH7PR12MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d534db3-1313-4c55-1ed9-08dd5678137c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vapKGvnQ1QPXdDuj5IAjqSmEZtuVPIkS2BAa0nensmEmjDU/6SCSE1m+Ahj8?=
 =?us-ascii?Q?9N0cpsK7gqUdM9H1wSLwUdaomjVJ/wpSj/2ZXmkPrufmCpgsQOIetgXePvYD?=
 =?us-ascii?Q?xDp7/GjZ9Ntcy+ZU593aTeOGsx66RzoEkmnfoFDeVoVetghIzC8bByio/JHm?=
 =?us-ascii?Q?v53qqD4bYL6Bmhn3S1XtNSYSvvlsy6TtuhW1/MB8NpdYUIG8TDWXKzWV2cC4?=
 =?us-ascii?Q?ArxZpaZXMkXYAK5geB2hHBbB3OR8Jd0PnYp7yh7yp422Nc7aw1JUzw+Kirv2?=
 =?us-ascii?Q?wrY1x0fdye2awM6f6cZYWdw6lqKh2ATTBzbveEMJ+BXbq/9SuCpfyul94O4S?=
 =?us-ascii?Q?wviqdJxsJWFUZWM3UFTVn6eCEwR6qrouJGSX2rkUylJ8lWUQqhf6Qo9WDdo1?=
 =?us-ascii?Q?pYiSM+va+Yb7/gLVslYvBLcbyh2FND51zbB8rw8E4QnT0LuMZBhvxMv+Rons?=
 =?us-ascii?Q?kT6pDntzo0JUIYExO9gP6xP2ZGFkOMpAvXe4fxOvsQ6BbHprwcR3SM7APZsb?=
 =?us-ascii?Q?jfDu8GngHTSmOXYDGphXKVRxDD9iSoftoSJ4tq4uVI4wVHjOxCVLsBUh0tEX?=
 =?us-ascii?Q?txFTkv4uU/doqLlaSy05sjolvkKTKgCOczO6NsDgTRaKGFBMoh8EWMKePSEU?=
 =?us-ascii?Q?l9UxoZ4hZoGm7BaNiu91uxIGj9YYJCfg6ia6Whp/xXBpjzrlBgdYUUXDWuvL?=
 =?us-ascii?Q?F/u3SPxTy7kFwShnU0iejgdj/nOPS9IoaXL9XMTjvgE3yR9L5jllg34Kv/wN?=
 =?us-ascii?Q?FLIM60WXR+5xO21W5R870Sx+6A1YlbwORCuVkQNcZDYumc6/H1dCVGhaleRF?=
 =?us-ascii?Q?yAtCMveDByfBdyW67In8AkNbXYXnOpL2MRBrJ7kvzbxFBdWOf8yfrIhPTZFe?=
 =?us-ascii?Q?PKmu8a0wDatr8xn9ieLVovDvyZ6EtXtaYMj+2GqLK1msLaM9i3tSVsbxnO04?=
 =?us-ascii?Q?BmeiBeKGFV0oysMUTHizfZgqdz4bSShH0dCnVDc4FRcq5+NE6bUX/O0bLNMJ?=
 =?us-ascii?Q?+CYdMPv0ycw0OPLPl7QUD3wdNhfpYaRnZs0ZnEGLTYihfAMQ7EFS687jlSA+?=
 =?us-ascii?Q?9DeN8tl+x16vQZ/BYEn9GhEbqWc5NorfJcdI5pQnEN5hAvk7WCp/ABsuUfOe?=
 =?us-ascii?Q?vrST+qeGPH1H4nB8wlJVGhNazp6oZdOqCl8Wl8PqEyhgzcJEDYpLBXXJdGcx?=
 =?us-ascii?Q?DZHCgySmRDWR0GQXBJ7ReHi2/ngtsUOTj2NhmOHfCv6noB7BdLR4oPFi7O1o?=
 =?us-ascii?Q?mG3wmC5M1Wm9Q1Z3LqsU7cnvPaWxjlLZuiSqphWenq6u/HAKHNDSqDuP9JKl?=
 =?us-ascii?Q?zbhyJlWVWMZVRF2baVVhYgA46kDMYZEKlwOrdiP/FVtcUVy9OGec/dM/NQCj?=
 =?us-ascii?Q?V+kqqfBCbdp+CRrkYHY+TXjxL0GtIMSSWW9L4XrGNPW9Ip3XeqRKtiYaGlyI?=
 =?us-ascii?Q?1g1PT2OBXQuVjiioM4C7z+69ufWofakSGm460OejD879lbet5hWyA8iOoPCg?=
 =?us-ascii?Q?AQa1MdDB3zDD2X4LpA1XwJYlyjSxJiTbCSMQ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:13:07.7881 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d534db3-1313-4c55-1ed9-08dd5678137c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6693
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rtkx52IbjdkuyUu9I73ogS0kFFyg8RDIvHrj/rC0bKk=;
 b=rcnxrEztP23/Nvx3ysTbmtoR4mTqMuK7+bCcLhWBarNAFzRO2Mw65KxYe+hNMwtUcS+/EAFCHQUPxweaVgDBZA1lJo7FdC8IcPJYGsUImaXxc5jnCnlkMsrK66aiZdQjnLLa373S3q6tFX3dZ/6GHGIcaiaFkz4+sG9Jx6VyR/8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rcnxrEzt
Subject: [Buildroot] [PATCH v1 2/3] configs/zynqmp_zcu104_defconfig: bump to
 Linux 6.6.70
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

This patch bumps the zynqmp_zcu104_defconfig to Linux kernel 6.6.70.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu104_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 13ee5ff5dc..92e0d41736 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu104-revC"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
