Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BDBC021A4
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 16:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E29AF606FF;
	Fri, 14 Feb 2025 16:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hjf8gPDL37FA; Fri, 14 Feb 2025 16:54:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B715C607CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B715C607CA;
	Fri, 14 Feb 2025 16:54:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 836041E3
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 16:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7243782EF1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 16:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbZc-S7qZfS2 for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 16:54:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::61d;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A598837B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A598837B6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::61d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A598837B6
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 16:54:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhveU7xOsrwKyfQFxHY6ekcnDh/MfokBqhZWn1SyEEBs+8cpXcZ4G49DdXRORUDaSIla3+5vIPdhLeltiLVC4NkH4XlU0Y+Is70gW9jkanOOAs4kIxNOJPgGRedVIePa7JHQNd9lvrf9J+24a3t4CYHOF2e+mZHMeymG9oUc1Kk/tqUoIvupB8F1EU8yComrTeBHEJsXgc+eXLcP9alTxrUKfPrTgMbCIOBHeHvw7MNoouwZYwlntEXfSySO07Ci3ZiecV31T5sixhX8+ZXItM4QDXamwGpiCXvZv5+5qW8imZJKa7MTJIjLvXuZRyLa5Y5qjGE2zGq3ABB0eujE/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmqMn37z2HE8kuRotxCaGRuPC/HvjSuDHSE6vPX3KXM=;
 b=b4mDNvsbS1oN4KNvN5L9aA08+J+eEBUi/uYWLH7gggMfXZcRivkXJsdvSGb+Gay6h3M0/+jPBIZKKxcY08kSIuXy+dUHGXjbH2+wSPP9tSNesWyR56+UpdO4GlIEnHTEKMgGjwtpTI4HDH+Yq5PbpEmfEXYV2fZn6rFC93Y5UCSnEG39mcZGr/kgJAsmviBGRKfz0rjFPI5Onnsdz+cp2VlK1pobem1DZFohzrmGdRTsTDJcYRP+O/3ym2sF9SL1M5KHTIxySI7SWhZQfJITitkZzVSDAYf5fxqufrfqaCwnu7GVdxWE1MGqLjq9OvXXQwhjtDb9cvoWgqyASJKXgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0309.namprd03.prod.outlook.com (2603:10b6:303:dd::14)
 by MN2PR12MB4191.namprd12.prod.outlook.com (2603:10b6:208:1d3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 16:54:12 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:303:dd:cafe::30) by MW4PR03CA0309.outlook.office365.com
 (2603:10b6:303:dd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Fri,
 14 Feb 2025 16:54:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.0 via Frontend Transport; Fri, 14 Feb 2025 16:54:10 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Feb
 2025 10:54:10 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Feb
 2025 10:54:09 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 14 Feb 2025 10:54:08 -0600
To: <buildroot@buildroot.org>
Date: Fri, 14 Feb 2025 16:54:00 +0000
Message-ID: <20250214165402.1128194-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250214165402.1128194-1-neal.frager@amd.com>
References: <20250214165402.1128194-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|MN2PR12MB4191:EE_
X-MS-Office365-Filtering-Correlation-Id: e55f35dc-e8c9-4615-89ee-08dd4d183479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x87+cfLP6hM767ek/qzHO7HYv6bZCP0AAfNhRAh2VuVt8c8fgRhg00Il+qUz?=
 =?us-ascii?Q?dH4y97Poyl5od+pFf0JPAaDTgZVo2GpMGJMeHaiXdF9z9UFA4kJ0TXUl/SH6?=
 =?us-ascii?Q?7vG3eVWptbA58+qZz0GJyAv2UGZwotEcVuLgmh8N+cqmFPwJlyjaWywVRZGo?=
 =?us-ascii?Q?/P0q5TG9IGzZah1hiHI4Q30PtUoVCXUWJj5uTcUMvyPMuPN4a02wW38LyrHK?=
 =?us-ascii?Q?1u699u5PdNMhOid70fBkPE0wnfMdO3tAJn67V0EsvUBMixzUyNeFYgEOju1K?=
 =?us-ascii?Q?sxgNFkJh+tkoT0zlMJO115ye6CWfgxjcHFyrzCxwcTUP2TJ2iZ///4TEH9hb?=
 =?us-ascii?Q?hgWoBhdR2wwyVczzOuk2e/PI78WB6D0GKU8YpBXxGe1z9I1bKrIWmOn4ycis?=
 =?us-ascii?Q?XSY23b9hVRViFfR3VvpXI2lpLDP5pC60/0spR6KPwwwuFNeworPKkjJ7735X?=
 =?us-ascii?Q?Bx8cl1O1+xlQn5JQRYMIHL2fd2MZuXyh0SskppnSV19TrLnZGjmx49qenDhR?=
 =?us-ascii?Q?63/kgJGtNqR/lVP5mnuCcJ/3xrQNwiuOXJNYXLz4YC46rgExvTRHQ9OpYnWh?=
 =?us-ascii?Q?EgQBTW6TL002sd+j9K8jpmxZJEzFlfkFT9noFN49Px79KwVaE3bWYe9CYD6Q?=
 =?us-ascii?Q?6R9/PajHPW8xLR4QfqII3lLIVoW+ueI8lf9vN8evrOG5PDEEODT+eC+a3ZuE?=
 =?us-ascii?Q?vhP/Ssdpytk+VDzdFp2D3bPBKlqSIX5Kdu1Wrt69YpgKI1vfDDIu8Ewzwcn2?=
 =?us-ascii?Q?NjtSgBUr5v72WBgtmGFhtvh/OPfchFneAi7JY2pNeAnkAtsoBu8eNN6WHzwa?=
 =?us-ascii?Q?dGCTzwtp5MaG9YKGZvBPu/Rpf5L5sv6ms7HgQd8e4WEDWlrIHJOSO/1mUw6A?=
 =?us-ascii?Q?bOv5l68tBbK54RpSpzA5gbLfSNlurHNIsNq5Frl7xtsk2Up/GF3n4rlR89Up?=
 =?us-ascii?Q?/seBwnLiUYzVv++BgtWlTIZ5OTw4RakwY7QFBOLhgDykzN2kTq3pQ2DqwxiT?=
 =?us-ascii?Q?cEsyBwQ/T0s99rTVMx1citn9YhOP2ZSC/LKYHNrWmD6VRCD97ZC2HNxsQe1U?=
 =?us-ascii?Q?3mUFDwgL+Dv7xyDxlE9YrAnhIHgIfhXVc9ZerT3l6Hfzhl+yC+EIfWTo0JE6?=
 =?us-ascii?Q?fQ6KWd6NKH66VrUEESoQ8QNdyknuTsBWTG8ZY+6gOhYyEW7pezw+WR2j9o3M?=
 =?us-ascii?Q?6sC9Gdl4GvJ0gBFtawHoTlZd81CjzXNq1WfnaZyvGaIHWop2XQMSBWTPZTfx?=
 =?us-ascii?Q?cakuNmjACcLdqjR3ODQFznrpXtsZxBrpLLyrbCZQWgwi60sdCz/L6wUZZPFh?=
 =?us-ascii?Q?rtTsmXM6qZUqSi4TSuDMqrgmsNL6P/FVjo5PKm2qLm4E+05cLeamlvvYawVI?=
 =?us-ascii?Q?N184BbcAXULZtNobimy6jtfu7j5s6mzlb0thyvgIvztht3PBR7rTXAuhv2AB?=
 =?us-ascii?Q?2+4vJu4Jn6D3Wj2O4OdRzrSLmA7yj79Qx+tiDSQIxy0Gko0lgESIM74TYV/l?=
 =?us-ascii?Q?ZNkJPWstgKanLjKkNrohiNYMMxoex2+kU2Jh?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 16:54:10.9693 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e55f35dc-e8c9-4615-89ee-08dd4d183479
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4191
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmqMn37z2HE8kuRotxCaGRuPC/HvjSuDHSE6vPX3KXM=;
 b=toHjNs/L7W8v3sXQnO5KYra7bks+xSF8D9vsFPEOZil2EpBPgF6LF6MfTbvGQF8uoOHGQQu398cMcsa/1mn7ydAgd18NwbRVg6MyD/DGbp8H6aq59/StC+1/94CRR4zaI4hTf4ghsfkfxVs2WmJG3lV9A0Eznj6Ke4m4jwHAKK4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=toHjNs/L
Subject: [Buildroot] [PATCH v2 2/4] package/gcc-bare-metal: add multiple
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

Add support to gcc-bare-metal to support multiple architecture tuples
with the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH string.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- corrected sysroot configuration
---
 package/gcc-bare-metal/gcc-bare-metal.mk | 90 ++++++++++++++++--------
 1 file changed, 62 insertions(+), 28 deletions(-)

diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index adaae6c307..66cebcf730 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -20,15 +20,15 @@ HOST_GCC_BARE_METAL_DEPENDENCIES = \
 	host-mpfr \
 	host-isl
 
-# gcc doesn't support in-tree build, so we create a 'build'
-# subdirectory in the gcc sources, and build from there.
-define HOST_GCC_BARE_METAL_CONFIGURE_SYMLINK
-	mkdir -p $(@D)/build
-	ln -sf ../configure $(@D)/build/configure
+# to build for multiple arch tuples, it is necesssary to build out of the
+# source tree, so that each arch tuple can have its own build location
+define HOST_GCC_BARE_METAL_CONFIGURE_SYMLINKS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		ln -sf ../configure $(@D)/build-$(arch_tuple)/configure;)
 endef
 
