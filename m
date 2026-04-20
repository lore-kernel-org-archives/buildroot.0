Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029B9F5A8A9
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0D2A81EB4;
	Mon, 20 Apr 2026 17:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 153BwWuBU1cz; Mon, 20 Apr 2026 17:39:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF943820E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776706761;
	bh=vpdmUzPmjfkAOkip/NvyTFtj3YH4pEZHjTGRzRHAJQw=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=V5H/RQkpFlJxXipVrPGi5kjo8VnM8dnTqmuUvjRWpI40QeyrNAwyBoaExU9K2nr25
	 cftRjl334d2eoO2144Z6uiwSi1YTb/3d2rrnC3BqQo4RecKcBsGt/Wxd8jM6arhgwm
	 dhmCcczoWFGm8+EkJyvAtLgemO7Fyub7rozRIklx8VA2V3IBiJxk1xidycfB6+OOHR
	 LFJSXvHu7f3M8qtdM9aBJZibvkh9r8uPJTxiN6oHVuf/aLwk+wP0Eaa9MBtnHAJbsd
	 cW4tIYOFREz7PK0px1A2GondCaRjDFAr4rsrzpmRmzsFRbRCioHNXyO1fTBWu1dd0O
	 +6FAJEzvdw+Qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF943820E1;
	Mon, 20 Apr 2026 17:39:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5245257
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D38FF821AC
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQfVZ-xkvlWe for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:39:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::7;
 helo=ch4pr04cu002.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 093C982CB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 093C982CB7
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::7])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 093C982CB7
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:39:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxHTsAMxPN9iHfAjEqUj1dVyrddDA4P2M4ZRyBfPIJCNokqMqhzzrqrcnS9Rr74tjLnMtaka74rNceUA+JJLiq9kskUQNwKgtwakTFvEpzGSA+Je+3prmCwVEelvL3XXO3r0ABPKMKgr7ySFm+/bxAZmscjTaY8jQkxLU74d2SwivIvWEdRVxVDzq1RDwbrPvMYdw8Yi7aF/ahWG+nPf7F3Prhjgx+FrZ0kqVtECglanumTeiopBIjCZDgrAMXg8GWK5XAHiUOyKn2QZAhfAerdduPxVJf9TZEf6Lt/HoWIl7SJcdoU6rcgMKpOEt2NHO1CHMh1aQBWXUGaLM9/YgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uqX3ppDp+efGl4cQQT4N9zHsxq1Yy760LmatHD3tRw=;
 b=YXVmj28v3Udy2PlxF+PMDdNYWPmbcwlXrLAv0r1XFf62A4a+8pEKHwziWNcN/y0tWwhkPETkMEOlSw/Ad5Bhnp1qx31688/vtN4ABMfpld+RPuQ7YheXwwKYzOSWPmF3xXZtTTFe3jeks2AnJ/C9thUXfMQ4vz79RZyQk8UPbdrVJlJ85UFgXu2ouXQ0PX7dDb5llUvXhiFyb1aJDGesPxzO4qIRznXeegR8XvFGlDpBZ9UXNzTaJ0d84Al8B2OT9Hn6zsJC4WCncAmLS4c7M0yrZbsLF2o0jq8SdSdAzlLHVTsFGph8AZIgMxVF9VAcUDA6vl59sr0WXhmO5qdydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0124.namprd03.prod.outlook.com (2603:10b6:a03:33c::9)
 by DS7PR12MB5886.namprd12.prod.outlook.com (2603:10b6:8:79::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.15; Mon, 20 Apr 2026 17:39:10 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::9f) by SJ0PR03CA0124.outlook.office365.com
 (2603:10b6:a03:33c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 17:39:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 17:39:10 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 12:39:10 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 10:39:09 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 12:39:08 -0500
To: <buildroot@buildroot.org>
Date: Mon, 20 Apr 2026 18:38:56 +0100
Message-ID: <20260420173858.1655069-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260420173858.1655069-1-neal.frager@amd.com>
References: <20260420173858.1655069-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|DS7PR12MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: dea0de23-e81c-442c-3dc2-08de9f03bb1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|7416014|82310400026|18002099003|22082099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info: 1XpJRKgZRp34remn12U29S1NfQcI+m3XOY3o5LYgh2H3HEAA93YBI3NRuTlkeKj2aszZj3rIF1rWNGEmVqp/7zupDhMibGv17TciVAS+dLBMgTy7gtMPnQgp7TWzHSZtC4WQlgG0PlgYBK+2KFjJ5CqxbJ/CMBlM+zjewUGdMeoP7JrYJgeO+jmfKgGtPTr3ZR4OWDWWv/kXJsRwCCHDWiWB1iKSpzCF4KkOU6/qB3gwFUG1WTvp5F5FjFt8yr8Zf+F76Iu7aBACNynVinTKS1g/Eyl9TBgfzinoLb7MTUB/MWOCBRywZ/3UkYbudttkmxnABGYZsEYhXydaO9RpPaFBO5e+0jmkwMsUk/GCkH4jTD/q1gjNaHDRgjAB6vAjOQbeO60gQ/ht9EspGMZWUclA2Io2Tq8cUP1J+UfuT+kR61ZI8d3jOjySe2fDkR0o5mL/xYEMq5J2bRpJ1TFjXbBM5b2gxeJZjhDHVW7sc7dL98M5gtezTL9MKAOREPk0317+3O91IxPBIMrBqflf5VQPsSRBBVp2xmiHaVapoXz0PDk6z4af6kG+Xq7PpvvRozIOI9Z3Hjdt7et0JbM7kzPWmIrRHS4cR/MaH8RISWojcgSjORiomxIde2XYRViWFWyZOqFdfRFGhR5gtNv5PD9ZIbSociVPpRz5l0yAvCq2wX69v1NJCEUzzvZ1HoIhGE8mkKKImDwkXnKmJ+vCIR6bSFUyBa8hnktZamb/+5BpNnInB6R0r33ohFUsaWzrXFgeUXIlf3KesWsMbASH/d5cMHY/r2y9N1XVfClh76277CbGKyC0x14Vfmd06oLVFWs+qVL+L4awOI6tfIPqGw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(82310400026)(18002099003)(22082099003)(56012099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: buQTPuZwfU7I7Us5nvjql+LLyYgK/8lbMV7apFZBsLr10ScxCxTlrJb21Lio2T7uLNiKdMAvGAauRVFrzYCx7KB/vXQT1/ZazeDJ4XeM8fHxuOzkRWvGcDQNyolbq+phHeT68jDI56M9USvlzJQnvN42Uti1rbr0nRzpMsAjJABCLKC5epqBaIrSV0Lh1VUGZZOrsdM6H8z3PxqTd+WoJj5DE6XcQIXS6rvQfe0RqFrDGj9Y9iHAAIw0knwh5PhrnYrNkpet+FeeSesltw+0S846yrImA5EChv97wSW8awUKULXGUD6NBa5SQiwti9abNsB80upfswaeCajDemFb+ITOXkhNaKL8eQ5z35UXBDylIQWfEpXyICRbSfykU8m5sK2ihNlUZ356p62D9KOixXBVePey2DIdLb32xJ23vtkBV4Fiz6zLvZiVe38RfkeX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 17:39:10.5276 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dea0de23-e81c-442c-3dc2-08de9f03bb1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5886
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uqX3ppDp+efGl4cQQT4N9zHsxq1Yy760LmatHD3tRw=;
 b=dXg+1hXNEJ/VCpVgXs1pVRRwgcRxA+8OflU0fnoeHpp9RNjoiW+4ztRQoUGAPPsBf3n5hUD3XiGWYA1cwAW2ph6Jlg1qLDnHavnbpU15V6+cf3rydy8QeucPz7UfT9Oeb0PYMDCkeDiQyb8f5RUFT1KOnmx8Rgq7NjvkIUkwn4w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dXg+1hXN
Subject: [Buildroot] [PATCH v1 4/6] configs/versal_*: bump to Linux 6.12.70
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the versal defconfigs to Linux 6.12.70.

Run tested on a versal vek280 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal_vck190_defconfig | 2 +-
 configs/versal_vek280_defconfig | 2 +-
 configs/versal_vpk120_defconfig | 2 +-
 configs/versal_vpk180_defconfig | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 5f0ab2e962..d05217775c 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.70)/xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index a096fc0788..9db372f0ba 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.70)/xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vek280-revB"
diff --git a/configs/versal_vpk120_defconfig b/configs/versal_vpk120_defconfig
index 1c9ef448e3..1af9baaf3a 100644
--- a/configs/versal_vpk120_defconfig
+++ b/configs/versal_vpk120_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.70)/xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk120-revB"
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 648b9b0aeb..ef6a078ead 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.70)/xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
