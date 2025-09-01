Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22198CA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 08:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C94DE40B76;
	Mon,  1 Sep 2025 08:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6HLHb2Lx_w6g; Mon,  1 Sep 2025 08:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB7B240A70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB7B240A70;
	Mon,  1 Sep 2025 08:37:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06D8C169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03E4E40A70
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKkij0sSakN8 for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 08:36:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::614;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CED940918
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CED940918
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::614])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CED940918
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:36:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZAm7/1JhYG96dLFjd/5UeTbSRQdvTTo53TBaQbzt5hic8klgRI2rBL1gyKqU2CzFLB2eXnVi+LglnwD5vXXJpvBHPIGX67WLgQmJU/hhqfqefQNOdhXyfkWJIzW9z8bjLxv1R7wzLFLWbM4nYM0zZHk+rrfQhBOWh0pB+nhd+n8UdwqRfwc6j+t5IIlKIQvXvak48rKZuyc55TwiEi/lJ1AIqDqfRNdUnjdA5ae8CQCsTg88Nht7LMiWqLly9GIMdPq+oSRquwGDcLCeWOhcRCeXIKOzfgQylPsSXZKPFH6r+kaejIMyBXLs5AiRhrtBEAOegztJH050TAhExM1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UumpDqKvfktVU2lOfRTPSinM2jrAmH8FasZKAfniNKw=;
 b=hQgbaAlLDbPPIBMwRifsMUgE+U1KnKWD8xLGYQ92VoLlbh5B7RhpOBjBhpG9kofKY8BrcUOM88rxpTVJC+x6zi0Huzn8HJl4M/WFDf6Dlhw92HZDVIov4uwArikXda0WvjIsJD8YvuejVLyBeXBxWe01my+zir4iwxV0UYiFdMCjHY+k6ZePc7yIojWw6ydzqy46haCF3iB+yFM6DZMPaS31sgPmxcunHcXCnQUZhIBdfB4vtHexK0hiLrmSXWRfTjYjLNOhLejGQMulPSrkQcSsvks5rILzO01BiGZtNSwrsCjx4Be6P0+JNOfjYuanZxkuA6R/dGEwoNbG73TELw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN0PR02CA0057.namprd02.prod.outlook.com (2603:10b6:408:e5::32)
 by LV2PR12MB5774.namprd12.prod.outlook.com (2603:10b6:408:17a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.26; Mon, 1 Sep
 2025 08:36:53 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::c7) by BN0PR02CA0057.outlook.office365.com
 (2603:10b6:408:e5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.28 via Frontend Transport; Mon,
 1 Sep 2025 08:36:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 08:36:52 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 03:36:52 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 01:36:51 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Sep 2025 03:36:50 -0500
To: <buildroot@buildroot.org>
Date: Mon, 1 Sep 2025 09:36:45 +0100
Message-ID: <20250901083648.458639-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|LV2PR12MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ae6ab1-622c-42c7-7586-08dde932b38c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1L8mJ3gOiN2fYpXNet083YBW+ckdwny6liRGrGZZVMKy3CulWFAw882KEMLB?=
 =?us-ascii?Q?P3wfAUK7l1Sx/p2gtDj2yuJv6N7cup7ADJ3p7afDIVHkOslSWPqxt9KIQFLk?=
 =?us-ascii?Q?hY45MgOSkPngbshSUp8rircG1Qj+dWhwAWl8BANOIHOFe8YHv0n+XLzwF0m0?=
 =?us-ascii?Q?H1uuyfJBveHhuu58sYuMD72kWaliobJeFb7b6xoqXvKDlPuUYx3ZK3f7HJFh?=
 =?us-ascii?Q?SoW/OQlz4doHjcAxIUrEiiSTvsCziRFSpPGyADyqor2AFM0ypmSGWEJdWssg?=
 =?us-ascii?Q?inRDP+7yVq9TCip97h+QBCUfAADqm7KTB9/F+fxYAqhYNuvej3Wikt5acg0t?=
 =?us-ascii?Q?5Xe9mTOcIPTTPZsuU5F+G/33/lyG75Vchv+3mob/98F2VcQHqoT7U8ch4f2b?=
 =?us-ascii?Q?mqNPq91c6U6y3bWhPwVMpGTNHPfeSWIT7rYvsCUvY3A6ti97oYl9hITt2Xuw?=
 =?us-ascii?Q?mwztzT1UHIAmzHn9JNUVbcjRPcY/jQNxh8ljtGRSwL16mLIH32uphBlQ3BvW?=
 =?us-ascii?Q?wZaPhrfN9RWpSczSPRU9PuFO87xX2MU55jyRZSuDJGm9Y2dINulzA8/Hf51f?=
 =?us-ascii?Q?dMFzFyIP1GgmABXpVxHUtePz94Y4SDfj6loaqOKxDcqWUVo1vf+I7bHo/UQr?=
 =?us-ascii?Q?JOCGi7sGeYRdkDq7dIKN0cHS2vX7dGMNKNXhLtuJIQLdXDdjIcwPWqGTneql?=
 =?us-ascii?Q?35PfF5KJKlAJavIWk/W3shvnsYfFJ5Ggu1qgIJnq7axf5mwWMrxdnxttga02?=
 =?us-ascii?Q?vWCs3WPPu1G5eQtGwwMAaNad0uZxGOE0PhTklxY5XX0RD6u+Fn59jGwFbCUm?=
 =?us-ascii?Q?GCZ3fKo3lXwYAeZw9pzBeJQWGob0fJSqbN6HxVbOxnsHuQpic90pj3mar/QP?=
 =?us-ascii?Q?bmG4TYd4HDLhWzQSmB7f+2rKACjM35+uTu4REDaunMpz+f5uOcttknAup1Ul?=
 =?us-ascii?Q?jg6V1x+akAOCokXmzip1lyhKc9VbA1Cn1WP6u0vkTYaES1jBcvUI2X88/YFa?=
 =?us-ascii?Q?uMinn8NH/cn9ubFq/ck9ooVd6rBTqLz9D8XXiuG+cqOGdbWFXWp+cHmSwOHu?=
 =?us-ascii?Q?GJsepAuNovmQXjj1wHQ6YV3eB8ADO6nLJMZEEeWvcwIAB6PXflpXOYSAVFmw?=
 =?us-ascii?Q?rU6i4eP1ncPLXkoy4fOn6IB/mmPM4ovCJR2bh4nSeoDT0+hlVfHv/CRBfuig?=
 =?us-ascii?Q?2nZmh8aj3zyLNw69OHM8oOknN9wkfYDQz7lQKztfM7jIs3Lj7Ho07p9pvmd1?=
 =?us-ascii?Q?qy57BxyFWLtrG/fD+3faPfW38NiebHylrfFO3Ic6jj1dOD+9uZ80EU9OQP+P?=
 =?us-ascii?Q?oKp1sn1Q2NODBsK1rVbduSvpyNLbK5/pVhNaUoLw3UMDOi4l+UtnFfM7OKfL?=
 =?us-ascii?Q?hQ61WP8p9xPLwmbiXtteXxR8BTzzvTxs1Ajn9UHLdncWrKAYR5oTqtna0P3Z?=
 =?us-ascii?Q?VpvZWqSqKjMyS2vYAm/XyU0joT/ovLAyw1hBfjOrLSFz2duT0RqVDIajbO+R?=
 =?us-ascii?Q?3N6q88mDdvWBd2AXt2/E7GQ1+m8ofeEpvXt7kGDEBIHxajBbHL8LNnDQMkMK?=
 =?us-ascii?Q?MZlwdf0eqolZ4sT5SIk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 08:36:52.6003 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ae6ab1-622c-42c7-7586-08dde932b38c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5774
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UumpDqKvfktVU2lOfRTPSinM2jrAmH8FasZKAfniNKw=;
 b=wONeVG18k6LV4bqk9kpm5tgA0DHH8gxiDsnCsl9q6LkkLuRzLtSQo2KCmqvvBFDCGomvSTREFM6HpswMC7fG699GH1OKWTQ+WTgd5Id2Tbu3n6ywEiiBDsxvr/OFpnJ2aiyB8dfwYfMRf2lOn/YNo0qr8KdSzC2dJh9yV6fKs+Q=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wONeVG18
Subject: [Buildroot] [PATCH v3 1/4] boot/xilinx-prebuilt: add support for
 plmfw.elf filename
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

AMD / Xilinx has made the decision to change the name of plm.elf to plmfw.elf
in the prebuilt binaries repo starting with the next update.

This patch updates the xilinx-prebuilt package to support either the old
plm.elf filename or the new plmfw.elf filename.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- no changes
V2->V3:
- removed unnecessary comment about Ubuntu and Yocto from commit message
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 62b60b88fa..5d984c4f82 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -28,7 +28,8 @@ XILINX_PREBUILT_BOARD_DIR = $(@D)/$(XILINX_PREBUILT_BOARD)-$(XILINX_PREBUILT_FAM
 
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
-XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
+# Supports either plm.elf or plmfw.elf filenames
+XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm*.elf
 # Unlike the psmfw.elf file for Xilinx development boards,
 # AMD Vivado Design Suite currently generates a file named psm_fw.elf.
 # Future versions of AMD Vivado will generate a file named psmfw.elf,
@@ -60,7 +61,8 @@ define XILINX_PREBUILT_INSTALL_VERSAL_XSA_PLD_PDI
 endef
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
-XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
+# Supports either plm.elf or plmfw.elf filenames
+XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm*.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
 # We need the *.pdi glob, because the file has different names for the
 # different boards, and it has to be named boot.pdi when installed.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
