Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC69C27C4F
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 06:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E736E60855;
	Thu, 13 Jun 2024 06:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OufaRnYep6pR; Thu, 13 Jun 2024 06:15:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9F1D60B56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9F1D60B56;
	Thu, 13 Jun 2024 06:15:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 567C21BF35C
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 06:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 424DE408A8
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 06:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjjFJkfS7qNy for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 06:15:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::60f;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D8D6B4089E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8D6B4089E
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::60f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8D6B4089E
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 06:14:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7F1AuY3Z7JxBb7DGfzoafbrN/TeAG4re+Umrt2CCpawFxzIbTnNSXIfydAVEW0WghAXWy0Y5us0lloMD/5Z+5pspwy3c5xNN91iYkPZcDH8NICC4fgdUMii84Fpe+QiBmQWw3cNi+ta/bazF+jTHtxQ2tRhTVFs8LqPh/+Ltt2QftSc+lKTRivbgfKbeyvhE2CaF29ArscA/RHkWwJzq/F2/sPQbz56xXzLDrr0fzzbvzYJ9c95d7UfPMHZdTKs2iTYYESUpOxe5G1bqb1neLDozqeoPlEUizwLSfr4QOh0iaqhKDN7kbP1IdIIULSZT1S2KWMJxXOAbKXlXSCohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7hDqLg7c4OO7cQsY2C/sM5M3i+FqraldxZCp5EtC9M=;
 b=hC2+NBtQ6TwU2lddX7mKG9bBpYSjGvhMklb3FvE2UDiTTatZJ7SZf+xD3oHSwe5WV1l8BS0AvS0UsYIVMZ/KpO3k3RUKSP6pCXlSyqSepGqtWlvKfMsBDGWqiZY7HNNTo2BC+mQtrkw8RywAa5qxHQjht0xeFjSvJ5q0AKvZAm2BboIxhekMo+Z8nucZZCsMlunq0pZjmCI9mBNDOaUE172/SbfwsCzT/ODpjXEv0MkuRFxE0DApY2kdWIoa5g0ZqBaCJHVPBwGeDOlmvGZVOvCHw7/8S/8/qQ4zWyMrSHqQYddwuYS1s+xrOuYRLA7/oJjLUj788f106TfY5q7bkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DS7P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::32) by
 PH7PR12MB7892.namprd12.prod.outlook.com (2603:10b6:510:27e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21; Thu, 13 Jun
 2024 06:14:54 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::93) by DS7P222CA0026.outlook.office365.com
 (2603:10b6:8:2e::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25 via Frontend
 Transport; Thu, 13 Jun 2024 06:14:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 06:14:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Jun
 2024 01:14:52 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 13 Jun 2024 01:14:51 -0500
To: <buildroot@buildroot.org>
Date: Thu, 13 Jun 2024 07:14:20 +0100
Message-ID: <20240613061423.1737631-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613061423.1737631-1-neal.frager@amd.com>
References: <20240613061423.1737631-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|PH7PR12MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: 45f0f6a6-1869-45fe-71a4-08dc8b70245a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230034|376008|1800799018|82310400020|36860700007|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IeX5l19J110rAwLGw1770lXJvJkvKYkDdr0qXWRE/a7rcLVqxglR+llLp0N7?=
 =?us-ascii?Q?feis/lMPt9QeJHTVP0KdPdSsM8OZsYqsQG8rE8WE00qoV6pGZmOX3Nlr7vz8?=
 =?us-ascii?Q?3/xi2BWo0644I3yQqHl6nJaqa1FVcG1cyBVXOYYmWrpfkVhZLBnqe2BzIHAw?=
 =?us-ascii?Q?8rb/XWWu5YtkBPLOgEI7kfEwFNAY8HqqEJjz8r6qwBU2r4o5S/WlPtpRgB2s?=
 =?us-ascii?Q?LOVdDcGaBZ3Sql6YQp+9gzMD4kYNn+4Ei6Alw7mkzLDR4ScqDGgI6e2trbx0?=
 =?us-ascii?Q?vYj5U0kd3oUuTmXWEt1sMJRHuBL0con7q6JS2boVC7+kC1gvoKFlEzVmA0rV?=
 =?us-ascii?Q?R2Jvpf4Qnkk7b+90JNDnhUjbY0b5D5fYjp9NPOcnJtonhQlcsQifGy1lvdHc?=
 =?us-ascii?Q?UJWgrKr1QrWwq5jFJb8hDtHAJdkF2cP9zJr5ch699LDBbDsH4JC+2BUpjgMB?=
 =?us-ascii?Q?yruh+UThlXY6UqBSl6SwlGsXdrZrPSfdJTj+mmFvOlGyOw1OVqB58d+1GFeG?=
 =?us-ascii?Q?MUL23OxUPcrNDzbLQttbYNma7usmZGgIj1LhUCV9zaFeqd4lNgsUpozw0kCy?=
 =?us-ascii?Q?+Fm6FCDUiejwvZFz2d3KregIUfwM78bUH9vEyFuhyeAtMGPiswxPufQAdhXA?=
 =?us-ascii?Q?4pN0VJDsmch2QG+YRrYoBlSYC6uw3if7Bakd7YJ/9Pi4/cF9HtElnG5m663Z?=
 =?us-ascii?Q?wiVYtZD3phJSpDvIcs7XXmLDbAYhVpShI6N6Z2wnOFPJnF20N7bucDXg2i3s?=
 =?us-ascii?Q?d0BhFpEg9ypDUIovbpLuE2PlB3ro2E3LfiLf1VaeIgKV1ecbLReYSnsqMA9l?=
 =?us-ascii?Q?18Nc9gsTOIHblZloWwBsqJ+y0ErjzDGMWHesXMBWZ6tZKj87usmw0qOQOQ/D?=
 =?us-ascii?Q?FeMcMCcpcUh+ADIwDtQO+GuTK9X5GH7N+VwK5hEA9xx5xzN8D1QE8gKyfkB3?=
 =?us-ascii?Q?MTtgNb2LKLbWeuj8F8sCFrltFKnu4Hah+JMhMb569+Uq/fLMB7rc5qfYVBS6?=
 =?us-ascii?Q?Vm2nN4AZh1E8BIGO90j6N8qVCEtlQHSqNu23r8aluUOBP7VqwZ45cbrygRG+?=
 =?us-ascii?Q?9w96sPswXIbssM6f+huWzM+O/9isgfOOE5OZNZQwpU1ZUR1CSVTpGgoviQ51?=
 =?us-ascii?Q?pxw/KUvpAplhquG7euRtOIemNvO8Qz3G/BDgemEsh5fZRiucDm0QDK95RUX5?=
 =?us-ascii?Q?6UVq3tWK5QrJIZ9BymsqSL+88Ff/slKKmUmi8R9bbtqZe6nGNVjaR0pY0Ve6?=
 =?us-ascii?Q?/oNfpb+ooYZztuOwpe6EWEGet5kt5NAyUzD7BCE5edolGetgStcvFAGSJvQs?=
 =?us-ascii?Q?Mxg1AUUme5NDYY8p8rePwMqhGw47i/+/GGTjMLkfHe3Opz8+2N1OmOCV+h7x?=
 =?us-ascii?Q?qEFPNoR23jQGWO/CyPtG6B5CiX+iuFSgzSUqo/1IYlrKnRaRkI5a5y108qtF?=
 =?us-ascii?Q?hBfwsGJCFmIhsEKOgw2Q/km7SpqZiGPP?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(82310400020)(36860700007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 06:14:53.9616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f0f6a6-1869-45fe-71a4-08dc8b70245a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7892
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7hDqLg7c4OO7cQsY2C/sM5M3i+FqraldxZCp5EtC9M=;
 b=kYjGnWGd/wbmRhUs7GkMclB9wtWpCTPIX5JHyZEIZEyBgwEEuYqcoh77yPvKj132y3WkPYOwTcVuyyFWNKlEtu+i6GSeOWFsguvXlAyCdrpuljS2oYppcyZkqbGk5fVi8TF1OGx3SUjayUiDOmTOcla4vvJT1JOK7CxHeeQ+Lxg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kYjGnWGd
Subject: [Buildroot] [PATCH v2 2/5] boot/uboot.mk: new zynqmp pmufw prebuilt
 option
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT option will enable u-boot to
use the xilinx-prebuilt package for downloading a pmufw.elf that gets included
in the generated boot.bin.

If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT option is enabled, then the
BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw will
be ignored.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- Config.in: depends on BR2_TARGET_XILINX_PREBUILT_ZYNQMP ||
  BR2_TARGET_XILINX_PREBUILT_KRIA
- uboot.mk: moved endif to after ifneq statement to simplify logic
---
 boot/uboot/Config.in | 16 ++++++++++++++++
 boot/uboot/uboot.mk  |  9 ++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d0901edc9d..41e372939b 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -512,9 +512,25 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
 if BR2_TARGET_UBOOT_ZYNQMP
 
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
+	bool "xilinx-prebuilt pmufw.elf"
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	depends on BR2_TARGET_XILINX_PREBUILT_ZYNQMP || BR2_TARGET_XILINX_PREBUILT_KRIA
+	help
+	  Use xilinx-prebuilt boot package for downloading prebuilt zynqmp
+	  pmufw.elf from https://github.com/Xilinx/soc-prebuilt-firmware repo.
+
+	  U-Boot build process will generate a boot.bin (to be loaded by the
+	  ZynqMP boot ROM) containing both the U-Boot SPL and the PMU firmware
+	  in the Xilinx-specific boot format.
+
+	  If this option is selected, the BR2_TARGET_UBOOT_ZYNQMP_PMUFW
+	  prebuilt option will be ignored.
+
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
 	string "PMU firmware location"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 	help
 	  Location of a PMU firmware binary.
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index b9f165f041..19f4cdb557 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -436,6 +436,10 @@ endef
 
 ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
 
+ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT),y)
+UBOOT_DEPENDENCIES += xilinx-prebuilt
+UBOOT_ZYNQMP_PMUFW_PATH = $(BINARIES_DIR)/pmufw.elf
+else
 UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
 
 ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
@@ -444,7 +448,10 @@ BR_NO_CHECK_HASH_FOR += $(notdir $(UBOOT_ZYNQMP_PMUFW))
 UBOOT_ZYNQMP_PMUFW_PATH = $(UBOOT_DL_DIR)/$(notdir $(UBOOT_ZYNQMP_PMUFW))
 else ifneq ($(UBOOT_ZYNQMP_PMUFW),)
 UBOOT_ZYNQMP_PMUFW_PATH = $(shell readlink -f $(UBOOT_ZYNQMP_PMUFW))
-endif
+endif #ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
+
+endif #BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
+
 UBOOT_ZYNQMP_PMUFW_BASENAME = $(basename $(UBOOT_ZYNQMP_PMUFW_PATH))
 
 define UBOOT_ZYNQMP_KCONFIG_PMUFW
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
