Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7C7C55179
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 14:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7D0C605E6;
	Mon,  3 Aug 2026 14:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8HS9fOjipzv; Mon,  3 Aug 2026 14:52:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8623605E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785768745;
	bh=fVfSR2gZTokjouOPFKQXo/KuaiFglriHs092e6U5Pgg=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=VRL0ewqnYTqYobSAQWtoiWMfZoqAawlGNseexWvFm6zjtVKWdFS3e9bHUdlFqz5gv
	 iPGBvx3Q+VSkGUsO0hWgwpBf6hhKhiVvSbP3jkfOwdtzar5xY+X4UrqEiEe3JHeThl
	 A2rwHsZeotZFMeTAFIDNJwupbRciMLNsfskXXxX6D/BfGGTLkWqHpTDGZgjAcBj0uV
	 34iKWu7Shbh3mrZriNyA1wRluI71lgDyzUT2KRbZMvWIscmet9tNX4UMNVPOGrlGbt
	 /wAOaJln2bf8WVX5kfr/DsGP/nYT67UEvWhA5oYhg6pdzYijD+2lauSqa17jy9tsGf
	 S6PQFDQhniDlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8623605E8;
	Mon,  3 Aug 2026 14:52:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 23680282
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15291605E8
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMdI_8llkTBR for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 14:52:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::5;
 helo=dm1pr04cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 01982605E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01982605E6
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01982605E6
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:52:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNB4CWFqoTct/274coGC6xAMVzDrlbzH7G+hoz6OpFASdnGoKM85hdbtei7rTSX4NL+0PYe+JfVhTEQ/iHLMIc4vrBSx7qkFbLMXFMQ01KOFqrUBrAYb9ZrvEDRYayD/5P9Fdc88WKY8922n6uXeDmr352+3IwBWW5lO+dnLPiBD+CTHyC00Z+MbYE4sGFrwvVchqv/xdzyirxTDhCeOHrShv1oGGGTjsMIOSZmpYit7ZPvcTpOYuM+PcDycNSSkzp89JU53f1QRidrsolOYiq2tsm9YvfBxUwwo/Z5u39oa2LFW5eQa+cQczmaXvNX2ZWOOjSS6wF6mFfwa5lvoCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOMRpq+/+vGKNAjjw6LI7Nee0ev/Rbz+Pc0vPZkKM5g=;
 b=ftQRfVAAVncNg9MP1XAuAY5w1vbY39DcaWmVJIPw8L4mGQFmWZK9Dq4fDjxsfYl80meEr65oP7ZAxz5Yj/Qea0MfoNPPPOyBQq4oDg3AJ1OEBX3D+Q69NJ+FlrrEh84G+G+Ptebqnib7mZ1HZCPRAM3CkvJhA7Plfx+RhwCgxAbRWmnT3JwjeBIuIKg6k7n9+OQ1WlECBOqsNakV9S5MbnkRdep/6i+Lh766gmKcxRtft9+riPdplk6M/gbGQo3GjF6z6VlFTjKGjeMYfubByItMOvF6DN8Wjs1rVVmqObFaBkMgTk9meHP/R9ZGP6EP4xv96EI6+6RqoCW2ZRwnIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CY5P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:ed::10)
 by DS7PR12MB8274.namprd12.prod.outlook.com (2603:10b6:8:da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 14:52:15 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:930:ed:cafe::5) by CY5P220CA0003.outlook.office365.com
 (2603:10b6:930:ed::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 14:52:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 3 Aug 2026 14:52:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 3 Aug
 2026 09:52:15 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 3 Aug
 2026 09:52:14 -0500
Received: from xirengwts12.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 3 Aug 2026 09:52:12 -0500
To: <buildroot@buildroot.org>
Date: Mon, 3 Aug 2026 15:51:44 +0100
Message-ID: <20260803145152.102135-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803145152.102135-1-neal.frager@amd.com>
References: <20260803145152.102135-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|DS7PR12MB8274:EE_
X-MS-Office365-Filtering-Correlation-Id: 16a12ec1-c7cd-48f8-f818-08def16ecf41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|7416014|23010399003|13003099007|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003|41080700001;
X-Microsoft-Antispam-Message-Info: hCrB+eHh65Gpsxw7Nig8LKv21qKYAW9oIfMuSLtEwUH1s0un9Dxg3yFkSGpKaDqyJrxwOWEq+qP6thc2pG+b7UgRkDHupulO4Z3E9Hx1/ZlcNAjDejKykMKWOjHyrTs9q85bZ3a8W0uLAwi0NyMAci4/K2+X+D9plBSBS/arZ04Cffhmlq9Oo0Xbf+O/I9nLNQvQbJsUR3iASgEkrf+uDsvZ21As67kbHP472e9YeI/0dU1QJRegTwWjO+U1dBfczOAXdDOn4BG5y8B/uhhWhm4ybnxU6cPN0rV9xbuEs5zEYfpcZHwfQx3lzJtLxvPGudWx43NjCC/cfeIljPP2NvqzUa+NQohBVEggBskU19nCwvP0dNh+a2VUttaJtq1uAmzyEI6QXHBjiIN4XjzYl+Y1WUxLMJ6MRvxL3WO1jPc7QShdRoRcIImQUv7AYELmT0IAReNbAXqkCezRsR3yenXRmczlA+NyniimN5mo/0uSTYVfS73BJ+n4stdToM8fuISxtQe6TjjIubxNp/ZwZPmZ1v0UmyAf39Q4QWCJ6F+hkLWusmQBgmw7luyki18tcCE7+k0ET9n97cQscE7gZm3UKyilPHX2PBiqanfdwZH/wa5kPzbQZMwsT2se72jyMnyrEbJNhEd4bpPCTlQRvJygFROu2jskAFuN/l/ItY0qfgWPvY14fIQ3rUlUTHmvtvtQjoivph9ve8cfXbX07Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(7416014)(23010399003)(13003099007)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xzhxsGPiR+80b7C/rWWjOESoNz5hSKm2rVqE5FCijGlf6dqWV6ogozzzZ6qVMQztE02BNMMs4iYHrycsSoZoIABL0OUiB1AcavDLSY7QGo/nVus4gKUskG+JzVe+KkMChqb9eakBllsodZ9sC+e16c5/MHAI9YcddHObM5yjPJffPpB/TJGvQIoDgbroDgWvElXcMfgOrKgBuWtCEbn1tjCdNYMrdRM46rg6okPJkEYNnajrfZ4BgN2z/pk36gT4fkZwbpv+QkEQkci0HQSfA5EOrWFaNEwbQUCZW+uaiq5a/FZr4iSei2wg/HXdt/nXL3dLSXgQUErdZ+0UrVku0VKdqF+w7Yw9hyAAp8Y1bvHPHxNKEqjL0OijTfzOFBY9DOJqiPbJKsDwAqVkiLmyhfyaBEmT7nia4wBPe9aKw41b6hieus5Qr91rZ4euhBVc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 14:52:15.8199 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a12ec1-c7cd-48f8-f818-08def16ecf41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8274
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOMRpq+/+vGKNAjjw6LI7Nee0ev/Rbz+Pc0vPZkKM5g=;
 b=qQ+dFHu62+pF7Pu3LUy/HtXNtpu5uXrFa84m110DmGXkeJjXiUdyrTEUU5k9mpQaC4zxafturZl/0XqFP8xS5oKMRLscAL8Z+tddbSwVF32y4AwbEOXC+F2opIfOcfK6uP/PgDwi5Ul0Pt7kOJSMKtP5OXOoZYXKdH/s9/xNXqo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qQ+dFHu6
Subject: [Buildroot] [PATCH v4 4/4] package/xen: add custom git support
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
BR2_PACKAGE_XEN_CUSTOM_REPO_VERSION="791ade0eeae73a851f728cf2c9964dd303cc7d8e"

Add to package/xen/xen.hash:
sha256  bb4c156bedcf2e621f8de258fcc3d84a189c522fcf39df8de3865ba53bc10874  xen-791ade0eeae73a851f728cf2c9964dd303cc7d8e-git4.tar.gz

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Matthew Weber <mathew.l.weber3@boeing.com>
Prior test details: https://gist.github.com/matthew-l-weber/c17f14a3793ccee440a383e4177ff3db
Reviewed-by: John Ernberg <john.ernberg@actia.se>

---
V1->V2:
- rebased to updated master branch
V2->V4:
- merged into new patch series as the second patch
---
 package/xen/Config.in | 18 ++++++++++++++++++
 package/xen/xen.mk    |  9 +++++++++
 2 files changed, 27 insertions(+)

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
index 81568020d5..e22ac440c7 100644
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
@@ -107,4 +110,10 @@ $(error No tarball location specified. Please check BR2_PACKAGE_XEN_CUSTOM_TARBA
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_XEN_CUSTOM_GIT),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_REPO_URL)),)
+$(error No repository specified. Please check BR2_PACKAGE_XEN_CUSTOM_REPO_URL)
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
