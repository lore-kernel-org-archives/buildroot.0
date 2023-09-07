Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA47EE14DE
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 10:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7E5841BBD;
	Thu,  7 Sep 2023 10:56:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7E5841BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TgsoYrVJGupC; Thu,  7 Sep 2023 10:56:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AF834194B;
	Thu,  7 Sep 2023 10:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AF834194B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C051C1BF41A
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 10:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E5E84015E
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 10:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E5E84015E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n47o7Gq5hdMm for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 10:56:35 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::607])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 192284052A
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 10:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 192284052A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVrTRccFl1i1ThRsWDvNgAQ7Rw/8RbY0LToK3AaVHNW6fUcL9KBmcmrTucWdFlCQCjbJlwJmO4GrB9VL07FAk4niTYHIQdzgLluPMdz6Usw3/TQNJdHXxKIVbUi+7Se4ObZKaD74DaPmgzTgQL8Gs3OFTsskW3vafNy4gVQto/p4AT8I4C83iCR7JNdMbvj/hiV/Nbp2y44Eqb7ZNvoz9oK0O0LTih1yAYXSkZGwiip9GuOcos45g32KB4uxMmi+BTGLayru3g1YSARVbhvswDCalb5suJsl8T4MxR9VpgbDhiwVYZL0/HD9n07UOjzhGXd849g2CEROJM0qNvqZhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XUQNVMQJjS7dT3ixPJXLI9RLaZtUvm8EQbaA/NHutc=;
 b=Mj6igVUOiJQSej0BLwP/KGLfliWPkPOR4eTUuRK+g/j8k/cysodf27zu4g9NkX3MEH0Dk1nOFPssGORpZz/70jauZvhI8dStpzh9h3XRP24INDzjuurK3EBrRFVL5Ys7DdxyQSqJ3F+5V3NIMAN0fLsC9DHKF09qrAi8XS0rCyZzRRTGkBR/wKJYA72wB+lhxuVtEIpB2eAdhNTB4Rw50HQyCFgc+9uIRR0IJDfc5CLNykTBJ8LAvdk3SOBz5tuOiD56Q2x1Pwb1//qF77EwjRkUnPWYLaeHBvhUcpDpPey0G49CSoKWLQAa49rSy6Ing4mwsduGuW4cZijDfS2pCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DM6PR06CA0066.namprd06.prod.outlook.com (2603:10b6:5:54::43) by
 BY5PR12MB4244.namprd12.prod.outlook.com (2603:10b6:a03:204::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.34; Thu, 7 Sep 2023 10:56:27 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:5:54:cafe::2c) by DM6PR06CA0066.outlook.office365.com
 (2603:10b6:5:54::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30 via Frontend
 Transport; Thu, 7 Sep 2023 10:56:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Thu, 7 Sep 2023 10:56:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 7 Sep
 2023 05:56:25 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 7 Sep
 2023 05:56:25 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 7 Sep 2023 05:56:24 -0500
To: <buildroot@buildroot.org>
Date: Thu, 7 Sep 2023 11:56:21 +0100
Message-ID: <20230907105621.205396-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|BY5PR12MB4244:EE_
X-MS-Office365-Filtering-Correlation-Id: e530243f-5557-4070-3e7d-08dbaf911547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WLwcELSjhBRR7+MSxn+QjC7bPbUnj1m10jYtM18bFxqPpXwfuJTeWhaZSViIwwr07KYNNC4TLZ/KVzl9CDifbixtEhqmSMeeeCeQYzWppNunyUtiar6T1v54gHZNx5+qcKezZzCwqII0j53tqeWa5pXs8INpj25Gpqev2Flp6zmI4uRL0ddWXDXUCUZs1IB6nkGajnhl0NhbucLUa1ANyHylkX2G3g1YPZhW9+GDgNCL+3js+dAo4FARFvUQFOcNTQAMVdubUEXeSKfXrz0y7HSGmgHtlLgspsrRpsgw7KTKxeGOKwHNtpX0t5tUksuP0ao2c0k7Fz+QTux3K6JwQ8y1RumOzv+C+QI4L0fK/pEw1Xnnj835x+LVUPaXftwGwWApD2I9+oV/1NeVzQv2E5pVFgPXSoTIw7y3Pw53xyo6NUu+Tn6DJTUYLbau9/ho+7njGXc9N53InKosTicHhdrxFox4NyyM7T694kvkUkB6eKdVydc2rE+nSEpPlhF2cBkBWUxKdbXOgdetnR5V9i5VyuLygSDHbxD6LeNntmRzW3WUt8ZgujBsrSmwTH+lcxiRhwnv9xSjQajd2tZ8NZrRLgflyNHHA8azP5zpWMJB5XpdW3uTcSbG+OECW3AOlkbHs1J9Gxn5JUWxXi3Yi5tNZlZJAytz7WSerOmY5UvWLs1UYdsPDYSWSRiz7SyVHOdu1xWTLLU+VNDIb1S3mY8jcMpp+UcLbKFf4WRc+sbBYBIu/4ESoUatnrsccmY6dfrkzqCR++T8l7UUWtO4IdJmVj2qzYKutELj1vVL/ko=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199024)(82310400011)(186009)(1800799009)(46966006)(36840700001)(40470700004)(966005)(8936002)(30864003)(8676002)(4326008)(478600001)(70206006)(70586007)(44832011)(5660300002)(40480700001)(83380400001)(2906002)(41300700001)(54906003)(86362001)(316002)(6916009)(6666004)(26005)(40460700003)(82740400003)(2616005)(356005)(1076003)(81166007)(336012)(426003)(47076005)(36860700001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 10:56:26.4385 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e530243f-5557-4070-3e7d-08dbaf911547
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4244
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XUQNVMQJjS7dT3ixPJXLI9RLaZtUvm8EQbaA/NHutc=;
 b=SEfIlGi0Jh4x/F1e3psL/D7fqSqBelGmwbYT2FpCo3Xh3AEenLXuyZ8bplWcuVbAwUedPzc6pDWvT5FwqGBnBd4C+R/sYFaFODEpMsf/IqyOKgwyImtkYdyLNdzJwIkmMPxlxlbiei44gpdB+HekifyMjkzBQOudBEwnj/92J9U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SEfIlGi0
Subject: [Buildroot] [PATCH v1 1/1] boot/versal-firmware: use microblaze
 toolchain
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
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch moves the versal-firmware package from the package directory to the
boot directory because it is actually boot firmware.

In addition, this patch uses the microblaze bare-metal toolchain from the
patch set below in order to now build the plm and psmfw applications.

Microblaze bare-metal toolchain patch set:
https://patchwork.ozlabs.org/project/buildroot/list/?series=371570

The embeddedsw patches required to build the plm and psmfw applications only
work on version xilinx_v2023.1, so older versions are not supported.  The
patches have already been submitted upstream internally at AMD / Xilinx, so
they will no longer be necessary with version xilinx_v2023.2 and onwards.

The versal-firmware package now supports custom versal boards with the use
of the BR2_TARGET_VERSAL_FIRMWARE_PDI config.  The versal pdi file is
generated by Vivado is the only firmware file that contains board specific
information.  By default, the BR2_TARGET_VERSAL_FIRMWARE_PDI config is used
to download the vck190 evaluation board pdi from the Xilinx github, but this
same config can now be used to download a custom pdi for a custom versal
board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS                                    |   2 +-
 boot/Config.in                                |   1 +
 boot/versal-firmware/Config.in                |  34 ++++
 boot/versal-firmware/versal-firmware.hash     |   2 +
 boot/versal-firmware/versal-firmware.mk       |  47 ++++++
 ...al_plm-add-support-of-parallel-build.patch | 157 ++++++++++++++++++
 ..._psmfw-add-support-of-parallel-build.patch |  48 ++++++
 configs/versal_vck190_defconfig               |   6 +-
 package/Config.in                             |   1 -
 package/versal-firmware/Config.in             |  24 ---
 package/versal-firmware/versal-firmware.mk    |  21 ---
 11 files changed, 293 insertions(+), 50 deletions(-)
 create mode 100644 boot/versal-firmware/Config.in
 create mode 100644 boot/versal-firmware/versal-firmware.hash
 create mode 100644 boot/versal-firmware/versal-firmware.mk
 create mode 100644 boot/versal-firmware/xilinx_v2023.1/0001-sw_apps-versal_plm-add-support-of-parallel-build.patch
 create mode 100644 boot/versal-firmware/xilinx_v2023.1/0002-sw_apps-versal_psmfw-add-support-of-parallel-build.patch
 delete mode 100644 package/versal-firmware/Config.in
 delete mode 100644 package/versal-firmware/versal-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3af43d2d27..e38b37e1f1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2235,13 +2235,13 @@ N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
+F:	boot/versal-firmware/
 F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
 F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	package/bootgen/
-F:	package/versal-firmware/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
diff --git a/boot/Config.in b/boot/Config.in
index e5fdf7ad43..ccfbcf84de 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -23,6 +23,7 @@ source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-image-gen/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
+source "boot/versal-firmware/Config.in"
 source "boot/vexpress-firmware/Config.in"
 
 endmenu
diff --git a/boot/versal-firmware/Config.in b/boot/versal-firmware/Config.in
new file mode 100644
index 0000000000..34279f84b8
--- /dev/null
+++ b/boot/versal-firmware/Config.in
@@ -0,0 +1,34 @@
+config BR2_TARGET_VERSAL_FIRMWARE
+	bool "versal-firmware"
+	select BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL
+	help
+	  This package builds the boot firmware apps for Xilinx versal
+	  boards, so that they can boot u-boot and Linux.
+
+if BR2_TARGET_VERSAL_FIRMWARE
+
+config BR2_TARGET_VERSAL_FIRMWARE_VERSION
+	string "firmware version"
+	default "xilinx_v2023.1"
+	help
+	  Release version of versal firmware.
+	  Only versions xilinx_v2023.1 and newer are supported.
+	  
+config BR2_TARGET_VERSAL_FIRMWARE_CUSTOM_CFLAGS
+	string "custom cflags"
+	help
+	  Adds additional CFLAGS for building versal firmware.
+
+config BR2_TARGET_VERSAL_FIRMWARE_PDI
+	string "pdi file location"
+	default "https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/vck190-versal/vpl_gen_fixed.pdi"
+	help
+	  The PDI file defines everything which is board specific for versal.
+	  It gets parsed by the plm.elf during boot.  To boot a custom target
+	  based on versal, this should be configured to point to your Vivado
+	  generated PDI file.
+	  
+	  This config should never be undefined, so default configuration is
+	  for the vck190 evaluation board.
+
+endif # BR2_TARGET_VERSAL_FIRMWARE
diff --git a/boot/versal-firmware/versal-firmware.hash b/boot/versal-firmware/versal-firmware.hash
new file mode 100644
index 0000000000..3a03f9c3ff
--- /dev/null
+++ b/boot/versal-firmware/versal-firmware.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  9850f893113936b9959cc76cc3e9152e30f815ff1acaa4b45f7a60fe3e1836f0  versal-firmware-xilinx_v2023.1.tar.gz
diff --git a/boot/versal-firmware/versal-firmware.mk b/boot/versal-firmware/versal-firmware.mk
new file mode 100644
index 0000000000..ad4aad49ec
--- /dev/null
+++ b/boot/versal-firmware/versal-firmware.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# versal-firmware
+#
+################################################################################
+
+VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_SITE = $(call github,Xilinx,embeddedsw,$(VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_LICENSE = MIT
+VERSAL_FIRMWARE_LICENSE_FILES = license.txt
+VERSAL_FIRMWARE_INSTALL_IMAGES = YES
+VERSAL_FIRMWARE_INSTALL_TARGET = NO
+VERSAL_FIRMWARE_DEPENDENCIES = host-newlib-bare-metal
+
+VERSAL_CFLAGS = "-Os -flto -ffat-lto-objects $(call qstrip,$(BR2_TARGET_VERSAL_FIRMWARE_CUSTOM_CFLAGS))"
+
+VERSAL_FIRMWARE_PDI = $(call qstrip,$(BR2_TARGET_VERSAL_FIRMWARE_PDI))
+
+ifneq ($(findstring ://,$(VERSAL_FIRMWARE_PDI)),)
+VERSAL_FIRMWARE_EXTRA_DOWNLOADS = $(VERSAL_FIRMWARE_PDI)
+BR_NO_CHECK_HASH_FOR += $(notdir $(VERSAL_FIRMWARE_PDI))
+VERSAL_FIRMWARE_PDI_PATH = $(VERSAL_FIRMWARE_DL_DIR)/$(notdir $(VERSAL_FIRMWARE_PDI))
+else ifneq ($(VERSAL_FIRMWARE_PDI),)
+VERSAL_FIRMWARE_PDI_PATH = $(shell readlink -f $(VERSAL_FIRMWARE_PDI))
+endif #VERSAL_FIRMWARE_PDI
+
+define VERSAL_FIRMWARE_BUILD_CMDS
+	$(MAKE) -C $(@D)/lib/sw_apps/versal_plm/src/versal \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(VERSAL_CFLAGS)
+		
+	$(MAKE) -C $(@D)/lib/sw_apps/versal_psmfw/src/versal \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(VERSAL_CFLAGS)
+endef
+
+define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/versal_plm/src/versal/plm.elf $(BINARIES_DIR)/plm.elf
+	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/versal_psmfw/src/versal/psmfw.elf $(BINARIES_DIR)/psmfw.elf
+	$(INSTALL) -D -m 0755 $(VERSAL_FIRMWARE_PDI_PATH) $(BINARIES_DIR)/vpl_gen_fixed.pdi
+endef
+
+$(eval $(generic-package))
diff --git a/boot/versal-firmware/xilinx_v2023.1/0001-sw_apps-versal_plm-add-support-of-parallel-build.patch b/boot/versal-firmware/xilinx_v2023.1/0001-sw_apps-versal_plm-add-support-of-parallel-build.patch
new file mode 100644
index 0000000000..84fffc1d82
--- /dev/null
+++ b/boot/versal-firmware/xilinx_v2023.1/0001-sw_apps-versal_plm-add-support-of-parallel-build.patch
@@ -0,0 +1,157 @@
+From 245509f87776c7727973480f08ead6f293a2f3b2 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 4 Sep 2023 07:08:02 +0100
+Subject: [PATCH 1/2] sw_apps:versal_plm: add support of parallel build
+
+The build fails when make command is invoked with -j option.
+The root cause is, BSP_SEQUENTIAL_MAKEFILES variable is not assigned
+and exported properly in copy_bsp.sh file. Also, the 'all' target in
+src/Makefile tries to compile the source code before bsp copy was
+finished when -j option is enabled during build.
+
+Added BSP_SEQUENTIAL_MAKEFILES in the misc/Makefile to resolve the
+export issue and corrected dependency in the src/Makefile to let the bsp
+copy finished before compiling the source.
+
+Signed-off-by: Duvvi Divya <Duvvi.Divya@xilinx.com>
+Acked-by: Sreedhar Kundella <sreedhar.k@xilinx.com>
+---
+ lib/sw_apps/versal_plm/misc/versal/Makefile    | 12 +++++++++++-
+ lib/sw_apps/versal_plm/misc/versal/copy_bsp.sh | 11 -----------
+ lib/sw_apps/versal_plm/src/versal/Makefile     |  2 ++
+ 3 files changed, 13 insertions(+), 12 deletions(-)
+
+diff --git a/lib/sw_apps/versal_plm/misc/versal/Makefile b/lib/sw_apps/versal_plm/misc/versal/Makefile
+index 5c8e719e9c..d735f64530 100644
+--- a/lib/sw_apps/versal_plm/misc/versal/Makefile
++++ b/lib/sw_apps/versal_plm/misc/versal/Makefile
+@@ -7,6 +7,16 @@ PROCESSOR = psv_pmc_0
+ LIBRARIES = ${PROCESSOR}/lib/libxil.a
+ BSP_MAKEFILES := $(wildcard $(PROCESSOR)/libsrc/*/src/Makefile)
+ SUBDIRS := $(patsubst %/Makefile, %, $(BSP_MAKEFILES))
++DRIVERS_LIST=../drivers.txt
++SEQUENTIAL_MAKEFILES := $(shell cat ${DRIVERS_LIST})
++BSP_SEQUENTIAL_MAKEFILES = $(patsubst %, ${PROCESSOR}/libsrc/%/src/Makefile, $(SEQUENTIAL_MAKEFILES))
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilffs/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilpdi/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilplmi/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilpuf/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilloader/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilnvm/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilsecure/src/Makefile
+ BSP_PARALLEL_MAKEFILES := $(filter-out $(BSP_SEQUENTIAL_MAKEFILES),$(BSP_MAKEFILES))
+ SEQ_SUBDIRS := $(patsubst %/Makefile, %, $(BSP_SEQUENTIAL_MAKEFILES))
+ PAR_SUBDIRS := $(patsubst %/Makefile, %, $(BSP_PARALLEL_MAKEFILES))
+@@ -16,7 +26,7 @@ ifneq (,$(findstring win,$(RDI_PLATFORM)))
+ endif
+ 
+ all:
+-	$(MAKE) --no-print-directory seq_libs
++	$(MAKE) -j1 --no-print-directory seq_libs
+ 	$(MAKE) -j --no-print-directory par_libs
+ 	$(MAKE) --no-print-directory archive
+ 	@echo 'Finished building libraries'
+diff --git a/lib/sw_apps/versal_plm/misc/versal/copy_bsp.sh b/lib/sw_apps/versal_plm/misc/versal/copy_bsp.sh
+index 404e588ae2..244d36e2ee 100755
+--- a/lib/sw_apps/versal_plm/misc/versal/copy_bsp.sh
++++ b/lib/sw_apps/versal_plm/misc/versal/copy_bsp.sh
+@@ -29,7 +29,6 @@ STANDALONE_DIR=$EMBEDDED_SW_DIR/lib/bsp/standalone/src
+ 
+ # libraries dir
+ SERVICES_DIR=$EMBEDDED_SW_DIR/lib/sw_services
+-BSP_SEQUENTIAL_MAKEFILES=
+ 
+ # creation of BSP folders required
+ if [ -d $BSP_DIR ]; then
+@@ -52,7 +51,6 @@ fi
+ mkdir -p $BSP_DIR/libsrc/xilffs
+ cp -r $SERVICES_DIR/xilffs/src $BSP_DIR/libsrc/xilffs/
+ cp -r $SERVICES_DIR/xilffs/src/include/* $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilffs/src/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilpdi/src
+ cp -r $SERVICES_DIR/xilpdi/src/Makefile $BSP_DIR/libsrc/xilpdi/src
+@@ -60,7 +58,6 @@ cp -r $SERVICES_DIR/xilpdi/src/versal/* $BSP_DIR/libsrc/xilpdi/src/
+ cp -r $SERVICES_DIR/xilpdi/src/versal/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilpdi/src/common/* $BSP_DIR/libsrc/xilpdi/src/
+ cp -r $SERVICES_DIR/xilpdi/src/common/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilpdi/src/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilplmi/src
+ cp -r $SERVICES_DIR/xilplmi/src/Makefile $BSP_DIR/libsrc/xilplmi/src
+@@ -68,14 +65,12 @@ cp -r $SERVICES_DIR/xilplmi/src/versal/* $BSP_DIR/libsrc/xilplmi/src/
+ cp -r $SERVICES_DIR/xilplmi/src/versal/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilplmi/src/common/* $BSP_DIR/libsrc/xilplmi/src/
+ cp -r $SERVICES_DIR/xilplmi/src/common/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilplmi/src/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilpuf/src
+ cp -r $SERVICES_DIR/xilpuf/src/Makefile $BSP_DIR/libsrc/xilpuf/src
+ cp -r $SERVICES_DIR/xilpuf/src/common/* $BSP_DIR/libsrc/xilpuf/src
+ cp -r $SERVICES_DIR/xilpuf/src/server/* $BSP_DIR/libsrc/xilpuf/src
+ cp -r $BSP_DIR/libsrc/xilpuf/src/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilpuf/src/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilloader/src
+ cp -r $SERVICES_DIR/xilloader/src/Makefile $BSP_DIR/libsrc/xilloader/src
+@@ -83,7 +78,6 @@ cp -r $SERVICES_DIR/xilloader/src/versal/* $BSP_DIR/libsrc/xilloader/src/
+ cp -r $SERVICES_DIR/xilloader/src/versal/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilloader/src/common/* $BSP_DIR/libsrc/xilloader/src/
+ cp -r $SERVICES_DIR/xilloader/src/common/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilloader/src/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilpm/src/
+ cp -r $SERVICES_DIR/xilpm/src/versal/common/* $BSP_DIR/libsrc/xilpm/src/
+@@ -94,7 +88,6 @@ cp -r $SERVICES_DIR/xilpm/src/versal_common/server/* $BSP_DIR/libsrc/xilpm/src/
+ cp -r $SERVICES_DIR/xilpm/src/versal_common/server/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilpm/src/versal_common/common/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilpm/src/versal_common/common/* $BSP_DIR/libsrc/xilpm/src/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilpm/src/versal/common/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilnvm/src
+ cp -r $SERVICES_DIR/xilnvm/src/Makefile $BSP_DIR/libsrc/xilnvm/src
+@@ -103,7 +96,6 @@ cp -r $SERVICES_DIR/xilnvm/src/versal/server/* $BSP_DIR/libsrc/xilnvm/src/
+ cp -r $SERVICES_DIR/xilnvm/src/common/server/* $BSP_DIR/libsrc/xilnvm/src/
+ cp -r $SERVICES_DIR/xilnvm/src/common/* $BSP_DIR/libsrc/xilnvm/src/
+ cp $BSP_DIR/libsrc/xilnvm/src/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilnvm/src/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilsecure/src
+ cp -r $SERVICES_DIR/xilsecure/src/Makefile $BSP_DIR/libsrc/xilsecure/src
+@@ -115,7 +107,6 @@ cp -r $SERVICES_DIR/xilsecure/src/versal/common/* $BSP_DIR/libsrc/xilsecure/src/
+ cp $BSP_DIR/libsrc/xilsecure/src/*.h $BSP_DIR/include/
+ mv $BSP_DIR/libsrc/xilsecure/src/libxilsecure_pmc.a $BSP_DIR/libsrc/xilsecure/src/libxilsecure.a
+ rm -f $BSP_DIR/libsrc/xilsecure/src/libxilsecure_*.a
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilsecure/src/Makefile"
+ 
+ # copy bsp standalone code
+ cp -r $STANDALONE_DIR/common/*  $BSP_DIR/libsrc/standalone/src/
+@@ -144,7 +135,6 @@ do
+     cp -r $DRIVERS_DIR/$line/src/*.h $BSP_DIR/include/
+ # copy all the HSM generated driver files DRIVER_g.c
+ 	cp $WORKING_DIR/x"$line"_g.c $BSP_DIR/libsrc/$line/src/
+-	BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/$line/src/Makefile"
+ done < $DRIVERS_LIST
+ 
+ #copy the processor code.
+@@ -176,4 +166,3 @@ cp $STANDALONE_DIR/microblaze/*.h  $BSP_DIR/include/
+ 
+ # no inbyte and outbyte present in standalone
+ cp $WORKING_DIR/inbyte.c $WORKING_DIR/outbyte.c  $BSP_DIR/libsrc/standalone/src/
+-export BSP_SEQUENTIAL_MAKEFILES
+diff --git a/lib/sw_apps/versal_plm/src/versal/Makefile b/lib/sw_apps/versal_plm/src/versal/Makefile
+index 15956c8a14..a944225845 100644
+--- a/lib/sw_apps/versal_plm/src/versal/Makefile
++++ b/lib/sw_apps/versal_plm/src/versal/Makefile
+@@ -32,6 +32,8 @@ all: $(EXEC)
+ $(EXEC): $(LIBS) $(OBJS) $(INCLUDES)
+ 	$(CC) -o $@ $(OBJS) $(CC_FLAGS) $(CFLAGS) $(LN_FLAGS) $(LIBPATH) $(LSCRIPT)
+ 
++$(OBJS): $(LIBS)
++
+ $(LIBS):
+ 	echo "Copying BSP files"
+ 	../../misc/versal/copy_bsp.sh
+-- 
+2.25.1
+
diff --git a/boot/versal-firmware/xilinx_v2023.1/0002-sw_apps-versal_psmfw-add-support-of-parallel-build.patch b/boot/versal-firmware/xilinx_v2023.1/0002-sw_apps-versal_psmfw-add-support-of-parallel-build.patch
new file mode 100644
index 0000000000..7918f20946
--- /dev/null
+++ b/boot/versal-firmware/xilinx_v2023.1/0002-sw_apps-versal_psmfw-add-support-of-parallel-build.patch
@@ -0,0 +1,48 @@
+From 2ed864ef5965b7466fb145f479ce0747123f2ce0 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 4 Sep 2023 07:14:38 +0100
+Subject: [PATCH 2/2] sw_apps:versal_psmfw: add support of parallel build
+
+The PSMFW build fails when make command is invoked with -j option.
+The root cause is, the 'all' target in src/Makefile tries to compile
+the source code before bsp copy was finished when -j option is
+enabled during build.
+
+Corrected dependency in the src/Makefile to let the bsp copy
+finished before compiling the source.
+
+Signed-off-by: Naman Trivedi Manojbhai <naman.trivedimanojbhai@amd.com>
+---
+ lib/sw_apps/versal_psmfw/misc/Makefile       | 2 +-
+ lib/sw_apps/versal_psmfw/src/versal/Makefile | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/sw_apps/versal_psmfw/misc/Makefile b/lib/sw_apps/versal_psmfw/misc/Makefile
+index 02d85e492e..92d95d0896 100644
+--- a/lib/sw_apps/versal_psmfw/misc/Makefile
++++ b/lib/sw_apps/versal_psmfw/misc/Makefile
+@@ -17,7 +17,7 @@ ifneq (,$(findstring win,$(RDI_PLATFORM)))
+ endif
+ 
+ all:
+-	$(MAKE) --no-print-directory seq_libs
++	$(MAKE) -j1 --no-print-directory seq_libs
+ 	$(MAKE) -j --no-print-directory par_libs
+ 	$(MAKE) --no-print-directory archive
+ 	@echo 'Finished building libraries'
+diff --git a/lib/sw_apps/versal_psmfw/src/versal/Makefile b/lib/sw_apps/versal_psmfw/src/versal/Makefile
+index 1572bbbca9..3f1589283b 100644
+--- a/lib/sw_apps/versal_psmfw/src/versal/Makefile
++++ b/lib/sw_apps/versal_psmfw/src/versal/Makefile
+@@ -33,6 +33,8 @@ all: $(EXEC)
+ $(EXEC): $(LIBS) $(OBJS) $(INCLUDES)
+ 	$(CC) -o $@ $(OBJS) $(CC_FLAGS) $(CFLAGS) $(LN_FLAGS) $(LIBPATH) $(LSCRIPT)
+ 
++$(OBJS): $(LIBS)
++
+ $(LIBS):
+ 	echo "Copying BSP files"
+ 	../../misc/copy_bsp.sh
+-- 
+2.25.1
+
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index e30bb35b74..78eaa02a28 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -32,9 +32,9 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
-BR2_PACKAGE_VERSAL_FIRMWARE=y
-BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2023.1"
-BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
+BR2_TARGET_VERSAL_FIRMWARE=y
+BR2_TARGET_VERSAL_FIRMWARE_VERSION="xilinx_v2023.1"
+BR2_TARGET_VERSAL_FIRMWARE_PDI="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/vck190-versal/vpl_gen_fixed.pdi"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/package/Config.in b/package/Config.in
index b21a2f8c65..ee349b9586 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -448,7 +448,6 @@ menu "Firmware"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
-	source "package/versal-firmware/Config.in"
 	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
deleted file mode 100644
index 01daefd204..0000000000
--- a/package/versal-firmware/Config.in
+++ /dev/null
@@ -1,24 +0,0 @@
-config BR2_PACKAGE_VERSAL_FIRMWARE
-	bool "versal-firmware"
-	depends on BR2_aarch64
-	help
-	  Pre-built firmware files for Xilinx Versal boards.
-
-	  https://github.com/Xilinx/soc-prebuilt-firmware
-
-if BR2_PACKAGE_VERSAL_FIRMWARE
-
-config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
-	string "firmware version"
-	default "xilinx_v2023.1"
-	help
-	  Release version of Versal firmware.
-
-config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
-	string "board name"
-	default "vck190"
-	help
-	  Name of Versal target board.
-	  Used for installing the appropriate firmware.
-
-endif # BR2_PACKAGE_VERSAL_FIRMWARE
diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
deleted file mode 100644
index 1ced259be1..0000000000
--- a/package/versal-firmware/versal-firmware.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# versal-firmware
-#
-################################################################################
-
-VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
-VERSAL_FIRMWARE_SITE = $(call github,Xilinx,soc-prebuilt-firmware,$(VERSAL_FIRMWARE_VERSION))
-VERSAL_FIRMWARE_LICENSE = MIT
-VERSAL_FIRMWARE_LICENSE_FILES = LICENSE
-VERSAL_FIRMWARE_INSTALL_TARGET = NO
-VERSAL_FIRMWARE_INSTALL_IMAGES = YES
-
-define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
-	$(foreach f,plm.elf psmfw.elf vpl_gen_fixed.pdi,\
-		$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)-versal/$(f) \
-			$(BINARIES_DIR)/$(f)
-	)
-endef
-
-$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
