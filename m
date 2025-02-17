Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25F3C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 12:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE61560EDC;
	Mon, 17 Feb 2025 12:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qPts2pMRDz1c; Mon, 17 Feb 2025 12:20:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61F0760ECE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61F0760ECE;
	Mon, 17 Feb 2025 12:20:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2AA2DE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C71DF81232
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMulttfAkZ4h for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 12:20:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::61e;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7357D8111F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7357D8111F
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::61e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7357D8111F
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:20:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9pMSPLm3AGSjOvPUGlLMumjS9IMGWrefdDPrivFkOe1udkiV/pFy5xUK/cEZ+cJgyeS2e0AlCSAQDNDqYoNcfXyCYZ5YRKTZUcygdSb67vhKJxYkbAPDcOSSkaqBsP3GOuOU7f25Yf/UNIl6rx5jeetuLadTjW3DuT6uz35VYz8LUFymqfBw2VFM6+zNBnRHVjx5w0EcaZE2NAIbckBZY06QWL/wtKB4dC00PVNo7WAgGDWFYpmym/EHYDrCy84XRg3cXuWVnWMZdY0wgVCJecRTeNuXnhUwoIi0rOIbhfVQlo+Ft/03Zgkf9qKtlbIRD55KN1Wy9SsaM91gEcxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vF6pIbrZciRVYY5EvCJ72ixJ6//akd1Iyh+sLPoStFw=;
 b=HmCTSEK8WjXTwY/POsFMyhx477ful+ospbbcgEsQ6ctOz0SJgv6DgoX725m/A13mHu4Ry3+qBbl1aY2YN/62J4mbP93VwrEk2NELO5SChqSTIiJaVIf0QWRkWJccs4YGph4mQF1kVb4NW/eci6w6e0Z80OhieFhp//a9Q//Fi0cViIv4ftanj5kYB+6ExCaqrXh2Kg1Q+VLDflFK1VLXiWDEBS5JlkEr4uRacWNwmHw9mi3s9tq9pcguiOwwBWW+az4O9X4BGN8vBEcN4R/bpDCLvoJwJQcTvaUYofXNQx+40OAIV1Qb2PD4zI+4tfoOyAfRExIRCKKrh0MNU8hXeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR20CA0020.namprd20.prod.outlook.com (2603:10b6:610:58::30)
 by SN7PR12MB7786.namprd12.prod.outlook.com (2603:10b6:806:349::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 17 Feb
 2025 12:20:00 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::a4) by CH2PR20CA0020.outlook.office365.com
 (2603:10b6:610:58::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.18 via Frontend Transport; Mon,
 17 Feb 2025 12:19:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 12:19:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 06:19:58 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Feb 2025 06:19:57 -0600
To: <buildroot@buildroot.org>
Date: Mon, 17 Feb 2025 12:19:45 +0000
Message-ID: <20250217121949.2614857-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|SN7PR12MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b5c41b-c413-4804-e59e-08dd4f4d6588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q6zuNp4eV21MSVwExfysH625mdIhcrqwHQ+LEG7nm0A/pskcnhWUrZfVBy2D?=
 =?us-ascii?Q?GKHkSyIVtaqLowKhkjzjkL6PtYnapa8X40WO2Q5wqZakvaMrcct41NJXT8Tn?=
 =?us-ascii?Q?ZkxGkrEhjOnP7s7k3QKZaij6E150hZnYJ4kK17XYZJhLhFKN2Tbd2vkmt3X5?=
 =?us-ascii?Q?GRWPiZKgFQJE4hiaF4MswWm06hGOwbma90YaqbPPQ43q3R3nz2dX2vJY/V1n?=
 =?us-ascii?Q?qj+41uMmpRBcPZnr/e8fXyL5fPagrEtCn2Dm4RXPwGYr7+ks54Tf1arz/3Ks?=
 =?us-ascii?Q?BMayuOp3hYLSRjN/YbL3ndhh6K1FtCker42ReHjsiTz0W8Yrv/qSd7q7jlUH?=
 =?us-ascii?Q?Rd82xydEAQIWwb2RPG5yw7AY13D795EtlbaulEBnp3gRsz5NsZyK8Dc0iHPD?=
 =?us-ascii?Q?X5+khMxgeE/kmcrFAbCmwbc4JSA+H9CD8wwI5JBN12/yxT1IBqVXPC6ruV8j?=
 =?us-ascii?Q?nwFfWdXMXgHFepb7SCG4nnBYpifIShzQWm5SSyp7o4N/N3H7CwiCUpx4zrve?=
 =?us-ascii?Q?6E0rIy5SSh6acWgSeL2saZv3yVndXfL/y2+/F42ntQ3u4OYPhiGO5gMyeWm0?=
 =?us-ascii?Q?H/k5BJL3aOalPFljxKvlTtSALEzoK1XtTPvtEeMLz2rsH7Bv3SUua9l3FBFf?=
 =?us-ascii?Q?GX8E6ElQlFXZZgnoi33ROX1byZlw0yCxt8CKOeoDa9xY11m4E+uWjiG+D0m6?=
 =?us-ascii?Q?QznSbAiVB9LqU7QB3UcBIPPGnRrdQXT8MdT5B2xgvIFZ4Uy4qwDXDiF6Z8FY?=
 =?us-ascii?Q?q6KV9DhDxhCM1gn3eVxWksl31RLwb7M4knNousGNci9KY5WoyytHLtI3bmoU?=
 =?us-ascii?Q?CopJWYUKANGnmAgzvE6lUAp6yLmqMBH61EPTGFyoXHefJqp8qHE3bZSNmxYI?=
 =?us-ascii?Q?cJ7IVI6gLaSVMdPptlSfcyAuTtY9QRSJ0DDoUeOvTmKiNC5LjCm52TDGTZ2B?=
 =?us-ascii?Q?EADQMI+BJCND+SM9ep3ln9hV7WmWknwCBbkJDnB4vhwJVs/Uz+/dMezYnyvr?=
 =?us-ascii?Q?GFxeR/BXnI+RLoXybPsrpEBrgqoqGLLEcAqTnTwIJwy0w0A/R/QgQV9nDf7/?=
 =?us-ascii?Q?rrk399zF52N39eeQjIsJoypq7r2uvrPB6iUZF6UZRrkewtjPrbyH6L57xQT5?=
 =?us-ascii?Q?9fNV5iUp9dV5d+aQS+3t4OJeLskhGzFG9V9dTa3fu7ycGGTZsqMlSUQpL71M?=
 =?us-ascii?Q?CflECVsKWXWpalGe+6ivV4Bo4MdwKDhYV9aKvGI1tdACJwujv7zdaJhc5y7x?=
 =?us-ascii?Q?0Pt9phtrLPpI08Wt9xcbmgOn5Fl89NFtVhuTwX1fpnh2SrpFwZ4nzWabGasm?=
 =?us-ascii?Q?FOQCZOKh1/SVBJeH/OMPrf6i3gQaAIEdAESjIeaN7pLz1EDQVRRADsl6ubI0?=
 =?us-ascii?Q?epUm5phbN6LrlJ4oz6fWqKgb/muh9pjD3ISFZJVNyr091Mx7d5q1wGoMyaij?=
 =?us-ascii?Q?cqLHpRAzkR1kwr6/hMsyLEU0N2cw9AjEH8B1owE4U972EmBESYSWtsSbh3Qt?=
 =?us-ascii?Q?vzWd3vUx64ObUovg6wnwTskgTqQG3wkYZxwb?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:19:59.0087 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b5c41b-c413-4804-e59e-08dd4f4d6588
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7786
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vF6pIbrZciRVYY5EvCJ72ixJ6//akd1Iyh+sLPoStFw=;
 b=SRWsofbeaz/BceHuzeDaI03I5AljvH666yjXAIsXh/YARoTwmllA3HzuzJ9zrY6QLNVrUGyErjUty6xKlGP2RLWCnPic7mpdRii/TtLcxKWCTxrlM6v+Vu4ZmEXWI7rSA9eXBykwy3+0/blrlEb1wqXh8RdiYR8Kln7A+9e9lyU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SRWsofbe
Subject: [Buildroot] [PATCH v4 1/5] package/binutils-bare-metal: add
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

To do this, custom configure, build and install commands are needed, so that
each step goes through a loop of the architecture tuples in the list.

To keep consistency with autotools, all the relevant host configurations have
been copied into the HOST_BINUTILS_BARE_METAL_CONF_OPTS while removing any
configurations that do not apply to binutils and removing redundant configs.

autotools redundant configs covered by $(HOST_CONFIGURE_OPTS):
	CFLAGS="$$(HOST_CFLAGS)"
	LDFLAGS="$$(HOST_LDFLAGS)"

autotools configs not applicable to binutils:
	--disable-gtk-doc
	--disable-gtk-doc-html
	--disable-doc
	--disable-docs
	--disable-documentation
	--disable-debug
	--with-xmlto=no
	--with-fop=no
	--disable-nls

Some of the configurations already in the binutils-bare-metal package also
needed to be changed / removed because they were either incorrect or not
relevant to binutils.

Config Incorrect:
--disable-gprof -> --disable-gprofng

Configs Not Applicable:
--enable-static -> handled by --disable-shared

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- no changes
V2->V3:
- removed unnecessary symlinks
- removed unnecessary semi-colons
V3->V4:
- added all relevant autotools configs
- removed any configs not relevant to binutils
- corrected some configs already included in binutils-bare-metal
---
 .../binutils-bare-metal.mk                    | 38 +++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index 3525e9fdf2..e190cd683e 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -22,13 +22,45 @@ HOST_BINUTILS_BARE_METAL_MAKE_OPTS += MAKEINFO=true
 HOST_BINUTILS_BARE_METAL_INSTALL_OPTS += MAKEINFO=true install
 
 HOST_BINUTILS_BARE_METAL_CONF_OPTS = \
-	--target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
-	--disable-gprof \
+	--prefix=$(HOST_DIR) \
+	--sysconfdir=$(HOST_DIR)/etc \
+	--localstatedir=$(HOST_DIR)/var \
+	$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
+	$(QUIET) \
+	--disable-gprofng \
 	--disable-shared \
 	--enable-lto \
-	--enable-static \
 	--disable-initfini-array \
 	--disable-multilib \
 	--disable-werror
 
+define HOST_BINUTILS_BARE_METAL_CONFIGURE_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		cd $(@D)/build-$(arch_tuple) && \
+		$(HOST_CONFIGURE_OPTS) \
+		$(HOST_BINUTILS_BARE_METAL_CONF_ENV) \
+		CONFIG_SITE=/dev/null \
+		$(@D)/configure \
+			$(HOST_BINUTILS_BARE_METAL_CONF_OPTS) \
+			--target=$(arch_tuple)
+	)
+endef
+
+define HOST_BINUTILS_BARE_METAL_BUILD_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_BINUTILS_BARE_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
+
+define HOST_BINUTILS_BARE_METAL_INSTALL_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_BINUTILS_BARE_METAL_INSTALL_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
+
 $(eval $(host-autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
