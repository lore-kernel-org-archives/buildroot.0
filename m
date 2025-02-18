Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181BFC02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 06:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D69E360FBF;
	Tue, 18 Feb 2025 06:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4GHU_pdA9_m; Tue, 18 Feb 2025 06:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CECC60FA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CECC60FA8;
	Tue, 18 Feb 2025 06:50:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A08CE05
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 06:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B6EE40805
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 06:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMnrhbCrg31l for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 06:50:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::600;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 842B6407E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 842B6407E4
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 842B6407E4
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 06:50:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tL5uLatAgakyUyItecVL2tKf6Sqfx+YJ0emCQBtOLDG/DHIMdB5peT5PwUeDM3hlIvlW74T5mhHAuW+qUqjkAmiNWFrHD+HlGQQula3XlY4a9kJ4BE1tH/GxarG5sTxnij4joRO0UxQ+zf7SA0sAuE7T9gYAYicPBBy4edp1ZbuwJKmr5OBVeqLj6ZO6LOoykhWqN/EVD1H0IfQd2r6s4lFeooYaVWZebwHttvIaB4BjLBk2+dcnSw8pbJQzzAcnISHvTzfh/hrQ8561K9we/FP+K5sJ0QHVxbaVY6hqgDd697psz3NtUWnDG1QwFZDxdgN7fK+jCH66NIMgRKaLYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izkMVuHy2YV8ZN7kJ/KKhM81QRdzG3kauWXYLNhLPw8=;
 b=G9cM3NI5sWQP0qWFN6A0VyeH14sUlbMzZydLmbT7qWvM2FaxbJT43VAEyxA14DAuGdJJV8M7CgaBykjswhZrq2bNVMqpsQL5kf1vRQz1adMFeP+SSce6PCRVVSSI8O9LPg2drxtalxpkoHCPn3aAaFqfwhtLXtoVAgfDYyGSGKhPNiq0E++Z2ZQqZoQEF8OOXdb//QVHoWtq1dk3MgBGbmTV2401QjvHhxiTkOxYzVsm7D3EsXqYMClhFBdG0RTAEFqmpxWI2zrZvktQdAnLBr2I5uwX/BAu28OVvnUbfjB3dZs3rUUEo0L/AOfMZIjrKAR98LHWwZnls7Rn+L0BOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0654.namprd03.prod.outlook.com (2603:10b6:408:13b::29)
 by IA1PR12MB6554.namprd12.prod.outlook.com (2603:10b6:208:3a2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 06:50:31 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:408:13b:cafe::be) by BN9PR03CA0654.outlook.office365.com
 (2603:10b6:408:13b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.17 via Frontend Transport; Tue,
 18 Feb 2025 06:50:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.2 via Frontend Transport; Tue, 18 Feb 2025 06:50:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 00:50:30 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Feb 2025 00:50:28 -0600
To: <buildroot@buildroot.org>
Date: Tue, 18 Feb 2025 06:50:26 +0000
Message-ID: <20250218065026.4907-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|IA1PR12MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ffdee19-0a26-4d59-b7f8-08dd4fe888fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6BNIxBmzo3INAxYV+YilV1l2dm09/dnfhwfU1sDtBGo59ALg4G3zN33B9cdQ?=
 =?us-ascii?Q?W8//R9EdC6WGYJ3WEEKWyRXb3ht9DEf5pxikoD0kOuMQPhDJzFplhOEK/Q3X?=
 =?us-ascii?Q?5hKWGvXn5iVClNNJjnIlqtlwoIehnTBsUvGsFuQo/P8/7+7AeqDxin6HmRdV?=
 =?us-ascii?Q?NJE6ByINN5IEE+/uPLYn0UzB/JF6x3HkTA5pMOf63EwR8eYLYb2iYEPeZddK?=
 =?us-ascii?Q?96CaG4O68x88tVofAR8l41arejkwJeN6AGXBomVj51lTmAvytqgKICpjkrDF?=
 =?us-ascii?Q?cpJ00DlDTBFVqjpWLw8Yd5ICBSl4RbvmMnbkW9j7VIRcy7mEXAt5w4wmJ9p4?=
 =?us-ascii?Q?Awc9HjFAxbIO5wQhB/B/a2a/0GOar2I4RweF+kDteD4U6BkoD4ZgkEMOrE7K?=
 =?us-ascii?Q?wYPW44vYEN2XmEcrfpWmFFbvWjrC2/G7R62SQuSxGh51EnyJV1ErP+BM2luZ?=
 =?us-ascii?Q?u+4NERQxugpmcavjosooRNFBpvpkH8kf9MHx9MqEg6LkYrBqbqEQJLzH9ffz?=
 =?us-ascii?Q?RmEMYO428hY40L7S+Nb0JG90E+Sh5htuncFaum1Tia1pV10t7FOWr4sUuT8w?=
 =?us-ascii?Q?GjUDdsR9mRxTtVUYIY4QM7bop3AIW/QwLrD8Q5K/jNChv8Xyn1giMOhUUb6Q?=
 =?us-ascii?Q?J16EWhNj85jk1RgSTTUswfWeaGi5Uw4lm30/soPalRePnbNZaZlY16k59LeE?=
 =?us-ascii?Q?/dtV7npoSgpKBuGKJhGDAFJ/3dfvX+3sLKdmtuFH3NKF5J+UBlAts8pE4YTp?=
 =?us-ascii?Q?ZGEndypMKT0KK9t1CGGWJCBDzW3Sjc4jq27EHH0ppRmNE2YfiL5cjD1fL0kV?=
 =?us-ascii?Q?EARha4NIEph/+rYrzB+SuBlHR5+JF8A6vdNeAoZsamD7iMFKFF+HgvYMxfwd?=
 =?us-ascii?Q?ztgYt3z/8JFcv6No5jqUVkq9ccegCj8XT4EKQO/VJEZw/PES2FJfJMUOucGg?=
 =?us-ascii?Q?4PjRVzTeJnuF1qUEXYDDtjfj2SUquxOiEJwgaehiaQ5ULTIMFtfa5SW01wK/?=
 =?us-ascii?Q?JwXJCujc+M0En1OaidSmC3w62fd5rRPuE7BvcqUOIT3PGgAxhjv5pCgr2okD?=
 =?us-ascii?Q?eGy8yNqGCFfYe7Q3QUSU1KPRogHsBzWfUAO5TUMr5yQhgfiBk49XyWygvvc1?=
 =?us-ascii?Q?QYZyDft7Ac6OCfrWfJZE8pt7IikCuXjtl+x1qQFaUz3wiaFhvRRn5iYHY0wS?=
 =?us-ascii?Q?1jr72QrTrXaHKnsYFv3HNEtslXSI8Zdb0N5n6YcdcO1Cex+MEVNbYZrHcVsx?=
 =?us-ascii?Q?+yVaoNXT0ni4TotPYkgLSZIvs6rfjTuo68K6A9C2s5yd0pAUXKXNkZqcTNPe?=
 =?us-ascii?Q?pslM5hd9gtzRYhnfflaNZMddnCtiZWOR3inHD/E3ffsQOlGoiZAgU0zqUuK4?=
 =?us-ascii?Q?l/oesURiemqeUqyC/bmi8dlm6uxmyS5VaTfy7AI/v/NiqTDSgK4UEqCbJfWG?=
 =?us-ascii?Q?rW0Tq35/IieFnwnLXCsK/Jqw1VWf6dt/mb7U7UgOMSkQQ27MwemtuYP7+1sF?=
 =?us-ascii?Q?TsFkFb0ducNW8stxBPz76jqRULLGWUhtSJqn?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 06:50:30.5189 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffdee19-0a26-4d59-b7f8-08dd4fe888fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6554
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izkMVuHy2YV8ZN7kJ/KKhM81QRdzG3kauWXYLNhLPw8=;
 b=xQeW8UdRXHwh6dtRpt3YAtyyJicSvmh/PyuAVixSuNO091kuHWwsAMONjkWznir7wnjxJetADD56hOzfoOS+TTuHiHzZy+OIW5M9vN9cPhFz/kVuDOxDi6BL7kMv6MHahI7wAFCXNR7kBG2+435eZXnANwceE2H9qfIoqTk/+rc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xQeW8UdR
Subject: [Buildroot] [PATCH v1 1/1] boot/xilinx-embeddedsw: rename toolchain
 vendor to buildroot
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
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch renames the bare-metal toolchain vendor used by the
xilinx-embeddedsw package from Xilinx to Buildroot to be consistent with all
other toolchains built by Buildroot.

To build the Microblaze applications available with the xilinx-embeddedsw
package, the following config is now needed:

BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-embeddedsw/Config.in               |  4 ++--
 boot/xilinx-embeddedsw/xilinx-embeddedsw.mk    | 18 +++++++++---------
 configs/versal_vck190_defconfig                |  2 +-
 configs/versal_vek280_defconfig                |  2 +-
 configs/versal_vpk180_defconfig                |  2 +-
 configs/zynqmp_kria_kd240_defconfig            |  2 +-
 configs/zynqmp_kria_kr260_defconfig            |  2 +-
 configs/zynqmp_kria_kv260_defconfig            |  2 +-
 configs/zynqmp_zcu102_defconfig                |  2 +-
 configs/zynqmp_zcu104_defconfig                |  2 +-
 configs/zynqmp_zcu106_defconfig                |  2 +-
 .../toolchain-bare-metal-buildroot/Config.in   |  2 +-
 12 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index b0691d7e7b..34abf1489e 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -14,8 +14,8 @@ config BR2_TARGET_XILINX_EMBEDDEDSW
 	  Applications can be found on the Xilinx embeddedsw repo:
 	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps
 
-comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
-	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
+comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
 
 if BR2_TARGET_XILINX_EMBEDDEDSW
 
diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
index 7d4fcf8b8f..acf8e81cdf 100644
--- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
@@ -23,9 +23,9 @@ XILINX_EMBEDDEDSW_CFLAGS = "-Os -flto -ffat-lto-objects"
 ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
 define XILINX_EMBEDDEDSW_BUILD_VERSAL_PLM
 	$(MAKE) -C $(@D)/lib/sw_apps/versal_plm/src/versal \
-		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
-		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
-		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-buildroot-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-buildroot-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-buildroot-elf-gcc \
 		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS)
 endef
 
