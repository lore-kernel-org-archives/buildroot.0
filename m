Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD97CFC29A
	for <buildroot@archiver.kernel.org>; Fri, 21 Nov 2025 18:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A095640779;
	Fri, 21 Nov 2025 18:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6oP7V0DB9fA; Fri, 21 Nov 2025 18:09:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD9004077F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD9004077F;
	Fri, 21 Nov 2025 18:09:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BAC1F158
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 18:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A18094075A
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 18:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdQp_qS-r3-g for <buildroot@buildroot.org>;
 Fri, 21 Nov 2025 18:09:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c000::1;
 helo=byapr05cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8FFB6406AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FFB6406AE
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c000::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FFB6406AE
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 18:09:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSrfUXwn+hRs8q1xk9PlQH4BwkgmiXCT7SEBAUIY1og1Jh7AOO5u+dtkwjp2M37C4Mo1PkcGj0XVJ7KsMA8nDYPwIIAqSgdWPgIpM45fUmUMNeG9lvi47Dl40xcfFU67pgJTtYfJ+B60cKhP4oEkosJc3u+uBbEjkX2cG6mfmfrTDMMBE5ihVA/bEdFVthEjWLI5mu5czpD0XgsXbG/UyIUkK/XevKWCJGglq9Z5kPr0wRgkc5BIgGyOQdCiWEPqJqSVu/13dDtKTfjLfS6/IlrmrCbEA880bormVY5pyrOq4cQI8yTuZcDtCMNfe1yCBlckOxsSqVi/IXEJVAJCyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8u7R9RjPcBWmzUb/4O15N0GD0bD/z/tRaR+XT/MzYR8=;
 b=NnndyjZW3JtFQZKjbeoNfqIRRapFIirQCEOAsusx9n9W/+foijM55UQeo5eSbfySHVcTv+JM2LIma7oCfHwbQuL7uaVErfg0m8zCLI4vCevnIXiDWTleScEwgyjQFJbFkIIDsk9QnG+nNmmJP7ySPf4HScTew7uTGOkvRVvdpRZ8U1pg0tt/scl8sMSXCmJ7XU/zs+ClgzLH7QsmHW7Z6bmXFo6s/qXqDq+F4Fp5EoVwf7KqBA/A5Jz5gYpYYm1WhyLXms3NopBFC8A17e51SMnAqzdHzjhpBRduomUvEJMI1jI5vDJ0wkzZ00/GKgwzecjkjxPcJqMxtZOavcVcyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BLAPR05CA0043.namprd05.prod.outlook.com (2603:10b6:208:335::23)
 by MN2PR12MB4128.namprd12.prod.outlook.com (2603:10b6:208:1dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 18:08:58 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::de) by BLAPR05CA0043.outlook.office365.com
 (2603:10b6:208:335::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.6 via Frontend Transport; Fri,
 21 Nov 2025 18:08:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 18:08:57 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 21 Nov
 2025 10:08:57 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 21 Nov 2025 10:08:55 -0800
To: <buildroot@buildroot.org>
Date: Fri, 21 Nov 2025 18:08:48 +0000
Message-ID: <20251121180848.2106965-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|MN2PR12MB4128:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a6edfc7-1cac-4d8c-93b6-08de29290a2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6q2/V6d6voLCTL/xgfSnSH9WplwjNrPsqQs7YzOMhnAmzhy//dp6bhhHDlRF?=
 =?us-ascii?Q?jR4k6lagPrWHVuElnkA2HP4YpkXewVnS+em4TeXc+hDfLMKb4YlsfeZW15/n?=
 =?us-ascii?Q?eflmkTQvThwfStK1PyK0TizZK7ptt514t7Joi4wGehnlqEIeGShg0pUvchoW?=
 =?us-ascii?Q?WIF8Wzoo/vtVSPeRrd5HIhJuHsie2lgerW9sUt0djC90lQUx+GPOLg3i4TQo?=
 =?us-ascii?Q?63DN9yua+HDjJA7MhYnmhYHjMCsJ9Ku0rOh2ZmUwHrWJVygcTDZSSfshGkeY?=
 =?us-ascii?Q?o5xLORQO9H2YqbZ1p996t0h333vhZoljZCABUudM92arJ7VAEou7afcDUL3g?=
 =?us-ascii?Q?oVWAlFO1xR0s34KhETk7w8Qqy1TxNCy2xjEysbTARAEEySeDiQ5ucOmZhjUC?=
 =?us-ascii?Q?2hltVpHT0dEqReD1M/1pRssL9mkRU0W1h7KNnWyX5aycxtiC7vKfAhnIWQ/i?=
 =?us-ascii?Q?KxocwBKMrd3oPY1JPlDimn1Vnuvux5Jqwu1kKWnmYG1+yk+dRgXWoSg0WaTY?=
 =?us-ascii?Q?GE/IwKo4LyHhB4r2zxtumZ2VrEkz8Eegg+u6VsCa3XiHI07rPTLoxry1O7bH?=
 =?us-ascii?Q?QIJivhONpdZxDQEEmxFikSUwWhZ0GV6BZAetna29EerXErX+k5JITkPKhfXC?=
 =?us-ascii?Q?Dg6P7UKGZaMgl0hI/5cRQe0hQflR7KZCxospat/DUvYi3RIGRfA+PNX7J2GH?=
 =?us-ascii?Q?V9GU6wOySr0qpcdSWDy6YCn1/pVh7Yo4kFbIOkqvmO/p7mUUQsfHzqer/KFu?=
 =?us-ascii?Q?z3CM5iyVx/1xaKyOIEMZyHJIl8qc3ILR8hP8R/C4nQT6F/KlArBwMjwcOKq9?=
 =?us-ascii?Q?/UXmFs/4EArQZbaPnovkEF9nuQRuLsNfGGajgX0A3cLmFZSCiu505DRBvBTX?=
 =?us-ascii?Q?gQn8hVfenYO5Y48qeHqto2EGhita6EzJddtKvhM5/C8ldo7w+N9a3doqP3O3?=
 =?us-ascii?Q?2ZWyljfFyz7A6YuVZeesD6WZUUdM1qlJO5TCfiMYvHlsw4MWLNDNRlDdaO6E?=
 =?us-ascii?Q?GQH1oixFgsoQscsm98lyP738Vl1zl8a7uTYS8xyi7Ymfnk13Q1ztfqWemx2V?=
 =?us-ascii?Q?H8f5csd1vh6a/PkfrOgM8sB5Q9UMol6Uez9RwBt6zGmm1Lw7QAizupHUOOvD?=
 =?us-ascii?Q?7RbWk3T0YL0wriYv6Zt1tgJKMuqhUN1JThd48rCSlAFiYnCG2ZbSWT9LdZR0?=
 =?us-ascii?Q?pQ8a0H+3IIGCCOE52Sfc2ILRsGxCjERAJBiCmFixqzQnb35gs2Zg1WXY1qx3?=
 =?us-ascii?Q?I5jcUF4GSdRADYr2I2RwZ7sUn2vPOUIXopLEig6NB3whPS75rl8vDVQq0R6q?=
 =?us-ascii?Q?wNdhIbYzUXZ8NCC3C1sQzzcSVwzganxZDn0G0ahXd/9v6oDCl5HBplvOlKx4?=
 =?us-ascii?Q?MAjTAfxxGWJVi3YIoyIQlzRCw6+Lv4mG4EALYKipakI3ye6c4vFKnDNt04wi?=
 =?us-ascii?Q?BkmXt+1eD4d2XX68k44IpqUAGGI2ABI7st+iPl7NGju3Re9yeDyRMNl4WfWu?=
 =?us-ascii?Q?JXBM086nQS/O8F82RMAbIreQgtiy8f6/kCP+oBY0xWWqLOv566ev4n4P0ZMg?=
 =?us-ascii?Q?J7/QmsMKHusW75SFMNU9JbnD/UWYUHf+oZyVzMPcIWNjyORVXyvp1TxaPvWq?=
 =?us-ascii?Q?2g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 18:08:57.3849 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6edfc7-1cac-4d8c-93b6-08de29290a2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4128
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8u7R9RjPcBWmzUb/4O15N0GD0bD/z/tRaR+XT/MzYR8=;
 b=D5DZsXDHfMVr4x7ryHD3bEVSpfhwlYSo3WzHAe/AxjdMh5VoX9LLyg6o9K2ISclIIKCptc12VYguem2Jyjk429AAvNeATSha31kJpnYxEDvtZNOGw4O8H55GUgyrRsB5pQit+1M/IxPISxb07XkPouaOCejBj9WTziNdE3bGrUc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=D5DZsXDH
Subject: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to xilinx_v2025.2
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump bootgen to xilinx_v2025.2 version.

The 0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch is no longer
needed because it has been committed upstream and included with the
xilinx_v2025.2 version.

https://github.com/Xilinx/bootgen/commit/0471f084b05769143ea9e73f9c44b075fe40c801

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...x-build-on-machines-with-modern-flex.patch | 72 -------------------
 package/bootgen/bootgen.hash                  |  2 +-
 package/bootgen/bootgen.mk                    |  2 +-
 3 files changed, 2 insertions(+), 74 deletions(-)
 delete mode 100644 package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch

diff --git a/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch b/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch
deleted file mode 100644
index 817fee195e..0000000000
--- a/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From e7e341b7ba6fa9fb875718e8740b03c2041278e8 Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Mon, 2 Jun 2025 12:09:13 +0100
-Subject: [PATCH] bisonflex: Fix build on machines with modern flex
-
-With bootgen 2025.1, the directory structure was re-done.  In the process of
-doing this, the source files in the bisonflex directory lost the fix below
-which had been applied on an earlier version of bootgen:
-
-Bootgen embeds an old version of flex, but uses the system include syntax
-(#include <>) to reference it, causing conflicts on systems with the
-development headers for a modern flex version installed, leading to build
-issues like:
-
-../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
-../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream'} and 'std::istream*' {aka 'std::basic_istream*'})
-
-Fix it by using normal local #include statements by:
-
-sed -i 's/<FlexLexer.h>/"../win_include/FlexLexer.h"/g' *
-
-Upstream: submitted to AMD internal jira process
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
----
- bisonflex/bif.yy.cpp        | 2 +-
- bisonflex/cmdoptions.yy.cpp | 2 +-
- bisonflex/reginit.yy.cpp    | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/bisonflex/bif.yy.cpp b/bisonflex/bif.yy.cpp
-index 8d4d364..35f0aa5 100755
---- a/bisonflex/bif.yy.cpp
-+++ b/bisonflex/bif.yy.cpp
-@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
- 
- #define yytext_ptr yytext
- 
--#include <FlexLexer.h>
-+#include "../win_include/FlexLexer.h"
- 
- int yyFlexLexer::yywrap() { return 1; }
- int yyFlexLexer::yylex()
-diff --git a/bisonflex/cmdoptions.yy.cpp b/bisonflex/cmdoptions.yy.cpp
-index 661d7f3..a76ac81 100755
---- a/bisonflex/cmdoptions.yy.cpp
-+++ b/bisonflex/cmdoptions.yy.cpp
-@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
- 
- #define yytext_ptr yytext
- 
--#include <FlexLexer.h>
-+#include "../win_include/FlexLexer.h"
- 
- int yyFlexLexer::yywrap() { return 1; }
- int yyFlexLexer::yylex()
-diff --git a/bisonflex/reginit.yy.cpp b/bisonflex/reginit.yy.cpp
-index d830734..dede473 100755
---- a/bisonflex/reginit.yy.cpp
-+++ b/bisonflex/reginit.yy.cpp
-@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
- 
- #define yytext_ptr yytext
- 
--#include <FlexLexer.h>
-+#include "../win_include/FlexLexer.h"
- 
- int yyFlexLexer::yywrap() { return 1; }
- int yyFlexLexer::yylex()
--- 
-2.25.1
-
diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
index 7670a5d1ee..995074c591 100644
--- a/package/bootgen/bootgen.hash
+++ b/package/bootgen/bootgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3de43a331e10b2a8079d4681ad72cef4884bc3a09250d3d80811d677f3ffe560  bootgen-xilinx_v2025.1.tar.gz
+sha256  c92d9be48fabc943c4addd9b12beced6671f5547b4f6dc01e7ccf0f274dbef66  bootgen-xilinx_v2025.2.tar.gz
 sha256  36e278ff2cc9ef95154a923bf4a9450414f358779045ae4f863c8d77fb18dbdb  LICENSE
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
index 939872b29c..e5cfee18d9 100644
--- a/package/bootgen/bootgen.mk
+++ b/package/bootgen/bootgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOTGEN_VERSION = xilinx_v2025.1
+BOOTGEN_VERSION = xilinx_v2025.2
 BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
 BOOTGEN_LICENSE = Apache-2.0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
