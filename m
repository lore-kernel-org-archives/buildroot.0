Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FBBC021A4
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 11:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A07FD60C08;
	Mon, 24 Feb 2025 11:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLDifwibYiUR; Mon, 24 Feb 2025 11:45:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B795605DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B795605DC;
	Mon, 24 Feb 2025 11:45:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 266CC920
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 11:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 147F240BA8
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 11:45:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hz0Whe7G1sEj for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 11:45:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::624;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5CA5A40BA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CA5A40BA5
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::624])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CA5A40BA5
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 11:45:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puGJNGnOK0oalErAjG3/jXCDpJjWYaU9S5SRKuo1BECzt4/PyJhDevUqqEAIeCttS78dI+Rg0q8KTjCHRZJt+AX2PUxumiCB0mN+hzSUzc7XS6UnafOWa4DWOoAf9r7yvBN8Mc6osT33r6CWIyLENKVa66B8AWkSHipnR//ghQ+mvQWv/kxz+QqXLb8ZPqWMxpIaYGOXfXFF5UVhGJQ5PWUAeUcjjaAfVeYDBtL3kGD99ZdNRLxc9sNgQCxWjvA7AGBTS5UuHm0dFktoH7JxqaoRvu3sBC/ehUggBArbllPwXvduR/XQ7IW2w+oPpvoeVKG2eDNN1JnBjucE4ipjeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMnSWDH8/sambJB6xCSp4KykGpOkTTQ/MM9OrYsEo08=;
 b=J0Wb+MnrJAW8/Aa1sHpP15BoXT38U5VxlE9zvqAyNUkJulzombgckfJuQyES2H3w+49zYgvHXwnb3J1nI/kOIOQKZqIfK6vqtCL21e0iBSh0FTtMIyUc4AV872lONs25lIwFTHZYz1F8DXgPYP2zglbg6LKO/X2OFcgwfPw+JN63hah+olIJfjzZweMLLg7C2mPNEGu++Ls7WKMsagusEO3NEQGKRqoDmY9AQ42I+++sR8AhpeQVK3jK0dDlYw+wETObOPq453AkZIm1p6/EAH1LhVhPmd0XQ4u5tFY02/AW8i8zlBi2Qdl6gv3ZP5TodJlmswoaUqUdJ9BhsqOnlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY1P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::9)
 by CY8PR12MB7099.namprd12.prod.outlook.com (2603:10b6:930:61::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Mon, 24 Feb
 2025 11:45:20 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::87) by BY1P220CA0014.outlook.office365.com
 (2603:10b6:a03:59d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.20 via Frontend Transport; Mon,
 24 Feb 2025 11:45:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Mon, 24 Feb 2025 11:45:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 05:45:17 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 24 Feb 2025 05:45:16 -0600
To: <buildroot@buildroot.org>
Date: Mon, 24 Feb 2025 11:45:09 +0000
Message-ID: <20250224114509.3416189-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250224114509.3416189-1-neal.frager@amd.com>
References: <20250224114509.3416189-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|CY8PR12MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7bdc94-6bb5-4ed3-2aa4-08dd54c8b6a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yEoyceHSa3tYyXRy+CizxvuazsBLOjv00z7XLcA1Q207KewUfMIoVPu/qLU0?=
 =?us-ascii?Q?SmXbagJufn2AS8g7uCL6biWaWC6J7zEXSC8i7bpaFGapa9WmADKqUdR+k4+7?=
 =?us-ascii?Q?x85zT8KBVFq2D/QFKiHDvc963lonnarnz+g1PdMc7ZpC1hgHu8qvdwZCZthf?=
 =?us-ascii?Q?zD5Ink/Xgjv7n/Cxw/N5+ksSLSE7gsvWjxruMzy4qh17SAn+89+cFqqlcLcD?=
 =?us-ascii?Q?KceaASRthhJ5zao3wmzZe55+rlVhuyO3dLSYkhoD9Cx1KPwXFFzN89IcR1Zr?=
 =?us-ascii?Q?UkWue1+63ObbGihWX9NaA8Fi0wbG16iysqPuti6LeNJCinti7fRpvblXS69f?=
 =?us-ascii?Q?fFRx+5KNX6u6hjHmdlN1kiQeI7uaZElYMNfq0+JUwgPaXFf14+qYS3j54TNX?=
 =?us-ascii?Q?HVyRA2lr1C4OLKiFQnWEkW1y/JupBNqM1du9EWVOjOYH5cXsRCqPLq5zjRJB?=
 =?us-ascii?Q?rkoqgV4UHVIxeiOEQfv3pzQnJgcp8JCIQbRJEBieN6BeEF+FJeJo+sjNyNPm?=
 =?us-ascii?Q?1y0U3kHu2VPstaUOxixjSVZH0qbtfPRLI1aH+wyZV1Dm38vIgAgipl7G0NmK?=
 =?us-ascii?Q?fTs5SHkn429JCE4cDeEdjSHfXKrE/qEAiLqJkM8g2jgxatVmWGE5t26oktD5?=
 =?us-ascii?Q?Imv501g+4kTvvYtYJKTCv/lKpgCWgtVku0zpWl5+vALFpydy+JsP++R/d5A6?=
 =?us-ascii?Q?p0YKzN5j2c3BS+ytqW8rW+eHguqwrt3pXSJNFIdGxPCpzt7PqvhcB/t94cBY?=
 =?us-ascii?Q?dxIYE4NVX/W3c1nrXHpTLXmtKuszy1Gxl86+jGViil3PDzaPlwg/tkt8rQJ5?=
 =?us-ascii?Q?ZgUCIRZ7AGcey7j2Gn3/RkRsunJigj7Qzoq1sgy6WDoVQTg6GpLtRqKT8PNo?=
 =?us-ascii?Q?LQsqlb/uAGOrqCv+/KR0LDyoM+/TIbTjq39l8tT+2nmtcYoUcTtdJ+3PsUKq?=
 =?us-ascii?Q?/IjWU0LG4x6imcWc3NYocp+sraLE3nv0aEiFaLklpmE178rIrq9iZ7syz39Y?=
 =?us-ascii?Q?AouCQb2AvbytiN0BsaKWDiE9kV4zlYZS3e2i6nRrBPHsjmLonL2ghBhsgthL?=
 =?us-ascii?Q?QyDmAT1Pozf31g3EjFb47TotXOO95RK0rdgoBoawiqOf/h99346XYpkzvA7l?=
 =?us-ascii?Q?rjII/0yNYK4hxF4h5flwuO3TOFt6sBZS5f6zXOb8j7eKf08OGQZ6SXP8Luo7?=
 =?us-ascii?Q?b4/saix6DGc/ArY8fcjFXXXPPFwmV0da+220VG7g101qvsf7wBRzA3nskrxJ?=
 =?us-ascii?Q?CBKqveOvQlycNzXYLoN5FzzexDxR+xZGVR2kljPeM6KxqFxkLru36bXfeuui?=
 =?us-ascii?Q?NLEFbJwraiSuheRdtBTQ0gBe+Por8kMh2NXERCBn+fhaMFylMn/M+nJKSCQ3?=
 =?us-ascii?Q?dzddlXt1viOgpCypTzAuis/VLrZn4aZVk95wAOy1alBXVbbyBUN9j43fz3NI?=
 =?us-ascii?Q?rBJuO/VTlKkRF9LmSwJ6IJr0zHaK4Hhmd/MK55zA+mRYXPwu2hDwaqIo6Iba?=
 =?us-ascii?Q?Cdu1J7nk0vqqYD7uiRaegfsATF3J9eSjojvT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 11:45:18.9360 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7bdc94-6bb5-4ed3-2aa4-08dd54c8b6a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7099
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMnSWDH8/sambJB6xCSp4KykGpOkTTQ/MM9OrYsEo08=;
 b=TkQ4ehOckzz7TD0dj1d1ub9xdzGHri1oQWEMTc2PVLlXjsUIN/3UfZb302EXCOwgcaDx2nJsJM6XtwNuu4/a0v1dYI2IZBVFIKH35ivk5kU/RVp/1AiOUzn+KM9lR1dNm7aAoZ4C6ZiHs0figuuuUQymN5aq80BH/qY8xF2l43I=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=TkQ4ehOc
Subject: [Buildroot] [PATCH v3 3/3] configs/versal|zynqmp: migrate to
 microblazeel-buildroot-elf tuple
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

This patch migrates all the versal and zynqmp defconfigs to use the
microblazeel-buildroot-elf arch tuple for the toolchain-bare-metal-buildroot
toolchain.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V3:
- new to series with V3
---
 configs/versal_vck190_defconfig     | 2 +-
 configs/versal_vek280_defconfig     | 2 +-
 configs/versal_vpk180_defconfig     | 2 +-
 configs/zynqmp_kria_kd240_defconfig | 2 +-
 configs/zynqmp_kria_kr260_defconfig | 2 +-
 configs/zynqmp_kria_kv260_defconfig | 2 +-
 configs/zynqmp_zcu102_defconfig     | 2 +-
 configs/zynqmp_zcu104_defconfig     | 2 +-
 configs/zynqmp_zcu106_defconfig     | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 0967407304..1105a3d57e 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index c0c850e586..e59d8a114e 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 2d77580fab..e09b8d49ec 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 85ef7d5aa2..57418a47fd 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index c5cfe2fe86..415d2fc4b1 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 288606fc02..a689be74bc 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 1e453adeb0..45895c17ed 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 13ee5ff5dc..a81b113d3a 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 2669afe1f6..ad64f317be 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
