Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1B0C61DC2
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 06:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A99EB80B6E;
	Wed, 26 Aug 2026 06:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ERgzcJF-9aI; Wed, 26 Aug 2026 06:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787726870;
	bh=7R2XCJRlMzk+yIy2uCncJe6iFiMw1p9LBdI+VMp8GyU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=oFdG5+dVQat/5rIUwC9WPFrfRZ501D3meiFBJYaGyHd0OSqZwlLvIXy06nQ0wSPiP
	 Nw0rZUxnvhF8Cmznn5ZacywoA4bahuf0VrVVeJ5rtTppQjXk9jOZuggK6K/F7vMdeL
	 tMXLaSs++xmU4UfmDzXlGG7f6SBl9+sNBXREbj5vAamKM8chPuV4p2QgwePHUpTa2E
	 SId6iL3GhJNsjBHmKP6JffdTnL2lACvst+EIY0sAvpaWHP9rjC7Q67Nti52LieFCeF
	 /V/Sszgnl/5N+CXxuJGyZ0E/0CWED/Vun4e+YaM98c9F44Z1VWc+Ao0y4dlCYW9F5S
	 DG/kSLLaUuJVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A43A480B84;
	Wed, 26 Aug 2026 06:47:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 91A5D2FD
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 06:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77E2180B84
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 06:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AcuCD-Kl4UJ4 for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 06:47:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::1;
 helo=sn4pr2101cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7906980B6E
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 06:47:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mX+spUu2gfbeEbDEhq7gMzcSq2gRKDsn25rUviGDsvj9sCz1Uey2JqjSjX3qX3BY47rKhGl7ft6H+bMb+AYsS5qmB3KWMrSU+Evi6eZopHa1iQmeE7bcx/3lKpZmmycwdLPmu61JCgm86d6BkjdeRdp0Ly7Y1V499gZiKXHtIVut0uDhEimesXSgIGcWf3YQ4dmFDb4s6AuEpPSZ37iFHgNnPNQAa5Dg2B2MC888XsSNtHusJtHZUU8QsHRyuCNtRm7m19+3Ch1pe/kl32xFuItKU0ENIxGXClECKURE93v9CEHwHibeccuhqUBslwPOhWyFgmnE4i4xoLgqVKlMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xk90K9aGAjk+4Z9utl1NtrqW4XV8T8sWsrS5EPZzdSc=;
 b=JhKiRFqfq5xQTurVAeZ1wBZMm695VOuHBJZuV4buglPOx6kn9Pph9iG43LLpicczZS027796NcvbGYzMD9ERDc+cLG4E3OUXBEWE2ifYOn6JXuZLIWpqI9EyP4ijHKre6V5eQUlcvtNiU9y0OWJ0CiRW5OzDyMcO2SHxiSeo0128QwYMeBpXgtk7BTbcdyScG/xKZuYJpQP3ET1+PbgDS/X0sDB5rLX37MJcvRvM8itwUz7RvnFWxqLKKbMnzo8au7WrrsIVWyOkAGKiyCW8kEzSEn8hBkRHRlsCmeufM6QcU3lj3uVk3sGLkKoBmG94nzR0xcoIkhFfpsGnj9gcKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:a03:33b::10)
 by CH1PR12MB9671.namprd12.prod.outlook.com (2603:10b6:610:2b0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 06:47:27 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::97) by SJ0PR05CA0005.outlook.office365.com
 (2603:10b6:a03:33b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Wed, 26
 Aug 2026 06:47:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb08.amd.com (149.199.90.133) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 06:47:26 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 01:47:07 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 26 Aug 2026 01:47:05 -0500
To: <buildroot@buildroot.org>
Date: Wed, 26 Aug 2026 07:46:48 +0100
Message-ID: <20260826064649.292291-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260826064649.292291-1-neal.frager@amd.com>
References: <20260826064649.292291-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|CH1PR12MB9671:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e58e4de-2352-4d40-2357-08df033de45f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|23010399003|7416014|376014|36860700016|13003099007|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: VG2AL86MaN5UVb3r0BPrBmVR5k7LWmBqmqBBt9xmFLPLeTIL6B5hH5NPvK0DfMAfmkmerF6ijSTijx+Q7ysqA7nwGNuF58qKCgLbyIvTfCqVAqEva989wxi7C0m2IfCXvYWNf1PgTpuBcIj4wyusxqQRBVQsDHNA6klpizrnBbU7pJbhpzbld6YoRDIBfpz1BZC/Dts6slmVJoYgv3EEqXRccvwAEUhLu3XXe0Sth8MehcQERS7wTj1KxDLRVh8jNFDdYXPnB4NmiUNVYwS7EHvdj5gAD7VKf7T899ykbCpz7RN0Va9L8bp10vpa/ZdMJWHUGo0xaAYrE9SHOqA/E92V4W3ufhkrX54nM6t8rKleGx0P47dJRwW60nbm7M9qg/wJgHW9gZB/4JlpmxgOMNn/WoZOdyeBF1IgAX/yu7+pb4UNNxron4p89t1eYTX81YXXbO9HpvGFed7DPHbbcW2S+jH5Oi1WUU2JKwqcTUGQ95HQ60b0LiL927FF0/bJfAEktUF8zb5ovf3Z+MqwmdM00RhPgzO8xGaBmvvREPP3vniJP+9F+ZV6cbbmWzhy7r0S9Qz3roFUDy8hro3Gayz1YiIUAoRs2upVpjN34st4xexHDpVFMb2V0y0EplSbxbDAgSlf2ucXHkP6kZMsxjzpvYYcX9t2f42ESeuGE/0DCm3VGgUA+REAE9s3saDGfm65Uc6GFxIwNgXl5VqIEg==
X-Forefront-Antispam-Report: CIP:149.199.90.133; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:unknown-90-133.xilinx.com;
 CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(23010399003)(7416014)(376014)(36860700016)(13003099007)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AAgkhWHjS82CZNyeBd6uS5JTOTDgOlmveYVCliMAfY55CM4+9ZgotUjpYWE6NRYI89lucoeE+CiOQ6zaz9Yh3RaXouPEhzOKBRomuJd6MTdt0diSls9rpea3JTvd7+7DqEDuu+aPySkzqL+UK+FzIKN4ILl97r9/50/HMww15PC6cXSd/JyuXEpjs2+Ndq3WduI4QLrK3MtD2H5qEiU1hriDAJ3LLJsYaBn35V3ZzkGxEM3nrwctQXkgePzoQWdgsXBciq4kxu1puTXKZcob2I8SldGHDWkRMyUYYTh+KpATV1NueLG81pwNDzykiMo1TbtocBzXRJPFCkJFsL2I8Aeyn2/XdoOY2riNGeH2YqAJMRMKnp/7qkhp4ca0Lm1T4eVSUxnZyJFBMsudcOxRpN+vncyoOOTD2ehSWEC2Wy3M4tk0bgQFrZiD9CihfBoJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 06:47:26.7901 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e58e4de-2352-4d40-2357-08df033de45f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[149.199.90.133];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9671
Subject: [Buildroot] [PATCH v5 3/4] package/xen: add custom tarball support
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
- merged into new patch series as the third patch
V4->V5:
- removed unnecessary BR_NO_CHECK_HASH_FOR
---
 package/xen/Config.in | 11 +++++++++++
 package/xen/xen.mk    | 17 ++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

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
index 4e953edeea..473f0e23fa 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 XEN_VERSION = $(call qstrip,$(BR2_PACKAGE_XEN_VERSION))
-XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_SELINUX_MODULES = systemd udev xen
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING LICENSES/GPL-2.0
@@ -19,6 +18,16 @@ XEN_DEPENDENCIES = \
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
 # Calculate XEN_ARCH
 ifeq ($(ARCH),aarch64)
 XEN_ARCH = arm64
@@ -91,4 +100,10 @@ XEN_INSTALL_TARGET = NO
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
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
