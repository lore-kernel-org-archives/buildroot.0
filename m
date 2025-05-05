Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D88BC3ABB6
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 08:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 025A9817A0;
	Mon,  5 May 2025 08:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJ9G7-H8iNnF; Mon,  5 May 2025 08:48:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38E628174D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38E628174D;
	Mon,  5 May 2025 08:48:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD7D9EA
 for <buildroot@buildroot.org>; Mon,  5 May 2025 08:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC626608D2
 for <buildroot@buildroot.org>; Mon,  5 May 2025 08:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YfpIRJH8vBGL for <buildroot@buildroot.org>;
 Mon,  5 May 2025 08:48:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::60a;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 84906608D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84906608D0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::60a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84906608D0
 for <buildroot@buildroot.org>; Mon,  5 May 2025 08:48:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQ27aBSc5PUQ1xHIg/6jRDpKb+dnlTk/53vXOOfQbjAbocwxsugQwPAgbD9IauBRaYLM2nRHqCgMIcaA4zpmIRdERw5eaSfZHOuTspSt3OO7AysuVfSxCE6h7h7ky8MtTiCy29BAqumAQeEcpSK+SCA+QVKsJmTYFX4l6paU1T0OUDn41YyamYWfVQHhQMnTLvGZ+q+tCg6wP1EBpIRBCIE1I5ulBgzNrYOP+pmS84b8BgPdEa4fYpFYiXW4haDyEVCLSVUbKms5PeYhljvlJwXvNmJe1Li0ndhGTUW9RHtSuI6vASrfjG2FX56gf6QZSKJ41IwUiCZMT6DKbXkOSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1psYnayG9ka57oAjDJg2lDVWVPQXMiHzXGxi+++4OI=;
 b=MjoTy0nI+3HA/mqLjT+pnDhmIqtndhJRrsafN0O8km49zN0s90L81wTSJaS5FoiU6AUT53UmbS0Dbg8epNCfRJu95WYsL+wSFnaHl8wyc7FmHi8lcCK189nakSxtaSIcoB59hTls0SUOpMnXmrwAG01AK889jYkF/MCmX8ewuT1LrIkm+L6xMpBnUZiWXaL29Cg8ecgl0kYHXnKnHCrNPHSip5k6enhQvwgDfrMLjfFGv8h9f6z1+U5pKLsjnI0B+ZoHaAJepqepeVWuMO/L47ageYWpuHAB1Pn/hV8PFV/ypvHJAA1XdFPTZ+pvOg4EGqtLMzDpwpAq7D30tG3KRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA1PR04CA0008.namprd04.prod.outlook.com (2603:10b6:806:2ce::13)
 by MW4PR12MB5603.namprd12.prod.outlook.com (2603:10b6:303:16a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Mon, 5 May
 2025 08:48:46 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:2ce:cafe::a6) by SA1PR04CA0008.outlook.office365.com
 (2603:10b6:806:2ce::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Mon,
 5 May 2025 08:48:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 08:48:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 03:48:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 03:48:42 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 5 May 2025 03:48:41 -0500
To: <buildroot@buildroot.org>
Date: Mon, 5 May 2025 09:48:39 +0100
Message-ID: <20250505084839.3872523-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|MW4PR12MB5603:EE_
X-MS-Office365-Filtering-Correlation-Id: 9944416b-c503-40c9-b5c6-08dd8bb1a4f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9U8jXFWQ1J1m1+voFGsjecXs3P7wtZKjlnanzNnHK1IBhsBbHg70s6TywoWu?=
 =?us-ascii?Q?UocF9TzE+wBHTpOHe+ZfCwy9ytsqIdpVXKvEosRCiY+cxkKecUiuyQJ+wAba?=
 =?us-ascii?Q?MwOCLDBWBI7e2Z+1N17wjMQ5qd+6P+/GmuJlXaHbBB13M8aLkKbeefwgj+4l?=
 =?us-ascii?Q?ZXPduGDdIgo/SIilbhaKLufJeBdyvr0zCbw2xp6lkMyburwOZIdWYrFTw/im?=
 =?us-ascii?Q?156TBAO0zpubM7nfCxVt/OVNtbumQ5KWBxuBdANNRPUzu6eYwZ191X2HLMmT?=
 =?us-ascii?Q?xtvQnrmrDhCX/Iv0l0ekjcX6FjXZqHlV+wtArTe3L2XKY8NR1E037qN4mlzx?=
 =?us-ascii?Q?YMOD/jNzPMD0CHT3cxh+1z+T0eTCT1BI23jeuWM/VJT8YiinV32C9yi+Q2eM?=
 =?us-ascii?Q?m99j9nZzTLwlvYI4D7AsU7tyU/hYmr0tRKoujr75LoDwInyNH5NpQiPjSxpi?=
 =?us-ascii?Q?TayQ5ye7ATpRBF4fLBMlzdO1YoE2l5ji/ZdFeLK2aJ4KJYdCXSD0ndH//70k?=
 =?us-ascii?Q?1wIQBUKxkysLV+q4TfdfNaDfQvMJTEZJuHuTwUB6UgpfDT2Fxb1y3jGF3yYk?=
 =?us-ascii?Q?3kTEJ3IkqDwbRgX711A02JGzOhGNJaK1vAQvo+v8Tj1Y9xqyJNuKIBx4S2RX?=
 =?us-ascii?Q?+By7cpc8azOt1HG6SC1j0UAidBrma/ADhVy0XZEVVAXKGhaHXXqEsIwq4/Oz?=
 =?us-ascii?Q?oGvX01mUymQWNo+fao3U5UzN8TfxNjHyQJc5Cz/rMnvkDZi72hK3y0/KugX5?=
 =?us-ascii?Q?BNmUZybH9s0gnpjxrfd8yeVMvTHob2jTqZiORs9fdbG7ueBJdN2Leu4o7Mdr?=
 =?us-ascii?Q?jhF8cxnHgz5PmWShF3L3v8FsrYxBGVgnAT0BFTp+ijXcjanD7MWVJOyZ1Z3D?=
 =?us-ascii?Q?dC1TI8x6gJYZSVk3s26tyqTxpasb1QQJwVkmxRdLbHolzSr4SPKsr4QD5qUH?=
 =?us-ascii?Q?lyh2A3vJnK2cv62JrRXGbwSuI9PeY4tF14CqJJvGSkWGQGTwyhjUr4EsucvF?=
 =?us-ascii?Q?346Ibrzm2rIkXFpTVnU0UiP2NzqZlXwhA1WjGxzcgmA0e11L4IJRKLKGy4Li?=
 =?us-ascii?Q?SRy8M8YtOKbKr5w+bcaBnj28zguFu0O2+T2ZG4M1aZ0xkhmP64AzTWL4c1tE?=
 =?us-ascii?Q?ivK8F2/CnBmf11rwJgI5HwUHQFYcG2qZX96cb5qcHtsUvtpU1SGhFoQ1M+B+?=
 =?us-ascii?Q?ru0X5iib96g+zwZl11vynEu7Eft5hysAYm7xFbyjKZXX3xkEWLGbwy9bi3uf?=
 =?us-ascii?Q?nivJb0lMbuV22MPPsGCS2V7P/AqZQ/Y8PJwB8L88NJGGus0gNDLFAGF9eoe4?=
 =?us-ascii?Q?6RYp3UAPFYHFJIcwIIlI1MAE2yKDTKV/DcJglyZR6an3/XARCpaFlpuHjNA+?=
 =?us-ascii?Q?SLpBwAmIh2HJ7Qa6C3MfpHhFkFwn28p7mAqnh2zqXml+StofM3s27U6XNA5p?=
 =?us-ascii?Q?eYgGM1seHH1VlsuiYGG5QC9r3W+mIo7CzJNfq5GzMDiezEdn7RzuYUDafli4?=
 =?us-ascii?Q?QKqQVOaImqm37Cy1j/k2BiJzZjD7R4hbemVnHD+w50sjkImmpJLHyBAQQkXD?=
 =?us-ascii?Q?vPFZdHbVBBAIrQJcMDY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 08:48:44.8830 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9944416b-c503-40c9-b5c6-08dd8bb1a4f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5603
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1psYnayG9ka57oAjDJg2lDVWVPQXMiHzXGxi+++4OI=;
 b=ZCJFzyszibDTUrPHHein/y2a9yTKRJbdn2WZGeq5yMWMHb/VJXm6SILh7TRVaHeYvBzuGAagQ7c620BZnFCVUS3hTppZvlWWbdb6k3dlgIDOGDnI8TR5etzWh4grmmCLTWjLZWinDD5NXLEh6DvTACbR1NGxLn+q4s9ditgGHT0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ZCJFzysz
Subject: [Buildroot] [PATCH v1 1/1] package/gcc-bare-metal: bump to gcc
 15.1.0
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
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com,
 arnout@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps gcc-bare-metal to gcc 15.1.0.

See here for changes:
https://gcc.gnu.org/gcc-15/changes.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
This patch depends on the following series being applied first:
https://patchwork.ozlabs.org/project/buildroot/list/?series=454269
---
 package/gcc-bare-metal/14.2.0            | 1 -
 package/gcc-bare-metal/15.1.0            | 1 +
 package/gcc-bare-metal/gcc-bare-metal.mk | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 delete mode 120000 package/gcc-bare-metal/14.2.0
 create mode 120000 package/gcc-bare-metal/15.1.0

diff --git a/package/gcc-bare-metal/14.2.0 b/package/gcc-bare-metal/14.2.0
deleted file mode 120000
index 0737236850..0000000000
--- a/package/gcc-bare-metal/14.2.0
+++ /dev/null
@@ -1 +0,0 @@
-../gcc/14.2.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/15.1.0 b/package/gcc-bare-metal/15.1.0
new file mode 120000
index 0000000000..669da9e956
--- /dev/null
+++ b/package/gcc-bare-metal/15.1.0
@@ -0,0 +1 @@
+../gcc/15.1.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index ec245db35b..17232a8ef1 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GCC_BARE_METAL_VERSION = 14.2.0
+GCC_BARE_METAL_VERSION = 15.1.0
 GCC_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_BARE_METAL_VERSION)
 GCC_BARE_METAL_SOURCE = gcc-$(GCC_BARE_METAL_VERSION).tar.xz
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
