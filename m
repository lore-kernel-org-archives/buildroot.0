Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2BDC27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 07:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5744A61195;
	Tue, 18 Jun 2024 07:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DVYNnWTBbu1D; Tue, 18 Jun 2024 07:49:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37FBF6120A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37FBF6120A;
	Tue, 18 Jun 2024 07:49:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 065831BF283
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 07:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7A5660B72
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 07:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-fLnIRhAEON for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 07:49:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::610;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B92F8605EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B92F8605EB
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::610])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B92F8605EB
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 07:49:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lr8m3vB7AO9vdusjaEMtUmZa59U7+OuXwoknhtYJEtygNQMR9p/KiwWyC1qJxBvokRizC0/ASYigDoRMXjYhtAVyV2GgEPLWJSVXzb0xzBpZdOn6+DgaBI9wuVWZcqAXaI8C2I1kHS72sdnScCEka8wtzboELskLrYy46zL8lP839o1yW9V1zEEJB346hEDHIs508YA/AFixkvWyBVUK/KoVYPE1mnUwp4GpbIYETshXCO7qYfjCnydmt/3Vguv7Q66FpaCZ59SeoKZyOV+vi0qEPbcDmljuXsEz+JPbhvHEbcyli3o8A2Ld6zwBuG9bL6r/USuctf75PkgsMu6d6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bP9409OKrj7DDYb9Y6vp5362uBAha/ORiZP0AKu3e4Q=;
 b=JAT53WLFspnL51QhweU1BQ32FCaJB5mvHkQ4y7t6uRr/0ffJWEVrdvVt8dPT1UyUBGyH8RdyV74e9FIU8CRp7OYL25exapbw+msdGqRIxTQ4nJTaAYgNHGzZ/mtcW12WYZ9fOyGRJSOMCTxV8dxb0co9fj+OKh9qLmojvydHd4lRw8FVCjg64geo70gdArc8jloHag4cHeR5vkwP+yoF2mMl7aTMrpo0XnVla2FQMPmAOD9TIG2acDqdNb5jgF1T9jTir1bZ1K8DwOpLpeMIvESAex1r+4FRKwATmaMtCRb2kafM1vPKlO9SOjyr/xCG4mY0xvG/zCPLhp1NBLI73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR13CA0038.namprd13.prod.outlook.com (2603:10b6:5:134::15)
 by DS0PR12MB8563.namprd12.prod.outlook.com (2603:10b6:8:165::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 07:49:32 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:5:134:cafe::6) by DM6PR13CA0038.outlook.office365.com
 (2603:10b6:5:134::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31 via Frontend
 Transport; Tue, 18 Jun 2024 07:49:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Tue, 18 Jun 2024 07:49:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Jun
 2024 02:49:31 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Jun
 2024 02:49:30 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Jun 2024 02:49:29 -0500
To: <buildroot@buildroot.org>
Date: Tue, 18 Jun 2024 08:49:21 +0100
Message-ID: <20240618074922.3555070-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618074922.3555070-1-neal.frager@amd.com>
References: <20240618074922.3555070-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|DS0PR12MB8563:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a26e3b-bd07-4c4f-92c6-08dc8f6b3099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|36860700010|376011|82310400023|1800799021|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7rKUBfxdMnQbHF5+AHEhuod0n23ofRLPfQE825DHQSwqG8Dan289U4DCarjZ?=
 =?us-ascii?Q?aeBpj1ltgJEank4vZVlmyruvPEi0xQ+7TNNaJicj1wX2MheEvuoqIdxv01ie?=
 =?us-ascii?Q?yq9eAqjLRlQB5GwC7mtqunYYCUlt6OoPdZg0C71Hh2zFQY7vvJaZxCel4w/j?=
 =?us-ascii?Q?VmzkWADHVMAPZcRVWztTESCw5sb/bP3RnTD5l/u0nlqHRjfXF8kVvZSR2g5h?=
 =?us-ascii?Q?nEbOWuMAdrPQAlQGGczEwb/aqk6l3sP6OSiRVCZv/jjob7QtAPiXOtuoV7Mc?=
 =?us-ascii?Q?b1CaBXerQk9zZGOoFcHbR28SBECXQYZKxK/1uqgLeculYl1YtmchQlZR2s+Q?=
 =?us-ascii?Q?3SaElz9UQtoUtkgKrBi+mFGtMViYmmEyyQATZIYlzLNt2b/i3vOp3AuqpukL?=
 =?us-ascii?Q?lCFUAM0DxbBgRSjU1O5j0iMkk7uGtGm9kDixeeDXasxMAibH76rFYWhoOxHv?=
 =?us-ascii?Q?9yfFvJqGivAA7nXdj832crvSoFGD45BhbE/YUtT9/6JUFI4zgdOvAUnH6uYs?=
 =?us-ascii?Q?KWyFqcOQ9ixR3WYsVJDIIJGu0AELOzKLnqf/bl6NbFji24UZttwizxML8LTh?=
 =?us-ascii?Q?jPdfNMa/i7Qxn227V+yH4cPM4bxtZUsGl6QmzCmniLQy6NRms/breMjevuGx?=
 =?us-ascii?Q?1TpgFMcBERLRfxkikDdFUS6LmfD53DkrhKRB9gxHfVgja8LqrAVGWyyshY4y?=
 =?us-ascii?Q?GCyQde/wJzaamnjEct3JehZfnaiciKM0IUNkpEoRjajPA+S6+CvNGSYIIc3H?=
 =?us-ascii?Q?7ywik/NmxgWyGe+kkYbRO2lbqRoG0swQwDAPP77OVw5K10QyUfcOEnlTOE0h?=
 =?us-ascii?Q?Zw0z7uUQ1wVEtPmnfvS9kL2XTYV/bmr9DndB34wSIA8ROw5gja5XmXLaMBGe?=
 =?us-ascii?Q?a6T2MaRR7kbzcx/Eg7fnCxfs55AXhS4x2EDJU5sOrPG4fAybhZZ6yGm++QMO?=
 =?us-ascii?Q?UODeW5rf3+EnzzUFNovp2hLy+7UU94RRH/fzb5L5KNOZ6JYhR4q71DOEPoh3?=
 =?us-ascii?Q?IJIWW0PQSfZ7lWau5D8w2BEsYSaFGd7DS+DWVvbopVhCW/E9vfk0SmZIt0QA?=
 =?us-ascii?Q?VT5slF62Ydn5zWwZ6xQuQt0J40mXNhdDRjx8YHESCX8RbNf0Pgl2iQdCd+1C?=
 =?us-ascii?Q?aYIWiy8u15PNW2zmXZ2L8WO1wreSJ2Ra8NQ7RNrTYzcgT4Qjh0EUumKTJmuV?=
 =?us-ascii?Q?29U71fCojErQrXrkFY9Mv2RRgVHmG1KcrSF4xjSit62iVHacD2sUnJf/PDz9?=
 =?us-ascii?Q?hMoU+r/KVqPBYcOCaNInrxY1dk78sgj2HSJsU0wtC3X8ojY3hMuaCA6MaJff?=
 =?us-ascii?Q?xkDzRHVDtx1pJvaq2zWx5sCFj4UiTq80wQzFnT76qBGYQcQXFOXEFdgNwXz9?=
 =?us-ascii?Q?CysXGoOXmqKJo7E+14tcNK2UuanP?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(36860700010)(376011)(82310400023)(1800799021)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 07:49:31.8317 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a26e3b-bd07-4c4f-92c6-08dc8f6b3099
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8563
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bP9409OKrj7DDYb9Y6vp5362uBAha/ORiZP0AKu3e4Q=;
 b=M012bhFgYM6bopNByPvQRZ2rsIbBTCJ4krt8qaGkf9SvVBo+GkUw7R5dg9v8te0LVUb1HzlKqWe3VnyQ/eVNEJ5wLar4k29rvSO9FNJJiMdQXLBQzwg5vUOcVqFI8auJSkO1jr0RgWASn4jWnHx+s6E2qaicvby0w62IBgarcpE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=M012bhFg
Subject: [Buildroot] [PATCH v3 3/4] boot/uboot.mk: new zynqmp pmufw source
 option
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
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option will enable u-boot to
use the xilinx-source package for building a pmufw.elf that gets included
in the generated boot.bin.

If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option is enabled, then the
BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw will
be ignored.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V3:
- no changes
---
 boot/uboot/Config.in | 20 +++++++++++++++++++-
 boot/uboot/uboot.mk  |  3 +++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f37040a28a..3aef222772 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -512,9 +512,12 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
 if BR2_TARGET_UBOOT_ZYNQMP
 
+choice
+	bool "pmufw.elf prebuilt or source"
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 	bool "xilinx-prebuilt pmufw.elf"
-	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 	depends on BR2_TARGET_XILINX_PREBUILT_ZYNQMP || BR2_TARGET_XILINX_PREBUILT_KRIA
 	help
 	  Use xilinx-prebuilt boot package for downloading prebuilt
@@ -525,10 +528,25 @@ config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 	  by the ZynqMP boot ROM) containing both the U-Boot SPL and the
 	  PMU firmware in the Xilinx-specific boot format.
 
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
+	bool "xilinx-source pmufw.elf"
+	depends on BR2_TARGET_XILINX_SOURCE_ZYNQMP || BR2_TARGET_XILINX_SOURCE_KRIA
+	help
+	  Use xilinx-source boot package for building
+	  zynqmp pmufw.elf from
+	    https://github.com/Xilinx/embeddedsw repo.
+
+	  U-Boot build process will generate a boot.bin (to be loaded by
+	  by the ZynqMP boot ROM) containing both the U-Boot SPL and the
+	  PMU firmware in the Xilinx-specific boot format.	  
+
+endchoice
+
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
 	string "Custom PMU firmware location"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
+	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
 	help
 	  Location of a PMU firmware binary.
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 19f4cdb557..837cb01f68 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -439,6 +439,9 @@ ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
 ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT),y)
 UBOOT_DEPENDENCIES += xilinx-prebuilt
 UBOOT_ZYNQMP_PMUFW_PATH = $(BINARIES_DIR)/pmufw.elf
+else ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE),y)
+UBOOT_DEPENDENCIES += xilinx-source
+UBOOT_ZYNQMP_PMUFW_PATH = $(BINARIES_DIR)/pmufw.elf
 else
 UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
