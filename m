Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5ABCC83F10
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 14:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CF0C417F6;
	Thu, 31 Aug 2023 14:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CF0C417F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PqhTaNkL0dxa; Thu, 31 Aug 2023 14:53:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 666894189E;
	Thu, 31 Aug 2023 14:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 666894189E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BDA931BF418
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 14:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 895A983449
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 14:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 895A983449
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ok7-KORCaBVX for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 14:52:25 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D12DD8343E
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 14:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D12DD8343E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qs60wooLgzAGjwVruGWBSvD2L4xBWPYa3YkRNImrDD+6OfkK4sc/USddy+8C2QEXGKTFqhS21lh84tkppD5ZWrVQjK28kyF2qQDgZn2akkrguXOvMooU0Afasawbe10kx2Prc7zAOmYV4ETXKo2pUwteKn+lWV3VqlGBMlQ2KmC/JPAbGT67n1f1MQrbiakhc0qZ0bPKH396RSzcXaVxkxnp7+6TKxxY2pMd8jb69ZZCwgyDlMohOt7O7wW5ZGgPYpH5zKo5e4THHBx5Oaza/XXP6+6wYY8bAVv7LB/BYiJCHbYxWeHVcWl21TJ7W7UW2j9Sw5mDCTziXq0qFkU3zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhIwFLh3Kj6JI6W/DC0GqICH6TTqr8plXm5G561KH6E=;
 b=VUEdsDbbzZ/a55vmo0Opk6pTEobzxMWM2Wa7UEANi453/v2SeW276fDt2/dXPSFLik2S63XTPjXxg8FX0+z9+6ym9wK7y2Vbc7S1+pE671JifaTaD/Gi32ZOBQi7zj6L2Tt7e14qGa/1YByrP/T+eiXcUttH/3rssg4K7SMJLflrN12HTOYMAXIR7KzJ7idW2cTx/1ohGxgAZ6lBqUv6gXh+yYx2KkywP1X26FBRrsXzogNUOjXbsn6gL3TH6vXz7oPuuTj/crr8Dtf54IAnnyAwdTagzqEc2ncoMMlmEE+48GMj6oajLcKNl3GYM13gS7JV5QRmBHkJ4oH9TD/rOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0191.namprd03.prod.outlook.com (2603:10b6:5:3b6::16)
 by BY5PR12MB4035.namprd12.prod.outlook.com (2603:10b6:a03:206::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Thu, 31 Aug
 2023 14:52:20 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:5:3b6:cafe::57) by DS7PR03CA0191.outlook.office365.com
 (2603:10b6:5:3b6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20 via Frontend
 Transport; Thu, 31 Aug 2023 14:52:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.20 via Frontend Transport; Thu, 31 Aug 2023 14:52:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 09:52:07 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 31 Aug 2023 09:52:06 -0500
To: <buildroot@buildroot.org>
Date: Thu, 31 Aug 2023 15:51:40 +0100
Message-ID: <20230831145140.2537382-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831145140.2537382-1-neal.frager@amd.com>
References: <20230831145140.2537382-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|BY5PR12MB4035:EE_
X-MS-Office365-Filtering-Correlation-Id: dcaf1c75-7adf-41b5-744c-08dbaa31e014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e1+MKwx9LCJBgJgnlcg6OSgCvCmEYkSjwZJqnLLLAn7GQ5MFDz/SgF2D0bsUbxD4VmZidlwuetDI87nfyUcud25QKbPRV/lqqdFhS9EFXAcksEgYJ8yGbTZ6KrOa4wXQLnMCZ/Sb87Hl1Wlg0DuNXpVbsF3dXhDrEX65BxW9HzSFkrzLF3vCNSs98G0VFd4OM2cqF0Lo4BfyeUWqIW1gek343UMLdy27y3DrArf7uTw/dvtLh8nVDAijIGcSqy7vfrDe1dp7AAUd1NIFZe5X8RDWVfcplPTZbxMfpu7nzKJz19h73GhjCSGjOsmrDLKKkNbY2QabVdAmNzWhGjJXzgIl05RbXhVpAyICMp5WWM2l7roVWNOmQR5Le+cuH16S1nGLZ0rterigED7WTqliSjSUtlVpugf6K0jNTXJV3d+/94I/feRavoBzrDtfTmEBArQUET0/qbamqr7J82LMWAav3uDbDDjZJ/m/ci/aAazVatFBs6t9rPuzC6iggi33imfUxGJ+Iz3sJaRbf1Zz57z62HbKflbXj3ie4GAwo1HGAMjAYrcYApo8uI6G+erSrPiB8COutAjtRkDtkCZaATNu4NQPqdIcMQ1gR7jWGGD3t13vUHpWNKWmg+mDMbCyk0vd6/cH6D2N6HYVJkoIvO5G5+5lLU4lVSCX9I2omkETJ+7wYBOwhWSG1a4cVKvrZU4qM835LOalM3UcRftYsvdW/xaooPrz9aMYunPJednEGUq5joDL5/JxfPTGD58QZF6l+gv82Z2JKpVLd7Qd8g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(1800799009)(186009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(41300700001)(70586007)(70206006)(40460700003)(86362001)(2906002)(54906003)(316002)(4326008)(8676002)(8936002)(2616005)(26005)(44832011)(1076003)(36756003)(426003)(5660300002)(336012)(6916009)(40480700001)(83380400001)(81166007)(356005)(82740400003)(6666004)(36860700001)(478600001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 14:52:18.9957 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcaf1c75-7adf-41b5-744c-08dbaa31e014
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4035
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhIwFLh3Kj6JI6W/DC0GqICH6TTqr8plXm5G561KH6E=;
 b=Jj03ly/togr+L8fH2mhPzjlqL7o+xV2OH/aJVFzZdNVdnq/LdR4em1Z7diLXb3zdpDHJGnfjVByxa7bHB5ZSl9YJ0di4S/5bEKr1bAGbBqEmvdsqoZbteBmPN8SESukZf1a0gUErloLNtT8oFxQIBSWE4T2W17Vikue4JAWvctU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Jj03ly/t
Subject: [Buildroot] [PATCH v2 6/6] boot/uboot.mk: new zynqmp pmufw build
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
---
 boot/uboot/Config.in | 18 ++++++++++++++++--
 boot/uboot/uboot.mk  |  5 +++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8b726eaa57..a67e5d5411 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -494,12 +494,26 @@ config BR2_TARGET_UBOOT_ZYNQMP
 	  Enable options specific to the Xilinx ZynqMP family of SoCs.
 
 if BR2_TARGET_UBOOT_ZYNQMP
+	
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
 
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
-	string "PMU firmware location"
+	string "Pre-built zynqmp PMU firmware location"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 	help
-	  Location of a PMU firmware binary.
+	  Location of a pre-built PMU firmware binary.
 
 	  If not empty, instructs the U-Boot build process to generate
 	  a boot.bin (to be loaded by the ZynqMP boot ROM) containing
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 9f81c0b842..2078fc81aa 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -410,7 +410,12 @@ endef
 
 ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
 
+ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE),y)
+UBOOT_DEPENDENCIES += zynqmp-firmware
+UBOOT_ZYNQMP_PMUFW = $(BINARIES_DIR)/pmufw.elf
+else
 UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
+endif
 
 ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
 UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
