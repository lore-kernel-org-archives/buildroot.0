Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB4ACD8CA8
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 05:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83917813A7;
	Tue, 16 Jun 2026 05:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGWTtmwW0r-i; Tue, 16 Jun 2026 05:54:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DCF9813C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781589282;
	bh=kG3KkVytzuMoVbQ0afNneaD2wc7VlLyf/0rJ40xPjM0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=btcvrQf61VX4hb/A/peDMWn0l/TB155tgJ3LXTz72Jcdzb0tGqgkfv60JcVWmwc7A
	 WlrSUvdB2ZP5oojeHpRHTipMBADHKnUg8hcV2/z9PbS++DWL3rfpZBWN884JTd5ci3
	 hVRIavvFDlPxA795sIvyzCUEZAZXUTC1psOFDN70q2X4U39yuGu79/k4ebCzY4uNCa
	 w7mvnx8iUnSp15p9GWjW6RrR/bbZMiJl9+gbIR/4QX59FMX0a+FYNMyYzB5MVZDu+w
	 moN/X6hmZB/gS8F8QHDNDq7GSoSFkn62V3OZnfmgB9cMpLttYUUTQSJ6oqrWOTz95r
	 TyCgGOPkJEZBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DCF9813C5;
	Tue, 16 Jun 2026 05:54:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AAE9169
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 05:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 178A940177
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 05:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g84W_E_QAfXb for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 05:54:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::5;
 helo=dm1pr04cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD10140162
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD10140162
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD10140162
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 05:54:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQXx2gSoR1m0AJO3r1Ag9tD+BX0xm8uuVjw9R5KKJrFmJEwYiRuQTY9fN1PUNLLuMYKybrvebCfybb9kazC8XBXBBHwgxFozuUgW7mSEXmYFzocB58nzlLJ+WSzMVPeU1tLQC4evowB2AUx9RHGYoZHpcbVQ/BLp4e8HvF3sqfA2KB4Hi/IfLhRUTCTnxImBAdHqUMner5Jcl/cHiVq9BJY3EKa5npppo5AziW1SAMVRmwmT0Fa7AuuEfiZCJ8eRbEmQTpLO7+/Vs3PEfFG7RblMLoofKaF+T80NSQ1hkJDQnwf7UkjDAESzejxfi1Y5xoySLjMQKbGZWbEQ0Hqa8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6b5b3gTuBEIoIpmNhs6Lcs0IsGuxuyrzOKCf1/txXNs=;
 b=dUB7AM09TX0V7/q/XEC5AdAeZ5p3bQ9DnmWR0i7bCDS6oqVfniesNrIHtaNFOh39CZfgmzgBCppCiN7qysGowFdVmTuX6/AM05PGtjX5HOZN32lMT2ySlBKAAKPrN6HJUmwqD+thwzad+pc8OPbrB0ydK5P+/njYhBaro61Swu3b5a/AhGlXOfZD/iCC/dG+w4BMQTi7X0mHI4WR7rmZrnb10kKb4Y1Qtf2xFBNMXnqgUZ09h49++vsOMl6Z4tmXzR/QbozLgAdOwE9yCWqnlF7IPla8hYQHTXZ14lWeqlZWVNhykitxL8ixm3ZSFfSbPGoGWnfq+mw+DopLuDw9Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN0PR05CA0009.namprd05.prod.outlook.com (2603:10b6:208:52c::29)
 by PH7PR12MB7212.namprd12.prod.outlook.com (2603:10b6:510:207::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Tue, 16 Jun
 2026 05:54:32 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:208:52c:cafe::94) by MN0PR05CA0009.outlook.office365.com
 (2603:10b6:208:52c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Tue,
 16 Jun 2026 05:54:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 05:54:30 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 16 Jun
 2026 00:54:30 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 16 Jun
 2026 00:54:30 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 16 Jun 2026 00:54:29 -0500
To: <buildroot@buildroot.org>
Date: Tue, 16 Jun 2026 06:54:22 +0100
Message-ID: <20260616055422.3688535-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|PH7PR12MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: 96067260-7d8f-412e-e0c9-08decb6bbbf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|11063799006|18002099003|56012099006|3023799007|41080700001;
X-Microsoft-Antispam-Message-Info: kvlX+Jdw1FDiOcUQRL8D7VM2Ll+DBEUoDhhJH5ne1xzOVDwM4+c3+9+q1jPZqOlMjs1Dx2nLDYbPZ8jTTtD8u40MDsb3PzR9LuQx2lD3L7xAU6wjix9+aAh3uSEkFIzPHIKlv4ZAF37aYwDjHOuKtDmnrSQKFCIddtEqEJajUcT+jX0CQ146WHIvJBo5rmuRmgUqFm+EYKduF+b/dYHSH0gIV7Ji8kOlJmyxqfyZYDoxeAfhiZEfj5wP9yQ7jjY6WXLsxwRSMrJtxzrNtzaaErYGJDUIA7psfavrFKR/qlno87lVYYz8dYkq0uWIL+JUh46re7DbOP8EYZCbAkltC6fmZKnUy9mgX8EXbr8o+2U3sxNE/QNj5JOkPc7q0UrxMFHPMb8smdNGuAYFVORe9ENfWtauuOHi8NxIW6uybR7fd5O5X6VmNFt8IacTPdhA9FvG0PhvX2snGOGC6Nn4vstWN6yjCvBMz1ZXxJjannQHeBU0jo/YtC+M0QwpuidC9sle9AtzGQdkhrTg8W3yKj/TxqiAw7nukMQdI1N/PnCJNP7nDlgVCaWW2Hxoqurx812vQG6vAbEBhi7x2dWbAHPnPFFzAmvGtReuhyiiukDyjwXBO0G2yF2UB8k/XXCQdBDFrfIubQG8MDER8ijoqeH+tRl5dXD6C7aCAW3rdUedKJDShTbmANDa2/K8mpCWg08L3vRBQWB9Ce2u2uPI4i9AckIugJ92v34TuuX3Mtl/ufm7emxHQ/q8hZMSuFnypnMYfEV6PM3h+E9wVJbVTmI3aZDmQ8VI25OW8bjn1GQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(11063799006)(18002099003)(56012099006)(3023799007)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TCQqcbeP3wh9hPHaVcTbVPrqHJg1AHtWGliYfXrupOzQET1qwjCflYSpmBpXjuhpdhMKm5fahp8iSZH7HqaWYUSKkwYphLAoz6KJWMsGOQNxIeFlIDj7o6S6jg4WH7qRcVlYl1JxoXctFY2wc5v63lWZkc/aiQ1/BjmwybD8yJ33nfP5O0jvLqTtABZM/AFhu28IMAmlvjMhdhZFFBIdNT2Ji7rYWM4XTO2zZUoRBr+/bNHxUjHV6kye4BMb0NDzr8AF0pDEJMgCVvrkTHuNAbid8kUfpbOoEdHcC28FS4/lOsU/tDVHQ2t8PqyvIDxpAhhbf41WWFB3eVB5sPb9KGDuRxJ4qdj+D+dcEx4q79S+FCKDO7zhlLTb3HbMq9Cymi4R1TBMDaTdumppmgh0mc9/lDOS46EA7m11rRr96pEE+N5pgK+xTnRiLJWRmdZp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 05:54:30.8303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96067260-7d8f-412e-e0c9-08decb6bbbf7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7212
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6b5b3gTuBEIoIpmNhs6Lcs0IsGuxuyrzOKCf1/txXNs=;
 b=tdDNo4kFTjihWsNNpThPJrAZs1we0DGl2vUUcHxlBKg8e2qfhaw1t9pE4kwHdRkX+aS/X1KHQR9iVBaayRj03JZyP+HzSHsJ/fdP48kwuOyRZTGYd6YhDP9nVBKjsycm/drRDhJD9nRpoWF8EoXqyM9bLoWa7r+V/FGhQysc5bM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=tdDNo4kF
Subject: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to xilinx_v2026.1
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
Content-Type: multipart/mixed; boundary="===============3481399793012920650=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3481399793012920650==
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

Bump bootgen to xilinx_v2026.1 release.

The following patches are now included and can be removed:
0001-lms-hash-sigs-hss_param.c-add-stdio.h-include.patch
0002-flexlexer-use-embedded-win_include-flexlexer.h.patch

bootgen xilinx_v2026.1 now requires C++ version 14, so the build command has
been updated to reflect this.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...sigs-hss_param.c-add-stdio.h-include.patch | 51 -------------
 ...use-embedded-win_include-flexlexer.h.patch | 76 -------------------
 package/bootgen/bootgen.hash                  |  2 +-
 package/bootgen/bootgen.mk                    |  4 +-
 4 files changed, 3 insertions(+), 130 deletions(-)
 delete mode 100644 package/bootgen/0001-lms-hash-sigs-hss_param.c-add-stdio.h-include.patch
 delete mode 100644 package/bootgen/0002-flexlexer-use-embedded-win_include-flexlexer.h.patch

diff --git a/package/bootgen/0001-lms-hash-sigs-hss_param.c-add-stdio.h-include.patch b/package/bootgen/0001-lms-hash-sigs-hss_param.c-add-stdio.h-include.patch
deleted file mode 100644
index 738887e26b..0000000000
--- a/package/bootgen/0001-lms-hash-sigs-hss_param.c-add-stdio.h-include.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 1675ec9d76b32400f612b1c542be6dbf77dea986 Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Tue, 25 Nov 2025 12:54:48 +0000
-Subject: [PATCH] lms-hash-sigs/hss_param.c: add stdio.h include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The lms-hash-sigs/hss_param.c is missing an include of stdio.h. Without it,
-the following build error can occur:
-
-hss_param.c: In function ‘hss_get_parameter_set’:
-hss_param.c:157:13: error: implicit declaration of function ‘printf’ [-Wimplicit-function-declaration]
-  157 |             printf("Private key expired\n");
-      |             ^~~~~~
-hss_param.c:7:1: note: include ‘<stdio.h>’ or provide a declaration of ‘printf’
-    6 | #include "lm_common.h"
-  +++ |+#include <stdio.h>
-    7 |
-hss_param.c:157:13: warning: incompatible implicit declaration of built-in function ‘printf’ [-Wbuiltin-declaration-mismatch]
-  157 |             printf("Private key expired\n");
-      |             ^~~~~~
-hss_param.c:157:13: note: include ‘<stdio.h>’ or provide a declaration of ‘printf’
-make[3]: *** [Makefile:38: hss_param.o] Error 1
-make[3]: *** Waiting for unfinished jobs....
-make[2]: *** [Makefile:84: build/bin/bootgen] Error 2
-
-The above error was reported on Debian 13 / gcc 14.2.0.
-
-Reported-by: Peter Korsgaard <peter@korsgaard.com>
-Signed-off-by: Neal Frager <neal.frager@amd.com>
-Upstream: submitted to Xilinx bootgen repo with CR-1256741
----
- lms-hash-sigs/hss_param.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lms-hash-sigs/hss_param.c b/lms-hash-sigs/hss_param.c
-index 7a2abd6..6b2b950 100755
---- a/lms-hash-sigs/hss_param.c
-+++ b/lms-hash-sigs/hss_param.c
-@@ -4,6 +4,7 @@
- #include "endian.h"
- #include "hss_zeroize.h"
- #include "lm_common.h"
-+#include <stdio.h>
- 
- static struct map_structure {
-     param_set_t public;
--- 
-2.25.1
-
diff --git a/package/bootgen/0002-flexlexer-use-embedded-win_include-flexlexer.h.patch b/package/bootgen/0002-flexlexer-use-embedded-win_include-flexlexer.h.patch
deleted file mode 100644
index 1de9a91223..0000000000
--- a/package/bootgen/0002-flexlexer-use-embedded-win_include-flexlexer.h.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From dfe45e10791a171c3c79699257d3d3a978ec30eb Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Wed, 18 Mar 2026 09:51:58 +0000
-Subject: [PATCH] flexlexer: use embedded win_include/flexlexer.h
-
-bootgen embeds an old version of flex. If the host machine has a newer version
-of flex, the bootgen binary that is built will have errors such as the
-following, if the wrong version of flexlexer.h is used.
-
-$ output/host/bin/bootgen
-
-****** Bootgen v2025.1-Merged
-  **** Build date : Mar 18 2026-07:08:01
-    ** Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-    ** Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-
-ERROR: syntax error
--h
-
-Running the bootgen binary should print the help menu by default and should
-not have a syntax error.
-
-Correct the path to the flexlexer.h header files, such that no host version
-of these files can cause a silent build failure.
-
-Upstream: CR to AMD jira
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
----
- common/include/bifscanner.h        | 2 +-
- common/include/cmdoptionsscanner.h | 2 +-
- common/include/reginitscanner.h    | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/common/include/bifscanner.h b/common/include/bifscanner.h
-index 9683416..9aa72a5 100755
---- a/common/include/bifscanner.h
-+++ b/common/include/bifscanner.h
-@@ -29,7 +29,7 @@
- #if ! defined(yyFlexLexerOnce)
- #undef yyFlexLexer
- #define yyFlexLexer bifFlexLexer
--#include "FlexLexer.h"
-+#include "../../win_include/FlexLexer.h"
- #endif
- 
- // Override the interface for yylex since we namespaced it
-diff --git a/common/include/cmdoptionsscanner.h b/common/include/cmdoptionsscanner.h
-index aa2f474..78fa7cf 100755
---- a/common/include/cmdoptionsscanner.h
-+++ b/common/include/cmdoptionsscanner.h
-@@ -30,7 +30,7 @@
- 
- #undef yyFlexLexer
- #define yyFlexLexer reginitFlexLexer
--#include "FlexLexer.h"
-+#include "../../win_include/FlexLexer.h"
- #endif
- 
- // Override the interface for yylex since we namespaced it
-diff --git a/common/include/reginitscanner.h b/common/include/reginitscanner.h
-index 74463e6..d8152a6 100755
---- a/common/include/reginitscanner.h
-+++ b/common/include/reginitscanner.h
-@@ -30,7 +30,7 @@
- 
- #undef yyFlexLexer
- #define yyFlexLexer reginitFlexLexer
--#include "FlexLexer.h"
-+#include "../../win_include/FlexLexer.h"
- #endif
- 
- // Override the interface for yylex since we namespaced it
--- 
-2.25.1
-
diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
index 995074c591..007cecfa45 100644
--- a/package/bootgen/bootgen.hash
+++ b/package/bootgen/bootgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c92d9be48fabc943c4addd9b12beced6671f5547b4f6dc01e7ccf0f274dbef66  bootgen-xilinx_v2025.2.tar.gz
+sha256  23529d4922efd79d201d6b4a3cdaefe5cc9384b55dd56ef916a56f2a0ed7340c  bootgen-xilinx_v2026.1.tar.gz
 sha256  36e278ff2cc9ef95154a923bf4a9450414f358779045ae4f863c8d77fb18dbdb  LICENSE
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
index e5cfee18d9..2e14c625fa 100644
--- a/package/bootgen/bootgen.mk
+++ b/package/bootgen/bootgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOTGEN_VERSION = xilinx_v2025.2
+BOOTGEN_VERSION = xilinx_v2026.1
 BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
 BOOTGEN_LICENSE = Apache-2.0
@@ -14,7 +14,7 @@ define HOST_BOOTGEN_BUILD_CMDS
 	$(MAKE) $(HOST_CONFIGURE_OPTS) \
 		LIBS="`$(HOST_MAKE_ENV) $(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`" \
 		INCLUDE_USER="`$(HOST_MAKE_ENV) $(PKG_CONFIG_HOST_BINARY) --cflags libssl libcrypto`" \
-		CXXFLAGS="$(HOST_CXXFLAGS) -std=c++0x" \
+		CXXFLAGS="$(HOST_CXXFLAGS) -std=c++14" \
 		-C $(@D)
 endef
 
-- 
2.25.1


--===============3481399793012920650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3481399793012920650==--
