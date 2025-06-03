Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300B6C5AE59
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 13:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC92A40504;
	Tue,  3 Jun 2025 13:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TsCA98yZEZV5; Tue,  3 Jun 2025 13:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3CC341EF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3CC341EF4;
	Tue,  3 Jun 2025 13:48:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0833DA
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 13:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1ED183D39
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 13:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VWBO-30wZ5U5 for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 13:48:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::621;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D221383D35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D221383D35
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::621])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D221383D35
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 13:48:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1yft/Z2ZX/kO5ad7daVGHg6xthIUAF3rkGbTYV8fGtE1MCkhv1k2Wfon6zjfi+1pFJhTfPJMvu7zyqo/yyVE1g4Frvy5+vsmOaa6YoBhuyS3jhLpeUgXRL4ZaiwTJSrmPYX4oyfzj2Cmg4QSRMU05lvt5NgD6gAUuV1X1bUtYPv4t+vfB4GAmXkbIyFdlmpZzV5LNX/6+ELaLbJPO0kKb/my6Du6IohYeSqMpsxSjlcU+wOo/7uZlgyMUce4pK/uEYwV8M4Ol5ztS2FZyUBoAg+aD1gnzBjBpxpy7lhoiG65lY5Dk45TfmIkoOMnNP3KvJpGgiNJXHDN4eKewxqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaKvMSo9SqpcDd4dWCu96y8yPhxRqtlrtsnE5x0a5YM=;
 b=T17ZfrhREqqmo59K8etJH5bOj0z0apnuUgf9HvMQjJ7V8pLLJrS6zaVv1sylZLKCqC6SSISa88+EEaKr7tky4o7Ke1GW0AUl3ZX2UsxBLuume3qIRzt6k/EIaVuM6yHiEDtJzio2MWDJdylsrLELez73/FbBtAHHl4ChorrXAjx0AZ2Dt/Z5atOTy/4o+QbXNt/2TvbKtfSztkdFLZsKXGUhQnKhSTX83GAwoFbM07h0b8hFm7AOwrS9Tlztv5BNBImM7Zsb5Llr3HftToRL4Bs+un8bG7AuFUjMouXSdw5twPSNNTDG987EII6Rd7p8qjKWNNuhHGyEnynX8FJ6rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA9PR13CA0076.namprd13.prod.outlook.com (2603:10b6:806:23::21)
 by SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 13:48:18 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:23:cafe::ee) by SA9PR13CA0076.outlook.office365.com
 (2603:10b6:806:23::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Tue,
 3 Jun 2025 13:48:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 13:48:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 08:48:16 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Jun 2025 08:48:15 -0500
To: <buildroot@buildroot.org>
Date: Tue, 3 Jun 2025 14:48:12 +0100
Message-ID: <20250603134812.2883296-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|SN7PR12MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: 95a6e893-c0a6-43ab-dfda-08dda2a54b27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mA53wYC3HelP3ol5YikyCD2ZYSVA+CRmhYR/ZsjoIwPyrza7YB67xUr/l/VP?=
 =?us-ascii?Q?TqkvBf7BiYUPQ5CBYWhOX0qPCxXAFwzT1Kh9T/UZsvhM/B2q0G3nQc/s6Udp?=
 =?us-ascii?Q?sliV+6tuiLkmugAaUB4ll5u+LzzWmyiRdYShZ4e2e4x+Fvwf3n30/lKxL7MC?=
 =?us-ascii?Q?+6N5SBGncHnrNZcIWRAX3QYq80JpLx4wkd88OOf4NzZHq9zgZO1Ud6n8u9m+?=
 =?us-ascii?Q?JP6zbcYimRRRDlmeXGBRxZ4seILj6nu73ykHWScdZp4/gneHy8TjWsdc68ne?=
 =?us-ascii?Q?HRg8hasrwoew0PHjWuoGSpaqcfgcQAKO2qjVwQfPDO+qWcJRO0jTV8uFauci?=
 =?us-ascii?Q?YfZKdcnVvuRQ05AHgWjlSBLF+pHR9hajA8+oUYAEeXfQrDWhoXgY1uH0KI56?=
 =?us-ascii?Q?4IMOzBM+1x07PmOYqu8jrTaZeGK1GO06ZzWZA/JcfXn9HsNgKHeXX4ClPzm1?=
 =?us-ascii?Q?5YlCpvyHDxbPPGSW+eVFaQcPSgwko3IUTdK8tA2zJzBDi2mLpADEC6DwyHVp?=
 =?us-ascii?Q?4i204FRFP8RzWaFf/XjQXKvn66ErN2HiY6iI5nep4ZaGzqK+nf+EZNCpeB74?=
 =?us-ascii?Q?uPpoBxfgmdQjA8NhHND1D8cHCG2iwUtrdoVVUc2EiIo9/PoNhffgD4fo9K4+?=
 =?us-ascii?Q?aqwnzo4PxqaB19Thp4MtoKQTqdXvLN8i2xDx7fchqLnoskFqlz4+7CmBS/HB?=
 =?us-ascii?Q?PrQ9Qz48g2deTD+3TlC2e5Fmrtdr5ndRoD46bqd3Sr6ISHw85nb25GX0d5dx?=
 =?us-ascii?Q?ziMUPya3UwIoiFJpj3pbWX88gmCG+UMe9vmui3cvJEwShtmWBgkdaQbcoAC3?=
 =?us-ascii?Q?jP2SJbFdH19PuQlzmkstRQS6vPHI1MuZNhCUzrP6EWwOimQAQr1TtTTYqMbF?=
 =?us-ascii?Q?mtArg6U6xks2ecnEP7NpkIJb412/rcVP5xVZm7NycRsjrYz8bZPTQPfE0vL2?=
 =?us-ascii?Q?femT7f1NfbWNMZOaR9WfDdKLYoHiwgYyCCPwkVgpGxekGzz8ziqT5R+0M/go?=
 =?us-ascii?Q?R9vtBBBk9Cun7lFwNhT0oPgF7Y9mPG5urRoDTUqWWTOeILUO5Dr40ouYzLGx?=
 =?us-ascii?Q?fz0piJDHbnhjed6pyLwynAuV1ON1jRsUTILt8djQ/aHdswLEhJCWZ1bjX0m4?=
 =?us-ascii?Q?aWjmRr3ptwWehJDHJONUzcGFCvDILilScZqpmwyCE+MzORUV0Hj3wcgGnAd2?=
 =?us-ascii?Q?Dgsa8rURwFHd8I3681niZ15lX/vPAW1D71c/lGimOhMJ8k1nP5c9CIYDIHAB?=
 =?us-ascii?Q?vLzKzLd7KUtlZzOBSUCJxu+xXXoJNo/KxtiNwWVKIXyjxJkbdGbbFjHNOXYr?=
 =?us-ascii?Q?QtNULv5nDuEMrr5SBjVri1e95sG/YSL1zw86OupqpUrRDEGY8PQpLiGcKrrC?=
 =?us-ascii?Q?NTnpaJbKA+LPtkKEd7OhhxHf/LbkZugqRoEEAfYYeLqcEixmFEmbyRYGz9I4?=
 =?us-ascii?Q?Els7PC4DWFrhw2L8vtxjAZ/7ZhsYi/jXx6a61ny6h8XYmlNgbXMM1VuhFP3n?=
 =?us-ascii?Q?riUZnKr7J35QbOKKsPHdlZTEY23ZUk/Z6KWD?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 13:48:17.0024 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a6e893-c0a6-43ab-dfda-08dda2a54b27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8147
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaKvMSo9SqpcDd4dWCu96y8yPhxRqtlrtsnE5x0a5YM=;
 b=mzHi0n6jSKeDPO6SZIJWkLgJ/aq8CJjNMz08hRURzLVnJtV2MqKP27f7RkvsgTpugyjn00+h0BXsi0f4HlEm88CJP6tDuMJM2VeqZbgBy1RuxnBU9tPP6BRcfWdoF7FQlCZu5/pQO5Ioj/b64kf8DGNl5WrvDPAqzTCXCbz7Drc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mzHi0n6j
Subject: [Buildroot] [PATCH v2 1/1] package/bootgen: Re-apply fix build on
 machines with modern flex
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
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With bootgen 2025.1, the directory structure was re-done.  In the process of
doing this, the source files in the bisonflex directory lost the fix below
which had been applied on an earlier version of bootgen for the issue below.

Bootgen embeds an old version of flex, but uses the system include syntax
(#include <>) to reference it, causing conflicts on systems with the
development headers for a modern flex version installed, leading to build
issues like:

../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream'} and 'std::istream*' {aka 'std::basic_istream*'})

Fix it by using normal local #include statements by:

sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *

This patch re-adds the patch to fix this to buildroot.

Fixes: https://autobuild.buildroot.org/results/056384322246877253cd8d0781717ce495cbe769/
Upstream: patch submitted to AMD internal jira process

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- removed patch numbering 1/1
---
 ...x-build-on-machines-with-modern-flex.patch | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch

diff --git a/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch b/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch
new file mode 100644
index 0000000000..6d048e9bd9
--- /dev/null
+++ b/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch
@@ -0,0 +1,72 @@
+From e7e341b7ba6fa9fb875718e8740b03c2041278e8 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 2 Jun 2025 12:09:13 +0100
+Subject: [PATCH] bisonflex: Fix build on machines with modern flex
+
+With bootgen 2025.1, the directory structure was re-done.  In the process of
+doing this, the source files in the bisonflex directory lost the fix below
+which had been applied on an earlier version of bootgen:
+
+Bootgen embeds an old version of flex, but uses the system include syntax
+(#include <>) to reference it, causing conflicts on systems with the
+development headers for a modern flex version installed, leading to build
+issues like:
+
+../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
+../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream'} and 'std::istream*' {aka 'std::basic_istream*'})
+
+Fix it by using normal local #include statements by:
+
+sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *
+
+Upstream: submitted to AMD internal jira process
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ bisonflex/bif.yy.cpp        | 2 +-
+ bisonflex/cmdoptions.yy.cpp | 2 +-
+ bisonflex/reginit.yy.cpp    | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/bisonflex/bif.yy.cpp b/bisonflex/bif.yy.cpp
+index 8d4d364..35f0aa5 100755
+--- a/bisonflex/bif.yy.cpp
++++ b/bisonflex/bif.yy.cpp
+@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
+ 
+ #define yytext_ptr yytext
+ 
+-#include <FlexLexer.h>
++#include "FlexLexer.h"
+ 
+ int yyFlexLexer::yywrap() { return 1; }
+ int yyFlexLexer::yylex()
+diff --git a/bisonflex/cmdoptions.yy.cpp b/bisonflex/cmdoptions.yy.cpp
+index 661d7f3..a76ac81 100755
+--- a/bisonflex/cmdoptions.yy.cpp
++++ b/bisonflex/cmdoptions.yy.cpp
+@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
+ 
+ #define yytext_ptr yytext
+ 
+-#include <FlexLexer.h>
++#include "FlexLexer.h"
+ 
+ int yyFlexLexer::yywrap() { return 1; }
+ int yyFlexLexer::yylex()
+diff --git a/bisonflex/reginit.yy.cpp b/bisonflex/reginit.yy.cpp
+index d830734..dede473 100755
+--- a/bisonflex/reginit.yy.cpp
++++ b/bisonflex/reginit.yy.cpp
+@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
+ 
+ #define yytext_ptr yytext
+ 
+-#include <FlexLexer.h>
++#include "FlexLexer.h"
+ 
+ int yyFlexLexer::yywrap() { return 1; }
+ int yyFlexLexer::yylex()
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
