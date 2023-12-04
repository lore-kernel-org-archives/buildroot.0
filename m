Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787E0C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 07:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EDCF80BFA;
	Mon,  4 Dec 2023 07:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EDCF80BFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hkUYXn6dEJrc; Mon,  4 Dec 2023 07:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36A6D80E70;
	Mon,  4 Dec 2023 07:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36A6D80E70
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63D0D1BF33C
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 07:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48E85413D3
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 07:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48E85413D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L9d5iDtljFku for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 07:35:11 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::616])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83715410B8
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 07:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83715410B8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSmrDFGsIEeEwmv4rzj+a6U/Gkiq9BiUQa/RcpRwdYOBUVNu29YMR1hogEi/xcwR2oZWUYw5IOUvZmgmomcTWz83jBVflJScY4QXAhtlyfCwkoTLh59MFEFscWDm42db7oPtWS8yB77mu/BdMsk7/ejGfdZngUUEDP+3gLbwq4ZpalieRB2MqXP5oT3umQPMSeiZ2UI3lmJXhL5mrPuQlRvVWC1kYmM23nrHic4rHvW1h+2svBcjGKrjQClcXM85Ps03D/UsfcvsYC/ye51pfK6Mk41s3zXmaNI4xYNaBWPMiGjlirWbLwoZF3Bo4XKOA54a7LhoWW2YIOXrxrIfqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QMLO9IK6rd9qstwhG5G61qmqL2Y/6GCAoN9FIJs8TE=;
 b=Ejo74rMZId7EcfVunG3ihvfwFtiMdOvoiH7CFAm7KtT94keOo/C+nkSG1r0mDVVvteerlnuknem3nWoPrPLrd3wd3yL5t/X/SbaaNRh5QEY9RoDpDEZTt5nRZzk3gKOLyP+Wz0Ci0u7jfFE2KF39VnkfunXU3VOyv/LEzOzSmvtsslYHfZMh8RbpBA0lyk/a5/sldm5XMTVy1k5XIYv1I9dFf8epTMV7yL8h5+xMVYMwS3jII8JFFpQaGuxc5htv5i6yLnTRtpWO76eeSUR9T7l3v45AqZilem5DyG5i1BiaekVScsq5Rvv3pL/sajGKzEOlRqB//ExLNt3/x1mo9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR11CA0004.namprd11.prod.outlook.com (2603:10b6:610:54::14)
 by LV3PR12MB9094.namprd12.prod.outlook.com (2603:10b6:408:19e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 07:35:08 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::64) by CH2PR11CA0004.outlook.office365.com
 (2603:10b6:610:54::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 07:35:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 07:35:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 01:35:07 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 01:35:07 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 01:35:06 -0600
To: <buildroot@buildroot.org>
Date: Mon, 4 Dec 2023 07:34:38 +0000
Message-ID: <20231204073443.1543587-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204073443.1543587-1-neal.frager@amd.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|LV3PR12MB9094:EE_
X-MS-Office365-Filtering-Correlation-Id: 98286d65-03f0-4831-7efa-08dbf49b8a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MVe0f5Q9EWaJ5R1eSJcwPv8yVBYfWfoRZfa0TtT2Ko1PznYr33tlaeayvlXwGSmhzs/0DJQVKq2RMV6uJWu1OaJHw7eKJdn0x8eXNyR+MFbgVWtMaJNiM0f5wiIBPXLkmyMu1d/TMe/2V8zfyYL18lGpcaAVpVr5YlGaSgaiRF1C4YVJYZOeJJVokADz75RuYnypj3RKfezA+vpF2iSYhHHcuz6evg6HRmxZOFKUmtXbkkD5vTxVLR/jvt9/HW3K3efpDmhSacAJCkr5e8I3CYIxg0KVWp6h/5PDb6YjHHmXpryD5rdE9usKhv2NuSsuyBFRQmVzByhLbJHtRaslfjg2i9Abi85qZcmO9kLlY+1kROgVRPEK6ZLYUrb5/msJFnFHff58+BnoSaI9FNXJR2lT0Vq/AQI8sqXSmmSj1HgQyWIR+haJ8DtqyDj5pgPY1z7jTiZ7sUb8Hse5a6ATGcc4WfhO98PSZ8HZxSbfxWOTahmolGm2/0G+NrLPUSQ75ACFZCqQ364edtxgVTzmSfwlmAN15P4Ni/BvDS5SRcbL/8SJaS9ad6kO76uldQ5WsImDVMMMgQBCByOfAFwEd5zDK5tC8+XWL4al8q1Zs1tQTPhZj0Yg8DMLVgT3gPbGXw0tYdCVQkMnFgbsKNKLnh1H31VqHZV/xQJdZ9/iBWaTJ70ak4AuTFzo0PeS2SaxW5FW3oJec1q/OuOgL/MEBDouTGxfYq5FRxr6hX7nfd/w/CtnI8EwayWqnNHb0MwAqaDkT2A8ozOv69/IDn5/xw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(1800799012)(186009)(64100799003)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(54906003)(6916009)(70586007)(70206006)(4326008)(8676002)(8936002)(316002)(478600001)(40460700003)(6666004)(5660300002)(36756003)(41300700001)(2906002)(86362001)(44832011)(40480700001)(81166007)(356005)(47076005)(82740400003)(426003)(83380400001)(2616005)(26005)(336012)(1076003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 07:35:07.7162 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98286d65-03f0-4831-7efa-08dbf49b8a26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9094
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QMLO9IK6rd9qstwhG5G61qmqL2Y/6GCAoN9FIJs8TE=;
 b=JG+bFCSI4V5nkZJQau66mnkc3qa4PJaU6K/2EoRHsCWhCH934pLSfTRrMDsjO7IEI/mbP/BsJ2wJtcT9rUqU/MoWB//nIxjA3ki+UDXicn1K8TY+HF70Qb4604cpB3/7EIEq7Zx+IsPxcjetRg/cWMCyNKqqxBZvmtI03eWbIJY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=JG+bFCSI
Subject: [Buildroot] [PATCH v8 06/10] boot/uboot.mk: new zynqmp pmufw build
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
V4->V8:
 - no changes
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
