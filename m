Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A0EE7718F
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 14:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5374860866;
	Sat, 28 Dec 2024 14:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uBHrBamuzfXZ; Sat, 28 Dec 2024 14:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8AA3606E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8AA3606E1;
	Sat, 28 Dec 2024 14:58:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EB68757
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FAC680B8C
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vgfaaIgOB1K for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 14:58:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::60c;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F320780B88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F320780B88
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::60c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F320780B88
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:58:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVgj3YA+PnDuXFIvtNhbXgLK6UvYXe72o0Dkncb2kPEPdc4nj5PZOgx7pGmNis/eivgvdPhEYmguhMWE9udMnrh9IkxzJ5e3Crg0aDSLt5gSHE41SFKtVgvR+sXg4wZf24vz6Lhagpds0XD6i04uC5Y9oalLKLhvWnXxOjP2hUqNKR7r5EVZxSCHT2OgZmohKvjMbCT7/xlAXgWIyP+vUzEmeKoTeCzV4nrUZvXvOuTNWudaAIM/qTKA6CV9qcdMwfWQZWSOOLX4LhQG37AAC3Wf5UwfIeeoRNSaJ9qrxkqFNwMwsJr/zjdzo4aWf38sIU+bAYAOKuRBftwQxv34pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zml6ph47lElsTFwqsPTe4dgUVplEzHsckyD6oNOgtxc=;
 b=lqALtKW9P59PZWfZd5++od/DZgu78fyAGms9jEXNs/z1FmNPKQTOr5zYlVqDHg8+Wmvr6aq1tzkVBbx2kPVDhsyImxDe7VxMj33k6u6Pw2eQk6ssvJBUWer2j/QUz4mOQ8k2n58SzF31WqbEZBNYqQhBd1+4nVxUg2+VTWozN8NtL/K2baf7Noid43ix4dEiCOCiFl6ZXh5lQ2rGMMU4PURr8qis96mOITbkqpcD/OgwoTR0Q4b7jenoXBAe/rJ5b2w6ejb3yVIWOaC92HOrQiaGIkvYbq181OgHW7Qo51seonM4VZ8bCk5eUHWpsrt+eOC0iTwtLdg7b6O+ac792A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR03CA0043.namprd03.prod.outlook.com (2603:10b6:5:100::20)
 by SJ0PR12MB5609.namprd12.prod.outlook.com (2603:10b6:a03:42c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Sat, 28 Dec
 2024 14:58:35 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:5:100:cafe::27) by DM6PR03CA0043.outlook.office365.com
 (2603:10b6:5:100::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.14 via Frontend Transport; Sat,
 28 Dec 2024 14:58:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Sat, 28 Dec 2024 14:58:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 28 Dec
 2024 08:58:33 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 28 Dec 2024 08:58:32 -0600
To: <buildroot@buildroot.org>
Date: Sat, 28 Dec 2024 14:58:18 +0000
Message-ID: <20241228145818.2211273-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241228145818.2211273-1-neal.frager@amd.com>
References: <20241228145818.2211273-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|SJ0PR12MB5609:EE_
X-MS-Office365-Filtering-Correlation-Id: 625d3b80-0117-442d-063d-08dd27501a56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fBYtkdtFH7YQLVv4t1v/4BlDosw4VItsNoSOGy59s2qZt9pffn1WVHcPpXEn?=
 =?us-ascii?Q?lntalL3x6572K6rIqdIQ1SUyBn3Nq1dOEgzNVove+JSqR6PluOanBWF3Dw+3?=
 =?us-ascii?Q?6n72ycMIi40OSx782XTDeg7/x51p+W/Ko0HLLfJIkKMdT0VqiwPDo6ntFmQ+?=
 =?us-ascii?Q?H0ClQD+CMeEcjYkfsJ1bYv/LlPbdJTP/VHrA9ilyFM+G9wXzO1wJB3CU2OuZ?=
 =?us-ascii?Q?mV0b6fM1Y/ZxW2plw4aMLo2A4HrtNWzvyWGbH5IQPRxA8sl7iy4pKRxyFtrH?=
 =?us-ascii?Q?daxCNJhJMRIKdia4JxbJxPXQAjmqJz7Mpew891hP1ePatrun8JmuTVfA/zo/?=
 =?us-ascii?Q?o31Qi0FBDPzfN9w7YynJ/6EQy82TC8EjVI6tYZnIn8O1VLaWD1T0LtGXL2Pe?=
 =?us-ascii?Q?o/dAEnh5SzwHZd2lnozQv6kLzWzZqsboCu3arVGOB3MP7uiNquCwkEde8cD+?=
 =?us-ascii?Q?j0rCXCRAinXaNtipTgiYr7P2KCZIinzlQAyn0dRE1h6EyWaWLYr0mQamcGcd?=
 =?us-ascii?Q?X5pbaSkyZayIJV4JIEicPV1RkcThJJJGkFGE1j3uobzrkXYOI30f9PgoVait?=
 =?us-ascii?Q?YJdjo5xxCjP7CfQ0l5/BfnEIqzMx+mZFsQijpffpKmGX7eXwEwtA/Q2NjdSk?=
 =?us-ascii?Q?+iLijIA26FpUnehJEnxpwIR+4POTx8nqmu9fIpA6L7mVFd6DSbApYTxgnIsZ?=
 =?us-ascii?Q?z1gLLro9JM/OIKUEe3K65TKMtZLGUSi669EeucQOFKIWLGb0g4Ta5hI2abEd?=
 =?us-ascii?Q?gY7mA4+DKGcNy0V73b0VmOnf2B8H1oD1EH6/BD005e4O/ZcI6zfowsi6ILPM?=
 =?us-ascii?Q?CpAwVOHPNpp1HJQKjJmk6pr1kiz5Wod6s4lISZF7syhZ+NQFhPuWabv+qyfs?=
 =?us-ascii?Q?pZND3w15dVAhL9YhUafKznLo74RfzHUJRU5BRjRhfzyqjLz2518JPDfQ7me0?=
 =?us-ascii?Q?Tte4yTTYMverYixWUnuEhylPyIBNSmRG/32LN8p9ueQAzMZORsRVNSYwzpTO?=
 =?us-ascii?Q?a1rau5oi1JH7Mw/T+F81xoYMGFBkz0fUvCDoQeFyC6WyKb7GiGgOERIcR7A0?=
 =?us-ascii?Q?cpf6crhKBmyejyM8t18T/doQ9yVDnnjGpXNhxuCBlH8fZ3QAxAK+jhmcYqlV?=
 =?us-ascii?Q?s/7X77mDGVcJ12K3D95r2HK+qEUdhLMF/osdLWt/qi9Q3NKoFsG1Nz/Aki2c?=
 =?us-ascii?Q?nC98zeoYnZLHSd5qBMMw1GFTfEA5/9VV1q11Hoi6vhObm/+HXBM6rQ5rITxT?=
 =?us-ascii?Q?7pLiBUyq+/ZW0JT/8YxfZBXfXzSg6Xhz1HksRVduS4LwqzzbKnJ2Zogxlngw?=
 =?us-ascii?Q?GRubyFF2mTqFNa8QBdT8hH9WCiHvMIWY+jmizFd9BJ+cJx7q/nw1SiBcimTg?=
 =?us-ascii?Q?8QO3SL0Ubd6wxxe9WvgHLnAFVFKt+QoCSXCR05nefkwIaanyv+HilltuA3Ah?=
 =?us-ascii?Q?t0nbBEBdB2KIqSCMldUhOQa6pc6oDAgkj56lFeUZRtQWA9tB+ZvhEw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2024 14:58:34.7471 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 625d3b80-0117-442d-063d-08dd27501a56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5609
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zml6ph47lElsTFwqsPTe4dgUVplEzHsckyD6oNOgtxc=;
 b=cnAPeoWGQX6D29iZI7866vaqxgJoQUsx1NP8Wgp0irZ5QmKGDy2PYc2mrTEZRaytJ1NORVVeZmoB6gAiqQRe7mc5QE05v7HxEd1t/x/lj68ji7b3O0/+KmIfmg3JdOT2RtEqQfBi3CWPbDbf/bGHS1JBHFRTcj1j+NZylZ0qNI4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=cnAPeoWG
Subject: [Buildroot] [PATCH v3 6/6] board/zynqmp/kria: update readme.txt
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
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
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
V2->V3:
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
