Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB7CC25B7E
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 06:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13DB140342;
	Tue,  4 Jun 2024 06:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z11LbG674UaY; Tue,  4 Jun 2024 06:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9E8A4060D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9E8A4060D;
	Tue,  4 Jun 2024 06:51:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 817551BF2FF
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 06:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C3B940912
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 06:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ci79lXhyaCId for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 06:51:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::614;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D8B3D40342
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8B3D40342
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::614])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8B3D40342
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 06:51:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbp0kGigwybRUqdb7R259rJIlOnMtAUUm/oTsDOYBww4mZzQfLEaabK/ETfnZEyO/bYAggwzB/XcMOS93AtHtq73dIlq0p5tjjUCEO9eLEFPWKPIUWJRhXU/E4X0UHhtKqby5LjOF8MM8xBq/xQCD24EWCiSLOJe2NhLHuCkQHgRpGMydgcX875FSUUCKKZ84u+PGl0coKT163GeZKThIgl0byu4PVMDDbijoVsJHetSEx9dFry2RWrA6gwGlAa3VreezXmscZbiN8Nkvxjx7EzPBDNPFkDx4xSMzHfsfyQ2skBFXUIiWahyH8kKC6oawz0galHyTXFouenbPcceIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npAB6EUTMoSmX25vDwY9CL3G5dAYbrG+IybeSSYXYkY=;
 b=hUXHf9sMvoS5TETpFj75kFNDsialosD1p0iHkCmjpQ4d64sw7i7k1JVWLuyZ5lAuHNXfnAZ3hT8DGJnE8H39xx28pV5DUIFoxZDWWZJ1wBdli63ZvX4tJqN0V2WgRH8wunEKWRntwj/NRjh6N3THo5WxzuVV+FFwAczDcvE37ekJmeEDG6XSw1buVbI/l9TTlB/cRS9W0jlrDAE9nnlITJlq3ke1skGIEIfy3RGdHbSL4MKs63bPeNjMXBE937WFsYLpchjx6+XXGVABfiAnv7IEg5U4VkETOyVr+/oYRQYDSuUhuMbtB/GFxdsyWqb8b8vpqsQdvqFwZ0bnxxx9RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN0PR08CA0014.namprd08.prod.outlook.com (2603:10b6:408:142::23)
 by CH0PR12MB8461.namprd12.prod.outlook.com (2603:10b6:610:183::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 06:51:15 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:142:cafe::61) by BN0PR08CA0014.outlook.office365.com
 (2603:10b6:408:142::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30 via Frontend
 Transport; Tue, 4 Jun 2024 06:51:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 06:51:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 4 Jun
 2024 01:51:13 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 4 Jun 2024 01:51:12 -0500
To: <buildroot@buildroot.org>
Date: Tue, 4 Jun 2024 07:51:04 +0100
Message-ID: <20240604065104.1458035-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|CH0PR12MB8461:EE_
X-MS-Office365-Filtering-Correlation-Id: 013ddd14-36db-4da9-9d3e-08dc8462b9f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|376005|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5y3jiRsPTHJwgaZiRU83mFrVBtkFIvVJc6J6KtVDC1OsqAIzs5n0y27jeGFK?=
 =?us-ascii?Q?2JTo68u10HVGbOOFtNXNIjbsUbFi8i/rOsgFhXfMmg3wYwL1qRuCVpt54ICI?=
 =?us-ascii?Q?Cs35z1sFpneVL5ffi0RgM+wVK4s0OU3mzgykGuECOX+tk3mhxmhIWki9rcT/?=
 =?us-ascii?Q?IgfN0eosBekhGesMEHGy+I/swQi8vrLBYLc5GNaWLj6YD6N4Xi/wFMvMR+bI?=
 =?us-ascii?Q?q8LfEQpTecJ4z/iwP7Vjc5i6rijVi/YX2OEoal6YZwzyF9DnA4l4hbhsZadY?=
 =?us-ascii?Q?fGmKXwWicDOpJ6eeMdmSvIZx55NtasWoiM1lhvnfS3hxFxPI579NAI62LVAa?=
 =?us-ascii?Q?twFVPozOAk6FUonqPNdRH52EGxVqEf26Rzqg9LVDObnpySuiiiB1G98NJewW?=
 =?us-ascii?Q?3YqUKXLqtqdrtOWb9/J1A7l17FkQB/tDQ02jiCnR0RCQ0l65ngMZjLMCKFrS?=
 =?us-ascii?Q?g/hc9oltOV6sG5xsdsw6pcmkvTM3j5hyTNe+7nMSVO4qtrDI9i7+Tl1OU0Dx?=
 =?us-ascii?Q?6RfWex5/flYuyMsK5pYuIAUSfXwg/ibjuCQHBB4K1n90ULm55ulGFJFaSoBj?=
 =?us-ascii?Q?hAGU4jCptdz7EReI+spQqSJktewogR+JyMQtg2r/M5rbQ3crUUk9YmX+t0sF?=
 =?us-ascii?Q?LqSwtYZELHKW44U+KJdXdB8DlWFM28PaXqIs8j9DuvNNA0Lv8wApnomWe88x?=
 =?us-ascii?Q?t2eDOkfjq3pHYn3RI53FY/dgn0nO3+AP+4vrvZKHY0v/O5eK41y5EmySiZOj?=
 =?us-ascii?Q?SG51AI45DzCpvaZW90smP1G9Qgys6u1sVjFtvupy12+uAvyel6ojCjJu6y0X?=
 =?us-ascii?Q?y9Lt8LGDkQ10+3Y9HYH1lOvQQB9Nq4d2eqHp3V9IkK7OyAVIXd+dQZBKtMsA?=
 =?us-ascii?Q?mhLTqqhQvuc5Hs9Y8uDZ3bXSS1zcDKXUq9P1lHVD0jd4LjQeaiu2V25vCSUD?=
 =?us-ascii?Q?Ab4aQwiFc/6OvrHC1DLDgobxlvu0AuV0twZbwyc1n9dXtwYHZoGWKRtArhMD?=
 =?us-ascii?Q?exZQcf85IFPb13cvPk8XkadVpJmdoEEir80UCQAWGMuIkCCkoREEH/P6EspC?=
 =?us-ascii?Q?8YLvvXwqAZdoJvnWwdZfffMtH1syxnnrDjCMk9u2Z18LNXs+GgicU3YsL8eJ?=
 =?us-ascii?Q?i2/CBev7ZSYZN33k6k74GT7HoHsv7pv7cm44tqY5cZHY+4rwc3/6ffpoxTR3?=
 =?us-ascii?Q?2kfrthPV2Vsc2mbILRsJ92Y5T2B/5gdHczfTlSlG3jwLl7n5nx2Z2476ln7T?=
 =?us-ascii?Q?okUGiZgJtF+j2XPpB9cui1//V4aFgFztfV5CZeuH9v+2S/rUzITDCEzpyWfc?=
 =?us-ascii?Q?Ki5j7hnv3qfW9RJy/I3xSo/0QnsxRvQll8qyuECyDMOl5g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 06:51:14.0514 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 013ddd14-36db-4da9-9d3e-08dc8462b9f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8461
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npAB6EUTMoSmX25vDwY9CL3G5dAYbrG+IybeSSYXYkY=;
 b=nBlLCOaC9zczfcIGSyXm0HoZlkR1f/A3v1mZ4djek67DkqIRBwLIOrFVch1R7G4/W9NcEQ2Xra/9TDuyXsHQ2fMiqZ2s8858hy8Rb6eDIsZMjFhEOLQ031vwbY4AqKP0j1v/KJQYHZuYnyfKrkbvx/iEgfzyC7UqcqSOZ2VjQCM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nBlLCOaC
Subject: [Buildroot] [PATCH v2 1/1] configs/zynqmp_kria_kd240_defconfig:
 bump to xilinx-v2024.1
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
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynqmp_kria_kd240_defconfig to xilinx-v2024.1 which includes
the following updates:

- Linux v6.6.10
- U-Boot v2024.01
- ATF v2.10
- PMUFW xilinx-v2024.1

Migrated u-boot to xilinx_zynqmp_kria_defconfig, so uboot.fragment no longer
needed.

With u-boot 2024.1, CONFIG_SYS_SPI_U_BOOT_OFFS has a new meaning. It is now
the offset between the base address of the boot.bin and u-boot.itb instead of
a raw base address of u-boot.itb. This allows for A/B firmware updates since
the u-boot.itb is set by default to a 0x80000 offset of the boot.bin.

Thus, Kria SOMs come with the following QSPI address table.

Partition A:
0x200000 - boot.bin
0x280000 - u-boot.itb

Partition B:
0xF80000 - boot.bin
0x1000000 - u-boot.itb

In addition, the kd240 still requires a board specific patch for the usb to sd
card bridge device.  Without the board specific patch in the
./board/zynqmp/kria/kd240/patches directory, the usb will not come up correctly
and u-boot will not be able to find the sd card containing the Linux kernel and
file system.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- Removed numbers from patch and added Upstream link
---
 ...rm64-zynqmp-Enable-usb3-for-k24-som.patch} | 264 ++++++++----------
 ...ynqmp-Add-output-enable-pins-to-SOMs.patch |  79 ------
 configs/zynqmp_kria_kd240_defconfig           |  15 +-
 3 files changed, 122 insertions(+), 236 deletions(-)
 rename board/zynqmp/kria/kd240/patches/uboot/{0001-arm64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch => 0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch} (52%)
 delete mode 100644 board/zynqmp/kria/kd240/patches/uboot/0002-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch

