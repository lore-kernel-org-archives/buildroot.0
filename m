Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F094CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 15:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFE9E41548;
	Sun, 24 Sep 2023 15:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFE9E41548
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UutzVvoD9DS5; Sun, 24 Sep 2023 15:13:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9FAE41509;
	Sun, 24 Sep 2023 15:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9FAE41509
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A97401BF3E8
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7573360A93
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7573360A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jbR7Mn_rYqjY for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 15:13:17 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::606])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F65960595
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 15:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F65960595
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3qk6frgW7623NFVGKCaDPna1x3ZE8Rix5kC41rpH+jBEj2AxhthHbW4PA1E32pZJcn3qSzZAMAWidwhyhzPPZiIdnLNyQXn1ZiHeBtM+l+OgsAm4lOnVrjX41plOnY4phbuTsSL0LjVA/yKWy9XcE2nej1r6Hx+Bq/fmV4yM7iQ1vG6atdY0ymU0Z7LEraE+0QnMa1qXQACHtpuo4abZCEa3Q3ctp15hguNOG0cz8CLHR+MJg0FoAMEVKi0HdRHC9X7RrkI1trgXqmLlJ56ArksZ5hlt4O4/Sh0kfnX04Jm4AonCOuC1/k6HwCmPDM5Qng6uA+zqMq2zpSmWpZXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdZ7m5tQ0ywK6rkmSwBGQeCpucfFAp9nRrHoDewcY0w=;
 b=kxfn3brSmiJ6ZTn6SZ9crS590DXox2Op25szytZzoKxuOx5aJ5/Xnx7jPHSBgCBXbhPy976cP0lKwPNCsRoX001uK2hcy5oFSt8U29JXjWIXpeHTTHWUw0r4lMImEN6kJXhAyRo5b8iaMOEvhBy19EyaswX9MGagX4ZBRvAarEJYHiWWVSKepjct67oqG+fVS95kssh+Xyy+rrfrsH5t5fseprogNIX5+2DeTtpt7xjWYrLdi/nTYhlYbzEUAeaCP8lzgyX/9vlLy5XEKBS9feoTf/hMbv4sNgJtik5Zgj4BeWimLMAhO5rgXf7N8jEh1VIMP28vChrH4Ah7vRBHdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MN2PR05CA0046.namprd05.prod.outlook.com (2603:10b6:208:236::15)
 by BL1PR12MB5221.namprd12.prod.outlook.com (2603:10b6:208:30b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Sun, 24 Sep
 2023 15:13:12 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:236:cafe::7d) by MN2PR05CA0046.outlook.office365.com
 (2603:10b6:208:236::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.18 via Frontend
 Transport; Sun, 24 Sep 2023 15:13:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sun, 24 Sep 2023 15:13:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 24 Sep
 2023 10:13:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 24 Sep
 2023 10:13:10 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Sun, 24 Sep 2023 10:13:09 -0500
To: <buildroot@buildroot.org>
Date: Sun, 24 Sep 2023 16:12:01 +0100
Message-ID: <20230924151205.2099293-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230924151205.2099293-1-neal.frager@amd.com>
References: <20230924151205.2099293-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|BL1PR12MB5221:EE_
X-MS-Office365-Filtering-Correlation-Id: 50036334-72c2-4c99-6b88-08dbbd10c483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sn8E/ngxpYx90AjZHl3+qFZtKo94iytUfiNSQ2EbINjKfkWsoZl3H88XveNo82X3Ic/52Dz790BdQkcIf7WFt+19/Fp2/LSYhoqXTgdFVEfC5xuvt5vpyBBxdkC5JE2YpuhYn4o8f48YXvuf8MCU4Kc+eFz3LoDgAoYdodCcIsoENxunZ+O50X6Ss7YoMZ1grFXWDp18KbHPXlr/0gcUCY5xKRQN8+ZVed0u66fejppMUvksilQcfyhen6Rwri83M8MHQad4ersxsmtanvjXDRjEeZLNkHGvjoumeh4JMLlORZGdC7Hzf7veRD0/6K/Kn0HTbN0/w7zRAWMD+Ux1ei5KfCbQgW39RTPOYysOPmEdS9vzhAFH8Sxt5bktEUnFfwVAEbBDbcUJDw8rm3ZGkXWciVt7bAwqsz9gW0REheQSdO86zD2dZYhtuM1OG+P0+VaQ2Sb6xMz2VxTdhexfN5hFncFdeakC7x+L2Wa4QL3D6A7p/0kotmz7e/CCfpVbJ1oe7OvILlAXv8d9ozNT1ILvV2wxsGye9KrgKspbezIZ3W+oDJEmYKYB3HgI25iqpqXAAg9dSX1o+WX5hgnhzhidVP8zrfYp0ogfUo8C0sBOr5sZKUBjyCQauHutU/UY7Vkileqky31e5mmPyVrFAmVf/nobcQNcu5GbI36R37LYlhH4dE8AwZEA6SGV7EapEvYK8wvHzt+x3gTl4gLASswfYxUO+0EQ9azFpQZ6JHkNLUPcg4nsrOqg/InIflzT/Uu3jocO7uTxVlriAIjEIw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(451199024)(186009)(82310400011)(1800799009)(36840700001)(46966006)(40470700004)(2906002)(44832011)(316002)(5660300002)(26005)(40480700001)(70586007)(41300700001)(54906003)(70206006)(6916009)(478600001)(426003)(4326008)(8936002)(336012)(8676002)(6666004)(40460700003)(36756003)(47076005)(1076003)(36860700001)(2616005)(356005)(86362001)(81166007)(83380400001)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2023 15:13:11.6661 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50036334-72c2-4c99-6b88-08dbbd10c483
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5221
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdZ7m5tQ0ywK6rkmSwBGQeCpucfFAp9nRrHoDewcY0w=;
 b=zJk/wFWs/kRyiGTZktAuEtfuTuIdlL8dP56d/a4MD2r9uHuFjZqRrvWtHXwf2LepWxBupfkzBihpuLJDi725+rbimmGEEI9QQ7vhGiiIrvYhBAbwTnoGO970EDVp5fQDvWrZdOWo/TQIGqC5/og4C0nKVsomvzRILO9yYwbqmG4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zJk/wFWs
Subject: [Buildroot] [PATCH v4 06/10] boot/uboot.mk: new zynqmp pmufw build
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
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option will enable u-boot to
use the zynqmp-firmware package for building a pmufw.elf that gets included in
the generated boot.bin.

If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option is enabled, then the
BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw will
be ignored.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - patch is now backwards compatible for users already using the
   BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw
V2->V3:
 - no changes
V3->V4:
 - BR2_TARGET_UBOOT_ZYNQMP_PMUFW removed when
   BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE selected
---
 boot/uboot/Config.in | 19 +++++++++++++++++--
 boot/uboot/uboot.mk  |  5 +++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 21f19db890..ef9e811764 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -514,11 +514,26 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
 if BR2_TARGET_UBOOT_ZYNQMP
 
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
+	bool "Build zynqmp PMU firmware from source"
+	select BR2_TARGET_ZYNQMP_FIRMWARE
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	help
+	  This option instructs u-boot to build the zynqmp pmufw using
+	  the zynqmp-firmware package.  u-boot will then include this
+	  pmufw.elf in the generated boot.bin.
+	  
+	  If this option is selected, the BR2_TARGET_UBOOT_ZYNQMP_PMUFW
+	  prebuilt option will be ignored.
+
+	  This feature requires U-Boot >= 2018.07.
+
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
-	string "PMU firmware location"
+	string "Pre-built zynqmp PMU firmware location"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
 	help
-	  Location of a PMU firmware binary.
+	  Location of a pre-built PMU firmware binary.
 
 	  If not empty, instructs the U-Boot build process to generate
 	  a boot.bin (to be loaded by the ZynqMP boot ROM) containing
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dda606a880..c11e3d89f7 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -416,7 +416,12 @@ endef
 
 ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
 
+ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE),y)
+UBOOT_DEPENDENCIES += zynqmp-firmware
+UBOOT_ZYNQMP_PMUFW = $(BINARIES_DIR)/pmufw.elf
+else
 UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
+endif #BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
 
 ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
 UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
