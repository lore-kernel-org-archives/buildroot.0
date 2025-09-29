Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C08CAC5B0
	for <buildroot@archiver.kernel.org>; Mon, 29 Sep 2025 07:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1710760A63;
	Mon, 29 Sep 2025 07:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iR08fljfh-sU; Mon, 29 Sep 2025 07:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6EEF60A6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6EEF60A6C;
	Mon, 29 Sep 2025 07:01:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F786194
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 07:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51EC160A61
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 07:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0XfR2zOdE86 for <buildroot@buildroot.org>;
 Mon, 29 Sep 2025 07:01:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::9;
 helo=dm5pr21cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2F84660A5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F84660A5A
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F84660A5A
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 07:01:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTSM7v3+/suXOq271CRD+ubd0tNHMsrwaq/r6L+58iZW+HBvsP+Eup6LyG+F31Dnd8nAtfClWMlB5Vc13p8BmcZxIMXL8d5XEPG4yIIcF7l8s7m6fo7+HFPkxLXRPGYtOASqKf0AArWv2Zwq2d1ExKbE8opLhkI1IE4Uy6N5S6VSzsAi4r1HYFmpbEXlipxG0OF4n3+KZQqbgVrpb+w31w5CqlNqwtlbIjSy/KLAEuINXnglU/pt8VlTtEmeTmnFor02xRalzXwqU/4WCFXGm41He40TvGhWXInwptSkn3oC8EVxwtgVT6IPLfc+UCAGCZTVj5SwzE6wZlv/jZbNcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pD7DXZEu2HEVi/GnD6Rny2vLocgbdWjT9OExyahY0to=;
 b=OEwuhdICfaExAIwXWN+aJ9dzd7wdNr8OUTp0GPlSRPCEiL6deRdrEUQinTtWBN1xyjhf511rWEWbe3UWQzRlYlzbf3Vzperyj10wyx+3+9sj21N4gx3tblaOuTwCP6DFaPmBF8oeesE+TcbFZaFsuBvFGPwFSenTdwrgQz/FZJERZdLp7OHwQCxCJQFw+DGGJzzYIio63eT6oIcWS2CQiw8V0iEc8uzyrqqeb8tzrXB0hp4yq6xcttoNCTK+z5i4dlRMemGZo/kcrUnn/Cq45TIClVTFayx38yZyl8msZ9h4NOLPNaXTS55+OpTtO0OK4vsM+q8QjRmCmSr8RRVK2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BL1P223CA0044.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::17)
 by MN2PR12MB4454.namprd12.prod.outlook.com (2603:10b6:208:26c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 07:00:58 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:5b6:cafe::36) by BL1P223CA0044.outlook.office365.com
 (2603:10b6:208:5b6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Mon,
 29 Sep 2025 07:00:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Mon, 29 Sep 2025 07:00:58 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 29 Sep
 2025 00:00:58 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 29 Sep
 2025 00:00:57 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 29 Sep 2025 00:00:56 -0700
To: <buildroot@buildroot.org>
Date: Mon, 29 Sep 2025 08:00:52 +0100
Message-ID: <20250929070052.132796-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|MN2PR12MB4454:EE_
X-MS-Office365-Filtering-Correlation-Id: f8bfc18a-4420-48d7-e0ad-08ddff25f13f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eSKV3bSGIlWYtJFRAO2Qp9h/h0X1aGK8SO8e+5R9BsKqCX2ZMzerXbA5v1E9?=
 =?us-ascii?Q?1O30mJdNmAbZvc6Ocah6m3uVZOf2pSds9MiL/+xVbvRwNpE/DZgjTYV+gAw1?=
 =?us-ascii?Q?4SAkD8aryTSkb3qD3M2DAhIfpostAiJ+zl2IR6prklk3yQ/bm/thzS+mg+Hg?=
 =?us-ascii?Q?H+iN2lw0A6sO0nYx0grRp46jUc0NtayslxGiVCvBDEab9SXGAWLmVhJZWYxF?=
 =?us-ascii?Q?6asIfVpS9is+p6KlytMlTO9el85DpsBqWn2Q9cCyp/MtFuDiTp2N5SUgayi+?=
 =?us-ascii?Q?3H3Mw0u3lwA2urDootK3jssoi62ovTFOkrtGbUyl644gvfLDVrjijGcZ8NT9?=
 =?us-ascii?Q?tTsGyk6aepZ/B2LfonTUiYQykIwcijakfs7weZIVUiBM633DfVrhBC6bj4TQ?=
 =?us-ascii?Q?2XDNSUfQtK/RneWbBkASoaIJLXcjbeg5ohn44MliyBT9+1Dsc+mBca3wlZdv?=
 =?us-ascii?Q?YVBB9f/oh34ouJIW9g60mixVBhV0FgNNDywfOrqJ0IWGThFGe7NJ12lk5R0X?=
 =?us-ascii?Q?zOYH7nKjmpC316VfF3WzyY3WFlLxnwE0QsCyWw5LQ7nF1wLudZSeestG3Kb1?=
 =?us-ascii?Q?NlDsX9Y1o4vryOhcX8O9gmQ7hhlOHCH9XnUJxNwszQlVRZtbkl5lIuAU+VVM?=
 =?us-ascii?Q?bLz2ZJyd42ng1wO40mmtDlL3OgSXA5OilzKQuoLXJ1d7DJxM3dzui39R6b7x?=
 =?us-ascii?Q?GEvjPYcKKh/1ZayO5gHMK7XjVTqteNsz7jxDQCaVrPI2e4fKh2SeHRaK9Zgz?=
 =?us-ascii?Q?kMQDYNNyGcQ65AfOsUWhw47ExSDgLDT+y6XYnOQ3N2Hc4OfNzZqItO1QmW1F?=
 =?us-ascii?Q?Co4aaXgz+TEp6e8J0Z9mhMyx+hHX2yVOOttNyQKEnafD6dn2O9rJcIZduUvV?=
 =?us-ascii?Q?PwXlA+3yWAJ0QzwRfg3D1cjKN6ckG4Fv3pGyEPawA8ZT4ctTHOtmHFOA1ZPT?=
 =?us-ascii?Q?tBOo6eXteXzdo1+9UXP/Ir5IAwlDCeBMsqatxGAvgFiw9OorXxYe3wQyI7Q7?=
 =?us-ascii?Q?OyviHzHMqlyGBWj9jdNHhFyGqFad5PTCMQfEunWP9npcQzMrTiIzO75FTi5B?=
 =?us-ascii?Q?xy9KRkg9xNBZYf+ipNLCdrWd/hHmoPyQrJXoPUZ07QeGqqk2ja842e+YV33A?=
 =?us-ascii?Q?hw2YpG6cnOg7MH+M5L12Ej+uawzS1cCKj1sq6FkykFmp6yBLWKa27t6kcupn?=
 =?us-ascii?Q?+CejmHT38A3qpXXzlrDfS6zy50QvblrzBWf/vwy186qBmUnbSYx0T9cZ67Zq?=
 =?us-ascii?Q?vOwHQ6hUMndGVitCoUHONNRqOVhnjhDRDOqLbpsqDps4qzgcg73pk8OpODlm?=
 =?us-ascii?Q?DmpjIcpGVfRWdLgRN78Gkym9DlxgNqTD+EKt0sFlyFo6dlHVweFK5X+bE2x2?=
 =?us-ascii?Q?cZWfTnWhYbzyW1lNcCs+N+OU40Zd9e/33YuQEN9bzSFtcFH7vAy91d+hycEL?=
 =?us-ascii?Q?tbIqemu8oK9a+IV3Wvbmtjg2cv6d3dRpd42xYBXnhiOHemvKb2kWrWg2NwR7?=
 =?us-ascii?Q?Nykh6GFnWcdLN6SCXLkwFc11WRmiahRFr4ItSQwxWyfFXW/IlT4iYrV6d/f1?=
 =?us-ascii?Q?kjE9Zl4PzbwRykzsMMPIV+SCiGwlFEucgZ2DGIf3?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 07:00:58.2414 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8bfc18a-4420-48d7-e0ad-08ddff25f13f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4454
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pD7DXZEu2HEVi/GnD6Rny2vLocgbdWjT9OExyahY0to=;
 b=hAnhAFbkPwYefXGuRzaIhMZhq1mAD/qkx/Egc+nAtqHxzX5INVIgsALRduF2XYf50tMdhD6MOoDvrxXjKE2UQ1c4EMthfJURCemb0hqCCN+w9Czf+ct8JKfNEaJ6oiFM2evZkhQSCwvHi+i2odshwcivzvArP0HpDL8SjYlZusI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hAnhAFbk
Subject: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt: simplify family
 logic
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

Currently, the xilinx-prebuilt package uses an if-then-else statement for
deciding which files need to be installed from the xilinx-prebuilt repo. This
works fine for now because there are really only two options, either versal or
zynqmp/kria.

Starting with the xilinx_v2025.2 release, the versal2 family along with the
vek385 board will be added to Buildroot and thus the xilinx-prebuilt package
as well. In the future, additional families will also probably be added to
this package.

To avoid creating a long if-then-else-then-else statement which will only grow
in complexity over time, simplify the logic of the xilinx-prebuilt package by
giving each xilinx family its own if statement. In the long term, this will
make the xilinx-prebuilt package easier to understand and maintain.

For this reason, this patch moves the zynqmp/kria families from the "else"
statement to having their own if statement.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 5d984c4f82..54f31f7ddb 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -103,21 +103,32 @@ define XILINX_PREBUILT_INSTALL_VERSAL_PSMFW
 		$(BINARIES_DIR)/psmfw.elf
 endef
 endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
+endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
+
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_KRIA),y)
+ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
+define XILINX_PREBUILT_INSTALL_KRIA_PMUFW
+	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf \
+		$(BINARIES_DIR)/pmufw.elf
+endef
+endif # !BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
+endif # BR2_TARGET_XILINX_PREBUILT_KRIA
 
-else # BR2_TARGET_XILINX_PREBUILT_VERSAL
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_ZYNQMP),y)
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
 define XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf \
 		$(BINARIES_DIR)/pmufw.elf
 endef
 endif # !BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
-endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
+endif # BR2_TARGET_XILINX_PREBUILT_ZYNQMP
 
 define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
 	$(XILINX_PREBUILT_INSTALL_VERSAL_PLM)
 	$(XILINX_PREBUILT_INSTALL_VERSAL_PSMFW)
 	$(XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI)
 	$(XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI)
+	$(XILINX_PREBUILT_INSTALL_KRIA_PMUFW)
 	$(XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW)
 endef
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
