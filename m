Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855B1C61DBD
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 06:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BF0280BE2;
	Wed, 26 Aug 2026 06:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcldjxvkThoL; Wed, 26 Aug 2026 06:47:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787726843;
	bh=FGC6p5sDC/2VqjF/a5ivSFn+W2Em/pDxzlSauz4WDWQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=J5lCZ788PKG4P99oR/yMxm/R/xoj3IEY5waGd9W/6IPH0mhGwJkygjLSwzoXvvP2E
	 zL/Hf+ntpqt8KUpT4OEoEitkcMrnrvRnSUKem8Fc0q91JHrSgOlnjDFukTKB0vBvhe
	 EuEFUlD5dcARni4Kjvivpq+L4p0v+S7+KVva1/RgEmRGV6C3w8yw49kc72x4/80+li
	 SIv1VzEXY7+sXtIRbMspInY8bkaOWizcRKtA5ICB5vNkPBnsrHlQtruk9hTj5bfqWU
	 LcS5yIZwJEkgMxugABbi64NUEARJ8jGK8bpKFMAAqJFctx+SF0NFScJIxMI5+K6JiP
	 T/joDFQhsa1KA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 316AA80BD1;
	Wed, 26 Aug 2026 06:47:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99072105
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 06:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F8AC605FC
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 06:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyHXfCAwSEFN for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 06:47:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::1;
 helo=ch1pr05cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76CD8605F7
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 06:47:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEd+kW6SMR9tEVqSSF0T0KWJZ6jDRTs9nfdEjWuCqHMkKP6c28I1pgAyGwTCrbKiBNEnAm/fd4ifB1AzaQtlzPCRqyyjkjLticdZlsMriIl+8Xz1qAmYNxsnZnVDgfi+jbqwAa72yHpDS/mEBkGhARTXGrb/6M7y5gaLkH+5jnM/GZxH4TT5CxEzEEdsV4bAFuO3td9qrBlBtLFInkQT3SWgOsSr4WmWfggcVwOvn4kLJe0h+2b6sFR4s530KeNjVwulcPEsKJrsmnqLaP8j5bSekTQe5ukXm2CDv06sJpLE0tNbSwlosnV0K7tLYbs2eO/SIjLykNXZPyATHRrUHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Pp8fTRK4xjXv7nSHHpx9OcdkBDXC4/IZSxV855HbIM=;
 b=JrtNnvlUuGcAz2YDJDeWYDk2s2jYWNot181tDkEi00k2J5SLdsEgN4ZOI1oiVlGYsTO12S4TzgYdopGXQxVjF1DG5WHdEaumm85lbK6Inv5j7AnJ8RD/gFjinWeO7l421i7uusUQn7BznnrCjG/B6XUTp9kjw4eCE18CGj3CzagWulj4L9uPnjWJcxmDFonAEDc/UP8dLiRsUw5bkEJfIyrYYLPmFVjK+W5R+oRQYLzQ4SmhlsV7kbpzsnXp8x0ARc1gyhvpBYlfBtP4Cc/8EyeCVsYPc/P9Cm0jaDbQLZM3tAPwozLnQvKtmCawdfUf/NJ3ciajrBykx1ENlQNWCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR05CA0047.namprd05.prod.outlook.com (2603:10b6:a03:33f::22)
 by SA3PR12MB8023.namprd12.prod.outlook.com (2603:10b6:806:320::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 06:47:12 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::80) by SJ0PR05CA0047.outlook.office365.com
 (2603:10b6:a03:33f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Wed, 26
 Aug 2026 06:47:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb08.amd.com (149.199.90.133) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 06:47:11 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 01:47:10 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 26 Aug 2026 01:47:08 -0500
To: <buildroot@buildroot.org>
Date: Wed, 26 Aug 2026 07:46:49 +0100
Message-ID: <20260826064649.292291-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260826064649.292291-1-neal.frager@amd.com>
References: <20260826064649.292291-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|SA3PR12MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b42228-9461-48ae-bec1-08df033ddb62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|1800799024|36860700016|23010399003|13003099007|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info: 3rQ/FoKAVO8gsOynI5JnZcOhYbmBWWwyojpT00tgnn86/FjoIk+N1cRLOE5F+Aqtwp+my4tS97wYSQfaXca9Mq4e94ajM+PXFBJGSlZx7A8coTdK9sHi3e0GlwO0WuzA+2Eq98d0DsRx30OS9ZGXDgTBDeX1SS8mj7QoRCgAbTTt+1DmFkKa6jkjGSG5EfRaTSxDcPCsXZHeOpgGDvCUo/X7CYIrpXaq3YjKQJle80kVGJaXeoh5x/D0lTuwgwIT95WYwCe9qPO0xg8NGsdZvQ5Ty6wdzi9avhAchYM+8UypAdfLdXCllJMpEea0xPtCwRx7mjXZ6Lf8jO6r840OcIFZALW4ZwzbWvOi92A9S5TmaWSqGSzGSK+S6msn1gicWCOOA3pQKu7SRj+tKshRWsNDgR/h0Ry9Er6zUrBw5iQHSCutjoL0cAZktS8Q/P76GG1yp2Pqy4WGYo/IRci1shmPuvfv6yb21bmhqXo9tDEK14NxNAjpPxzht53f59zJyLlMtaHO0xU9hvYNd6e+EcygNUDi6uOZBOMSU1EVCmzPlC/ZsZIRbYwqnm0Wos1RjrNinagXElYyXybKcXf66aTkZgQ4EWuuIDI83p0i/cRjrvaw4MReJMU12mlQ/PSI3fqHhuyPUpevkemOPH4JUwyapRK6ENHLSgHgMilexfy98Bam/v6kJVxS4/hULvoDi9jknr6dp0lGYcvnycF67Q==
X-Forefront-Antispam-Report: CIP:149.199.90.133; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:unknown-90-133.xilinx.com;
 CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700016)(23010399003)(13003099007)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XnoX5i8vzb/FOeL8Snx8wDzGOfOwj2tUPmubUzSS7/Xv8jN94RP9TozFe7tkbRP27lhTHhYUHkQ9hiDKGbAZv4we0zzyF+OWx5PozZVGVcOB9SY5BpCcrgIIfmkjuYMgv49bGwFKR7wNySB7v+cqk04AMtr163g0BNZ1Nr9oeiuw22e3yTvDOAEhVNGRztKQks0uTBGCiCHnklMkGBkyJ9CuZ+4vTjCXYvuDTjic3OLlVoK11FXkAVZIuVcIkzj/jVKiAbcTaFn+cRXsMNU9A+2xwLZrLCoxikVqgBDYNFNSlv4eKvRB/cv3JuoTsSYdX40eq7tdtVn5ZF5Ut14rCVO0z/X5yMN9OVJWJtnA6gpo0O6c+/lb/ktk35UdAi/zSvo69pmAO+g6txvfKYNWEKFWMNJwDBcNnQZBUXUakGoKsZaCUsOT6DTtdClWk1lp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 06:47:11.7144 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b42228-9461-48ae-bec1-08df033ddb62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[149.199.90.133];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8023
