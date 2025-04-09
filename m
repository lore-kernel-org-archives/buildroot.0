Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDFBC369A2
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 11:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAA5E412AD;
	Wed,  9 Apr 2025 11:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CdSQKYWsx-kI; Wed,  9 Apr 2025 11:05:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6BD4412E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6BD4412E5;
	Wed,  9 Apr 2025 11:05:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA486108
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 11:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 902F28115B
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 11:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fn2NfRdVnNrV for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 11:05:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::60f;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B8C480C8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B8C480C8F
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::60f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B8C480C8F
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 11:05:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3dsBF0vCP+qTXiHPyQNR3loRfRvevx7eorfr8Rx+4JNSi5d4ombfZV7KeOkMbqvC5f8mkrSvR5fAiDAfWJXXJ6axEF9XWcSkYL8sliF5aKV7KZOF/5mWGGMTUl1ZTqpEniqvzDUv5CL6jEAv5cJkTLWWeLB582crcpspzFldgWzMgEpK5+hQH0qvmIf7/5MQ0uVgMI48h5tLUI7ER6jKvYJnK7e999E/ablgYHDoH/6SBrkj97V7Nd6tXDO/fq3BLuYnWs1EAip8QSELZBxuE5yRoW/cnrqunA7MWeZmQg47x+ShzzcuakPig0YivdHkSnlLHvxb5nEz8GH216dtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUCDMoYUWUO5qRN7OM69ZsINNd/vpPjcp1UtZKCErZU=;
 b=XgpH/zExolQVwbSOnmwX/fNyDR7vJyNoWFcGEen95Mm5MejvHHA9dyse+wwPTKNV3NrSU7KSSIlejxILYyvSIjrWAjEardAEXqGnqTx9oddvQ3jEtTdD9TroRcBL+7SErWkjxrvvSjsFTCuZjXS7or9URPK+65x5xVRKlmD3bWXSKTmQnU2xKfp64dzVKwgYrC1DtBycFWeRzdhofglaAcZ1i+76p2Tye/W/dgtbDZKh6nbtCOJa2NHkgkJeUAd2+4wXMeydr0vXlR4gKP+YPeNBTyQLlGFyBF37PYAx/c495XdCgFLX9SICtqO1EwUaw7D92+tqAJKEYbWOXYbMxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA0PR12CA0015.namprd12.prod.outlook.com (2603:10b6:806:6f::20)
 by MN0PR12MB5812.namprd12.prod.outlook.com (2603:10b6:208:378::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 11:05:08 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:6f:cafe::ce) by SA0PR12CA0015.outlook.office365.com
 (2603:10b6:806:6f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.22 via Frontend Transport; Wed,
 9 Apr 2025 11:05:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 11:05:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 06:05:04 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Apr 2025 06:05:03 -0500
To: <buildroot@buildroot.org>
Date: Wed, 9 Apr 2025 12:04:55 +0100
Message-ID: <20250409110455.3850790-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250409110455.3850790-1-neal.frager@amd.com>
References: <20250409110455.3850790-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|MN0PR12MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: 664e57cf-7cc0-4a47-8d6e-08dd77566364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N7L+9P4pCbN/h6rlGiDILUoR35jBaivUfRJyeflchHEUDbXPfW3MZ0+Wlh5w?=
 =?us-ascii?Q?VnNVDCC5MufoAUAlNR3tNOLBDHrGQurXNdN6e5dfG9p/ps4vEc9VYLHOHKTL?=
 =?us-ascii?Q?V81WSGD2naVFmoayVwFK89a5lqjeotFFydG0yp/KGYolnVkIZg43IOT2bYrc?=
 =?us-ascii?Q?TbHaTt3Qlm5t1bnUQXIgLvYi0OGuohu7W4h63HICwB6GwCcZLhi6F/fpzTK9?=
 =?us-ascii?Q?pW+QwX3p7PAgnfFjkONq0b06AEeTR/pSg6SRlVDJsZNvT+PV2tg9UrBzDhO1?=
 =?us-ascii?Q?jgQVFAieEzcN7ZJDAI+glbarCtf0JTW6gb2qooxL1osphP5cOlHdtC3Q2elR?=
 =?us-ascii?Q?p6H5PdpIXHXWHYKGbUOyTShLQpboqAYtZjlUFuhqr17UQZTSLqaENGtE+KLQ?=
 =?us-ascii?Q?S1ZO7+QmEO3wbz/XIRX4IGS4mSMw7/9pJpuwEYDnOq9qV++fGiBB4Ey1LRCx?=
 =?us-ascii?Q?6oNmY++xvmn0UnYUhKm4YULslLKTQXT4d9pWZgx3VkrBBn88tRt/AVAkdPq9?=
 =?us-ascii?Q?c6jgkgvAHDDKwCkb9BL3I5+KmMdgG9xKblAw72Btn8EhTJD3FWZxGfNFa4w9?=
 =?us-ascii?Q?WxC+8qIzaWdXhue5H1Et+EU/B34dLHxQ50cCIfWpllKFDzHxRsgwsENvHXRj?=
 =?us-ascii?Q?6nQ0uRwm655aDehILu9yWCTzTj6vIK2Mf5VrSftgbsjkD8q7rUOnWbm6uxQ5?=
 =?us-ascii?Q?atiTydbIhbl87RY3EL9XWMTBYMQ3fJsUTFeKCXoYk1Hv9IdIyiDoReqEc4qC?=
 =?us-ascii?Q?lJpC5JNjDYaKTmfrzsokTGgavBbqV7jaCoYcHK+/hvIlQc8+0+g7lFz5Cfv6?=
 =?us-ascii?Q?6jyUKb+NrSSF/t33YmG7WjmQNLUfV46AsI9EVTPNxEH0nrDayvQQPixcaAr+?=
 =?us-ascii?Q?lcuoQ61T9pM8FzhtTOiQKeHuMCQFuTURK9LQsLbTBDL0sYUDvNLmmLWKgYd4?=
 =?us-ascii?Q?lCaimYuGoPagUI1V1cGLnNo3C44JUaqwUMmwLeW4BPMITRsTcwwUX4L+1W9v?=
 =?us-ascii?Q?jYEVijKW+XKdaob462BY+JdqTymXLqYkrWlOJH9dzuQ2hgRV3+q0yK3PCADm?=
 =?us-ascii?Q?PXlU3r8qCS4pUn2BDZU1DB8iTGsvVSMTxQR7lYJEPivo7t3AxFy2S0y9pH+c?=
 =?us-ascii?Q?Y06SNs5Kj1ccvOSzuqHQUEEVK6A35g3LIrNdKmCNYDvUNeGMs8oK6d4r7UsS?=
 =?us-ascii?Q?xyv0/PyDByYsn2pzkOlp6dXlwx7rzNXf48e0s0FBa+drc+yHNFBofltcUDl7?=
 =?us-ascii?Q?JevK8Pnr6QxEZVoxODXFXBkgOuDEOrXTR+nGWKQLt3acuHGCcxcQ8CfDcmHI?=
 =?us-ascii?Q?OOtWfeg3gJWWoDlMPlaqWTgnO51EGFOhbeEcxntUXylYEOBQllaFiupmNWby?=
 =?us-ascii?Q?3Ld8rDMT1k0HxE+/NiQpKlPhoShncm05W/U4gnLC2WuXgmapitvco0eCVNZ4?=
 =?us-ascii?Q?/2JRIl/aS8E2a1BN9fHBfIv2H12IcZeRwbMtSRumatsO3g3glvqlIkBbQWsu?=
 =?us-ascii?Q?4eGl3hQBomsvCj7/A8KhLR7m98YQme+aNNcI?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 11:05:07.4280 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 664e57cf-7cc0-4a47-8d6e-08dd77566364
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5812
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUCDMoYUWUO5qRN7OM69ZsINNd/vpPjcp1UtZKCErZU=;
 b=s5TLlswQ9wyhYb1eS+5DbvXsvMgdViYU/e5Uwx3MuEvZn6sgXiOZhfa36F/YCEazYiI+1olG7w/f+A/FFEu8USL9Bnt24HzWx9Z0Sg9PKuUr2q/0m0A3CjL+pUxuoPCIvTplI7LPs/2dhH7KtVQTLd7uIxnWTV+qXUZI1C1WrkI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=s5TLlswQ
Subject: [Buildroot] [PATCH v3 3/3] boot/xilinx-prebuilt: install pld.pdi to
 target
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

With the Versal Segmented Configuration, it is possible to load a PL bitstream
at run-time using the Linux fpgautil application.  Whenever Segmented
Configuration is used, both the boot.pdi and pld.pdi files will be available
to Buildroot.  For this reason, this patch improves the user experience by
installing the pld.pdi file to the target file system for run-time loading
whenever Versal Segemented Configuration is used.

If the fpgautil application is available in the target file system, it can
be used for loading the pld.pdi using the target command below.

fpgautil -b /lib/firmware/xilinx/*_pld.pdi

The source code for the fpgautil application can be found here:
https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c

Along with usage details:
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1188397412/Solution+Versal+PL+Programming

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- New to patch series
V2->V3:
- Changed wildcards to more specific name "*_pld.pdi".
- Changed install directory for _pld.pdi to $(TARGET_DIR)/lib/firmware/xilinx
  to match Yocto default location.
- Changed pdi file permissions to 0644.
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 26 ++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 05dc9aebe8..decc54b136 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -19,7 +19,6 @@ XILINX_PREBUILT_LICENSE = MIT
 XILINX_PREBUILT_LICENSE_FILES = LICENSE
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
-XILINX_PREBUILT_INSTALL_TARGET = NO
 XILINX_PREBUILT_INSTALL_IMAGES = YES
 
 XILINX_PREBUILT_FAMILY = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_FAMILY))
@@ -48,6 +47,16 @@ define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
 		) \
 		$(BINARIES_DIR)/boot.pdi
 endef
+
+# Install pld.pdi in target file system for run-time loading when using
+# Versal Segmented Configuration.
+define XILINX_PREBUILT_INSTALL_VERSAL_XSA_PLD_PDI
+	$(if $(wildcard $(@D)/*_pld.pdi),
+		mkdir -p $(TARGET_DIR)/lib/firmware/xilinx && \
+		$(INSTALL) -D -m 0644 $(@D)/*_pld.pdi \
+			$(TARGET_DIR)/lib/firmware/xilinx
+	)
+endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
@@ -63,6 +72,16 @@ define XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI
 		) \
 		$(BINARIES_DIR)/boot.pdi
 endef
+
+# Install pld.pdi in target file system for run-time loading when using
+# Segmented Configuration.
+define XILINX_PREBUILT_INSTALL_VERSAL_PLD_PDI
+	$(if $(wildcard $(XILINX_PREBUILT_BOARD_DIR)/*_pld.pdi),
+		mkdir -p $(TARGET_DIR)/lib/firmware/xilinx && \
+		$(INSTALL) -D -m 0644 $(XILINX_PREBUILT_BOARD_DIR)/*_pld.pdi \
+			$(TARGET_DIR)/lib/firmware/xilinx
+	)
+endef
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
@@ -96,4 +115,9 @@ define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
 	$(XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW)
 endef
 
+define XILINX_PREBUILT_INSTALL_TARGET_CMDS
+	$(XILINX_PREBUILT_INSTALL_VERSAL_PLD_PDI)
+	$(XILINX_PREBUILT_INSTALL_VERSAL_XSA_PLD_PDI)
+endef
+
 $(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
