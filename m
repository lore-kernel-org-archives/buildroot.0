Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6109EE77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 10:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26D76417D1;
	Fri, 20 Dec 2024 10:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DPOuyYLK51DW; Fri, 20 Dec 2024 10:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A752441814
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A752441814;
	Fri, 20 Dec 2024 10:36:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A1EA920
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 10:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68EDA83BA1
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 10:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtnHH6mET-hZ for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 10:35:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::61a;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67F9E83B9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67F9E83B9A
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::61a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67F9E83B9A
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 10:35:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SK4kZ8Whlm4QGIuRhwzCiq/nU7OS1Na6jCqyojXWSPAhIdTlOpOCUQiwpDr7p81+jh/MWEzXgrYDhtPqn7u11HHNPxSStqlTH/E3v5VSwWr/lMSigoX3nXepFmLM/gyaxK82yGUR3QSPFrkGkS4eOfcqxYf+9OZJg9VvKI6Kv+97o8eicwBlLs8JGdCkHfOhrAR4KxMUy0dkNhFQ95dNRvlMvFKb025zBBMoVyTfQXr2rATK6uKfuOEqL/1r/TVn1Mlc086V7pTc9vrm9Itnw7mMZdQ9CyX2GDCfguxCljbJaA+vXJFtUxYtI/L0Cg/QHYqqe8Ce5+mMUGqkJ2DXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4d7c0nB1Va009zCK0IE93Ol4Njr0tT/43SN3WbwiO8=;
 b=ykm4F+oXD/r9uZzC+wOfdbHwi+CXszV1MU3YB4PvZzx0v0X+4CO17fXimhMsGhiVS+YnhVFdMf74L00E2J1naaU3b+PVIYopRFhtqcdKTOFE7fHWWKQzEXOxAjvzmlCfH/zsNrtnBDSouGfU4gI9X5rgULQ5aIZewcBUkW5HteeTNmKiSDsq4Pcv7ZK1gSa6YnDoPWQWAAM2UG/qHm+pcsZwHBEaScuB470rWzcyDFOMngHgbS+kohZ71uU5jUCJFk0zVj6MWadpkV8cXaptU2iam6f+EuiDAYtK9e8+mzkloLQJiYKU40VjG4w2uOZV5Imt/YhjleR2b68FwY/COw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0632.namprd03.prod.outlook.com (2603:10b6:408:13b::7)
 by SJ1PR12MB6100.namprd12.prod.outlook.com (2603:10b6:a03:45d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 10:35:48 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:13b:cafe::21) by BN9PR03CA0632.outlook.office365.com
 (2603:10b6:408:13b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Fri,
 20 Dec 2024 10:35:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 10:35:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 04:35:45 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Dec 2024 04:35:44 -0600
From: Neal Frager <neal.frager@amd.com>
To: <buildroot@buildroot.org>
Date: Fri, 20 Dec 2024 10:35:23 +0000
Message-ID: <20241220103523.2301721-7-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220103523.2301721-1-neal.frager@amd.com>
References: <20241220103523.2301721-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|SJ1PR12MB6100:EE_
X-MS-Office365-Filtering-Correlation-Id: 44868c72-6816-47da-418c-08dd20e21017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EMPS6HL1CWxuKKhWF7sWUNHylFouqUQxeakWAcCdWXnGrnDs/eRWnze4Jw+U?=
 =?us-ascii?Q?S91/QQMH1WXLgEiRTsRlu3MwJDAESwkFxgfNZm4WyYRe6iau7cCJMrYb8mWu?=
 =?us-ascii?Q?BKUKUjmtdnH2U7Rxy3qUB3fxxuIXDAc8J4JEJvLO1YzrQfkgw+VP1Upx8FWa?=
 =?us-ascii?Q?lTIsjmeCiAZutlX73vjv/YqNMZU3iNS2Yq+CwPuufzs8a5BZAlMC++OeS71O?=
 =?us-ascii?Q?adNPN37JcTI3xz2s5fMYbuJBYUhbDiJSoYnSSbtCL87hyiWDJpx/WYEn6VoW?=
 =?us-ascii?Q?LGvTpTjKXZE7zfjDsEZzOvzT1N6Be1+o71ngG8ygLSFMSk6lPw6t3ooZ3R4G?=
 =?us-ascii?Q?d+4tQ2SAs/dBJwqzx8/JQh6n4VJmar0ab40RjmGUHS9QGSCvksxBVKFkZMgf?=
 =?us-ascii?Q?0PO5PD2Zh+hDBmcX57B04z4YDY9QIZQuHZ2KlI2KqcwEm+jTNrks2CRs8E6+?=
 =?us-ascii?Q?KKK+mNTcptzVl7jw1jsMZL51+y6rgQfzHp970Sm+HoGD5wFsDYSX5X1Pp+gy?=
 =?us-ascii?Q?Qft0WsmBCdaOlIk/drAjUI+5ny35mOaW5BrhmJ/kw5/2XiPJWvaFDZg9qaA1?=
 =?us-ascii?Q?MsNxsO1CALOhN6nwf8mfj3DfgFcfNas69Or6GniJM2RuX9tGDNrIwGOnuhbp?=
 =?us-ascii?Q?UmBVqV+VvJb2+ONASzNnLrZBaty/dR46kMWF+h6LfLIEd2wPOmtmffsUqMJ6?=
 =?us-ascii?Q?j8mB2i7oc4d9P+RhMD9xPrsgHaZ/tAB3103EI0mJZtnCT54l8kK67ms2DJAw?=
 =?us-ascii?Q?OdK7qEpRVfBFCrf7DWpJX1iLuqNqXD6QqwUeIq4cfontyOOZ4Q6ygFPO6CMb?=
 =?us-ascii?Q?VV+GOXVwp1ikm/zad9JhRzepWftQjqb5nonmPmZcs+tY2kp4ypW8g42xwn0c?=
 =?us-ascii?Q?PSu/g+dV1W0G1l+MZMt4I3uLEUwFc82uxkEDkpnXDMd1VTrwSAEf1ofy043l?=
 =?us-ascii?Q?fcOO+af7wZAMnDLQISPF+dDuAxvgs6BsmwODh2mCEJJDGcgmYV4bfwGN3hvt?=
 =?us-ascii?Q?YWCoLbPjDxkaklF1ifxE2Kth66KjyI2Qef4twWAAtrG7FjH6nRP27Wx2p/Vu?=
 =?us-ascii?Q?NiDyff4vrFJRb0M80oF24OD5+IR5W+lQV+ogwF/+ogZW3gGtIxk/Q7srvp8j?=
 =?us-ascii?Q?/jMu9l5/i25UxHVRQksW1GRJ+yyXA24NJ+3Bia2Vg369iSiWOvnq0+pQ9jDM?=
 =?us-ascii?Q?uhERrn/ZJksNUzF4crNKuDrfXLM76HWCueTfesL54o0CuaD/d28uzJEYtYUo?=
 =?us-ascii?Q?Y1Hge4uRHHr4NZCf+/p5X8kucOj/lkusUnlvkODyZmuaTjFrOj5nHEETHFju?=
 =?us-ascii?Q?txc+X6AUY63cp3/S1r10TD3wZWD/RO3fADDBZNrqq9U0tJmdInMBxmVu16jX?=
 =?us-ascii?Q?xMnMpcFezIB9Y5/pJvnwvb5OJv2eIoBfGANXw/y8z2Hos5CO77dIXwZSAGJL?=
 =?us-ascii?Q?KCwzvqkihCkHLiB8IualZVnK8wFA/vNfeLwwaq+6tPCCZBeJ3pbNPA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:35:46.0510 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44868c72-6816-47da-418c-08dd20e21017
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4d7c0nB1Va009zCK0IE93Ol4Njr0tT/43SN3WbwiO8=;
 b=h/CX66wS8x65M9NLszHugGt19SpCzIHBJ6j1Y9SGj8SUSLgx36sGGfgQobucAPM72/Q0kiBw2OxkN8XeUpODiV3kBKZGinXg8CyyxzlBegvH+SH8Bp4tGT96yhAH2wFLCSvy98Qfg8Dy7xrfFuHlGA4IxtxRIiUMULvEjh8dABU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=h/CX66wS
Subject: [Buildroot] [PATCH v2 7/7] board/zynqmp/kria: update readme.txt
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
