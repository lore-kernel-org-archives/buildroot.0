Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0574C55179
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 14:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86D9C405E6;
	Mon,  3 Aug 2026 14:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBNRSq-ISjgF; Mon,  3 Aug 2026 14:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBDEE405B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785768742;
	bh=7UMRrQwbT3xSkJKjG5NVqDdvQoofH5NUDjsZuII5+4o=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=JdsjRPwBJ8oKfczGdrLssNxF7eudgFtKIfWbu4lLrHdsju6YCAYgu9jXaG6ZSyJFo
	 dVv9lr8dzNNnwonaIRPvj6NVZVwRkwNPsYrdnLJbPvxN2RAZxvxcKMT9ohNo65PRey
	 scrGhDlWq5vESg+sAcy2/eqPNYfL1pL2E6AFnS5a6ZFB/Aa/VbZB9QRHDyoItYBvzN
	 bDIwz9j1TsNsngczcWwePGxtOXy4DylRqlqHSfnF+CMnUtMGqmygJAYJDTRkwcvUAa
	 zm5yay12U94tigbZVV0Fg4vx3YfMn5pBieh9/hYzfNf9sP4XO8x4XPBLfFssRqPsRp
	 RFjWFsfEAqO/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBDEE405B3;
	Mon,  3 Aug 2026 14:52:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA6B0282
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D11534008D
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lLAnLmb_8eEt for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 14:52:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::3;
 helo=ph0pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D1B5940042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1B5940042
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1B5940042
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:52:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChhfS6hyKg4INSZbe+7/mgPLDXaXPBlOkB9h/64wripS8C2vjSgFfs35oz7HMeHpUzAWI93j6OXtUpdwNkgOM767neMn/+9AegFFQVh1uMtpOC4wKUTH60o/AGEjFDrMDo5Pe2IcRtoqISrbYcP7pIydaPZ6XTkbgc+GJmcuz8D+MlkuiBKMvl0ffN1fVitwuALSnqy+KUJ1sSRenxCuyQZluoF9aXLwdZNOjNaT5DDD3IUCs6S/mn51B0FBKgI0O4tR7Q6XxqKebtHr/qPwVcahr+ip/30GVC6N2SO8ziV5jIbQdOu9Fg2ezVIgT6SkHnH6B/AzDmAjgwnx8OU3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhCSuOHdwx8V1eB5HagCnztrkH8WHxh+dmvoICR5zL0=;
 b=rOW65zlyVAvBkXkaRi0F+4IU/BK+dje8dKSaOh0at52iPsGQ5ALt4ut4Eg8pFaMayPD1bsmf2Wss3eQeZDtBp/4hHesQDpPE5BQtkzSxIucslIKcd2UNOIb/CWB0vqyS2KDepZxQdZ2WA05e+V4IQShfegCrC4bFA+K7mm9CsaqH9LIQrOBUPMe7eb5AO3ZN1K4Iec7ScajzR2F186KOWAC4RDyT21daHQgdMFCxxBscd/g8/xB3S0E249dLT3q7do5A6NGPSn6rt27n5noXQYwbPtzwRIAFDR4iI7R8/5KInfRE6tLhgpq7ZNeboMZD/U11ZQjQL0atARd/8e3h+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CY5P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:ed::8) by
 DS2PR12MB9752.namprd12.prod.outlook.com (2603:10b6:8:270::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.18; Mon, 3 Aug 2026 14:52:14 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:930:ed:cafe::82) by CY5P220CA0010.outlook.office365.com
 (2603:10b6:930:ed::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 14:52:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 3 Aug 2026 14:52:13 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 3 Aug
 2026 09:52:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 3 Aug
 2026 07:52:11 -0700
Received: from xirengwts12.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 3 Aug 2026 09:52:09 -0500
To: <buildroot@buildroot.org>
Date: Mon, 3 Aug 2026 15:51:43 +0100
Message-ID: <20260803145152.102135-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803145152.102135-1-neal.frager@amd.com>
References: <20260803145152.102135-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|DS2PR12MB9752:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca9e5b4-c063-4ac4-e404-08def16ecded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|22082099003|18002099003|11063799006|56012099006|13003099007|6133799003|10067099003|41080700001;
X-Microsoft-Antispam-Message-Info: IBirtUw4PwDrfj5ox4uAcoTenXPPKV90DVzmPSmo/WBs9rSrt6vDolGyRfVuJcH9TTyWtl99kKbOyYZucBl/Dh5mUWOxs1fnJ40TC7Rnr04Z/NjsZyNxXqkDp99MSgnDwYr94lFIxkq53MlRPvYUD+S0ag8Cxzw7cWRRFIu5syBxNvsdkhTdpySI/qt1wC3kkXF3uX8uXe95dlnYL3k0YzUwUzFMaFaAR4yunKKzpx7dW1HrReaqAP03RVpqrfGW8afQGkukaTjGn3hTpAwc3ahlqisyCcGRnx0WQmda6mzjihTiZ6EOJ+1ZSwvxgxSimzuKUzfZH7i41FWVXP2FYhHXTyVi1dBseQZj2TvtgGoytaK3iw4TGinE3BTsC9gcY69Kj6N9eN+VvO26hnwJrbouz5Rk5rXimGeP562magCmWmZz6DreRLZ4HtK8oQfJRjbtW3ex/99CZN9Hxp9mhPju3br9y2UlfADN4Y+G1Zhrcb/2gc9O6svXFwQ378hj0swTsXn3UoyS+FkH8/B88xWDn3AqpWp33KHvXvVrrhnt2hJvRnuVIPHARpwXoexnLAy0n4x1mumqQVYt1+sXgylE6M+uTzlcrOwVK3q1TcrgfHNTuX/mXWyjSw1hMjzqlDHZ0Zt3CaSH0+RmZ4bumu9Dtgs13x+txPWS4jZcngtaluGV/Zv3aTPnzCCy1MMCfYDahZPMao8QBtrvgvrJxQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(13003099007)(6133799003)(10067099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 41HdKiYl8/ZDT4Wm3K0O2sw++9M/wAo67PioIJYsxzdQ4JOHU63/BWttLo8Mu9qz0qBM5CLtHFVlOb6YUU95gMo8Tj3iVKR/JPzEujXcE8bCj7ssP6nMxzucj8QkJVU01x8RBIXHCtJmbz0ZJ0KYxXVv73VWkVMwjvPBykpslvw3D/RCPnhSOnSu85BR7nNAoqboIRX4ubGrshrxlFPKgOgHSaaNJQtN5CjCjUFaUPq1Jcz5L4jp0tqt7A26TcafpkQdX9d9iBW4R8d20yndoJOVJvpWRDBcqx0RljBz2puWp/i+BMSXxbFK9jZH3i/B4AK2jEer5nmKKFKLtdznZj4j7NxlH9LRIP8feSwqHMS31vguKQZgI3vu8yx34Yn0Hp7FjCX9XnTsp0ByZ66j3Ho+/h89lK71In0xPN26KaLD97V/K5pCtrIjRuAzFKZ1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 14:52:13.5932 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca9e5b4-c063-4ac4-e404-08def16ecded
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9752
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhCSuOHdwx8V1eB5HagCnztrkH8WHxh+dmvoICR5zL0=;
 b=AXEgmo652KbaJ8UH6C2ziriFxLZ2UqU2IudLHzyAwH1bY86dXk2kgO28ETb/cA6svkCKtN7ednTojdMonr9AhZuW2S2N5LVTqDVgyhErE6OATvj8flE3AOc9/MWDXECIrgMNA2XCGzP1AyuL38UC/6xNKtTknqR9siIMcnDxBRI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=AXEgmo65
Subject: [Buildroot] [PATCH v4 3/4] package/xen: add custom tarball support
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
 yann.morin@orange.com, matthew.l.weber3@boeing.com,
 Matthew Weber <mathew.l.weber3@boeing.com>, brandon.maier@collins.com,
 john.ernberg@actia.se, brian.j.wood2@boeing.com, ju.o@free.fr,
 stewart.hildebrand@amd.com, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for custom tarballs such as tarballs from vendor Xen trees.

To test this feature, use the following configs to test latest release of the
Xilinx Xen vendor tree.

To test:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_XEN=y
BR2_PACKAGE_XEN_CUSTOM_TARBALL=y
BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,xen,xlnx-rebase-v4.21_2026.1)/xlnx-rebase-v4.21_2026.1.tar.gz"

Add to package/xen/xen.hash:
sha256  03498f51b8daae70c429ace4bde6e2be679b3a0ac28b886c7335c022feef6100  xlnx-rebase-v4.21_2026.1.tar.gz

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Matthew Weber <mathew.l.weber3@boeing.com>
Prior test details: https://gist.github.com/matthew-l-weber/c17f14a3793ccee440a383e4177ff3db
Reviewed-by: John Ernberg <john.ernberg@actia.se>

---
V1->V2:
- rebased to updated master branch
- added the line move of the XEN_SITE definition
V2->V4:
- merged into new patch series as the second patch
---
 package/xen/Config.in | 11 +++++++++++
 package/xen/xen.mk    | 19 ++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index e50b232f0a..3726504334 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -23,8 +23,18 @@ config BR2_PACKAGE_XEN_CUSTOM_VERSION
 	help
 	  This option allows to use a specific official version
 
+config BR2_PACKAGE_XEN_CUSTOM_TARBALL
+	bool "Custom tarball"
+
 endchoice
 
+if BR2_PACKAGE_XEN_CUSTOM_TARBALL
+
+config BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION
+	string "URL of custom Xen tarball"
+
+endif
+
 config BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE
 	string "Xen version"
 	depends on BR2_PACKAGE_XEN_CUSTOM_VERSION
@@ -34,6 +44,7 @@ config BR2_PACKAGE_XEN_VERSION
 	default "4.21.1"	if BR2_PACKAGE_XEN_LATEST_VERSION
 	default BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_XEN_CUSTOM_VERSION
+	default "custom"	if BR2_PACKAGE_XEN_CUSTOM_TARBALL
 
 config BR2_PACKAGE_XEN_HYPERVISOR
 	bool "Xen hypervisor"
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 51d51333ac..81568020d5 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 XEN_VERSION = $(call qstrip,$(BR2_PACKAGE_XEN_VERSION))
-XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_SELINUX_MODULES = systemd udev xen
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING LICENSES/GPL-2.0
@@ -19,6 +18,18 @@ XEN_DEPENDENCIES = \
 	host-python3 \
 	host-python-distlib
 
+ifeq ($(BR2_PACKAGE_XEN_CUSTOM_TARBALL),y)
+# Handle custom Xen tarballs as specified by the configuration
+XEN_TARBALL = $(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION))
+XEN_SITE = $(patsubst %/,%,$(dir $(XEN_TARBALL)))
+XEN_SOURCE = $(notdir $(XEN_TARBALL))
+else
+# Handle stable official Xen versions
+XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
+endif
+
+BR_NO_CHECK_HASH_FOR += $(XEN_SOURCE)
+
 # Calculate XEN_ARCH
 ifeq ($(ARCH),aarch64)
 XEN_ARCH = arm64
@@ -90,4 +101,10 @@ XEN_INSTALL_TARGET = NO
 XEN_CONF_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_XEN_CUSTOM_TARBALL),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION)),)
+$(error No tarball location specified. Please check BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION)
+endif
+endif
+
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
