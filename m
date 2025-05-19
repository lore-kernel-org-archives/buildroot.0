Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CF8C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 08:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0210D4068B;
	Mon, 19 May 2025 08:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jgt4ZkzMTG5p; Mon, 19 May 2025 08:36:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85A1F40655
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85A1F40655;
	Mon, 19 May 2025 08:36:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA62CD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 08:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9040D60645
 for <buildroot@buildroot.org>; Mon, 19 May 2025 08:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEcBngSs5a86 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 08:36:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::603;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08233605C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08233605C4
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::603])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08233605C4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 08:36:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jH5HljcJVRrcTxNMDxyDbnI67give6T4BsgDEoMng/OruAw+p/jSAOBgyjJVUf+1alcnb15gHFhHpsao2RuyUvSu4lyR8kXVcl8lVO7tTMzpQuXLglhN2H0VnyBIuVOtZEhBssK3fd0vO1xqM31HLQo9/qPEThYzolOhv+xqFirTazHl2pPID+8c8L1mWfoxsOEiWZH1uesy/T1IDyDM3XHhgQJjXe4eTvW6mqt+lFfLUo6BZvRbLUTM7dfeUp8qSE7fEv0G8mc1kOR3uFuKHTLJWMfH+/d/+gxWbh6L8lMLdJLHwwYy1QWBAmJOyIR4CO3YSfImyMuxxZpfaIvcug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEuUcTqwcaQ+LVYn++pqutNKN0/PevTPWBfvnkCF5hM=;
 b=iv2uJVUj2NmdzTRwAhsWtcb5ZrGyURO/uUnfN+Nj0v6kqgL9+SuHAdeZrPfUfQnkHeZ4q7rWqGm8nzY45/g965yju574RGXoENvHPIuDBlAOWPD6Hd8GwmwKF8eJXyuiZwON8OhoZrUjqOJTOgrMGyLLJh0+YU+v67UtGDgoehmY50LFWddF5CWVUNOmpjF+TKcGvbVH55nP9bnr11nKTiTqLQIN6qzm5WelIIxZsUHaje3Bp8YXx3Fgwer1WXs//mnczwCJPa2wK4YlxZ6uRo6mwjDRtjdM4l14kO3EGVGL9BgzAB3anEROAHV3zuBJ4uxDO1FK2oMTwnSfLNxbxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ2PR07CA0013.namprd07.prod.outlook.com (2603:10b6:a03:505::15)
 by DM4PR12MB7766.namprd12.prod.outlook.com (2603:10b6:8:101::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 19 May
 2025 08:36:40 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::c0) by SJ2PR07CA0013.outlook.office365.com
 (2603:10b6:a03:505::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Mon,
 19 May 2025 08:36:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 19 May 2025 08:36:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 03:36:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 03:36:37 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 May 2025 03:36:36 -0500
To: <buildroot@buildroot.org>
Date: Mon, 19 May 2025 09:36:29 +0100
Message-ID: <20250519083632.1930804-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250519083632.1930804-1-neal.frager@amd.com>
References: <20250519083632.1930804-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|DM4PR12MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6874f1-746f-40fb-8a3f-08dd96b045fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QKNO0vY1OJcyATW/iNDkBqfkcr0EQ8g11QGaMtVqSjgVEd0ZZWgVDVkR3LyC?=
 =?us-ascii?Q?82T/E3w/7W6RDJat0ldAR+UPa8kRrHjAVIAAKgSbAYa3H8Ofakz3DtBDJ8RW?=
 =?us-ascii?Q?JUTpLOKiCyaeyhyiKmfmc5MtUd5zn9CWElN/Fn7vPefoXZ7kpoEqhHr6C/vy?=
 =?us-ascii?Q?rtag3AXacd9bJktCw6SfSC+c8PDdaSSC5w8B4EgHkePpJTIpfkrGwK1TwnIB?=
 =?us-ascii?Q?3ITTk/jzYuNocKAikW6u+bFsPYmVqUnFdF9ism9QKSy/wV1wmt6ypgfcup4d?=
 =?us-ascii?Q?j08PPXMujcE9CdSvYWTBplie0tPVnkwVpiMMfz+mWq9CaktrMNnLOgLxoMuV?=
 =?us-ascii?Q?ZU0Rz3oA7nOBpEJkdvbOdKt1EvF9lBwhIhLjiwQoFsHJqU2TcgGMIPFadah3?=
 =?us-ascii?Q?gIsQOPQrjaCVHmhee6xEneHpLCrM0k53nJzX4cBPD1okV5mkW/W4GOg6umCU?=
 =?us-ascii?Q?7jwm5Ash8I4SfnHlBAHhormpmLT0jqEsqvfI55YF7B+5cyKdUEtfAn9tL6h8?=
 =?us-ascii?Q?LdEkRcKV9yk+fhMecXwauLNXJ8T4WWkyc+oYGQf5wljFadoHLBiqq3tgqgku?=
 =?us-ascii?Q?46DboE851jxt9hdzfoER9PVbr7YsmnACMrt/5KfIJltLxP/9j9mzySGxbUJM?=
 =?us-ascii?Q?V0IKNkPiHtW4z4VpBrHL5nGmCY3HJjOz0W/o7+1tyfmgCwuSxRXJ0P1j4tlg?=
 =?us-ascii?Q?u6UFIyR+r3gvnyDsGIt8TlApoeg65L05nF7c33uk1s3vra81RzenLI/PTpOg?=
 =?us-ascii?Q?oMATECi9ZBJYhmm8reeFJdqUK/NC/e0eXoJqL5OZ+wvv2mhpNLXHQrqxn4/Y?=
 =?us-ascii?Q?dp63737R71SGis3FDdCqwMBkOm4NNZbLuK2RvTqciRKTyNy9vobVybe3JF0b?=
 =?us-ascii?Q?PCiejY9FKhHatv/218KouB2ZYpHWGVZYBrSkbfWlIvx1KVP1xZhptwyrWXg0?=
 =?us-ascii?Q?PLloP9u5XTGpXmyAWtFyRQFiVY7UqatLqq1Pwq8H+BebqiKZw0R34MhRQNLT?=
 =?us-ascii?Q?PJY4j9a3MYs8x+ExCZxZX9D9wXgPa/34WeXbuNXZSaE/gNLm01bE5JsJkHGj?=
 =?us-ascii?Q?qt1zBxO60VIEi3uAhGA8jD6p/DpK/Q4X1GwONhiTv9sXNesjcXHj+9QKK1Ui?=
 =?us-ascii?Q?83IO52GN7v1iUU5rd1TrBU0rWvNNChj4IVruDYO6F91abbfor/ifs8Y4PZ90?=
 =?us-ascii?Q?RuYMOBi71N6OmhWTRJ3w7TEn4LqIl3Gbmnvj9+Gn3jb7dDbOQ73HkymrVsXW?=
 =?us-ascii?Q?01aemn+PRsZhwqHuwluBVAgKcD2WiEh73a92I/cg1/zmDtyi0P349gUdez7j?=
 =?us-ascii?Q?O/bKNIXbskc1M142Q8/lFoHIra70TmJwPilMiYoiu848hah7h7Sbs45lQpw1?=
 =?us-ascii?Q?awC1LB20Aw2s3NKIPm5iuRu15kDsq8lv656DBv2H7rH/Osm555MCU+CBCYxN?=
 =?us-ascii?Q?ml3oCeDfxso35Fbrz5OSrD2q+ojQLxtiYFpbWs8bga+d/AZtFhBYiPlEY2Uy?=
 =?us-ascii?Q?WpcBV3stIe738SDWowcWqaLqzZxHooDDHdwXByAVQI3eYwJLebXij7NMff07?=
 =?us-ascii?Q?40PblXhDXk9GzgExzg4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 08:36:38.7738 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6874f1-746f-40fb-8a3f-08dd96b045fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7766
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEuUcTqwcaQ+LVYn++pqutNKN0/PevTPWBfvnkCF5hM=;
 b=wXf9xdlWpBaQODG0rfSgyKAiPOFpLZoFeWeepCjrjnKj5JLqLQ8EQcSmkhKAGaD6EV14AgrxpuS8dipv8TDWQPjBfUuqbKEGi2wKpFPYU9UoM8NAhnbXlmLlfTYxAjO05oOXNVj8pR9KZlxi7QOPsYvkzmRPxrQosGtmPdF2jvI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wXf9xdlW
Subject: [Buildroot] [PATCH v4 2/4] boot/xilinx-prebuilt: add segmented
 config support
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

AMD has created a new segmented configuration for Versal products.  It splits
the Vivado hardware design into two PDI files, one containing the minimal
required configuration for the DDR and booting the processors, and a second PDI
file which contains the rest of the FPGA design and can be loaded at run-time
via U-boot or Linux.

The file names generated when using the Vivado Segmented Configuration are as
follows:

<design>_boot.pdi - Minimal DDR and PS config for booting
<design>_pld.pdi - Remainder of FPGA design to be loaded at run-time

Since two PDI files will be included in the XSA file when using Segmented
Configuration, the xilinx-prebuilt package needs to be updated to support
this feature.

For Buildroot purposes, the <design>_boot.pdi is the file that needs to be
included in the boot.bin for booting the processors, so this patch checks
for a file named *boot*.pdi which will indicate that Segmented Configuration
is being used and will make sure to use the <design>_boot.pdi file and not
the <design>_pld.pdi file when generating the boot.bin image.

If no pdi files contain the word "boot" in the filename, it can be assumed
that Segmented Configuration is not being used, so the single file *.pdi
method is the appropriate one for this case, and this patch is thus
backwards compatible with prior designs not using Segmented Configuration.

Also, Segmented Configuration is going to become the default mode for Versal
products, so the xilinx-prebuilt github location will also soon have two PDI
files for each board.  For this reason, this patch is also handling Segmented
Configuration for files downloaded from the xilinx-prebuilt repo.

For further information about the AMD Segmented Configuration, please see the
github tutorial below.

https://github.com/Xilinx/Vivado-Design-Tutorials/tree/2024.2/Versal/Boot_and_Config/Segmented_Configuration

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
V1->V2:
- $(@D) is not available in time for wildcard evaluation outside of shell
  script, so moved the wildcard functions into the install scripts
V2->V3:
- Moved if statement inside of $(INSTALL) commands to make the code easier
  to read.
- Changed wildcards to more specific name "*_boot.pdi".
- Changed pdi file permissions to 0644.
V3->V4:
- No changes
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 36 ++++++++++++++++++-------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 72273f0d2f..4d1dfc5ca0 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -28,9 +28,6 @@ XILINX_PREBUILT_BOARD = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_BOARD))
 XILINX_PREBUILT_BOARD_DIR = $(@D)/$(XILINX_PREBUILT_BOARD)-$(XILINX_PREBUILT_FAMILY)
 
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
-# We need the *.pdi glob, because the file has different names for the
-# different boards, but there is only one, and it has to be named
-# vpl_gen_fixed.pdi when installed.
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
 XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
 # Unlike the psmfw.elf file for Xilinx development boards,
