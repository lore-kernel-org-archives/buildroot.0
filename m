Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF390C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 13:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A787400AF;
	Thu,  3 Feb 2022 13:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lf0KmeTJrePW; Thu,  3 Feb 2022 13:44:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 417A0400CB;
	Thu,  3 Feb 2022 13:44:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0ABA01BF476
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 13:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF82660FFD
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 13:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9z9aRddg2Gvf for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 13:44:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB7D760DB2
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 13:44:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRzodvrMDx50VILrwfISzusy4s4HkfzVc1+hgqd5zxWfPVIGYJduHcrC63mEFTrbM4NtG+qL5N7sn9JU5depMEY2u72plbpANeKDEea4RPuW73WeH5ty3Uc/KfKAeI3K0a3lC7HBrEsmfmWK2dSJAPU5y2fSw3xI/bcsBpgJMwTlMmy/HHsvTzVXuNDCrVitnTcoKPgYL6WgORf1WzwmS/Qq7UyUolS+/cm7wjiTaEVYoxYb2my+Y7wXdoCRExo8p7G6lpQ7M0Xpfimali4EqgasswnjnQujdmsblUumcmIRJf51qfvQc1EuxY9TDcPhgIYQlFo89DNYMwmFIK2G5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BtXs5aMKMNwVPd/QK4Dk20usdhSM1u8EQDUWSKHoug=;
 b=gdqLLtzRUYHh9CEXRq3PSvoiKN6Yu4Y6gLP8OsqJuNvbiR4N+QKzZRfJXeMoHLpYWduFK/zNAcFhVMjNImgumWqUt87LrM8pOSm1A674FJfyLdtJV2pY+PQdbxzPQ2j7gbHgkQziM41dU1lvbTzYJRNiY6+6zwGcrKuHnyz2uzNsVK+qffd5Tb8Yek+IXT7oBSS/fu+WRITcyEetEBN35VEt1A8hX5ekRGhbW9fzBYEHfHgSjx8XwGYXbIalH+3BwV1trqgloaITP7+dlqRYXtBIk9Oo9SuN/FcGfymL79IVrJQCyy7F1SY2OaeL4wk20zzlLmBI2ntEVSJCLe+AOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BtXs5aMKMNwVPd/QK4Dk20usdhSM1u8EQDUWSKHoug=;
 b=sQ0bTdgfOKzRTbp4vDBZPeDD/fiPiQ7njvbOI6l7b/ft4XJrymx5ff/lwmNRhxaNPrXtiPdkdNsVnHhXtvuVs/MS2GhyaMQ8GPoJgDrOeButrL4wfY+4RIFIA06MswjVUOC58Y9KwubesViiiMiaHE+4rse/YhjBMaOvZXg6ujQ=
