Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9639C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 22:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9503660B5B;
	Sat, 25 Jan 2025 22:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qobeRDy-JlOf; Sat, 25 Jan 2025 22:50:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEF9E60B46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEF9E60B46;
	Sat, 25 Jan 2025 22:50:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 444C1A6A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BF74408D8
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KjAX0TX9xyZu for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 22:49:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::60d;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 259F040882
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 259F040882
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::60d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 259F040882
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:49:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9ZyFCfnek3KxJRLWi734FJcvEY4YggQ7Obo1SOieUUxc0TCndspwj/igVPyTM5nHO6c7Nvv+wyRiRVAYFvxIoEq0K1qEtAr3U6qJJr3Jqze+9VVgAur4jMQTVqp+3B3GONjWtDI7BIXz+HgdOPfApvCg8NuNET6pdJMOCmOiHLKxzt7w6b6z0HzeMM1nd3P5L8EyQryyo/o7XoSRDyfFFxQ2mbroGdf2u7zevjkG3coXPUWDPyfUnfey42mVfoeDLFS7/8wFEOVRx/E9YjHOaUgYmxvE111FLcvJnW/eQQtywmQqmA4e90ASR0BV+EJqhElWYFdepdr2ZE5hVaX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8t3mLVPAz/lOagkkqffH4jEIEscLU4KYrIUS5gzDPLs=;
 b=Ho75sOrrtCtAynwbo6NkFoUWcUPhOd/8E/SQlclFNWx9y8MPTVTDfO9Q2XrhFG3IBNDXsPhMJSET4/xJoFFpxOaMT+VFbB/ZZiwKMqGRXgEQGraPyVfWIPBbJL+KtGa7BtDXvMSSSRtJ8KWLAK3mHgfUzk/7Wfc4YMugjndeRqg3vcZEyeqpj+JZoH2BLCbiMnbFJ5nNC16ew+AzSKt8Voulsp9Rdzf/vORmXLoBbf/zqH76DKug6ouKoqnPrac8YjkNmO3I/+AiNzAMkrSdTO3v+esBPTNsrV7REACoeISrIO0TlFIYYxJGyZ0gJGrKJwiRWRAaG3bwSWbTUt5nXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0116.namprd03.prod.outlook.com (2603:10b6:408:fd::31)
 by BL3PR12MB6572.namprd12.prod.outlook.com (2603:10b6:208:38f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Sat, 25 Jan
 2025 22:49:49 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::de) by BN9PR03CA0116.outlook.office365.com
 (2603:10b6:408:fd::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Sat,
 25 Jan 2025 22:49:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Sat, 25 Jan 2025 22:49:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 25 Jan
 2025 16:49:47 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 25 Jan 2025 16:49:46 -0600
To: <buildroot@buildroot.org>
Date: Sat, 25 Jan 2025 22:49:30 +0000
Message-ID: <20250125224930.3639111-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250125224930.3639111-1-neal.frager@amd.com>
References: <20250125224930.3639111-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|BL3PR12MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: af16f8b9-1684-4511-1274-08dd3d929281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DECfoS8n+c2WrUrnLo7AO5UyXKa/hZmFFDpXhS0x0sbBqpNoB9/KHVj+lJGB?=
 =?us-ascii?Q?P3UAGKb6W+SuamESnpyke7+9uD/WylyHKiB/xAr13jvEU3kFMM2kw3xUxHCQ?=
 =?us-ascii?Q?gU09TqtB3eqcLZharJpKCwRtlEh7TiYqLIfzl0r9tHetcgWM+s2hYiYT6JI1?=
 =?us-ascii?Q?jDKE/yVOhc+qxRPIEIZyUrfWLew5fcOvgIz+HxfxJE5LDZSvWpyYkOENUFOM?=
 =?us-ascii?Q?HypCOyduZKR7wNe6Icn7EK4zcEWd0nZNWiCn7xYLvfD7ZcyoHvXDScywy8zF?=
 =?us-ascii?Q?7hkiIhCy/UaEyVNdQSM8aPFGmnBn/HFrF7PIIu/tXh/P/yzt5NOzM5CWcOfy?=
 =?us-ascii?Q?cv1niTXbIQUTBaxjOeUYBsvjy0BDbusiTZezbZlATujszy5R9oH27QQyI1+n?=
 =?us-ascii?Q?kDk/ooxiOh0u5UtjZ2z9/oWHP++d3sPMm3Odto9yB8903d5VMi8ce2rLVxfA?=
 =?us-ascii?Q?jD9GuEQ2EOS85MaXO/T5c2Vk0XwRYiTusYJRNHKTLf2ETqrWrK5QqmlhDgwQ?=
 =?us-ascii?Q?Gsd6g8GCNCQ8oNXMUIgQqWU3x7dIS5q3Kju7NPZ1Ms6LRcqydfTc5gBbu3Lk?=
 =?us-ascii?Q?IKMpD5sdL48X5w2tSEKD2UQ+pG08tQr//jAwNFCAgTkrntKXxoKLIuDn6mvu?=
 =?us-ascii?Q?CATvfh6FjaV8ric/6pAHwPSRWqfKAtGsQ6wywMDUnmPjgdiYhvkjzARDsKnq?=
 =?us-ascii?Q?S3bqjMQd+pkIaRvEZ/nfVBmD1mA/GywplXRiBAC1ENXq2FkZqYh79MhCWtoN?=
 =?us-ascii?Q?L01kGqfZmIHOtv/BjN3MQ0cfFzykjSg3IqHhcUsJ6GrvXw13h5aI97n8dtAG?=
 =?us-ascii?Q?v5tig8DL+0vTrPRZzUJZAo4QTBtE8FwYLXo7KHiaeOg2fzsO6q91UIIYZzja?=
 =?us-ascii?Q?X7lUlwzKEo6neJuekx2d+z0F1HEflEZwWmlbWsE+E57ejofqTCxoyK3FbixN?=
 =?us-ascii?Q?7F4ifcmmj8NjzZG3wN/J71Os5FMKfcM8X4LoXPbUXEbaQVvmcNxbq6cvUWFU?=
 =?us-ascii?Q?DIPrvueOyAbfPOaw6qESkASnNmXScxqROodszdN5DWGh+hk2V+/YTETT3z/Z?=
 =?us-ascii?Q?mbFWjaY0Z8W9c6HJrBX6BEZBpKV0ZOUQvkADXHxAk6BG2IDD3ZbuaDwLEqo2?=
 =?us-ascii?Q?4F/9qw5iDSW+AuW2ZtSgRPFfWaVzvfYTPkl5vw5eeSLeTYbIFH2QLeIzArb2?=
 =?us-ascii?Q?C4FRcjOV0OWF93klUVPdwxk18wMcmuoeVxAzZTQCT0+dx+EGDtnveHmFO0eM?=
 =?us-ascii?Q?9TruXqzXD2qZVbMZw6gOavbNx0vcpByIlGeoiStMnDSgi1DP46hvQlSMhDya?=
 =?us-ascii?Q?El/u/lfL2CkHq+QG9+83926/ewNhXC+LwubZuBKtHEjz7fO3O52II+hYBxKR?=
 =?us-ascii?Q?x9ClCOEfkVAhmh0sk6J92K4nIsRZdAuzgsWTieq27vkKX9p4DzHeGn7M7oto?=
 =?us-ascii?Q?jUG4hXDAt+Z7TNK8ca3TN8BPlp3MdRRFN3K7ntI73ydAW8YrHdFcgA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2025 22:49:48.8305 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af16f8b9-1684-4511-1274-08dd3d929281
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6572
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8t3mLVPAz/lOagkkqffH4jEIEscLU4KYrIUS5gzDPLs=;
 b=339lijTxWI3m2ZwilYXzQ4GVowuzjT2uUuQVfb3wG2D10COhFl81hpvVKEzZhy3oALhflrqmM63pNqOX10XdJ9yi3za1g6YGG/WIbaSO5nV+95j9+LqUPI+wcKikLgutTa2v5D+3/yFisIe6n46Z+w4NxmWR2G9g6K0qoLVrlcs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=339lijTx
Subject: [Buildroot] [PATCH v6 6/6] board/zynqmp/kria: update readme.txt
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
V2->V6:
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
