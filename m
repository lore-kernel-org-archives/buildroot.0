Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9953CF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 14:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DD6781376;
	Sun, 22 Sep 2024 14:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xuEb16Pi4HLG; Sun, 22 Sep 2024 14:09:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 944C081378
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 944C081378;
	Sun, 22 Sep 2024 14:09:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F37B51BF3F6
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 14:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFB20606E5
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 14:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xd1UMXeVgUau for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 14:09:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::60a;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D1ED606D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D1ED606D5
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::60a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D1ED606D5
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 14:09:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYrgTmkxGDqtuEv399lJzZ3W7VSlAsfRwUpc5/ulPO52IGs9AIjicOkLHDqAlEWxBCqgnfCGDormW4v/D+R2TPMDVq8JQRADBT0NJcIN+vZTI0vZxP3vnQHP8Ws4+qr2A11uTlRjPHDipQFP8qoOywygqRLY1mC0vY7vZ1q5KLst5XrAmdyhuUY4tjlXW2FK062uvQWcXbrj/u4ulSjVthxoud+2KMPmLOj6lUgPGoLSG/1Jlv9tUujDI9czivZV/srq7qWcrcjLpnwTMrfjorpUMiREoC0Kt3sSepxlthy4Qs6fBe6DIP7VgmtoF/wOEU2ICDKIsRwKYMgFTG2FXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaVvtUFkvdpUqWpAt5Rxo0aZsu5yiyGS5+F43b3MCOM=;
 b=Y4ZIp831ggI4cTjROUUB0uXClE0hpzDij0r9Ty7R9GkOMC5qj0kWwM26HuzPaCDxUJLg9Dp8iyc7S4tvvGQZy2g5lkBJwywqPxQbfA3uPg43sAmdl3wMzr27wgzb8eiMfagQRRA8YJVzB5QbCiROCDkfSEywp7b7zWmx89Vfm6iOf32oGPERK6OGAicdNjk4FelBsInWV+mppTYliXX0akyAu6AUA9YSn5KtY5OrNya0KmFFmFvTq79UPQyUQ9/eAtntYj8O5dCBVQO8CaAmj5++vjHrlS0FrWsNVfqtO7SA4NLrso79hmGZsmhbCvfp57Wix8lf+dpupEYV+oBdaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0684.namprd03.prod.outlook.com (2603:10b6:408:10e::29)
 by CH2PR12MB4261.namprd12.prod.outlook.com (2603:10b6:610:a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Sun, 22 Sep
 2024 14:09:17 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:408:10e:cafe::60) by BN9PR03CA0684.outlook.office365.com
 (2603:10b6:408:10e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25 via Frontend
 Transport; Sun, 22 Sep 2024 14:09:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Sun, 22 Sep 2024 14:09:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 22 Sep
 2024 09:09:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 22 Sep
 2024 09:09:15 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 22 Sep 2024 09:09:14 -0500
To: <buildroot@buildroot.org>
Date: Sun, 22 Sep 2024 15:09:07 +0100
Message-ID: <20240922140907.918582-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|CH2PR12MB4261:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d53065-58e4-4b9f-6bea-08dcdb1024f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Vaojf8D1itMRBdufxILceiQ+5QCh0bdLk8y/bRbzNQaZWe5Z/lfMKsx4KeJU?=
 =?us-ascii?Q?lKfWFcIxemw1CqxcXexE3DazgXkOt1WhUZkaEVeWigEzfn728EPRSKeMlOWI?=
 =?us-ascii?Q?QTYogR8NWA1zrJXW0A/S7pcpgng4JpT78xjEOxRs4I+CBgO79nHE7rA3oKs6?=
 =?us-ascii?Q?4xqXF9p2Y0Dc7bElMmkcJMHYMj5oPkA8yZQz4GVikHjwblGJEqMNWvdLb36r?=
 =?us-ascii?Q?TxnRSVorm4CWNGI1OI2SdygZE8sP4GFOQqzGpPOM21mNXQ9VADk9DWFY4auW?=
 =?us-ascii?Q?gcn6R0vCpCz1x4whuuQj9noK/nU05Azbq4wWQO96S3ouhAi1fVq4YO1YaHOG?=
 =?us-ascii?Q?OfQttsH9zJOcNJQDiHCvRbVzSB/uRpqmlE9DXHo5FcY4br1xPg9UDcRpBsMN?=
 =?us-ascii?Q?HvdDyGC91mNEH90AMgTnDXIZQz9JbN+DVXk6Nv9pucIhXc5lSpMdkQhGckmJ?=
 =?us-ascii?Q?H1bF1JxDMa3i8W4J2x1cgJ8G34TkrOWShF6FQN9p0bqEI1DVx8lsHXccWy+r?=
 =?us-ascii?Q?4e1QFqMcU2JTXgiWjzmKJmflMICtrzznNpAaQf5MUeVIrDE8WumgbRHAeyui?=
 =?us-ascii?Q?pLnPgmt5hdLBQCIZjysJjAXEtRL3D7m6IngN6kW7WouLVssSfk/pjXRxOjS/?=
 =?us-ascii?Q?43wABv9F8yGwptKy8kwXlgBl8HXpLM2YH/GLbjUwRdoydiLCplNzJ1DnArV6?=
 =?us-ascii?Q?aZKmYcZXSEw3/wZPVE4CodCWdIh6b0/Cu+2v1e3byAFJGgtYDeX5vyT3+CkU?=
 =?us-ascii?Q?eLJ0DznkFbDt5TzE8rdziXhdekmPNCYnZtV3Jk1E7ORnpJlyIzhEHFjOGdWc?=
 =?us-ascii?Q?EizWFPJMBwP9FDBPsHVM2gf4yFYncmF78rFfsMMmjxZ/do76nraHO8cf7KZU?=
 =?us-ascii?Q?TVXUmEktWUD4GQobzYI+KZmogDm5o40j/3pTkmWRapC/vF9fAQAewMnkXB8W?=
 =?us-ascii?Q?CwkOIRcVhHsOwxEDMnoXgI7Uw/Z5DtsJncj5SKE3pfVi/KTxkdvRRb2udciX?=
 =?us-ascii?Q?H6rQs1avEbpXmhOXXbSmhIDJgY123WHkGnshOynC2yXEg+idedz7kuCLxXQH?=
 =?us-ascii?Q?hrGPkn3N8aNmeD4Q8JiRTZxOOX92wh1UQDqufEbt4rwj8YqrlkvZ91CFjk1n?=
 =?us-ascii?Q?kfNYtZQ2A3AImqJe1Fgh8EAZeEq5MP4+k76kP/+OB345fbDV2wj76aqTua00?=
 =?us-ascii?Q?5v9hITrFF7k5/FJFF2n8Db5p82eojyCVtKf1QBchPsHQrBCEYQqNf4v0YqYt?=
 =?us-ascii?Q?4xmB5a9Dw5PF8tKDLfsITPxHYD7VZ0UpOT4Cn7Y1sfen5g3Cg2qE2E0CNsOK?=
 =?us-ascii?Q?+tmu2J6172O8yuxKlFhHPc7WkAaPd9xzXq9cmSptJESdju9qCStUuFHMY6/q?=
 =?us-ascii?Q?9qcv9AGGtS3ExCAlN5BdBwQNEe+b6V3L5TLLI/3UlIG4ZcIbXQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 14:09:16.5362 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d53065-58e4-4b9f-6bea-08dcdb1024f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4261
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaVvtUFkvdpUqWpAt5Rxo0aZsu5yiyGS5+F43b3MCOM=;
 b=4mcboQnKN5Wd6l00SpDZhi7KFhIYP7cT50tSEbGdihmJ3mwyJyCie/3WsB+5QgaVZdaXVOodM9JAx32zd7DJk+LuG5C226TBZnK6fEJS+BPj6BEfA6o4VYgi5RMWHTy9kU+zE5PnBaXwgX47LtaBLTbNBqVCQK4xOncmu47nGT0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4mcboQnK
Subject: [Buildroot] [PATCH v1 1/1] board/xilinx/patches/xilinx-prebuilt:
 remove duplicate hash file
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is already a xilinx-prebuilt.hash in the boot/xilinx-prebuilt directory,
so having a hash file in the board/xilinx/patches/xilinx-prebuilt directory is
redundant.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash

diff --git a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
deleted file mode 100644
index c955cd79f5..0000000000
--- a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