Received: from SN7PR04CA0051.namprd04.prod.outlook.com (2603:10b6:806:120::26)
 by CH0PR02MB8177.namprd02.prod.outlook.com (2603:10b6:610:fa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 13:44:32 +0000
Received: from SN1NAM02FT0035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:120:cafe::bb) by SN7PR04CA0051.outlook.office365.com
 (2603:10b6:806:120::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 13:44:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0035.mail.protection.outlook.com (10.97.4.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 13:44:30 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 3 Feb 2022 05:44:30 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 3 Feb 2022 05:44:30 -0800
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com
Received: from [172.25.185.186] (port=46978 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1nFcPV-000DZ1-R8; Thu, 03 Feb 2022 05:44:29 -0800
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Thu, 3 Feb 2022 06:44:01 -0700
Message-ID: <20220203134402.1647985-1-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00d04316-066e-437c-7b86-08d9e71b4dd6
X-MS-TrafficTypeDiagnostic: CH0PR02MB8177:EE_
X-Microsoft-Antispam-PRVS: <CH0PR02MB8177D7ECA0FF994EBA58DDABD7289@CH0PR02MB8177.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mf236gsTn3z4gjGuBrAvOKBNH8whBIfRzl3Sv7l3OW9PKdgzZVDn1Uf59E3r3z8S5uMkZnQOEE/n2WaHaufWRvGREDfM7/D+jfdHZaKV7EW2vPv6Rmp7zIME5YmPJptpUvu206X9EY8hy+uGIVHlLhZp3UbCLr2lgGLt0bMaGn6dNk4maCHv8+rTkz5vgAxqROUconbwJcauxSKRdYf+ezd3dDdoqU36whUYSKqfU1v+VGA33C/zgC4tZ2ah/orzJkRbxg1ehexnnnBvfuQ4UP3G6bkGu5D8p4k9VnMmJifj6rAViKtdCDTrA8gwE/v4agxwGQ0he3PvWbmoHMCT6jMq9Iq4V/QLWNj26Uiqj66FMIfbRJNTNTTJbz8yEvNhlxWtK4bM6xiTE7sHihyuhSNpuKh+TtWXdUSDctx5NA+28DujDIxdNTmHfqDU0TD3REUr2rjf+UQ2Ddcvpi3rlBuNWEUen60USPpRYjYkta4rAjUfgkc3rkNeafFUICtv1BmfdupWNIFL8k/Xv1zN2hEyG+amfDmfNsSObAV9kZgsmyrNEqCHly/mfGTFBLNhchOLdlKZAjyiomfKtsOJTOQr1E5mrmoZYSA1jwD/F+DBME3/kBqFpGvZ4BylyPGOi3zLpSUopyC3MXqAP34a/MDbnTjEnfH31Dr8UyA3AjD9i6Y5DuTTR1kRV/UzTK8qPIHqa94iGyV696fdnjSRyvS2iW7L8mHT0Wt1VCtOLbKUd3lE/0ouFQZoHRlNX+pOA+5gBI1+OW/c1GEqp4ScvxAhMtJOoYlXw1ZA9CuD1i8eCMdmmyLJUoQoy78UobSmEw88m4cZd7xtnQAPoyb79A==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(7696005)(508600001)(5660300002)(356005)(30864003)(7636003)(9786002)(966005)(44832011)(82310400004)(6666004)(2906002)(40460700003)(47076005)(426003)(336012)(54906003)(1076003)(186003)(83380400001)(70586007)(70206006)(4326008)(8676002)(26005)(8936002)(316002)(36860700001)(107886003)(2616005)(6916009)(19627235002)(36756003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 13:44:30.4889 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d04316-066e-437c-7b86-08d9e71b4dd6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0035.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8177
Subject: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2021.2
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
Cc: luca@lucaceresoli.net, Neal Frager <neal.frager@xilinx.com>,
 giulio.benetti@benettiengineering.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bump ATF to v2.4
bump U-Boot to Xilinx 2021.2 (2021.01): important drivers not in mainline
bump Linux to Xilinx 2021.2 (5.10): important drivers not in mainline
deleted board/zynqmp/patches directory: already in mainline
modified board/zynqmp/genimage.cfg: U-Boot 2021.01 uses u-boot.itb format
bump configs/zynqmp_zcu106_defconfig to Xilinx 2021.2

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
---
 board/zynqmp/genimage.cfg                     |   2 +-
 ...-fix-Remove-GGC-ignore-Warray-bounds.patch |  68 -------
 ...64-zynqmp-zcu106-fix-SPL-MMC-booting.patch |  52 ------
 ...2-arm64-zynqmp-Enable-booting-to-ATF.patch | 114 ------------
 ...ept-an-absolute-path-for-PMUFW_INIT_.patch |  68 -------
 ...ynqmp-pass-the-PS-init-file-as-a-kco.patch | 175 ------------------
 board/zynqmp/readme.txt                       |  10 +-
 configs/zynqmp_zcu106_defconfig               |  14 +-
 8 files changed, 13 insertions(+), 490 deletions(-)
 delete mode 100644 board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC-ignore-Warray-bounds.patch
 delete mode 100644 board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch
 delete mode 100644 board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.patch
 delete mode 100644 board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path-for-PMUFW_INIT_.patch
 delete mode 100644 board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-init-file-as-a-kco.patch

diff --git a/board/zynqmp/genimage.cfg b/board/zynqmp/genimage.cfg
index ed202f4550..58dc6d785d 100644
--- a/board/zynqmp/genimage.cfg
+++ b/board/zynqmp/genimage.cfg
@@ -2,7 +2,7 @@ image boot.vfat {
 	vfat {
 		files = {
 			"boot.bin",
-			"u-boot.bin",
+			"u-boot.itb",
 			"atf-uboot.ub",
 			"system.dtb",
 			"Image"
diff --git a/board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC-ignore-Warray-bounds.patch b/board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC-ignore-Warray-bounds.patch
deleted file mode 100644
index 0c1a9ba2a4..0000000000
--- a/board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC-ignore-Warray-bounds.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From da003e6ada7d0217fe99dc7c649a731f8ebd3c34 Mon Sep 17 00:00:00 2001
-From: Deepika Bhavnani <deepika.bhavnani@arm.com>
-Date: Thu, 15 Aug 2019 00:56:46 +0300
-Subject: [PATCH] Coverity fix: Remove GGC ignore -Warray-bounds
-
-GCC diagnostics were added to ignore array boundaries, instead
-of ignoring GCC warning current code will check for array boundaries
-and perform and array update only for valid elements.
-
-Resolves: `CID 246574` `CID 246710` `CID 246651`
-
-Signed-off-by: Deepika Bhavnani <deepika.bhavnani@arm.com>
-Change-Id: I7530ecf7a1707351c6ee87e90cc3d33574088f57
-
-Backported from: 41af05154abe136938bcfb5f26c969933784bbef
-[Adapted to apply on 1.5]
-
----
- lib/psci/psci_common.c | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/lib/psci/psci_common.c b/lib/psci/psci_common.c
-index 2220a745cd6e..6282d992a2f0 100644
---- a/lib/psci/psci_common.c
-+++ b/lib/psci/psci_common.c
-@@ -188,21 +188,17 @@ static unsigned int get_power_on_target_pwrlvl(void)
- /******************************************************************************
-  * Helper function to update the requested local power state array. This array
-  * does not store the requested state for the CPU power level. Hence an
-- * assertion is added to prevent us from accessing the wrong index.
-+ * assertion is added to prevent us from accessing the CPU power level.
-  *****************************************************************************/
- static void psci_set_req_local_pwr_state(unsigned int pwrlvl,
- 					 unsigned int cpu_idx,
- 					 plat_local_state_t req_pwr_state)
- {
--	/*
--	 * This should never happen, we have this here to avoid
--	 * "array subscript is above array bounds" errors in GCC.
--	 */
- 	assert(pwrlvl > PSCI_CPU_PWR_LVL);
--#pragma GCC diagnostic push
--#pragma GCC diagnostic ignored "-Warray-bounds"
--	psci_req_local_pwr_states[pwrlvl - 1][cpu_idx] = req_pwr_state;
--#pragma GCC diagnostic pop
-+	if ((pwrlvl > PSCI_CPU_PWR_LVL) && (pwrlvl <= PLAT_MAX_PWR_LVL) &&
-+			(cpu_idx < PLATFORM_CORE_COUNT)) {
-+		psci_req_local_pwr_states[pwrlvl - 1U][cpu_idx] = req_pwr_state;
-+	}
- }
- 
- /******************************************************************************
-@@ -228,7 +224,11 @@ static plat_local_state_t *psci_get_req_local_pwr_states(unsigned int pwrlvl,
- {
- 	assert(pwrlvl > PSCI_CPU_PWR_LVL);
- 
--	return &psci_req_local_pwr_states[pwrlvl - 1][cpu_idx];
-+	if ((pwrlvl > PSCI_CPU_PWR_LVL) && (pwrlvl <= PLAT_MAX_PWR_LVL) &&
-+			(cpu_idx < PLATFORM_CORE_COUNT)) {
-+		return &psci_req_local_pwr_states[pwrlvl - 1U][cpu_idx];
-+	} else
-+		return NULL;
- }
- 
- /*
--- 
-2.34.0
-
diff --git a/board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch b/board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch
deleted file mode 100644
index 4d85e1bb12..0000000000
--- a/board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From e5d72ed8339eb05285448aad3c89d21e4d18fd29 Mon Sep 17 00:00:00 2001
-From: Luca Ceresoli <luca@lucaceresoli.net>
-Date: Mon, 26 Feb 2018 09:40:34 +0100
-Subject: [PATCH] arm64: zynqmp: zcu106: fix SPL MMC booting
-
-The U-Boot SPL generated with the current zcu106 defconfig cannot boot
-from MMC:
-
-  [...]
-  U-Boot SPL 2018.01 (Feb 21 2018 - 17:47:14)
-  EL Level:  EL3
-  Trying to boot from MMC1
-  sdhci_transfer_data: Error detected in status(0x408020)!
-  spl_load_image_fat_os: error reading image u-boot.bin, err - -2
-  spl_load_image_fat: error reading image u-boot.img, err - -6
-  SPL: failed to boot from all boot devices
-  ### ERROR ### Please RESET the board ###
-
-Fix by lowering the rpll value. The new value for the RPLL_CTRL
-register comes from the current psu_init_gpl.c from the HDF file at
-https://github.com/xilinx/hdf-examples/tree/01ad8ea5fd1989abf4ea5a072d019a16cb2bc546/zcu106-zynqmp
-(generated by Vivado v2017.4).
-
-RPLL and sdio1_ref clocks before and after this change:
-
- - Old values: RPLL 1.36 GHz, sdio1_ref 272 MHz
- - New values: RPLL 1.16 GHz, sdio1_ref 233 MHz
-
-Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
-Cc: Michal Simek <michal.simek@xilinx.com>
-Upstream-status: accepted upstream in a different form
----
-
- board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c b/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
-index 4d18abe000ca..e6fa477e53e7 100644
---- a/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
-+++ b/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
-@@ -10,7 +10,7 @@
- static unsigned long psu_pll_init_data(void)
- {
- 	psu_mask_write(0xFF5E0034, 0xFE7FEDEFU, 0x7E4E2C62U);
--	psu_mask_write(0xFF5E0030, 0x00717F00U, 0x00013C00U);
-+	psu_mask_write(0xFF5E0030, 0x00717F00U, 0x00014600U);
- 	psu_mask_write(0xFF5E0030, 0x00000008U, 0x00000008U);
- 	psu_mask_write(0xFF5E0030, 0x00000001U, 0x00000001U);
- 	psu_mask_write(0xFF5E0030, 0x00000001U, 0x00000000U);
--- 
-2.7.4
-
diff --git a/board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.patch b/board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.patch
deleted file mode 100644
index 487fff6812..0000000000
--- a/board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 5e3cac50cc981e01d9072241035a8d4162560c71 Mon Sep 17 00:00:00 2001
-From: Luca Ceresoli <luca@lucaceresoli.net>
-Date: Mon, 12 Mar 2018 17:18:38 +0100
-Subject: [PATCH] arm64: zynqmp: Enable booting to ATF
-
-U-Boot is now able to boot to ARM Trusted Firmware (ATF). The boot
-flow is SPL(EL3) loads ATF and full u-boot and jump to ATF(EL3) which
-pass control to full u-boot(EL2). This has been tested on zcu106, so
-enable it in this defconfig.
-
-To generate an image that triggers this booting flow, you need to pass
-'-O arm-trusted-firmware' to mkimage.
-
-Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
-Signed-off-by: Michal Simek <michal.simek@xilinx.com>
-Backported from upstream: http://git.denx.de/?p=u-boot.git;a=commit;h=5e3cac50cc981e01d9072241035a8d4162560c71
----
-
- configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig | 1 +
- configs/xilinx_zynqmp_zc1751_xm016_dc2_defconfig | 1 +
- configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig | 1 +
- configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig | 1 +
- configs/xilinx_zynqmp_zcu102_rev1_0_defconfig    | 1 +
- configs/xilinx_zynqmp_zcu102_revA_defconfig      | 1 +
- configs/xilinx_zynqmp_zcu102_revB_defconfig      | 1 +
- 7 files changed, 7 insertions(+)
-
-diff --git a/configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig b/configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig
-index c5bfa2b12638..488c72258b0e 100644
---- a/configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig
-+++ b/configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig
-@@ -19,6 +19,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
- CONFIG_SPL_OS_BOOT=y
- CONFIG_SPL_RAM_SUPPORT=y
- CONFIG_SPL_RAM_DEVICE=y
-+CONFIG_SPL_ATF=y
- CONFIG_SYS_PROMPT="ZynqMP> "
- CONFIG_FASTBOOT=y
- CONFIG_FASTBOOT_FLASH=y
-diff --git a/configs/xilinx_zynqmp_zc1751_xm016_dc2_defconfig b/configs/xilinx_zynqmp_zc1751_xm016_dc2_defconfig
-index f86dce403a42..5d501eec0edd 100644
---- a/configs/xilinx_zynqmp_zc1751_xm016_dc2_defconfig
-+++ b/configs/xilinx_zynqmp_zc1751_xm016_dc2_defconfig
-@@ -20,6 +20,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
- CONFIG_SPL_OS_BOOT=y
- CONFIG_SPL_RAM_SUPPORT=y
- CONFIG_SPL_RAM_DEVICE=y
-+CONFIG_SPL_ATF=y
- CONFIG_SYS_PROMPT="ZynqMP> "
- CONFIG_FASTBOOT=y
- CONFIG_FASTBOOT_FLASH=y
-diff --git a/configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig b/configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig
-index 6e947cf56827..6f7eaebd7676 100644
---- a/configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig
-+++ b/configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig
-@@ -16,6 +16,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
- CONFIG_SPL_OS_BOOT=y
- CONFIG_SPL_RAM_SUPPORT=y
- CONFIG_SPL_RAM_DEVICE=y
-+CONFIG_SPL_ATF=y
- CONFIG_SYS_PROMPT="ZynqMP> "
- CONFIG_CMD_MEMTEST=y
- CONFIG_SYS_ALT_MEMTEST=y
-diff --git a/configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig b/configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig
-index 1c934858c61c..7a3806cba4b5 100644
---- a/configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig
-+++ b/configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig
-@@ -17,6 +17,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
- CONFIG_SPL_OS_BOOT=y
- CONFIG_SPL_RAM_SUPPORT=y
- CONFIG_SPL_RAM_DEVICE=y
-+CONFIG_SPL_ATF=y
- CONFIG_SYS_PROMPT="ZynqMP> "
- CONFIG_CMD_MEMTEST=y
- CONFIG_SYS_ALT_MEMTEST=y
-diff --git a/configs/xilinx_zynqmp_zcu102_rev1_0_defconfig b/configs/xilinx_zynqmp_zcu102_rev1_0_defconfig
-index e13c7c56f310..e4408f182ca0 100644
---- a/configs/xilinx_zynqmp_zcu102_rev1_0_defconfig
-+++ b/configs/xilinx_zynqmp_zcu102_rev1_0_defconfig
-@@ -19,6 +19,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
- CONFIG_SPL_OS_BOOT=y
- CONFIG_SPL_RAM_SUPPORT=y
- CONFIG_SPL_RAM_DEVICE=y
-+CONFIG_SPL_ATF=y
- CONFIG_SYS_PROMPT="ZynqMP> "
- CONFIG_FASTBOOT=y
- CONFIG_FASTBOOT_FLASH=y
-diff --git a/configs/xilinx_zynqmp_zcu102_revA_defconfig b/configs/xilinx_zynqmp_zcu102_revA_defconfig
-index 5b2cd495ee85..b52f6789fd4b 100644
---- a/configs/xilinx_zynqmp_zcu102_revA_defconfig
-+++ b/configs/xilinx_zynqmp_zcu102_revA_defconfig
-@@ -19,6 +19,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
- CONFIG_SPL_OS_BOOT=y
- CONFIG_SPL_RAM_SUPPORT=y
- CONFIG_SPL_RAM_DEVICE=y
-+CONFIG_SPL_ATF=y
- CONFIG_SYS_PROMPT="ZynqMP> "
- CONFIG_FASTBOOT=y
- CONFIG_FASTBOOT_FLASH=y
-diff --git a/configs/xilinx_zynqmp_zcu102_revB_defconfig b/configs/xilinx_zynqmp_zcu102_revB_defconfig
-index e6530fbfe7ff..80592554f682 100644
---- a/configs/xilinx_zynqmp_zcu102_revB_defconfig
-+++ b/configs/xilinx_zynqmp_zcu102_revB_defconfig
-@@ -19,6 +19,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
- CONFIG_SPL_OS_BOOT=y
- CONFIG_SPL_RAM_SUPPORT=y
- CONFIG_SPL_RAM_DEVICE=y
-+CONFIG_SPL_ATF=y
- CONFIG_SYS_PROMPT="ZynqMP> "
- CONFIG_FASTBOOT=y
- CONFIG_FASTBOOT_FLASH=y
--- 
-2.7.4
-
diff --git a/board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path-for-PMUFW_INIT_.patch b/board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path-for-PMUFW_INIT_.patch
deleted file mode 100644
index 95ab7b3b75..0000000000
--- a/board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path-for-PMUFW_INIT_.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From c7df098a71e05dc81cee818747759e8060b59626 Mon Sep 17 00:00:00 2001
-From: Luca Ceresoli <luca@lucaceresoli.net>
-Date: Mon, 4 Jun 2018 12:21:01 +0200
-Subject: [PATCH] arm64: zynqmp: accept an absolute path for PMUFW_INIT_FILE
-
-The value of PMUFW_INIT_FILE is prefixed with "$(srctree)/", thus
-forcing it to be a relative path inside the U-Boot source tree. Since
-the PMUFW is a binary file generated outside of U-Boot, the PMUFW
-binary must be copied inside the U-Boot source tree before the
-build.
-
-This generates a few problems:
-
- * if the source tree is shared among different out-of-tree builds,
-   they will pollute (and potentially corrupt) each other
- * the source tree cannot be read-only
- * any buildsystem must add a command to copy the PMUFW binary
- * putting an externally-generated binary in the source tree is ugly
-   as hell
-
-Avoid these problems by accepting an absolute path for
-PMUFW_INIT_FILE. This would be as simple as removing the "$(srctree)/"
-prefix, but in order to keep backward compatibility we rather use the
-shell and readlink to get the absolute path even when starting from a
-relative path.
-
-Since 'readlink -f' produces an empty string if the file does not
-exist, we also add a check to ensure the file configured in
-PMUFW_INIT_FILE exists. Otherwise the build would exit successfully,
-but produce a boot.bin without PMUFW as if PMUFW_INIT_FILE were empty.
-
-Tested in the 12 possible combinations of:
- - PMUFW_INIT_FILE empty, relative, absolute, non-existing
- - building in-tree, in subdir, in other directory
-
-Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
-Cc: Michal Simek <michal.simek@xilinx.com>
-Cc: Simon Glass <sjg@chromium.org>
-Cc: Emmanuel Vadot <manu@bidouilliste.com>
-Signed-off-by: Michal Simek <michal.simek@xilinx.com>
-Backported from upstream: https://git.denx.de/?p=u-boot.git;a=commit;h=c7df098a71e05dc81cee818747759e8060b59626
----
- scripts/Makefile.spl | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/scripts/Makefile.spl b/scripts/Makefile.spl
-index ef018b5b4056..252f13826d4c 100644
---- a/scripts/Makefile.spl
-+++ b/scripts/Makefile.spl
-@@ -167,8 +167,14 @@ ifdef CONFIG_ARCH_ZYNQ
- MKIMAGEFLAGS_boot.bin = -T zynqimage -R $(srctree)/$(CONFIG_BOOT_INIT_FILE)
- endif
- ifdef CONFIG_ARCH_ZYNQMP
-+ifneq ($(CONFIG_PMUFW_INIT_FILE),"")
-+spl/boot.bin: zynqmp-check-pmufw
-+zynqmp-check-pmufw: FORCE
-+	( cd $(srctree) && test -r $(CONFIG_PMUFW_INIT_FILE) ) \
-+		|| ( echo "Cannot read $(CONFIG_PMUFW_INIT_FILE)" && false )
-+endif
- MKIMAGEFLAGS_boot.bin = -T zynqmpimage -R $(srctree)/$(CONFIG_BOOT_INIT_FILE) \
--	-n $(srctree)/$(CONFIG_PMUFW_INIT_FILE)
-+	-n "$(shell cd $(srctree); readlink -f $(CONFIG_PMUFW_INIT_FILE))"
- endif
- 
- spl/boot.bin: $(obj)/u-boot-spl.bin FORCE
--- 
-2.7.4
-
diff --git a/board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-init-file-as-a-kco.patch b/board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-init-file-as-a-kco.patch
deleted file mode 100644
index b32e162780..0000000000
--- a/board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-init-file-as-a-kco.patch
+++ /dev/null
@@ -1,175 +0,0 @@
-From 4c9d54ab5a41d65000c8d249b6fb1b76056f1812 Mon Sep 17 00:00:00 2001
-From: Luca Ceresoli <luca@lucaceresoli.net>
-Date: Wed, 20 Jun 2018 12:11:50 +0200
-Subject: [PATCH] arm/arm64: zynq/zynqmp: pass the PS init file as a kconfig
- variable
-
-U-Boot needs to link ps7_init_gpl.c on Zynq or psu_init_gpl.c on
-ZynqMP (PS init for short). The current logic to locate this file for
-both platforms is:
-
- 1. if a board-specific file exists in
-    board/xilinx/zynq[mp]/$(CONFIG_DEFAULT_DEVICE_TREE)/ps?_init_gpl.c
-    then use it
- 2. otherwise use board/xilinx/zynq/ps?_init_gpl.c
-
-In the latter case the file does not exist in the U-Boot sources and
-must be copied in the source tree from the outside before starting the
-build. This is typical when it is generated from Xilinx tools while
-developing a custom hardware. However making sure that a
-board-specific file is _not_ found (and used) requires some trickery
-such as removing or overwriting all PS init files (e.g.: the current
-meta-xilinx yocto layer [0]).
-
-This generates a few problems:
-
- * if the source tree is shared among different out-of-tree builds,
-   they will pollute (and potentially corrupt) each other
- * the source tree cannot be read-only
- * any buildsystem must add a command to copy the PS init file binary
- * overwriting or deleting files in the source tree is ugly as hell
-
-Simplify usage by allowing to pass the path to the desired PS init
-file in kconfig variable XILINX_PS_INIT_FILE. It can be an absolute
-path or relative to $(srctree). If the variable is set, the
-user-specified file will always be used without being copied
-around. If the the variable is left empty, for backward compatibility
-fall back to the old behaviour.
-
-Since the issue is the same for Zynq and ZynqMP, add one kconfig
-variable in a common place and use it for both.
-
-Also use the new kconfig help text to document all the ways to give
-U-Boot the PS init file.
-
-Build-tested with all combinations of:
- - platform: zynq or zynqmp
- - PS init file: from XILINX_PS_INIT_FILE (absolute, relative path,
-   non-existing), in-tree board-specific, in board/xilinx/zynq[mp]/
- - building in-tree, in subdir, in other directory
-
-[0] https://github.com/Xilinx/meta-xilinx/blob/b2f74cc7fe5c4881589d5e440a17cb51fc66a7ab/meta-xilinx-bsp/recipes-bsp/u-boot/u-boot-spl-zynq-init.inc#L9
-
-Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
-Cc: Albert Aribaud <albert.u.boot@aribaud.net>
-Cc: Michal Simek <michal.simek@xilinx.com>
-Cc: Nathan Rossi <nathan@nathanrossi.com>
-Backported from upstream: https://git.denx.de/?p=u-boot.git;a=commit;h=6da4f67ad09cd8b311d77b2b04e557b7ef65b56c
----
- arch/arm/Kconfig             |  1 +
- board/xilinx/Kconfig         | 41 +++++++++++++++++++++++++++++++++++++++++
- board/xilinx/zynq/Makefile   | 10 +++++++++-
- board/xilinx/zynqmp/Makefile | 10 +++++++++-
- 4 files changed, 60 insertions(+), 2 deletions(-)
- create mode 100644 board/xilinx/Kconfig
-
-diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 22234cde2ab6..e04979d0ef7e 100644
---- a/arch/arm/Kconfig
-+++ b/arch/arm/Kconfig
-@@ -1293,4 +1293,5 @@ source "board/technologic/ts4600/Kconfig"
- source "board/vscom/baltos/Kconfig"
- source "board/woodburn/Kconfig"
- source "board/work-microwave/work_92105/Kconfig"
-+source "board/xilinx/Kconfig"
- source "board/zipitz2/Kconfig"
-
- source "arch/arm/Kconfig.debug"
-diff --git a/board/xilinx/Kconfig b/board/xilinx/Kconfig
-new file mode 100644
-index 000000000000..aa3fa061edef
---- /dev/null
-+++ b/board/xilinx/Kconfig
-@@ -0,0 +1,41 @@
-+# Copyright (c) 2018, Luca Ceresoli <luca@lucaceresoli.net>
-+#
-+# SPDX-License-Identifier: GPL-2.0
-+
-+if ARCH_ZYNQ || ARCH_ZYNQMP
-+
-+config XILINX_PS_INIT_FILE
-+	string "Zynq/ZynqMP PS init file(s) location"
-+	help
-+	  On Zynq and ZynqMP U-Boot SPL (or U-Boot proper if
-+	  ZYNQMP_PSU_INIT_ENABLED is set) is responsible for some
-+	  basic initializations, such as enabling peripherals and
-+	  configuring pinmuxes. The PS init file (called
-+	  psu_init_gpl.c on ZynqMP, ps7_init_gpl.c for Zynq-7000)
-+	  contains the code for such initializations.
-+
-+	  U-Boot contains PS init files for some boards, but each of
-+	  them describes only one specific configuration. Users of a
-+	  different board, or needing a different configuration, can
-+	  generate custom files using the Xilinx development tools.
-+
-+	  There are three ways to give a PS init file to U-Boot:
-+
-+	  1. Set this variable to the path, either relative to the
-+	     source tree or absolute, where the psu_init_gpl.c or
-+	     ps7_init_gpl.c file is located. U-Boot will build this
-+	     file.
-+
-+	  2. If you leave an empty string here, U-Boot will use
-+	     board/xilinx/zynq/$(CONFIG_DEFAULT_DEVICE_TREE)/ps7_init_gpl.c
-+	     for Zynq-7000, or
-+	     board/xilinx/zynqmp/$(CONFIG_DEFAULT_DEVICE_TREE)/psu_init_gpl.c
-+	     for ZynqMP.
-+
-+	  3. If the above file does not exist, U-Boot will use
-+	     board/xilinx/zynq/ps7_init_gpl.c for Zynq-7000, or
-+	     board/xilinx/zynqmp/psu_init_gpl.c for ZynqMP. This file
-+	     is not provided by U-Boot, you have to copy it there
-+	     before the build.
-+
-+endif
-diff --git a/board/xilinx/zynq/Makefile b/board/xilinx/zynq/Makefile
-index 5a76a26720cd..03ad5f0532ee 100644
---- a/board/xilinx/zynq/Makefile
-+++ b/board/xilinx/zynq/Makefile
-@@ -5,10 +5,18 @@
- 
- obj-y	:= board.o
- 
--hw-platform-y :=$(shell echo $(CONFIG_DEFAULT_DEVICE_TREE))
-+ifneq ($(CONFIG_XILINX_PS_INIT_FILE),"")
-+PS_INIT_FILE := $(shell cd $(srctree); readlink -f $(CONFIG_XILINX_PS_INIT_FILE))
-+init-objs := ps_init_gpl.o
-+spl/board/xilinx/zynq/ps_init_gpl.o board/xilinx/zynq/ps_init_gpl.o: $(PS_INIT_FILE)
-+	$(CC) $(c_flags) -I $(srctree)/$(src) -c -o $@ $^
-+endif
- 
-+ifeq ($(init-objs),)
-+hw-platform-y :=$(shell echo $(CONFIG_DEFAULT_DEVICE_TREE))
- init-objs := $(if $(wildcard $(srctree)/$(src)/$(hw-platform-y)/ps7_init_gpl.c),\
- 	$(hw-platform-y)/ps7_init_gpl.o)
-+endif
- 
- ifeq ($(init-objs),)
- ifneq ($(wildcard $(srctree)/$(src)/ps7_init_gpl.c),)
-diff --git a/board/xilinx/zynqmp/Makefile b/board/xilinx/zynqmp/Makefile
-index 05ccd25dcef3..960b81fc5853 100644
---- a/board/xilinx/zynqmp/Makefile
-+++ b/board/xilinx/zynqmp/Makefile
-@@ -5,10 +5,18 @@
- 
- obj-y	:= zynqmp.o
- 
--hw-platform-y :=$(shell echo $(CONFIG_DEFAULT_DEVICE_TREE))
-+ifneq ($(CONFIG_XILINX_PS_INIT_FILE),"")
-+PS_INIT_FILE := $(shell cd $(srctree); readlink -f $(CONFIG_XILINX_PS_INIT_FILE))
-+init-objs := ps_init_gpl.o
-+spl/board/xilinx/zynqmp/ps_init_gpl.o board/xilinx/zynqmp/ps_init_gpl.o: $(PS_INIT_FILE)
-+	$(CC) $(c_flags) -I $(srctree)/$(src) -c -o $@ $^
-+endif
- 
-+ifeq ($(init-objs),)
-+hw-platform-y :=$(shell echo $(CONFIG_DEFAULT_DEVICE_TREE))
- init-objs := $(if $(wildcard $(srctree)/$(src)/$(hw-platform-y)/psu_init_gpl.c),\
- 	$(hw-platform-y)/psu_init_gpl.o)
-+endif
- 
- ifeq ($(init-objs),)
- ifneq ($(wildcard $(srctree)/$(src)/psu_init_gpl.c),)
--- 
-2.7.4
-
diff --git a/board/zynqmp/readme.txt b/board/zynqmp/readme.txt
index da37f4ccc9..9755f182ae 100644
--- a/board/zynqmp/readme.txt
+++ b/board/zynqmp/readme.txt
@@ -1,10 +1,10 @@
 ********************************
-Xilinx ZCU106 board - ZynqMP SoC
+Xilinx ZCU102 / ZCU106 boards - ZynqMP SoC
 ********************************
 
-This document describes the Buildroot support for the ZCU106 board by
-Xilinx, based on the Zynq UltraScale+ MPSoC (aka ZynqMP). It has been
-tested with the EK-U1-ZCU106-ES2 pre-production board.
+This document describes the Buildroot support for the ZCU102 and ZCU106
+boards by Xilinx, based on the Zynq UltraScale+ MPSoC (aka ZynqMP). 
+It has been tested with the ZCU102 and ZCU106 production boards.
 
 How to build it
 ===============
@@ -32,7 +32,7 @@ After building, you should get a tree like this:
     +-- rootfs.ext4 -> rootfs.ext2
     +-- sdcard.img
     +-- system.dtb -> zynqmp-zcu106-revA.dtb
-    +-- u-boot.bin
+    +-- u-boot.itb
     `-- zynqmp-zcu106-revA.dtb
 
 How to write the SD card
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index bee7c1daf7..34b3d89ffb 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -1,11 +1,10 @@
 BR2_aarch64=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.4"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.10_2021.2"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
@@ -15,20 +14,21 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.4"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="228801a215909365ae1dcdd799034195ad7264f7"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_zcu106_revA"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2021.01_2021.2"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/53fdb7b6c92860ceb0ec5fd14deee302f4a84269/bin/pmufw-zcu106-default-v2017.4.bin"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/2021.2/bin/pmufw-v2021.2.bin"
+BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
