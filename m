Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF19C021AA
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 12:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E812581EA1;
	Mon, 17 Feb 2025 12:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sz3_w9OZoCTU; Mon, 17 Feb 2025 12:49:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8EAC81514
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8EAC81514;
	Mon, 17 Feb 2025 12:49:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 74B5EDE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45ADC81D70
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5C9W5in4oIT for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 12:49:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::609;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B44A781514
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B44A781514
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::609])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B44A781514
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:49:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VM5tLoqANrdqM+GWnjQxHszhj5mKtv4yeatFXpEDPLPQjNanjQvuy7uSXpxAq2dqI5Q8SvI6S8d9m9CUXdt5TYNpN+dVmxx1w5Js+qw55zqvGqg/0mWDt3sItXl9Z8m6tt1EGHqfGtmCv60viWRzP2RVQIY7G3Mpccz5dAH8w9od8M2YqupHnGXWaa9R08MNmjyEPvbz54BOXrc5ddJvIXy8c6yUkhd805bhQ0W6kjzd8bJjsc9JiARB71MB4jqIeVdLbiCB1uTeiKpbUsyYEF61B3cqGNHf1FD64sgZQsnve/17C6clNb/ksBQXZ4N3o1qBrf11+io4ySkfCToJUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dUpe9qi31bxFDRlvKcFMMKKSc+dBOHNa2w30ku2mng=;
 b=whLwsq3kKfZ1weMzCzKeyet1E4Aoc9HO4SCOqQiTs7VFBprcoNEN45R4lC4wGLHxBhshYBuCtCEhZ4errGxy+M0MmDKrekBo2+bYTNtfwibd0S/3vOtHsImZuhp2JHadgJAJyFknAwge72hp4hZWhTP0mf+fjwfBtIIQBXazNHfrlcOyIdkeAU+zTfFmmFfSXT3gr0M3p8IPQu9LhbkyrJfRD6x5ljKjkBTXyqRsQIkIozbYApwO17ql2ezgUgdkl1EFrp4Ezx1kQcFcanqar7pYjvDIthWUH03j99pH8wVAsu+bfqBe7MlbgC5b7rqyKYfabcSVORqINa0lMJ5pwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR01CA0003.prod.exchangelabs.com (2603:10b6:5:296::8) by
 CY8PR12MB7196.namprd12.prod.outlook.com (2603:10b6:930:58::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.19; Mon, 17 Feb 2025 12:49:39 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:5:296:cafe::7e) by DM6PR01CA0003.outlook.office365.com
 (2603:10b6:5:296::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19 via Frontend Transport; Mon,
 17 Feb 2025 12:49:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.2 via Frontend Transport; Mon, 17 Feb 2025 12:49:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 06:49:38 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Feb 2025 06:49:36 -0600
To: <buildroot@buildroot.org>
Date: Mon, 17 Feb 2025 12:49:29 +0000
Message-ID: <20250217124932.2653445-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217124932.2653445-1-neal.frager@amd.com>
References: <20250217124932.2653445-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|CY8PR12MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: cef8ea4f-3dcc-4602-30b4-08dd4f518a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6E9Z7eSFE/BbXmXaOCGmbbnlfC57hWR0gxkDSnS7wsx4xettz03+mX9g1le4?=
 =?us-ascii?Q?HaxiTJO/n2L0EPUhFdDg0yTm5lEIYDA3QpYmX2SfeMyx3+ZB7pKB/NuSu619?=
 =?us-ascii?Q?+S/B3U5bkHvDDHBw5UT+dYW2ywuOPSaOrYsxSXO0q64gDN5aZvLI/tYaRxSt?=
 =?us-ascii?Q?Dme09LbSYUWi2voYQ8x8YB0yRLo+jewY98wLhcoVCHNDG4XPlVPfRmqoamRx?=
 =?us-ascii?Q?dl10/LwJ4/k8R5Gp0hGHUyUENc7lEUG+qtO4K8fwmKd6BDe6tnripbie71eF?=
 =?us-ascii?Q?GUzC9xYEcxSiuCJdYrMryLzGjmc5Ww2E7IBcfdq7DuvkIF2pYe3XgXtseo/m?=
 =?us-ascii?Q?L60ZnBDzMlceGB2wG66/mPJEjCYSVd8N/RvB+w7OA3s0Nd3aBER3UaGmopjo?=
 =?us-ascii?Q?J60Cfm4ictgN4gl4qoXtzvUE9Ne2OlgG3GwOFrXkxhQkR7zohoCU6zb70Nop?=
 =?us-ascii?Q?22wAOUg8hzV10+ZUSEeqIqeJdtWLqbnf0dxVbDZDrfI6fK1RMEU8KUPLQCE4?=
 =?us-ascii?Q?vX2Mxy4jWpFHcfW/ltgufpwZAs2mhM+jXl9f4VKxck8FVbsj8Q4ShLljKKK0?=
 =?us-ascii?Q?6PFfk3iM6bEwjC/TnHVEkNTp0iS+mSD48MifW0haPK8NL6DxG0+liX9DKuP/?=
 =?us-ascii?Q?k9Q8TTWJrnAPoZkXOlqyZChHzOu3ighNxWkHr5horkzqtWsvZUEOUK7XSNJk?=
 =?us-ascii?Q?1yQcyQ06a7CsJgvuF5uSzWgnJ+HPIE//9j+FlTOdQ5N7mNgshl3Hzvy95EiO?=
 =?us-ascii?Q?vOBMBuzr0VXe7dyPRIHQEJBuYmp06iVtpoT1kiHIBz1DEIX/1TS/AUshSf6E?=
 =?us-ascii?Q?/e8zwh7XtgHFYmRmTCv9Fn5U9Kc23jX6w6VcKsNbZ9Q7gOD9JNtfjmmw+W+e?=
 =?us-ascii?Q?vNSH6Cs2T25NOrN9yKk9//RH95m2AQRWTo4QZQB8C43H4ijkyg2xq0J72S9Z?=
 =?us-ascii?Q?l+vPBUnpjIhkhbLAcjD7OyrzW+TjVsDYjvbhTe+IQw/aF0W6tQI/wIYiXIOG?=
 =?us-ascii?Q?lOqR3gm94o27J5nol4+1hGQzHkUFAJXNxnteDXs6U4IFjrLo45HIlAjt7gY2?=
 =?us-ascii?Q?YKpH3KdZmTf44EgbCJ1EEEAtsPpjTBO0jelEVdiqRPuMrDGNoZ0vmwox4Lgs?=
 =?us-ascii?Q?iK4jQQynHpsQhqwMmScbFucPTx+7708inGXoad9J2TI/JlnbGWJRmBudaerd?=
 =?us-ascii?Q?blgBcSSGzbASb1tdJ2xp2oH0039XpToOsUTf7LixMeh44qqDuK8Sr2DNCHMS?=
 =?us-ascii?Q?pdO9ri/aGHpnJARVE1CstlRRU8xskc5rA7BpZAWYtElNKw4nDsvObFzmcF14?=
 =?us-ascii?Q?qkuKhktPvHVa+Lk+181F+qq54ysBESK/43GIXDPp3X+k3J+rNF0jPTzMt32d?=
 =?us-ascii?Q?navB6sXs+Y4EsFgC2XKmcjqZlKly9fdZyh2SZukjE55Ww3xjxIXRsJQywFf7?=
 =?us-ascii?Q?hdwAh2jJ/mYTO1g9z/9MrayV0olBkUZ0dBE+QBT+U5DcyQX3X2XmK/M+A5WE?=
 =?us-ascii?Q?fbAeKM5GORNSdDcWU6uBv1ZJw8ke3ge+OmGo?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:49:38.7849 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cef8ea4f-3dcc-4602-30b4-08dd4f518a5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7196
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dUpe9qi31bxFDRlvKcFMMKKSc+dBOHNa2w30ku2mng=;
 b=ceOOdpFIzZIph8x36MK8yc5k/UWYt8jyQs9e2vaFwk2+TmxpFxHLtZj1WpNKg/jQPfT6G2o41XrN0hR6Gqc/Pt9ZO9KD3vTRWdwRvfHRx4XRygwrI67NUkW9mTLz4ltyS4Jv8Sz5mMVCCan5EeVYJU9ELUst1cvIG5VzXeMsQ14=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ceOOdpFI
Subject: [Buildroot] [PATCH v5 2/5] package/gcc-bare-metal: add multiple
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

To do this, custom configure, build and install commands are needed, so that
each step goes through a loop of the architecture tuples in the list.

To keep consistency with autotools, all the relevant host configurations have
been copied into the HOST_GCC_BARE_METAL_CONF_OPTS while removing any
configurations that do not apply to gcc and removing redundant configs.

autotools redundant configs covered by $(HOST_CONFIGURE_OPTS):
	CFLAGS="$$(HOST_CFLAGS)"
	LDFLAGS="$$(HOST_LDFLAGS)"

autotools configs not applicable to gcc:
	--disable-gtk-doc
	--disable-gtk-doc-html
	--disable-doc
	--disable-docs
	--disable-documentation
	--disable-debug
	--with-xmlto=no
	--with-fop=no
	--disable-nls

Some of the configurations already in the gcc-bare-metal package also
needed to be changed because they were incorrect.

Configs Incorrect:
--disable-initfini_array -> --disable-initfini-array
--disable-libstdcxx-pch -> --disable-libstdcxx

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- corrected sysroot configuration
V2->V3:
- removed unnecessary symlinks
- removed unnecessary semi-colons
V3->V4:
- added all relevant autotools configs
- removed any configs not relevant to gcc
- corrected some configs already included in gcc-bare-metal
V4->V5:
- no changes
---
 package/gcc-bare-metal/gcc-bare-metal.mk | 60 +++++++++++++++++-------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index adaae6c307..7159dda1d8 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -20,15 +20,9 @@ HOST_GCC_BARE_METAL_DEPENDENCIES = \
 	host-mpfr \
 	host-isl
 
-# gcc doesn't support in-tree build, so we create a 'build'
-# subdirectory in the gcc sources, and build from there.
-define HOST_GCC_BARE_METAL_CONFIGURE_SYMLINK
-	mkdir -p $(@D)/build
-	ln -sf ../configure $(@D)/build/configure
-endef
-
-HOST_GCC_BARE_METAL_PRE_CONFIGURE_HOOKS += HOST_GCC_BARE_METAL_CONFIGURE_SYMLINK
-HOST_GCC_BARE_METAL_SUBDIR = build
+# Don't build documentation. It takes up extra space / build time,
+# and sometimes needs specific makeinfo versions to work
+HOST_GCC_BARE_METAL_CONF_ENV = MAKEINFO=missing
 
 HOST_GCC_BARE_METAL_MAKE_OPTS = \
 	$(HOST_GCC_COMMON_MAKE_OPTS) \
@@ -38,10 +32,15 @@ HOST_GCC_BARE_METAL_MAKE_OPTS = \
 HOST_GCC_BARE_METAL_INSTALL_OPTS = install-gcc install-target-libgcc
 
 HOST_GCC_BARE_METAL_CONF_OPTS = \
-	--target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
-	--disable-initfini_array \
+	--prefix=$(HOST_DIR) \
+	--sysconfdir=$(HOST_DIR)/etc \
+	--localstatedir=$(HOST_DIR)/var \
+	$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
+	$(QUIET) \
+	--disable-shared \
+	--disable-initfini-array \
 	--disable-__cxa_atexit \
-	--disable-libstdcxx-pch \
+	--disable-libstdcxx \
 	--with-newlib \
 	--disable-threads \
 	--enable-plugins \
@@ -54,9 +53,38 @@ HOST_GCC_BARE_METAL_CONF_OPTS = \
 	--with-gmp=$(HOST_DIR) \
 	--with-mpc=$(HOST_DIR) \
 	--with-mpfr=$(HOST_DIR) \
-	--with-isl=$(HOST_DIR) \
-	--with-sysroot=$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT) \
-	AR_FOR_TARGET=$(HOST_DIR)/bin/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)-ar \
-	RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)-ranlib
+	--with-isl=$(HOST_DIR)
+
+define HOST_GCC_BARE_METAL_CONFIGURE_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		cd $(@D)/build-$(arch_tuple) && \
+		$(HOST_CONFIGURE_OPTS) \
+		$(HOST_GCC_BARE_METAL_CONF_ENV) \
+		CONFIG_SITE=/dev/null \
+		$(@D)/configure \
+			$(HOST_GCC_BARE_METAL_CONF_OPTS) \
+			--target=$(arch_tuple) \
+			--with-sysroot=$(HOST_DIR)/$(arch_tuple)/sysroot \
+			AR_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ar \
+			RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ranlib
+	)
+endef
+
+define HOST_GCC_BARE_METAL_BUILD_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_GCC_BARE_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
+
+define HOST_GCC_BARE_METAL_INSTALL_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_GCC_BARE_METAL_INSTALL_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
 
 $(eval $(host-autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
