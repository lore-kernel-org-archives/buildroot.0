Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F56C3601E
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 15:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7048081E08;
	Mon,  7 Apr 2025 15:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVrSu2IzFs7F; Mon,  7 Apr 2025 15:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B41281E18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B41281E18;
	Mon,  7 Apr 2025 15:29:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 302C71F1
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 15:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FE8981E0A
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 15:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxlNavL6ALYu for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 15:29:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2406::62f;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0FFEF81E17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FFEF81E17
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FFEF81E17
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 15:29:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i15KcUsmDJNKyYGOmkQJoH8XZ4XYBYjH4vRX/vZRjLeB2Dk9ihxp7ERR6gRwsrvaQf/MqVvI0aodOgw2YxQFSbhlqGoNCZwcvwjuET65vOEUmgXy9mewNPjexW4IlEf8bsKda803jTTy+unP8RfUlP16GJ+o/0Xl1RZq1IxO5Gcyc6IHu5z7UPOk+3u7TwTsanwM5hnxeiL+1Q26vscfbdxOO11Dh/6m7ZqyB7WHVmq/ALK/L9N8t1knfDFwizKG4/jFEBay6qlSu+unczaovY6E6MuFi8eOUh/f0+BxZmdi3Cxz9HG9l5PUJOo1Cq+z9rxAepQ6Bx85zf5mLptstA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQtM6K+nE5+i5n1AKipe/1N4Webua2jBEBZJyau2FT8=;
 b=GUqTnp3Shci4c6dF5Zl57wi8GbXIlZnrN0LkmNWoGZYQLKoklzPkvXxWhBkIe0Yn1RmRydOVIpZXoe1g3++IN7hzwBtrpu3YxO1KLBXSEWGNFJFdusGxHmbk8v6O0NRLf6lEE4gLkUzUyRkx7X/y8YwRCfFBQzyZF/oL5hWRIxTU7S5Ql4jdxZVlDJo8vpUWjNTkDmRzk1bJhk2+QWln1pmw9BdUIQVDxIApEAX5yfclv9JRLBWZHufVY7mQoWn0BBw847DDs4WDmfRpr/f1xYzkIR/WDyvJ0csAfOo+gf4re+nMWF0Fd5skbKmMDbSS11BY3FxNzo1QNjh+aJbIfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR13CA0020.namprd13.prod.outlook.com (2603:10b6:a03:2c0::25)
 by PH0PR12MB7840.namprd12.prod.outlook.com (2603:10b6:510:28a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 15:29:21 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::38) by SJ0PR13CA0020.outlook.office365.com
 (2603:10b6:a03:2c0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.10 via Frontend Transport; Mon,
 7 Apr 2025 15:29:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 15:29:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 10:29:19 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Apr 2025 10:29:18 -0500
To: <buildroot@buildroot.org>
Date: Mon, 7 Apr 2025 16:29:11 +0100
Message-ID: <20250407152911.3790939-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407152911.3790939-1-neal.frager@amd.com>
References: <20250407152911.3790939-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|PH0PR12MB7840:EE_
X-MS-Office365-Filtering-Correlation-Id: d59b634a-a5aa-4598-ade5-08dd75e8f7d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xksBdB58qvtg0vV2ntFDGFJKkhNZCWJ5j+OlN+aYI5PcXFJbax+FIzUScYv5?=
 =?us-ascii?Q?0sOtuaTbDSkitzQeKrwLwYMf5J3V7N4WUCi6VsZnIyY6aof67Gkxu0pc1rh3?=
 =?us-ascii?Q?e29gVNPcSuvfhtIKKMoATEvQHxFXpDySBuSbN1jeiqeVRKDF1sol1Gm1wF+9?=
 =?us-ascii?Q?UaywRwXmR317s4GAvq9+53JMpG0cxXf5RD+pqcZuk0qQaev45hsLHWyNEPnv?=
 =?us-ascii?Q?3d0sxQLcMe91gXxrnoLfHNZcUe50+dcpJO63vEDgIf670x+UqOk8z1PdjqEX?=
 =?us-ascii?Q?LJMYUd5Q4jv1MZg4YwU+5lMiW5jgDGDFAGZe2pyPZ3HfWSXfp1kanBp3kGJE?=
 =?us-ascii?Q?Zj+oHgXKNqYxqVKqUI51OCyD7hKr8SQzJrdfKfDMGYPMHNf/gGePu+lVvhJH?=
 =?us-ascii?Q?rdVliO8GJKcyRfs0doCw8bK8lZhW3CZ4E24R/dUrOy4uhZogEaumjbtQAxJT?=
 =?us-ascii?Q?3yOEJY3bGJdFuZIRMR/svOHuqFHCLZwx7SugJZnVcbMUnu2F540m+CmT+KnN?=
 =?us-ascii?Q?d+pBA1rGEzZmdqUHeHenWzUPfRW1Zz9ZJks3ek9qCsAxCq1z7Az4nmD9nz3q?=
 =?us-ascii?Q?9Xkk4dkQsKy9n1yU9YS4DM3Q9dxeEyR760W8Y/QnxXQ4RMZAtOS+unK/Kypk?=
 =?us-ascii?Q?if9KiR15G8S71F+YVACwJpp5ePT0b8UJ/U+u08nslxNaz/AgxTFvi5QM0iIN?=
 =?us-ascii?Q?NXHF39VmfwvnGN+ZIXaQeNSO321MYpG0dfIt9pqW+KTpPOIyrK9dIMHCd3O8?=
 =?us-ascii?Q?auZUG50lmaCzbZlgxPF8EqmQRCIThYviz273GkFLpdcSjrzGO/erFUnSN+jB?=
 =?us-ascii?Q?6mFtkr9amnD+uqSan1Jq6wBWnupYAhgKNfeaW2/zxjF6TzwnQkGZ9ZgudA9d?=
 =?us-ascii?Q?1o+hrlpV2sFpSQPDGjgWqxu94xBZkewAxC3geN7/AjqDpJ6GCdIOxo3MZoMj?=
 =?us-ascii?Q?ANoOgnLQDVRDhvi52rO0VxSrU4fVO9a8/0tnYCbd38gngLDTp8eFAdtyQAW8?=
 =?us-ascii?Q?04sH0Cj/xy9CRjwr4lLW4ulpgNjXAxU0OTewYZ2s8gD9pINagzAYpeP/hwx2?=
 =?us-ascii?Q?wDNW1Gl37AvUPlQKYS+D9JvHKc+7+NIdtaR2zBA6qtbdyMGIRptzMUB4RKDm?=
 =?us-ascii?Q?7D6E4iDXCqcoTFdMS74nWdN+UeFN0GFmKSfFxU3Uf1jG8v7OO7TrfCeN6I5s?=
 =?us-ascii?Q?bjrh+6lvJEU//zVGibyQjqb8eNKvYhKVxtPWhrAt10EYKTTS3jxOA/oyeSVI?=
 =?us-ascii?Q?Jq9os9atmavqhW4GFwxNWd7D/LcUT/iin9lhuP+5ariCAEQFqEPqihDhDg1A?=
 =?us-ascii?Q?IJPHcyXIqxTJY/OaqgJ4yyVUQiqb/c33KdFZOn3nOHyObz/qn9UhKxHyWMkD?=
 =?us-ascii?Q?XENlTPZXD9Fk1swl5kR+KNw6Sj73KeDrDahNvy8WEQFrpy4otRuL4ZNWnUAQ?=
 =?us-ascii?Q?ZZgThuz56SD/Qnmop6tsExwN0NfxaANtMlXU5iCGpJNT1GUVQyb9H1ve+9hn?=
 =?us-ascii?Q?NofOyRvhWwdb55S0gmX3YmzoYpEgTyngqB2h?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 15:29:20.5492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d59b634a-a5aa-4598-ade5-08dd75e8f7d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7840
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQtM6K+nE5+i5n1AKipe/1N4Webua2jBEBZJyau2FT8=;
 b=zksfnTew42L1/oNTqOEP1nXfxnLYKCsYTKMZwemzpHNC5eenJ+fnAOiYyOq40SehiftIxlw2oEhfTW6B+P4149dnGjAsmGVgq0K8pbqlHk34YOdjpP/r26/9yH2lgGJfxWPMyYjRBP1c3rn5y0VVAcKeE3DFu+od97boZE7LmQU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zksfnTew
Subject: [Buildroot] [PATCH v2 3/3] boot/xilinx-prebuilt: install pld.pdi to
 target
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
 Neal Frager <neal.frager@amd.com>, fabio.caccamo@amd.com,
 romain.naour@smile.fr, michal.simek@amd.com, arnout@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the Versal Segmented Configuration, it is possible to load a PL bitstream
at run-time using the Linux fpgautil application.  Whenever Segmented
Configuration is used, both the boot.pdi and pld.pdi files will be available
to Buildroot.  For this reason, this patch improves the user experience by
installing the pld.pdi file to the target file system for run-time loading
whenever Versal Segemented Configuration is used.

Please note that the fpgautil application is required for loading the pld.pdi
file.  The source code for this application can be found below.  Users are
required to build it and include it in the target file system for loading the
pld.pdi file and thus programming the FPGA.

https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- new to patch series
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 28 ++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index e6817f4bd7..212247d331 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -19,7 +19,7 @@ XILINX_PREBUILT_LICENSE = MIT
 XILINX_PREBUILT_LICENSE_FILES = LICENSE
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
-XILINX_PREBUILT_INSTALL_TARGET = NO
+XILINX_PREBUILT_INSTALL_TARGET = YES
 XILINX_PREBUILT_INSTALL_IMAGES = YES
 
 XILINX_PREBUILT_FAMILY = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_FAMILY))
