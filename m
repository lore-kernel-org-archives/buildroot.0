Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3ED3CCFA1A
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 10:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EE0540A64;
	Wed, 12 Nov 2025 10:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWwsgpbLt-8Z; Wed, 12 Nov 2025 10:34:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42B7C40A52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42B7C40A52;
	Wed, 12 Nov 2025 10:34:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42D15FA
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 10:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 317DA60D95
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 10:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ez-Km5KAA5Z4 for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 10:34:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::1;
 helo=ch1pr05cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A106608E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A106608E2
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A106608E2
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 10:34:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHvlmpkCX0SEeBFvKCtBMHfB8ykgIhRgL4mSW/705hE8FkffYbc3n81aB+Ai12TtzuMQzpXc5Cq30gVoPP6Q7oI72qGGH9QcankAUsx9Nm879chRua28YZq11ipC+7Yd1b6pe3dcfNTrTnlvz7ct5ijvaLdodljP7gjdC2ALTtEOpHndpVtTrI9WpgLlyOHfTwfdg3I/71eox2kKUbgzuaBdO6gEndVvvynnQJBUx7dmwyXsS+u7LcAAwPZ2/qyQg9BFHFjSubeJwZ6pP6ITwladlw0/uf5PADTgMplnYoewTq/F9rxLCmeHheP8HTf9E57V6jD24opQAGxZe64r8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ch6bbfKapyMUWO7u/Z3e8OyVMsVH+duqya5iEFnkVpI=;
 b=uX2sLRpSoIKy9gTlj5FXo86SWLKU4CaZB/xohRUwSjvs2ghZm+IixBzdziVwMyNvH6pmOGD984/d+gYuhIU9pRN7X+da7jPcYL/e/kiEx0JaK5JE1pFml6P2Oyf8DDhXMVMHCIvDf6m4G94nYIkZe9QFmTaMSePBZGLDTavDOWzmU+O1F/qXg5jamy8Cje75xBGvl+190xsckMyApf8vL6KkxE/rrMkDN56Xq6ou8WvxJQ9aNp9Zdt8hzghtN7xLDsGxLVR9cW97nxnaJ5cl3svzzoP5isKdQytjPpAmYRdJVSZ6SrR+EzOFqNVDVsIqtvDiI0FN/Yg8ls/OV6X9IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR05CA0051.namprd05.prod.outlook.com (2603:10b6:610:38::28)
 by DS0PR12MB999106.namprd12.prod.outlook.com (2603:10b6:8:301::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 12 Nov
 2025 10:34:05 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::8e) by CH2PR05CA0051.outlook.office365.com
 (2603:10b6:610:38::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Wed,
 12 Nov 2025 10:34:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 10:34:03 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 02:34:02 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 12 Nov 2025 02:34:00 -0800
To: <buildroot@buildroot.org>
Date: Wed, 12 Nov 2025 10:33:53 +0000
Message-ID: <20251112103353.2021040-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|DS0PR12MB999106:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d83f712-8a80-4089-266d-08de21d70052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|7416014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lqccJAtMT+Lo720V+M8bg5CLRwm01FW9w90kxiAl7ZLcJQIsT5O8laFuoA8+?=
 =?us-ascii?Q?7xs20rpNYQ24FMDEaKh7tjojvJVqtu1NKMO1YE/SD09QrQTvMMyxm7DOQuLl?=
 =?us-ascii?Q?CqrD8FYFXCWEyyLB0qDrBZXT0WPLpQw2dplZTM6m43tRQocSWyO/t4tgNjHr?=
 =?us-ascii?Q?R4O4EsmMD0LRRq1jDLw1nZKQ3L6/KPzrHkHr80yWPiEt20uehfBrJA90elef?=
 =?us-ascii?Q?YpxcFLGwtty41dYHMrIeRl80DGchQ/ELM0190eaxTKvvehSx8qX/CtbY4lCd?=
 =?us-ascii?Q?ZZjFSRu1y0FGxWtz0YPAhieACI/aad46ZCFZAsKtWUBfkdgZkZrBUrKwq+Ej?=
 =?us-ascii?Q?7N7pEb1gC9qtVYcCLGzkWhdGw1d8/auPofWZAzp1Byq+yPVH95NRQncs9dJ2?=
 =?us-ascii?Q?4jtSwg51yfdoeFI1t2TYOcDlv5l5Qru6AiXni9cC/31aOvyA54oQ31AV2ZH7?=
 =?us-ascii?Q?Ah5RZNIClCHa+UP4/0twVZIb3934BHoKPapLqEZJCoA7PKfafmz/7RQc+Lcc?=
 =?us-ascii?Q?7n1Q/iHNX+SKLtBBBN8EaO0L8yPAI6du4Eq0dYfCVkInkVYmu1zAS6FaOOkU?=
 =?us-ascii?Q?ac8oo7cIWJ8me7sKcU0bpXJnzCK9aoOssD6ViosLczMhNoAo6lkJzMwmaWI2?=
 =?us-ascii?Q?BElXUVR7/ExNJs0Nw4yVlHRg1HvSIXrYAVWQiEomQEi6BXv6LejkzCegC6y8?=
 =?us-ascii?Q?j4VTFrOQbQJcnDlhfk0bTKrqWfK4rXSN807c45OqJtRRnVBStS6MmJGoVfp7?=
 =?us-ascii?Q?yTLO35FLwVQ/ryPTEccJgxUdR1YM0v7q3puzG4bsJZjXMV6geAnmrIFYvMMf?=
 =?us-ascii?Q?kSAT1rt6K1jlKQ5EniL8ZmycQECi53Gm9DxvH6r6Nzx/wY26fitbSDW8KCG3?=
 =?us-ascii?Q?ZI4XdI9+7slIAACRH+mO6on3EwfAQwFWYlNWhkBD3/qGtsv72EX44lwHhCpy?=
 =?us-ascii?Q?qceZy+S9LV02ihFtNUsRzw33DCNTtJFXZ6czd2oErFvA6JjMh87XuDYQnZYK?=
 =?us-ascii?Q?l+34S3CJs/7SHARWuBFIvLxoQehHPHVjAbfK4uuaRtAsQx1efTtUdk56088g?=
 =?us-ascii?Q?i2tUmnY8VAyjX6z6EioeaRMwc2A8xj3cEjpyi/qmppyNCeECSoLPoyMH1lBE?=
 =?us-ascii?Q?4I4wwAbK4BDJERrM+7L0tTB6dE+oS2bqOSQLIT7Rzu8Q8UgDzGr7HOt4pZnJ?=
 =?us-ascii?Q?zZrn6Im+YLTqN+5Px3TiBgz70dGvbFhOac+RfkcIXSjiEO1cC88gkQZdMhSV?=
 =?us-ascii?Q?mD3+5eBZzRTwEAEAEsFdaKtjQuXg6m9nOMglYAS8PyoSGrd/pnf2VFHJ9ZXx?=
 =?us-ascii?Q?fZUHizoRfFDbIvCJIe4yQtx2kgIdagCOBvRQAZJnHWUhrorbABhtldRDs4yq?=
 =?us-ascii?Q?u+j2fmSdMlkaXszkRPHES5ih6mn8RwdeKBwiY0dvWceU4dtLGj7UwmLOpEoz?=
 =?us-ascii?Q?42OxwzXCYud+nDz/NoWmBn8yRUTAt9deg/icEA/N/D47LCW8sxOd46MHYjj1?=
 =?us-ascii?Q?bZgpVLBVfQ9RJMiJSZ+23vlyL0lrE1gfapDuAIZz/5n4SqjfF44U9AXg6D0i?=
 =?us-ascii?Q?u+cnfH9NLUZF8XKTssvbk3drcyQkF6bZiYbXG6Ww?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 10:34:03.9513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d83f712-8a80-4089-266d-08de21d70052
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999106
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ch6bbfKapyMUWO7u/Z3e8OyVMsVH+duqya5iEFnkVpI=;
 b=AqACHKk5vEomBESU+xnFDN5TbUtow8IEg+iMj8j8P9YBlnndzN+E4Z6lIbDTfMFpqRepSiCDNSpX0Wh9z+oxgypASRalyQyHzz7RrvrcdufJLvPmbkiSa5XLskplNXtNs94+DpzXU3yyUdFpTveEjhkBSjemcO5icoDQiaQxXBE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=AqACHKk5
Subject: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt: add support for
 kria-common
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
 yann.morin@orange.com, brandon.maier@collins.com, manikanta.sreeram@amd.com,
 ju.o@free.fr, Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the next release tag of xilinx-prebuilt version xilinx_v2025.2, the kria
pmufw.elf images will be merged into a single directory called 'kria-common'.

To keep backwards compatibility, this update checks to see if the old
<board-name>-kria path exists, and will copy the pmufw.elf from either the old
path or the new path accordingly.  This way, users can still use any version
of xilinx-prebuilt, and the package will still install the correct pmufw.elf.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 95b656cdde..665e021e0f 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -105,14 +105,27 @@ endef
 endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
 
-ifeq ($(BR2_TARGET_XILINX_PREBUILT_KRIA)$(BR2_TARGET_XILINX_PREBUILT_ZYNQMP),y)
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_ZYNQMP),y)
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
 define XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf \
 		$(BINARIES_DIR)/pmufw.elf
 endef
 endif # !BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
-endif # BR2_TARGET_XILINX_PREBUILT_KRIA | BR2_TARGET_XILINX_PREBUILT_ZYNQMP
+endif # BR2_TARGET_XILINX_PREBUILT_ZYNQMP
+
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_KRIA),y)
+ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
+define XILINX_PREBUILT_INSTALL_KRIA_PMUFW
+	$(INSTALL) -D -m 0755 \
+		$(if $(wildcard $(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf), \
+			$(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf, \
+			$(@D)/kria-common/pmufw.elf \
+		) \
+		$(BINARIES_DIR)/pmufw.elf
+endef
+endif # !BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
+endif # BR2_TARGET_XILINX_PREBUILT_KRIA
 
 define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
 	$(XILINX_PREBUILT_INSTALL_VERSAL_PLM)
@@ -120,6 +133,7 @@ define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
 	$(XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI)
 	$(XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI)
 	$(XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW)
+	$(XILINX_PREBUILT_INSTALL_KRIA_PMUFW)
 endef
 
 define XILINX_PREBUILT_INSTALL_TARGET_CMDS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
