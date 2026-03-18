Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401D7FCD0A6
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 10:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF4F860802;
	Wed, 18 Mar 2026 10:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTa1cywqdUSA; Wed, 18 Mar 2026 10:11:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D420608BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773828664;
	bh=D0uv9Wdtx2b9BhRj9DTNvLl1+KHb7WPLSpn47kxYhQU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=guH23Lw7HS+eIhu3nYyKvVPhgNt0wA6/ynJPDaB1VG2GP/2JWlTaPPZLZX5HNXFbo
	 HhZptXPm1ggbfshoAi5uJAvqGh1hJZpw/qOvG97IFszBcd4CJ9NZi69XSIvI/YtRf9
	 EIEK8Ha0QtcCa6RCaYhgpngslHra/WLS/ZNWSoPisGWeQSBhCjjlp/vosZu6nOVgXo
	 ALLATx9/Y3i8q3ghdPKqMAnK6m9jb28yn1CTnOaoKh1Jd1DWImk9wXvIfY7YvDkDK2
	 eII60p/0MBqN+RtxSUj5vfJs4MPd1VW20OnDbcIGse4NAbMHPKBovMe8OpncMI3pMi
	 wB1o4yQt6DNmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D420608BD;
	Wed, 18 Mar 2026 10:11:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 415AA1B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 10:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32831608BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 10:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVSZ417jaKeX for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 10:11:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::5;
 helo=dm1pr04cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40B8C60802
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40B8C60802
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40B8C60802
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 10:11:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDBXGDODcYr7FL1OK+TRvVCUKSyVD7Ikoyav/QKP1Wid/xdNXLZJuASRCvVLWTzWbX/f/Dl8UQSlDd+yXH0WAX6Zohh35BQ3riEkPNUGRoSCKMq03RcOHrO/2Va2BQsiZ+rftEPpMpd3N08zr7fKBgUQ6LB01Nd4kVCbpM4UrkbRK1y+m+cfObCoUJIGT5vQzrWi5F0SbO34GqIFmjoK9YURrr69Zl3511qAvn231GHAYyeFxYVbei72PNj3fA/2Jsbm3Mj5skw7G+IlaYxC5HqFsipB6V9UHzZ/ENvSFtDNAm9RqaXOylyEbUuENrWuruPt0eiwUyjZcV7mAIFuTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5xn7oQm+bcXgTGBFZWKcNOWwQaz7teuP6bHJHP/JNc=;
 b=s3+NKR8eqQPVsfrOxZCq1jN83hr+ZexNzYU6QyHvKbSZW/ednOFp88uzrfhd+pvIdbRoJEfnv88IYG6qAVQeIDsbnzQAZirdhwIVbbTjgP+v8KSAMzGBUKRi5ZJ841bUDo3YN8c4nLWhIb1WyApErFtFe87JqTumLintNDZTfGnm3EI+T8q9BCCE2lEqozbdw9TD6e7t3Bvpl7rXjKJvMd10T7I2d77/lNRYIpEM6K38Aykx1DT70jcY6IlVIs+M5rguqaJbnD78h2qFtv14BFO+rN9BrhniFV9TzRdosvUNIS4hga2UDmfu0KWt2IOiuqlFFjZLJKNCokzL01FRUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ2PR07CA0012.namprd07.prod.outlook.com (2603:10b6:a03:505::13)
 by LV8PR12MB9667.namprd12.prod.outlook.com (2603:10b6:408:297::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Wed, 18 Mar
 2026 10:10:54 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::68) by SJ2PR07CA0012.outlook.office365.com
 (2603:10b6:a03:505::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 10:10:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Wed, 18 Mar 2026 10:10:53 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Mar
 2026 05:10:41 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Mar
 2026 03:05:02 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 18 Mar 2026 05:05:01 -0500
To: <buildroot@buildroot.org>
Date: Wed, 18 Mar 2026 10:04:57 +0000
Message-ID: <20260318100457.1838670-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|LV8PR12MB9667:EE_
X-MS-Office365-Filtering-Correlation-Id: 374e4eea-92ef-46e8-08bf-08de84d6a3d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|18002099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info: m+JL5hpc1qyQnI7KvTocgElJj0s4k2xABupzXCOIhzQcuv+xeA7Xx4r1pdaMqxW6YA+gQIw6mbjtNz7sicGGk6dSv5YOVFj3bl7v2MbvuT0sn1DChYqiU0LoHO3ifiwTj1jiCV8PxuQVowesngYvN7UgfhE5Uu+NiYcF0EGgJ9/wHX+3u5xIPPJkskvuW1GSWqJLWUBoT5syjWODQOuRdlKL2+ZFldDP1cGVzJnOOCq9ct8tGiZntu7eq4HPUF933KQ27ZbREuErYT1l4Cmh4cDBmiFlE6L16mgMfOe0Ow6o+u+4QbOh68mne8tEL3hMC6oSW8odBQI7ryQjBemB1Pl/D2OdG67Fk3Gy4oVSqKiCfHCdvafToTC4zpRwAMjDC3yi3wfLeblx9vMTTAX0GkRvsfMLCNbPNipB5FbJdNuBbQGDnUJ/Y9lXRJR1/gAcHC/ZFJ9Y5ZxbQGpIBWXW3Af41pGrUTNACOW8yzBkMoRYrKgBgWfhyErC/Ab5l4dX1wd/f96w6t4kmoyvsvOEhdshhpYaVAUdLK2adov/lGXCbQvWgXVJ2t3JeDGO2Gq4aU1o8qnnjvvZNIK23+H04YHOnUQVs+rRSDcbNqlKDvQj/PZps71wKEuuewh3apf/ybPRivxNeAqvZC+fGl+YVB/yFhpnzMQjD3yrfgBTZdXQvkxvN10V7d/h5sJ/wGNBA0tbx5YtvKl0b3EBrC8Mq6moc44Imra++LAWXPsL/looaL+t2RkkVWitMFl7y8+Txlc5fu3pFQ1H7w2Vz5yQMavyVMm+XVQAPR1I82yfrfdZxizOWY7dZFdNbFzs4fuq
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(18002099003)(56012099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kIXDPA/DIwLrz3kfin/H/Vqo5vA1l4wWeFZ+a8hSI5SxL19egUHv+gR9y6rpMDh4ARvW67f91x1GVhsuKBvCJ7EViXNZNGCS/kQ9HmEQDtOXXO/gc6Fn/1GS6YIeHL30szr3oexs2g4EZpcPx040g2f/JcVG0MTYlki0JHZZsmXTt3iyr8E86F3oYW7VZVZJzYl8PvjB++tz1MVUGdSoPr6HX+Hb+RpClIaZ1NracBnnn/kKeW/sT+b4QUqLhQEY5oR2lebqhuWGhPELE+Dv0/CGJgUm+vmg86TKpzUBIYHlsEIaHYjNCDDizLkvgyjp+6GwfwJUpyrozQEJVKzFiia7szvgHc8A3uebPIjfhcHRClKiVHrabba5qKK8vMaQdcfO3jbLTZHdAc4Si/7KmBuwE1Mle/QMsRbZu2eyAlV658fPiMRqh8GFHA3ioALW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 10:10:53.8336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 374e4eea-92ef-46e8-08bf-08de84d6a3d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9667
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5xn7oQm+bcXgTGBFZWKcNOWwQaz7teuP6bHJHP/JNc=;
 b=zVY305eNro36MAhb5PuoiF/+fKQqh5N00YMkyqIkX2pSVHJIoTdzInOWVif4sjKZi03l1qk/hZwvU6qr9twoLFg2FqFLTrFP0ii854gutyvCE56VNeCA4hTXjYKMDP0TiF0f7GAY6y562X4Oh3Nw0FbkLsojUvT7lwmxG5wP8tY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zVY305eN
Subject: [Buildroot] [PATCH v1 1/1] package/bootgen: fix build issue if
 host-flex already built
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
Cc: ibai.erkiaga-elorza@amd.com, steven.hill@collins.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 fiona.klute@gmx.de, ju.o@free.fr, Neal Frager <neal.frager@amd.com>,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix a silent build issue with the host-bootgen package if host-flex is already
built. The host-flex package will install a version of the flexlexer.h header
file that is not compatible with the version embedded in bootgen.

While the build will still 'succeed', the binary will not be correct. This
can be seen by just running the binary that is built. By default, running
bootgen without any parameters should print the help menu, but if the wrong
version of flexlexer.h is used, it will print the following instead:

$ output/host/bin/bootgen

****** Bootgen v2025.1-Merged
  **** Build date : Mar 18 2026-07:08:01
    ** Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
    ** Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.

ERROR: syntax error
-h

Add a patch to the bootgen package that corrects the issue.

Upstream: CR to AMD jira

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...use-embedded-win_include-flexlexer.h.patch | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 package/bootgen/0002-flexlexer-use-embedded-win_include-flexlexer.h.patch

diff --git a/package/bootgen/0002-flexlexer-use-embedded-win_include-flexlexer.h.patch b/package/bootgen/0002-flexlexer-use-embedded-win_include-flexlexer.h.patch
new file mode 100644
index 0000000000..1de9a91223
--- /dev/null
+++ b/package/bootgen/0002-flexlexer-use-embedded-win_include-flexlexer.h.patch
@@ -0,0 +1,76 @@
+From dfe45e10791a171c3c79699257d3d3a978ec30eb Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Wed, 18 Mar 2026 09:51:58 +0000
+Subject: [PATCH] flexlexer: use embedded win_include/flexlexer.h
+
+bootgen embeds an old version of flex. If the host machine has a newer version
+of flex, the bootgen binary that is built will have errors such as the
+following, if the wrong version of flexlexer.h is used.
+
+$ output/host/bin/bootgen
+
+****** Bootgen v2025.1-Merged
+  **** Build date : Mar 18 2026-07:08:01
+    ** Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
+    ** Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
+
+ERROR: syntax error
+-h
+
+Running the bootgen binary should print the help menu by default and should
+not have a syntax error.
+
+Correct the path to the flexlexer.h header files, such that no host version
+of these files can cause a silent build failure.
+
+Upstream: CR to AMD jira
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ common/include/bifscanner.h        | 2 +-
+ common/include/cmdoptionsscanner.h | 2 +-
+ common/include/reginitscanner.h    | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/common/include/bifscanner.h b/common/include/bifscanner.h
+index 9683416..9aa72a5 100755
+--- a/common/include/bifscanner.h
++++ b/common/include/bifscanner.h
+@@ -29,7 +29,7 @@
+ #if ! defined(yyFlexLexerOnce)
+ #undef yyFlexLexer
+ #define yyFlexLexer bifFlexLexer
+-#include "FlexLexer.h"
++#include "../../win_include/FlexLexer.h"
+ #endif
+ 
+ // Override the interface for yylex since we namespaced it
+diff --git a/common/include/cmdoptionsscanner.h b/common/include/cmdoptionsscanner.h
+index aa2f474..78fa7cf 100755
+--- a/common/include/cmdoptionsscanner.h
++++ b/common/include/cmdoptionsscanner.h
+@@ -30,7 +30,7 @@
+ 
+ #undef yyFlexLexer
+ #define yyFlexLexer reginitFlexLexer
+-#include "FlexLexer.h"
++#include "../../win_include/FlexLexer.h"
+ #endif
+ 
+ // Override the interface for yylex since we namespaced it
+diff --git a/common/include/reginitscanner.h b/common/include/reginitscanner.h
+index 74463e6..d8152a6 100755
+--- a/common/include/reginitscanner.h
++++ b/common/include/reginitscanner.h
+@@ -30,7 +30,7 @@
+ 
+ #undef yyFlexLexer
+ #define yyFlexLexer reginitFlexLexer
+-#include "FlexLexer.h"
++#include "../../win_include/FlexLexer.h"
+ #endif
+ 
+ // Override the interface for yylex since we namespaced it
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
