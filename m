Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CC9C3601E
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 15:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D4B46106F;
	Mon,  7 Apr 2025 15:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vI-xUe92Hzfy; Mon,  7 Apr 2025 15:29:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A692061044
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A692061044;
	Mon,  7 Apr 2025 15:29:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1120FDA
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 15:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB2C661054
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 15:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPs1gSa6sLkP for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 15:29:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2409::601;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0A75460585
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A75460585
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A75460585
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 15:29:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDU9vLhDTJ+JEQnyWKj5Rj1rUZP9EG+rvNA0wnp6Pmom6UK6HCaS4v9DwbTK8XoGWJM96JQjnVVYx22zEd/xxxmPx+snvfKglPeSItI9JoP+PPkoeekvZjcdaJy7+UKzZzsq3vFjA/t1j16pI4IgPtkTQXn+kRKHMcCHbqA4EmsNs7uyVENjLFnswh3VJt119+JfiK6s2xeKRZEMp2MaBDFVcUTJ+xKSTQYr1ItRgs+veXPzf0sUMpmIKRIUryUC+bVHZo4lX6CYJEhsp/H/JXzrX0O/DmQmaQHRUZ5D4G2MchCekqEO4PLQGPHqPrK67q88+6UtZnpERo8EuIrB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mK8LUpGiZHX35xMEWMBbgfAwW1wgH+/dndo6dkUPt0=;
 b=NRuFB9eyXr/Z1ko4sFApPvSsssFl/WiYCUUiRwuwzGDL0ofynfoZngnraYk9NVujYeX1Hi/dOM0Ts67p1iJMMsVSJf06F0e8027rDdfeZOwJQWEsu4zre0rCrBlzuLpcc4S5UFewiISUc52vNncdyCIF6kJsrhUxmBlvaoLeYbU5Xr2Ffli85POcbdu1kbzDkOxXRa1lon9O/dZN9wGE67RDIRX8v70NYmgVtn0DNx+2oEGT3rnUI8oLuQeezSH6taeicY9lAoA8SN2OzWcD0EZi7KkFPCv5633DiiGH8lbXCDTYZGmnX4UnsURTd55fhNYToHkiAY2JM1VvZXFQbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR13CA0021.namprd13.prod.outlook.com (2603:10b6:a03:2c0::26)
 by PH7PR12MB5687.namprd12.prod.outlook.com (2603:10b6:510:13e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Mon, 7 Apr
 2025 15:29:19 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::c2) by SJ0PR13CA0021.outlook.office365.com
 (2603:10b6:a03:2c0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13 via Frontend Transport; Mon,
 7 Apr 2025 15:29:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 15:29:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 10:29:17 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Apr 2025 10:29:15 -0500
To: <buildroot@buildroot.org>
Date: Mon, 7 Apr 2025 16:29:10 +0100
Message-ID: <20250407152911.3790939-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407152911.3790939-1-neal.frager@amd.com>
References: <20250407152911.3790939-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|PH7PR12MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: 5571fe30-59ad-44ba-80ae-08dd75e8f6a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UrYoqhIIPCmOJ7xB/K4CyA5HceCfzE+gy6vHxNuE6PLtXL+S5rZLQUdb/hrz?=
 =?us-ascii?Q?0/2bKUYlsO2v4BcvFbZxqVX+prr5T00T5h7gvQ1mxEnOz0pkbWXxEU9ZYYrQ?=
 =?us-ascii?Q?jD2qwwsDPmwygaqr28gcsoeCPsPuKZNdZgzSUTMIja7yQzgHN/bU4tT8Av5E?=
 =?us-ascii?Q?jFZdPmdyUn+gI8Bkk4MuqaMXrhLDKJY93CivfoGDuOiropEioN7L9EMATdtg?=
 =?us-ascii?Q?OmRKw9bS66VKxCoyFM8K7I0xZLJkpawfY7iIBO8iqUzrrRLc1PaPMx8Lorm2?=
 =?us-ascii?Q?geAklZkQv/x+v3ZNpNu3PCfLi9P3E2wjIvdbJYG5tTGRMag+RcTRomrSUn0I?=
 =?us-ascii?Q?Qu6uc+lD6LNXTuCQJboKBSwYu2ShTEs1HfmCdcK0t0R508go/aDcuA8rTSIh?=
 =?us-ascii?Q?+jExJ2VjQG8zv+36mpAqsI/hUelpti30PSFBW1B5VMDGLP+KDK1LSTMateDn?=
 =?us-ascii?Q?WEVXSzcQITAb3zfkEfBXteXQsdG+ilHgXU2DSUPpGH8pYwGpwy7M6gYDwi5a?=
 =?us-ascii?Q?A+578tOQ9yJg6JIagCo/H2TJgU+wxHocPRbw72eAyOtItMeJTezBTfBqhVxc?=
 =?us-ascii?Q?xS1J5y4jmnBnqfsqUjocL8v/pcQz4Wl/pZ2tFL+OchLxAZ2R5sswUgUS0vLl?=
 =?us-ascii?Q?BOnx+eoB2y8wthb0gyBdGtvCHNUFElCyOMfEw0q7DqwJB5k19ojfQWcNOwn6?=
 =?us-ascii?Q?Evz7qs9+KvrbaHCYOJimil46fslg++VAQ9BLhlhD6XVmMSKrLY1ETlJFIP7X?=
 =?us-ascii?Q?2NUHoO83Gw3gmBlP30EySaVUnn1LcrMqaSjQXalQNHhILNSQW4LPUbqolMYZ?=
 =?us-ascii?Q?1qg3h4G68PPIHBVs+SXus3s+iBBHa+isCZH3jhjkiEGAoD7ETgbDxdd7QU5N?=
 =?us-ascii?Q?NIZpXm/HEsUtnp5t0/UYTzzUBg1zmG8DMMGRiO1F4Svp4s3A62tZsnjJwnix?=
 =?us-ascii?Q?TDDg2L7UE3U18y41bba6IKxFRN0uCKqwMZliQNmtZ3wIkfWqKvNB9BY5Chcq?=
 =?us-ascii?Q?NclQhDqzw2bP+9vYtcHiJ2MPcdojPdaACh9W0rglGdam7FKjO5JpyWdn6AxJ?=
 =?us-ascii?Q?D6hd9w/wPXaU2zNJcFp+HJh0Jlny7FurCaZWFYfI/yueHe/awQMRynp4wx3W?=
 =?us-ascii?Q?3UWiC0NXcsdnBVRy0MpGG/s6zOWQlvDHifKhQCpTDH7zkaO/Wkawu+PVGS5Q?=
 =?us-ascii?Q?3ELYpsF6OIvKIOnFJUNoUVpGsEs6B4Q3nkQVjWYXeXhhKzZnZOGZeq78gi2b?=
 =?us-ascii?Q?jDSGUo0IX9Jvzi4kpJ/ulCJ+5b+5QCbQIgw9FsrGAI0ZVBY8QzSeAkNvbwYR?=
 =?us-ascii?Q?wgSvaHIqtRugAZIYen7QbrUs4NDN0RoUvk4QVzktDuqniRHun87j9ZwNmQD4?=
 =?us-ascii?Q?tgzzK6m0VZS8CaAxhzT609m0Dun5QUyBAi4UL1Niqaz0k7EdaOVRwI+6VEXX?=
 =?us-ascii?Q?6wnGZkxeHhiRfMZKnERzvge3Jn+AHlnv+3iHzEutirCuyfjsu5zsNkS/WWM9?=
 =?us-ascii?Q?IUJYS/PlCN02y1fLqjODSjwBelMjabIt0Qeg?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 15:29:18.5492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5571fe30-59ad-44ba-80ae-08dd75e8f6a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5687
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mK8LUpGiZHX35xMEWMBbgfAwW1wgH+/dndo6dkUPt0=;
 b=EM/S0Ho5HB/4t7+Qhsef7NmFeyPiLZczHn0YvA1hcBpMOatTLJtfU/R4CuzSRY+1bA1c6LTFRxqsZL/On20QgkRLt1Rzi6Xig4+u3K/PzKHWSJKm21UdTewVzoc8NDAUWMR428n74FNH2bWCpjbFD48lCKMPjFRX4L2C3ws0NFc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=EM/S0Ho5
Subject: [Buildroot] [PATCH v2 2/3] board/versal: change pdi filename to
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
- rebased due to changes in first patch of series
---
 board/versal/post-image.sh              |  2 +-
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

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
index 448c71a3fb..e6817f4bd7 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -37,30 +37,30 @@ XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
 # psm*fw.elf is used.
 XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm*fw.elf
 # We need the *.pdi glob, because the file has different names for the
-# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# different boards, and it has to be named boot.pdi when installed.
 # If Segmented Configuration is used, there will be two pdi files and we need
 # the file that has "boot" in the filename.
 define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
 	$(if $(wildcard $(@D)/*boot*.pdi),
 		$(INSTALL) -D -m 0755 $(@D)/*boot*.pdi \
-			$(BINARIES_DIR)/vpl_gen_fixed.pdi,
+			$(BINARIES_DIR)/boot.pdi,
 		$(INSTALL) -D -m 0755 $(@D)/*.pdi \
-			$(BINARIES_DIR)/vpl_gen_fixed.pdi
+			$(BINARIES_DIR)/boot.pdi
 	)
 endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
 # We need the *.pdi glob, because the file has different names for the
-# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# different boards, and it has to be named boot.pdi when installed.
 # If Segmented Configuration is used, there will be two pdi files and we need
 # the file that has "boot" in the filename.
 define XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI
 	$(if $(wildcard $(XILINX_PREBUILT_BOARD_DIR)/*boot*.pdi),
 		$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/*boot*.pdi \
-			$(BINARIES_DIR)/vpl_gen_fixed.pdi,
+			$(BINARIES_DIR)/boot.pdi,
 		$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
-			$(BINARIES_DIR)/vpl_gen_fixed.pdi
+			$(BINARIES_DIR)/boot.pdi
 	)
 endef
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
