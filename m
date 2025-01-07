Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25672E77199
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 06:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DECB3404AD;
	Tue,  7 Jan 2025 06:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cR3ffSfglyFz; Tue,  7 Jan 2025 06:32:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81727404B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81727404B0;
	Tue,  7 Jan 2025 06:32:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 137456B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F7CC404C9
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THegVmesgZyp for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 06:32:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::61a;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DA0F1404B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA0F1404B1
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::61a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA0F1404B1
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:32:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCCOIBItaXCibpCzXdKQSl/CouWU5tSl7YAOK0BE9uI+B40NxXRc7xjCziAkSS9fTPXrz34InSHwpEe7TYt9YyfO9Pa7o8T1VYTLCwRSqvVXOjlVmOvKyORy2UBFyyIkS2IqZwnBVx14fxZFXgEXP9nubRNG7NEGhZSutRixiPy8OtAe6AxskzZtn/77acAK/N1x7++wzP1Dp2oaGesjfHlHxmd/sxNCZFGMWvA274RlAyubqaGDSxLqjNVI5w/adH5N9oe5BPJSmMouMhe3/upNVVwkWTd/wCsykUDQBvKK0v7+F29zt0daeztIG+9ZGCXLJWPtLsn/rKx6/SvVjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yw1ocj0qoix7WSTcm0YfA9vIgLPmoPyqw2Dd9OD/7sw=;
 b=YD8yRVCxPa9VNOsviPEpVn+UblDXGDGDXPQ4j/fNaVcPMo9XW9fjon7m/nSJbKDjUuvV5r4h1CsQL6CQ9ahsisyl0sMP5vltEmtZGJCbb3P6cz14o1PpArJrWTMl5RA4IyRUXj+qyZC9IrVpLQNvr0zHHakIYgNR5asqfXN4096giW8iVW3T3Mneu/P95mZX0JFoMD4TzsUawoWqlQGb8VhOhV1CYyltbgzmRbPpPICwlzMMKLTUeJTuRKRy8gLbmASvDaGpA9SDQRPl6Bng2P11kbbhqwfKinPdEs1Qd/vZYWobdQ1SHaSRweF51t8awIut0R6WqmjbxTyR9OGfpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW3PR05CA0027.namprd05.prod.outlook.com (2603:10b6:303:2b::32)
 by SJ0PR12MB6928.namprd12.prod.outlook.com (2603:10b6:a03:47a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Tue, 7 Jan
 2025 06:31:53 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::81) by MW3PR05CA0027.outlook.office365.com
 (2603:10b6:303:2b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.7 via Frontend Transport; Tue, 7
 Jan 2025 06:31:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 06:31:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 00:31:52 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 00:31:52 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 7 Jan 2025 00:31:51 -0600
To: <buildroot@buildroot.org>
Date: Tue, 7 Jan 2025 06:31:36 +0000
Message-ID: <20250107063136.787314-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107063136.787314-1-neal.frager@amd.com>
References: <20250107063136.787314-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|SJ0PR12MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dfe8a34-7906-4b24-7fbe-08dd2ee4f9d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0sjPk8pONtspHbml9EBxWH3aT1sjkGBJ8ZimC+XwBrJUAafxb5EItJ7k5AK1?=
 =?us-ascii?Q?wFyl0Vjw+ptIjioxggrJsgX71prio9uq1cEl4+yMr46Q+ctHVRbzRAP54yUE?=
 =?us-ascii?Q?vXcH3MI/uhNM+txbjfsh30g8ijYAa2zB6nty0SPwRqqkIr9wF5BOwRNEBNPR?=
 =?us-ascii?Q?19sU6xQMxTcmyjZPNEmvCOXjboElTahcRA05udQfnw5xOMBGTEtNByY9YRvq?=
 =?us-ascii?Q?MIsgjsNxsYVmFEDvgxxxJlFXFczJ+NJfC/ueb87Mz3ynFWO9EHgyb+ESaujo?=
 =?us-ascii?Q?nLjvIjom1iAOxZxdvI5aSeTktY5/GUfhS98dMcqI4ewt93FtcNnlWSYOwDoR?=
 =?us-ascii?Q?FCmK8mk5q9PbUVCoV9SQijxol+Eb3Gt12aq+Va2zV4z+EQDptBIjGOreJfDK?=
 =?us-ascii?Q?K/p8z4jNdx81t1NSI4GzKgpfm3TNXTHOWgImRtfxQSLLq6nMsWu+ShfloDhI?=
 =?us-ascii?Q?t8emWg2LDK5s7h5a3yvUU33I84K1Jdczgmo5wKFyabwAABnCbfCk+Y/wYDtR?=
 =?us-ascii?Q?n87nwiBUc8F2T4E+g717uW4L3lN7Gfm6xibPH9KZyNKzj3WqXTkTJKTMtYNg?=
 =?us-ascii?Q?SjPF4JSzTTmBVzEGFL+WoCYF2IMhJ26Sg6X28v7v1INgamT07xofq2HPScuO?=
 =?us-ascii?Q?XyOyzaT6i2iiJYDPRrYKOUQbuUhp2aK3DtsTehAKJRKjJ1ldc/KH9ykgpkAs?=
 =?us-ascii?Q?IMlmYUDAUl6lrmt0XwSm9SUf9XbqC8HSOQkyRFrUk0il2x7KapY/EF8NpWQo?=
 =?us-ascii?Q?ahOv3ZGhVq8cCXlHpulTIRldjEsjWLsuVdhdcNoFj74uboKjOy4pUuOdIbQu?=
 =?us-ascii?Q?cuL03r0Stp0Z1Z+Kf6XJnn4rDIb2JkvyVAszUZoOHCEg3WsvCeOuNLXPcVSL?=
 =?us-ascii?Q?i4G5j1K1VI3DA50VFM9U1+3Ox7JI4ITMJSgH+3IqBBdqqmF5LxLncAmJK6en?=
 =?us-ascii?Q?p3O9WFBhK7w1p93RhE3yEC13R8OXOfk7Fvm27qPAXE3XP8WyTPaYM9Ww0xc4?=
 =?us-ascii?Q?3/OdJG6bb7lB8VVWgxyHL7KsGYIjl6TgVddM5E7Q9EOrancKosKh4x/UmCtB?=
 =?us-ascii?Q?LV/NWGIVcC5qkav7Yw5pwL5h2oOFZWejMU7sp3wZtk7VXxjhSrRWklsk60s/?=
 =?us-ascii?Q?B0N3MICll36ikvKlYOvU++DoOXjvTCVVpJXyRjUJETXKdGcZbtu4Rslv3yeb?=
 =?us-ascii?Q?YG335dGquDDI2FXLtI+MP2fNswrw9mRo63sxksPYDdidpymYNt+q131Fqm2S?=
 =?us-ascii?Q?s3jd2WTOlmKHRCd+cUVxlBbmk1SpOSGdIbS5YRISX3ewuu7Gw/e6d8NoFwP3?=
 =?us-ascii?Q?3o0ff5avHYzYXwaH1vGyotXpd6ek7Dkdpjja1r7kTmbfxm1Qj5rT3P8YPyLi?=
 =?us-ascii?Q?tmVy6TEL/n1D+ufc/oepvOAspksfpkGUCst3BswQSdwwzgH/nmQbEmm6hj64?=
 =?us-ascii?Q?d+j5db9nYPjScrNYLp8VKAXfqgxR3pgA7nGa141WN/ffaTDLbiG5Tw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 06:31:53.3437 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfe8a34-7906-4b24-7fbe-08dd2ee4f9d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6928
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yw1ocj0qoix7WSTcm0YfA9vIgLPmoPyqw2Dd9OD/7sw=;
 b=N4arx/mLx8u73RInS+cnLu3eBDgaXDGvIp3zR9ViDLJuv46/VzJYf7ArwHwCCT3ePhCwgfzC0cIqGzJ/dqvaMlIn65gsIi38sfGz7nNyfklL9SuyZ4r40311BWgxTY5HqaBgVgRbu8EzBTxqJ2LbsIRBRLgh3Dv9tRQe43ENKX8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=N4arx/mL
Subject: [Buildroot] [PATCH v4 6/6] board/zynqmp/kria: update readme.txt
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch updates the documentation for Kria SOMs for reflashing
the new qspi.bin binary file.

The qspi.bin is a unified binary containing both the boot.bin and
u-boot.itb files for simplifying the reflashing process and also
enabling the BIRT for reflashing the qspi.bin image as either
"ImageA" or "ImageB".

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - new to patch series
V2->V4:
 - no changes
---
 board/zynqmp/kria/readme.txt | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/board/zynqmp/kria/readme.txt b/board/zynqmp/kria/readme.txt
index 7d3a520fde..6fd7ca61ca 100644
--- a/board/zynqmp/kria/readme.txt
+++ b/board/zynqmp/kria/readme.txt
@@ -42,6 +42,7 @@ After building, you should get a tree like this:
     +-- boot.bin
     +-- boot.vfat
     +-- Image
+    +-- qspi.bin
     +-- rootfs.ext2
     +-- rootfs.ext4 -> rootfs.ext2
     +-- sdcard.img
@@ -80,39 +81,28 @@ easier.
 Instructions for using these utilities to update the files
 in QSPI flash can be found on the wiki link below.
 
-https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM#Boot-Firmware-Updates
+Please note that since the BIRT utility requires a single file
+for flashing, the qspi.bin should be used as either ImageA or
+ImageB.  The qspi.bin is a unified binary containing both the
+boot.bin and u-boot.itb files in a single binary.
+
+https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+SOMs+Starter+Kits#Boot-FW-Update-Process
 
 Additionally, it is possible to use u-boot for updating the
-QSPI with new boot.bin and u-boot.itb images with the u-boot
-commands below.
+QSPI with new qspi.bin image with the u-boot commands below.
 
 KV260 Flashing Instructions:
-Flashing u-boot.itb:
-    $ sf probe
-    $ fatload mmc 1 0x1000000 u-boot.itb
-    $ sf erase 0x280000 +$filesize
-    $ sf write 0x1000000 0x280000 $filesize
-
-Flashing boot.bin:
     $ sf probe
-    $ fatload mmc 1 0x1000000 boot.bin
+    $ fatload mmc 1 0x1000000 qspi.bin
     $ sf erase 0x200000 +$filesize
     $ sf write 0x1000000 0x200000 $filesize
 
 KD240 / KR260 Flashing Instructions:
-Flashing u-boot.itb:
-    $ usb start
-    $ sf probe
-    $ fatload usb 0 0x1000000 u-boot.itb
-    $ sf erase 0x280000 +$filesize
-    $ sf write 0x1000000 0x280000 $filesize
-
-Flashing boot.bin:
     $ usb start
     $ sf probe
-    $ fatload usb 0 0x1000000 boot.bin
+    $ fatload usb 0 0x1000000 qspi.bin
     $ sf erase 0x200000 +$filesize
     $ sf write 0x1000000 0x200000 $filesize
 
 It is possible to boot the Buildroot generated SD card image without
-updating the QSPI boot.bin image, so this is an optional step.
+updating the QSPI qspi.bin image, so this is an optional step.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
