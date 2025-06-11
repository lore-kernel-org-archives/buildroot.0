Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1369C677C4
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 08:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87D7E408D5;
	Wed, 11 Jun 2025 08:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HWfXgfJZzDx; Wed, 11 Jun 2025 08:19:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E58740807
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E58740807;
	Wed, 11 Jun 2025 08:19:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E6B0237
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 08:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B9D140807
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 08:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kg5CliEevpXg for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 08:19:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::630;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CB23407FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CB23407FE
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CB23407FE
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 08:19:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnhgIhe16jED+XJnjAnfc308AK7S6EUkX87ecguK8hyQij/MzMuUkZo0h+hM9gJn61LM5P/x1QmpVTaDK8BCFOaeY3aDvkVM9hlQvxUXnx+10Uh4dXcDthOaRpgSYQrD3H46dFNnQCPDliD/Hhp7ks57zibPkQOdO/OXgEd3H1xZgTa9NMpXR1LYpz6/tXWB/v/wCG29SqkjKOslK+eHj6TC6VZS9qVqIaoStPEn5Uvh+YNlUPVUsIwtfMc09szk13K+9CkYdkkzKfMb35PL4B20hbtj617U53oeq/Wb+2CR6QDvQzA1DF5BYO0iFQ81J2XAqXoLCD6bAZbeZ57cRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NI6mjFB8BAqDvdpTHMF0f0huyGBNPdIRzDPOh//KalI=;
 b=OizRMETnjeCcI8gYKHCq8i6wb2LLmh77Gmgih+QG5R2MwdhHPv/gey3aS2psKhEMDkTdEmEYE8x6xUScvOCv91dAeoaRqt3lnxiiiVI1Be8F9sLS5loRacr5KNx2UiUpiR0trgm22I3lvGUDkpn/3w+5BjV1OfJPkNQuF5WO+SgvUPzT6rypH+avAF4pEnDhXqy4e82kxoAN5eYAt3XL3YxqJbK9cGz4SzIbsa/E0raH3Rv9Ub5sPXVX1DslojG7irWmgP2FwwaCiVkHUUqH4u15K4+DGFJqZ+w+KgATPLolelTOYT8c7NenmxQKciaZFMdR7UYt4CPU2jCtxxRJ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR08CA0071.namprd08.prod.outlook.com (2603:10b6:a03:117::48)
 by DS2PR12MB9711.namprd12.prod.outlook.com (2603:10b6:8:275::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 08:19:12 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:a03:117:cafe::d6) by BYAPR08CA0071.outlook.office365.com
 (2603:10b6:a03:117::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 11 Jun 2025 08:19:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Wed, 11 Jun 2025 08:19:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 03:19:10 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Jun 2025 03:19:08 -0500
To: <buildroot@buildroot.org>
Date: Wed, 11 Jun 2025 09:19:06 +0100
Message-ID: <20250611081906.1050983-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|DS2PR12MB9711:EE_
X-MS-Office365-Filtering-Correlation-Id: 54fd725c-e483-4280-ead9-08dda8c0a507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VRGuSa+aAgpheWxFdIZDTTMQcb3Om2ntG2afLHznWSPf5Jl9zEhTb3wqr+vF?=
 =?us-ascii?Q?/cJhSGFhemIyCS1SVtCQHlKie2q8aAa5vH1EYO7nPo6zw7J5K3Uhyn+1cDgb?=
 =?us-ascii?Q?zSl8L5W6clNVZIP9VbPcqyvDt05+3ICE3DV/72jisBwoa1PJjXxZs6INm8Vp?=
 =?us-ascii?Q?5x2JpyWzsgBcP4IhjFSTIB7ENzC3hwmwP3VtVz9os+QXpl1tha55rSmOQM5l?=
 =?us-ascii?Q?v66qiUnY+K1xWyeilQjgcAt0Ma2ov1OYyKVIZtlXsGfDMC1aFrhbhqD0+u76?=
 =?us-ascii?Q?jmjsCBMNfqt86SI62IPtzulfLq2/f2GQXiCX4HkEd7RMOISfNO8ADPy9h/Vb?=
 =?us-ascii?Q?9Jvl4w+MLN2RLVqbJITw2MQothsgceBzeeFrx5XChmKSNKPklsZRPcQb65uX?=
 =?us-ascii?Q?Ld0/g+RQwSVeDsnZG06Alhcp1jKZOQlp0ntC+CTm3GUdnZWjLTkRKk3bIwCE?=
 =?us-ascii?Q?/uAQNFSjRkX/CsjE3zU1pinIPt0fV21Vm38qickzfseBFbhdrj87ll2bj0Wi?=
 =?us-ascii?Q?KWBFHJnKBLkRU36ryUKW0Ofa3YY9bMoqu6xdEBY1bAR/PnoX8vJ172S1x8d6?=
 =?us-ascii?Q?0IZIi9DGc/1ZV+OjBfZy1l5McNUczAQv75n5agya4fHqp5m/XsI98jicrl84?=
 =?us-ascii?Q?8ONTY+FtRUMd0IuTF2sQEAPCVFhujEzsKByoTspbh/ml3azy6I6qUOlK48/o?=
 =?us-ascii?Q?YHLp7x7eArJv+hH69v0dKEg1PHuZ6AOPkPUxhFDyBlMudqqMx8e3VE8PXv5x?=
 =?us-ascii?Q?A8iG+9T68HWPxz+hMZfcUC5p0Pda0e7f1zk2o2tzqB3YLZl3W7LQCoAEx6U1?=
 =?us-ascii?Q?B3UdcAW5jlwGSzEp6I9hEDWYAu6Z7sIUF7zGqCmo/5KAKmklHkJUwIfFZ90A?=
 =?us-ascii?Q?WQB+H71thQ3tUdlrPFQkt6pSwkzVflcExDPz1SMMK7r6TdpDlgs9c53sRL9f?=
 =?us-ascii?Q?YiER/a9d9R8RM+HOGN0+eFIcdzxNNf3kMYRbOdwqJlPIcN4G9aYcqqn77xyz?=
 =?us-ascii?Q?sAW5HWB+/puV7MQlU/5wAKj5vA+4WdAq4BvThrzw9fqf1kqFoVlGKDL37xH7?=
 =?us-ascii?Q?oTfvslhHL9EsV7JhnM+7vrzYiRask1M8JNpaCrrZ4re3rAq9vlMwzhzpAFWK?=
 =?us-ascii?Q?JFbSBPMNMVKpEsuqR63d5bqlwzP/ecMX3STXVQZMsCAzywMkgP2UodM5ERNE?=
 =?us-ascii?Q?lDeuP656+BCI/RecGpriIaEiDJEmxx71aI/VTJRwn79AgU9/rGMIBBxL6azR?=
 =?us-ascii?Q?kvaO/w3SxIeyh2yzqnI8ZmZFXKHhdR06KJVc862nhO78IIRAPpyvQeo4xhQd?=
 =?us-ascii?Q?ox+r6FrF/6eEi9LWHZgKiHQvxjUbxt3Qxh3hiIcoLDVBD6g/NHm8mz9/Sk/r?=
 =?us-ascii?Q?H54t4HRek91oJ7OjSqL/NhPIQOpJGQWtiNW7nip458lY3FcBtOkv9BA+pXxq?=
 =?us-ascii?Q?30AmCkDVZIFfP16CfZ9XrYtvcidEab6YGPFHCOBLili95AgndoLVGvm4RLCX?=
 =?us-ascii?Q?xip0WKaX7veI7SmiY+iRHp3hUMRSznMQy2UWzUnfAgtZhbADIcjNDpkLRFX+?=
 =?us-ascii?Q?rwtwNQHnttwcRinnC/8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 08:19:11.1078 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54fd725c-e483-4280-ead9-08dda8c0a507
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9711
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NI6mjFB8BAqDvdpTHMF0f0huyGBNPdIRzDPOh//KalI=;
 b=GY5qwMTtgFiDtV3qlQ3IkMblkaojWZE7COGuSHtSTGXz+u/ff12+pI/5hFey2bDOfLIOyR8SkDc3KTCYbafNSli2sBSrcw8lGUdUu5Mi0+cEyzY/7rKNpjAkWoZbWIiNA6exhjyBeqTfCGt6oh+9Ox8C6IEQNIdVfbWZCRwICWE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=GY5qwMTt
Subject: [Buildroot] [PATCH v1 1/1] boot/xilinx-embeddedsw: add comment
 dependency on aarch64
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

Since the comment about the xilinx-embeddedsw package needing a bare-metal
toolchain was moved to the start of the Config.in file, it is now printing
in make menuconfig for virtually all defconfigs.  By adding a dependency on
aarch64, this at least reduces the frequency that this comment is printed for
non-Xilinx architectures.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
This patch is to be applied to the next branch.
---
 boot/xilinx-embeddedsw/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 12924edf44..c0f6f7d43e 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,5 +1,6 @@
 comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
+	depends on BR2_aarch64
 
 menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
 	bool "xilinx-embeddedsw"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