@@ -48,6 +48,17 @@ define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
 			$(BINARIES_DIR)/boot.pdi
 	)
 endef
+
+# Install pld.pdi in target file system for run-time loading when using
+# Segmented Configuration.
+define XILINX_PREBUILT_INSTALL_VERSAL_XSA_PLD_PDI
+	$(if $(wildcard $(@D)/*boot*.pdi),
+		mkdir -p $(TARGET_DIR)/lib/firmware && \
+		$(INSTALL) -D -m 0755 $(@D)/*pld*.pdi \
+			$(TARGET_DIR)/lib/firmware
+	)
+endef
+
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
@@ -63,6 +74,16 @@ define XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI
 			$(BINARIES_DIR)/boot.pdi
 	)
 endef
+
+# Install pld.pdi in target file system for run-time loading when using
+# Segmented Configuration.
+define XILINX_PREBUILT_INSTALL_VERSAL_PLD_PDI
+	$(if $(wildcard $(XILINX_PREBUILT_BOARD_DIR)/*boot*.pdi),
+		mkdir -p $(TARGET_DIR)/lib/firmware && \
+		$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/*pld*.pdi \
+			$(TARGET_DIR)/lib/firmware
+	)
+endef
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
@@ -96,4 +117,9 @@ define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
 	$(XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW)
 endef
 
+define XILINX_PREBUILT_INSTALL_TARGET_CMDS
+	$(XILINX_PREBUILT_INSTALL_VERSAL_PLD_PDI)
+	$(XILINX_PREBUILT_INSTALL_VERSAL_XSA_PLD_PDI)
+endef
+
 $(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
