Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7266CAC5B5
	for <buildroot@archiver.kernel.org>; Mon, 29 Sep 2025 07:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ACCB80F74;
	Mon, 29 Sep 2025 07:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-Swb7ZhUkyI; Mon, 29 Sep 2025 07:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78C6E80FFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78C6E80FFE;
	Mon, 29 Sep 2025 07:16:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C425194
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 07:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D8A980CA1
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 07:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WgY1BZOOvV1 for <buildroot@buildroot.org>;
 Mon, 29 Sep 2025 07:16:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c100::f;
 helo=bl2pr02cu003.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1DB4780F74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DB4780F74
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c100::f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DB4780F74
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 07:16:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrFx8RqoQGZNsZ4Jliso79/VVrcE+7UAGhcPBug7peo9MTCor5U9WiKtRmGTEYuoxGEVmpOnfnxvF/P4Mhq81QHFIttmvsXCfyF/TTQhP3Z/1ixA7/0FUR664A0Y/dZ/lhjLYvTInIw+pN8+iLs8SSzeeqCQ6+QN6iLOqLAkV0kHrClI2I8KnGYJFJZ8BMsmXpOwPYpmrKxZTStcP+I1zAihieh79FefRCWkFHDrBPyppjxeX3xhcXpmtCgjCPvDbgKZrKphWInFSOGP8RJdg4NEdya90ZFQw3wT8OTGDtChug8O0lvXePSC7PpI0+Gh6ySFNKY9esxd4gwveGbrbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZ4tufrlb3NYFXKBd0YEBDAv7gQOP59x+FI8Ef4D8NI=;
 b=kIYY23GHJrFIAaqNTEzCufFzykSb7QEQS/ehz24flqAUhiaeHcn+ZTALjilr5qoKyESaTghYgPPQdRpjfn2RkeC30tIbZE1Jdxz2pxMnnT8HxNz4OcXD6VWBUbH5JZNVjpDZR/DVKOE/lxc6mgxP78+KjYlGVTOwsoG1u9jzR6/NZtEgwpHkN35HWmIC7VEGY3gNjhNbX8NVP5E/gLfCwYAAogrXfdHTTuA1az5MjzOsgb+0iU1hUkcPRwsM4oiX+cUKa23NH/EGJWuwMbqVecDz+p1Cu+Y7pM0ENELmtU6OolAtme7PVhXwk8TUxOEZp8wvcMdXdaWG+rEAT78IkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR05CA0032.namprd05.prod.outlook.com (2603:10b6:610::45) by
 IA0PR12MB8647.namprd12.prod.outlook.com (2603:10b6:208:480::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.16; Mon, 29 Sep 2025 07:16:32 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:0:cafe::29) by CH2PR05CA0032.outlook.office365.com
 (2603:10b6:610::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.13 via Frontend Transport; Mon,
 29 Sep 2025 07:16:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Mon, 29 Sep 2025 07:16:32 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 29 Sep
 2025 00:16:31 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Sep
 2025 02:16:31 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 29 Sep 2025 00:16:30 -0700
To: <buildroot@buildroot.org>
Date: Mon, 29 Sep 2025 08:16:22 +0100
Message-ID: <20250929071622.136094-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|IA0PR12MB8647:EE_
X-MS-Office365-Filtering-Correlation-Id: 4926c474-016a-45d5-c439-08ddff281ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CaL3MMRfobTOny1uYJEyUWie3Aemr+gdAYY1yx6TbOf4v4txRpkGz2p9EUbI?=
 =?us-ascii?Q?EjZUTtqBBoIwMjbrhG7a/Bd5W8Mw4syxMMt0burjoFneRwF+dmbM718XGBBY?=
 =?us-ascii?Q?nR6J0z3H0x0Sq3nkNY1LHe2Tm0ATeoWXvcKjupTzXVBIt20oU/fYJEpdlOkR?=
 =?us-ascii?Q?WnRsLmBObVwtyrBI3EG5nb69EWPovgWzMPkaKXSLq9p6/IRXrFlkU4zGvv/s?=
 =?us-ascii?Q?SNc78n8S/cJAKduDsPIwkOu28Jdi9JZIDKfR1u8YEh6WFnn6daN/D8IGL3ZX?=
 =?us-ascii?Q?H8R8fW8fF1F89v1Ql8qV4PGi97flaLb1tThAbgGiHhriJlNpE//5j6q0C9Nx?=
 =?us-ascii?Q?rJwAVw/z5yvPn7SOTGJy8vEGmScVUIrCj66NVwJSOPKWM0MTtL8EDkRKPBiR?=
 =?us-ascii?Q?JDbYrkCVG7Xy49YSlmBLp9Qy4TKKILvvhp9RSH0RTE3ihuMKDwjFlPBVCUAG?=
 =?us-ascii?Q?vJdDw1XV26MJxurzAJhbqu/dJgB5ngq23j1AzDoEXyFfHcM/OP6XdJmWDpqY?=
 =?us-ascii?Q?gC2Mv+Nr5pBvM/qJc67Bv1oPbhoSV/Dvzr1jusSR0b5D6MYt33kySOHtj6Lj?=
 =?us-ascii?Q?P4iAfBbc/y6jTvLBXxxq6JxMMFP6hlf0wi1S5ZmBkS6Q66kehu6osVaCeXKr?=
 =?us-ascii?Q?nGz0OTyeahDbeuIwBzkLk92w5OwMXjDhbBs9mPWBKxVIk6e7wAbNkaRor1hG?=
 =?us-ascii?Q?Pk6v8VKenLBhcHuIor0m7im7OuSo/Q3cxO/bR3kVWQXLKAG3llPejs3TR+GL?=
 =?us-ascii?Q?AbSKFeldluIwTefsXCjKqxd7fc7+baXcIxms6J5sy5eCcIJdPVXo04CZAjCA?=
 =?us-ascii?Q?P/iWLcHdeDXuw02VAt5EeanBFQ1GsvfDiz7sIDe//m/L4EZ/huwCulxNWjRq?=
 =?us-ascii?Q?/8O6ffhLQh83R5rG6d0kwd5U6IvY/qnkg10AQO7LsKVC36RErdiCtBz1RH6A?=
 =?us-ascii?Q?r5XawA1IwEylo2ZoM4hGL0Dr/2kILMzmeAPya4iZQyT0HGjT3a0J7AFJQbKt?=
 =?us-ascii?Q?LerR+xtbqoZ5Pf9UMln0+i7RCOeVqpJ9sG1iPcsrUPHjGKqvOvhFsAn0N18O?=
 =?us-ascii?Q?kBtOccUH6owgpvsxFgvdJmHwp7rQniU4rQW75R1LhmPQCAl2T2Q412Oek+R8?=
 =?us-ascii?Q?ulUdZW8r5fpfgYRUR00s+X/lTvtwllFPnx9JFFC9o8Z2lWsN3J5kuukz2vTm?=
 =?us-ascii?Q?pgi9Dk7KvsBcZi+vTBm/P+HxB2ExVCWN8TwjEGSksuJ1PZBJHgRO7eHQGynp?=
 =?us-ascii?Q?ZYl2NjDuAHsow/lAnzHE3bK6+si/V5Q7tRgQ5Wf/s1/skZbvYAKswtUVT+BO?=
 =?us-ascii?Q?gheI4Z5yDh8XwJ9k+HqfFQe9b23M6u8v05JJ1m6SzRcEIdZbBft77qKdCgad?=
 =?us-ascii?Q?4UGO4OwNUhBRZ6+IJgIlIA+jtYGmDR23btKzrrRmwHWtMElqxb/hfhZev6id?=
 =?us-ascii?Q?7ejrItcdxe/KOAfrFIE+9NR6pT6gZsmEGOEwUyx1xljQvQKAs79syHFEkZRw?=
 =?us-ascii?Q?KH3MpCiI0+QwagZuwWstyxCfQ24h8n2QiLoV4YD8dHd9CZpthWs7iHUOhw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 07:16:32.0701 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4926c474-016a-45d5-c439-08ddff281ddc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8647
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZ4tufrlb3NYFXKBd0YEBDAv7gQOP59x+FI8Ef4D8NI=;
 b=uYPrB5A+hZp5EGyxDgYpeC5EfIpUlP6V6FUO5y1TfeEhXKAp6G+F59nlMjZ2RUnUbc7pPqkvO1mZztKKgKvXrzCWjbxAE+zW06swWNUgQjF2YvH/OZgAlL2ycdHxmVSQJEAMYwMuUwqKB9SA7n5qaNFZYSb00i3j9jFfvF7oIvE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uYPrB5A+
Subject: [Buildroot] [PATCH v1 1/1] board/zynq: correct zed board links
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

The web link www.zedboard.org is no longer valid as it routes to a generic
avnet.com boards link. Fix this issue by providing direct links to the Avnet
ZedBoard and Tria MicroZed boards.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynq/readme.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
index ed7509f2b5..225af4b9dc 100644
--- a/board/zynq/readme.txt
+++ b/board/zynq/readme.txt
@@ -43,7 +43,9 @@ References:
    https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/ek-z7-zc706-g.html
 
  - Zedboard/Microzed information including schematics, reference designs, and
-   manuals are available from http://www.zedboard.org .
+   manuals are available from
+   https://www.avnet.com/americas/products/avnet-boards/avnet-board-families/zedboard/
+   https://www.tria-technologies.com/product/microzed/
 
 Support for other boards:
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
