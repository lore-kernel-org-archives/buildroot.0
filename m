Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B11CA1012
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 21:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 164CE8056D;
	Thu,  4 Sep 2025 21:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHzWth_v5_5o; Thu,  4 Sep 2025 21:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0EAB80DEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0EAB80DEC;
	Thu,  4 Sep 2025 21:13:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA74EB69
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 21:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0B7840164
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 21:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2rcLhVpFG5m for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 21:12:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::623;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9FFF140159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FFF140159
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::623])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FFF140159
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 21:12:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siQXrYi8HF01gcwiEPURvqzJo2voIrUDloQLjESbwycT9tYhfpnw/FjOmX8A5u9Wti1P5tVoFPA1KOrCwfhPPxjAuTCibI6MUuqJxAg3pVKjWoI8T9J61v1vjNGNcevvHxnCBYOFBtnx7jGma/gZoUcUlIrAlF0nxT8qfzqXJj5Y1S3zcL1iPrVKzS/RfghG10nZCWfV3pAB3GVUpNz0WL/XM83gfmIPYq+HW/jqauEWIoAPxjfqyPOuAcVv2NUe4ZCFrPyjBSbU/loKkBpvJdBplX6NNgTEUv67EqJpnqw7y7jXVs4H2l/sn4lIdd6WOSsw7xmjk+1qkx9jHtqYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iy5kX6kJuzkr2qQTGr93CloOJ57j5xNuIGT9gxFUiVw=;
 b=MxiiTiJ6rfaXS/tcmVJdDcRMc2J7DeW8qXHNGpGst0Hxe2p7a/hoc2kLG8b5M3xooUVuACPNPsGo+DKsQpr6SFrZdQMy7GByuhm/bXC8MD8Htq5OH+xj2PJSqkZ1OD8HCyLCc41hoLyJmTpT9vf4/6pOSNEk3MJmnXOCGHL/XR+ifiGNOnD55+eUBEFfdzizFu7mwlMhpjCVZlmxqsoHN7ViI3FOpP8ry7cMOB8OPGhD/8z8r6Qbrp8XxCrc39FC/ynZygcw+P5rJUiSFntFKo5KYHZ7+Kkp/fuvmDxBjiJPZPc/VLxpBN8L5cteX6bQsMpBMElXfy+T4e/kBjcbhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH5P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::22)
 by CH1PR12MB9621.namprd12.prod.outlook.com (2603:10b6:610:2b2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 21:12:54 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::ab) by CH5P221CA0003.outlook.office365.com
 (2603:10b6:610:1f2::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.19 via Frontend Transport; Thu,
 4 Sep 2025 21:12:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 21:12:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 16:12:52 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 16:12:52 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 4 Sep 2025 16:12:50 -0500
To: <buildroot@buildroot.org>
Date: Thu, 4 Sep 2025 22:12:37 +0100
Message-ID: <20250904211239.1928818-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250904211239.1928818-1-neal.frager@amd.com>
References: <20250904211239.1928818-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|CH1PR12MB9621:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dbb06b3-fba3-4090-cff5-08ddebf7d099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZKx27MoBZJamQvrQlpIyHXCWx/i1goaDnbdmULuEQ/mysAmKNh6XcNJOs0AW?=
 =?us-ascii?Q?D6ARPFUlupbEQPdXke+gh08GwS881G0Qe5/taDfSEv2pHVJFIrfBsVfDkI4h?=
 =?us-ascii?Q?6NxR9RxRrwg52qPkU4boiqedkeseU9hExozdFHuc/Cv1sh6DTj3hHaXS7cwo?=
 =?us-ascii?Q?QmM4dh+pUpWrEJliY/M53fpW2UR/cXe3PZHgXHR7lzgqDmx5Ny2nQ/4dW9jD?=
 =?us-ascii?Q?04rOnccmcIxLiGl9tyn4d+o+NKe/OW8FOV4lQuG8NMhTnVfKDX8otL6ovkMu?=
 =?us-ascii?Q?pbJi4PWdJua3ry8sV1W4XJI+WlZqnpEtuyrPXY98vnYj2NjWaBRgTZBnj4rW?=
 =?us-ascii?Q?dCfSH3fqU67N5NUDmLLq8GfonmbmiwjyD/GVA35+DvVkPoXXVCgC2iPKt7E3?=
 =?us-ascii?Q?1/gavtWWBzxSsVVuNf5bsADJwW5DoJ1/g/mIQKDTE2JTS/m0LcpHYYKHX5aC?=
 =?us-ascii?Q?7ATcKzJTpEX3wH9ff4S9TnfZXdI2q17wjyFQJ8et/3Fq9S/8ebcuZGI5+jy2?=
 =?us-ascii?Q?Y5p3AHnix1FypwVBeC40kzb5BP2eBCEf3ejmO7sKIPFQOcFSKLOaMo35x+R8?=
 =?us-ascii?Q?Qdr7aLbofyhh+aarmQj4MajYQUWHxMHBU7/dJ6jbYLabhI2d0siTkBUyRzEX?=
 =?us-ascii?Q?4AWBIyZgg7klWKaZKq1PiCqL/kZBDt59jSjIZBPjzYRNTRwPF2PouJ3/bQLn?=
 =?us-ascii?Q?ep/D/Zgm/3yTtAfXGY0lWq7THleRFmyTOKGh1AAkcPUizp9ofZBdrilCv5S0?=
 =?us-ascii?Q?+4UYAMUhLgP1oKFKqyhkd2dDIEAgtcHKL6VtNrekBMa5nUS3z2BwNg+qezSg?=
 =?us-ascii?Q?xERzufSadxWMcsHqghDLwwDOYhJ+xx03xlMSv29EEWjM8HkSMAdHwcLBOr6N?=
 =?us-ascii?Q?RJsT1QXqnW0s2zgF4MCNykQaZ1TwXW+8cjo0gyxQzoRJ71+Dk6Ziwh0Tor1o?=
 =?us-ascii?Q?vL1VaOHTxq3VndI1zXcNNZf8FLUainW2H9qs1o+5H4EfXESepI7dHEXeXM/3?=
 =?us-ascii?Q?v51VdVFiHgyUr2j1U4OqmPPA8DaKVWoruQRlb3U/+GqHo8voQdoDbvn29k68?=
 =?us-ascii?Q?BBcQuUAc1hLUOHFJ2mcoebxwA4FgXkrmyfu5wekD/Kk1zOoDzEIPdg2BMXNx?=
 =?us-ascii?Q?gTykD1nqC++QHpN2Wp6ApxbSjtW9mL7NW7r7GjV9ZVkpyYa0T1sRHoKrHnl7?=
 =?us-ascii?Q?PrU6hP4KtFc4dwVPqgYSybzqKFjy8uRgAPdsaqLD/HeiBeu6l4JSMISSGURO?=
 =?us-ascii?Q?VysSQQASlFNgMCdOQF90UDVztPITxYurGUhIkMiUmXRBKXP5V39006RP2iV7?=
 =?us-ascii?Q?g9Md1sXhy1hdYieGdJUIT86WBpKCpPAzs2FLkmlOo4x5I8wxrQIhfSDmMp3R?=
 =?us-ascii?Q?qjH+kVswXT/pVJAd14vG1hplvz8jaIHmCf8yjIYmh54/cznZmSSjg2oppg7h?=
 =?us-ascii?Q?YEqLs6a45v749uTKmSsMS0p9diyQHBaoCDIfOGxYOWAkGGVxgGzEL7s+08Qw?=
 =?us-ascii?Q?LeYOjgZ1FVYWWZX5n4POVk+YKIr8R46KiEEiYWax7fNplTnI7nESJ2NGlL7S?=
 =?us-ascii?Q?o4TUNfKLm9Rres+VZ6w=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 21:12:54.4958 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dbb06b3-fba3-4090-cff5-08ddebf7d099
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9621
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iy5kX6kJuzkr2qQTGr93CloOJ57j5xNuIGT9gxFUiVw=;
 b=16tsud7ZTUrkwpu3yUu9MQjEqlIVmvbv3tBZ/Fwz0P5iMV92VGg1bVNwdG/J4POwYtsDxgkqzJjI8DYiGgWVrAT57aa6jtVuXiAm4YQm8mDPYhjDJ9CPupPnKHeaopiai0GuR6LXAiKqWrKzTdlwZ0F1VLFyBrHcSh+bvZ8fSFM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=16tsud7Z
Subject: [Buildroot] [PATCH v4 2/4] boot/xilinx-prebuilt: add hash for
 xilinx_v2025.1_update1 tag
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

Add the xilinx_v2025.1_update1 release tag hash to the xilinx-prebuilt
package, so that Xilinx boards can use this new release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- new to patch series
V2->V3:
- improved commit message
V3->V4:
- no changes
---
 boot/xilinx-prebuilt/xilinx-prebuilt.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
index 9f12e88e7a..a8dee8f129 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.hash
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -1,5 +1,6 @@
 # Locally calculated
 sha256  b9e2572885ad12243e10d48d9fccb24771a528b9f27aae1b29b45f0806ce9f1f  xilinx-prebuilt-xilinx_v2025.1.tar.gz
+sha256  48fd698a16f79b9a828c35ca5b2b50fe832149d1a2938c94c0bb6a2e249b0bed  xilinx-prebuilt-xilinx_v2025.1_update1.tar.gz
 
 # Locally calculated
 sha256  7b2074b607264a07347e1a7ef0323229585942793469f34b2cf9628f7623e05f  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
