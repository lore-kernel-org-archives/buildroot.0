Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87D2C021A6
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 15:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 807C36FCC3;
	Fri, 14 Feb 2025 15:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rf66jjKNJ_N; Fri, 14 Feb 2025 15:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 700CC6FCCA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 700CC6FCCA;
	Fri, 14 Feb 2025 15:30:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 001E11C6
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 15:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8E1741702
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 15:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mp-_z7EkBWfH for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 15:30:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::614;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA753416E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA753416E2
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::614])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA753416E2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 15:30:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMf8wNhbBgpjxdr8VvF+BuOzbDoJ2WZRLS1cTumTxWjsv9PbX5AptsJuojMIko+Sj0Psh7BNp/N2TpJam4fObThIZf5zuRCcQa7P91bC3iwfEKIeRDjZ7NrAQwpFhDkG0gNWIQ/kmX9O1DaUK2WNg54y/uEz6UozOYxxbfAAEh2Wt9CMyrjABm4VKmEKUqzakHB3sgrOyo2Wceo9vJ+TLAScCAoLFVw43nGPcttanuPZ5LwMvaTMK1E4dXb6bucor9TKtVWY3F+5Z2zr+LzVEX9hDC9VR2tsJieu1QDU2tJz1k3jKgTj7DzK9NHCxp4xhGwnSfQ6iTs2wM4PM720qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a94hxuPiG4sGcf7iUxrt4wReMOPHIR0wpP01pLmL7vE=;
 b=xy5R2pIjf/5f8JO20xtRsQEPT5OESgXA7cZeYsvzYVc7bz/9CpFS27RxMAGeiUHOsSk5OvAFzDTbemIeXxvY9WB1Zi/xa/el81dkYrrqwaL6kNOPtJkP1atMBgBAMLBJX4ho2l8zrtg2NmWuSRAW53xanm1DEx2MqVlOBnBInmAw2vByzvyfXedhWNwDDv++5wXh2StyRJMC+49eYCAZtIq16WtmlxCDJMQ8pggsJopNcWceVV5PD9uy8OnVKGv30nlaVFR5ABovY0iT3tGG8/nJXD5pwPpihhEO6HM2O2LH+aQc9xyWYnls7oC814iLZYPMzMVSHFXBya+Ooygeug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ2PR07CA0022.namprd07.prod.outlook.com (2603:10b6:a03:505::24)
 by LV2PR12MB5775.namprd12.prod.outlook.com (2603:10b6:408:179::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 15:30:27 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:505:cafe::ee) by SJ2PR07CA0022.outlook.office365.com
 (2603:10b6:a03:505::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.15 via Frontend Transport; Fri,
 14 Feb 2025 15:30:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Fri, 14 Feb 2025 15:30:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Feb
 2025 09:30:22 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Feb
 2025 09:30:22 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 14 Feb 2025 09:30:21 -0600
From: Neal Frager <neal.frager@amd.com>
To: <buildroot@buildroot.org>
Date: Fri, 14 Feb 2025 15:30:15 +0000
Message-ID: <20250214153018.762783-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|LV2PR12MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf473e3-1f54-4ed5-6785-08dd4d0c7fdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/5YDYUgQtSCV/Tv6WPcnXiJCfRzE/C9NuE64DummbICrogIvHSZut3+5BTLO?=
 =?us-ascii?Q?VatvlYWBAOdejkvy/htqG+/mka7M7UnORMuofXYhtklvBVBmB5OWzjVTS7mk?=
 =?us-ascii?Q?Mo4pKpszWgaJwOYbiK6rkIas9mqj7VgEGYqCIok/u9gxUzZfApW7JnLXvkQ6?=
 =?us-ascii?Q?hbbEMEm3eiSD6j3tVgeW0Ul8w51y5A3oISnsbmcIrMnybfavjtK/lQJiEUk7?=
 =?us-ascii?Q?juHuGpeQFgP+QJFXFKrFvWFkEmmHQw+SU2d7x6Xktlpzu6RfTstw2lIoalD5?=
 =?us-ascii?Q?VXp2SAoy9gDCVWqzTYoSDiw4Ico9vNLJ4Qc7VjDHhAlcUquH1pjeGV8etEqw?=
 =?us-ascii?Q?GO76cs81ohlyeAQai17ySjoHSxlwNynzBFk9iFoAzv9A2H5/0/0NSuLQKCbj?=
 =?us-ascii?Q?Y7rNS03WtgXrghGKC+hxKwLGkfEOTH6sHRT+l43EOaPhI8+czpejXgQnKgiX?=
 =?us-ascii?Q?bEqnJEtimGJHP/jOnWpAwWkbBEvuIJedPP3WfN0zzXVAwIhEJp5sB7KbUqPC?=
 =?us-ascii?Q?76WJJ5t5Aat1ylBftXXY+QKu1YTrfiXrFsCi9ofACLB3bWezGKEtWeiB2wHo?=
 =?us-ascii?Q?RZKxHBAkrhtnfZ63LddFCn+a7Xhlh5fUypJ4rYxk6fvDbe3VdDAk3ZvKLfyt?=
 =?us-ascii?Q?cPybRgrdrhVbbbmzFguqL88QPVGikIsX7DWziAM6LfK42WtW7Dpsgxu+Ia2b?=
 =?us-ascii?Q?rRZG2tutWhifWJeJd33eKjPEnJ8eabLjyPY5sdoLpOEQ+1UsJ3JVX+NQTNR6?=
 =?us-ascii?Q?9cbtSOldRkp+JMK4AVHSMkqVCC+HoVi9T838abLna1Ad+rqlUTVYtPRihMqt?=
 =?us-ascii?Q?jkYTRJ2H7PrwNqOYRNd4OcbyodftksCMfyIcMcWVx3Bf6tpTtm46WDRFv0ZA?=
 =?us-ascii?Q?5ZoWiOAbEatnR9jbDSYP7Bb1UWCCQM8ULMgmixEFo6TzU053xJbsfHn0TklN?=
 =?us-ascii?Q?geBlgRvV2jshE6Nf5R7xkr3jtAFZ+IXtMUfxaVfR4vhjgiQsyiiLVU5yYZD1?=
 =?us-ascii?Q?Y+olZJfs4T0UiixS3vrzcy+v7m9JzPysgB7ck2B++9Myb0DF+tNJvCrdi9AA?=
 =?us-ascii?Q?r5O9GrdULk6Z94c6Qt30MJLIIEkCJWSf234FWPHEKo+/YEJi+KKNhUqmwZ17?=
 =?us-ascii?Q?isR7WNeSUW0eyjvxbAvUmIYKR/CiIgIxvGIhKvUjdV2kvzVahU8gKego2vf4?=
 =?us-ascii?Q?8x86WXTMSNucCBjFPLK7emh/mC3ND/SMojBk24jWcpa/yv1RLnjCD9PPW/6e?=
 =?us-ascii?Q?VWorWYdd7mLTsBhzndMVzQ3sUtqt9bMTSaL1DYxjAliXr9uqbGD35A7m8p9G?=
 =?us-ascii?Q?9FdmJAseU1GcFkyzsOVmSIIWu0WPU7xgmEClFQZWoZT1DKf5XY3gb+a4gyhc?=
 =?us-ascii?Q?Hv2vee8l1jnuEq77U1r9cIKc/gS9RqY/t8oxMddWKjJXQlIE69LcVs/d6dBa?=
 =?us-ascii?Q?FbKyfL8H3gi6lyoO0gPpStVR0rtIK3++fvGwvKmbvH2db5MAGE1J/wDo1xBN?=
 =?us-ascii?Q?cxwYxAvf3d3isILL6/Nx0kRI5QH3wTp17eeh?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 15:30:23.5012 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf473e3-1f54-4ed5-6785-08dd4d0c7fdc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5775
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a94hxuPiG4sGcf7iUxrt4wReMOPHIR0wpP01pLmL7vE=;
 b=o8UfJNchxEV3avZ7GJ5OhdTEcgKTtW0VVGJEhMHA+GOahjrfgg9GBJICHY1m33JDJiQYE63u0PyEhRYJl9g+aCJi18sjUZwl+08JGhT/ZC4BFGBhO+9xZ5lRk2kvhTvPnx9UNYgTA7BGokVUjd4VIYszUoIRZD+4TZZ5P56VbUw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=o8UfJNch
Subject: [Buildroot] [PATCH v1 1/4] package/binutils-bare-metal: add
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
