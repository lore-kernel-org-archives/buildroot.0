Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B851FC02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 16:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E73C419B4;
	Fri, 14 Feb 2025 16:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gv2UivCXrOWR; Fri, 14 Feb 2025 16:54:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11FB64126A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11FB64126A;
	Fri, 14 Feb 2025 16:54:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D791C2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 16:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE5AD4126A
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 16:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5m7Q0lJnR8D for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 16:54:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::620;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C7EA3408CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7EA3408CA
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::620])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7EA3408CA
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 16:54:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmAmvde/bXaJrY2oYACzn5HBismA8T/I7ciy0q81Vn4ePKE2W2p2DQinF8GDErzWejm137F1WzFPtJUP9D8vPYYvRNrBZY9/06Z0eYAeJzQQdGJY5fdbErpgqyxTAzS5nDR3mlIwUBGTzRsDBhcqUqFeTWk1j9jv5eq9GEd0qliaW44gbynqct2fZDYQlfZ2p7wbUMxB4n9OY8V7ub0PBCgr1iDza4kEl6u4xD0PtSW07g51YOPJ1SwjNJfvGu6PTuFQbcPqfwHVjfjqRHqwwtYZgdno3iAYNpBO//zdN95dK54FO2YnISfWB3rFG8K2CXI4BQyAljgjCciJGzjsgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNYRd4tFSGJ9e03alCSV0kM7G6vFH9NkCA12ZHjHDZc=;
 b=ZU7na18y7D0LaTWCvnWC8AZYhwJ5w6LEPFLeulv76k6ETAsboK4OSol3LdZdteoFVE2TMYcDejFSwf31bfIORO5ms81JUNofjLDJOwpbw6C4k67wD0+72lOr09QWsNViuIH73fIs4sektNVeJA94LKBPfKAQoSuUDD8UL5h91PeytLICxA/fHPFIewS7/yiDBoBsOzFddzkST+DtrgJidfOC1QQk83lD5FXXX0nhAfmbgQOk2ih7EzN30voOaFNH76kOMGoeEK262121Jp8SbdbM9G/uKa94ilWDK8yDYY88Tp91u4xB6MCdPwM7y2hVbnpnCwBjtKb+U6cNgQSvIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0099.namprd03.prod.outlook.com (2603:10b6:408:fd::14)
 by DS7PR12MB8291.namprd12.prod.outlook.com (2603:10b6:8:e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Fri, 14 Feb
 2025 16:54:09 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::ba) by BN9PR03CA0099.outlook.office365.com
 (2603:10b6:408:fd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.13 via Frontend Transport; Fri,
 14 Feb 2025 16:54:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Fri, 14 Feb 2025 16:54:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Feb
 2025 10:54:07 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Feb
 2025 10:54:07 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 14 Feb 2025 10:54:06 -0600
To: <buildroot@buildroot.org>
Date: Fri, 14 Feb 2025 16:53:59 +0000
Message-ID: <20250214165402.1128194-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|DS7PR12MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: b1eef447-dbb1-4671-8713-08dd4d1832bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/jYsrYBpAnHwutU89AXYGvMVvScRdr3OirPuVyCgzrG72wobluMw44RzVI4m?=
 =?us-ascii?Q?V20eNwdVCg5xSIduzkNAiOsLuWVrfEZ94kYJ73Ckq+OfHDnjcYfFfRC7VNUZ?=
 =?us-ascii?Q?a734rpova/CCWEQIUForDQMSlf7fT4Ii4EVaB8ymsxjujof91/vx21QUds0/?=
 =?us-ascii?Q?7jRo7ECMCh1Sjox3iHR7l81vdW31cu0eLa451DTGxeqk6OnmHBv6nJDyuNbo?=
 =?us-ascii?Q?+TI81tHOp/RbOlwl6YJ5PfisLqQfdveqnwxJVyEmNbjOrNymDGTrJrtGqgFK?=
 =?us-ascii?Q?AcpQ0nTUpdbFAQ2ql+ZDro7GnDVdNd31ZXjvxriU7alGYs4NNhstvglU4kYH?=
 =?us-ascii?Q?P3xrdjPLFmeGQSjTdGdBblKH7GExmKjBZ5adaRJ+gVbAGLWKxqBtYeqc+WT6?=
 =?us-ascii?Q?lDcQQCastyXLJtyBrXSsrMo2r3AHD/kAKUfAZxkyJ2WycoC8XQrhdbiC8M8R?=
 =?us-ascii?Q?vHK5hiNVp+rtgxtkE2lAEuHk6dCuT9ioND3FC7SMkWLRtmHkD7xyqm8bz6in?=
 =?us-ascii?Q?Rwxamq/YXQEr6vcKm/PyvJf483LefKiQKupQ3nXhajSc3NaWM8Gq9OS982DD?=
 =?us-ascii?Q?/GadF/tjjuKRPN5YNIAnlqIg5o/6oFMiTBQlVws7BTfLFHTOLcvZ2tEBUOuz?=
 =?us-ascii?Q?aQbq4YMbpxgYE4mCIYF/MpgRG9ZRY2aF7X+0GzERaMSqVmkGn0XWcedtYb9N?=
 =?us-ascii?Q?yczIz+3usJwaIhziBi1pEPWECIOh6zzeiU/UaxMOLq9C3bRG9PW8J3uKI3bd?=
 =?us-ascii?Q?n1nDnlEf0qZJFzUGi5j0WJxvpLQ1JOYppuH/ZolmFcqYM2yW9wZPxgVbFdav?=
 =?us-ascii?Q?kkL6pjf2TI+mZ0HBGJRrQ+epRdJYqyXPnmAmag4QPiAbmysthcQG4MXvNusF?=
 =?us-ascii?Q?XCVTRR5CA/XKzuwmKjy1OZ82wtBaeVcDr4XjFvt5+pQFXgeJ1odRlN/mWoBK?=
 =?us-ascii?Q?zXF0e6AQPDhnt2fsJnNTIwiRzi9CVplMKYeN5FTsSFtN9KW1ApfcKpa8t9L2?=
 =?us-ascii?Q?26NnWGr7rSJX4ySumQ1EJI1biGGh+fEeqxYsmLsNTKVXCMxjS50GDD4o7jb+?=
 =?us-ascii?Q?J8MbHrESLU/bVcY1MxlTgJh/frRi5IDLljymQpQEvGGrTfpaTH+KU5P4g5pT?=
 =?us-ascii?Q?TvOYTZqG7R6q4iJmtLQerW0Ha9Y6mw4JO/7VswZ4Bwp3Etz0kbssW9x7Ht+f?=
 =?us-ascii?Q?XVCdcQazzqNPC+g+1MLpR5An8IbFeSxBZ/p1LLCx4pqBbJmhsQH3LSti7P8D?=
 =?us-ascii?Q?QeL4CDqjHzfbmAz7kaDpbjmZ0UQ141RE0tNmAV4i69ShaUq8HeRyFK6+lret?=
 =?us-ascii?Q?5y3zJfs7giJ6vSbJ+EIJyXR6vO1cPFZ5WEVzTkqQFAL64iF1ku76oW/qD/uY?=
 =?us-ascii?Q?O5ipI1X8WxeTRYZNPr3/Y3MUC0ozgpg+0GNl5YhA2nACji0Z+q9+J8sqoQeF?=
 =?us-ascii?Q?JE8nuMEpq42gmxoQ6Rph7xIED6gr/7heoJ9m8l/x6d9qLKMd9ema87UoxZep?=
 =?us-ascii?Q?lEVL31xSyrsH+lx/C0CgruO5b8L28wMumS+i?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 16:54:08.1401 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1eef447-dbb1-4671-8713-08dd4d1832bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8291
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNYRd4tFSGJ9e03alCSV0kM7G6vFH9NkCA12ZHjHDZc=;
 b=pW/7GTz60JDWHfq2JelNv7jRE2taeLsyRkSlhTdAawmOckSizOb8Knfh3hUKSoQ92lFoyfHLR8BIZ+751KcWkNK2G0MHr8rpTDSfTEbwUeMpUuPEuVqN6VbScmXXxnbgIy57cZzeVkoyInR+5Kmp8uc0XxtmPVeCP3q/8gawkPY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pW/7GTz6
Subject: [Buildroot] [PATCH v2 1/4] package/binutils-bare-metal: add
 multiple tuple support
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

Add support to binutils-bare-metal to support multiple architecture tuples
with the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH string.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- no changes
---
 .../binutils-bare-metal.mk                    | 61 ++++++++++++++++---
 1 file changed, 52 insertions(+), 9 deletions(-)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index 3525e9fdf2..0a90560471 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -21,14 +21,57 @@ HOST_BINUTILS_BARE_METAL_CONF_ENV += MAKEINFO=true
 HOST_BINUTILS_BARE_METAL_MAKE_OPTS += MAKEINFO=true
 HOST_BINUTILS_BARE_METAL_INSTALL_OPTS += MAKEINFO=true install
 
-HOST_BINUTILS_BARE_METAL_CONF_OPTS = \
-	--target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
-	--disable-gprof \
-	--disable-shared \
-	--enable-lto \
-	--enable-static \
-	--disable-initfini-array \
-	--disable-multilib \
-	--disable-werror
+# to build for multiple arch tuples, it is necesssary to build out of the
+# source tree, so that each arch tuple can have its own build location
+define HOST_BINUTILS_BARE_METAL_CONFIGURE_SYMLINKS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		ln -sf ../configure $(@D)/build-$(arch_tuple)/configure;)
+endef
+
+HOST_BINUTILS_BARE_METAL_PRE_CONFIGURE_HOOKS += HOST_BINUTILS_BARE_METAL_CONFIGURE_SYMLINKS
+
+define HOST_BINUTILS_BARE_METAL_CONFIGURE_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		cd $(@D)/build-$(arch_tuple) && \
+		$(HOST_CONFIGURE_OPTS) \
+		$(HOST_BINUTILS_BARE_METAL_CONF_ENV) \
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
+			--disable-gprof \
+			--enable-lto \
+			--disable-initfini-array \
+			--disable-multilib \
+			--disable-werror; \
+	)
+endef
+
+define HOST_BINUTILS_BARE_METAL_BUILD_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_BINUTILS_BARE_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple);)
+endef
+
+define HOST_BINUTILS_BARE_METAL_INSTALL_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_BINUTILS_BARE_METAL_INSTALL_OPTS) \
+			-C $(@D)/build-$(arch_tuple);)
+endef
 
 $(eval $(host-autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