Subject: [Buildroot] [PATCH v5 4/4] package/xen: add custom git support
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

For completeness, add custom git support to match the capabilities of other
packages such as Linux, uboot or ATF.

To test this feature, use the following configs to test latest release of the
Xilinx Xen vendor tree.

To test:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_XEN=y
BR2_PACKAGE_XEN_CUSTOM_GIT=y
BR2_PACKAGE_XEN_CUSTOM_REPO_URL="https://github.com/Xilinx/xen.git"
BR2_PACKAGE_XEN_CUSTOM_REPO_VERSION="xlnx-rebase-v4.21_2026.1"

Add to package/xen/xen.hash:
sha256  e8016e81627fe3b4fca5463723428606cd3750c7fd76a3cfaa0b0d0e7cd9b32b  xen-xlnx-rebase-v4.21_2026.1-git4.tar.gz

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Matthew Weber <mathew.l.weber3@boeing.com>
Prior test details: https://gist.github.com/matthew-l-weber/c17f14a3793ccee440a383e4177ff3db
Reviewed-by: John Ernberg <john.ernberg@actia.se>
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Tested-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Tested on VEK385 Evaluation Board
---
V1->V2:
- rebased to updated master branch
V2->V4:
- merged into new patch series as the fourth patch
V4->V5:
- updated commit message to use release tag name for test
- added error message in case no version specified
---
 package/xen/Config.in | 18 ++++++++++++++++++
 package/xen/xen.mk    | 12 ++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index 3726504334..eb58c6928f 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -26,6 +26,9 @@ config BR2_PACKAGE_XEN_CUSTOM_VERSION
 config BR2_PACKAGE_XEN_CUSTOM_TARBALL
 	bool "Custom tarball"
 
+config BR2_PACKAGE_XEN_CUSTOM_GIT
+	bool "Custom Git repository"
+
 endchoice
 
 if BR2_PACKAGE_XEN_CUSTOM_TARBALL
@@ -45,6 +48,21 @@ config BR2_PACKAGE_XEN_VERSION
 	default BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_XEN_CUSTOM_VERSION
 	default "custom"	if BR2_PACKAGE_XEN_CUSTOM_TARBALL
+	default BR2_PACKAGE_XEN_CUSTOM_REPO_VERSION \
+				if BR2_PACKAGE_XEN_CUSTOM_GIT
+
+if BR2_PACKAGE_XEN_CUSTOM_GIT
+
+config BR2_PACKAGE_XEN_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_PACKAGE_XEN_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by Git
+	  E.G. a sha id, a tag, ..
+
+endif
 
 config BR2_PACKAGE_XEN_HYPERVISOR
 	bool "Xen hypervisor"
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 473f0e23fa..4ecf56ab49 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -23,6 +23,9 @@ ifeq ($(BR2_PACKAGE_XEN_CUSTOM_TARBALL),y)
 XEN_TARBALL = $(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION))
 XEN_SITE = $(patsubst %/,%,$(dir $(XEN_TARBALL)))
 XEN_SOURCE = $(notdir $(XEN_TARBALL))
+else ifeq ($(BR2_PACKAGE_XEN_CUSTOM_GIT),y)
+XEN_SITE = $(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_REPO_URL))
+XEN_SITE_METHOD = git
 else
 # Handle stable official Xen versions
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
@@ -106,4 +109,13 @@ $(error No tarball location specified. Please check BR2_PACKAGE_XEN_CUSTOM_TARBA
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_XEN_CUSTOM_GIT),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_REPO_URL)),)
+$(error No repository specified. Please check BR2_PACKAGE_XEN_CUSTOM_REPO_URL)
+endif
+ifeq ($(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_REPO_VERSION)),)
+$(error No version specified. Please check BR2_PACKAGE_XEN_CUSTOM_REPO_VERSION)
+endif
+endif
+
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
