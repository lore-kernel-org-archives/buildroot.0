Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC4CC77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 05:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA2F340529;
	Tue, 16 May 2023 05:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA2F340529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQ5WLLojXhjZ; Tue, 16 May 2023 05:15:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87ACD40191;
	Tue, 16 May 2023 05:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87ACD40191
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CBE31BF34D
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 05:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3F7A41680
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 05:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3F7A41680
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZkzWKr2rCY6R for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 05:15:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8EF541622
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8EF541622
 for <buildroot@buildroot.org>; Tue, 16 May 2023 05:15:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjoIYRuoBx15KLzSgmTWK4ib+weBfW98Rl3Ib0MFG4YHl1zJUkuejs04Dy5cGykRuIzv0jBjnwH5gvXm+ZEjcet5OWS7G1OSGI0kx0truyNw2zQLAaDpGmbfFgOGc0VFAbFLu1KvBAitPnVkNNTQxWzrz8CDa2JshqTXElxGtBp2cw5zUXwImq70eaayqx3KxjFXZ4/jQOdbubIU0uIuTSp+p6fHKpHnEgPOyiM4KEDmB4Clpx81E2Drk7X5dcEEgAbbnsrslby4/NGRlP1hICZPG5e7suX9rcrlmwgvKgEe70qBfawWtNq3zMovuZeSYk6cCOPPg7/mvuET5UqlEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WUQBxn8DHnjb5TF6dXbLFtfXujvb6Qu9nAyNMi+ht4=;
 b=AgI+UjNHemUwObcFccbX1UEzUcjMXZER8oIihbje1Ny1Ax55mOvpJaaXDVshKlBMbP8JQRsHnw5bfYw32Sx5VQOpIV71o/n7Rv9cDoF8aZ5TAhMvbWZXmw4CB+eTMp019VDFQiJ0lVkQXgYWwZJkBF2ZTBofIUuBY99hPRBiCeLNf5c7Few7EXN1Emk7qahPJz8W/6yj1wSbk2gmpNtvBSGOW/hKiVZr9ID2ScfwacIT+q8ibguEfHEGBeNpDxJARz7tzCDVdaPWBiDpytGQ5NGVyvC67yNdAIS9muHJ6SakTUGYKkW1HxrTrHwkiGYkq0GCYWQlPsoNB+ayLwWC3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BYAPR01CA0004.prod.exchangelabs.com (2603:10b6:a02:80::17) by
 BN9PR12MB5276.namprd12.prod.outlook.com (2603:10b6:408:101::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 05:15:10 +0000
Received: from DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a02:80:cafe::67) by BYAPR01CA0004.outlook.office365.com
 (2603:10b6:a02:80::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30 via Frontend
 Transport; Tue, 16 May 2023 05:15:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT006.mail.protection.outlook.com (10.13.173.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 05:15:08 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 00:15:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 May
 2023 22:15:04 -0700
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 16 May 2023 00:15:03 -0500
To: <buildroot@buildroot.org>
Date: Tue, 16 May 2023 06:15:00 +0100
Message-ID: <20230516051500.38043-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT006:EE_|BN9PR12MB5276:EE_
X-MS-Office365-Filtering-Correlation-Id: cbb6bf09-f7ef-4ed9-5b14-08db55cc8470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jep7MG/X13sHSObTJE8Te0c8wP28hyOJK++1L6rwOHSo9LmzrmB3ItbMefudIRiV/GIofTeMh1h+zSsskIJ851gR7gg6F1UluGd/p/76fBJR6DJXW3Q6pU4nCxSfPseu+SL9z9mf9o+fGTfMwFS905qBRx88M6rcCCBtFNdnOo5rKuGb1Dp/AGq33ppUxUcmX3VTup4JfM8JuUzbskQxdEv0zpO/oDAsG+d3KmHybsZEZ6Yi1BdoJ9IPApg24ejtGxaPICQf1LMlmRlsDAd72In9Xczb6aT0Jjh1wjZQt3R837zFAp8G4008tDH5/WPAxEJLH7CAYpvbtpYXjqTXFvrkUiTPZ3hj5ychYRw3LqRpk7U9rewKd+t4x72l0jyLP/JfsyKHLRpJ+tlsazpGChdpgOPdKhZ0qFVkdrIl8U4cRgAZj/zvgJ2IAbvA/KN0wrQwoZCBt7YE3CiodanQ9oKk1EU8wwoOQgDC8HplBs7XDHqaqt3+ULp0LCIl01p+8OMei3cSkAr9IghVHk0GX/uf9W9Xz8x+4OkX0VL0uLFBg+kWVVYOaK4nSCH0/ar1BtjvC2Lfu9JA42frrqKkRxPI9Ex1og+s4iQxxUSc/DhzlWGMV1mwdPNZcwznK+VwARzDMtJEcKAF/27eb10bjX9/pndBUW5iKx5I4f1Hz+a556j7PPNX2ukG90rlfSIn/jmu6StDOsxDTKxhnQdw6SkKUUK8OqsQjlL1r0XVY9R4nRKZmxlNUzfIEmYZ+As1knEzeLdkcs94Cj6qbyLUKA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(36756003)(54906003)(316002)(70206006)(478600001)(6916009)(4326008)(70586007)(966005)(86362001)(82310400005)(40480700001)(81166007)(2616005)(8676002)(5660300002)(8936002)(44832011)(2906002)(82740400003)(356005)(41300700001)(83380400001)(1076003)(186003)(26005)(336012)(36860700001)(47076005)(426003)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 05:15:08.5921 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb6bf09-f7ef-4ed9-5b14-08db55cc8470
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WUQBxn8DHnjb5TF6dXbLFtfXujvb6Qu9nAyNMi+ht4=;
 b=xvjLud8+Fprz2vehbl304M0/u87faPceZv82A8NJI3Utcc1onoQ24Xo4pHfjXe2EJ66X6LrxPrLc8ajFz3IL3+T2eUBnR2tVX1/6iotXOeOFwlWgIgIg5AvZ4nxq5/zYGUzcIDyIuzjOLWSdlW8w520aqFbx9tCCfolVU7gXlsE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xvjLud8+
Subject: [Buildroot] [PATCH v4 1/1] package/bootgen: bump to xilinx_v2023.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com, Neal
 Frager <neal.frager@amd.com>, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps bootgen to version xilinx_v2023.1.
The patch for build machines with modern flex is no longer needed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - Added patch file remove to commit
V2->V3:
  - Fixed file name in bootgen.hash file
V3->V4:
  - Removed patch from .checkpackageignore list
---
 .checkpackageignore                           |   1 -
 ...x-build-on-machines-with-modern-flex.patch | 133 ------------------
 package/bootgen/bootgen.hash                  |   2 +-
 package/bootgen/bootgen.mk                    |   2 +-
 4 files changed, 2 insertions(+), 136 deletions(-)
 delete mode 100644 package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 13f67695f5..81cf1afe6b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -242,7 +242,6 @@ package/bmx7/0001-Fix-schedule.c-378-36-error-SIOCGSTAMP-undeclared.patch Upstre
 package/bmx7/0002-Fix-linking-error.patch Upstream
 package/bmx7/0003-Reorder-includes-to-avoid-ethhdr-collision.patch Upstream
 package/boinc/S99boinc-client Indent Shellcheck Variables
-package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch Upstream
 package/botan/0001-Add-superh-alias-needed-by-Debian.patch Upstream
 package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch Upstream
 package/brickd/S70brickd Indent Shellcheck Variables
diff --git a/package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch b/package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch
deleted file mode 100644
index ea82f5e70c..0000000000
--- a/package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From 7251dce3dc974c7372e7024ade3e8a455266cfd2 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Fri, 18 Mar 2022 09:02:31 +0100
-Subject: [PATCH] Fix build on machines with modern flex
-
-Bootgen embeds an old version of flex, but uses the system include syntax
-(#include <>) to reference it, causing conflicts on systems with the
-development headers for a modern flex version installed, leading to build
-issues like:
-
-../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
-../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream<char>'} and 'std::istream*' {aka 'std::basic_istream<char>*'})
-
-Fix it by using normal local #include statements by:
-
-sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[Submitted upstream: https://github.com/Xilinx/bootgen/pull/20]
----
- FlexLexer.h         | 6 +++---
- bif.yy.cpp          | 2 +-
- bifscanner.h        | 2 +-
- cmdoptions.yy.cpp   | 2 +-
- cmdoptionsscanner.h | 2 +-
- reginit.yy.cpp      | 2 +-
- reginitscanner.h    | 2 +-
- 7 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/FlexLexer.h b/FlexLexer.h
-index b115b5d..1c0386f 100755
---- a/FlexLexer.h
-+++ b/FlexLexer.h
-@@ -33,15 +33,15 @@
- //
- // If you want to create multiple lexer classes, you use the -P flag
- // to rename each yyFlexLexer to some other xxFlexLexer.  You then
--// include <FlexLexer.h> in your other sources once per lexer class:
-+// include "FlexLexer.h" in your other sources once per lexer class:
- //
- //	#undef yyFlexLexer
- //	#define yyFlexLexer xxFlexLexer
--//	#include <FlexLexer.h>
-+//	#include "FlexLexer.h"
- //
- //	#undef yyFlexLexer
- //	#define yyFlexLexer zzFlexLexer
--//	#include <FlexLexer.h>
-+//	#include "FlexLexer.h"
- //	...
- 
- #ifndef __FLEX_LEXER_H
-diff --git a/bif.yy.cpp b/bif.yy.cpp
-index 7dd0841..9e09267 100644
---- a/bif.yy.cpp
-+++ b/bif.yy.cpp
-@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
- 
- #define yytext_ptr yytext
- 
--#include <FlexLexer.h>
-+#include "FlexLexer.h"
- 
- int yyFlexLexer::yywrap() { return 1; }
- int yyFlexLexer::yylex()
-diff --git a/bifscanner.h b/bifscanner.h
-index a6ec9e4..ded78da 100755
---- a/bifscanner.h
-+++ b/bifscanner.h
-@@ -28,7 +28,7 @@
- #if ! defined(yyFlexLexerOnce)
- #undef yyFlexLexer
- #define yyFlexLexer bifFlexLexer
--#include <FlexLexer.h>
-+#include "FlexLexer.h"
- #endif
- 
- // Override the interface for yylex since we namespaced it
-diff --git a/cmdoptions.yy.cpp b/cmdoptions.yy.cpp
-index 6ee80de..1acfcce 100644
---- a/cmdoptions.yy.cpp
-+++ b/cmdoptions.yy.cpp
-@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
- 
- #define yytext_ptr yytext
- 
--#include <FlexLexer.h>
-+#include "FlexLexer.h"
- 
- int yyFlexLexer::yywrap() { return 1; }
- int yyFlexLexer::yylex()
-diff --git a/cmdoptionsscanner.h b/cmdoptionsscanner.h
-index a48af09..e02c1f1 100755
---- a/cmdoptionsscanner.h
-+++ b/cmdoptionsscanner.h
-@@ -29,7 +29,7 @@
- 
- #undef yyFlexLexer
- #define yyFlexLexer reginitFlexLexer
--#include <FlexLexer.h>
-+#include "FlexLexer.h"
- #endif
- 
- // Override the interface for yylex since we namespaced it
-diff --git a/reginit.yy.cpp b/reginit.yy.cpp
-index 8422867..ff088f9 100644
---- a/reginit.yy.cpp
-+++ b/reginit.yy.cpp
-@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
- 
- #define yytext_ptr yytext
- 
--#include <FlexLexer.h>
-+#include "FlexLexer.h"
- 
- int yyFlexLexer::yywrap() { return 1; }
- int yyFlexLexer::yylex()
-diff --git a/reginitscanner.h b/reginitscanner.h
-index 4e78af9..23177be 100755
---- a/reginitscanner.h
-+++ b/reginitscanner.h
-@@ -29,7 +29,7 @@
- 
- #undef yyFlexLexer
- #define yyFlexLexer reginitFlexLexer
--#include <FlexLexer.h>
-+#include "FlexLexer.h"
- #endif
- 
- // Override the interface for yylex since we namespaced it
--- 
-2.30.2
-
diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
index 5d77c164f3..937509c859 100644
--- a/package/bootgen/bootgen.hash
+++ b/package/bootgen/bootgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7e07c75aa3e3965c8e33faefde037877f78130451cebc2056b096db9c66acbb3  bootgen-xilinx_v2022.2.tar.gz
+sha256  2fda35fac28f5753cfdd9c6d5c07fd2b018d55984681af79415a67ba5372ea8e  bootgen-xilinx_v2023.1.tar.gz
 sha256  4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a59aa3  LICENSE
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
index 88bc73b604..d83980d925 100644
--- a/package/bootgen/bootgen.mk
+++ b/package/bootgen/bootgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOTGEN_VERSION = xilinx_v2022.2
+BOOTGEN_VERSION = xilinx_v2023.1
 BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
 BOOTGEN_LICENSE = Apache-2.0
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
