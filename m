Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4DDC021A4
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 16:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D52796FC7F;
	Fri, 14 Feb 2025 16:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvEs84bOi27M; Fri, 14 Feb 2025 16:54:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C0876FC6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C0876FC6D;
	Fri, 14 Feb 2025 16:54:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D8A71E3
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 16:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C1D14165B
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 16:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A08WmpvI7nhw for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 16:54:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::629;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B27A41648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B27A41648
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B27A41648
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 16:54:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJOgTUtfGJC1nd9ZgzBH8uQWMwj+DPLqLAtpjCR30EWptGWgC9OJfhxlnEaL2JzTOsz2xcRcGFXMbch4KN6lFq5gF29FkGhVCwvW+Qo9PVt3pr+bPpfXg+b73PqjuBuqyjWN/QbqwEZL1IzivCA/sUc9hFcT5+4P7VSt6aOWBktvfavIeJ0D3RCnlo30rxrahTbv/DLcfp88YPb7X56UqoOMpPmZE1G4rIc899tPNKScJbepbPvQLyCg6y4f/8DCKeUYsp7Yyu93aH7OFXVexbFA/ToBNVA3DS1zcDHe0+R6eMfzSsXws1M71bEVldFZzGB9kEDwdq9rk6OldioGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nnox2+ttqoBssaeRtxUy5XeqIoDR1chQND9P6j8HJWA=;
 b=iLMJmk9zp8ox8HRGxL/t261CugsNYnFRfKjvNKuPyxdhfQ+kBL/tOEDAEO4zi3Ducv/bS4nCUszNFuD19DnyiAcnw3WGB4p/un5VF6hdssjOisOraMd8RmkHd22+f2mS8zpURd4en3qBTYqgrFQ14E9n3hQnPLWerh/oG2jb4JtmS1Sc18egsJcd6APJjZY4jTJwhghQeMYS9xiJ9Gk/YoZc6LPmCWQsTd2UQhnAAHrc5/9VvT2v0sHv0obLnKvoSRqGZMca3Efs2dfTyvD7980r8czUqlO1lrFW9H99Ut9qVsqnzMJB4yc+asH41diJD5IKclilxORHQsO8QeAHTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0118.namprd03.prod.outlook.com (2603:10b6:408:fd::33)
 by CY8PR12MB7340.namprd12.prod.outlook.com (2603:10b6:930:50::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 16:54:14 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::74) by BN9PR03CA0118.outlook.office365.com
 (2603:10b6:408:fd::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.13 via Frontend Transport; Fri,
 14 Feb 2025 16:54:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Fri, 14 Feb 2025 16:54:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Feb
 2025 10:54:12 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Feb
 2025 10:54:12 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 14 Feb 2025 10:54:11 -0600
To: <buildroot@buildroot.org>
Date: Fri, 14 Feb 2025 16:54:01 +0000
Message-ID: <20250214165402.1128194-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250214165402.1128194-1-neal.frager@amd.com>
References: <20250214165402.1128194-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|CY8PR12MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 82f6ecb5-6ade-4a16-050e-08dd4d1835a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8EdxH7ov/ZTLrM/dkutb4Y04PUHa1iCqHUoH1OL2pQVlZNLy899TifTzE48W?=
 =?us-ascii?Q?33eMFbldyQoZCHuqAhs4MINFOlmk5e4lyAbvVjqg/i4TBuBJC2ik36bMPh1j?=
 =?us-ascii?Q?KMpuFIBSdeSiTPqrHxEKhEYhGCauY1tvGkIIgkAEze4t+8tmc9v6N5BuotuM?=
 =?us-ascii?Q?dz3yb0Xz733mpsu2r2ZlfuKrnGnr3IRQAglSu8PlwSoq2+iWnBqGl6ayqijw?=
 =?us-ascii?Q?yFuktar5akGqGA3p7UomdySvrcwCO+O51G6qThwqUVgSqAZZF+YDMt5D3Sx2?=
 =?us-ascii?Q?75ebBj9L6TtsWBngtVi0XCHtTWVnCVnDbrkMQhRDlBr1XJ2khwdCOMinzh4d?=
 =?us-ascii?Q?ED+0SXaJm8k7R7nfi+NkaWyGQ72bdQeyRWnVwMOKMIIhlrhgOeCKfPbhyEDJ?=
 =?us-ascii?Q?ffLobzg8k3MrrY+VNI7pJSA4Vwat1pTx0BO0L9XyfEzn5297WLdeRV2XJb1A?=
 =?us-ascii?Q?BOQDtiT6PUeNUTu3LcVbd8FVtkkwLZRqcnXEF5u2jFlmyMcu2upjUx+uXqZA?=
 =?us-ascii?Q?VuDAvRcub9DuUlilWjdwewnn37yzpt82zvyOOIq9T9C0w4y1wHngG9X/9jFf?=
 =?us-ascii?Q?mvAVGEvmy97OUcG8RwkrMCAQgCorP+ImInoKaDNuI8ny8hosiJz1cgvE8r9P?=
 =?us-ascii?Q?pdW0mylipbOTukDdpD1XQ6GBXV/z/DmKKnceRn8Bd1pEumKxUb2J0qfGoWDm?=
 =?us-ascii?Q?wVd3GnGVgDA/FG+KT3D8O/S/YrGWET9egDbUWmesd2b0q54OppBYgUn2auop?=
 =?us-ascii?Q?ovYCpPU/b5ITeiegH0dPnqh7zoUJnaB1id6O1tc4mhSF1m/oIF6A8EvN8WVk?=
 =?us-ascii?Q?GccSCRYY6nw2z7RGd5pVEcMwo6Whunn4fYnBVHqbdi2rXLSo47fM0Xpv5blg?=
 =?us-ascii?Q?sR58tDKNyeC+iIWwde+xpxhVFedcOzG+yaZy89V6OSIKzqHl1N5WOzlPHqZq?=
 =?us-ascii?Q?mtT+zOSgZtAlm7fpcenu2p5nnzUtWat/ComvQPmC1iulmyDpQoox+hSLvzJ9?=
 =?us-ascii?Q?sAjQyhdnQY7NE1eCkUwqpv4HK+LmXgxHPaOXPy31NulvYYNGG2A+3FWMH3Bn?=
 =?us-ascii?Q?k47ctIq6wy80Jcj2ins5x39Qyh4Euv9q4gbpKaOixdyMOZ5P/BXgF5TSI0CP?=
 =?us-ascii?Q?gFVIlk/BRRE4xBBSdE3Nh8MQCXNUdc2obkW1j+63Ra7diBGY1K8ox6nGqZTa?=
 =?us-ascii?Q?+s0wXqeQ2qW5enjBnr5vSiMdeJyGHDk0tTHKu53qTMY34c97SAXDGr+647OG?=
 =?us-ascii?Q?dg5tKydRJlsGr/8kRGsq5duePUUdO8hQQf6Y+SWzcmfsknUhLS4v7MGHRNyo?=
 =?us-ascii?Q?wrSkOmRu3R8F+LzKhzLi4ON9Jl0c/LYqUDuP3FTsGqSheevIjJURK2KD5rig?=
 =?us-ascii?Q?l8jNM9Hq7AHMlGHsXOXbrqDvBBtqEQOvkBhq0VTjc541tXxuzzEwy7vL6TLX?=
 =?us-ascii?Q?0jUP6qb2FOuqiQAmrrTJpbRPg+AXktJk+7af0kLpIqVd19uH5Q7LDqb7MNkI?=
 =?us-ascii?Q?oU1JPsFwCnOogQ4+TmAPPn3zemKAHTIbwBGM?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 16:54:13.0152 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f6ecb5-6ade-4a16-050e-08dd4d1835a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7340
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nnox2+ttqoBssaeRtxUy5XeqIoDR1chQND9P6j8HJWA=;
 b=dRGAZ0Qm3blQHXtgxPAV1jFu/w33RTHDjVAecSQ7dpvUtlyAZsFmsJP+Py7kzoaJzsRiH1Akb66xXkBn4+jb584cwQcLNRRui3pJkcrp+2gPYn7q0UT81d1J4PqrecfuFwvOh/SzbJ55HxS30zWvz5HLGOUNj3uFEgzP+bHwOB8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dRGAZ0Qm
Subject: [Buildroot] [PATCH v2 3/4] package/newlib-bare-metal: add multiple
 tuple support
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

Add support to newlib-bare-metal to support multiple architecture tuples
with the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH string.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- no changes
---
 .../newlib-bare-metal/newlib-bare-metal.mk    | 29 +++++++++++++++----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index e28e7a717c..4acc11deb2 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -22,28 +22,45 @@ NEWLIB_BARE_METAL_INSTALL_STAGING = YES
 NEWLIB_BARE_METAL_INSTALL_TARGET = NO
 NEWLIB_BARE_METAL_MAKE_OPTS = MAKEINFO=true
 
+# to build for multiple arch tuples, it is necesssary to build out of the
+# source tree, so that each arch tuple can have its own build location
+define NEWLIB_BARE_METAL_CONFIGURE_SYMLINKS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		ln -sf ../configure $(@D)/build-$(arch_tuple)/configure;)
+endef
+
+NEWLIB_BARE_METAL_PRE_CONFIGURE_HOOKS += NEWLIB_BARE_METAL_CONFIGURE_SYMLINKS
+
 define NEWLIB_BARE_METAL_CONFIGURE_CMDS
