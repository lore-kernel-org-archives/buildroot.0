Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183F3C5AD49
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 11:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3032409D0;
	Mon,  2 Jun 2025 11:23:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7n6b2t2hmyvF; Mon,  2 Jun 2025 11:23:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAEF440AAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAEF440AAC;
	Mon,  2 Jun 2025 11:23:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E6828222
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D814B8154B
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKqBEGFeoUd7 for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 11:23:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::613;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26E1D8156C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26E1D8156C
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::613])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26E1D8156C
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:23:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqEL4vsA9vEOCYdg5YvRfDPc94YICjfMccJCozumWD3xIvaUpajiqcTI03ZK+M4zLmIALRUHTG54USxcA8Ik1FF417rSdgInfPaySh/eK9RzcJR6ciF3M74VSyrJwYaER3qyLNXWAxmkrOjQ102LDI6t0HPJzMqhJlO+f1iZkQ2LV37tNs1tytEXhalUROgI5ALn4PpafH8EhV1ThZY1zrwsT4VCstqmr764a7iBkC+jBRPVZ+2su1qAbRkqU/uDXaYsjVkOijgLn60dKUVP+nyWiXfqphFPqs8CTjQEvJk59nCH+1q0PPaWCuvnjxfR7UWW6tzmOoqK+VfElxd58w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrU604w7AqE1jJ6E451x2IkKNvFeo9oc4ifUc8/YEek=;
 b=JlFoGBF/IxCwbXc/w1x0JdbA5Svj/biHIASPVF7Cx8JqZMcJg0S9UfnpHRmS1L3Vf7x2fJ1LpEzLAlBk8uf518cL5lvjgvcgOlfQ7rJ1HiAh5psQgZtTLCNyaBhgOQdAMbbG/qfhkCqA0/9CPEhzAtDl+Khlob64/NLa/G9aANh0Kl2bYK1U+ffTBu525Qud4X5cc2RiqY6lNvNOWrT5ZaX/aME4O3KhquZDq1IdicgDtYYfE34LOC81EogbNzKOc2K103jxMnrwzRpx1eAkz2D4L2AGhAioYe4rqyCv3OPjyv4DROGRutbiSg3gNq4V61pBN/V1pfq5MkzN57NKTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR18CA0026.namprd18.prod.outlook.com (2603:10b6:5:15b::39)
 by SA3PR12MB8439.namprd12.prod.outlook.com (2603:10b6:806:2f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Mon, 2 Jun
 2025 11:23:12 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:15b:cafe::ee) by DM6PR18CA0026.outlook.office365.com
 (2603:10b6:5:15b::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Mon,
 2 Jun 2025 11:23:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 11:23:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 06:23:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 06:23:10 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 2 Jun 2025 06:23:08 -0500
To: <buildroot@buildroot.org>
Date: Mon, 2 Jun 2025 12:23:07 +0100
Message-ID: <20250602112307.4185883-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|SA3PR12MB8439:EE_
X-MS-Office365-Filtering-Correlation-Id: 838701e6-0307-40d7-57d9-08dda1c7db96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tPtN6vplKeOXi28mH3FF5eM+0PiY4qB73gtTArPA2ysFVFNVL6zELSYfxpBk?=
 =?us-ascii?Q?cY2S55z/MwfXTfs8M2twu7KYskkXvP8rMwnS0guMP5ypiO3Lax77TY0ZSbsb?=
 =?us-ascii?Q?Eit4QSiwZamLwaH1OlJJnmSOETWlMPr+h8JJr+ltY+tqRy+h/Q5We06a6C1a?=
 =?us-ascii?Q?u9uQEeE3LsmRGwcC41Bf616KTwSguDy0rB+J/T02xAx6NzX3d8fNhmRO7Nn4?=
 =?us-ascii?Q?RwZPYcqe/x2MfW5wjWCv/QxqFfORfttBVPzBROq7bANdMn4pkHok6EIRZi8B?=
 =?us-ascii?Q?V7vkQGF6V0DUUDyVpzXuGKsSTZ5xjGxf+vxZ+LXMijT9PQdbbxqSndiyZhGQ?=
 =?us-ascii?Q?XY0VG6gzHBQaLBgratYOit82xYYZeNEeroYu3LjzfqitttPAC+bbXow757YJ?=
 =?us-ascii?Q?sFwvJW2HHPzG8/peS+OpRFMzyQ8Ura28Qz+8vtGbmP5CknuuyidRpLLggSTf?=
 =?us-ascii?Q?iN4+Oc1eCOaFFbIaGzZ4Kdh+uAMEdlKCoNy5DQ4FBMSS2Qy/rGX8ayTMnfwF?=
 =?us-ascii?Q?LBBp1DK9qE7Ml2e+AusBEEgjd4QDdcbhq3Dq2Hj2tYY0qivsLz+8YUXtRzeh?=
 =?us-ascii?Q?u7X2bVRpw+UTuWmEREBmS+KZUHu814Go6wU+CqQ0n0jVF2HF0a/g/qUoKGBM?=
 =?us-ascii?Q?sZfSfeB7Oou7gg9ID8TXcFbcmFSuecujP5fMF7srPw2gRvnXvdFt6Rc3vIaX?=
 =?us-ascii?Q?4G7bZ/hlfbiWNQldPKNgFQJ5T0l32+pWNGz1TOLou7ALIHVq7Kyz6xdZpu6h?=
 =?us-ascii?Q?d1KLsP96MLav4Gmo/BXkjWK/vxh0X2LViEzz7pMd/40Hfi7m8yHhLsgpg2f7?=
 =?us-ascii?Q?xZSE0K8DnBPj8Ki1iEi8il/bNviFYxhuYFaRXBX+xNHFrZR4pGnNt6yP5KPU?=
 =?us-ascii?Q?NhIeF2ziBCzGEofM2lDlPqU7SW2ndGtq8xb3rVHg2pZzjGioG+tEWIuybH/j?=
 =?us-ascii?Q?xPeJDCJwmI7K8v+eJOgu+15pRS3IHGW2lcDAHLItpWwb1us1viOE/PGfxSsw?=
 =?us-ascii?Q?eie32xaWbNxNOHk3oHGTgVNjlnNmYt1Zc4EcmtIC1P2GvXGCAh24ACHjsRVv?=
 =?us-ascii?Q?5S0jAHeHwBV02gfFHO8mgtHMwNkDhP453fpVCdZ08+PbhzZinMKdTDaeYYcs?=
 =?us-ascii?Q?Ieggv91e8A54Em5Erp1VFNGPiHmpN4VcypjPCgVXTBiYZBY43pILbvoy1zBd?=
 =?us-ascii?Q?/6DYi33n95uJdcNjKImNiarMzDtyOiV0FPbN51KqDjVmbefeKfjCvg/xuIxJ?=
 =?us-ascii?Q?2RES/2qkPD7ZVfwE2emHbyEpgSG7stL+468hqgadJ/bJialcYFI4ff1kNzM6?=
 =?us-ascii?Q?mnX5EmpqnctJm/eYPxHyxzrvkoMaREHWFVeOKNVaA5ZZQUjSwPmnLuEHxT3F?=
 =?us-ascii?Q?x3KMuhNicU3trYix4Zkv7PBQCcS1cNJCmMWsICyO11wj9RLYtW2+2r6lxmUg?=
 =?us-ascii?Q?fLOiq4Zfw/dvEMa8hlhoNKFBvT1MSSEbWCjNvP+wlqQ1o8IKfeGmrbyKSQbw?=
 =?us-ascii?Q?Wq1XSjRNWdl0Kr0q5lR9TPHu0ZQSwOADmHo7?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 11:23:11.0300 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 838701e6-0307-40d7-57d9-08dda1c7db96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8439
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrU604w7AqE1jJ6E451x2IkKNvFeo9oc4ifUc8/YEek=;
 b=LzDWs2bRcMuzy2E6ZI2iziNYSKkEf/oqvKIF/dFVJxFVhrFkzwx/E4dtGlplv+qUpQFGyJOmlsBxE6YhQ1sz+b29xRzB/Nx6wR3sfJ1ej+iFld0EMpeISG08DJKuUDndetZf5SakMbcLWxtevu/rPf8OgaynkkSa1FTH7ns2TWQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=LzDWs2bR
Subject: [Buildroot] [PATCH v1 1/1] package/bootgen: Re-apply fix build on
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
 ...x-build-on-machines-with-modern-flex.patch | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch

diff --git a/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch b/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch
new file mode 100644
index 0000000000..187514f6b7
--- /dev/null
+++ b/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch
@@ -0,0 +1,72 @@
+From e7e341b7ba6fa9fb875718e8740b03c2041278e8 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 2 Jun 2025 12:09:13 +0100
+Subject: [PATCH 1/1] bisonflex: Fix build on machines with modern flex
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
