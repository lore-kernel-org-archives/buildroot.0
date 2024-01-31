Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0F6C47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 11:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6590B61507;
	Wed, 31 Jan 2024 11:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6590B61507
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2GSMdyu9Zs98; Wed, 31 Jan 2024 11:24:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 639FB61547;
	Wed, 31 Jan 2024 11:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 639FB61547
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C4E71BF5E6
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 427E961557
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 427E961557
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kAnoV20jAUoA for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 11:24:01 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CFB260F45
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 11:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CFB260F45
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/UffPl3DHz19bOFHx9YrfrtWN1NN5193bpdgwWfN82olhBQl4AR7cwTzzlSJAQgZik8M8go5IVd74GCNZoRKh0aQlQlVM6x0vUGjC5FRAergpcsZjG99Z7iuIo668xlWJTOz/Iyl+5405+rlCApI2flpF6ke+vWl6MhM1Ya5aEgLilWGYS3gxrbd+bZOgbO5b7hVlGYt1Iysyn+WqmYo5fejzAnJOR3v7zfOoidk9X8xuRInnsE9EuOPOpTqbWS1HLwCtQXuLbQr9YuxOXOvalJMoqa4sPL1PAkn91/A4HEf+ic9Kw4kGIHeC0sWShqmQHqzDrcZmqaikbIYY8D+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpyiyQ8NI381fQpVWbIjF59rsZEhAGdOjkFaozIqSxw=;
 b=QQOWjlZh6UfJzxHrNc4yPhtly7ppU/893blewE0KSLzEnfj08g8xKK5WB9Zu0YonzkDlZJixkf8yo90oQbE46UgYRyJmsRX7dTzC8LVXotWZ6jfY5u8wunhSoK9MyTk48PPvn5T2FGg4b9P8Elluu7pUBQ9TrqFEOkhepP1amSYtMCKdDc2qnAEPbZKdFTqlCI4e3Gg7m1soGG317UpG4gNQg6JxuPt+7wM+yRCij9fLPrDfrdbqLnHjch/dyI0ZaKliYYDun8P5KsfM0XqCoMhwRT9pqpzIj13K0wsnmJVfq8i0C4Xa9g365fpaIySHyHbJnmZ/CngiwGl6W2mygQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0156.namprd03.prod.outlook.com (2603:10b6:303:8d::11)
 by PH8PR12MB7280.namprd12.prod.outlook.com (2603:10b6:510:220::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.35; Wed, 31 Jan
 2024 11:23:55 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:303:8d:cafe::ce) by MW4PR03CA0156.outlook.office365.com
 (2603:10b6:303:8d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Wed, 31 Jan 2024 11:23:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7270.0 via Frontend Transport; Wed, 31 Jan 2024 11:23:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 05:23:54 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 31 Jan 2024 05:23:53 -0600
To: <buildroot@buildroot.org>
Date: Wed, 31 Jan 2024 11:22:19 +0000
Message-ID: <20240131112223.2175855-7-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131112223.2175855-1-neal.frager@amd.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|PH8PR12MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: bfaa74d1-d052-4db4-c60a-08dc224f1c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GQSOSTiK/PbvAd4ufF8Y3AoDLaP1rz0DGbEn7OY8NaMzKiByUjuQqr3SKuSrkxftEQnWfeOrYNCyOB/oPIFrFCSX0CgAa4zSV9UaKPOTj6/KXpwFyOHdWGYDtaGCyVPQBOpCtRhl2RxVxcmC0QnPWGfBtceD9GYVroIEx40p4I9vpPUSqypdihjZL1JfN20GUoCWpt5g71WFsPXbbLmeMDfS2S39nzwSlv1KYzMFTLCWGQYerXZLYjNpIk/fs9K2I6xpwt1Dd4a4ryT9XaEMc0jgGDKfoz5Oui+1HqU0/wtpAE/DkrenUt5P3oqTF0T9KpJnB/IgiQmxrqtVWOD+lckilwJeiV5W/7T1u+93u2SxXLSyBsceW4U+P8CW+/nU+2AplbsCM5+qk3ILOY9gR0YX8F7+gbQejBgkQPXT0BcGgtaNJ2cqtswQSjFQNtp+s02jZ5NJZROr3/xXTkqy9M0iYKrLE/EKf086++yKWnBtYjQd7H4IKoDH3i2mZhHTxFabK0Mvx+Gzg9Pvm2mRXy4BggfneigymVP3oJ3NEDll96jjd2ZeffbPLkm6OURnlH10TaVnP/V+QAbPSJYxVIIDkkDkRKj16cxYFTXHE3m/iUmvWFL/119ed3PwdSwJlFvGxpm6eIBAK0VqqqPlsXmSU9OB8l5KelzOHC60Wu1CFhDXhd0Zl15C3coJUDHZ7JTQgaIQP9NTRxywZQZSsELTepf4RNJFIBr7WDOdPbU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(451199024)(186009)(82310400011)(64100799003)(1800799012)(46966006)(40470700004)(36840700001)(8936002)(8676002)(4326008)(5660300002)(44832011)(86362001)(2906002)(316002)(70206006)(70586007)(6916009)(54906003)(36756003)(36860700001)(47076005)(478600001)(356005)(82740400003)(81166007)(6666004)(2616005)(26005)(83380400001)(336012)(1076003)(426003)(41300700001)(40480700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:23:55.4690 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfaa74d1-d052-4db4-c60a-08dc224f1c88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7280
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpyiyQ8NI381fQpVWbIjF59rsZEhAGdOjkFaozIqSxw=;
 b=WmUQGrvnqOgUkZoSXyHMGzt/7G6TWkYP/gGRaHeAzRPqJcsabKgrTFnd2zmoKDXcCHVgiaXNrkd6bOU4BePIT2J6g1yDtVfyfrOm7tojXNDLBIL5k0jn4JyUAzAd3Y/zadpLlR15OVObqQ5anMiPUDAWqKXB3S0lxfA62CvKwNo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WmUQGrvn
Subject: [Buildroot] [PATCH v9 07/11] boot/uboot.mk: new zynqmp pmufw build
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
V4->V9:
 - no changes
---
 boot/uboot/Config.in | 19 +++++++++++++++++--
 boot/uboot/uboot.mk  |  5 +++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index beafb38930..c5e33944d5 100644
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