diff --git a/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch b/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch
similarity index 52%
rename from board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch
rename to board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch
index f088b90f52..6a72285fef 100644
--- a/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch
+++ b/board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Enable-usb3-for-k24-som.patch
@@ -1,23 +1,29 @@
-From f8cba630d3fccd901164dec7bd9b60442bab8995 Mon Sep 17 00:00:00 2001
+From 62585d116c1ee7c91db12cc6852e1bc6a12abdad Mon Sep 17 00:00:00 2001
 From: Neal Frager <neal.frager@amd.com>
-Date: Wed, 13 Dec 2023 12:53:29 +0000
-Subject: [PATCH] arm64: zynqmp: Fix k24 psu_init_gpl.c clocking
+Date: Fri, 15 Dec 2023 07:36:47 +0000
+Subject: [PATCH] arm64: zynqmp: Enable usb3 for k24 som
 
-This patch corrects the k24 som clocking configuration such that the serdes
-clocks are correctly enabled and the usb0 is configured to use the psgtr
-refclk2 for usb3 mode.
+Currently, the u-boot zynqmp psgtr driver is not connected to the usb dwc3
+driver.  Without this, the only way for u-boot to be able to use usb3 is if
+the psgtr serdes clocking is already enabled in the psu_init_gpl.c.  This
+patch enables the psgtr serdes for usb3 use, so the u-boot dwc3 driver will
+work properly on boards based on the k24 som.
 
