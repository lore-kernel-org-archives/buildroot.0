Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEA0CA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 08:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40EC041422;
	Mon,  1 Sep 2025 08:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAkgDufVgnjT; Mon,  1 Sep 2025 08:03:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4142B4142B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4142B4142B;
	Mon,  1 Sep 2025 08:03:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70D3F169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6213440457
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oP_pxsHqaewK for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 08:03:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::621;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B6824020F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B6824020F
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::621])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B6824020F
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:03:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKS+h0NDUlVuvD6uj8X9DLdWmiC40cyrBijwNj4ZttH0olgNr11KY+wAeIEkfozZ0D6dYBwNABSbbmE53Ve7M4E4tqjMVe3pP/waHvTCr/+yJ8wgE6Q4CVJVSkmM2+hG0EU+rNWHAbS5kRmJJ9gPmmMI2+yeIBbo6a+q+XNx2dOiTIvLA+WnZdBvOnTFjrD5cTOytgf4SNTKuTt/XJAuhCEfij4+NE8V2SigBx3DyQaB/KOZbPRleSoGDETf6OY8k4lq2SeG9rIQfLZYfx9aSdanH5jX5Buv9d9RnSmrvesZZ88f3bESK/dl0jIm++wkSoWMGUwf2er1gANEMF2v/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/96yvlxOitRJ0BG4hplwAZsKCbVnQ2HWfPdGD1k/DnE=;
 b=EZnFdAbxvYd+jEzLS/mfhZGvP4ph2TxQDZKgWU/ghsVAUq5c7Q5BQ5AJNNQVF+EIROE/xe2/T8OhCJQWMeYULAB/xcPYL7S1Il1HyDCKebO7RriGByUrpLIpkO/bEiQ7sogbE6+eXsp1tUGkaZODcwlAPNB82q91IFvzx0mowdM4HxEoxJlnOKeKELAyE3Al8VtsmLedJTLI75aHlMwTotXF/cMlcTzqMwlfYL/x+dAJmmQcIdbBWaiXT236bpFKh18HQ6vBETMlvOn1ctL1d2smsZ4r3ho+a+iFcaJMtodGK5Z7U6A6J6JGFPucV6nw9gqa/k+0UgOaUFofzDFgFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY1P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::9)
 by DS7PR12MB5936.namprd12.prod.outlook.com (2603:10b6:8:7f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.21; Mon, 1 Sep 2025 08:02:59 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::84) by BY1P220CA0024.outlook.office365.com
 (2603:10b6:a03:5c3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 08:02:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Mon, 1 Sep 2025 08:02:57 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 03:02:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 01:02:57 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Sep 2025 03:02:55 -0500
To: <buildroot@buildroot.org>
Date: Mon, 1 Sep 2025 09:02:45 +0100
Message-ID: <20250901080249.454090-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|DS7PR12MB5936:EE_
X-MS-Office365-Filtering-Correlation-Id: 59468e19-b0a4-4996-4dd8-08dde92df6ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3moQm3Eksw7puphfcVIp1LPhx8J02p3VNhfwE8pikhKLQR8QW7q5hkRnT9EQ?=
 =?us-ascii?Q?GhmJii6ozJ+TbvSh+yDdBtRaoqKsny9oJn7gzSK4aPGdURvHxHj5L0P3dt+k?=
 =?us-ascii?Q?nsRzoHVa1nGuoND0jZQ4RiON/UPjw144SOHCMM3Z3uM1w1xCpef/Udc1aZN1?=
 =?us-ascii?Q?6hpxLdNS8Os4IcNc8M0UVH/J0adNbZhv04TtmbK5AygHQd5Li68FylMjO/To?=
 =?us-ascii?Q?46vybCohfI69LuASRBeWvFgrVkxIJed/Aa5istVWqAokMOww8eBXOdnwWMbQ?=
 =?us-ascii?Q?e082ojMp82ZWJW4H2gaGwCGb1nBBfdQE0sybjI2FxnPvpgBXY6e1VLQ+AvmE?=
 =?us-ascii?Q?jtGxAYSE0PtfJYlxrbnGIyu/JIvxL5xGYRBbPzBflOiYoycF8ssqkmhLw4Ps?=
 =?us-ascii?Q?aCj1T5zcqMgN3C/QO5lOk090yMmhj9HjbHTgOcPSMHTcyGhThKamnmXqaVHV?=
 =?us-ascii?Q?OxbwixRs7/HvIR+9bht4fFOejiM8uyMpYM5jKrixpF/TtkzAKE3SYdzAVveW?=
 =?us-ascii?Q?umD1w4j2XEHsDaTXvMCa/1hq+xbdQLatYJ0Fg3pfH5CUq4jC10RQfHxVmHto?=
 =?us-ascii?Q?TSao/34sw8PhBVYX3wgYrrtjapjIElHwsM2/kcnryyXfNbEJ3Nh+ITCMI3Bd?=
 =?us-ascii?Q?ThUMCu95mW2CEhx9nF9/4Et9lYbwwd5kel4wEcgmI0dB0NiLFgmQOtiTA7UW?=
 =?us-ascii?Q?gaFOGJf6MloVELWGC/ZMZcUqpbKCRdCS6yNZS2nI9G1oJ6OnZaTlXqLWlFEe?=
 =?us-ascii?Q?T1kZ9qlwE+d6si8u5VQvUPg46wEfLt2KAka51LvRg3Gyh1yAyJDMtXd3RfNd?=
 =?us-ascii?Q?QIBlIaVMbGPkj9Q9tWcRPFN+jQrEghdRTV9WOXJUVwrf2y8/9MOwcKJaXqe1?=
 =?us-ascii?Q?FImGL/okOIA5XCmD5kN3hl2Lb/1q1sCzVnc6Ed6a29kY09bRFnOzmf1otI7n?=
 =?us-ascii?Q?27fNmxKGZ8G/JHj6rEeIUakyyq21ECA47LFUpz4m4vBnsXqqaMd00QV8boER?=
 =?us-ascii?Q?tBljBUrLChNBcwtrcYlHL9UDXXVk5AOUWcxUL8XTHSIy7mcnfwbmFcVx7x1Y?=
 =?us-ascii?Q?9YQIhWGfWKQMwkxhEG8EDzyjw0cS3IH70wOp6y/zmlgWxIFdc/w3TUuQpkvz?=
 =?us-ascii?Q?p3EEngpeqdlat47L25gaShEzTRExswtSqdgXVrA7FJz/Sq8/ILtJylNvJe8Q?=
 =?us-ascii?Q?BT/dg+tmt5ePqJEu5nz0Bqd8cYxwznS3ChZuPV66rpWpOpAbC2K1v3/3oK42?=
 =?us-ascii?Q?eW6q+5SuyrZBV4f+vRWFFEzJ9lE3atZTTP5UOk5UcMXMlLZeDwXtlKFqGu0Z?=
 =?us-ascii?Q?md//SXjiM/lkK/gk4EHAP/wQ6Wf3Mq2M/7QGqDzs53CawCma5iW4DSf0lhnW?=
 =?us-ascii?Q?TcCVxRXAHhMA0m6igeDunMC53uQJTTzBKgkA+eQDqsic60wr1n7LWtZlSUom?=
 =?us-ascii?Q?WdCHRNWLIhfcfUwkonKlmLXUPj+RfR4kFs563UoYtmiwij0VcrmTCrUYJXIN?=
 =?us-ascii?Q?k4Ft5u5NndFzk6vt12j1PN54ijWC+uY7rxM7gwOJnS2WzE5wSXbAZn+EXw8g?=
 =?us-ascii?Q?6ejjPDl/QeaKxK2+sHc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 08:02:57.8807 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59468e19-b0a4-4996-4dd8-08dde92df6ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5936
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/96yvlxOitRJ0BG4hplwAZsKCbVnQ2HWfPdGD1k/DnE=;
 b=n2bwXzujIKKlF6n9LdDk1e6j/Ix2NozHva4Qg2htkzrpVjWz4a0ae95I+cQcHwoNSnWujQFGHAUJgsBUDOa9jrA/ErwHaP8Ce7H7GagVLdjBpvno7Z7Co7epWH2AZWTJW83+jHDEUP9T5LOXnfqaeQkDOceWnQ4VigNT9Ecl1wM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=n2bwXzuj
Subject: [Buildroot] [PATCH v7 1/5] boot: add
 BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
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

Currently, the xilinx-embeddedsw and xilinx-prebuilt packages are appearing
for any aarch64 processor. As all Xilinx processors that need these packages
are ARM Cortex-A53 or ARM Cortex-A72, this means that these packages are
often appearing as options for non-Xilinx platforms.

To reduce this occurrence, this patch creates a new symbol
BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS to limit the appearance of the
xilinx-embeddedsw and xilinx-prebuilt boot packages to only platforms based
on the BR2_cortex_a53 or BR2_cortex_a72 CPU and aarch64 architecture.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V6:
- new patch added to series
V6->V7:
- remove aarch64 dependencies from xilinx-embeddedsw and xilinx-prebuilt
  packages
- improve commit message
---
 boot/Config.in                   | 11 +++++++++++
 boot/xilinx-embeddedsw/Config.in |  2 --
 boot/xilinx-prebuilt/Config.in   |  1 -
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/boot/Config.in b/boot/Config.in
index f167346cdf..08a6c8353d 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -1,3 +1,11 @@
+config BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
+	bool
+	default y
+	# All Xilinx SoCs using this package are aarch64 only
+	depends on BR2_aarch64
+	# only CPUs with corresponding firmwares:
+	depends on BR2_cortex_a53 || BR2_cortex_a72
+
 menu "Bootloaders"
 
 source "boot/afboot-stm32/Config.in"
@@ -19,7 +27,10 @@ source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
+
+if BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
 source "boot/xilinx-embeddedsw/Config.in"
 source "boot/xilinx-prebuilt/Config.in"
+endif
 
 endmenu
diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 0dd6433608..5f115726e1 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,11 +1,9 @@
 comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
-	depends on BR2_aarch64
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 
 menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
 	bool "xilinx-embeddedsw"
-	depends on BR2_aarch64
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 	help
 	  Build boot firmware applications from source for Xilinx
diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index 836cd8b68a..a37bdba540 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_TARGET_XILINX_PREBUILT
 	bool "xilinx-prebuilt"
-	depends on BR2_aarch64
 	help
 	  Pre-built firmware files for Xilinx boards.
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
