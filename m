Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1759E77198
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 15:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F77860704;
	Tue,  7 Jan 2025 15:15:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DuJceKBcBXYP; Tue,  7 Jan 2025 15:15:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A99A60740
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A99A60740;
	Tue,  7 Jan 2025 15:15:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BB676B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 15:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29D45606F5
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 15:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f61mHoXbNrbi for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 15:15:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::62c;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1FE7260740
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FE7260740
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FE7260740
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 15:15:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDVDuV1dRT0fCNn7pKKmdQomX0q1O2yPuTFRtm2z1CeqSr0TyQn6Dpg/mQjRaMdMWY5a/2hovrs4GT9PZOR3PkBaa39yZ2qvMqM2p3DlJm/NRm8LaAksCs6CjYYil+UN80LVbW5aJEqlTG66qUecRZ9h52w/g63ydvM0pN+PS3MTiYEfQ66eb+vjvTdcF0eKRfyKFrcXp/p4Dsf8sF9S6ZWFE0ugcAYUI7hoVRP3nokZfuT3bDB3D+G3mQTYFV2sevFQWa7pQP7IFShTHt1g55wzstiPqs0LmqA6gYjO2257d+b3GotNk2/Crtv3PPUoMkw75uw99xEcPS4vbUEdXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKyoLU5yiXGJKIveVvRcAt/91v2QAAUTubBsRxklrsI=;
 b=KXw5QeMXpWX3+Y394jYpz3o76cad0FI3m9FmNweSHo1oyibLJVPtePoKYs3c/wUv/JVJgnnzw5f2QRihReIcO/WPFQmnpPK2aZA1gdU/bFV2LC3T7vOioZpYAYyRySVxVC3vnxeqcMfglulHYMAeKlhXQ/lRzO/WCC+5VOsqTnwYt31EI9uWlchULFW+/KD5mm+JH2cOy0IANTlEW+f+jzwjio5f3wHkAI6NNbZpFd3fDHDG7mPLv6+rcm6TwpfBqDDBYwRcYTM4zHzeTTuqHhS7pfTM4ebGoEm4ey0RoB5Kfotv+cm+yz/k8Hw03LJZiqAooKQz7H733PzROh5aWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR11CA0071.namprd11.prod.outlook.com (2603:10b6:a03:80::48)
 by SA3PR12MB9180.namprd12.prod.outlook.com (2603:10b6:806:39b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Tue, 7 Jan
 2025 15:15:29 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:a03:80:cafe::f9) by BYAPR11CA0071.outlook.office365.com
 (2603:10b6:a03:80::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.18 via Frontend Transport; Tue,
 7 Jan 2025 15:15:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 15:15:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 09:15:28 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 09:15:28 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 7 Jan 2025 09:15:27 -0600
To: <buildroot@buildroot.org>
Date: Tue, 7 Jan 2025 15:15:21 +0000
Message-ID: <20250107151521.1655280-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107151521.1655280-1-neal.frager@amd.com>
References: <20250107151521.1655280-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|SA3PR12MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: 65cb7f5b-d8e5-4e7d-42f6-08dd2f2e1f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V2G4L9bG0jUjoazRjW+tFCkyHs45AhzFFk5+trM8kiIprVAq8VCqPISiWWkh?=
 =?us-ascii?Q?+khTUpj1JvVZB5BGs3vLW2pcS6C/FBk+KtaOFAPfHAoBzLahkxZbpryaFBuz?=
 =?us-ascii?Q?w0oOqd6oqAUlJQUNXqz5NcTYqrH/smWKcHL37SIfewDn9M2XxjTqscJw7vDV?=
 =?us-ascii?Q?rL4xroUHqPrUYvcL8sYZniAW2Gx4IzyuVEcc9OsQdc7lF43PoBX0T8L7R1GX?=
 =?us-ascii?Q?c0zyLnc+H54BzQyX3euTvPGuw8+0qviCsxYlhPWlWB+zRVt8F6aN1j3BbeyB?=
 =?us-ascii?Q?3KqNt+r9cT9lz2ZSQHGgNlXM/sON0N1xN+Yr8vMpXLy5lJf82ZIuI+BK7gXg?=
 =?us-ascii?Q?/suOfJlwwLn2rCgrqD/9T2cOY+hcnGcVH18dt8r30WMeZR5L9jyhZh4JFyys?=
 =?us-ascii?Q?YENCPQIrdteiy4/++RTd3wIn0TuYberdVaAE/ufgdyIoeC+KJzrvIwnvb53C?=
 =?us-ascii?Q?z1z/ui9JIw8yPsjKtqV9Rv5dcvC53GkxMPrMpJ9+H6PRwV46oNPsi//nqWTJ?=
 =?us-ascii?Q?5SnmeskXWpF9uNO9pK7ZLyVDng67zsY8O/kkBFmiexb1Zd3qRZ4PLWALtv6F?=
 =?us-ascii?Q?nVzwEKHBa78fJj22UHMX1WOOBOfjMLgKE4VTj97a43+5pv213tXpcaIXCee5?=
 =?us-ascii?Q?eHsFfCJa2lq9B8JOc4bY1aaSpN2QUqwNZ/4BnSluQ8ZsqpCzShQPJCH+FdxT?=
 =?us-ascii?Q?vnTbV8rfgXmsMcxCYjQeuSy73iu4edStsCgsXDjjPC1lFlkVjURqyiw+t+t/?=
 =?us-ascii?Q?nI37NJeq2xYqTH/pIcca1Hl22LurAwuqkZlo4THH8hqQGjBJaieizG9BVO4E?=
 =?us-ascii?Q?Y1ngghpmeuqsUZOLLsQbL/+wUUtZVtPJvlTjfA7I9Cb2VTM0SHKxeRtNTqq0?=
 =?us-ascii?Q?Oh37NXqN0HETDkd5uKqB9qY9NfQdgG2LxWWLAW+mjy4fg3euyW9RRCpzuct9?=
 =?us-ascii?Q?ZSJHSjvfIA9s+7n4aKIBl1CAIAPT5WeZzqkDfQlYLEdMPMiSG9V16h+Yk2wU?=
 =?us-ascii?Q?rfRP7gxscKamccSFYM/lVnjSmOwDCZha0NSbwfugpdE/B8I3wrx9XrG0mz+S?=
 =?us-ascii?Q?YlUPFJJIh2Zd31Q376W2JGYAcmMmD+36hMg6IBz4uYe8YNnJ6f/H1fWMISsW?=
 =?us-ascii?Q?UA/7y9lVYQnVoqGNUvuekdEeXws6REQLeUEV7/zzb6jekWpTpPzS7P7ozXrd?=
 =?us-ascii?Q?WxqnrYsoSTGxZIstV+ckQKm2qatcN/wHVUWYCavMZNwfbwyonpkZl7plZEsm?=
 =?us-ascii?Q?1vxpwjpuHma9tPv0CoU/SJ79UFY+LhzHh5n2kUj3izSZrouPPo1Vt3shUPrX?=
 =?us-ascii?Q?5m9Y5d4V99+xYnDY+OZp1AqRWjQZe8LrHeo3iijWcb1msflxfTrmDGdlzmRL?=
 =?us-ascii?Q?QxvgrBLb6+0bMR94EpuvsdYp2ZsVQe/gOTB3ede5ywu0Y8zgT4eKQmth/a1z?=
 =?us-ascii?Q?W1spSBJCWgOMv1yu4qiznBv+DUS+lp1er0Ys2dgvopdpJnJU7y4o1it2pgHG?=
 =?us-ascii?Q?ihrWKiVdtciK5WoSJXluE0W5Yy9E9ihrLiPt?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 15:15:29.3828 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cb7f5b-d8e5-4e7d-42f6-08dd2f2e1f3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKyoLU5yiXGJKIveVvRcAt/91v2QAAUTubBsRxklrsI=;
 b=axjrJKp9jCPVrXC1YXXL3ZAeo3Z/kktxlAPeQpUdvqHU8JfY/S7iOQ651V1h4edK9UV1uDiMQVgrIYpOMADWPqNnntqyfsc/sC2UllqEcq4sM33JsUYBa45ffkcAvX6QhxtqyKTEMqeOFCx/O+r6HidDYfnEsZ5wZLjv07BW3zQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=axjrJKp9
Subject: [Buildroot] [PATCH v1 2/2] configs/zynqmp|versal: bump
 xilinx-prebuilt to xilinx_v2024.2_update1
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

Bump the zynqmp and versal defconfigs to use the xilinx-prebuilt
xilinx_v2024.2_update1 release tag instead of the xilinx_v2024.2 release tag.

The zynqmp_kria defconfigs were still using the old default xilinx_v2024.1
release tag, so they have automatically updated to the new
xilinx_v2024.2_update1 release.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash | 2 +-
 configs/versal_vck190_defconfig                           | 1 -
 configs/versal_vek280_defconfig                           | 1 -
 configs/versal_vpk180_defconfig                           | 1 -
 configs/zynqmp_zcu102_defconfig                           | 1 -
 configs/zynqmp_zcu104_defconfig                           | 1 -
 configs/zynqmp_zcu106_defconfig                           | 1 -
 7 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
index fe6963872c..ea072378a8 100644
--- a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
+++ b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ef61a4b249ecbf632a25cc34c3b03b8290be44397ff739467ac92ec1701e23bf  xilinx-prebuilt-xilinx_v2024.2.tar.gz
+sha256  86ee9629366aa8c0d70b87202152a793804ed4090e3a6fdac4eaf855bcc4d458  xilinx-prebuilt-xilinx_v2024.2_update1.tar.gz
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 21fc202b30..165b67ec3a 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -35,7 +35,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index e90408e6b4..832788219d 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -35,7 +35,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
 BR2_PACKAGE_HOST_BOOTGEN=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 604e5f69c7..3db3be23ec 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -35,7 +35,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk180-revA"
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vpk180"
 BR2_PACKAGE_HOST_BOOTGEN=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 1ad2a064fc..d2700d4ea1 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -38,7 +38,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 4856c9b958..3d08d40cf0 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -38,7 +38,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu104/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu104-revC"
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_BOARD="zcu104"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 4c5ac16f0c..e91d88f05f 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -38,7 +38,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.2"
 BR2_TARGET_XILINX_PREBUILT_BOARD="zcu106"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