-This patch also corrects the configuration of mio pins mio76 and mio77
-which should be configured as gpio pins.
+In addition, this patch correctly configures mio76 and mio77 as gpio pins
+which are used as reset gpio pins on the kd240 starter kit.
+
+This patch is needed for enabling u-boot to load an OS on the kd240
+starter kit by either usb3 or the sd card interface connected over the usb3
+to sd card bridge.
 
 Signed-off-by: Neal Frager <neal.frager@amd.com>
-Upstream: https://patchwork.ozlabs.org/project/uboot/patch/20231213134007.2818069-1-neal.frager@amd.com/
+Upstream: https://patchwork.ozlabs.org/project/uboot/patch/20231215074012.483465-1-neal.frager@amd.com/
 ---
- .../zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c  | 266 +++++++++++++-----
- 1 file changed, 200 insertions(+), 66 deletions(-)
+ .../zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c  | 283 +++++++++++++++++-
+ 1 file changed, 270 insertions(+), 13 deletions(-)
 
 diff --git a/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c b/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
-index 45102302dc..4c904c6c81 100644
+index 166e61431b..591f093752 100644
 --- a/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
 +++ b/board/xilinx/zynqmp/zynqmp-sm-k24-revA/psu_init_gpl.c
 @@ -72,6 +72,18 @@ static void dpll_prog(int div2, int ddr_pll_fbdiv, int d_lock_dly,
@@ -39,41 +45,6 @@ index 45102302dc..4c904c6c81 100644
  static unsigned long psu_pll_init_data(void)
  {
  	psu_mask_write(0xFF5E0034, 0xFE7FEDEFU, 0x7E4B0C62U);
-@@ -490,20 +502,20 @@ static unsigned long psu_mio_init_data(void)
- 	psu_mask_write(0xFF18008C, 0x000000FEU, 0x00000000U);
- 	psu_mask_write(0xFF180090, 0x000000FEU, 0x000000C0U);
- 	psu_mask_write(0xFF180094, 0x000000FEU, 0x000000C0U);
--	psu_mask_write(0xFF180098, 0x000000FEU, 0x00000000U);
--	psu_mask_write(0xFF18009C, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800A0, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800A4, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800A8, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800AC, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800B0, 0x000000FEU, 0x00000000U);
--	psu_mask_write(0xFF1800B4, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800B8, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800BC, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800C0, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800C4, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800C8, 0x000000FEU, 0x00000010U);
--	psu_mask_write(0xFF1800CC, 0x000000FEU, 0x00000010U);
-+	psu_mask_write(0xFF180098, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF18009C, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800A0, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800A4, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800A8, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800AC, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800B0, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800B4, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800B8, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800BC, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800C0, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800C4, 0x000000FEU, 0x00000002U);
-+	psu_mask_write(0xFF1800C8, 0x000000FEU, 0x00000080U);
-+	psu_mask_write(0xFF1800CC, 0x000000FEU, 0x00000080U);
- 	psu_mask_write(0xFF1800D0, 0x000000FEU, 0x00000004U);
- 	psu_mask_write(0xFF1800D4, 0x000000FEU, 0x00000004U);
- 	psu_mask_write(0xFF1800D8, 0x000000FEU, 0x00000004U);
 @@ -528,8 +540,8 @@ static unsigned long psu_mio_init_data(void)
  	psu_mask_write(0xFF180124, 0x000000FEU, 0x00000002U);
  	psu_mask_write(0xFF180128, 0x000000FEU, 0x00000002U);
@@ -85,33 +56,6 @@ index 45102302dc..4c904c6c81 100644
  	psu_mask_write(0xFF180204, 0xFFFFFFFFU, 0x50000000U);
  	psu_mask_write(0xFF180208, 0xFFFFFFFFU, 0x00B02020U);
  	psu_mask_write(0xFF18020C, 0x00003FFFU, 0x00000FC0U);
-@@ -539,18 +551,18 @@ static unsigned long psu_mio_init_data(void)
- 	psu_mask_write(0xFF180144, 0x03FFFFFFU, 0x03FFFFFFU);
- 	psu_mask_write(0xFF180148, 0x03FFFFFFU, 0x03FFFFFFU);
- 	psu_mask_write(0xFF18014C, 0x03FFFFFFU, 0x03FFFFFFU);
--	psu_mask_write(0xFF180154, 0x03FFFFFFU, 0x00080814U);
-+	psu_mask_write(0xFF180154, 0x03FFFFFFU, 0x00FC0814U);
- 	psu_mask_write(0xFF180158, 0x03FFFFFFU, 0x03FFFFFFU);
- 	psu_mask_write(0xFF18015C, 0x03FFFFFFU, 0x00000000U);
--	psu_mask_write(0xFF180160, 0x03FFFFFFU, 0x03FFFFFFU);
--	psu_mask_write(0xFF180164, 0x03FFFFFFU, 0x03FFFFFFU);
--	psu_mask_write(0xFF180168, 0x03FFFFFFU, 0x03F7F7EBU);
--	psu_mask_write(0xFF180170, 0x03FFFFFFU, 0x00FC000BU);
-+	psu_mask_write(0xFF180160, 0x0387FFFFU, 0x0387FFFFU);
-+	psu_mask_write(0xFF180164, 0x03FFFFFFU, 0x03FFF87FU);
-+	psu_mask_write(0xFF180168, 0x03FFFFFFU, 0x0303F7EBU);
-+	psu_mask_write(0xFF180170, 0x03FFFFFFU, 0x0004400BU);
- 	psu_mask_write(0xFF180174, 0x03FFFFFFU, 0x03FFFFFFU);
- 	psu_mask_write(0xFF180178, 0x03FFFFFFU, 0x00000000U);
--	psu_mask_write(0xFF18017C, 0x0357FFFFU, 0x0357FFFFU);
--	psu_mask_write(0xFF180180, 0x03FFFFFFU, 0x0357FFFFU);
--	psu_mask_write(0xFF180184, 0x03FFFFFFU, 0x0303FFF4U);
-+	psu_mask_write(0xFF18017C, 0x03FFFFFFU, 0x03FFFFFFU);
-+	psu_mask_write(0xFF180180, 0x03FFFFFFU, 0x03FFFFFFU);
-+	psu_mask_write(0xFF180184, 0x03FFFFFFU, 0x03FBBFF4U);
- 	psu_mask_write(0xFF180200, 0x0000000FU, 0x00000000U);
- 
- 	return 1;
 @@ -569,21 +581,16 @@ static unsigned long psu_peripherals_init_data(void)
  	psu_mask_write(0xFD1A0100, 0x0001807CU, 0x00000000U);
  	psu_mask_write(0xFF5E0238, 0x001A0000U, 0x00000000U);
@@ -137,7 +81,7 @@ index 45102302dc..4c904c6c81 100644
  	psu_mask_write(0xFF5E0238, 0x00040000U, 0x00000000U);
  	psu_mask_write(0xFF4B0024, 0x000000FFU, 0x000000FFU);
  	psu_mask_write(0xFFCA5000, 0x00001FFFU, 0x00000000U);
-@@ -591,40 +598,26 @@ static unsigned long psu_peripherals_init_data(void)
+@@ -591,13 +598,111 @@ static unsigned long psu_peripherals_init_data(void)
  	psu_mask_write(0xFFA60040, 0x80000000U, 0x80000000U);
  	psu_mask_write(0xFF260020, 0xFFFFFFFFU, 0x05F5DD18U);
  	psu_mask_write(0xFF260000, 0x00000001U, 0x00000001U);
@@ -153,84 +97,106 @@ index 45102302dc..4c904c6c81 100644
  	mask_delay(5);
 -	psu_mask_write(0xFF5E0250, 0x00000F0FU, 0x00000202U);
 +	psu_mask_write(0xFF0A0014, 0x03FF03FFU, 0x02FF0100U);
- 
- 	return 1;
- }
- 
- static unsigned long psu_serdes_init_data(void)
- {
--	psu_mask_write(0xFD410000, 0x0000001FU, 0x00000009U);
--	psu_mask_write(0xFD410004, 0x0000001FU, 0x00000009U);
- 	psu_mask_write(0xFD410008, 0x0000001FU, 0x00000008U);
--	psu_mask_write(0xFD402860, 0x00000080U, 0x00000080U);
--	psu_mask_write(0xFD402864, 0x00000081U, 0x00000001U);
--	psu_mask_write(0xFD402868, 0x00000082U, 0x00000002U);
++
++	return 1;
++}
++
++static unsigned long psu_serdes_init_data(void)
++{
++	psu_mask_write(0xFD410008, 0x0000001FU, 0x00000008U);
 +	psu_mask_write(0xFD402868, 0x00000080U, 0x00000080U);
- 	psu_mask_write(0xFD40A094, 0x00000010U, 0x00000010U);
- 	psu_mask_write(0xFD40A368, 0x000000FFU, 0x00000038U);
- 	psu_mask_write(0xFD40A36C, 0x00000007U, 0x00000003U);
--	psu_mask_write(0xFD402368, 0x000000FFU, 0x00000058U);
--	psu_mask_write(0xFD40236C, 0x00000007U, 0x00000003U);
--	psu_mask_write(0xFD406368, 0x000000FFU, 0x00000058U);
--	psu_mask_write(0xFD40636C, 0x00000007U, 0x00000003U);
--	psu_mask_write(0xFD402370, 0x000000FFU, 0x0000007CU);
--	psu_mask_write(0xFD402374, 0x000000FFU, 0x00000033U);
--	psu_mask_write(0xFD402378, 0x000000FFU, 0x00000002U);
--	psu_mask_write(0xFD40237C, 0x00000033U, 0x00000030U);
--	psu_mask_write(0xFD406370, 0x000000FFU, 0x0000007CU);
--	psu_mask_write(0xFD406374, 0x000000FFU, 0x00000033U);
--	psu_mask_write(0xFD406378, 0x000000FFU, 0x00000002U);
--	psu_mask_write(0xFD40637C, 0x00000033U, 0x00000030U);
- 	psu_mask_write(0xFD40A370, 0x000000FFU, 0x000000F4U);
- 	psu_mask_write(0xFD40A374, 0x000000FFU, 0x00000031U);
- 	psu_mask_write(0xFD40A378, 0x000000FFU, 0x00000002U);
-@@ -678,18 +671,8 @@ static unsigned long psu_serdes_init_data(void)
- 	psu_mask_write(0xFD409978, 0x00000010U, 0x00000010U);
- 	psu_mask_write(0xFD40D978, 0x00000010U, 0x00000010U);
- 
--	serdes_illcalib(0, 0, 3, 0, 4, 0, 4, 0);
--	psu_mask_write(0xFD410010, 0x00000077U, 0x00000044U);
++	psu_mask_write(0xFD40A094, 0x00000010U, 0x00000010U);
++	psu_mask_write(0xFD40A368, 0x000000FFU, 0x00000038U);
++	psu_mask_write(0xFD40A36C, 0x00000007U, 0x00000003U);
++	psu_mask_write(0xFD40A370, 0x000000FFU, 0x000000F4U);
++	psu_mask_write(0xFD40A374, 0x000000FFU, 0x00000031U);
++	psu_mask_write(0xFD40A378, 0x000000FFU, 0x00000002U);
++	psu_mask_write(0xFD40A37C, 0x00000033U, 0x00000030U);
++	psu_mask_write(0xFD40906C, 0x00000003U, 0x00000003U);
++	psu_mask_write(0xFD4080F4, 0x00000003U, 0x00000003U);
++	psu_mask_write(0xFD4090CC, 0x00000020U, 0x00000020U);
++	psu_mask_write(0xFD401074, 0x00000010U, 0x00000010U);
++	psu_mask_write(0xFD405074, 0x00000010U, 0x00000010U);
++	psu_mask_write(0xFD409074, 0x00000010U, 0x00000010U);
++	psu_mask_write(0xFD40D074, 0x00000010U, 0x00000010U);
++	psu_mask_write(0xFD401994, 0x00000007U, 0x00000007U);
++	psu_mask_write(0xFD405994, 0x00000007U, 0x00000007U);
++	psu_mask_write(0xFD40989C, 0x00000080U, 0x00000080U);
++	psu_mask_write(0xFD4098F8, 0x000000FFU, 0x0000001AU);
++	psu_mask_write(0xFD4098FC, 0x000000FFU, 0x0000001AU);
++	psu_mask_write(0xFD409990, 0x000000FFU, 0x00000010U);
++	psu_mask_write(0xFD409924, 0x000000FFU, 0x000000FEU);
++	psu_mask_write(0xFD409928, 0x000000FFU, 0x00000000U);
++	psu_mask_write(0xFD409900, 0x000000FFU, 0x0000001AU);
++	psu_mask_write(0xFD40992C, 0x000000FFU, 0x00000000U);
++	psu_mask_write(0xFD409980, 0x000000FFU, 0x000000FFU);
++	psu_mask_write(0xFD409914, 0x000000FFU, 0x000000F7U);
++	psu_mask_write(0xFD409918, 0x00000001U, 0x00000001U);
++	psu_mask_write(0xFD409940, 0x000000FFU, 0x000000F7U);
++	psu_mask_write(0xFD409944, 0x00000001U, 0x00000001U);
++	psu_mask_write(0xFD409994, 0x00000007U, 0x00000007U);
++	psu_mask_write(0xFD40D994, 0x00000007U, 0x00000007U);
++	psu_mask_write(0xFD40107C, 0x0000000FU, 0x00000001U);
++	psu_mask_write(0xFD40507C, 0x0000000FU, 0x00000001U);
++	psu_mask_write(0xFD40907C, 0x0000000FU, 0x00000001U);
++	psu_mask_write(0xFD40D07C, 0x0000000FU, 0x00000001U);
++	psu_mask_write(0xFD4019A4, 0x000000FFU, 0x000000FFU);
++	psu_mask_write(0xFD401038, 0x00000040U, 0x00000040U);
++	psu_mask_write(0xFD40102C, 0x00000040U, 0x00000040U);
++	psu_mask_write(0xFD4059A4, 0x000000FFU, 0x000000FFU);
++	psu_mask_write(0xFD405038, 0x00000040U, 0x00000040U);
++	psu_mask_write(0xFD40502C, 0x00000040U, 0x00000040U);
++	psu_mask_write(0xFD4099A4, 0x000000FFU, 0x000000FFU);
++	psu_mask_write(0xFD409038, 0x00000040U, 0x00000040U);
++	psu_mask_write(0xFD40902C, 0x00000040U, 0x00000040U);
++	psu_mask_write(0xFD40D9A4, 0x000000FFU, 0x000000FFU);
++	psu_mask_write(0xFD40D038, 0x00000040U, 0x00000040U);
++	psu_mask_write(0xFD40D02C, 0x00000040U, 0x00000040U);
++	psu_mask_write(0xFD4019AC, 0x00000003U, 0x00000000U);
++	psu_mask_write(0xFD4059AC, 0x00000003U, 0x00000000U);
++	psu_mask_write(0xFD4099AC, 0x00000003U, 0x00000000U);
++	psu_mask_write(0xFD40D9AC, 0x00000003U, 0x00000000U);
++	psu_mask_write(0xFD401978, 0x00000010U, 0x00000010U);
++	psu_mask_write(0xFD405978, 0x00000010U, 0x00000010U);
++	psu_mask_write(0xFD409978, 0x00000010U, 0x00000010U);
++	psu_mask_write(0xFD40D978, 0x00000010U, 0x00000010U);
++
 +	serdes_illcalib(0, 0, 3, 0, 0, 0, 0, 0);
- 	psu_mask_write(0xFD410014, 0x00000007U, 0x00000003U);
--	psu_mask_write(0xFD400CB4, 0x00000037U, 0x00000037U);
--	psu_mask_write(0xFD404CB4, 0x00000037U, 0x00000037U);
--	psu_mask_write(0xFD4001D8, 0x00000001U, 0x00000001U);
--	psu_mask_write(0xFD4041D8, 0x00000001U, 0x00000001U);
--	psu_mask_write(0xFD404CC0, 0x0000001FU, 0x00000000U);
--	psu_mask_write(0xFD400CC0, 0x0000001FU, 0x00000000U);
--	psu_mask_write(0xFD404048, 0x000000FFU, 0x00000000U);
--	psu_mask_write(0xFD400048, 0x000000FFU, 0x00000000U);
--
- 	return 1;
- }
- 
-@@ -699,7 +682,7 @@ static unsigned long psu_resetout_init_data(void)
- 	psu_mask_write(0xFF9D0080, 0x00000001U, 0x00000001U);
- 	psu_mask_write(0xFF9D007C, 0x00000001U, 0x00000000U);
- 	psu_mask_write(0xFF5E023C, 0x00000140U, 0x00000000U);
--	psu_mask_write(0xFF5E0230, 0x00000008U, 0x00000000U);
++	psu_mask_write(0xFD410014, 0x00000007U, 0x00000003U);
++	return 1;
++}
++
++static unsigned long psu_resetout_init_data(void)
++{
++	psu_mask_write(0xFF5E023C, 0x00000400U, 0x00000000U);
++	psu_mask_write(0xFF9D0080, 0x00000001U, 0x00000001U);
++	psu_mask_write(0xFF9D007C, 0x00000001U, 0x00000000U);
++	psu_mask_write(0xFF5E023C, 0x00000140U, 0x00000000U);
 +	psu_mask_write(0xFF5E0230, 0x00000002U, 0x00000000U);
- 	psu_mask_write(0xFD1A0100, 0x00010000U, 0x00000000U);
- 	psu_mask_write(0xFD4A0200, 0x00000002U, 0x00000000U);
- 	psu_mask_write(0xFD4A0238, 0x0000000FU, 0x00000000U);
-@@ -708,7 +691,6 @@ static unsigned long psu_resetout_init_data(void)
- 	psu_mask_write(0xFE20C11C, 0x00000600U, 0x00000600U);
- 	psu_mask_write(0xFE20C12C, 0x00004000U, 0x00004000U);
- 	psu_mask_write(0xFD480064, 0x00000200U, 0x00000200U);
--	mask_poll(0xFD4063E4, 0x00000010U);
- 	mask_poll(0xFD40A3E4, 0x00000010U);
++	psu_mask_write(0xFD1A0100, 0x00010000U, 0x00000000U);
++	psu_mask_write(0xFD4A0200, 0x00000002U, 0x00000000U);
++	psu_mask_write(0xFD4A0238, 0x0000000FU, 0x00000000U);
++	psu_mask_write(0xFE20C200, 0x00023FFFU, 0x00022457U);
++	psu_mask_write(0xFE20C630, 0x003FFF00U, 0x00000000U);
++	psu_mask_write(0xFE20C11C, 0x00000600U, 0x00000600U);
++	psu_mask_write(0xFE20C12C, 0x00004000U, 0x00004000U);
++	psu_mask_write(0xFD480064, 0x00000200U, 0x00000200U);
++	mask_poll(0xFD40A3E4, 0x00000010U);
++
++	return 1;
++}
++
++static unsigned long psu_resetin_init_data(void)
++{
++	psu_mask_write(0xFF5E023C, 0x00000540U, 0x00000540U);
++	psu_mask_write(0xFF5E0230, 0x00000002U, 0x00000002U);
++	psu_mask_write(0xFD4A0238, 0x0000000FU, 0x0000000AU);
++	psu_mask_write(0xFD4A0200, 0x00000002U, 0x00000002U);
++	psu_mask_write(0xFD1A0100, 0x00010000U, 0x00010000U);
  
  	return 1;
-@@ -717,7 +699,7 @@ static unsigned long psu_resetout_init_data(void)
- static unsigned long psu_resetin_init_data(void)
- {
- 	psu_mask_write(0xFF5E023C, 0x00000540U, 0x00000540U);
--	psu_mask_write(0xFF5E0230, 0x00000008U, 0x00000008U);
-+	psu_mask_write(0xFF5E0230, 0x00000002U, 0x00000002U);
- 	psu_mask_write(0xFD4A0238, 0x0000000FU, 0x0000000AU);
- 	psu_mask_write(0xFD4A0200, 0x00000002U, 0x00000002U);
- 	psu_mask_write(0xFD1A0100, 0x00010000U, 0x00010000U);
-@@ -1034,6 +1016,157 @@ static unsigned long psu_ddr_phybringup_data(void)
+ }
+@@ -911,6 +1016,157 @@ static unsigned long psu_ddr_phybringup_data(void)
  	return 1;
  }
  