@@ -38,9 +38,9 @@ endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW),y)
 define XILINX_EMBEDDEDSW_BUILD_VERSAL_PSMFW
 	$(MAKE) -C $(@D)/lib/sw_apps/versal_psmfw/src/versal \
-		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
-		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
-		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-buildroot-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-buildroot-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-buildroot-elf-gcc \
 		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS)
 endef
 
@@ -53,9 +53,9 @@ endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
 define XILINX_EMBEDDEDSW_BUILD_ZYNQMP_PMUFW
 	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
-		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
-		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
-		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-buildroot-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-buildroot-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-buildroot-elf-gcc \
 		CFLAGS=$(XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_CFLAGS)
 endef
 
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 0967407304..1105a3d57e 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index c0c850e586..e59d8a114e 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/versal/vek280/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 2d77580fab..e09b8d49ec 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 85ef7d5aa2..57418a47fd 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index c5cfe2fe86..415d2fc4b1 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 288606fc02..a689be74bc 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 1e453adeb0..45895c17ed 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 13ee5ff5dc..a81b113d3a 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 2669afe1f6..ad64f317be 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
-BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
 BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/xilinx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index c86c5d725c..19c97410c6 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -10,7 +10,7 @@ config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
 
 	  For example, to build both a Microblaze and a RISC-V bare
 	  metal toolchain, use the following definition:
-	  "microblazeel-xilinx-elf riscv32-buldroot-elf"
+	  "microblazeel-buildroot-elf riscv32-buildroot-elf"
 
 source "package/newlib-bare-metal/Config.in"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
