Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA2BC77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 04:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3FEC40588;
	Tue, 16 May 2023 04:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3FEC40588
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7LwpAiKxbzR8; Tue, 16 May 2023 04:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD1D14063B;
	Tue, 16 May 2023 04:44:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD1D14063B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF2A71BF29F
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 04:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6CD84161B
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 04:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6CD84161B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CsCBcgBg8kQR for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 04:44:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F324B4161C
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::622])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F324B4161C
 for <buildroot@buildroot.org>; Tue, 16 May 2023 04:44:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhL1vB5tC2jRLzIW+9y5O7VSTTXlgqU3PPkGsfFbU9g3tOmIOl2HG3/Ji2uPr/D6knKvDHozi+gDjCNcDPKhBoIH8pdTgAensiQsKaJPv3LZee0DyE1okWn0EHx9GoEm88ryAsIBGh6j8Pr0iW9r7xs5PqA15qhwiKH3bHnsiSDlf8B1qam3IeRVhTpcsxKMVDs502QEBCCpPte1At4nqG9GiYPhqf3uWePGaeLLrqcw5FLq7T0G/HYkOAIULF5ExL4l+aPq3fd1S0ZWd1Vf1tnROo8O7H0nqM8PQ4XYR5UbZdRYuW2Qq5l1v8ZbdYLIiltgGUl2OqnvTMEK/pE3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdFKt8/AG7QqD+iUTLgz3oHtU/rHPezeoBqlUy47iSA=;
 b=loUWKUrG3AyWAmVESxqMsyVZDyndS9dsQbZ5JvB3/C9tpCNVVuZRkonE8DZwfTnl4COh7088P0CAUDTLkckYp3W9rxo7aa3KLr1yeTMpCFOsigNweVfyMLULd4UjLP29vnuut9ucmmwZdzP3J+YZI7opoZBi09s6eH5Q40ugZ3jk8ozsWHO6v6GW6/PZdVWG1OX492cnk78A6AXIr9wLrGraet0bAsetJUTDDZwuHGxsm8td4j1TLhOJoIFovxUu4O/H5jt5sMgq0lV9GLKBQlISIB3rXB4M9xWJij93WfTyUHP2z6sKOp7EnxR4ZBSc79gJtegasOKo0C62yatmgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BN9P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::22)
 by SJ2PR12MB8034.namprd12.prod.outlook.com (2603:10b6:a03:4c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 04:44:29 +0000
Received: from BN8NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::9c) by BN9P222CA0017.outlook.office365.com
 (2603:10b6:408:10c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30 via Frontend
 Transport; Tue, 16 May 2023 04:44:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT102.mail.protection.outlook.com (10.13.177.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 04:44:27 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 May
 2023 23:44:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 May
 2023 21:44:26 -0700
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 15 May 2023 23:44:25 -0500
To: <buildroot@buildroot.org>
Date: Tue, 16 May 2023 05:44:18 +0100
Message-ID: <20230516044418.21419-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT102:EE_|SJ2PR12MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: f9d31e64-f242-439f-284f-08db55c83b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7IAWCR5CyHzg9rhqzUhgu4ziXf3h62QjIPr8IlDrpWt9bXsXoO64RIyR3lC1rnc5LVI0cvKcp6EJjpSZkchhDmy0RopLb3ek5A+zLi4VF8nys3CiDhNPBHZtDEqUMnAmHCiUDb2+IosP4ht4RGKmjtK7od6tQ76g8ShXdujZjTeO/0tIH8Mp+DFIYkefmndF8/MvCQA7ZYU5yP2Xhu1i8X2pg/l8JG3TQjXlFgJ428eif7wr1QZazF5XB5XRdbvhTUCa6M294ZXFfdKndPWE8fTC5CGeO3HVQYFRhoGfQLOB2VxUMvM+9t+7k9tf9T6LaD78mXyTJu310fswb93prSO3yZX00bW6WoDdmwjB14a1V9TipZzN9Kii+r2AmKePCJba4fV3idBhTtrXrSr08ile3Sdg519/mMO8RqZjD3fYs2xeizWmZ7Wwn8iFLZlGza0u+UvMOOLevxDHE+zQhqx+VYhsejFor5h1QnsEJIcdDiGVCMaIMzoy/XIIvDrFQHzcdbPRdk3YCv7PVSGXlli/v7hSc1X0RugS80NkjLqXSYXXoNPgEKmNqZiHHEhNhDDmZzeGhSKTnfbJDnzCwSNUf4jOHjk/3bDrDZ7XSkzZ4qNGAtCosG4BI42ZmP6tl0aedJi8XzKmxiEDWzV/q906eGj5BAPANg+IrPf2oQvJsiNZV2zdonR/BLxS9dgcmrDHHwZaWp+PZxzDB7oKpKXd2nvI8J4/wgWJ/cG/iPnkmNvum5x3TLZEJdEs+9ZY7PMoxwFKgPvUiNO/br0fTA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(86362001)(54906003)(40460700003)(478600001)(36756003)(966005)(40480700001)(186003)(82310400005)(1076003)(26005)(6916009)(4326008)(336012)(426003)(82740400003)(356005)(8676002)(70586007)(81166007)(70206006)(47076005)(83380400001)(8936002)(6666004)(41300700001)(36860700001)(44832011)(316002)(2616005)(5660300002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 04:44:27.5978 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d31e64-f242-439f-284f-08db55c83b1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8034
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdFKt8/AG7QqD+iUTLgz3oHtU/rHPezeoBqlUy47iSA=;
 b=3cyB2d718r7QVMj3QD0wGmrnV50E6N1WXac62XcB4WUNzlQ6EvQF74UQ6GQ2MA1WA5K77thpPN3xoxBLE2jNf7lq1aPjL1scAi5IiLPovajf4PhcN3LDteXEC+09pYyY/bVh6E2OI6+/GpCZ+rJwHYB9pdsNx5wp4Hqx5Z0GP0U=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3cyB2d71
Subject: [Buildroot] [PATCH v3 1/1] package/bootgen: bump to xilinx_v2023.1
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
---
 ...x-build-on-machines-with-modern-flex.patch | 133 ------------------
 package/bootgen/bootgen.hash                  |   2 +-
 package/bootgen/bootgen.mk                    |   2 +-
 3 files changed, 2 insertions(+), 135 deletions(-)
 delete mode 100644 package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch

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
