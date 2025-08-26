Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F44FCA0EE4
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 06:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9B788493D;
	Tue, 26 Aug 2025 06:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jMlVNjjpZHKY; Tue, 26 Aug 2025 06:10:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D44808492D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D44808492D;
	Tue, 26 Aug 2025 06:10:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07315CD
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 06:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED9456F743
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 06:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLVX9g9wXwBt for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 06:09:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::631;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E9196F75D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E9196F75D
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E9196F75D
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 06:09:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFG/r4SzhCVgY7ohrnTe9fwaohDIW3ZDtQdETRi5U34vHhv5Lzb6C4QFm7tl6HM2bXz8+h9lU2Pn6wsrzvDyLcpDS/gW7gs7KGvv3BtwHZO0Y+Cticv5zQync/f3uKh6/VCFs4aqhd+QqsLQSCHkoIUIgRdjrj7G0GTM0CasUbJIhJ4fVU3SRSehvv9SXcTFxXTijgO39aBTJOY20kIaNGywZe5tixxe373Cb53R2xPwbIVm/elNEZXxJMyMmrSsn33jRJlYZfrtvuR7Y+f0LjmxfE2va2JQ+FftJ3noruuXY2RNeY6q0oDAmccDorjT1ZMRmkJlkU9kSokIgX4TqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPq3ch9oSy6N1toZ0UlRwvDJgp1YQDkwPZRVRRV/p8E=;
 b=mh71HAjcasuaAiV4eu776lqcTxG3/cu25dqTVVWy5/S27QlS5lNJEEmgsSykCBraafJzOjbo0Ubmtx7TV2OpKEmOYmGNN3xTMRLnh/gDd70mWISSzPorkRxvuZi9Lpm/qvvTDYMmqeFqqVk69RoMxQT0CqrMoOUTpmMonFK1bZlfDP8IYylFMqxYJJy03HNI896UdSXEpgJqOH8pUmqeBws/polJjutH/CxbRdi4BW6XwD0IfUzcjmSQ+OkpoLzYj7HZoTC21g8FOIOeSjZhCb7kCU1qc5MXoB142tUTfrWUMdmDVi4ILeQM4iOaTGdv12ZBhBkPctBPqaoFKDsj1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0114.namprd04.prod.outlook.com (2603:10b6:303:83::29)
 by CY3PR12MB9654.namprd12.prod.outlook.com (2603:10b6:930:ff::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 06:09:51 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:303:83:cafe::b5) by MW4PR04CA0114.outlook.office365.com
 (2603:10b6:303:83::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.22 via Frontend Transport; Tue,
 26 Aug 2025 06:09:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Tue, 26 Aug 2025 06:09:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 01:09:47 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 01:09:45 -0500
To: <buildroot@buildroot.org>
Date: Tue, 26 Aug 2025 07:09:39 +0100
Message-ID: <20250826060943.1394934-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|CY3PR12MB9654:EE_
X-MS-Office365-Filtering-Correlation-Id: d7329b38-2252-499e-60e6-08dde4672a08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y68NcSwf0+rBE0/szwntlUYB0wKCZkI3zY6TuQNjtUIgWy8ddl5ThyIbLB4Z?=
 =?us-ascii?Q?p6RbfOM8HK6DeRfFWJ0JlyOZP00tZ7gcbwjIqp7p6McyGDNjS1InpDVVksMp?=
 =?us-ascii?Q?MJrMC9FXjiJFY3F7M/JT3VAvh7smub2lNRk4k4crwlSWdpRs2Rnpw8VMic3x?=
 =?us-ascii?Q?Dk/P2xNDdD9fjHP6xi5P/GIMG9v7xVjQQ6fC3ONzP8Bq+CzUNh+xmlOmAUfS?=
 =?us-ascii?Q?q45WPDnvZH/+QkZm60vUjmDm6ucSaHvTdYAiqmgSybggJKdmx9qQXiDJ/Q3D?=
 =?us-ascii?Q?iZGQPd6cfqAagQbEGPmdM3wMzElk7iiWBwqWcCNamoh7ZimTZz93Hz9dV42v?=
 =?us-ascii?Q?mMNpuYHxstgNPLRz9/Q2KiZFme54/tfKXye+JDjpMBpzWU+Xvpox2X05dLPZ?=
 =?us-ascii?Q?tAlT2iQ2YxW+n1feL41GRwKNfGxXa247Qpb7tLWITCb0BUtHRatBatTrTMlo?=
 =?us-ascii?Q?1NMjLqb/oJT3EP4S80CEHgIvIuNbxw6Bw4s6i+c8a8vTx3B3iZEJLCSgICEv?=
 =?us-ascii?Q?v7c4CvCHc4z51F/ETf+tfH8BrVvs//+foUxI3cgNVtJiuFzPwdgqdXsyWSr1?=
 =?us-ascii?Q?yuLNmi+YHyL1kqcbXBXxFGSjmIpsM2oyLB+QbRXXYeZrLsH0uMF/YuRz4iJ5?=
 =?us-ascii?Q?evCruejsZ3EigrzTYpSw4WUvUInHa2xAoU1ab/8Uj7OVtNV3S17PqXACZy3y?=
 =?us-ascii?Q?UogrcjDi3bxhNOa2fmAu79pJR9ru+dsOwO++FAkCYlI69sjay2mcXvc289a4?=
 =?us-ascii?Q?EZdtbe3Ba1TFJtkOiOxwzOThC/iWIHQ4Jy8jXDSDLFWEibCJMHiV9QhWjG7i?=
 =?us-ascii?Q?HuiwDGnqb8ZRbd1L9/F7mI5lRlOQfd5KF9yzK8mmIKIgG1Zh2h9c0KtVchZ5?=
 =?us-ascii?Q?z/UAq3EhSYlEljoEuIpE/WZoCFOT2HejZnhUYKGUS9CzRonPPc1t4vri/wUd?=
 =?us-ascii?Q?zZWsPqF/5mTRXpVDfLAKeLYojwEizVCsVtpxPBGuBdzJCFrTVqDtIXMuHSJU?=
 =?us-ascii?Q?WGAqx/4awEF+Se6pbxSbXvX5LYkR1IDDUVVJhkIRmdh3Mnf8H+DJwExRGG9F?=
 =?us-ascii?Q?QvUde14KBHcr7ffz6RBnx9+lYbws9JuYPLzc+SY7MwwLaekAlrA1BNdrrKPi?=
 =?us-ascii?Q?3iSRJwoSKcUrMqVZFKqxW9vBHSJ3lQ1wrCoCreGmYgCJUkVu+K59tSzvEcr6?=
 =?us-ascii?Q?RFjJvSpESY45UiohjVwaWyN7OEljZnGVrMLP8zbvQLhTkKReTXUbv35aoGMr?=
 =?us-ascii?Q?nc83+6e+3TmA5WWXbr2aTyCQce2Toq8Sm5PKq7p+XahJpuINTQL4Re1xpr3v?=
 =?us-ascii?Q?blwGZbD4flIpvl253VyGERe2PorsUTtubHyr0RTbcAQf/G2EouC/1zQsHLN4?=
 =?us-ascii?Q?plsrSfhCGcjVUKkiiCBOZotBfv1NdJR8nG0kwE+fzfzfnWmOpHFVncrfm72s?=
 =?us-ascii?Q?RY/Fm2bc+i5Wgir7DYdcypmVWTXFpwAftfC2ZWj2jJQ37ZRBnDgvpVpJDG86?=
 =?us-ascii?Q?9ATNqjvwX8LzLwWJfylHf0kksoMEE6tgjpS1YXMJEsc8aT01jBUjwq2Q8ijz?=
 =?us-ascii?Q?AkbCgRiWkHshMbocIUI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 06:09:49.3090 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7329b38-2252-499e-60e6-08dde4672a08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9654
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPq3ch9oSy6N1toZ0UlRwvDJgp1YQDkwPZRVRRV/p8E=;
 b=kJ36k3Pihna3XKsG+/jCsduXEK6GxGWlDhpp+q8PqtuY0ogl0j3en4PPTvZYznRJIaiwFORM3X3ChZSutn6xYFCnHqi8VNiDn2NfU8FhPJl1pxw7zFMZhp4DxPunwGl/SeCX67wEF6pyD2+mfC7rzA0sGm2pehA9AYYA/7O7alo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kJ36k3Pi
Subject: [Buildroot] [PATCH v2 1/5] boot/xilinx-prebuilt: add support for
 plmfw.elf filename
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
 yann.morin@orange.com, brandon.maier@collins.com, manikanta.sreeram@amd.com,
 ju.o@free.fr, Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

AMD / Xilinx has made the decision to change the name of plm.elf to plmfw.elf
in the prebuilt binaries repo starting with the next update.  Both Ubuntu and
Yocto build flows are adopting this new filename.

This patch updates the xilinx-prebuilt package to support either the old
plm.elf filename or the new plmfw.elf filename.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- no changes
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 62b60b88fa..5d984c4f82 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -28,7 +28,8 @@ XILINX_PREBUILT_BOARD_DIR = $(@D)/$(XILINX_PREBUILT_BOARD)-$(XILINX_PREBUILT_FAM
 
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
-XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
+# Supports either plm.elf or plmfw.elf filenames
+XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm*.elf
 # Unlike the psmfw.elf file for Xilinx development boards,
 # AMD Vivado Design Suite currently generates a file named psm_fw.elf.
 # Future versions of AMD Vivado will generate a file named psmfw.elf,
@@ -60,7 +61,8 @@ define XILINX_PREBUILT_INSTALL_VERSAL_XSA_PLD_PDI
 endef
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
-XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
+# Supports either plm.elf or plmfw.elf filenames
+XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm*.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
 # We need the *.pdi glob, because the file has different names for the
 # different boards, and it has to be named boot.pdi when installed.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
