Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F53BC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 10:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0152880D75;
	Wed,  7 Aug 2024 10:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcIrPDldtT2g; Wed,  7 Aug 2024 10:58:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D40FA80E6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D40FA80E6B;
	Wed,  7 Aug 2024 10:58:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 450291BF97F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F2F240576
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZvc2qU5KSfg for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 10:58:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::621;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0BED40557
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0BED40557
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::621])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0BED40557
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 10:58:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvqNfzJJmRCNy4s8ZVq4xjl8XK9ttQrUuiOIY63P9Rke6XM29HoODm+jnrKqW7nK7Cq2OKGe3QRCQW766m6eXuMd2+0Rxf7w7kRWMBz1E3lKxOzbKx4Fn7XSslXwsq7oI/u9vvYvSE+rp54UOoE6DHao9F7d6/1Oj8yzyEP4uJfUkUTKj2PJqFcMlWMuSi2S8h/DoV/ypgGainLSiooAKKiww/rIUcV6BGCTdp6IROJsTYCmsxMwoQ2ufou4PjwcVAi6Acj0/rnQ/70qBiHrZzDeqtTAjx3euI3y8GioMjZWs+q7bt5P6iSSoPISKskcIw8oyOoV/imWoHLVdtWOgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ucFUU4ZE6HCMj2amQoxodYtBuj1eR9LA8r+KTuu3cY=;
 b=dtuv7zvUC9j5GXmHQhpTGd0Gk+oSfUJOQxqDXlOdn2K3PUITzXMQANUibwyVcuWdiUwIKaq3hlkWOjclUFaAN1bFOBqzWddTO02tXnF1vxCHZg1WVjxsvgDnBQbHims9tLBgnisziWYMcNpN7lPRlOromzjanwBF2aYxX4BEZxXU8DPMXqk583gapdopY2dZlLjuC5tXln3woN0SFEhQSG5C8R7ZrOaFyiHgUR0blCysGBEjcL7ovynXfADdARD4NTlEzGL5NCX6objlh+Vqk/3OR6XTt02GrULT8BHRFZC4RI0TCKV8syjVxv3dJVwF/PuAg+2xAl+gsG3i5+Kyrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH7P220CA0115.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::32)
 by PH8PR12MB6915.namprd12.prod.outlook.com (2603:10b6:510:1bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Wed, 7 Aug
 2024 10:58:22 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:510:32d:cafe::f2) by PH7P220CA0115.outlook.office365.com
 (2603:10b6:510:32d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13 via Frontend
 Transport; Wed, 7 Aug 2024 10:58:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Wed, 7 Aug 2024 10:58:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 05:58:20 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 7 Aug 2024 05:58:19 -0500
To: <buildroot@buildroot.org>
Date: Wed, 7 Aug 2024 11:58:09 +0100
Message-ID: <20240807105813.3844985-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|PH8PR12MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a58a14-5751-474a-5818-08dcb6cfda40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ty3szXSNF7i6xy3PjTFswwUEffAaiTLQaVmpKsrdVad9aNGcjkrIny26G3LR?=
 =?us-ascii?Q?oe9zXlbxXcgYTHEFiP2pVXcjNpeD2oRIJvaAUQh0n4QdR21+JbHN9H0PrNt5?=
 =?us-ascii?Q?7LBSNez58Mcvc5QSS9Woc4xU3oBOEql6Ojf+xClzn11G/gF7x3TLVGhd20rb?=
 =?us-ascii?Q?VLp0aCd+jR+eb92ZsZ2ijqZYLmTAQ0bTbKlSr6PEft20RL1698MaSomdq+S2?=
 =?us-ascii?Q?TvPgDoqei/UEazoN/N344WJLa7B7w/G0x2KlbAvR/rjriA5CT0iVRvJ1QcsS?=
 =?us-ascii?Q?FnY8uAlPi+7VlJW5TaD+KdZw29wBnzmAMGzLdT+yR32XNO8AfCAWb+lIqWq3?=
 =?us-ascii?Q?mBWENd4EMfW/WMUqkyW2ghP/o9Zh0IAzujEoSsjd2ypfcxn2E/DzTbGR0W8P?=
 =?us-ascii?Q?8qiYAwy4FIbRBxegjkgOlIIIc/+CQuw3TM4atA5N6PhhQjZo5H0ottgI+RWC?=
 =?us-ascii?Q?C4+kEQd8hltPmZ+3MxyO5ob228SN2+BVucFDq9c/SYilqgG0f9635iLcOtbs?=
 =?us-ascii?Q?LezgFjGb3S1HLMqfFx93k79QvOBBWy/mvn8kSsHYmG9tBTk+T5pGkDX972RR?=
 =?us-ascii?Q?wzGBjZdd8YdwPgI36/naFl6dM31bhPPDn2hC4Pm9eMfm4NdnS94Am+mm+TwN?=
 =?us-ascii?Q?vJMaOpvRaYGLQnzFrUF5rbywGnrhyEjZZICmKhwmCoVkZaKJ1N1Sd7vQzqjH?=
 =?us-ascii?Q?aXZkGIfuvQVZW/ADEx+CK2Dj+cmWaUesbXgxHsxVLbUcr/DG8fCAm1/UvK82?=
 =?us-ascii?Q?CnQCZuFwrUqXM8hCQ8gDsSDG0qtwPQ0Zd2blLq48Z74MrXxmCGOvodAVzrWG?=
 =?us-ascii?Q?nh5x1O0rS9PvnMRbwzz7as37hvO4plvJEItTfEgWMiuo5m2ESxJRv0aX4wXv?=
 =?us-ascii?Q?4PhTidCt0J7amM1uYpNnbuonyqWDiwRrZ7Fp0yAbYdhN3NHVcWIhsYw2yq7Q?=
 =?us-ascii?Q?nHRqeghGtgnh9Irq1qSX3x0gLw9KKvi2QuVCAggq/BlzBjKImoh9FIuLjOxQ?=
 =?us-ascii?Q?N9WyJDxbSqQ2vlojl5+jLZMhcpZNFIsj3mBEnITsQXOqU3XYlLv/H3O1Fv6i?=
 =?us-ascii?Q?zFk03161520OzVk6et2/MeUWmmR76+cJ7MLwuteivvx7X/7CyBRNyUjBwSeA?=
 =?us-ascii?Q?sg80cUt+RNwxHvQAWmrCJUEFPzNJMZdtleqilsM9fx71LStlVMdQv/ZBa2o1?=
 =?us-ascii?Q?sDLrVbOZCoiZiVGoIcobg1FdkYQtl9Dd0IaMeVUCWX7SHPWBYvQhJZ9FWwgI?=
 =?us-ascii?Q?1TiDdKjqf5Pvn9njBml96oKTI7eGmoCOUnb+XE4NWaeu2j/J5LWZny+HRw0J?=
 =?us-ascii?Q?ZOcRVDO+Auf8m0ZoWLd4CTiW3zbXxKkkaRTaeBbHE0aNILt/EMByLcmwLNl+?=
 =?us-ascii?Q?2ym0LwToTkB9/SYRppOfHDF1D2PUmHIs9iqzPMihp26sxYy8UM7q+s/3Eh0n?=
 =?us-ascii?Q?++y+aXcpfps=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 10:58:21.5121 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a58a14-5751-474a-5818-08dcb6cfda40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6915
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ucFUU4ZE6HCMj2amQoxodYtBuj1eR9LA8r+KTuu3cY=;
 b=eDItzVoURVi/7vQPruVoESmbsTmTAPvOS8siZvqF/JQh/GmXhAwYMv9YvL7ENYNhk1fwwmhJUj+Xe/mZ3ixiyN282Ivj8woGXztfyr6Df8I2DY0tt12YkdTeAdjdYkzj45ACpKC/uLZrW2LgD6e17VfNg7Psx75nFxkzGD3h2nw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eDItzVoU
Subject: [Buildroot] [PATCH v1 1/5] board/xilinx/patches/linux: add linux
 6.6.40 hash
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the hash for the Linux 6.6.40 release for Xilinx products.

The release tag was missing a patch, so it is being added here for users that
bump to Linux 6.6.40.  The patch has already been committed to the linux-xlnx
repo.

Upstream: https://github.com/Xilinx/linux-xlnx/commit/5365c13a86998da06d845c918f849b30b8735538

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...dmaengine-xilinx-dpdma-removed-extra.patch | 54 +++++++++++++++++++
 board/xilinx/patches/linux/linux.hash         |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 board/xilinx/patches/linux/0001-dmaengine-xilinx-dpdma-removed-extra.patch

diff --git a/board/xilinx/patches/linux/0001-dmaengine-xilinx-dpdma-removed-extra.patch b/board/xilinx/patches/linux/0001-dmaengine-xilinx-dpdma-removed-extra.patch
new file mode 100644
index 0000000000..f5008f7dc3
--- /dev/null
+++ b/board/xilinx/patches/linux/0001-dmaengine-xilinx-dpdma-removed-extra.patch
@@ -0,0 +1,54 @@
+From 5365c13a86998da06d845c918f849b30b8735538 Mon Sep 17 00:00:00 2001
+From: Rohit Visavalia <rohit.visavalia@amd.com>
+Date: Tue, 30 Jul 2024 23:53:29 -0700
+Subject: [PATCH] dmaengine: xilinx: dpdma: removed extra vchan lock
+
+There were redundant spinlock for virtual dma channel
+Removal of this fixes crash at xilinx_dpdma_chan_queue_transfer
+
+[ 2876.675266] Call trace:
+[ 2876.677701]  xilinx_dpdma_chan_queue_transfer+0x4c/0x200
+[ 2876.683004]  __handle_irq_event_percpu+0x58/0x170
+[ 2876.687698]  handle_irq_event+0x64/0x11c
+[ 2876.691606]  handle_fasteoi_irq+0xc0/0x220
+[ 2876.695693]  __handle_domain_irq+0x7c/0xe0
+[ 2876.699775]  gic_handle_irq+0x78/0xa0
+[ 2876.703428]  el1_irq+0xc4/0x180
+[ 2876.706563]  arch_cpu_idle+0x18/0x30
+[ 2876.710131]  default_idle_call+0x24/0x74
+[ 2876.714045]  do_idle+0x238/0x2ac
+[ 2876.717265]  cpu_startup_entry+0x28/0x60
+[ 2876.721171]  rest_init+0xbc/0xcc
+[ 2876.724384]  arch_call_rest_init+0x10/0x1c
+[ 2876.728463]  start_kernel+0x4ec/0x524
+[ 2876.732113] Code: d2802008 d2802447 f2fbd5a8 a9400823 (f9000462)
+[ 2876.738200] ---[ end trace 1c82d54670104ec1 ]---
+[ 2876.742804] Kernel panic - not syncing: Oops: Fatal exception in interrupt
+[ 2876.749662] SMP: stopping secondary CPUs
+[ 2876.753571] Kernel Offset: disabled
+[ 2876.757049] CPU features: 0x0040002,20002004
+[ 2876.761301] Memory Limit: none
+[ 2876.764343] ---[ end Kernel panic - not syncing: Oops: Fatal exception in interrupt ]---
+
+Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+Upstream: https://github.com/Xilinx/linux-xlnx/commit/5365c13a86998da06d845c918f849b30b8735538
+---
+ drivers/dma/xilinx/xilinx_dpdma.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
+index ca9374ebaf3f..db4a5c2dd226 100644
+--- a/drivers/dma/xilinx/xilinx_dpdma.c
++++ b/drivers/dma/xilinx/xilinx_dpdma.c
+@@ -1182,7 +1182,6 @@ static void xilinx_dpdma_chan_vsync_irq(struct  xilinx_dpdma_chan *chan)
+ 	chan->desc.active = pending;
+ 	chan->desc.pending = NULL;
+ 
+-	spin_lock(&chan->vchan.lock);
+ 	xilinx_dpdma_chan_queue_transfer(chan);
+ 	spin_unlock(&chan->vchan.lock);
+
+-- 
+2.25.1
+
diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index d85f773478..e34e86757b 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  ea85988e66b9a2e19ccd76d0f5f5e657988a873fed292160917712f45605a805  xlnx_rebase_v6.6_LTS_2024.1.tar.gz
+sha256  c46fbcb45b2c7da919663119eeab2581bb36b6238ae809a71e19013291d9054c  xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
