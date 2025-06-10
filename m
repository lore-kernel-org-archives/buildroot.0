Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E08C5B543
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 15:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18D9B4088A;
	Tue, 10 Jun 2025 15:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PuNfcVDsUhwU; Tue, 10 Jun 2025 15:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DA4C40766
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DA4C40766;
	Tue, 10 Jun 2025 15:03:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85F2C183
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 15:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CD5A40FF3
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 15:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MR8_ch9Jlnk2 for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 15:03:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::618;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4820640F61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4820640F61
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::618])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4820640F61
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 15:03:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zd5gA2qO7KgAOGHiGiDS/hxAw9vi9qZn5aSC7+USe10oEMG1lSpwz4tbrgxvMyG8GOJ3zd3vHo3UD6gAtkzo+L2at1XtfVe1mmvUZu8aLydQVi29O0/oOQhpv4Ey8SExxg08/Wj/TXFd/xJwGq0e4jvDyp6GIG0DlkyPsEyYcSsfTJGe/hadY2h9yeYZj+nqWQbYl2ECWUg28v7H11cSuNlfrTO7HeULKTGl3ONzWKdvz62Y1b0kvD+O5/PdUuO9DAQcMpMn+HwMRPO5E6H5AARia2MIivLAmd+9DRFxK/nKdMVwceyED/514Mfjk95DmioNLtL4xVo9/NJn8Z14kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJKrcXJC07IGclhq2EDNUvsWz4qJhEwJaQUpip9/4Q8=;
 b=desvUM/IaN0BFaZp/htOMCp6V2Qw0onEC89R4YR+QAEc3lnyy3zYQ6Yo8ccjmVqb5EkeET90WouLtDWoBIV+4ReUY/rKTrC0Y92UKMerCeAri0gHJJKbYg2oZO7zSF+hulGiD5a4vdT6kdAFxjJ3uEzCNwG8CCO8MmcPxRyhw8hF08JJjuMkPGPnT733njtBNG/uf2mSMI8/ZF5VbqAoxZzevmoLzmCIQ1HTAwzKFMstGdkjsyL4U79gJ9Y8b2H7bjiQNhBhGllX7bdpynQsX/TSYKh86alVbqYOXT6vAheJlBQo86QemoDmANFrD/nNjK/fpoIBpTYb7oghlvzuOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN0PR02CA0022.namprd02.prod.outlook.com (2603:10b6:408:e4::27)
 by SJ0PR12MB8089.namprd12.prod.outlook.com (2603:10b6:a03:4eb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 15:03:48 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:408:e4:cafe::b1) by BN0PR02CA0022.outlook.office365.com
 (2603:10b6:408:e4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Tue,
 10 Jun 2025 15:03:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 15:03:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 10:03:45 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 10:03:44 -0500
To: <buildroot@buildroot.org>
Date: Tue, 10 Jun 2025 16:03:37 +0100
Message-ID: <20250610150337.38247-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|SJ0PR12MB8089:EE_
X-MS-Office365-Filtering-Correlation-Id: 12aa873a-ac4a-42f6-36be-08dda82fffc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aIEBeJhQ5ya0ayX/HbBm44fMDFiOEMemyyiAk8wELQUXkJu4KohFfilf0NlX?=
 =?us-ascii?Q?+vWKcwVRAGgtRx7vF5vl+B8oMuZD6y6JwCd+wo5ZThKbgXFo/zYPb5mZi7vu?=
 =?us-ascii?Q?5aPCs9Z0y++yr81brf5WipMus2JQdfz6C/6sJqypWJNIaISxyQhPrx1Fj9qY?=
 =?us-ascii?Q?ISQIe4dfO+Q5vBpmXaXjtUA4dN4YOFfhCKAldOiVI2Wx11+7FzrCWjACgu2H?=
 =?us-ascii?Q?6teI0WjhelofgfWEzs1PixM/NCWUnahR5rYNB7rzFm21WxchKTqT86E9KPoW?=
 =?us-ascii?Q?7xyatB2Woxpm1rXW6shj8qV2+EoK47cX6IBxQv1HviZc5jv3vWWAZGjspALy?=
 =?us-ascii?Q?6OW9Et95EShsJDBVPd574sYbIfegOefa0enUuTVAMGIew0osU2FgSoTTdL/C?=
 =?us-ascii?Q?8N4b1vohAcv0WxpkhPMP2/eDvm2ToHhAPg7f1zDKr7Aod6ulJSJxfYBqvdHT?=
 =?us-ascii?Q?FssHtIrRwzcwOOPQeuTI19NZWv+1XlFwo0ODXHAi7cRsktQlo3Y+3f9g0RGu?=
 =?us-ascii?Q?XLp5vyogdJ2Bov3wKG1Byv/MgAaawMFJP+1sbLTY5r6TLy8y/H33bXncjCQ0?=
 =?us-ascii?Q?ljA1FfNbW16Kmf5gWGA1C/73hId/72VrUSLwOrary+6vOIFeq3WClkZRut6C?=
 =?us-ascii?Q?fACAYompg9pFMTG+LqGeYM+PM6YFdUZOF6L8YEIfGTA3FzhrG6YCO2kGeS7k?=
 =?us-ascii?Q?Rp0Y5PgMi5PwK7bJb+kfKNTTnNSU0jZLRptL/m8kWyxhX0r8jgYbpq+hFZk0?=
 =?us-ascii?Q?aVgmX3v3tQJJ7dk1ztsay7QZ9YO2aXAZVwAMe711/RLW53Q0nKdsHqzrYPnz?=
 =?us-ascii?Q?ENNSeTH+JIE6NdQEcorJMgn2BIzB9Gm6q4W9dnirpKdVM7X2J6BtmzlGhV+h?=
 =?us-ascii?Q?H4VIzhU1A+PyZioM3KKukXyAtK0gONwAAR6YRrF0tOHQgSlGV6HoZNEZbOh8?=
 =?us-ascii?Q?gHY88x1oSMcnKeruuI/aAi4zuaMBK/BQMAtp3Yru69TNhcDfH794ehwQnlsS?=
 =?us-ascii?Q?L9AEvyscGYSKwZUsH/QGCkOTKtdR+tuJaXdYsMUaOB1ug42JsBW3+zrrYR2a?=
 =?us-ascii?Q?HCNXkITJnRbNI3MP93z/QaBtEm1FUvbLdLqqqkj/A+u5FhpZc2o2krr6z6F8?=
 =?us-ascii?Q?UvhHyUjmdx6wQ1e46JRKcC9eFhnlC2EZgFfF+A25LXruU4iDvuqo9e7hkal2?=
 =?us-ascii?Q?dG7ftn2XLIf5QPQGBNxXpmtgmt9YI9WCFuQiN0Y4yNK1/cqi5lnO234Nqqe0?=
 =?us-ascii?Q?LLDlL6E/26BtKqxcw8JhoLX42Y0q6tnM5K/M9VMxIkm+FhQLaTSWKw0akesY?=
 =?us-ascii?Q?xm8kEhGItOcOX1gqos+qYoX+TAm4gOZGjZW+4ZBL7EtRrzUcDycCTgXmiuNp?=
 =?us-ascii?Q?XeaWcMXSKpAVHn4g9PM9/ew6/68xjFOubR9uLNR5X3KfDHTHSTrs+8ehnpjX?=
 =?us-ascii?Q?iogOyV0V1FZ5iNfpAWqtUC1AQtbjyErsWby0hdg/3aVb8TrEzy8OIiZ1BldR?=
 =?us-ascii?Q?JHEhR994j+715PQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 15:03:46.3930 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12aa873a-ac4a-42f6-36be-08dda82fffc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8089
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJKrcXJC07IGclhq2EDNUvsWz4qJhEwJaQUpip9/4Q8=;
 b=C38Lc3Fkya5C3+96AMzK8TDGEbK6m7OcySlhHF5uvGqGIc7VmFTgaijOaZUs7UWT9ByAc1G8KVTamNS0ymB7KYQdEygInncKdqp/qP2ecOGkxcTYCy5t2dz70maZ5HUjg8Z55Bw963rq1YhigRpNjXuZ7UPc5ZQBW9fkm9drHgg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=C38Lc3Fk
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_*: move to external
 Bootlin stable toolchain
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

This moves the zynqmp defconfigs to the Bootlin glibc stable external toolchain
as per[1].

[1]: https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

This patch has been run-tested on the zcu106 evaluation board.
This patch has been run-tested on the kv260 starter kit.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
This patch is to be applied to the next branch.
---
 configs/zynqmp_kria_kd240_defconfig | 4 +++-
 configs/zynqmp_kria_kr260_defconfig | 4 +++-
 configs/zynqmp_kria_kv260_defconfig | 4 +++-
 configs/zynqmp_zcu102_defconfig     | 4 +++-
 configs/zynqmp_zcu104_defconfig     | 4 +++-
 configs/zynqmp_zcu106_defconfig     | 4 +++-
 6 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 8e7034105f..ea575a4196 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 41661a69de..789a1164fc 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 0275edf30e..2041988ca4 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 1d4debc8e4..8f68d932ad 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 2eabe2e959..9ec3125880 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index a62c7975bd..0d57eb7721 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches board/xilinx/linux_6.12/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
