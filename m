Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEB1CD98E1
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 05:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7F0585BD2;
	Wed, 17 Jun 2026 05:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oGhwBg48xh6h; Wed, 17 Jun 2026 05:06:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB21F85BFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781672776;
	bh=o6iw1v1sMnWgi8dgcFmGyKckGyTZVKPZMO9qFOK205w=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=i44xkRHen2tsN86kJXJ5SwkCcjLOWu3dUkYKQ7Pb5Nl1TTAdOEUwHBsaWoJY6qrpm
	 jE/CmtB3EVe62aNjDsRwIZUbKL1hq3DTD/IY2Ek2OCoZqS/WJM5ZDwj9+LNh1C3Squ
	 PFBvv4QANSXWxEP10n+of1rGGijqGZg387LzCBIGVdZv59UJPkdEx8GcNI5yjtK94q
	 Zut1rSscaJizrOG20lMfmLvK/nqIOw2qUnoVx8PRS4CtYxHqX/vzz/3aV+G/ksRg7F
	 sgmc41s5Axzbb72/6gvp0KjC4C1iPELsoVuomqNhWFZNRzTvF6W5cgx5VjapjZrBOg
	 8rtvujBbrPyZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB21F85BFF;
	Wed, 17 Jun 2026 05:06:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 312D0347
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2321685BF8
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dW8P2SYMKqcl for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 05:06:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c001::5;
 helo=byapr05cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 459B985C02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 459B985C02
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c001::5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 459B985C02
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:06:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHm1lNw4Adt1ih6rv5TKgi0d4pE311soC+m7CEhOkICaJzuLxmzRle6p0x72fTDGZAX/NzkvAAIzlDnjjvoAhKa021XAQ1Mi09ceBcADRRtCctmi0T3I7rtrm0XmuEoeWAU7uLwRf/GoHxCiGSy3OZZ1+nWVW4FeGrGPjFSBt4Kmo/5ozI8WPjqwk/11wlKEPvpvDDd4pWZRAlF+w2lkbuoKJNsQFLu/x/Dna9F3uXH/eB64hX/Qfe0jBRTZ6PC2g7xnqHxOq/ajeM6spNsEMpoePd/VoM7AIHrDKRCj+nJgy/b4ZYY6bUIeU5PcTEDCTDOh70wfrpaPA3pgZ/qA9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFpoPZ/7ESUGgc52XMGOdP/ICcFYncTou7Y0sdI/lh8=;
 b=iVe4QYFlJdund8vXsirfs5RucrzUeKASuEELEam/22VOvpReysG24sEl5zQ72I3VxXs9vrny+i/bzPVjvQnZEUbUGCnKP/LKrYnfXm2+HdLIsPwoEz8E+b385pDg3CqgBEQgiXeUx2wrEtcMQgu76BaWzoOLsn+aHblYe/AABDIQjaGqtvVgGXtHb1QcJBA4+XQLgBETaTUmZ83YpnncPn/b9noeSD57815NHrXp0ynrMsQgwzsHqX22O3O32/1wFXNTbtU0djOsQ6Rl7/CVi9hYLffAHwaHoX644a+5k0gGXSxKQX4pz74nwKQXRf+LlEqFvIq9XQkriPVukWLSOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR05CA0028.namprd05.prod.outlook.com (2603:10b6:a03:33b::33)
 by CH1PR12MB9597.namprd12.prod.outlook.com (2603:10b6:610:2ae::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 05:06:02 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:33b:cafe::9) by SJ0PR05CA0028.outlook.office365.com
 (2603:10b6:a03:33b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 05:06:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 05:06:02 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 17 Jun
 2026 00:05:56 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 17 Jun 2026 00:05:55 -0500
To: <buildroot@buildroot.org>
Date: Wed, 17 Jun 2026 06:05:34 +0100
Message-ID: <20260617050535.2670810-9-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260617050535.2670810-1-neal.frager@amd.com>
References: <20260617050535.2670810-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|CH1PR12MB9597:EE_
X-MS-Office365-Filtering-Correlation-Id: b5888668-698e-44d1-0568-08decc2e20a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|56012099006|11063799006|18002099003|6133799003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info: tRInnlC8QUpf80DWZvRiQbYu6UBFiZQxMaQX9/FRM5t3anYrhWDmpRArOUgOSO88W8sImak5KN1theStN+Z4wrNyRbb2hFWA7Q7qJqGWHt+miC5geRHAPLwM9JC4F0ypm/Rh2ttGOK/fiw+QD/wp4cf8cNx1Z59JxiQBR3EzDGfwDoMPSrU1vs8TRw4KZYy5OhPiNt2DXrDN3qAjrbcq0kWSPZvlliZ/5JWARUB08mc/B/57H6CbgZBYzU33L0qWj7Q8VuY1VvE4RLDEZd5JhkXk4xXrHwhrwEkIGGN/WdSVd1BjG/Jm107dtmFpaY5QpwxJ022/MbAMybzH24VbKpdPwEreOpkXGB8STnK6tBqVfU8+rLXzkKc9N7ytOnFeIpjehMZ9GbLrbPV9bEGUqTL2mNoq8iMdTofipceXJmNPv26J1zox7TG4NuCDGdLVZCr8qNLEAyGJdbnxINzPIQc2m9onM2f6jWT/fL/ZtqetaQjF9CmbrztNWDTCg/xOXFvbrTlKGjFNGS1wSiWsTl16qAZLxhju1vxfwjAD34zlL+p/mKVCmzhi6ZrKySwlNIWW4gcEujuvOcVfQWK1wcdj9/QK+MHhJYhMkZAhjpKICWPMNkRGOeDjKCdXHyyi7KZDsdCtWjn/zP+6oONM874qZu8H6GTBfDhKJBEKj703SMww38Qa+OCZbcjRnaV/bXHB1cpar5IPq2QpiG7SkIFjWc9VDWzRyJ4M9oIAifdepXfuRNp9c8saQY/XQ4ex9wr2rv2kNSWQ52Cr4X1xgcc1DcUWGhs8VLX5TQ+tftw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(56012099006)(11063799006)(18002099003)(6133799003)(22082099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HnsgBY1PIS3wDU9NLfG3R89bdUlRy6U3bJbJTKgiZQUQEXiDbBxSkbqO4qa1Tz4kzAi2luFwrOuk8Tk3YKa8Uh4RPIpM8/ur7CdZm4vmjIwlqBRYhRv1kwqfxjjfxhZnsubDRLdETY1QTwogaVqn63Hq5O8pBgZR8JnTEM3zShWwwnJilv4/NqVZpWu4fByUr/V1a2q8cJrYHAIy5wgjLvtZTgEWk7PSFnqj7lw/MaN5CXwRppu86gpF/Ym2tLoU0OOT1I7CfOZoM8eQnoF0GUoP3a0Di9fBn/V3sz5wVAU7BFMxCmEwEGGUOazrccf8fwc4HlJZ1dVPRutIIs4GDkVaTYLqGkGvs9u7py+GrzXBn679Q3MUtLPvBbLAq6cuz6kDkbsvDi449UTHi82Hsrke9hwoDEIWugxWFlzDsz8fBXfiPLzISMw3hhxnoPRL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 05:06:02.0006 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5888668-698e-44d1-0568-08decc2e20a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9597
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFpoPZ/7ESUGgc52XMGOdP/ICcFYncTou7Y0sdI/lh8=;
 b=ZZmHlqQkqDqkOMXdF5EaoVKIOwUTN81D8Cthvjc/e2vNYQzCAL+VWKf7GI0zq0PamSyPMWEQiwegnsxol7LHlqBwjaK4r0N7fa7YRp6A3j1lzP3tAsmUg0EgI9gcNCC3aLvJt0A75+SMgMU4C4VEJOUpN2cl24aY2B6kUh31Zfg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ZZmHlqQk
Subject: [Buildroot] [PATCH v1 09/10] boot/xilinx-embeddedsw: bump default
 to xilinx_v2026.1
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
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that all Xilinx board configs have been bumped to xilinx_v2026.1, bump the
default version of xilinx-embeddedsw to xilinx_v2026.1.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-embeddedsw/Config.in                             | 2 +-
 boot/xilinx-embeddedsw/xilinx_v2025.2/xilinx-embeddedsw.hash | 5 -----
 configs/versal2_vek385_defconfig                             | 1 -
 configs/versal_vck190_defconfig                              | 1 -
 configs/versal_vek280_defconfig                              | 1 -
 configs/versal_vpk120_defconfig                              | 1 -
 configs/versal_vpk180_defconfig                              | 1 -
 configs/zynqmp_kria_kd240_defconfig                          | 1 -
 configs/zynqmp_kria_kr260_defconfig                          | 1 -
 configs/zynqmp_kria_kv260_defconfig                          | 1 -
 configs/zynqmp_zcu102_defconfig                              | 1 -
 configs/zynqmp_zcu104_defconfig                              | 1 -
 configs/zynqmp_zcu106_defconfig                              | 1 -
 13 files changed, 1 insertion(+), 17 deletions(-)
 delete mode 100644 boot/xilinx-embeddedsw/xilinx_v2025.2/xilinx-embeddedsw.hash

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 674238fd0a..03488a18ce 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -22,7 +22,7 @@ if BR2_TARGET_XILINX_EMBEDDEDSW
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
 	string "xilinx-embeddedsw version"
-	default "xilinx_v2025.2"
+	default "xilinx_v2026.1"
 	help
 	  Release version of Xilinx/embeddedsw.
 	  Must be xilinx_v2023.1 or newer.
diff --git a/boot/xilinx-embeddedsw/xilinx_v2025.2/xilinx-embeddedsw.hash b/boot/xilinx-embeddedsw/xilinx_v2025.2/xilinx-embeddedsw.hash
deleted file mode 100644
index 77b4c2467c..0000000000
--- a/boot/xilinx-embeddedsw/xilinx_v2025.2/xilinx-embeddedsw.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Locally calculated
-sha256  fb9a705a2974fa4d8d79142baea204d388389b9b37d6f26194b7b759f8978457  xilinx-embeddedsw-xilinx_v2025.2.tar.gz
-
-# Locally calculated
-sha256  5ed583a37f9592d4bef73061f14f85c2ca70b8b7a12ffe1ef8ea808fbb764425  license.txt
diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index 0b1834fa4a..5a09e855d3 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -46,7 +46,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal2-vek385-revB"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_ASUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 481dfd7656..9b59d1c9fb 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -40,7 +40,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 0da0210306..f76ac682fc 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -40,7 +40,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/versal_vpk120_defconfig b/configs/versal_vpk120_defconfig
index d988865846..ebb944a27a 100644
--- a/configs/versal_vpk120_defconfig
+++ b/configs/versal_vpk120_defconfig
@@ -40,7 +40,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk120-revB"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index cd37287a27..c904602fcd 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -40,7 +40,6 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk180-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 28e6b45281..600abb4b04 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -46,7 +46,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kd240/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k24-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK24_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index adbb001e8f..1895dc7261 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -46,7 +46,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kr260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK26_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index d7b2dc9a16..7a87463365 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -46,7 +46,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS="-DK26_SOM"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 7b4c30a43b..77e69cf014 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -45,7 +45,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index b97cec437d..985dfd01c4 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -45,7 +45,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu104/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu104-revC"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 8b7d96a0d9..ddacd2d98e 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -45,7 +45,6 @@ BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=y
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
 BR2_TARGET_XILINX_EMBEDDEDSW=y
-BR2_TARGET_XILINX_EMBEDDEDSW_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
