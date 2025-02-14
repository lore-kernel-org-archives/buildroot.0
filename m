Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9419C021A4
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 15:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3E8E6FCD1;
	Fri, 14 Feb 2025 15:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWi7y9R6xAxK; Fri, 14 Feb 2025 15:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 222CF6FCD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 222CF6FCD5;
	Fri, 14 Feb 2025 15:30:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4286F1E3
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 15:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3264A849F4
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 15:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nskjrnd0wdAS for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 15:30:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::628;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 58E66849F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58E66849F6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::628])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58E66849F6
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 15:30:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ReHT/5zcBJSGkCRTa6G4gF07C/vCNUgjShWusTa2SNb7UellgYdWQedqSa48wftUa/jeA4+ZMbZTxMkuMYWgCjFM+le2jS5UK6Ivt+sIckvBt/TOc+xn4lUuaQzqHLLKe4AejU/Jbvi2x3XA2PLJdJm6hJ5h89KPk23OLPfvbFd21IZohNoUlb5aEEetxlvdyfuzCixWJFXo6xpf+o8NquuJJXUqCP8GCn00v9Z20HDIaxcTSm5YpdC0UJVyb3Hu5kDylm+UnKB9NsImni3HXtRtm2I5/u6IScnNYE0He/JbhXB/SgUT0BUgDM7x0V7Xo3L/zhx6V5s1wZpjnkv0bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pghVn+6Uxl8AqYsLSuC/3ClMr9IEBMhYGP4VuZVmXRQ=;
 b=HkwIfoEgTCqxEpu6a5CQjhkACei+x5vJTDbOIHlL5fIOKFbDMtkn2azgrjptCflRX7tuToXYWtLx6TH+6l9G6PmdoHkcXHVru4jbN7pmY3JK7k+m/QbtPXi/QfvZG2to7hKANAg73vrx65FjlyCDBYglCTW5BxlgYStgQ66V4Y5kb2pwuarc5c+txJpO35QLhuVPQH+eGLeIIDcgjXppyzWoMarCZI8VU8M120EPC/g8bmfUocrrJEwt8Kx/zInjSwUiZFP8o9SOKEgp6TARENOwncQIHAMk+a7weg7DPAG5KrkEUQrXUq+WS+5Da6xGZrv9DVGjJ9t+hFBUAo+1hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR05CA0160.namprd05.prod.outlook.com (2603:10b6:a03:339::15)
 by DM4PR12MB5746.namprd12.prod.outlook.com (2603:10b6:8:5d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Fri, 14 Feb
 2025 15:30:26 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::65) by SJ0PR05CA0160.outlook.office365.com
 (2603:10b6:a03:339::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.8 via Frontend Transport; Fri,
 14 Feb 2025 15:30:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Fri, 14 Feb 2025 15:30:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Feb
 2025 09:30:24 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 14 Feb 2025 09:30:23 -0600
To: <buildroot@buildroot.org>
Date: Fri, 14 Feb 2025 15:30:16 +0000
Message-ID: <20250214153018.762783-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250214153018.762783-1-neal.frager@amd.com>
References: <20250214153018.762783-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|DM4PR12MB5746:EE_
X-MS-Office365-Filtering-Correlation-Id: e723767b-4a41-444b-8130-08dd4d0c80bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CLlCJsdmEHTHWPZakn8hVawIoVznUB4mUBMbE0tSASE8rBippd9DJevO5jKD?=
 =?us-ascii?Q?56KMxAfOE65vXLo87jWhCBba38HJiwFtS+FCPVC+EpdD9enoQg/kVknoHaaD?=
 =?us-ascii?Q?ZyhI/LFsjUJpZtOi9+iBHBgqIYheQ1kaRTacEGJ95AmaK+msshkhh0t6GVLv?=
 =?us-ascii?Q?DOL0/Wr9kYWnfRkXq/V/202u5OVWFMLjG39WN1Ul7R5n7NILzAc+jNFBFwUu?=
 =?us-ascii?Q?NB1SgnVoW5qIDzA2FqkmQlc02R0sjCHtaF09pI0m4H+pnHc/ImXVVFb5u6I0?=
 =?us-ascii?Q?v5uFa66cb/VeIibZY39yNVKMNgrE2KYSux5K1xfA7fUbNdEit/Eg4EtFdHnn?=
 =?us-ascii?Q?5tczWuO5xNCcrAjTZ0JxM8kuESvUYZ7N+s+VojZw/o4TG+eLMCynUPUMDRAQ?=
 =?us-ascii?Q?t44Z8E6VPONhwIlPAN99N8N17yTf7XunYctfOkWVG3opmiYzOCZhKS2ekSyC?=
 =?us-ascii?Q?3cFXw1Ut+O8fgJPGmj1coiiqalCkUbXPQVQjv/IwIUDWqDVQ5DgjfXJ0NjUr?=
 =?us-ascii?Q?qXvpu/0+jZv+Aryq1mzcrYmt3d4Q8Mkl15KvGMhpGdmrrvd/0ldjUFvAFG2j?=
 =?us-ascii?Q?+5CGAZU1sTT6XhacgvF1ANBH3ZMYJnGA3faG4CBXpCUnFqog1UAHIYJ2in3c?=
 =?us-ascii?Q?/qZ5by143fN5IFu99rrP+PA10liEsgytLlE/r/P9JkxGegf1sZynBrepa7tK?=
 =?us-ascii?Q?uKGKrhFmJjuZaRMTXkBRgIuZ0hZ5JtPgB0i+HLV/xxrIhnK72hsFRSWv8Vys?=
 =?us-ascii?Q?AWSWAy9JfZBJ0aWKyK+HuSUZmyNY3ziTfmPlwg4hqdGR4Ovj5/uPfYKN02ol?=
 =?us-ascii?Q?sUa0wWdDTomuOSPf/fiamuIYbagRmsGX5XwLoDdxFOYE3HHQDaAmcjF+4fyR?=
 =?us-ascii?Q?MpbE+H0Mmu3UXyXO0QNMTWcve+iC5p3DAa3pJuGoYeX58eDIQS2n+wCkogbE?=
 =?us-ascii?Q?4jjRFSZFloMNwodrMHRXFDD8n62IFcss7UUHMBnohT1fBGQKR4VrGqRRUuVW?=
 =?us-ascii?Q?oKNRVTcSOsCvCCaXVvpXqqePzeG+6WjrkG+XpJDzG3UZjNS1JsURnV4aSYGj?=
 =?us-ascii?Q?LItKcTpTm4Bqju6uGOqrvmmUHZvLjPeKonj8G3T5hP4qiIAwaF4c12dOtKbk?=
 =?us-ascii?Q?k9J0icr8aDDboVe3bE9rsjay9ckr3o8AowUMTub94GC0P+UIbb7yQSc/iLND?=
 =?us-ascii?Q?DHvJ7v3Unt7qaViWI+5Cohy8ldAGHUbuXmmaoErVqMI9jrevQsiI9QoNQuvC?=
 =?us-ascii?Q?gx6q23bI+a8Wb8ypwVpcc/sJjnYM20Xkyfrspz2S+Ztfk5kynrloMPd7E1uG?=
 =?us-ascii?Q?V9GXsEilNhhcd8zOoq4COUqkcMSd3+cWUcpGPoEQqn3paJZGGYgAFy30guBL?=
 =?us-ascii?Q?6CIpBbOFyxEUR4IPbD4NxeJdVv1GBoKib25P0vygnDw5DL/NJyZnRwtBItUa?=
 =?us-ascii?Q?uKNNNAJMJEDjPhv3x9aeOgKTSSWUgx/l5tqi15tc0ARkiy1fSeLku8LdrUBI?=
 =?us-ascii?Q?C+MXFCfaTURq7EVkRvwvLIc1J0/vkOmiD66X?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 15:30:24.9699 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e723767b-4a41-444b-8130-08dd4d0c80bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5746
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pghVn+6Uxl8AqYsLSuC/3ClMr9IEBMhYGP4VuZVmXRQ=;
 b=vOwyBmqxVRSqFf7GdVEljIFRXqdfIw59gejW6hzOxFqjnItMeBHLq7GiWyrngrBKcJgtu8HocTxbsRqcVYd6J3KlGwfnR1SX7vazxzP9TESF0QtbZD5uGQOa1ZyedOv1Bl7PCYRnLUKOYb++KGNQhEcTxWJ5jCOqoUdVtOGkJbw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vOwyBmqx
Subject: [Buildroot] [PATCH v1 2/4] package/gcc-bare-metal: add multiple
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
 package/gcc-bare-metal/gcc-bare-metal.mk | 90 ++++++++++++++++--------
 1 file changed, 62 insertions(+), 28 deletions(-)

diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index adaae6c307..c0b8499a86 100644
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
+			--with-sysroot=$(arch_tuple) \
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
