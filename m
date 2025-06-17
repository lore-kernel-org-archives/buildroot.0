Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D5EC71136
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 11:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2232882037;
	Tue, 17 Jun 2025 11:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ekg7VqBQ8Erz; Tue, 17 Jun 2025 11:50:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D1A881FF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D1A881FF9;
	Tue, 17 Jun 2025 11:50:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDBC1D79
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 11:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9A4C81FF9
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 11:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_35gVZIA8Ll for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 11:50:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2409::60b;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E0C4081FEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0C4081FEB
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::60b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0C4081FEB
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 11:50:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zHHujv318H4YscXp6Bq5CJeuBZ1u4wT8lRlMtuMEh6c98AocV40zcAq0AJ1V64XgK7TF7wEis+rq3Y8bLRtsPfy8JBvGfA50QaF6LUhh6H2jz4WBI1zvG2IA+ioNsjGkgg9KYOxw7SdAKzYZvAKnVzJy6xSUhkzA9/5TKPtVqKoG7NAyuj8rRiDkkQjAYNSbcCVUKCcyke1LWAWdKxvTGGXJtnOskkMR4MXXbYgh7sSYnEuwTbxoZd4uEJ8IchQgqANI+GOhKdwMcjnSvY1FAlKDcIFZgQZ91umkSzpj+lzPdnCbVh1H+RTMURCyrvFESg0gN+TU6Ml/YXv5xY0SwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0fuNHbm6QXH163Z2eUe6XNYT9kVsn2svTz4yJmaX6A=;
 b=CboXaXiAjDGEv3i1cuJ8cMLOfUEU1fCZT+nzjPUI7qSrKeC9qchikUeaEPip3RsBvTQOb8vNugRBiWZrdMVXGqC0Tf87Cv96nem5yDW5f817S4RdcoBqA/hpDiqYJm/d/hGho8tFhDkGDlKLe3L00hn5U+q3rUlfxK43qz2uQb5I563GgWSWKeddEtQ8kTByVSRdPXNNarWoS+YQaHa/ZlIUsZZtfO67ejnQLxdiwIxyxH2ONsOTZKzIyXyBd+mEQ36roYdZarNqHWMEvd3cS1Jy/TXhg5kToEQD2PUKkjAMugC4eMTC/UlLD92MUjclaPTsw+8Q/WdMo2V892C++g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0367.namprd03.prod.outlook.com (2603:10b6:a03:3a1::12)
 by CY3PR12MB9630.namprd12.prod.outlook.com (2603:10b6:930:101::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Tue, 17 Jun
 2025 11:50:10 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::11) by SJ0PR03CA0367.outlook.office365.com
 (2603:10b6:a03:3a1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Tue,
 17 Jun 2025 11:50:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 11:50:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 06:50:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 06:50:04 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 17 Jun 2025 06:50:02 -0500
To: <buildroot@buildroot.org>
Date: Tue, 17 Jun 2025 12:49:59 +0100
Message-ID: <20250617115000.2001160-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|CY3PR12MB9630:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c4a52a-8ac1-4f7f-96ab-08ddad951c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9RoCTeqFhT9QyqsS/fptVhXxiiZ12nDyyzxXpIAcelyR4rxkLf+RRE/eR/Fz?=
 =?us-ascii?Q?vjwQ025O/K0TRZLw/R28C69oGsyhF0Q8yiPmmNtDQh/1TGHrZU+e3XjILVhZ?=
 =?us-ascii?Q?mELOhA0TlPW2P/JXqnxTqU1o8Jy9oZ0hZ7sm02UezyHhCVfHXWkb5xwoD16x?=
 =?us-ascii?Q?uofsNrLtSkaDRODLP09TgGMJDK9KWd4HgdlwSlzqnYSo5qR6HJ0zq99GQfh3?=
 =?us-ascii?Q?L+Q0KhnnZE8JVk55L6Uq8EcaAXvGEyjxWBDbVJA+Q+MENaKFD0aux8n/bhxs?=
 =?us-ascii?Q?8OsVwhqTMMkoK7Qks60k8FvCWWiMe0YZVROfPOlHu1I5n2Mfg2Al8tiTfnh/?=
 =?us-ascii?Q?uRXxm5/91xpjoPzUmcJbaWbXzHwms0xqka5TqMNgE/o/OuRrv3yI/Z5sV2QH?=
 =?us-ascii?Q?/PGIK0MUmjqH0uxePyXpGjBtf3Iv//vXq39DDrw3dvJYimNcjx9Bli+vw4HM?=
 =?us-ascii?Q?nN1fob7YS9ZzTYD5fLt8/4BBKqU7OK3kEjCtw636gYEsHmLsvitWRNdDIv3E?=
 =?us-ascii?Q?Zl//QZPzfEwdzHYNvuaIqFJzNRmKuPZdDkNs+9XUzL+jxHxheKcVRl/P5qvU?=
 =?us-ascii?Q?+86wN9Zdoh61AoZO+mRTKBtyNkf4RZGbrsslBcs6jm+o6Y6ZrHQx4PteVooV?=
 =?us-ascii?Q?bUWrGlt4XE3lH6KGUnwYimixKXnV5QQjWqy+lwg+Sbrqm0h71ujmQeyf4hTH?=
 =?us-ascii?Q?vIPQ3XNzOrKA2NA1OIWmcJd08c5Udoyc3qumMditwdYD6PIBR0+mCOyo/mR1?=
 =?us-ascii?Q?a89ouoWI0WFNR1NEeqFzl9lxSen0ZLKsQsE8K3KTgL2oNs8BpmzWNn4iNlrI?=
 =?us-ascii?Q?D+3rQUFx/N+gDLY6I/uwXmwd9NzoKBKmno/TBEsrj1ucALPuA+mJwRir4+Vh?=
 =?us-ascii?Q?UzfKjwdVbHQDOgImO9QbUMdr3xgGyDbYwhgK3DGNJji6Nzstt+ypSb8hTE/W?=
 =?us-ascii?Q?qhiOLIMlFxzHwVz1jrUu/00RTTc2e/y0rt6cWZ2ultckqOhSmYQlCfGxC7cP?=
 =?us-ascii?Q?p7SlYmaJi4UxBP3RLIcv4S1nIzvPWWS+JSToHglY0EpFlXgd//lUm4YXc9M/?=
 =?us-ascii?Q?tOO45znk9FXo6E0p8NjVUZa3wgbRsYBFP/nDxpmZ9LOP8dzB9Z6BTuPhZF7+?=
 =?us-ascii?Q?EhbBV4nalFubi5XOLGpuIA7WJKMVbJA0C11vvqolKlLdW05g3eEpjhXgMQF3?=
 =?us-ascii?Q?c2DAyNrlPdizv0yHkbBavakt8LHxyHc6rQayNrVT2a4csQUvPZcojjWKmtZZ?=
 =?us-ascii?Q?XmxQhr7urhX2uw6WW2vrYaC+d/FycFqPejT+y9svcTSsY8IOc4OqHfQuMIpP?=
 =?us-ascii?Q?DRgKLqrdY2D3o5cnP93jdE29cJ9rfpbcQTFtbzvOuO0eGkWrWwAejXSHHjp9?=
 =?us-ascii?Q?/bxJLZshb4uB1QAzOvbU2qNNVXLT2nky7gDUy95sapjmLG2q6G6P9+VJMa2D?=
 =?us-ascii?Q?dylCV+u0C0lfjODi53SpxdDgU2rLwhiqEd+Zzqnx2Umf+uJr02fEGk42nPDh?=
 =?us-ascii?Q?f1EOZNq8Sr45yNIEsRseqEPt+1qnucpKyVYKoyAUG3tMns2EH98w/TRIF2CH?=
 =?us-ascii?Q?NHWkr8M6GnS1VTD8yV4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 11:50:08.7517 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c4a52a-8ac1-4f7f-96ab-08ddad951c06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9630
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0fuNHbm6QXH163Z2eUe6XNYT9kVsn2svTz4yJmaX6A=;
 b=ukOXxX39Zf6B75SZFaAK4izTZu8cowTsZO3OPhHDPaMdrhM5F6/+IZDqt5RNHKydyL1WuC7bWUEk8pkgSYsZNfNoW0fRuGf8ChfUvbhwQPuh5ujj73+lJawdskGy+fYs6fBaxdRVzKrPrAjEWOKSPNVN7oWwuKh8f9ZSZmbbqsM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ukOXxX39
Subject: [Buildroot] [PATCH v1 1/2] board/zynq: update custom board
 documentation
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

The readme.txt file for zynq boards has some outdated information for the
custom board section.  The custom ps7_init_gpl.c is now defined by
CONFIG_XILINX_PS_INIT_FILE and Buildroot always puts the Xilinx u-boot builds
in the output/build/uboot-custom directory.

This patch updates the instructions in the readme.txt file accordingly.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynq/readme.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
index b2a4cefedd..87df7236f0 100644
--- a/board/zynq/readme.txt
+++ b/board/zynq/readme.txt
@@ -62,7 +62,7 @@ the U-Boot source tree. Without those files, boot.bin will be built
 successfully but it will not be functional at all. Those files are
 output from the Xilinx tools, but for convenience, U-Boot includes the
 default ps7_init_gpl.c/h of popular boards. Those files may need to be
-updated for any programmable logic customizations which impact
+updated for any programmable logic or DDR customizations which impact
 ps7_init (clock/pin setup & mapping/AXI bridge setup/etc). See
 board/xilinx/zynq/ directory of U-Boot for natively supported ps7_init
 files. If the ps7_init files for your board are not found in U-Boot,
@@ -72,13 +72,13 @@ you need to add them by yourself.
     make zynq_zed_defconfig
 
 2) make uboot-menuconfig
-    Visit the following menu and enable CONFIG_ZYNQ_CUSTOM_INIT.
+    Visit the following menu and enable CONFIG_XILINX_PS_INIT_FILE
 
     ARM architecture  --->
-       [*] Use custom ps7_init provided by Xilinx tool
+       [*] Zynq/ZynqMP PS init file(s) location
 
-3) Copy ps7_init_gpl.c/h generated by the Xilinx tools into
-   output/build/uboot-xilinx-<pkg version>/board/xilinx/zynq/custom_hw_platform/
+3) Copy ps7_init_gpl.c/h generated by the Xilinx Vivado tools into
+   output/build/uboot-custom/board/xilinx/zynq/custom_hw_platform/
 
 4) make
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
