Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B8AC02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 07:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55D62810ED;
	Fri, 17 Jan 2025 07:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JXFbdbG8icO5; Fri, 17 Jan 2025 07:33:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8194881141
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8194881141;
	Fri, 17 Jan 2025 07:33:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D07B231
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 07:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB3AD606E9
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 07:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFwR4QBX6Hr2 for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 07:33:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::624;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA0C96067B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA0C96067B
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::624])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA0C96067B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 07:33:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLCqB1UwYu6tE2Ggh9skZR4VVh6IYpIv46ByNjJZI+cNWnHoQRiNwCOBgKxyBxlTw1eI2cSfVQzP6uVlupEERiX9IzNLHhKyVYu841E04YTx5C/JEioE7yFzqmEIWqdL5Y7hldvvOcnKbCbBC1DwsZl7ja/sD73bvtMRadRNKgYEopAm5tpG8ZuY4thI5FjUrmeM0iOE/Mdw4QseRPgb1et7fP5Vr4isjQgGzVFwSgwFk3bxdEF0E/6Km+x/O1CdB94qjYnWpoFVJFvd2LpqGneMIWO6nshI0ZH7kSXsMwoqZok5xViVxBPY5s781hs+AaLIBreXUbtnPh9GvXdHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35SXZXf2rlYpg+9qutNIsU4oeEPFseQzaTKq89wmobY=;
 b=bRCVEXSXYJ71mxgADXT/M2BFQ4ZuAClYOBnexxnIUdFTMLgHjUWscHnIJ37/5AXOrZlWrXCKak9VRd2gCvdWSNEfxDcAkDNfKsxWL3BtTHKJdDjJ5SNbZFVfBQCpt6qnDLAxiKpguNAeFWcaN5MCmpS7AY8BkmzmhF86VJ1JwyKLLfX9MI2djpt7vKZ6Ula9ozLW1Si7T6+9LLOYcSqpsa95k7iwJwZqiiWh43ZdJHJ1qDQ5o9JjuoOZBv5evqbBp9GypYsYcep4sL2LwIP+MeSoo7EQOYherkiz1yNvxJ6Rq1312Gr8UhytqnQ8nQIB2bi8fld6yndOAzQ3z873BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0291.namprd03.prod.outlook.com (2603:10b6:303:b5::26)
 by PH8PR12MB7208.namprd12.prod.outlook.com (2603:10b6:510:224::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Fri, 17 Jan
 2025 07:32:54 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:303:b5:cafe::4e) by MW4PR03CA0291.outlook.office365.com
 (2603:10b6:303:b5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.16 via Frontend Transport; Fri,
 17 Jan 2025 07:32:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Fri, 17 Jan 2025 07:32:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 17 Jan
 2025 01:32:51 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 17 Jan
 2025 01:32:51 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 17 Jan 2025 01:32:50 -0600
To: <buildroot@buildroot.org>
Date: Fri, 17 Jan 2025 07:32:43 +0000
Message-ID: <20250117073243.761456-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|PH8PR12MB7208:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8047da-8c39-46fc-5661-08dd36c9276e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2gKHbzxrG1uDOQyokbH29tOZbVxoLsHXgmTZYxxbO6QiW4lb66hv6NMkGXc+?=
 =?us-ascii?Q?sBKGHw5cBoNny3b/w9J8idZHlksgMwmoL/O8xH52UOCErNvSddbT+RKCxubs?=
 =?us-ascii?Q?Zi9OLfFGlRqUqyYwWqYmG3c7nGVjx+T0Ky1+0aeqGULuopM/evwu4YKVIKwj?=
 =?us-ascii?Q?uKsS5qoH2Xr8+/iv1koZXkrw4dAn7CVz3cfE2hHs7Uw3vFV8y874WYN77VmJ?=
 =?us-ascii?Q?uyh5GQdKQAO1YlPP1SKU/w9HH4yrTn2OTejBSgm8i6cKYLvFea18d22zwlyH?=
 =?us-ascii?Q?WBWoMFKAwUk91MKwZLG7JnIhn9Gh0d5UYoBqyq95dSpUiRhv26780tJplDVX?=
 =?us-ascii?Q?OMh8gza9C6aEF6sl1A7iNAl9j96HvkwuCFAbD73h/KhAwcmOgMQSMyv/NETM?=
 =?us-ascii?Q?4bIDK5+Dz6Lpl+LLnSpY+IuJQB3Rd61usZb/4iKWiMp+cKov3hgpiY1Hz4iV?=
 =?us-ascii?Q?F6+mPiT9vlnR78dBvGRlKAYh2ZOB09OMuVnmxKa1f1oiQpCl7DgWqQaJiOrV?=
 =?us-ascii?Q?ENked0I5A0RqIC3wBlAJLQxIwRssIZW67+fFHW9HNeYLvlUcAykLgANqGV3q?=
 =?us-ascii?Q?KP/7Ukwr8E/HxVfIH/yXmw0LjZVmxAs30K5gEzkO6PE6EXmMPoXbYB7nNrFb?=
 =?us-ascii?Q?UQ/y5GPUJhjAIAMvJsGWznIxtYT4IXjBfFzZ8HbCsd7mhVns4A/1qijMo1ij?=
 =?us-ascii?Q?OitZ1c2Ucm/aaxIkY+Ra+gKKXg3Chj1w7USNDOI7leS5N8vZOCmhAYj6GL8i?=
 =?us-ascii?Q?lAn0PQYoZKLprlMq3WDilbMJxfxRZIyctQnOh6Ko2AYwQVI7TC6MOQMOdb2b?=
 =?us-ascii?Q?oVFkIG4r8KKZSEhvPcvyX3bqgszvEpY3m6lhU8AhjFqm0RcesS77t61Xxf7g?=
 =?us-ascii?Q?eoydu1XVdmWd29K+y6qvUHRvJJtdqAcJncHT5FC8L8ATT3Kp/O50k2mVrnqA?=
 =?us-ascii?Q?CVzQrpG1oUw+zX+T5FNJzHQdtJh42ipx+SrVPyDpcTGWAHaFY08pfeLqxXUP?=
 =?us-ascii?Q?yN00BxaeoYUMwajWyzvHBoSf1vY/ZbXgWVUDnBusEVsiaf2uPZJBAsr016J5?=
 =?us-ascii?Q?+yLddTvH1QLMCjolCl5ehWQlBXDFnz99RDmzBGHKoNcKtHTaIAr2Uocyx4A0?=
 =?us-ascii?Q?SLI9eSfwNVbqOltCiKQxeo56iCHV/hNcfui253A/FtEoGMtqM9X2Dy7AVGYS?=
 =?us-ascii?Q?NlyBHkoJfEzMaq3MTYb48VTKkK0vfCdZ4/AQ1E18/xda7Hs8khiGB+iNei+p?=
 =?us-ascii?Q?5FUIRQy9zLPk/kkL2algklnLOBF+RnnKtqgORsjeUe3zCpk1Iq+Q3sHRzBrl?=
 =?us-ascii?Q?VeZgMrTp/NcBMmFTftTDs3Yn8Pq3XQXf7FksUXWw3RD86QHG9Hf7B3myGmTJ?=
 =?us-ascii?Q?ACh57X9JEuTcPurhED+KiC2uuirGM+p3H3Gixr6FLY7X/JgAk3r36pc4i5P0?=
 =?us-ascii?Q?NeeXyhVEtxCADerWn04zCrIeASXwr3ukgEKrstTHlCpK1Rp/XdaY3fA/ef9k?=
 =?us-ascii?Q?jFDWMxbc4XMN/xn7F75p4QSBzPszishnaE5Q?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 07:32:53.2784 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8047da-8c39-46fc-5661-08dd36c9276e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7208
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35SXZXf2rlYpg+9qutNIsU4oeEPFseQzaTKq89wmobY=;
 b=hgWXcrIS6UiaGE2FIhveIO26Sy/C19FUZJWWQniwtOumemeSET1TdtLIyZHrvm67j1tBueu6taxuFflecQPFbUsAIFekaIevdxekjnc8gvzLlLDjnFwAUGDDyq4zALtHnXaPxrEvM+n71pP+GhjAi4xTV3PzDnFiAjae4YyILag=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hgWXcrIS
Subject: [Buildroot] [PATCH v1 1/1] board/xilinx: remove Linux 2024.2 hash
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that all of the Xilinx boards have been bumped to Linux 6.6.60, the
Linux 2024.2 (6.6.40) hash can be removed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/xilinx/patches/linux/linux.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index ce93e4016f..09e59ceeb9 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  8ebbbe2d40597d9a5f36d47a1dfe4caffcef3d9f5ffa059ed4504bb761282593  xlnx_rebase_v6.6_LTS_2024.2.tar.gz
 sha256  f59c7d260794d73ee519ba2579ef41aa8ac4985ac5af9461f94fa314969acd2e  xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
