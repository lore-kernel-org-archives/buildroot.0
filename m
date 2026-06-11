Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD176CD98CC
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 10:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4791E607AA;
	Thu, 11 Jun 2026 10:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUeAj_1K2wqM; Thu, 11 Jun 2026 10:17:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 881CE6079B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781173074;
	bh=xFIHZWnvnfnQjLaupHRqVxMYbVmBLTmshO2xhSWiWvY=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=RLmW0lq3exotpmNaBpFSZplyk+zVg5ipxBDu8oROf7A/8D5Iao6SO0zvWYDKsoerf
	 O+igVtZaThF93XrtFFHapIsjUFJuCnFoqPaXWhFGJQyfdEI/7UKWaTto9rMj5myuLl
	 TCyFdICCDTEUEFG4lkZ47DMgT54CyRwpz8RYfV9z2rO6Y7+sS9X3s2e7v2QblXFXBK
	 Kd+sz/p9kaCHfJF/UdziwQV3bWqRNCPxuMbQzzzDR/7kK7KKdqlFMj+vZUFzsC0HR+
	 v86K4yc6XozUCw6TH+vHGFf70lBluGe+OtKSOETJPwNWOhGqbwXr3VXKt39kQOeFCZ
	 FX9qRS3TvI6LQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 881CE6079B;
	Thu, 11 Jun 2026 10:17:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F31712F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 10:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E69840181
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 10:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnVbiP-BWMKS for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 10:17:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::9;
 helo=dm5pr21cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3043E4016F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3043E4016F
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3043E4016F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 10:17:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpUjnWUox+LVnkWhebjIpz/X9arQ24LZsrp4jsVKrQoJeUSlqLQgbBl6ZiK+XswMiPSbMJ4JPlaBkCigA2yU8Q8iuHkEffemS8yea+MTCPyKPkZh9kjyjR2rmMaCMtciKxyt798KyQ56oBy/1xeAAXi9rVu8JlDt5iJuzUHCUdS+wwYq9oyLkZ0HY5Y523s9dUaSLmWsVYlGO1yEE2UTkQJ+2g85hIzvi66X1ZW1HsYbqn+uDHfOcZthsRoLM4+6KfXVGQglGJ1DLCq1J3oBB4H0QuT6gDsUEJUdRMLv0fSIt6zo7xuOPubVzMIanzgKmOwa0ULMsHG5WT/BI0vijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+PM5sTaxG1J2yWVEgQyfTUpD6CXOfbly/DjYn3JOIo=;
 b=iUz1IZnYJyrGp5ZzSUKqyXuJ5YRnfbPpj4DbGNAPW/Vn9901nZ+zW20mS2p1VXOKCYeBUleZ9aZERaqIOFyWQuEFXL2hO71TOGkQKumw0gHMWRCFn5Ac/MUzez5Ca3m4suD+YDgXKzMBksXhOER6VLeudVmu7e6xjGTzwhzyoQnZQAmZGik2k6g7rnmErpO0h6DKQsztIOMKwQQO3pxAl/qvlSZ/p3W2UML/CqKUNclDxwn24Ds0HCxMHqs0ecuC5mDslRu6b88++iIurmYLcWr8AVthz5+NQS/oyvVZtI7h545eM+wcj62NmiPOeYCzYZDI9K0uozcGco8us1qHRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR07CA0121.namprd07.prod.outlook.com (2603:10b6:5:330::33)
 by PH7PR12MB5782.namprd12.prod.outlook.com (2603:10b6:510:1d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 10:17:44 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:5:330:cafe::a3) by DM6PR07CA0121.outlook.office365.com
 (2603:10b6:5:330::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 10:17:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 10:17:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 05:17:43 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 11 Jun 2026 05:17:42 -0500
To: <buildroot@buildroot.org>
Date: Thu, 11 Jun 2026 11:17:34 +0100
Message-ID: <20260611101734.1968785-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260611101734.1968785-1-neal.frager@amd.com>
References: <20260611101734.1968785-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|PH7PR12MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 450808b5-64f8-4747-a941-08dec7a2ad91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|7416014|1800799024|23010399003|82310400026|56012099006|6133799003|11063799006|22082099003|13003099007|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: O6XFUrk/JgXviLT37xSfi6ZyyLgccnRm+fDzdk8qgiowrGCi1RBSU6BHhdNo0+8+nDMlqMR2BINTzpBLVz50vFUp12BAbl6+mVCn0MA4bmDRcMtZboARfcsWMKt8iy1hVgwIGj/K9sLLG6ufK1+zT6zonR5cmtiqno51f38t+zR3dR9Tl5rTXE/ZASHLPUxNvjWpekssTklNMY0Edj/HLLEfkb1Aijj8C2Tpr7+KhZOxOPrwJJ6BjJsUTjV5dxBHXqUbNGX6ZUCMdfoWijyIivBOWKtpQ1WiuJKeUV8uO9aqllltNLlGvYXulBRndd6OB1zVgi1zqjECf8521LW1hxo2bWvosmxA+O5peb0SnYAnPpOSd+ngUmoeWSvny+rbnW3JD661g0FsYDnZM6/quOlXelRIVogZrkYehgZ2M8G2+0vErCOTht5YS++8SfDynGXKTsA+5HIWb6RPfCH98wc2tZM9pr4L14L8UBODVZPEu7zc8wjmw514tIWsNd4dBHRolQop2ngR/TPKUQDOi4oswfD2uqjxOafCdwm8dV5HXjlWqu/Pw3ofJjAzxK70Vc2KQVVaeb3tvsrzncZ55CZS6cFfcE7qmhNGkvFAWzOCsXnQFOZerDkLU8cMTD1ScsNUK05JvApgr0PoJ1F/aw8FsNpnK38DmOg4yJn7Lr+9ZM/Mamr0zziq5P6Jtl2dJN3xFOrkBLFeRa2bygUGJBnJ3mbcQLjAVlpVinR7wpRm7vVDLZHMQGAC3bRqDWrs
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(23010399003)(82310400026)(56012099006)(6133799003)(11063799006)(22082099003)(13003099007)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kOFR4kg4ut8CETx+bjOevStY0Regi0SCITI/c9kGY64s7c4/Cn+94bqaHmMEO3Njiyq9Itr+8CMN9o5yrqKp9VYrzsUzk8MB0rxVzNgMLMEPyN+tOpTafhTC6daC+v2oDWRuQKSrg65UU6E8AISaI8Ns3AKpEbZkyE5gSZ5Dq6BwY0MgEXMlFCZbCfK2956ez5Pc/nduBJ1CjA7mXzgAgUvJ5TJHkq/U6Au0R7Toy/KB08bVaitRHvC1RULpJv3TTTjwuysxIKWrZKTOImR7DVcSlS0OnzUq9mrlcWikLfhYedr2X8thDegnD4DjcbiVSmDulP6ZV8ZR8UFDAZTWzBli3ytJLhFcuIh5EHrIqm9o+7OzjKiGwXC2CVL+MJeGzjQVMxBQjAGLUis0oYZ5iG82KyGqKgR9kYhEFyMGUtD7TRPXVXUb+Mkx3+6/MMY4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 10:17:44.3044 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 450808b5-64f8-4747-a941-08dec7a2ad91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5782
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+PM5sTaxG1J2yWVEgQyfTUpD6CXOfbly/DjYn3JOIo=;
 b=wRAvwOLjzMbMxFYy1cDtVZaHLk21Mu9LPz+M5xMSm5gX+hbVd0xXSdeGzAv4jrOWW2werAShEw6YWzMlOo70b5w+KC6b+Y1blhGtg50W6hB/KQ6GFkqDbFtJZ0io47e1yKAdyZNPeca++4GAi3rOjj/shg0vTzEvYhXqjnAHiaw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wRAvwOLj
Subject: [Buildroot] [PATCH v1 3/3] package/xen: add custom git support
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
 yann.morin@orange.com, matthew.l.weber3@boeing.com, brandon.maier@collins.com,
 brian.j.wood2@boeing.com, ju.o@free.fr, Neal Frager <neal.frager@amd.com>,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For completeness, add custom git support to match the capabilities of other
packages such as Linux, uboot or ATF.

To test this feature, add the following configs to any zynqmp or versal
defconfig, so that they can build the latest release of the Xilinx Xen vendor
tree.

Add to zynqmp_*_defconfig or versal_*_defconfig:
BR2_PACKAGE_XEN=y
BR2_PACKAGE_XEN_CUSTOM_GIT=y
BR2_PACKAGE_XEN_CUSTOM_REPO_URL="https://github.com/Xilinx/xen.git"
BR2_PACKAGE_XEN_CUSTOM_REPO_VERSION="646d6c883ef433c1a9ee1145f80a4262986698af"

Add to package/xen/xen.hash:
sha256  834b1834a31d79e91e7943457d8c78ef8bd95c142ca5f347ab1c4aeaa4b60192  xen-646d6c883ef433c1a9ee1145f80a4262986698af-git4.tar.gz

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/xen/Config.in | 18 ++++++++++++++++++
 package/xen/xen.mk    |  9 +++++++++
 2 files changed, 27 insertions(+)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index e97522d22e..2157966082 100644
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
index 02d4aeae46..bd23297b3c 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -17,6 +17,9 @@ ifeq ($(BR2_PACKAGE_XEN_CUSTOM_TARBALL),y)
 XEN_TARBALL = $(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION))
 XEN_SITE = $(patsubst %/,%,$(dir $(XEN_TARBALL)))
 XEN_SOURCE = $(notdir $(XEN_TARBALL))
+else ifeq ($(BR2_PACKAGE_XEN_CUSTOM_GIT),y)
+XEN_SITE = $(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_REPO_URL))
+XEN_SITE_METHOD = git
 else
 # Handle stable official Xen versions
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
@@ -81,4 +84,10 @@ $(error No tarball location specified. Please check BR2_PACKAGE_XEN_CUSTOM_TARBA
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
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
