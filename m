Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85ACCC6FD1C
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 14:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 107BA60774;
	Sun, 26 Mar 2023 14:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 107BA60774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hI7fTUViBC7g; Sun, 26 Mar 2023 14:10:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2570260E61;
	Sun, 26 Mar 2023 14:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2570260E61
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 982121BF403
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 14:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 613AD4156A
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 14:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 613AD4156A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id baR29K4WXbZz for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 14:10:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F00A409AE
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F00A409AE
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 14:10:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOzwCKbmnpobSg+pV4jKOy5sap2RXIl4oDbdRCMpzQX/5BvseWBWYhba8s21K1bslZbnHPd3kFCYw4jCjgmBRIwlNS9rP9uwLi/fnivmKBsYhenrEglqQ68ptdTGwPYuW8RwwreVIvca2mtXlP0NE9cGM60agChlgAwocQc0KJx9eqwH/Sx8DsGDKWbJtOiCeM9tWJWAjNPHBLL3LWaScA6usP9u/sYLSAhtfQgiju9m7BIUcVBRbKmI8nDux+JKeySzhuX4Vreqfv58Z3SzqI2O5nmhvcBN3qG63Gkzexm1mLKoPcRkaOJG6MFe+VBSh8xdeiVsr8WIqLfIaBJqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRgi8QfISS2NQWaM2wLoyy9jG5npQEWgxSuzPtChWKA=;
 b=ELVwoqom1Hx4lj/qxWJ0d2KDQrs748JEP6nczjWtEz+V3Gm7dvZx3NvCTSd1qnsJmy4O3kD3YKVsY4Olm+a4140WaOin58ESMWHz/seJFKTYqy1qXXIfmLCF4448xKHfOXUTqpN5iapemXH2xG9VXoxLJZQ5QdWE6KlqgwsHhboLs5hzq2jlz4NLvIufTOLhk2bXeGD5TETEGV2W54Ls1nh6BXq/fHF303gMT0AGRRh6oTjO7oMZcxCB9HN0m2n2aQJcGLkMfRdMASLKyLWMByI7gEz+uhYpzlrwS7qr7KqxIjGO3Aqvl6MLTBC+ZW+9V0ENzWRaagLyZ7sisvdsfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CY5PR17CA0017.namprd17.prod.outlook.com (2603:10b6:930:17::29)
 by SJ0PR12MB6735.namprd12.prod.outlook.com (2603:10b6:a03:479::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Sun, 26 Mar
 2023 14:09:58 +0000
Received: from CY4PEPF0000C967.namprd02.prod.outlook.com
 (2603:10b6:930:17:cafe::56) by CY5PR17CA0017.outlook.office365.com
 (2603:10b6:930:17::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Sun, 26 Mar 2023 14:09:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000C967.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Sun, 26 Mar 2023 14:09:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 26 Mar
 2023 09:09:56 -0500
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sun, 26 Mar 2023 09:09:55 -0500
To: <buildroot@buildroot.org>
Date: Sun, 26 Mar 2023 15:09:49 +0100
Message-ID: <20230326140949.11262-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230326140949.11262-1-neal.frager@amd.com>
References: <20230326140949.11262-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C967:EE_|SJ0PR12MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 592f1a78-cea6-49b5-1a8f-08db2e03c7f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LkYO0Ej/W95f1IzeWjr8SXcORedsYOkn77VbRCXEDR9DEdyQxrAj04oWeeGVpR8b58hq1mPqCwFZXl4DX+d7rbcC231PzueGLZ5cwXWcTaOsUGofM5vFDgdJ4/CJih69dbqCAfhCQjHcLZZPIAD74OuHU0jlKOkZHk1gAdaDLsBryHLSjfoe6zaA5E8QAk3BM0pCpoq+E8iFddUy0YEAKO7X1NXMekoNL9iSjjH6DWSIwTX9m4URQFXHvPcnTIoO8ys/Y88Ic1em2ZbBoxUUrGuByR9VRODqRjzOFwW9NpVtmJV+qgbGapUhSnXJRH+iEHWThjyKinReCf5tMC59K36VZSJJ0C1v/CV0ZP1pLiLbbbs5Z8M1/1wnfdBURdksl6MCS3SQtIXW6z06GNZylP4B5YMVsgEq3ceIP65HY2+FD/K44V97hnMaQoNdlB34Wd4XhhUSf3FB2k54V3qdwlnNpWju6DSW9m0/40W1Oi/01jLhiCM3QeoGdrGSj5xof4L0xHCXyyWRMjjdxXyehMGrrwkcZ+lNUphC+X10xpDpQsdfA3W9WCnAvb2gCTIU/Og/SFDHOB6Td5335xtBun4jxm5PSxF2oruukkopeenr9OOxw/DAsHWqk81yUOkjc8gizM7jNycT3HItKoAdwU9AgVzF6ycH7LlxkrTUYBrk5RaR4XUuxzQsC7jfKObqGFlUm967UYSjoBPdYzplhwic5+iC2gojvQNqWGyzu/c=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199021)(46966006)(36840700001)(40470700004)(81166007)(6916009)(8676002)(40480700001)(8936002)(4326008)(41300700001)(5660300002)(426003)(82310400005)(316002)(70206006)(478600001)(186003)(70586007)(2616005)(36756003)(47076005)(26005)(1076003)(336012)(44832011)(54906003)(82740400003)(40460700003)(83380400001)(6666004)(86362001)(36860700001)(2906002)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2023 14:09:57.6275 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 592f1a78-cea6-49b5-1a8f-08db2e03c7f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C967.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6735
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRgi8QfISS2NQWaM2wLoyy9jG5npQEWgxSuzPtChWKA=;
 b=gMji/uZit8VOCsiF7Z1JL/gngjwD/XZJJGrBWu04zqQRLpoOaiKjEQ5jTa+AQOcay87aAXlGWKcqsRPVsUSCZJUqRS0mP6cPn+xxTnTWY1hdIbiMa6HNE9LHb39BS1MwO6wirjiHPI/6ejVIKUXcD4vQp1iXP4eA75EqRyatdic=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=gMji/uZi
Subject: [Buildroot] [PATCH v1 2/2] boot/uboot.mk: new
 BR2_TARGET_UBOOT_NEEDS_ZYNQMP_FIRMWARE
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

The new BR2_TARGET_UBOOT_NEEDS_ZYNQMP_FIRMWARE option will enable u-boot to
use the zynqmp-firmware package for building a pmufw.elf that gets included in
the generated boot.bin.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/uboot/Config.in | 11 +++++++++++
 boot/uboot/uboot.mk  |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f5c20f5168..116df71ea3 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -476,6 +476,17 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
 if BR2_TARGET_UBOOT_ZYNQMP
 
+config BR2_TARGET_UBOOT_NEEDS_ZYNQMP_FIRMWARE
+	bool "U-Boot needs zynqmp-firmware"
+	depends on BR2_PACKAGE_ZYNQMP_FIRMWARE
+	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW
+	help
+	  This option instructs u-boot to build the zynqmp pmufw using
+	  the zynqmp-firmware package.  u-boot will then include this
+	  pmufw.elf in the generated boot.bin.
+
+	  This feature requires U-Boot >= 2018.07.
+
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
 	string "PMU firmware location"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 4eae8e95c3..78e15be453 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -390,7 +390,12 @@ endef
 
 ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_ZYNQMP_FIRMWARE),y)
+UBOOT_DEPENDENCIES += zynqmp-firmware
+UBOOT_ZYNQMP_PMUFW = $(BINARIES_DIR)/pmufw.elf
+else
 UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
+endif
 
 ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
 UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
