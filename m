Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FF8CD98F0
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 05:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 127A46F7BF;
	Wed, 17 Jun 2026 05:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X74-dz4kWytW; Wed, 17 Jun 2026 05:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F19686F79E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781672777;
	bh=BNLPleSjQj6uiC5EO3o5m/exDH8uXqx14RmFw52/bTg=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=RnelOcvBmiV3Rrka72Bm/1PAJnZMx4jMmy8BCLLWRjzCUpvhwwXi3k7LmmWW1TJPv
	 4Rj7NUjni9JK3L7BTSyVSxvFSOfQnGZN7chXzFfyB60/YF6+ffI7lb0ErpIFbpxatq
	 q4zylQAi7tAv+lunwEd/AOuR0VZTzThnMOFmEVrlGtN6BMOgAodZY8LjxwpW5RQv9R
	 285oLherurTom/eZY/Y6FXLJ+UggGu0QeFbJEbk/OJaT4tG1xF/5ncIl/QfhIWoJNR
	 Kkwgw80ePCnzU6CDSZ98H88SbLLURqHGtas99QldypFQ3QaBdDeMIiQxojAF2BvUz7
	 Lu0Z3HsVvee7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F19686F79E;
	Wed, 17 Jun 2026 05:06:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D72A355
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C2A54ECC0
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbtE5QhSOTgK for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 05:06:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c005::5;
 helo=co1pr03cu002.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6599E4ECBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6599E4ECBE
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c005::5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6599E4ECBE
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:06:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1wBN3E0PRgWpNS8XsJ+h4O5U2nIw7gQculsTHC1tBeiDBSVSJjD2IFYvzqlD8FyPzkPiaIm3A4VbxiHeuYn0e8um6lACgsPg42QkF3HDJv7IUs/lPAxVWTJ2Z5pD8P5+mVBahgfRfC1KozMVJtxgfSnWByhxLQ2UleFBd7t18jq/i0N+asSnn29CIL6pALwBp52fFlYJ7Sk287N/EyjiHbLNv/t5FuyCUO26ajQa4DWdvMtZHUvxIe+Wbi+61nlf/Z4FFFgap/VfhENFuoyUlp6+wR66me0fcCJUz9K9zVP/El6MewaTZNqQXRo1dYg3Hni4gjDe5qUcclvnXrXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFr5R54ZAGU3NcTtcuNAgzThp0OK9G05FOHG5UfWDoI=;
 b=OWYMitfcsmOttsZ88iRTn2YZdYxn/iuuYglZARjR5z1nqaL9YW6KMm+gv6NRALa/S5/Wb04dRTWq89cpxczcz9YsAf2zB/HpzLCunSwetfZZPSVJujS3bL+dMXXXvspBmJwqDq5IDQ6pdWjqUY+g/1Ns9FOoncbGB/IxgN105S9AT5K5LwCPBYBaVnbn2an0PSOwbE99AsNQHsgaUBgRytweUr9ckWEltxPXGp9YUaBkdljN0idnPR4Nfrj8PAnrMX2b06DzfcGeorTvtuYg/JJh5/RIxQvTJr4AJt1vQ1frXZXfypN+EyePn/XW/XBETphQo3gNSXc8Dy9fX0F+4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0194.namprd03.prod.outlook.com (2603:10b6:a03:2ef::19)
 by DM4PR12MB7671.namprd12.prod.outlook.com (2603:10b6:8:104::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 05:06:04 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::2c) by SJ0PR03CA0194.outlook.office365.com
 (2603:10b6:a03:2ef::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Wed,
 17 Jun 2026 05:06:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 17 Jun 2026 05:06:03 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 17 Jun
 2026 00:05:59 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 17 Jun 2026 00:05:57 -0500
To: <buildroot@buildroot.org>
Date: Wed, 17 Jun 2026 06:05:35 +0100
Message-ID: <20260617050535.2670810-10-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260617050535.2670810-1-neal.frager@amd.com>
References: <20260617050535.2670810-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|DM4PR12MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: b7684c1a-b743-4f4f-73d2-08decc2e21ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|11063799006|6133799003|56012099006|18002099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info: g1F6NWKuDVboXlnlKlZUbqrsV4sgO1RDTi8+xaClVuv/L9/1k8UWlEZa4bzN+n5tyZaOnLIPPzgc90Hqo7OeSqbpGX3+K4OM+55Y5RPcEEtIF1/HZVRdi0W/rbxkQYULY+m5LFLF6Gpa5YrlXMMT9AFkSJmBoWeC++F0sALEFyoSbYDHDUcd29ikAEfUOTL5SDX07RxYsl2iHSK8YCtwVFobWHp4PlvKHX6un5LdEG6k94oUyYG+pJdFbWVTcy45BpxV/ghqEFE5DglwwOf1nldiQLI1IgQO0MbMonz6H5TcFBwr4fwVV6kday0IBg6G9MjugPSUQ1dZtAozZY73FSuyIPoPCfKug28dRjl3lJEt9HsFfbx0nAImcg3MdCoVM++cJd+zNyINbaBiOG3pm5fWw6u/NEID79Cmd5ATpds9raO4Put7SqMV4dTeqPLmykTz7mL5gPbONcSKAER1x7JXg0HFTLrXEkWablRpC7MxLzRF/E5qnN0UqbQu7M7k0stzRv8wvWY1oiUQpfKa4+k7NTByHvBz8V9xTB4AL+qFrWD1+ql0uCB95JCAoyClxpKOeQD1+tUCfgYr0Gi2Dg5iHkcvJN8hvLWQpqhYqLH7+4Mhh4q+TbXcL1vpmAjQMMZlpQZ68dDfkCQk8U6bZnZnmJSFy6REDGmDnN31jYv9WdWdsQ6lPuo4opzB1Vj5uYndEpt74okF00lBjYiulGiFHYMxcsIHhd8Aqm/4DSKhD2/SMfbB2vOzmRjeLGGWOXuf6H0NdgPzKWr+DxlldL8Px0XyQd6gsTQR2afsCO8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7tNwJisBnvFrv+oABwECINDkPGdLaiXYN/8gx9uvG+O305w8PTt5kmXXn2M+rS4fNonYapqyMYLuFrpjZmc6Q6zmNgytaQySFzThbOXKWtvd6wYQLdNvLo01orSH+keGdAsYcS3zwCrZ44yUqD5zwyX39OE5+VEm4fobYhffbyxLBMF/DTH8sePE9Y6VezeNQUgIFh/2Rv5MNH3Y3zE3K1CEcMUSsWd7+5rgnJ2Qyi+qwllFH8UughtyUGPQWPJzU9qyIWLHt4mss0HHNGPxYtKW4qWANobBC4pzXfBmOQ1a5fIpJlP/KN+tJX7nVZaHVxOvwP/hxW5EKVWDQkXFErhotaSc4hQNXVWZ9xYtdr/+uqS/LQxW863lFtpRl4NhAJAIglzjNeVWviVJgzsUDSUqM5nuhU893+ssiutJAFeWMXaCVxfyGwD5n7jk1Vxz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 05:06:03.7928 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7684c1a-b743-4f4f-73d2-08decc2e21ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7671
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFr5R54ZAGU3NcTtcuNAgzThp0OK9G05FOHG5UfWDoI=;
 b=46GcastSehy0J0gJiCrALGHhdTXLB6eoRGLSLodaUieBqUNxxCghQWgwLkfj/4vYbnlegGjE2KXEJyiw1UETz166+VCKx/NdtxywJnf/pozV+nsMNRLC4BmwmB/lP+QNYWflYXLvmQnzaTLSkcuFLdQqd9TwYKxLqBRmB5XJwiU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=46GcastS
Subject: [Buildroot] [PATCH v1 10/10] boot/xilinx-prebuilt: bump default to
 xilinx_v2026.1
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
default version of xilinx-prebuilt to xilinx_v2026.1.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-prebuilt/Config.in                           | 2 +-
 boot/xilinx-prebuilt/xilinx_v2025.2/xilinx-prebuilt.hash | 5 -----
 configs/versal2_vek385_defconfig                         | 1 -
 configs/versal_vck190_defconfig                          | 1 -
 configs/versal_vek280_defconfig                          | 1 -
 configs/versal_vpk120_defconfig                          | 1 -
 configs/versal_vpk180_defconfig                          | 1 -
 7 files changed, 1 insertion(+), 11 deletions(-)
 delete mode 100644 boot/xilinx-prebuilt/xilinx_v2025.2/xilinx-prebuilt.hash

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index 7926b6cb9e..ff129ed5b5 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -17,7 +17,7 @@ if BR2_TARGET_XILINX_PREBUILT
 
 config BR2_TARGET_XILINX_PREBUILT_VERSION
 	string "prebuilt version"
-	default "xilinx_v2025.2"
+	default "xilinx_v2026.1"
 	help
 	  Release version of Xilinx firmware.
 	  Must be xilinx_v2023.1 or newer.
diff --git a/boot/xilinx-prebuilt/xilinx_v2025.2/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx_v2025.2/xilinx-prebuilt.hash
deleted file mode 100644
index 9828b6595e..0000000000
--- a/boot/xilinx-prebuilt/xilinx_v2025.2/xilinx-prebuilt.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Locally calculated
-sha256  d292a52ac167631860b5e9a8d8356946289da164ddde4c5393977dc1652dcadb  xilinx-prebuilt-xilinx_v2025.2.tar.gz
-
-# Locally calculated
-sha256  e7ed8599c0cbf9e28d07883f94ee6ff694f6a702daa56c75b2cf4b30105baecc  LICENSE
diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index 5a09e855d3..76eb455043 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -49,7 +49,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_ASUFW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2026.1"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 9b59d1c9fb..100af782cf 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2026.1"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index f76ac682fc..42562603d6 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/versal_vpk120_defconfig b/configs/versal_vpk120_defconfig
index ebb944a27a..67dfd9e424 100644
--- a/configs/versal_vpk120_defconfig
+++ b/configs/versal_vpk120_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_PREBUILT_BOARD="vpk120"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index c904602fcd..0537fce6e0 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2026.1"
 BR2_TARGET_XILINX_PREBUILT_BOARD="vpk180"
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
