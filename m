Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AD8C5DF85
	for <buildroot@archiver.kernel.org>; Wed, 19 Aug 2026 17:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC3F74060C;
	Wed, 19 Aug 2026 17:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wm_0nA1Px5gG; Wed, 19 Aug 2026 17:14:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787159681;
	bh=/Q2bGKQDcfHgYJ1vIOSFiqFeEqCzHCY3RNaWIyvRdcw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=eX4Vq2HHEAvUcWhieZCH+Pntv4DJHKfiavHwWEsD7VGgxh0cGAWH8eQxZvCNQwx0I
	 86VJmbKEiRShDXdc4p6hnp0mKtq1IbovMBV2fnb2VEyuAbJQNbEcFpPHebhHvxAW7q
	 Pp1R8pkOMnwQqlW+I4jQ20psosQMQy2vgbv2goGxUDSzITP2KqistSubUiRkTx07yk
	 vtequUk08y3qLZ8VjzFF2MEk43rzIaTyZWcSBi3FguO1dRA9xhL5eT8lPT4fjrD3tn
	 jBMfrA/962su1Jb7oRGYfd5OPpDARak1zPF1g9Qj14SlbYVGkKxqPnQXMxbEa882Aj
	 i3k/qWkUE5AAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E45D405B5;
	Wed, 19 Aug 2026 17:14:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4189D29D
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 17:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2702360675
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 17:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwL90gCHFovn for <buildroot@buildroot.org>;
 Wed, 19 Aug 2026 17:14:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c101::7;
 helo=bl0pr03cu003.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c101::7])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D378E605DE
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 17:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJtkwBUFpnaPRcrdrSEAHZ7LwYDHA6tS8cqf4ElVsr1cWJ/zFcOO0wxI018egt964xOvl/KURbyRUu3a4kz4DIRC/M2nlOFZg06Smg1454lsdEE1Za3pTdoJUB+7b6CKt25GQV6Tu3Cxz/GmNgZwX3JP89CN110ivbeu1yDkYgbzLFinpZeZ6HA4FOvFiJha1zazmuWGTtDLOthIEHV08cJP5l7xLsx+mlJjbHWJGa35Yb6yhqbEnjFMzgdr9F1oCwaaoq+bqkaFIHcAyEXeL3RDLzFBqkFJHSEKkCdKF42BHl6bfQ4MO65ljj/LALXSQXwy9+teS8rATN8SIt0UIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVvqcDLsaneHOpMJ4wQKMhzmEDxO/4ydSDQmVR0vnBM=;
 b=k6ys4d6i3cLnWPzf6ELYLo9blRnOmjYL1qkK4kdist3NwEaPfWcY3rAbcW5aWbg9NVy8Jqk+JpQTzM9mJCFkJdybJgm6vbR8V/D4bWsh/yzZ54Jw0daCXqN2mhrAQGdCT/ohGuDFYvLXhMbpBTq/p2PAqgKujhFVN9gKq4Ax6fbUcZKgGf8yo/iELBuQjugF8+Lk+3eKOP+tEw9U9rNvT8LKWTHWvosV8hkOs3w79SajO4ypdRy5Hi0YSeVlLu5P0TnyiW+KXqCe30xW012Tpe0eS0CltgNM1bRu98IDluw6UJbZcOwOdSv9HaDfLkTcq10eJMEPNxPzjS7wmLwXDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN2PR18CA0019.namprd18.prod.outlook.com (2603:10b6:208:23c::24)
 by DM6PR12MB4266.namprd12.prod.outlook.com (2603:10b6:5:21a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 17:14:29 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::6) by MN2PR18CA0019.outlook.office365.com
 (2603:10b6:208:23c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 17:14:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 17:14:28 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 12:14:26 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 12:14:26 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 19 Aug 2026 12:14:25 -0500
To: <buildroot@buildroot.org>
Date: Wed, 19 Aug 2026 18:14:16 +0100
Message-ID: <20260819171416.2585284-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|DM6PR12MB4266:EE_
X-MS-Office365-Filtering-Correlation-Id: 20f5465a-de30-4e44-686b-08defe1553a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|13003099007|56012099006|10067099003|11063799006|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: 4mUUHPA+Mj/gpgbfOqXDkgs4pVKOvbgt67DFHhEua+WyJRaQCalJgKKqCYAmUUexUEsj9RBX4zoOb3FrA9AOa1tSFfcd3PVfrVcAQ84wWDY/BiNxgIRzZrw/jVpnarFSHLpexErGPsB/pmJcWtbLxjp4UFKc4N9emWZ5SebRd6dKKaTz74pAvlD74aT+45sjM6lBkgkXoXYR/1tbU2g8j30UME/HABvhckN1Pu/c6rR5lMczky8Q48LB1ZgYDNvGDjUtYoVUl53o9EJ9h8LMw1zE7w4bNcuVV0NWllEoxsJufTuDugwtVd7FPwon9ip6xB6tceqZTZqbViA+Om4lNvRp+mamAex8TgUD1vitvWvruTGIQbgZRT+RJ1lw5gJ+KByP9DqXp64kn5Md9nyowXmPjNnz9+OLUnhUlwHgP8YfVcRFURSdjvLjtNSXGqlJ7Ak8v/WbNsCF7QSeEGeA06Sot/qym495WIdy/y8jEbPT9wyV/7jSGzDyAepTx1ZiB5uTUF5RbAZs/4Po8EzAQjwUGo4/mXjiTwGN7P9CONysgZE/2BgoUtlqcBpqGShqpKzVXqK6rFlyFCY7IGqMLMoxinmtv2JoWcgmXQ3clbn/AP6lWdfJLFCI+HCn0243UYcNna+RpOdMdhAPO1ADWGgkxdIyhjaoXAUby7Pc0K9L6EaCqB2sXICUcFQdwZ2KuDHWRSG6VJQ926sujOydFqd8bCBmSHaJA41OOXDEbxHcq32cpd8mljNO8c0cuzsd569IoV+y9myzVO8IB4fjgw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(13003099007)(56012099006)(10067099003)(11063799006)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KiDXyBxG8FSrNMSO6CCfMWxhpLn6s8JCD/m3av1gWyLCJt5nEeAmMG21DcoVMKG/a1/SWDy4KFnkf/y/ye/DiuYHNVCQVni7hfRSe3ndIMHpIAU7PPFWyrYJuWi+7rnod8qWj8UyGeAp1HBJJ3j8Kia4bqU83Wfa0X7D6CqiVCuKiB+TVUXnoA2c48Q6vC5I8WDvmAK5F9px5SyHAWtjCzGuJVxjXnf1+07SpgpvbL2BL3U6btUXMcKT57w/pPWDKjnf/DyEqrdT9Z90RZ+C0BczccxuTMTPmAZoopDGCSEfrQzE1xVgt1Y9wLwec+fAMrPdEy2eJWbM73Qmn4MEqZXz6PC4x9A1BJQbZppF9CIy4GilR1usscQmr2OGT0nuXv1NC7WMEFEzTSL+uWqBtKcbT9m0tlghMLPWWxcJssq5Y+pOoNj0XBXOKdBL921b
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 17:14:28.3657 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f5465a-de30-4e44-686b-08defe1553a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4266
Subject: [Buildroot] [PATCH v1 1/1] boot/xilinx-embeddedsw: versal2_plm:
 configure xilpm runtime lib correctly
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

The xilpm_runtime_lib is not enabled by default in the versal2_plm Makefile:
https://github.com/Xilinx/embeddedsw/blob/97f2baf7f69e9d5f447650110af0d8841e501277/lib/sw_apps/versal_plm/src/versal_2ve_2vm/Makefile#L13

Without it, there is a silent runtime failure.

Add config XILPM_RUNTIME_LIB=SUBSYS to make sure the xilpm_runtime_lib is
correctly configured and included to fix the problem.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-embeddedsw/xilinx-embeddedsw.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
index 5fb442ee2a..b19c420d32 100644
--- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
@@ -53,7 +53,8 @@ define XILINX_EMBEDDEDSW_BUILD_VERSAL2_PLM
 		COMPILER=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
 		ARCHIVER=$(XILINX_EMBEDDEDSW_MICROBLAZE_AR) \
 		CC=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
-		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS)
+		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS) \
+		XILPM_RUNTIME_LIB=SUBSYS
 endef
 
 define XILINX_EMBEDDEDSW_INSTALL_VERSAL2_PLM
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
