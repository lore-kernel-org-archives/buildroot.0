Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C023C61DB2
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 05:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8BAD80F54;
	Fri, 13 Jun 2025 05:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gr5kGph2QJHF; Fri, 13 Jun 2025 05:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1DB380F5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1DB380F5A;
	Fri, 13 Jun 2025 05:44:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89170183
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 05:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F0A180F5A
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 05:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tc6bQR1nvOXc for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 05:44:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2405::61b;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3277580F54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3277580F54
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::61b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3277580F54
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 05:44:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LuofzJyjO0rf08J/6MPalnpok8KIjYX6OkfyJ02M8dtPct7vcDczPrqkgnKkeAciQPSbEPioH+EJJjwlbC+IdmNbLrIbrv8WvDUaPwN0KBOJu3DT/IULnNUwmvcUjLa8d9BsTE1yEzqSUJcQcyFMrDcjprZfOWJWjJ+nks6deQKBzHz7Wme+1X1DuflyzAwyuGXINzxbpm33v0R5duSpiQn+QllhxiaQgxw2AcQKuIR4lIL1+nJrJ+jZru0MiJx0McowzbJEbJhxfZuTteviiNPWDSGQLqaD3GatazZoOuhNgVMo3FvNpfjDh48JSx1UrPIA7o24aJn7TJo80Ytwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TidtGffUCqjPP60lOiCZ/B4YXfnwB4ALO4WDYQHUrto=;
 b=Ixi0iLzY7vy+Tls2Ov9AWx8CUTsg4wVb0hF9Eh7DF/UioJeGbltCI5n69cU6iQVupc3ezayq/pzeF07hNnIcPCrk2OebJZJL21MYQFkeGkQQReRRxxE6hldSJUGTFIIBkAMxjT75OxZre2HWke2sbNJ4j9Z802oxKXM3CVqW+cCUFOtjTBNAO1xISeJUHIKc2bwHjhU/zxeb7skelYbiHlSzNX1IdiiSfrOc9Mb75FQWqiEPRN87aPIVogZ1ALrLl1pCOgCkJcqlsWqSfp8q+8/AiAHL8sG7WQneqfmMofczKm8dyuG2E4LTJM35XDnIPaTmTfW4OO3F4EFjjZKHvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH8PR02CA0035.namprd02.prod.outlook.com (2603:10b6:510:2da::30)
 by SA1PR12MB7410.namprd12.prod.outlook.com (2603:10b6:806:2b4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 05:44:17 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:510:2da:cafe::bd) by PH8PR02CA0035.outlook.office365.com
 (2603:10b6:510:2da::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Fri,
 13 Jun 2025 05:44:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 05:44:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 00:44:15 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Jun 2025 00:44:14 -0500
To: <buildroot@buildroot.org>
Date: Fri, 13 Jun 2025 06:44:06 +0100
Message-ID: <20250613054406.3479383-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|SA1PR12MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 690921d2-9596-41e0-4c5d-08ddaa3d55f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aLXxHgNGWIhMH+Yh3ev26GDK8K/TfoL6jwcyxoyFFblLldsiSYG+be5dVrkp?=
 =?us-ascii?Q?2tci3bKfwe4SM+7EP1qCr3KgZOrDYYABAfRV7t3ZFJ4vI+gY+Mk1LgFUqX32?=
 =?us-ascii?Q?CSHVx8HigQZs0d3+ZXEMI1pfZXYfWFfl1iu2mdQu1nszv+T+XZFgBpSsfmcb?=
 =?us-ascii?Q?yisM87L538S8glkOtUlv2SRc9dsaX/IEJhuSYqNZ5V175rZe0d7QaWw+cRNI?=
 =?us-ascii?Q?TW/95DPM7+uc1hphITmfZbLWeWpmDSxDYNgx1/8g1C4/vUMri2t4/bs2eQTp?=
 =?us-ascii?Q?lmO2JQorMEpWpU9R5lc6YU79qWc5WUGSbq99ehrrmNnfLMAXk1WCnCivoEvw?=
 =?us-ascii?Q?T5fV80xcshcgxBLQyAoltTFWkzJdAaYN7c8mDb/baUBwR+3f5aVRvOwGYLSO?=
 =?us-ascii?Q?vXAOJVnkY415FhQCDDhAOGWNGYQLq027zWgtjs79Em/q2jMSRIhvWZif1RQk?=
 =?us-ascii?Q?1bDLNkt4s7B6l8kphl7eE8kK+/VWmUFo8fnbJ005dmrW43WGDaLnTkIB8lfx?=
 =?us-ascii?Q?q8SOZb6FUcL5eptRHtfaVh1RyHl5qxQ+HmXRIjh6qRPUQ7XZ734YKRhf9Tca?=
 =?us-ascii?Q?fbft35j1x/w5FRpzyFQrphzwyDPSoZ6jxttqHcdapGcDlL7HDIaV5qu+YGeO?=
 =?us-ascii?Q?e04iEtQg6T4PdGtMTfr2z1Rnnqfp54bfyYl9lhEZe0A+GG7xuxA4MWV537Bt?=
 =?us-ascii?Q?6T+g6DcaIO+Es2uzhpTmPyEfyYhenndn2gqJVlqbSMp/BHSmhqQywBalN2UU?=
 =?us-ascii?Q?xnTKHR2an059ouskQ/+3y/uq3BVzVeL8fZKgzDpV+EmocANLUeWYjIjpIS2O?=
 =?us-ascii?Q?zk0qdZ7f9CuoVtEpF44/gDzCC5+T3hFDLT1e0IftmJzJhROq6CmUi2611hSU?=
 =?us-ascii?Q?ANFy1e9pbiyVd9I92tCCle4regBcLNSRadU6EOd93sw10EFY8oNGmjyaFGtc?=
 =?us-ascii?Q?OTLzQ5vlZ1UamuO6RxfjIoo5CKrgPzv2uSHocoXk9ZHsWBAP0MNBQBXUJuUo?=
 =?us-ascii?Q?egLoLwx1gVlFynCuNe99qcs/ULhKIu0ekiypULwIk5EJIlWFZiv4ehwr4bmq?=
 =?us-ascii?Q?JHmyo53WCV2/VF80sduDRLkYMh9sXUcyXjUD330ubf73PEoNOEy9vamhvLoN?=
 =?us-ascii?Q?JVTW0hVEkMG4Eno9kQ+xFdwyeWa6rVKqnbmlzEuePJoXI+axe5d7IMPbujXQ?=
 =?us-ascii?Q?BOOLCKdo23275Hlcd/d6HwBRV6MArDY/r41YZw+2xAKeGPJIw24jM+DtW1Yx?=
 =?us-ascii?Q?76kw921rn80aPArsUIEKZkKj/Q27dfDgMMWCkigwR4/aDCUHyAVjrJhWM/Q0?=
 =?us-ascii?Q?XOTVfqAHUzBlK5KlwjdZca+/FMStTnib2masxVWYYpNW0oX1qMJBGNkmh7/U?=
 =?us-ascii?Q?hDYiySSuNWwwsOg0l8anM1kI0ArEYLSzm/bCstaA8qxTeZ143jXCal5zybSd?=
 =?us-ascii?Q?EFxTyYs9obiasWA2U0SdnkOPs9Yf4pBmnxzoD7hSWLUyRfpg+syG5hBQtlym?=
 =?us-ascii?Q?gcewDAgvffC/2O66MZlVXub0Pe2Al5sM2seP?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:44:16.7073 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 690921d2-9596-41e0-4c5d-08ddaa3d55f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7410
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TidtGffUCqjPP60lOiCZ/B4YXfnwB4ALO4WDYQHUrto=;
 b=2dA0pgDDHjma0uc76sgzLCPEE6wy6DjS+42VImsL1P/dGSvOsS99qS6o3DLSF+7QVqDLvcy0kPnOBlsx5d1wDbGZcc73lT6sYETf2ELuSUKApI/tvOnGLWPFLTUNKUomLf7zkQk4GBc9UsVbsDaZzV53Fe3slThsf6zioJ+/nog=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2dA0pgDD
Subject: [Buildroot] [PATCH v1 1/1] package/bootgen: fix path to local
 FlexLexer.h
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
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With bootgen xilinx_v2025.1, the local FlexLexer.h file is not in the same
directory as the cpp files including it, so the previous patch used to solve
the issue below needs to be updated to find the local FlexLexer.h which is in
the win_include directory of bootgen version xilinx_v2025.1.

So this patch corrects the path for including the local FlexLexer.h header for
fixing the below issue.

Bootgen embeds an old version of flex, but uses the system include syntax
(#include <>) to reference it, causing conflicts on systems with the
development headers for a modern flex version installed, leading to build
issues like:

../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream'} and 'std::istream*' {aka 'std::basic_istream*'})

Fix it by using normal local #include statements by:

sed -i 's/<FlexLexer.h>/"../win_include/FlexLexer.h"/g' *

Fixes: https://autobuild.buildroot.org/results/60220f94cca1bcca5667afcb2acffb5aacae048b

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...bisonflex-Fix-build-on-machines-with-modern-flex.patch | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch b/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch
index 6d048e9bd9..817fee195e 100644
--- a/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch
+++ b/package/bootgen/0001-bisonflex-Fix-build-on-machines-with-modern-flex.patch
@@ -17,7 +17,7 @@ issues like:
 
 Fix it by using normal local #include statements by:
 
-sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *
+sed -i 's/<FlexLexer.h>/"../win_include/FlexLexer.h"/g' *
 
 Upstream: submitted to AMD internal jira process
 
@@ -37,7 +37,7 @@ index 8d4d364..35f0aa5 100755
  #define yytext_ptr yytext
  
 -#include <FlexLexer.h>
-+#include "FlexLexer.h"
++#include "../win_include/FlexLexer.h"
  
  int yyFlexLexer::yywrap() { return 1; }
  int yyFlexLexer::yylex()
@@ -50,7 +50,7 @@ index 661d7f3..a76ac81 100755
  #define yytext_ptr yytext
  
 -#include <FlexLexer.h>
-+#include "FlexLexer.h"
++#include "../win_include/FlexLexer.h"
  
  int yyFlexLexer::yywrap() { return 1; }
  int yyFlexLexer::yylex()
@@ -63,7 +63,7 @@ index d830734..dede473 100755
  #define yytext_ptr yytext
  
 -#include <FlexLexer.h>
-+#include "FlexLexer.h"
++#include "../win_include/FlexLexer.h"
  
  int yyFlexLexer::yywrap() { return 1; }
  int yyFlexLexer::yylex()
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
