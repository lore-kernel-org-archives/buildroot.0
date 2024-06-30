Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9A8C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 13:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 461064067B;
	Sun, 30 Jun 2024 13:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MBSX9LpaBKK7; Sun, 30 Jun 2024 13:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4D1040675
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4D1040675;
	Sun, 30 Jun 2024 13:45:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6531D1BF3A1
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 13:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E9EF40159
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 13:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ln4icCYoNF9j for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 13:45:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::610;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E2E6440247
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2E6440247
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::610])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2E6440247
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 13:45:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVOhHLiiY5h3gxafe4AL8OrG8b55WOtR8zk28MmWuo5l/tOqzpRrVXPsFXwvqBTuq7+zlWvBvnkDNd/WQDn/ry6wGDC6TFhHTOfTRTIv2BFY3IpX7H3GOoaTm6eQ0Jhehm5SF9RJh0HUh2h0mA7mqKDfoDC057z6BgcbXG8ZfgQwkNf9fnGMLVZggzQ5Ds95T70zsnc0tcmaB7ioqYUYbeiPvggMLmj3NpF9WyKh9Ae3XywKFUIZrGd9yGHz6heISXqxB2RjYY3ZDuafekJclvwzWPX3egXPZBtERaoyzsGY013dDVcYjwyUyETgRfMefWh6P/NbPml/i2VYvM2phg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kztV+lX95CaRdd2OX4jx6pb/EcCNFv1TL89b5gU87U=;
 b=blPWUxZ25GyonGv/JrFyInxrrfG9o09zTo/SRMVlSxZS/dFls27L09aD08i4nk3Djzgp7H4Ui6sjQyxtsDTM//ZjO5Hdpx73i41AT2VKhj+zXKUp2l1Q+yuCJspcRZS6TUBLRUUuolRk82KS3IyLZJ/Wj5Efj2qlR8xX+J6gtucqO2mCyfg5shKtVnOsseI36ulR2Dok4u7oO9c7DJJ19sqHvKaasbmxmIMYmw956i5Pb+aQOW8BjCpwmNNh90ODOOf7+daqK+HfqCM1YXBNVz2APqpbwWmK0gCpSQXQ2dRDxS1lmwqiqRaO0W19vfT8XkIJWWehphVkhUra1jPQyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN8PR03CA0022.namprd03.prod.outlook.com (2603:10b6:408:94::35)
 by PH0PR12MB8008.namprd12.prod.outlook.com (2603:10b6:510:26f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.25; Sun, 30 Jun
 2024 13:45:12 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:94:cafe::fd) by BN8PR03CA0022.outlook.office365.com
 (2603:10b6:408:94::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29 via Frontend
 Transport; Sun, 30 Jun 2024 13:45:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Sun, 30 Jun 2024 13:45:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Jun
 2024 08:45:09 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 30 Jun 2024 08:45:08 -0500
To: <buildroot@buildroot.org>
Date: Sun, 30 Jun 2024 14:45:01 +0100
Message-ID: <20240630134503.3658120-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240630134503.3658120-1-neal.frager@amd.com>
References: <20240630134503.3658120-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|PH0PR12MB8008:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cd307cb-a54f-477e-4c08-08dc990adc83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1upuLlwyH2ewUGihhJns9pHwqJTIXTiV1YHv4yR4zfgYhKWgpJEYBZJ2iFmG?=
 =?us-ascii?Q?svRi6H0rEwydFsZ9LpMfLUJ9Gibr0VNEZgcNoQZwD6/3MF5kXkiNJ1Abhspy?=
 =?us-ascii?Q?QLhk7FX+1GghCjK7hP5H3MxqV8nru9B1shnhjbZd1E5wrdf7iREumiThcteb?=
 =?us-ascii?Q?LbvzcGkY3yrYWLh0WhmRld2KXYlG5yzZcwLHdpboyoKZSdvMjPBMkdNezZ3e?=
 =?us-ascii?Q?l+P/uqLxB3n/KY2OsqtrBsUA6ow//rLqMTrzyKLQMwg9D9D+7XTAUvm9Ixe0?=
 =?us-ascii?Q?ySOWtjR/SD1bYctpmyDQwnEZ53YejOtKqgOWXD3OKygBruGynN2IS3KxbZ6W?=
 =?us-ascii?Q?noyegaf/W70vCGy0e/J+55iGesawArhn8dZCKsSUPT3aeuubyqgHG+KD/cQD?=
 =?us-ascii?Q?3Qi0x2FbzTSrfHYQlP4+fhu0HjTf/mSDd4kzTVy2tHPKxGZNOHqpI/K1qqHU?=
 =?us-ascii?Q?3a1e6/RU1meYB5TFq9iIK73q0cjdvovINNF28Gzt9ZcqXP/0QHpEvkI6bZkZ?=
 =?us-ascii?Q?9V6JKGwZqCIwZCW7mgTNOGpc/0xhDOQAZfIhVhqgnuwcahYlqbf0dntBkjHs?=
 =?us-ascii?Q?SS5tweuzDLeX3eyznJlVRF7JUTWE5jujfgt1PTCrhoAuWuUFYbMalKLHlwG9?=
 =?us-ascii?Q?x5TG8NKM68rrW4vXC3wNVqMyv5uInzvY4bmP9ARbd/D9EvNUeTbHSt75YhFZ?=
 =?us-ascii?Q?xZAacBBa6jcPApg9lWMd3LM/AIaauGbbscrmIiUSIhFHr6ZhsFDKAdHFQ003?=
 =?us-ascii?Q?PqDiExflK+FFc2s83j6na4CH1RaJsFaX2Zescb/BrKrhkAujJOmmhHG8GLrL?=
 =?us-ascii?Q?9quaw1HUOkuydkAJpo8GZsKPyYT+BPuyPw64f4KTz3Kin1HcDTEPgko+QF44?=
 =?us-ascii?Q?1ncZhGqHejaSffG88ROGQC6F6DVPlAA9LSy59rulhxIeG0NtSnz8FRyW46ct?=
 =?us-ascii?Q?eTSoEjABfPBwJotUUB2emtUpTg1spsWGcBoK7LdEp/tIPqbM96qnZFHpoGe3?=
 =?us-ascii?Q?Z+E4E/pbXoC2NYa4o3Jn0X+WALou45fVG+zBfDpQ/3zglJDfCclRsdG8Ush0?=
 =?us-ascii?Q?RsRkcXqYa2w+i+qPnn99gNB6apmY+TMkR5lkJHRjgC6V9Ndlt5/Fxl7ARH7p?=
 =?us-ascii?Q?lI6CZvWxHlNSXRzKYhrdcipZHNeENOr1RqHF1+ykqJQDS19ZpTua632wzxVn?=
 =?us-ascii?Q?K5xHjWPS92o8QINJm1sgElaN13TrWY6ZmqSnmcZ4TSzPFH6Ys9Q7XWjS0wMY?=
 =?us-ascii?Q?C7YZe0VaSTWZB7rxta0iV8ZJH60yZxD+23AX6FNvCgXxsNpTgQZ1obmO0UM4?=
 =?us-ascii?Q?ZavfZefhYNTZwvfXAhBrUeGhNfRKqawpazxVdgSIKrBZbwOEy7WxVrQAbJZW?=
 =?us-ascii?Q?G10HzGJqyFnlbHTs7qSkY3w3LJyLnl1aHJRGLH3lUwUAX/Gr2OdYbj0GUckx?=
 =?us-ascii?Q?VDHPfG7Otls=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2024 13:45:10.7301 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd307cb-a54f-477e-4c08-08dc990adc83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8008
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kztV+lX95CaRdd2OX4jx6pb/EcCNFv1TL89b5gU87U=;
 b=jJnX3OLUVVSQi6jMKSjKlj6AKTcHId26rcRi5CMWkk7NysY7HHOpfr8G3wRJ3+nG+u7SXWmbZcrynTyTRqqlXTCC+AYXp7U39OEa8SJoK4CihJKdGVykPDfK5/wl2sJzOah4EzsD6jDyp7tphjYaZkWdQ+0BG3kDI9M4ecT5fu8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=jJnX3OLU
Subject: [Buildroot] [PATCH v4 2/4] boot/versal-pdi: new boot package
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
Cc: andy.a.kennedy@collins.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a new boot package for downloading a Xilinx Vivado generated
PDI file to be used with the xilinx-source package when building microblaze
boot firmware for versal targets.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V4:
- new package added starting with v4
---
 DEVELOPERS                      |  1 +
 boot/Config.in                  |  1 +
 boot/versal-pdi/Config.in       | 20 ++++++++++++++++++++
 boot/versal-pdi/versal-pdi.hash |  2 ++
 boot/versal-pdi/versal-pdi.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 49 insertions(+)
 create mode 100644 boot/versal-pdi/Config.in
 create mode 100644 boot/versal-pdi/versal-pdi.hash
 create mode 100644 boot/versal-pdi/versal-pdi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index af7f46fc6c..3867234bfd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2341,6 +2341,7 @@ F:	board/versal/
 F:	board/xilinx/
 F:	board/zynq/
 F:	board/zynqmp/
+F:	boot/versal-pdi/
 F:	boot/xilinx-prebuilt/
 F:	boot/xilinx-source/
 F:	configs/versal_vck190_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index da22f15e8a..14a674596f 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -20,6 +20,7 @@ source "boot/syslinux/Config.in"
 source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
+source "boot/versal-pdi/Config.in"
 source "boot/vexpress-firmware/Config.in"
 source "boot/xilinx-prebuilt/Config.in"
 source "boot/xilinx-source/Config.in"
diff --git a/boot/versal-pdi/Config.in b/boot/versal-pdi/Config.in
new file mode 100644
index 0000000000..25854bcf4b
--- /dev/null
+++ b/boot/versal-pdi/Config.in
@@ -0,0 +1,20 @@
+config BR2_TARGET_VERSAL_PDI
+	bool "versal-pdi"
+	depends on BR2_aarch64
+	depends on BR2_TARGET_XILINX_SOURCE_VERSAL
+	help
+	  Pre-built versal PDI file generated by Xilinx Vivado.
+	  Depends on xilinx-source package for building microblaze firmware.
+
+	  https://github.com/Xilinx/soc-prebuilt-firmware
+
+if BR2_TARGET_VERSAL_PDI
+
+config BR2_TARGET_VERSAL_PDI_BOARD
+	string "board name"
+	default "vck190"
+	help
+	  Name of versal target board.
+	  Used for installing the appropriate PDI file.
+
+endif # BR2_TARGET_VERSAL_PDI
diff --git a/boot/versal-pdi/versal-pdi.hash b/boot/versal-pdi/versal-pdi.hash
new file mode 100644
index 0000000000..b609fddc4c
--- /dev/null
+++ b/boot/versal-pdi/versal-pdi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  versal-pdi-xilinx_v2024.1.tar.gz
diff --git a/boot/versal-pdi/versal-pdi.mk b/boot/versal-pdi/versal-pdi.mk
new file mode 100644
index 0000000000..81b5e89b3f
--- /dev/null
+++ b/boot/versal-pdi/versal-pdi.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# versal-pdi
+#
+################################################################################
+
+VERSAL_PDI_VERSION = $(call qstrip,$(BR2_TARGET_XILINX_SOURCE_VERSION))
+VERSAL_PDI_SITE = $(call github,Xilinx,soc-prebuilt-firmware,$(VERSAL_PDI_VERSION))
+VERSAL_PDI_LICENSE = MIT
+VERSAL_PDI_LICENSE_FILES = LICENSE
+VERSAL_PDI_INSTALL_TARGET = NO
+VERSAL_PDI_INSTALL_IMAGES = YES
+
+VERSAL_PDI_BOARD = $(call qstrip,$(BR2_TARGET_VERSAL_PDI_BOARD))
+VERSAL_PDI_BOARD_DIR = $(@D)/$(VERSAL_PDI_BOARD)-versal
+
+# We need the *.pdi glob, because the file has different names for the
+# different boards, but there is only one, and it has to be named
+# vpl_gen_fixed.pdi when installed.
+define VERSAL_PDI_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0755 $(VERSAL_PDI_BOARD_DIR)/*.pdi \
+		$(BINARIES_DIR)/vpl_gen_fixed.pdi
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
