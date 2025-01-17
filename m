Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AE3C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 08:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E65CA6088D;
	Fri, 17 Jan 2025 08:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZApiYkwNudq; Fri, 17 Jan 2025 08:01:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E3106FAA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E3106FAA6;
	Fri, 17 Jan 2025 08:01:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA15B94B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7A06417C9
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJx-2BeCvKOS for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 08:00:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::613;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7398F417E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7398F417E1
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::613])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7398F417E1
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:00:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkRF+0f2Yw6C767uYJEUc4rEC3O+Do0UIMY7Z5PV36cPSJ1IFEmIzbNVbE1D2bZThlejsKDSDxGo9p504gZXDdUBmaMt0MDR9pmiTki5RSN3qyJl4D71L3kJyTIt03Odidt2IqpW2Fc521uTN6mm75xduIuIQ6sM+nQHKuXsawPJ7GU9mjJnSMmAT9KO7qPk/C1W4yJd4gkczuijY/mySfM6qMT+OzjO1EBi+fBP4sbrxBc2j5ZHd/ixdBhlsPfM9IUIVZkYGoAT4nWoovzeaevdno1sBdHeGxKgfXpVmnbTy/xqtZwTK/LIkp3xXm5LdaswbwNxnPpSbIpkjrUYjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zp11OZ9A85QH9llojCeBUPhsZzfjcBVBuYXEaw84l8=;
 b=JnULk309ynUpg6EOMcJuF071eeQUBTLbZzbCBxTs5gKpDpqNj6DRsmmTd4lVwt/Ms5TRz+sHHIFu0se/XeYu/0zqBAP9pZ2opd7cIAPaq2gFIyZyAnzUBwjdW2J9GxCZgjjsO6dFr7tZ+i8nelxOJKI8swEdy/ZAbma5vSHkA3VvAdw8wsW+jaziSAfFVZ5vLD+AYLG6JLa8Jr014gqS5dNnSUXvjQZ//5iS9cRILZHpaVXA4T2QKi0cqYClKUglc7AC7cc9sb/vLXqTbENIAPUExAmZDaFNc4MbwRdT/RUCD9XEQ5rZznkUy7qzl2f9+AS3gzkN15ZBsDazofUSlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0126.namprd03.prod.outlook.com (2603:10b6:303:8c::11)
 by DM4PR12MB5747.namprd12.prod.outlook.com (2603:10b6:8:5e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 08:00:27 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:303:8c:cafe::9d) by MW4PR03CA0126.outlook.office365.com
 (2603:10b6:303:8c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.14 via Frontend Transport; Fri,
 17 Jan 2025 08:00:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Fri, 17 Jan 2025 08:00:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 17 Jan
 2025 02:00:23 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 17 Jan 2025 02:00:22 -0600
To: <buildroot@buildroot.org>
Date: Fri, 17 Jan 2025 08:00:09 +0000
Message-ID: <20250117080009.774814-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250117080009.774814-1-neal.frager@amd.com>
References: <20250117080009.774814-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|DM4PR12MB5747:EE_
X-MS-Office365-Filtering-Correlation-Id: caaaa669-0597-45c6-4b89-08dd36cd00ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KPVHqdiKW15Lc5daXPunu5CKJHCGNlI98NqmZo66rammS5hMsQtaJ1Wq4KGl?=
 =?us-ascii?Q?ManGgm62Iu4BkJwSCLlYuInW2mB0zUAiZvFjlFIgutEiBbUcBF88H/CoSOL9?=
 =?us-ascii?Q?qmFgAoEN98F30kXpD+oG1kDCq+UzEyw3A8QBOM+qzJ53+igM1sNojHmqWtOL?=
 =?us-ascii?Q?UirBpQVBXJl+Z1Y0v8Yqo5mQNFWjwdm05ghpwWzqim6hwp7T1QUpHwgT9xas?=
 =?us-ascii?Q?homvFgQNK7S77D5aLiviOvvXlrrBlulGRUVSZhphqxhqjB23LOt15ZP2zpi1?=
 =?us-ascii?Q?k4YXrZ1YtJtcpmQsQvXhviHMRp1aiNMjG9PqD1mQHVLTOJx1eBV9mc+Ze/OW?=
 =?us-ascii?Q?5C43D9J9ICuNtuSaSU8IteTK+yPiT3C7nUABgL6pYK7KmdvDr67X/hYKIF9/?=
 =?us-ascii?Q?ihxeqHv/4nZtsxeHEuOhAgfC4f12eyRIzbSgNlJQiXlpD7FiBvHsTxHU71js?=
 =?us-ascii?Q?LcEyrMllEriZV77uKefm4T22GQ/w9U8+tWekDOwKLMYrvzHsK9sMAY+IsTrl?=
 =?us-ascii?Q?dnpDcYo4/L2/b92JV7xkhYN2NqA6CCFs9LCsxiNaNRA77HoG6AXyXqMGt/8y?=
 =?us-ascii?Q?QjBzIn8nZiM4s3kx2ClMF/gTJsZqO2qaf6aanQejpceXf6ubIBfIyGmYdU3Z?=
 =?us-ascii?Q?uSZMPpa4Iq0GNaKsNXO6T4RdFo/V5VRDL2oaAjOuJCMLc1XYDGNS3uz8n8u3?=
 =?us-ascii?Q?9mNaW5vOd+m0All/S6oy9DQibw4WIsiAHaWWjlgCskgkRrbDS9sZsVEsWkGj?=
 =?us-ascii?Q?WdjajHEd58qGXnbQ9QmG7M2mcg2rv+6rssWK01D+w/O9l48XTvbIa9Cp8vvW?=
 =?us-ascii?Q?hOj9RfL3in6l6jB7+qIYdjSC/NZFYQ6ZGwfsxXFlAyPcfksgOczLUcN2GRWr?=
 =?us-ascii?Q?jSwf4wA+nlcfHlKGTB0uF8SXWZ0oWxbNwW+Ha+FE2ON1hOAaOAyDp3F+S6NH?=
 =?us-ascii?Q?cz9yIb+dRoe7BDVFy8PvPrrscj2iSlDvtdrxAJ0Fi4tOLiCHt5bqDuWGnslq?=
 =?us-ascii?Q?Njb7XNUZ0sFOjaBSVNkPk3+Wj/2Ia0MjHMFv8knETnui5uIeM44i1G9T+gkJ?=
 =?us-ascii?Q?zAEtSYE43ZaK3wROAYxk4SGHTKzsd/tGc025WYZTTCzdJrK8Kqwve7zAgIkp?=
 =?us-ascii?Q?z+amiIyyDP/W349oqBJO1pKGsZZB4oMyScxgHT3S/hB3xRVr75ihye5Pj3Fj?=
 =?us-ascii?Q?bHtO5+nfrJr0ehJr7YEISAM2a273Z5oen1g3EZ3byzHS90Z1spkRXoMaec/i?=
 =?us-ascii?Q?+eeKOilhvd9W2rEN9kfvjKLfVNnq+QgOfR66myX5UTTN8kwCFE+brE4uYCEs?=
 =?us-ascii?Q?dusXoO+ldd+jd0nIAv9RqoLSrXrO6HHFdDIzZySRTZaoiLm5DAERSM6ZdgYl?=
 =?us-ascii?Q?v4W8fmxisLKj6DQuvp9RXZQh/A6yzKrQlpQQ8H4AnvkxzsobTzk8ETsfZhrh?=
 =?us-ascii?Q?G1HccR76E4G8H//TTm8lHJH8qYiJtbhHz0Th7MCGFd+sVMTu9gQzQA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 08:00:26.6662 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caaaa669-0597-45c6-4b89-08dd36cd00ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5747
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zp11OZ9A85QH9llojCeBUPhsZzfjcBVBuYXEaw84l8=;
 b=HQieRJnO4imVJQ7DGl7hUAAgl67QIxlmAneX9strY7AT9USNZlxg4YPWI6lAumq914RGQVvFfuRiUXwTRAcqqKnavrKggdIluy3sqKDElDa0mAP+SiWljokHj/aSyUl91GKS4kfVTk/TCUqXXmiJZUtRvNvJhCc2XVdqhxX35fM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=HQieRJnO
Subject: [Buildroot] [PATCH v5 6/6] board/zynqmp/kria: update readme.txt
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
V2->V5:
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
