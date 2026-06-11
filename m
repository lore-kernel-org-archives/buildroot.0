Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC69CD98D2
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 10:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D24C6077B;
	Thu, 11 Jun 2026 10:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fep40Wk6AwGI; Thu, 11 Jun 2026 10:17:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B24060789
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781173071;
	bh=ZbVdYcnprJGMQ5dU3PnQ7Vc92pMv1Z7kPYTZj34WsEc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=OPBk3gyoaSkaEaAwybLcBgAN/ZO5F48k6B6AMaj3kpeld98DyRR8gI6YcYKSP9NIF
	 lh9ZxcLgn4vvEk6U8BLZ1CqRdWHfQ5j5CH0xNgSIEaEAmGnu2w3Pxm9a4SwU1KSy3L
	 4dkVM0qaPJ6cS0IVU4oPIdMEyx4Tp9CkOqj3kDyfqYVxoF1oKAgy1vnpfW92JuHHt6
	 dAH+abs4/JdHx4kn3EDLY/DHQVx9G8s6IznuC/1a4hx/6cop35RCovUnJwjIawOZoS
	 RL7/l9fDf0KKhEVqE+Mq50lKGTPjOtpfMo9uCu0na8qz30aX8zHvjgqs5goIOK3VjX
	 IUjYqm5sjipJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B24060789;
	Thu, 11 Jun 2026 10:17:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AC7412F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 10:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE6AD6077B
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 10:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80s3QHUj-aiv for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 10:17:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::9;
 helo=dm5pr21cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72D7460727
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72D7460727
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72D7460727
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 10:17:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJZUg/ATiZrT6hs5FcRQXDBTHkXj9kaN6ZHi02FyOdhWhWkRnPi2f1kR2YfNq3A0eXcrL/wKxeGwV6rP3p+5Jn5O8t1QEv4RMU0R3hWXApm0JQiOc3dDX+G7aU2L/7kWi9LfgGpTEAdVnEnW53gHPeeNW/6uqf3EgMnR20tPKrI2d6DrEz8GQtpMhluaXDpASt2Ka2ZeMDFMNRcFUZgfeafxcZL+e/PUGom1ay5R4+L8LVBryXCChWGZkHLZIWByklwDeNw5eabQaf4wS+jcl26TEDf1/yFXD7vUFVVSXi51E7Mb+mCMUAetMsV96r/0QgmqRcfAyJhFIN2KOLjT9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5t3vUmoXosfL6OP71CVIRZ0ABcAIpeCkxNodcgIixw=;
 b=czO7exSguPWjdjjlTeCxKBzGiQldoz6OqN9CT0DgLPPM0mC5O+RukLMrcne3pbhA34ovPu5GguDEm7/9NON2oSVjKWhqLfCd3ipy6k9qqyYT2ANlXXRuV5guR7hRi8mozTWDsgGMYBdUmVyiMsPg2ERRRNE0/5ZGGMFwTma1AgwIAGCDyPBgmOJTtDi9uPacoOb2+vg9cmfT4+CqOZJG7TCMkppTy6ID+JUyElHTm+Gd8etKpybcM/PZzvP+2yzZcB/xAMy/wvolw35Ypy8wdRydrPHp3WqtOzfxyaUW74dLEAK9QogEcqpQaE/Au3q51Y8icRaL9GNwoMLJOxO7/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CY5PR22CA0024.namprd22.prod.outlook.com (2603:10b6:930:16::27)
 by LV2PR12MB6014.namprd12.prod.outlook.com (2603:10b6:408:170::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 10:17:41 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:930:16:cafe::7c) by CY5PR22CA0024.outlook.office365.com
 (2603:10b6:930:16::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 10:17:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 10:17:40 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 05:17:38 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 03:17:38 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 11 Jun 2026 05:17:36 -0500
To: <buildroot@buildroot.org>
Date: Thu, 11 Jun 2026 11:17:32 +0100
Message-ID: <20260611101734.1968785-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|LV2PR12MB6014:EE_
X-MS-Office365-Filtering-Correlation-Id: b77324f0-8dba-433b-2aff-08dec7a2ab30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|7416014|18002099003|11063799006|56012099006|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: c2fvnYXZsJKdwCT/cVqlIM84rZAZyI8OGx9RG6t0nNJBrHN15VcEp6jZ+Fmj6jbCnOlpJBEqZHz3T+4mHCkl+X4XJ8nkerR65T5BoohMJJ6T+2Tg1Q/WVnz6DDI0INZUn+KfGhlQOG0MBHLIkDIJ3II1DMeCaqCd1YHnINmH0N0MxZQ+qYK19riG7K1JYzJO0yBVTRC9SEKyOfuHHE2q4E+QvNqN58lR7Ei8jsVcojCuPAU8QH6FpCpjDFrRTd947piXHD8ojBnyUtBxQIlqBP4VALU8OsHxCJUWJQqNJzKuFl5guYxus6RFYD7pWPATMO2pqpnrS/zUOBAVIdQja4bj3mMAp2nCvcziS3Q5zTMZXsON8knIMkO9l1R3NBk/qLA0zcewEzDuSLgCACT0GEQafK8fNMv664SzYTjIbYk6QLhySyuGDpkorKNXs4nh6rp4/f9dP8biBtWe25Z2uf4we5sGTJVMxe+4l51sWsG/HNnmNIQFMMKuTZsX/t1ja0BBnTefeSugCundT/TsMegD6egMti34swyUfO/fTAajJSVxHz68qOG/84IbuM7TIN2J9K1EJJoIUo1bCu6Omhb/KL/h0ocWtxIZOpmtvPOvwDDOVfy7eiMo/CzbHHY5gnxozk4fXlKN/SRD6PS7q5vlMEBCHxgpBLN1+xJtG/kKKllNgnGkMhopKeddVT3OkCbolh4gw1LSVXGvFTD2Ql8+7PR3O2LEXi9ZleOjUboJL+MmuyiioeFYGjCQJg8f
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(7416014)(18002099003)(11063799006)(56012099006)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gpo6VLhpzCzKc6iQj+nlQDpN5Fc/fJVL2ISBVNl6Yg8iD29Am/iESBvOOVO32oT6I8Ep9picOObaL57bimDQoAGYGMmITmLjuU0rqqSXxz09aorKz5KAsmJi8O7WVRCrZIQVXbd4Facb+YmjhNmvnl0DrRwtlNwSqZwTmJWX3XbtMQbbPgpR88TM1Mk/mtASUpy4cyoUur4D0/PDjeuM114OD7+SBTVvcyezNi4buevn1OXJDUaTpynNiCM6FUVAhwn6LoAuxsP/RTOPH8iopc5zgN2+yR+TVqwOzPN4smWPVs67eQvuBYcf5BZGbNRWzhOCqqVUoUsFvrh/IBNfimRwDZkNMIObUUD7XurQBQP4p7LMC1arqjKhL27ec7oYgV6HGHMDCjWpQX3k5ETGt6Iksqz0vIsEM58OE1SdQ3OqJ2EnATZATsazD2pInyVn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 10:17:40.3004 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b77324f0-8dba-433b-2aff-08dec7a2ab30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6014
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5t3vUmoXosfL6OP71CVIRZ0ABcAIpeCkxNodcgIixw=;
 b=a1RNGrFnwQ3bpaMLQNZGz2ggNI/0MMIQdZdoImp3zjQHh5FYHqBD3q3sGgu/+AVpjqbZBWRl9kN2uLI4/NqG/JzMHSRqOBCA20+O83myspb2pSuavV9gO3FhqwFr+nDfSQltb/R6AyUDaZivGYyCobARExtONPBO2OE6V6Pi7a0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=a1RNGrFn
Subject: [Buildroot] [PATCH v1 1/3] package/xen: add custom version support
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
Cc: alistair@alistair23.me, stefano.stabellini@amd.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com, micheal.saleab@amd.com,
 yann.morin@orange.com, matthew.l.weber3@boeing.com, brandon.maier@collins.com,
 brian.j.wood2@boeing.com, ju.o@free.fr, Neal Frager <neal.frager@amd.com>,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the ability to configure specific Xen versions while leaving the default
version unchanged to avoid breaking any builds already using Xen 4.19.5.

Since the version can be configured, the 3 patches need to be moved to the
4.19.5 directory, so they are only applied when using this version.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .../{ => 4.19.5}/0001-No-trace-backend.patch  |  0
 ...2-Arm-platforms-fix-build-with-gcc15.patch |  0
 .../0003-Update-linker-flags.patch            |  0
 package/xen/Config.in                         | 25 +++++++++++++++++++
 package/xen/xen.mk                            |  6 +++--
 5 files changed, 29 insertions(+), 2 deletions(-)
 rename package/xen/{ => 4.19.5}/0001-No-trace-backend.patch (100%)
 rename package/xen/{ => 4.19.5}/0002-Arm-platforms-fix-build-with-gcc15.patch (100%)
 rename package/xen/{ => 4.19.5}/0003-Update-linker-flags.patch (100%)

diff --git a/package/xen/0001-No-trace-backend.patch b/package/xen/4.19.5/0001-No-trace-backend.patch
similarity index 100%
rename from package/xen/0001-No-trace-backend.patch
rename to package/xen/4.19.5/0001-No-trace-backend.patch
diff --git a/package/xen/0002-Arm-platforms-fix-build-with-gcc15.patch b/package/xen/4.19.5/0002-Arm-platforms-fix-build-with-gcc15.patch
similarity index 100%
rename from package/xen/0002-Arm-platforms-fix-build-with-gcc15.patch
rename to package/xen/4.19.5/0002-Arm-platforms-fix-build-with-gcc15.patch
diff --git a/package/xen/0003-Update-linker-flags.patch b/package/xen/4.19.5/0003-Update-linker-flags.patch
similarity index 100%
rename from package/xen/0003-Update-linker-flags.patch
rename to package/xen/4.19.5/0003-Update-linker-flags.patch
diff --git a/package/xen/Config.in b/package/xen/Config.in
index dc4d434810..bb44202824 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -10,6 +10,31 @@ config BR2_PACKAGE_XEN
 
 if BR2_PACKAGE_XEN
 
+choice
+	prompt "Xen Version"
+	help
+	  Select the specific Xen version you want to use
+
+config BR2_PACKAGE_XEN_LATEST_VERSION
+	bool "4.19.5"
+
+config BR2_PACKAGE_XEN_CUSTOM_VERSION
+	bool "Custom version"
+	help
+	  This option allows to use a specific official version
+
+endchoice
+
+config BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE
+	string "Xen version"
+	depends on BR2_PACKAGE_XEN_CUSTOM_VERSION
+
+config BR2_PACKAGE_XEN_VERSION
+	string
+	default "4.19.5"	if BR2_PACKAGE_XEN_LATEST_VERSION
+	default BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE \
+				if BR2_PACKAGE_XEN_CUSTOM_VERSION
+
 config BR2_PACKAGE_XEN_HYPERVISOR
 	bool "Xen hypervisor"
 	help
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 5756dfc68c..e354718021 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.19.5
-XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
+XEN_VERSION = $(call qstrip,$(BR2_PACKAGE_XEN_VERSION))
 XEN_SELINUX_MODULES = systemd udev xen
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING LICENSES/GPL-2.0
@@ -13,6 +12,9 @@ XEN_CPE_ID_VENDOR = xen
 XEN_CPE_ID_PREFIX = cpe:2.3:o
 XEN_DEPENDENCIES = host-acpica host-meson host-pkgconf host-python3
 
+# Handle stable official Xen versions
+XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
+
 # Calculate XEN_ARCH
 ifeq ($(ARCH),aarch64)
 XEN_ARCH = arm64
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
