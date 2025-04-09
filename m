Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E391AC369A1
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 11:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AA5C410DE;
	Wed,  9 Apr 2025 11:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1yLmp_sx7_3; Wed,  9 Apr 2025 11:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6778A412A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6778A412A0;
	Wed,  9 Apr 2025 11:05:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 019A7D6
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 11:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E76B380F7C
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 11:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pw9nZxUuuCZV for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 11:05:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2406::625;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B22380FD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B22380FD8
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::625])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B22380FD8
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 11:05:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmVSMtJ86sYg6txy7UKwxkNBWjAkMB6KR9lcPvSnEcsFo+Lt6VyIXv9K0XgRrRCMAPTiYgACkhfg1L5nJ/PyIzifdpSIAhirXyLBobaKC0bNwZdEZaL1Fg1nrCGOIrYrz7Yqo9ltYXx8SNOwgE4rT5+Fec7ZkBH0xQzg69q8/SFUXPClWnjfyUsZZRNl1/zBNfKZQEx3QsUHiYUR5LuH24IP9KAd+Z+AcwbUhFkqxSnD8uS302vC7k273hZob5+CGMNPl6sVC+7vRcgEphXTh7Kt82MhB9E0q2gWi3Jz5Wb0XZSdLsCALpBh+RzfxzPpW29PdlFyjVO0UXX7hNCVZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeGuWHzkABtSH9mp7Xt6mJknF3UQlkDxLI70grB7sak=;
 b=xWWK+oXN+LGn7b5g1DkhrZeFvo26vyH1gNvqxR6UmEcxp52cOD3EzRwvJijd60Vs0SP8/R3JadUxyn+sE29o7J7h+enu0ZijmwkbnvHWNqdFC123/PMqV+4hyGzpAO10tR9xCydBVoOQyvbRVipXGV6SiRcFsJKH4P33HqNmcyZAmZKJAUeEfXcYNhGhtj0FkvebUDbTLYeGPKj9LzXKFd9e/odVSp+qIDCkfwAWtEntXnz0gKZ6asQLR+BqMQPF0HPTJaM2ajcDWGfzqTQs7X0n6ZtJcoWwp79AE4ueS0Bi0PtapsYCg7koHcywDu2egXXNbcGzeoZlfNxF3UfEiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA1PR02CA0020.namprd02.prod.outlook.com (2603:10b6:806:2cf::27)
 by SA1PR12MB7365.namprd12.prod.outlook.com (2603:10b6:806:2ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Wed, 9 Apr
 2025 11:05:03 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:2cf:cafe::c0) by SA1PR02CA0020.outlook.office365.com
 (2603:10b6:806:2cf::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Wed,
 9 Apr 2025 11:05:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 11:05:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 06:05:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 06:05:02 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Apr 2025 06:05:00 -0500
To: <buildroot@buildroot.org>
Date: Wed, 9 Apr 2025 12:04:54 +0100
Message-ID: <20250409110455.3850790-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250409110455.3850790-1-neal.frager@amd.com>
References: <20250409110455.3850790-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|SA1PR12MB7365:EE_
X-MS-Office365-Filtering-Correlation-Id: 0beca749-9af8-4d91-3fbd-08dd775660a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lUwwtLOAHpJRosTiqR1BaykFSnJTEJnnbpmvS5BzkYWlRVPO1TwNrE5q1t7E?=
 =?us-ascii?Q?xmc1HZVevSymkEsKAP9OnlnpuncfUZfry6tzC+0u7O+76bTDyEPiVnHpwmIf?=
 =?us-ascii?Q?TnjM1LjvCrXjJqltJbWI9p0k4j6l1Wr+cgd4SrKHbo2/rd5AzE0e+oyMWyMf?=
 =?us-ascii?Q?sJ/lGFpkQrtSlj6IqidnS1xh1+/MYxUsCpSw/TheGx7rYuEGn6AryJVvE6so?=
 =?us-ascii?Q?PN8cn/0ahxxtogDovTuFPrE+MzjHR2DsiGHRTzMC/bQq6RoIKQD193pEDrch?=
 =?us-ascii?Q?Qv9+BXdExvtLkk7UNtzpibjv9YqKh1LYmFELYbu8C9Kwi14SRFYiti0cFVnq?=
 =?us-ascii?Q?DpAqGKxhct3TOpr0Dhx5sHM0+S54QSRAwIkv9BzUo97H2QuTcrhSIZtcWVml?=
 =?us-ascii?Q?wnlkZC5Q7Uv3MVQtm6cLJ/sYIDavf+y7v09FCfcdnOXMhGR5HrDZZ1FHWvEB?=
 =?us-ascii?Q?18cmOd+PHY8n7KrV+BC0fngTjgXubd/mAX0MOifQvlLxkivNTui/UUw4rTU4?=
 =?us-ascii?Q?7bgVlGc0IHDDLzC3NqjNSwIcMPNqwx6M7ntI1r2huZSkhqPFXvh6WkcNO2a2?=
 =?us-ascii?Q?ArXTvOc/ovcKYxFBjTDsHxR5b0dAT61xiiGFkBJgxtY1tVTQD9ANcFfO09lc?=
 =?us-ascii?Q?8Z9mXqK5pkcJIt8WqpTChVn/X/bURg8vNpHK3C74o6zxC52TkIel5N74iZ/b?=
 =?us-ascii?Q?/jIO7PlLhvQFYOSenGns1QPvA4lgBXRd1owaaO/jXrfGE+hRk3E9z4SO6tau?=
 =?us-ascii?Q?xq6RhtwTJkWcGnpKmWV/Pz9F8ePXdCP1ah46MzSfytCo91LgeIu+ayzeANA6?=
 =?us-ascii?Q?oePyiAa2cU5jdZNrIz4rCKtX/zN0o8Gf4c4keU3kMomFOJ+hqX3SJLj++S4n?=
 =?us-ascii?Q?gPSh5vM4iwdPapu/Yxezy7JmqsutwiyvpCNZ1bBsrtQ/vir8CiPhAF6Orsms?=
 =?us-ascii?Q?TM/CnvwuiavT9ntY3+kdV/0qUQnEOFmZAaQqDrL78SUVSXak1JlN/HBUe/NW?=
 =?us-ascii?Q?12yQuOk4lMvvkLMcX8FA2JHQowAu2qcy25F7zpTMRvx+kiYL9bRc1nSb/IVU?=
 =?us-ascii?Q?3DcCPUCI9Zq3P6qod9kW9ketgu+GqEok/6dEQ9ApIBmpFIKMkyXbVvoITNR8?=
 =?us-ascii?Q?kp4Byn/pszdsE6sPE8MWbRn39XkOsvBjVne7h9nZtKfn9geoUTkFAYsl6yW6?=
 =?us-ascii?Q?cKaYZn85dOaZeyyEdNthYGqqGdh13ymg5FhnugMvMRQYal0HHNVTV1VHJEB5?=
 =?us-ascii?Q?wJejyM6yS2SZgmXkJ5NDdS5GMKnfCxWfM9MowgpCuSmMzsxRw4iJfCyEJChK?=
 =?us-ascii?Q?1/FsEmpLGzYjCJa8YtUayWhXinceIlWhJHg6NoFTH5U9gULY+uPY+Qds62J0?=
 =?us-ascii?Q?Nb2vD3oqBmRjuMv8107oXSnl8/w8e4a7G8yIbeHr/8H4rSKyv0/oZlMxXRAv?=
 =?us-ascii?Q?oHdVOqnlhiHh1PFpAdmb/rxryaQHF/E+hCzWUcNBzm4F9nOpHjP18PPwSvyC?=
 =?us-ascii?Q?zjHiDl32tkhcV61x6OS2rsZSys8J3hGBff2r?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 11:05:02.8254 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0beca749-9af8-4d91-3fbd-08dd775660a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7365
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeGuWHzkABtSH9mp7Xt6mJknF3UQlkDxLI70grB7sak=;
 b=Td0oU1fP5LfMbshDLs2vxW4yEcvh9k/s68HNP8YLsq5+mg1EeFnvdVZHDrDlhEaUU5c9aTMjWqgJ6ziAfTOiJiHhlMa8+UEGzJKkF9bhL7kOqxGFw7jlu9iAvshVAKQBARtFjTwO54NDSSPK3Zl7avSXcKyeNJhT+ROSmFM63VE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Td0oU1fP
Subject: [Buildroot] [PATCH v3 2/3] board/versal: change pdi filename to
 boot.pdi
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

With the Segmented Configuration, the Versal PDI files will have new names:
<design>_boot.pdi - Minimal DDR and PS config for booting
<design>_pld.pdi - Remainder of FPGA design to be loaded at run-time

Since this will be the new default, this patch aligns the Buildroot file
naming by replacing the obscure vpl_gen_fixed.pdi filename with a simpler
boot.pdi filename.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- Rebased due to changes in first patch of series
V2->V3:
- Rebased due to changes in first patch of series
---
 board/versal/post-image.sh              | 2 +-
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 22367d5028..b5ce2e3f0c 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -17,7 +17,7 @@ cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
 	the_ROM_image:
 	{
 	  image {
-	    { type=bootimage, file=${BINARIES_DIR}/vpl_gen_fixed.pdi }
+	    { type=bootimage, file=${BINARIES_DIR}/boot.pdi }
 	    { type=bootloader, file=${BINARIES_DIR}/plm.elf }
 	    { core=psm, file=${BINARIES_DIR}/psmfw.elf }
 	  }
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 4d1dfc5ca0..05dc9aebe8 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -37,7 +37,7 @@ XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
 # psm*fw.elf is used.
 XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm*fw.elf
 # We need the *.pdi glob, because the file has different names for the
-# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# different boards, and it has to be named boot.pdi when installed.
 # If Segmented Configuration is used, there will be two pdi files and we need
 # the file that has "_boot.pdi" in the filename.
 define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
@@ -46,13 +46,13 @@ define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
 			$(@D)/*_boot.pdi, \
 			$(@D)/*.pdi \
 		) \
-		$(BINARIES_DIR)/vpl_gen_fixed.pdi
+		$(BINARIES_DIR)/boot.pdi
 endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
 # We need the *.pdi glob, because the file has different names for the
-# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# different boards, and it has to be named boot.pdi when installed.
 # If Segmented Configuration is used, there will be two pdi files and we need
 # the file that has "_boot.pdi" in the filename.
 define XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI
@@ -61,7 +61,7 @@ define XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI
 			$(XILINX_PREBUILT_BOARD_DIR)/*_boot.pdi, \
 			$(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
 		) \
-		$(BINARIES_DIR)/vpl_gen_fixed.pdi
+		$(BINARIES_DIR)/boot.pdi
 endef
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
