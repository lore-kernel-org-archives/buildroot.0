Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179C9C54E49
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 07:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE180407D4;
	Mon,  4 Mar 2024 07:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l8WpT3MtqVFg; Mon,  4 Mar 2024 07:42:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A280D4085A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A280D4085A;
	Mon,  4 Mar 2024 07:42:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 211F21BF280
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 07:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F51340818
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 07:42:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gxavLzO9BPzT for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 07:42:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:7e88::631;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0979E406B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0979E406B1
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0979E406B1
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 07:42:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jo0T+H06CKMftcneB5XOw+N+ze0Jzph0yp3BhnLj33VE6/ecnlBNR6Y4VJRcjuo9jAytsZm0b/q5pb9vZP6Vl9FgaL/eJZCp2R7/ISgM6rHRY4PhM6zDudi/3M7PmcVrXyelLYK5WE46NM/3JmRFOp5Y4CFCZcL61envFKM+hfkKhgabIOmKOGopzhS19is5WK4IJ5NXUL+aUs9eCw7bDCS8S4QOwroORaeqMLkjntEJotfdcKt0FUvrBgocU/2deYnmlh9uLmxgmnXe2LJVnXY4Riq1qoOn5EaFDnmWv/PsYpfZtGnARYA877y7VH4DHYQzYCaUECWeSpJjnDPDDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyPJ9QbVnGni0HMmQpnRPlcQUfBoZg2Bd1bj3VWi4ok=;
 b=R5N9s2BBUEh9LTioLC9mp1qru77uVmrnLlB5l1cfbISHdJp87YqZUEGpG70BaoNE5yeiKQt+VXmJOL6A3naID8CrJ9W74z3Wp17EXapBV3NpW7MjE7uoHjCx4oEnNGo5XCITolpWNtiHt+euSvOMpUY7HFaC0yR6xi8spjc3wix8SvxieMyD2MloL22Ayx5j/5INmfqXN7zLkS2KB3upd2du+5/5YixWtkAVo3abJoO8Lw4J73koli4IjYJTkc3/EZ20tJCHPi6imhOD8eGbH8cqFDi5G7q4mvue2OkMT2hzqtvL893AqPE++X20Z8HfMGnTMmWFV88O1/JJBEzoKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR07CA0090.namprd07.prod.outlook.com (2603:10b6:5:337::23)
 by CH3PR12MB9394.namprd12.prod.outlook.com (2603:10b6:610:1cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Mon, 4 Mar
 2024 07:42:18 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:5:337:cafe::c0) by DM6PR07CA0090.outlook.office365.com
 (2603:10b6:5:337::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38 via Frontend
 Transport; Mon, 4 Mar 2024 07:42:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 07:42:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 4 Mar
 2024 01:42:16 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 4 Mar 2024 01:42:15 -0600
To: <buildroot@buildroot.org>
Date: Mon, 4 Mar 2024 07:41:40 +0000
Message-ID: <20240304074140.1537910-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304074140.1537910-1-neal.frager@amd.com>
References: <20240304074140.1537910-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|CH3PR12MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c65a783-ebf5-485a-9fb8-08dc3c1e9e35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TpKAGYV1oxuDc6c1GfIUSEPLYCFSOM1yv30P9nNc4ZH9ZVTI+jWYYIJzXSoolHRUv7mnHKgepvEiBI7dhTtFQ/gbDsu8wbD89yaeMqmT5p/9DZp8hUIqDDLpb+JnEPMeFKcP45+hCWtYa0DllGYhwAqN5Xv3HwmTKSd6fnVHHV5Gxb7cmEgUBERRE1kuhvb86HlKSDhyLHJqkyKzs/45Y3M1HsiSSiP3YvAfugnUoKqQabiYu512icXTOmFQY3tNly3qgKyHMVYPNWbRokSM8g1Fx/+DSCIyf8aiO81p3diW1UX3b3Fq3HkH89krAW6UwnleJ/j2mSZ2yEuB3u9Q3v+exHQAUvYU7xr61Fw3UvvvAmyFNyisB27K6MMtl0VpldO4T+jwoOhUdj1nRWfbLh9csS0aQ+zFbKTJQ0H/U2tJapd9T/P4lvtlT+dTnzZSOyWs74hUfWgQRMjXyY7pItAXZS88vxJFT6YLL9GyyZUoIwXCMlOZY1DmTiyDI50UUjZ2LxocC3wHD25UJh9xRW+IfrWfLuXh+mcTAMdTSK+GXBB//wJP9V0vwYJfWqKCF1EtJ8t6Gcn9cEm30UzNgw9BiSmgJqzDEX8cbRnhKFrgRZ0pVrCjaelUYCGWrSTluhLyW9TP+uq7uCMKppUg+n2Ac/JjTt3URwMuDa+zwtXAOghbC2u45mSjfC1eUh6UowcF94cav4aE3u49h7i7kw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 07:42:17.9673 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c65a783-ebf5-485a-9fb8-08dc3c1e9e35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9394
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyPJ9QbVnGni0HMmQpnRPlcQUfBoZg2Bd1bj3VWi4ok=;
 b=KbepcnwnVAqpyw4rrfHwtKgp69DrAwl+3EHQ9kr1aUNXunmdsAKVJpNlI4X9BIJ2Nf9Gby6wnLKuZjrbCkuIu7qK+OkIZoWxHgTylPdtMF8HNtxjmfBk3KMpFE3fpkQqR8FeI4J9zs16yYqdKbz43+xS8LYDCUJANKaf2NnReJo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Kbepcnwn
Subject: [Buildroot] [PATCH v11 6/6] package/versal-firmware: remove package
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
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch removes the package/versal-firmware as this package is replaced
by the boot/versal-firmware target boot firmware package for versal.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V4->V11:
 - no changes
---
 DEVELOPERS                                 |  1 -
 package/Config.in                          |  1 -
 package/versal-firmware/Config.in          | 24 ----------------------
 package/versal-firmware/versal-firmware.mk | 21 -------------------
 4 files changed, 47 deletions(-)
 delete mode 100644 package/versal-firmware/Config.in
 delete mode 100644 package/versal-firmware/versal-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fa3424074e..5fb3b1f5ef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2298,7 +2298,6 @@ F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
-F:	package/versal-firmware/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index bf0fe078b9..f3bcf13bb9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -457,7 +457,6 @@ menu "Firmware"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
-	source "package/versal-firmware/Config.in"
 	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
deleted file mode 100644
index 01daefd204..0000000000
--- a/package/versal-firmware/Config.in
+++ /dev/null
@@ -1,24 +0,0 @@
-config BR2_PACKAGE_VERSAL_FIRMWARE
-	bool "versal-firmware"
-	depends on BR2_aarch64
-	help
-	  Pre-built firmware files for Xilinx Versal boards.
-
-	  https://github.com/Xilinx/soc-prebuilt-firmware
-
-if BR2_PACKAGE_VERSAL_FIRMWARE
-
-config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
-	string "firmware version"
-	default "xilinx_v2023.1"
-	help
-	  Release version of Versal firmware.
-
-config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
-	string "board name"
-	default "vck190"
-	help
-	  Name of Versal target board.
-	  Used for installing the appropriate firmware.
-
-endif # BR2_PACKAGE_VERSAL_FIRMWARE
diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
deleted file mode 100644
index 1ced259be1..0000000000
--- a/package/versal-firmware/versal-firmware.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# versal-firmware
-#
-################################################################################
-
-VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
-VERSAL_FIRMWARE_SITE = $(call github,Xilinx,soc-prebuilt-firmware,$(VERSAL_FIRMWARE_VERSION))
-VERSAL_FIRMWARE_LICENSE = MIT
-VERSAL_FIRMWARE_LICENSE_FILES = LICENSE
-VERSAL_FIRMWARE_INSTALL_TARGET = NO
-VERSAL_FIRMWARE_INSTALL_IMAGES = YES
-
-define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
-	$(foreach f,plm.elf psmfw.elf vpl_gen_fixed.pdi,\
-		$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)-versal/$(f) \
-			$(BINARIES_DIR)/$(f)
-	)
-endef
-
-$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