-	(cd $(@D) && \
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+	cd $(@D)/build-$(arch_tuple) && \
 		PATH=$(BR_PATH) \
 		./configure \
-			--target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
+			--target=$(arch_tuple) \
 			--prefix=/usr \
 			--enable-newlib-io-c99-formats \
 			--enable-newlib-io-long-long \
 			--enable-newlib-io-float \
 			--enable-newlib-io-long-double \
 			--disable-multilib \
-			--with-tooldir=/usr \
+			--with-tooldir=/usr; \
 	)
 endef
 
 define NEWLIB_BARE_METAL_BUILD_CMDS
-	PATH=$(BR_PATH) $(MAKE1) $(NEWLIB_BARE_METAL_MAKE_OPTS) -C $(@D)
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		PATH=$(BR_PATH) $(MAKE1) \
+			$(NEWLIB_BARE_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple);)
 endef
 
 define NEWLIB_BARE_METAL_INSTALL_STAGING_CMDS
-	PATH=$(BR_PATH) $(MAKE1) -C $(@D) $(NEWLIB_BARE_METAL_MAKE_OPTS) \
-		DESTDIR=$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT) install
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		PATH=$(BR_PATH) $(MAKE1) \
+			$(NEWLIB_BARE_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple) \
+			DESTDIR=$(HOST_DIR)/$(arch_tuple)/sysroot install;)
 endef
 
 $(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
