Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9166D3A661
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 14:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 919DE40197;
	Tue, 29 Oct 2024 14:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxUBV0hAtoWb; Tue, 29 Oct 2024 14:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 608B4401B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 608B4401B5;
	Tue, 29 Oct 2024 14:51:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 317865E4E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 14:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE07E605CE
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 14:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0b-Ww5qmgegN for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 14:51:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::62d;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BBD726064F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBD726064F
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBD726064F
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 14:51:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irCdylB7aOcDDKFCmXfOhkIvJvfC9kbBp49GxbzMlRFoBRzvnXGcKAhtqPR8KSqoanvPByCqE+zmXegOacUoDE14MbggATzpLj4Rb/K/WSdBSOSHiaXq3/MCYWNwIutuMH+iBknFobfP1fjAhfBb5xa2g/Go17UvSn8HUMiMOAmwAyaxtn3TJhMU95nTvqpcV+k2HXMJfhMWPKhmoWkbv2yZesNyGCGensc/BzYZChaVQYASr+SsSrHutsS+jaw80+v0hctrX6YsMdpu2gS96LmMAkBmCQOThi7SpWAbAMZHm0jip4IOMtQe0r14He5kIIldJD3wTYy+r2lsMas4xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2k0zhxo2BaOgzrMax4Jwcu7OfX7OvVh6oi340xYvZc=;
 b=ifX8oVlvKa5+bp9Z4z0DMUzjic/aQs50my+1dsLTkER3yFWG/duLQfRIWpO+OqGgM8L4tzJqnPLAgzIC+UpU9FDB4HdgmfnhILDxjL+NL1wzMQqqX+be9ERTGKPOhdhFbiIVLA7CHbLh6gGvh7AO7W9KCh7H4d/gv4MlukMfRenterXClX+rpQumyC6TIwTEZmfZoUQW4Nr3R8VCpcCy/6hDHOc2fYiU6RPhrZWNf66FF7EyJzA4jrzcfPOMqj2NpmIE74AyzYa5eJnISiWNadZ1HdKw67u/szWXoYRWU+0uFfIssXrCGJiL/J5sw7x+BZm5/J4lheXDY+ZVk9Ue4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0176.namprd03.prod.outlook.com (2603:10b6:303:8d::31)
 by DS7PR12MB8082.namprd12.prod.outlook.com (2603:10b6:8:e6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 14:51:37 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:303:8d:cafe::3c) by MW4PR03CA0176.outlook.office365.com
 (2603:10b6:303:8d::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25 via Frontend
 Transport; Tue, 29 Oct 2024 14:51:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 14:51:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 09:51:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 09:51:33 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 29 Oct 2024 09:51:32 -0500
To: <buildroot@buildroot.org>
Date: Tue, 29 Oct 2024 14:51:27 +0000
Message-ID: <20241029145127.4011427-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029145127.4011427-1-neal.frager@amd.com>
References: <20241029145127.4011427-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|DS7PR12MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: f819cd72-4355-4ee0-a83f-08dcf82930a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YubLYRkaNE8embOdz8inKPXpEXEi8quFaLovbg2tShMiIIZKE38E2Aj5I6oW?=
 =?us-ascii?Q?pp1+1Mk5QO2t8eWbQtcFYx76OMiiiy83/HGrqjeLsVnltZueokxCu6H6nf+h?=
 =?us-ascii?Q?aQaUov6gLRx3EYqRYd5k+UNCcpxYKR/V7/cF7+SyluDUv2d9z4djTDbYlWzo?=
 =?us-ascii?Q?5PP8g3sUscnW/oWKd6TP0Ldl2DNDDMhtLlTCHNtW28JHvJMKeG8g/KKGMaOk?=
 =?us-ascii?Q?1+z4zi3gDghSEkfVFcq1S7iSOHGCddINYPD6x5EM8mOKpqkqOBy7OmAp+m/w?=
 =?us-ascii?Q?aKVG5ipI7D0jpQGWkK8hphO6ESz9HO39f+6ELMKzaOyw2S2GrOz8jnxpvj4G?=
 =?us-ascii?Q?rFgGPgpeGqUyCrGArCIpSWGuwYq6gu8FDQQ+H/r0rLPIfGwbfH99S3l2emu0?=
 =?us-ascii?Q?cIbXxQXP+H1cmEbvq2SoqEzqC7NJo4YwamQ2/jX8F1ucDJaBkp5xgD65Q4DN?=
 =?us-ascii?Q?Ye6fW3IDF2F15vpK7yQzfk9CeEvsPc4tPFWICWhq3gy1QgpqCbFMKAkj2GuL?=
 =?us-ascii?Q?YESZxWQXWkHga/SkLJQnzjwGFfSvlydu2klQBB5sskMdPnu+Smn8Iz7cmzY3?=
 =?us-ascii?Q?bwe6eg2Uxb80+B1qZHHMtwHtPhi09VdjvznAE6AZQS3Uej/sXMbyRhALVT+d?=
 =?us-ascii?Q?CKu6gbgQdc4rb8er93Ckh1dIouxyprYHXEsGG8IHJQ/V7nCkQ5IHYJ8g5mjZ?=
 =?us-ascii?Q?7wKojkz5vRgcrSaS5QAFHwQdFUIyBIBv1EtlHkST1miXX0tZ89CT8b/i9OaM?=
 =?us-ascii?Q?OP0qd5TA5JXckXn7K5AUHYHrIifHQDciReZyP01V/+qbxIjt5epDe5AhSE2x?=
 =?us-ascii?Q?pV8bOlnh0RTOgR7Q4hmh9F2xmAcgBYJq20GMd8Ufwe4VN9Bs6tczD+RhrA9H?=
 =?us-ascii?Q?PAn4ar4qxJZCvmjsEkj7SKmMzon0lLLZVqNTuojPlGI1fjjm54AnM8RjnGEA?=
 =?us-ascii?Q?WnvJhmWGcDbVt1X0/QAnDixaBHszP7PYVEGtjGZQDDWgdQMdUsGo0+W+0ozX?=
 =?us-ascii?Q?4h4Se8vi3/pArktr+MW6vU09SSpcB8MQ4CE6wKrI0VRbuRQDokq/UXEWEbyj?=
 =?us-ascii?Q?SK9+QbFoKuArXTbjnTasEiJw38JrpelsIX9qN+2+4ON1mDud23CyskY842YE?=
 =?us-ascii?Q?IQtxhkxKlwK9jHY7BGhuXFE5V8PPtJrHSFMkEIkq1tyqdvODD1uQCkGXozG7?=
 =?us-ascii?Q?CkYqYykSw33EIH1guNj0Jbzg2varshuRVCjrkpLPO7egn+pyY/VTxZyCOXaJ?=
 =?us-ascii?Q?I5f3IAVRWcS9Gbo78iJUQSb02xjwJsGqbvKQZ5h/e0ocRMvQtNv7jLrV+FgQ?=
 =?us-ascii?Q?xXlCGDLt1oM/ael5fjpipOndWyOsOQO1oxJ4jhgBHjgf5qP5MP+YaofOCysB?=
 =?us-ascii?Q?MJgcIApiZ6SepcYVRLOtYsseXuY2LNEFtOjS+bYInKE2uifkZQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 14:51:37.1912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f819cd72-4355-4ee0-a83f-08dcf82930a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8082
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2k0zhxo2BaOgzrMax4Jwcu7OfX7OvVh6oi340xYvZc=;
 b=xazUnI+aU/89uJO/OfXEtARopRrIriC+rZNH5rmAAcWckPaQ7zsE/hcy0nJl2aIEYa65uXbZUoVlkQVmYixzR3r/+q7njAi+FLKVBaO20UXDPxOlCRDwjLBTZlTsa3tdI/rdcCNhTO/CGTHNwjrVPJdY6zq2ko3fvCEJNWsAPwQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xazUnI+a
Subject: [Buildroot] [PATCH v2 2/2] package/gcc-bare-metal: clean up
 variable names
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removing HOST_ prefix from variables to follow buildroot coding practices.
Adding HOST_ prefix to GCC_BARE_METAL_CONFIGURE_SYMLINK package variable.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
-V1->V2:
  - Correcting GCC_BARE_METAL_VERSION variable name
---
 package/gcc-bare-metal/gcc-bare-metal.mk | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index 501f12bc33..5bb6baa74a 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,15 +4,14 @@
 #
 ################################################################################
 
-HOST_GCC_BARE_METAL_VERSION = 14.2.0
-HOST_GCC_BARE_METAL_SITE = \
-	https://ftp.gnu.org/gnu/gcc/gcc-$(HOST_GCC_BARE_METAL_VERSION)
-HOST_GCC_BARE_METAL_SOURCE = gcc-$(HOST_GCC_BARE_METAL_VERSION).tar.xz
+GCC_BARE_METAL_VERSION = 14.2.0
+GCC_BARE_METAL_SITE = https://ftp.gnu.org/gnu/gcc/gcc-$(GCC_BARE_METAL_VERSION)
+GCC_BARE_METAL_SOURCE = gcc-$(GCC_BARE_METAL_VERSION).tar.xz
 
-HOST_GCC_BARE_METAL_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
-HOST_GCC_BARE_METAL_LICENSE_FILES = COPYING COPYING3 COPYING.LIB COPYING3.LIB
-HOST_GCC_BARE_METAL_CPE_ID_VENDOR = gnu
-HOST_GCC_BARE_METAL_CPE_ID_PRODUCT = gcc
+GCC_BARE_METAL_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
+GCC_BARE_METAL_LICENSE_FILES = COPYING COPYING3 COPYING.LIB COPYING3.LIB
+GCC_BARE_METAL_CPE_ID_VENDOR = gnu
+GCC_BARE_METAL_CPE_ID_PRODUCT = gcc
 
 HOST_GCC_BARE_METAL_DEPENDENCIES = \
 	host-binutils-bare-metal \
@@ -23,12 +22,12 @@ HOST_GCC_BARE_METAL_DEPENDENCIES = \
 
 # gcc doesn't support in-tree build, so we create a 'build'
 # subdirectory in the gcc sources, and build from there.
-define GCC_BARE_METAL_CONFIGURE_SYMLINK
+define HOST_GCC_BARE_METAL_CONFIGURE_SYMLINK
 	mkdir -p $(@D)/build
 	ln -sf ../configure $(@D)/build/configure
 endef
 
-HOST_GCC_BARE_METAL_PRE_CONFIGURE_HOOKS += GCC_BARE_METAL_CONFIGURE_SYMLINK
+HOST_GCC_BARE_METAL_PRE_CONFIGURE_HOOKS += HOST_GCC_BARE_METAL_CONFIGURE_SYMLINK
 HOST_GCC_BARE_METAL_SUBDIR = build
 
 HOST_GCC_BARE_METAL_MAKE_OPTS = \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
