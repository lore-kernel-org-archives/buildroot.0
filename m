Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01291C3600C
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 11:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2A0D60C09;
	Tue,  8 Apr 2025 11:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EIFS_kERhgOz; Tue,  8 Apr 2025 11:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8E4160903
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8E4160903;
	Tue,  8 Apr 2025 11:48:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EE921F1
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 11:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58FF3607C4
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 11:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4kKCNUuZXjg for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 11:48:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::606;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 57D8460862
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57D8460862
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::606])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57D8460862
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 11:48:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWDAIvIcLYWnFwOwGhzTrJVM58pEX/Jfq8DHS8+kx41VJaSBxEyL1buUO1Xm86Vb6HPZhLzqppQyp3L97UjIIU8CEh9gUi3Ckb8OPtQ94HUVZOGGLWWlT+NFpOEIiGNuvLgHmucigoMH2Nt6/rM5jemUBzfQolYrhX7xilBaoMt8vEOhIryy7yAHzsf53kNap8E3oIGji7q8M3I8FhWsoGXKqjnnWPbTynI6lC0JUQ6YqJz4LH+F4CAfArc9Fm3gV8XyzH7TND0xvXQnGKM0JfoEjZ39tKEd8uzCjfo/PkxkKB/5sg6ylMELDwYOvsOlt0abFmo1ACqDVLJo5gKnkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duoepxF6yK3vl41XhJ8UBzWGGQoz0fvPmZx8z5WvA9s=;
 b=P4iasWiTrbO0EeYCwm+etQg5lHAsInVk/IIbFdgAQ+dV7WNzG+tO8Vb8BEDx07zL2EyUUQ3PHHs0Zx0yd4gAD91FikUJCHJYfyY533WSXf+MUVF4VFIJRcwqWz91x1qp5xJAQlHBE+TlaS5Awd68DW2rW+Lt11vIRRwRQYv5ASbkozZMBB0X8iBW5p4oOIhIPdzL8h+MFnS0xQTFQht6urz/rR9qBonEQ8CLl1nroyWltqPDBI2EhWkyk4wOasrQBVO1KVaNZsfGLFXo5sSgPjEppDU/dxwyBoECwL6xjPpB5+fXElsXB6eGoN88BYrIhpGsASVSINjvDS5bd4RH/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR03CA0001.namprd03.prod.outlook.com (2603:10b6:a02:a8::14)
 by CH1PR12MB9646.namprd12.prod.outlook.com (2603:10b6:610:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 11:48:45 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a02:a8:cafe::8) by BYAPR03CA0001.outlook.office365.com
 (2603:10b6:a02:a8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Tue,
 8 Apr 2025 11:48:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 11:48:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 06:48:42 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Apr 2025 06:48:41 -0500
To: <buildroot@buildroot.org>
Date: Tue, 8 Apr 2025 12:48:33 +0100
Message-ID: <20250408114834.733285-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|CH1PR12MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: a364d6d8-0973-4923-97da-08dd7693507e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7gOSGLF6NyLSQOYqFwKW2oFdTV2HvSPsCrhXs3j/4H5SuSkxaXGnsnRBbHHs?=
 =?us-ascii?Q?In7zbegc/xulmKr++2jhMtWUwwsYKhieBr/tuWRaO0SM8W9Gviy3JY6Zcg8x?=
 =?us-ascii?Q?76qHNh/+KxzcNGHmt8zkseHumBXFuqnQcCagbcAealBikDL5MA5fc4XyTzzp?=
 =?us-ascii?Q?9/++rBx2g6zB28sjBdIJm+3tZcaL882/L9JfSUXjubz8rjIxk2gCIJRG5Vlm?=
 =?us-ascii?Q?JW/qQmVtI80vPSg9N4P7OiijEr/Z/eNtgav/WWVATlCeg3HiRGCWdV/RSOYv?=
 =?us-ascii?Q?VKMe7TElK5VQGR+uZy6d54KD1Nm9zE27NJJuYALojPeNovoSjZarC2QKusJb?=
 =?us-ascii?Q?paaVvQaLY3Yja8Dtq3G9FNNY0z7Zv2GFTgnOJyhRmD8qUOWfm87sHE3AUr7l?=
 =?us-ascii?Q?Ukuz4uF16sUzmNXemYQLNMA6Y+lxmSBeH3WkqI4W9gk5UztPwe8WfybULIPY?=
 =?us-ascii?Q?yXBeqQ4Qcb+ZPBUe9gjp2m4j3LcUJZo4Lo1T4QgP1Md0zxxIKS0xPZdQrmB8?=
 =?us-ascii?Q?9oAzcfhZ1EnzgVGWVLSkZwmvaKrEX98qWpxl3Txc14WGg92xfnmDnJywYuhj?=
 =?us-ascii?Q?3w/LTIf5V5uWcp7KWoPzzaMxVimZpW+VUOLMPiIzhx/+dI4YDiIxEjfN3LZu?=
 =?us-ascii?Q?DWivh0k8bzBaXO+fxosiGHz16S+7/rZPzfNMmoI0SXAGPZjcVHrQHyeQacKv?=
 =?us-ascii?Q?Rfq4SXPxsq7Y7JK0045nd8UzEjPQcqrVRhRui4z32dcZGOe3NJ2opvYuHJS9?=
 =?us-ascii?Q?3bff0o8cDdbhpBLdWxXWoS6vbFstvdlkkkVZ6hK3K3053mAJpCJxxF2teEoB?=
 =?us-ascii?Q?b+ztrOMzBR8C74C+uujiBls/jW9+Kgds/91H74ak4OAodqUgDT8ga80HmqtJ?=
 =?us-ascii?Q?NBXQkLlmAvPp8snabpI9N1vlOQgkyiGa2nqgD97MFDaBfWBXYEDI0axJI28q?=
 =?us-ascii?Q?uCDybSvWGO05+2N0QN9+xfd1c9HnK8qEMmGOosZC5/r8F5THCmSCV4pfwxgj?=
 =?us-ascii?Q?Dy7vNosEod3V8Ak/hnL3sxewjM8Ntiv08pO4pZgSR6LVdKdI50mJYEiy8Aox?=
 =?us-ascii?Q?OY+9oJc6V4X5/rUqw4jm62uBUQuzAhq2JTB71zqPVj8Bs3/5IlwDs19hLkkv?=
 =?us-ascii?Q?2S9IEfczENbCav10EwRsx0EK62ru7OLgJyDixFZU9Fo7JTZoT2d1+tQAWeT5?=
 =?us-ascii?Q?05nvR2TsllOjOEKRHR2Hc/a8q17GIBnogu8ggGkgVwq3IXxpAxfJD8RK9T/G?=
 =?us-ascii?Q?XetK3u3wgbTJ/Uz1zKsUSgNn9X+DKgH/Nf8e8W4IBcu5uMFDy+cblIS7CzT9?=
 =?us-ascii?Q?zll4E+gj77oeZSOW/10gA52K49vaJ0A0SxLd3Iracmczm4wRt9yzk070FDeg?=
 =?us-ascii?Q?+llRAOLkeHGeQuCPs6EUpbnPWVhHviRDefVdLYIFl7nSMQU9GZ1xHofhzQN6?=
 =?us-ascii?Q?ARdYbD/C44OoCDVbB/vvYmK7KjYjQozDpnfnN3mX5oNkfTwIkSVaUQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 11:48:43.7190 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a364d6d8-0973-4923-97da-08dd7693507e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9646
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duoepxF6yK3vl41XhJ8UBzWGGQoz0fvPmZx8z5WvA9s=;
 b=01OF0N2ZOe3vQbCr6oiL2QE8wchuGOD7/V3IUyArjcOxzyuHc/k58NVKLnJa5asHilQJBFHyvW0/BkAjoN8e9afpKICIHubNlHhfgbh/OAfLUqEisF56nJIHCLP3/13QUa5zHwjgyLwKeYJFchR7TsyCOGcXRKZaw2Tq+f31K4E=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=01OF0N2Z
Subject: [Buildroot] [PATCH v1 1/2] package/fpgautil: new package
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

Add a new package to Buildroot called fpgautil which builds the Xilinx
fpgautil script which can be used for loading FPGA bitstreams on zynq, zynqmp
and versal products at run-time.  This is a handy application for loading
FPGA bitstreams and their corresponding device tree overlays.

An explanation of how this script can be used for each type of product can be
found on the wiki pages below.

https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841645/Solution+Zynq+PL+Programming+With+FPGA+Manager
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841847/Solution+ZynqMP+PL+Programming
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1188397412/Solution+Versal+PL+Programming

In addition, the source code for fpgautil can be found here:
https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c

The fpgautil script can be used hand in hand with the Versal Segmented
Configuration with the following example command for programming the pld.pdi
file to the Versal FPGA:

fpgautil -b /lib/firmware/<design-name>_pld.pdi -o /lib/firmware/<dtbo-name>.dtbo

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/fpgautil/Config.in     |  8 ++++++++
 package/fpgautil/fpgautil.hash |  3 +++
 package/fpgautil/fpgautil.mk   | 22 ++++++++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/fpgautil/Config.in
 create mode 100644 package/fpgautil/fpgautil.hash
 create mode 100644 package/fpgautil/fpgautil.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c84f95943..fe5cf29ccf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2484,6 +2484,7 @@ F:	configs/zynqmp_zcu104_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	package/binutils-bare-metal/
 F:	package/bootgen/
+F:	package/fpgautil/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
 F:	toolchain/toolchain-bare-metal-buildroot/
diff --git a/package/Config.in b/package/Config.in
index 291e784f26..494cae887f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -443,6 +443,7 @@ menu "Firmware"
 	source "package/armbian-firmware/Config.in"
 	source "package/b43-firmware/Config.in"
 	source "package/brcmfmac_sdio-firmware-rpi/Config.in"
+	source "package/fpgautil/Config.in"
 	source "package/linux-firmware/Config.in"
 	source "package/murata-cyw-fw/Config.in"
 	source "package/nxp-bt-wifi-firmware/Config.in"
diff --git a/package/fpgautil/Config.in b/package/fpgautil/Config.in
new file mode 100644
index 0000000000..8a1f557f7e
--- /dev/null
+++ b/package/fpgautil/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FPGAUTIL
+	bool "fpgautil script"
+	depends on BR2_arm || BR2_aarch64
+	help
+	  Xilinx FPGA Manager Utility for zynq, zynqmp
+	  and versal products.
+
+	  https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c
diff --git a/package/fpgautil/fpgautil.hash b/package/fpgautil/fpgautil.hash
new file mode 100644
index 0000000000..2723323a21
--- /dev/null
+++ b/package/fpgautil/fpgautil.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  439a3681d8efa9641ab39c7645836b9ac78b2fdb36242f9bc94c1f3dfb2d9c4e  fpgautil-xlnx-rel-v2024.2_update3.tar.gz
+sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  COPYING.MIT
diff --git a/package/fpgautil/fpgautil.mk b/package/fpgautil/fpgautil.mk
new file mode 100644
index 0000000000..3f75412e7e
--- /dev/null
+++ b/package/fpgautil/fpgautil.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# fpgautil
+#
+################################################################################
+
+FPGAUTIL_VERSION = xlnx-rel-v2024.2_update3
+FPGAUTIL_SITE = $(call github,Xilinx,meta-xilinx,$(FPGAUTIL_VERSION))
+FPGAUTIL_LICENSE = MIT
+FPGAUTIL_LICENSE_FILES = COPYING.MIT
+
+define FPGAUTIL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_LDFLAGS) \
+		$(@D)/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c \
+		-o $(@D)/fpgautil
+endef
+
+define FPGAUTIL_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/fpgautil $(TARGET_DIR)/bin/fpgautil
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