@@ -388,7 +354,7 @@ index 45102302dc..4c904c6c81 100644
  static void init_peripheral(void)
  {
  	psu_mask_write(0xFD5F0018, 0x8000001FU, 0x8000001FU);
-@@ -1050,6 +1183,7 @@ int psu_init(void)
+@@ -927,6 +1183,7 @@ int psu_init(void)
  	status &= psu_ddr_init_data();
  	status &= psu_ddr_phybringup_data();
  	status &= psu_peripherals_init_data();
diff --git a/board/zynqmp/kria/kd240/patches/uboot/0002-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch b/board/zynqmp/kria/kd240/patches/uboot/0002-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch
deleted file mode 100644
index 5566dae891..0000000000
--- a/board/zynqmp/kria/kd240/patches/uboot/0002-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From bf35bdac2adfa7c65c2992d8dedcc24585561732 Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Wed, 13 Dec 2023 13:11:42 +0000
-Subject: [PATCH] arm64: zynqmp: Add output-enable pins to SOMs
-
-Now that the zynqmp pinctrl driver supports the tri-state registers, make
-sure that the pins requiring output-enable are configured appropriately for
-SOMs.
-
-Without it, all tristate setting for MIOs, which are not related to SOM
-itself, are using default configuration which is not correct setting.
-It means SDs, USBs, ethernet, etc. are not working properly.
-
-In past it was fixed through calling tristate configuration via bootcmd:
-usb_init=mw 0xFF180208 2020
-kv260_gem3=mw 0xFF18020C 0xFC0 && gpio toggle gpio@ff0a000038 && \
-  gpio toggle gpio@ff0a000038
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
-Upstream: https://patchwork.ozlabs.org/project/uboot/patch/20231213134052.2818879-1-neal.frager@amd.com/
----
- arch/arm/dts/zynqmp-sck-kd-g-revA.dts | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/arch/arm/dts/zynqmp-sck-kd-g-revA.dts b/arch/arm/dts/zynqmp-sck-kd-g-revA.dts
-index 56f3128528..12865392a3 100644
---- a/arch/arm/dts/zynqmp-sck-kd-g-revA.dts
-+++ b/arch/arm/dts/zynqmp-sck-kd-g-revA.dts
-@@ -175,6 +175,7 @@
- 		conf-tx {
- 			pins = "MIO36";
- 			bias-disable;
-+			output-enable;
- 		};
- 
- 		mux {
-@@ -226,6 +227,7 @@
- 		conf-bootstrap {
- 			pins = "MIO44", "MIO49";
- 			bias-disable;
-+			output-enable;
- 			low-power-disable;
- 		};
- 
-@@ -233,6 +235,7 @@
- 			pins = "MIO38", "MIO39", "MIO40",
- 				"MIO41", "MIO42", "MIO43";
- 			bias-disable;
-+			output-enable;
- 			low-power-enable;
- 		};
- 
-@@ -241,6 +244,7 @@
- 			slew-rate = <SLEW_RATE_SLOW>;
- 			power-source = <IO_STANDARD_LVCMOS18>;
- 			bias-disable;
-+			output-enable;
- 		};
- 
- 		mux-mdio {
-@@ -271,6 +275,7 @@
- 			pins = "MIO54", "MIO56", "MIO57", "MIO58", "MIO59",
- 			"MIO60", "MIO61", "MIO62", "MIO63";
- 			bias-disable;
-+			output-enable;
- 			drive-strength = <4>;
- 			slew-rate = <SLEW_RATE_SLOW>;
- 		};
-@@ -298,6 +303,7 @@
- 			pins = "MIO66", "MIO68", "MIO69", "MIO70", "MIO71",
- 			"MIO72", "MIO73", "MIO74", "MIO75";
- 			bias-disable;
-+			output-enable;
- 			drive-strength = <4>;
- 			slew-rate = <SLEW_RATE_SLOW>;
- 		};
--- 
-2.25.1
-
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 78302a48c0..9b145d6990 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -1,11 +1,11 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kd240/kd240.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
@@ -15,16 +15,15 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.2)/xlnx_rebase_v2.8_2023.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.10_2024.1)/xlnx_rebase_v2.10_2024.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/kria/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_kria"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k24-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -32,11 +31,11 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/kd240-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2024.1/kd240-kria/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kd240/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches board/zynqmp/kria/kd240/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/kd240/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