@@ -39,11 +36,33 @@ XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
 # so to support current and future AMD Vivado versions, the filename
 # psm*fw.elf is used.
 XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm*fw.elf
-XILINX_PREBUILT_PDI = $(@D)/*.pdi
+# We need the *.pdi glob, because the file has different names for the
+# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# If Segmented Configuration is used, there will be two pdi files and we need
+# the file that has "_boot.pdi" in the filename.
+define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
+	$(INSTALL) -D -m 0644 \
+		$(if $(wildcard $(@D)/*_boot.pdi), \
+			$(@D)/*_boot.pdi, \
+			$(@D)/*.pdi \
+		) \
+		$(BINARIES_DIR)/vpl_gen_fixed.pdi
+endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
-XILINX_PREBUILT_PDI = $(XILINX_PREBUILT_BOARD_DIR)/*.pdi
+# We need the *.pdi glob, because the file has different names for the
+# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# If Segmented Configuration is used, there will be two pdi files and we need
+# the file that has "_boot.pdi" in the filename.
+define XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI
+	$(INSTALL) -D -m 0644 \
+		$(if $(wildcard $(XILINX_PREBUILT_BOARD_DIR)/*_boot.pdi), \
+			$(XILINX_PREBUILT_BOARD_DIR)/*_boot.pdi, \
+			$(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
+		) \
+		$(BINARIES_DIR)/vpl_gen_fixed.pdi
+endef
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
@@ -60,10 +79,6 @@ define XILINX_PREBUILT_INSTALL_VERSAL_PSMFW
 endef
 endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 
-define XILINX_PREBUILT_INSTALL_VERSAL_PDI
-	$(INSTALL) -D -m 0644 $(XILINX_PREBUILT_PDI) \
-		$(BINARIES_DIR)/vpl_gen_fixed.pdi
-endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
 define XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW
@@ -76,7 +91,8 @@ endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
 define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
 	$(XILINX_PREBUILT_INSTALL_VERSAL_PLM)
 	$(XILINX_PREBUILT_INSTALL_VERSAL_PSMFW)
-	$(XILINX_PREBUILT_INSTALL_VERSAL_PDI)
+	$(XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI)
+	$(XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI)
 	$(XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW)
 endef
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