-HOST_GCC_BARE_METAL_PRE_CONFIGURE_HOOKS += HOST_GCC_BARE_METAL_CONFIGURE_SYMLINK
-HOST_GCC_BARE_METAL_SUBDIR = build
+HOST_GCC_BARE_METAL_PRE_CONFIGURE_HOOKS += HOST_GCC_BARE_METAL_CONFIGURE_SYMLINKS
 
 HOST_GCC_BARE_METAL_MAKE_OPTS = \
 	$(HOST_GCC_COMMON_MAKE_OPTS) \
@@ -37,26 +37,60 @@ HOST_GCC_BARE_METAL_MAKE_OPTS = \
 
 HOST_GCC_BARE_METAL_INSTALL_OPTS = install-gcc install-target-libgcc
 
-HOST_GCC_BARE_METAL_CONF_OPTS = \
-	--target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
-	--disable-initfini_array \
-	--disable-__cxa_atexit \
-	--disable-libstdcxx-pch \
-	--with-newlib \
-	--disable-threads \
-	--enable-plugins \
-	--with-gnu-as \
-	--disable-libitm \
-	--without-long-double-128 \
-	--without-headers \
-	--enable-languages=c \
-	--disable-multilib \
-	--with-gmp=$(HOST_DIR) \
-	--with-mpc=$(HOST_DIR) \
-	--with-mpfr=$(HOST_DIR) \
-	--with-isl=$(HOST_DIR) \
-	--with-sysroot=$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT) \
-	AR_FOR_TARGET=$(HOST_DIR)/bin/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)-ar \
-	RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)-ranlib
+define HOST_GCC_BARE_METAL_CONFIGURE_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		cd $(@D)/build-$(arch_tuple) && \
+		$(HOST_CONFIGURE_OPTS) \
+		./configure \
+			--prefix=$(HOST_DIR) \
+			--sysconfdir=$(HOST_DIR)/etc \
+			--localstatedir=$(HOST_DIR)/var \
+			--enable-shared --disable-static \
+			--disable-gtk-doc \
+			--disable-gtk-doc-html \
+			--disable-doc \
+			--disable-docs \
+			--disable-documentation \
+			--disable-debug \
+			--with-xmlto=no \
+			--with-fop=no \
+			--disable-nls \
+			--disable-dependency-tracking \
+			--target=$(arch_tuple) \
+			--disable-initfini_array \
+			--disable-__cxa_atexit \
+			--disable-libstdcxx-pch \
+			--with-newlib \
+			--disable-threads \
+			--enable-plugins \
+			--with-gnu-as \
+			--disable-libitm \
+			--without-long-double-128 \
+			--without-headers \
+			--enable-languages=c \
+			--disable-multilib \
+			--with-gmp=$(HOST_DIR) \
+			--with-mpc=$(HOST_DIR) \
+			--with-mpfr=$(HOST_DIR) \
+			--with-isl=$(HOST_DIR) \
+			--with-sysroot=$(HOST_DIR)/$(arch_tuple)/sysroot \
+			AR_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ar \
+			RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ranlib; \
+	)
+endef
+
+define HOST_GCC_BARE_METAL_BUILD_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_GCC_BARE_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple);)
+endef
+
+define HOST_GCC_BARE_METAL_INSTALL_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_GCC_BARE_METAL_INSTALL_OPTS) \
+			-C $(@D)/build-$(arch_tuple);)
+endef
 
 $(eval $(host-autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
