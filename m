Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B128CFA46B
	for <buildroot@archiver.kernel.org>; Sun, 23 Nov 2025 17:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77D9E60DD3;
	Sun, 23 Nov 2025 17:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSsya20rC7XV; Sun, 23 Nov 2025 17:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95F7F60DE9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95F7F60DE9;
	Sun, 23 Nov 2025 17:25:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 14CF0E4
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA5696081F
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CqtPT2H_n3dR for <buildroot@buildroot.org>;
 Sun, 23 Nov 2025 17:25:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10c::1;
 helo=sa9pr02cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1CAE3605DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CAE3605DE
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10c::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CAE3605DE
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:25:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxPOa8XJefry+qPgxuJ5EDh/6vBGItuyRpcWQwINNG4P42qAsvZamnuJl4k1i6yZCO1p8AAoql5lr4weGQGyxHZiESHbAuRZWOrZMwEJ3yiPWn5oGiDQYxcZUV/j9wg8EQuuUbEe45UWffvZnbVl0u48YnTzONuUYCrIr35V4qQ2bwR1PvxbvHSPCO68259crDPOAI9ZT/5QfXmXqK+5iIFC/ukZU7a2R6CaloB/wj7A/JGQyBs8EUBPNnMXdVCJw/mbLQ8U1uDPT+/tOyVmfoxhY/MUKrpx3EWA9l4RJf5i1tasvHWh6WuFVge0w25FoG+vrYmqAO4szc9KuYPhnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGhTgzMhm6HKwjEqyuO26O5gzSWcOaUCM0bs3/pvmEU=;
 b=O9IU70P07xjGNAcQuApaY9YTYhFtYAY3LD2sypeNTuOh8YHAuZ3ujyU2kjGmx9a5lTbhuciuYdHRnS7eF6QD9Hay9BM+Jl6IFH6rWFVA5owAtRsYjKiYCq5apbB6nvnxjp36zAsYw5Iv4LwpKMqnlKP1GRtDH8Hjk1ZIFjPR1JPOx7RcgPp8xztrNlA/RTuObccMXBL0W4Ln4hM3qSSsfxalR5P4wSQeemOVWjXuwlHbxWhvQpQwFmfYtzZnD18EK8OtFxUqpl0XRL0vzpbhERp1tQC4CW47/sU1l0haUfR448F8x5MSoKobFmTT16/xjkeLpTrKfALLWIoT8Aiv2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BLAPR03CA0008.namprd03.prod.outlook.com (2603:10b6:208:32b::13)
 by SA1PR12MB6703.namprd12.prod.outlook.com (2603:10b6:806:253::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.16; Sun, 23 Nov
 2025 17:25:43 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:32b:cafe::e5) by BLAPR03CA0008.outlook.office365.com
 (2603:10b6:208:32b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Sun,
 23 Nov 2025 17:25:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Sun, 23 Nov 2025 17:25:42 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 23 Nov
 2025 11:25:42 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 23 Nov
 2025 09:25:42 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sun, 23 Nov 2025 09:25:40 -0800
To: <buildroot@buildroot.org>
Date: Sun, 23 Nov 2025 17:25:28 +0000
Message-ID: <20251123172531.527134-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251123172531.527134-1-neal.frager@amd.com>
References: <20251123172531.527134-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|SA1PR12MB6703:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf190b1-4e8b-4372-4d79-08de2ab55476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|7416014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e9oTYgI2B0j3gZgcexlz3kvPgE71rO1Me7opIAm4EMUn39ZcCcVhLhor0fbo?=
 =?us-ascii?Q?6PuycM33qT8/ZaTjBnZdrwXe88MAJ9cy9dUb+Cr4LFBUxGvqNEu1OWF+Z6ET?=
 =?us-ascii?Q?0RVIuvSwDUnXkndJXBvbCFYlR/wKAmbzut4drXizG+rXQQE0iQACXh49Mk0i?=
 =?us-ascii?Q?stbkzxfTV9LUINik+wZNIM1erfKBz5KLMvVQV8D6YAKocpuuEHQ/MvHMokvS?=
 =?us-ascii?Q?R+ektR/CJvj6T2wpw3I624j/Albn5ThVy5nmcdrz6ZudhuDLuFS9M5IEZdRE?=
 =?us-ascii?Q?3h/c2xjqVXl525qhpAcDL0wzyP6ELSDunL6OyXoMd6XMS0u58014m3iQXUl7?=
 =?us-ascii?Q?GsB0TrQpVgRIWjdqrGYH0xAI8IS4X9ZDuflibTHVpcczkuBjz8xOja/phZu7?=
 =?us-ascii?Q?T4bWFnN7kEDqwnnfpDIKLUtPlT0PZce2JIulTI8LIkf2Mh3uGwZyM1V0ysgX?=
 =?us-ascii?Q?jSt55515H6mDfL9tgHQ9cUr8ZLTejAPzHp/B2aNv/QkOMrQAz15CtePCBnVn?=
 =?us-ascii?Q?a7r3gpadktk++kKKNOyvZEmXuDULf0+yipigLTKVZzcOaWlkVAkHA3RQKqpD?=
 =?us-ascii?Q?g4pMZN+HjSdohkPIXs32cgBokYZbJVRzsnzi+zgvlpICsvBkkoR4wj3Kz2XO?=
 =?us-ascii?Q?dtFRjGzbEsn3Szi2IxKXfw0DYPJxKW5j376TVTWsyRw9LAFiflg0yJBJ4+of?=
 =?us-ascii?Q?SoGm658yqAdQqv3n+E00UFULjaERXvsB4EfAePjEHYb60trd2MwNpvS5dflx?=
 =?us-ascii?Q?mjdGN6mvnXYZRRFzxLNIkOS/p5St6+YiqEWFCM2CSTQmbt/tJQR+1Vm6Z+/i?=
 =?us-ascii?Q?TgYm3kAquVji300ZrlMOCV1tVUiqOTZAYXRALs6pj2LsN7/ef5atKsXH+2jW?=
 =?us-ascii?Q?IMJDxnGRVuA5hODifK87dpq3fmpG3yVTC0+1giGDWM1v7Yiv5SLTMcHWw+ab?=
 =?us-ascii?Q?5n0X7hL2RgtgdJ/WUON0wJ8THG4xUk1geH2nN6w93y+du2Zf7q8/X3OzHFbx?=
 =?us-ascii?Q?SiWZT5UH75OG8C/CwOtOqL8wmnUZUymOar2UaskclbLhTrOZTBkm9jDobMod?=
 =?us-ascii?Q?jH9FzhBjSnXKgImYVSwMkQI6MhwqATbTWyjPs3YKktObuSnQX+3gB+T9z6CI?=
 =?us-ascii?Q?g1sB3nI5R9fwadHsX+16s+LBrCe2520CvyrvWURRtfCLmfc2R59TmUKex41M?=
 =?us-ascii?Q?Hb8Sd/BLCZ5eNFWR6XkGSoTmaiJyOzdc/ciEQtLVCZdKudUAQ+WLiP3/avG7?=
 =?us-ascii?Q?jzcTfJ+Zrpug3FvTpthErTGs/LM53yH3iTJ9QEjuZO7+98k94pbYV8DR+nwD?=
 =?us-ascii?Q?851DjCsR1+qhZ5U0N1iQ1NuKhMV4SXzNFOY51VWFqUgTs9X6b+v1KOqK4zWL?=
 =?us-ascii?Q?/6q+0yjfDhNcVaku5MnNRvd6hi5HbDiDiecSuWdJI1uY1cEYIws4Q2aJqbfI?=
 =?us-ascii?Q?bjlXxlSMLQGQzbOAdfD+5iwW/PjM30qADZkw6jkVJRTWPDh0v6EAjrVNExnz?=
 =?us-ascii?Q?EKSLtpI3y10JkqGjYle43kYma6V8i0yjIEzy0Ydc84F2WBnduQ57U055ZH1U?=
 =?us-ascii?Q?eEBZPimIIsguZBH0X5Y9qK85PM1J15Zh9+GraybG?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2025 17:25:42.7239 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf190b1-4e8b-4372-4d79-08de2ab55476
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6703
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGhTgzMhm6HKwjEqyuO26O5gzSWcOaUCM0bs3/pvmEU=;
 b=hw/pbE1SddQ5fg5CRd6S25PgCL5a7uKsiFFYWbRsLA4vFjewGUhHm7qg23z7SeP/9/50EZ8m0heNMr/EGbb3w+RKbwrAmlELYx2GOYTDZUME4HlGwZb3RRMjH5u1ZssmxqYh/m5iDUqvbuJ+yqdCX6tbkYoAyz2tldBDnXhtsVk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hw/pbE1S
Subject: [Buildroot] [PATCH v1 2/5] boot/xilinx-embeddedsw: add
 xilinx_v2025.2 hash
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

Add hash for xilinx_v2025.2 version, so that example defconfigs can be
bumped to the latest version individually.

Since the license.txt changes with each release, move the hashes to version
specific directories instead of having a generic hash file.

xilinx_v2025.1 hash is moved to boot/xilinx-embeddedsw/xilinx_v2025.1
xilinx_v2025.2 hash is added to boot/xilinx-embeddedsw/xilinx_v2025.2

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .../{ => xilinx_v2025.1}/xilinx-embeddedsw.hash              | 0
 boot/xilinx-embeddedsw/xilinx_v2025.2/xilinx-embeddedsw.hash | 5 +++++
 2 files changed, 5 insertions(+)
 rename boot/xilinx-embeddedsw/{ => xilinx_v2025.1}/xilinx-embeddedsw.hash (100%)
 create mode 100644 boot/xilinx-embeddedsw/xilinx_v2025.2/xilinx-embeddedsw.hash

diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash b/boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash
similarity index 100%
rename from boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
rename to boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash
diff --git a/boot/xilinx-embeddedsw/xilinx_v2025.2/xilinx-embeddedsw.hash b/boot/xilinx-embeddedsw/xilinx_v2025.2/xilinx-embeddedsw.hash
new file mode 100644
index 0000000000..77b4c2467c
--- /dev/null
+++ b/boot/xilinx-embeddedsw/xilinx_v2025.2/xilinx-embeddedsw.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  fb9a705a2974fa4d8d79142baea204d388389b9b37d6f26194b7b759f8978457  xilinx-embeddedsw-xilinx_v2025.2.tar.gz
+
+# Locally calculated
+sha256  5ed583a37f9592d4bef73061f14f85c2ca70b8b7a12ffe1ef8ea808fbb764425  license.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
