Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62ED6CA0FE7
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 06:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08EF16F795;
	Tue, 26 Aug 2025 06:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxk2__QN0LSM; Tue, 26 Aug 2025 06:10:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08EDB6F78B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08EDB6F78B;
	Tue, 26 Aug 2025 06:10:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 637D1CD
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 06:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A4D642B63
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 06:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XTrgsgTSyiyD for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 06:10:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::616;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F60F42B0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F60F42B0C
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::616])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F60F42B0C
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 06:10:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwVeyW7XkTX08Nep5qIYbfP9syM1lSPMZj5ACAISWiHsPCgPZdK+2vfXAasgS+DYX57duuEZoNQ9tUkn9qhTp0n383xmiPAESkWcNr8elHNcF1pf1VAqvy7466MwSPEw/ZuxyHlLh+diS1JZDF19dKuRRBM1tIPLsM31XzJS6xeMyGY+W6WhTzwslGAZU6htVfqX+KLaS0oLuiMWSkqdXwhFV2Z6N1DZ8cqJAUN6nuwLp4QMrjG6anaDZcx63XSDdql95ApV54+IQsC+gCglchcKqA5qq7COZX4BOIwZNokBPKnUrVRIV7ceGebe/BTrWLa9H4oR2+E+d3EsIhT9Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/X6/CTJ15YK5IS8A/8oUCGhV+Mr7uf9IJS+z7eMtrM=;
 b=JXkm4dYED6StJ1OtZpk7lJX+OfhNOiIj1C7+d54aGmNyOeFoulv47FkDD5B90SIyu3OEoakyx5MZw1SL0Y7X2ADp8gtcgd1PnN8pKaAiSgGOWUteAOWBzdvlx6NgSvwRUB5B3Kl3iZW9HGJtWgFb9hPQEqS1WoJcECFIwCXkfO5Me5M4eW17HGtA2sZK1Mc1kzy0zL814uF3GUjZv2P5MLAzGIuU3aoKX06yzYoz89v/2JFhzsOI1oScPgkM4HAaAgxntHu7VrcuEU6xGpmI5LWjqFT10sZ7NuVZYPtksqM638Q9HDxF3q8UJ6rvxSBaKRZ3Z6OtmwF4BfEj078vYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR01CA0010.prod.exchangelabs.com (2603:10b6:a02:80::23) by
 DS0PR12MB8197.namprd12.prod.outlook.com (2603:10b6:8:f1::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.21; Tue, 26 Aug 2025 06:10:02 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a02:80:cafe::d9) by BYAPR01CA0010.outlook.office365.com
 (2603:10b6:a02:80::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Tue,
 26 Aug 2025 06:11:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Tue, 26 Aug 2025 06:10:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 01:09:57 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 01:09:57 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 01:09:55 -0500
To: <buildroot@buildroot.org>
Date: Tue, 26 Aug 2025 07:09:43 +0100
Message-ID: <20250826060943.1394934-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250826060943.1394934-1-neal.frager@amd.com>
References: <20250826060943.1394934-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|DS0PR12MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 17fe0331-619c-4f7e-cb58-08dde4673129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J0CTsofam5sz+/qfLko4nSMJXPYpHzJKES4b18iDdS1Wx0C5byFq51BVtDgU?=
 =?us-ascii?Q?y7i/Kyc+tOUm+FKhylbWKP9QJUxzpzjoQjdBrAtfBuFxoQFZuacTEB76NSab?=
 =?us-ascii?Q?xfYUHlIe45w3DQe6YvynmYAxQMF5/r+sp5p6fGYGl898GKkr1KbLSkQL6cho?=
 =?us-ascii?Q?Y6FAWoXCdxQffGOt4ZDqoEocIQX02r/SY+6UaA4ZMzjStrOKFxDJJRhfbCUZ?=
 =?us-ascii?Q?rW2h8ApFTBLCuF9vusmUTXT1Lv0B2k8ZzdmVR3A0KgB/xxU+y3+FzGeYgsMK?=
 =?us-ascii?Q?TYEvp9JpvEqqnuPGWGocK2uI/qcygI1ZAIP6qghiwVkPr2ZBnuqxqL2LVNTg?=
 =?us-ascii?Q?47ieHg0QFmbDwzWm86vt9m0mOTJRjF2sjC2Y1YWUEgJMtsQgeka61LkDbRXf?=
 =?us-ascii?Q?N8EO4gJ9DmPMsmLEqO7vTWwDp3zzLNyrDm5kkcamEdpeZWBPtHq1B52fI6h+?=
 =?us-ascii?Q?zazK5N7McGZGL5gkWD//nFAv6FYZv31BoZZb7DapwfPe+FWnpC1/nv7dVOlB?=
 =?us-ascii?Q?3rr0kqL0xVp2MZgXXx3I7+6sAwRVRevkebBZGTxeQLidGOjoTlx6xIBU0d7M?=
 =?us-ascii?Q?AZoPsl2uSQje/2ftFEegluR+/UOx8jCHw/7dJnxkd19q45zN5FcCxLGWsb8t?=
 =?us-ascii?Q?IF0tXZESMdySWP4ZX5rBjShJDpthzlH9uXG+v+REsoo7NRvSiyTOZorC7zsz?=
 =?us-ascii?Q?3MWDU7FD1oybZ+XyZTS723wITfm+E8USo8Jpe5VCP2EFTZwBJGW1kZ4qzq4j?=
 =?us-ascii?Q?Ce4rQ/VPffX4V4h65yC06ihbzuZxgYin7N/0rd3HDw7QdHGaJliqaXE5XASR?=
 =?us-ascii?Q?3z6FZuF7H0GIySW5gUsk1znX2srd38czWI6lOwLR53H8TuqKWBJoRgtlR4o2?=
 =?us-ascii?Q?9+R9IsFDT1DfuxNGvhvQgLK0qXaolDddcOxML3M3nZDmCp1Q+FJTzvql/RBs?=
 =?us-ascii?Q?BWvRJMRhwiiD6oXYQUBT1oEWqsewu5ZCL0Q9X6O7ORdIf3jpj5E7BehdVhOg?=
 =?us-ascii?Q?fVOCpjIdKMCnt3kDR7uC1xrdiq56JUH3NH1S9IgfITMNQXGNkqNVDtF9jDIa?=
 =?us-ascii?Q?0eYd9xbRNKvp9+AxN+7QgqmoZDynKk0zPW47AmIergNqiv77Zx7b1uuU7DTu?=
 =?us-ascii?Q?o49JUaFvLZGOO0t/pyPneFkBjC718uRz8n3JBQEC50Sn5woqWpHmR4uog1ne?=
 =?us-ascii?Q?J2CWpOSO0BnW0FqhEa/MJ2dRqcpFsMAGSMSdOZtl//TyFxDXk3ogDjvTf32p?=
 =?us-ascii?Q?KoxGkk/YqUU7od2/WANQkSEFCISJi+D8yMC00TTf30lDvuhqrxjRxl0FKBu2?=
 =?us-ascii?Q?woRj9rxrJfmLcv7BBVwe1CM7TWlR6UNBk7nfviIqW7OC3Kf7uSbcuqz/5R+S?=
 =?us-ascii?Q?7IN0lgzkXnSTGk+3KKOf9T4Pq9PLT6vE+keysFSBWfKlnnMof+Us0zNGEEMV?=
 =?us-ascii?Q?sU+4+0hHCgFw7UCe9KGCfUqwYynkrhgleHiEfE81jMhRSY0ax9OEnUMbHsqd?=
 =?us-ascii?Q?CamNCGlLL52PMdRzWkH8t7AbxolJ3alRc59ZoVttQiTzWEN2UkTVvywaqZ7L?=
 =?us-ascii?Q?uDUYWuC7MGGpmRU+c5g=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 06:10:01.2732 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17fe0331-619c-4f7e-cb58-08dde4673129
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8197
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/X6/CTJ15YK5IS8A/8oUCGhV+Mr7uf9IJS+z7eMtrM=;
 b=O3qDsRhHhb1teg+fVbcfT1nLGPXrYgvBhzCxGfdlKIujvwelqRzczIPBA4xnfE/yzBO/Wmf+ZnPJxBaWd82ZYkB/swSwYfijgfUWzvxYSoQ1VNLaM+Q29iaR/LyGO0rSx3erQKR6XfA+nFAqGrDBOw1ze01Ejch4hwn10jRVmdM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=O3qDsRhH
Subject: [Buildroot] [PATCH v2 5/5] boot/xilinx-prebuilt: bump default
 version to xilinx_v2025.1_update1
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

This patch bumps the xilinx-prebuilt default version to
xilinx_v2025.1_update1.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- new to patch series
---
 boot/xilinx-prebuilt/Config.in            | 2 +-
 boot/xilinx-prebuilt/xilinx-prebuilt.hash | 1 -
 configs/versal_vck190_defconfig           | 1 -
 configs/versal_vek280_defconfig           | 1 -
 configs/versal_vpk180_defconfig           | 1 -
 5 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index 836cd8b68a..1bc6b3b8e8 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -18,7 +18,7 @@ if BR2_TARGET_XILINX_PREBUILT
 
 config BR2_TARGET_XILINX_PREBUILT_VERSION
 	string "prebuilt version"
-	default "xilinx_v2025.1"
+	default "xilinx_v2025.1_update1"
 	help
 	  Release version of Xilinx firmware.
 	  Must be xilinx_v2023.1 or newer.
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
index a8dee8f129..6879b88d83 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.hash
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -1,5 +1,4 @@
 # Locally calculated
-sha256  b9e2572885ad12243e10d48d9fccb24771a528b9f27aae1b29b45f0806ce9f1f  xilinx-prebuilt-xilinx_v2025.1.tar.gz
 sha256  48fd698a16f79b9a828c35ca5b2b50fe832149d1a2938c94c0bb6a2e249b0bed  xilinx-prebuilt-xilinx_v2025.1_update1.tar.gz
 
 # Locally calculated
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 8338e36a90..c9d99876d5 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2025.1_update1"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index f0c156910f..7d4f699af9 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2025.1_update1"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vek280"
 BR2_PACKAGE_HOST_BOOTGEN=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 6307cf115f..500298c2f4 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -43,7 +43,6 @@ BR2_TARGET_XILINX_EMBEDDEDSW=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM=y
 BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW=y
 BR2_TARGET_XILINX_PREBUILT=y
-BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2025.1_update1"
 BR2_TARGET_XILINX_PREBUILT_VERSAL=y
 BR2_TARGET_XILINX_PREBUILT_BOARD="vpk180"
 BR2_PACKAGE_HOST_BOOTGEN=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
