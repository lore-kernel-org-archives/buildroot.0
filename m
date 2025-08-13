Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC1BC87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 11:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77F4260880;
	Wed, 13 Aug 2025 11:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJzwQgSWOeY1; Wed, 13 Aug 2025 11:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CF6F6086A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CF6F6086A;
	Wed, 13 Aug 2025 11:51:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42E2D1C9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 11:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34CD481D21
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 11:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hyXGh9W1KQSj for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 11:51:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::60c;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F8A281D18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F8A281D18
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::60c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F8A281D18
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 11:51:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gl+L1lQJTbV6qVGxQigtQ0nn1Rd/yna4gOWiXHM3s+Xy7lV1VGQvCg3Iui9Hqc8IzUjo31tV5j04GgZpumkeGfh7k4/VO+liCaOK5THKRunwxQBysQHTgpqKCezSw2DN+N7T+q2mWTy0a1adk+P7rg0o2ajTdwQ6tFc7QMNyfqDLvS8t7XtPE2d0ZYLNKcz8CUTdCTZdC/8ineJrH4Pu6rKFHW9bwZZ4/woOI2U66YX4u1lt7hdYntnPvmT1JJEJ7/+qiUt4us1u3B5JlnW5V9o+VGJNAroTdt7/GHprk3QmlSgQFtAtEj54qA5CiEpLpEiHF6GacqmiKTr8ycYn0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lIk2jZaL/iJ4zLkELyaGLnG7jgmDDxFFHzeWsqQUMU=;
 b=OuSdPyK+OrwhqgeQ4n5OZR+B5HI/EXwAa1bOjuXecrFiuFXVhu7jnMVPFGwXD2e5DoZo+BAENPG8klmihUsspGbZJdWgvlmM2KXuizLPcXdKo36XF5WR17GvwcDB7UXsXHdCq/rxpP3zSUm/arnb6NDI7X/lKG3Mhk01rcBpxMO2UmBPvW/LLSZFovYFkGCck56AeG3iLpawahnXNomBCZyQ1y0Di8HRzqb9K1hd+ql2Ze2GMjPnOmyUA6bshY5RDogMG3e8s3s3xOsXStLXZERyS1o9c8N195dfyNIj/QEXylSMg/X4YafaaqlA3r55JPwMezcxYJYUY+9oNbjjHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN2PR14CA0003.namprd14.prod.outlook.com (2603:10b6:208:23e::8)
 by CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Wed, 13 Aug
 2025 11:51:09 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:208:23e:cafe::5b) by MN2PR14CA0003.outlook.office365.com
 (2603:10b6:208:23e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.15 via Frontend Transport; Wed,
 13 Aug 2025 11:51:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Wed, 13 Aug 2025 11:51:08 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Aug
 2025 06:51:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 13 Aug
 2025 04:51:06 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Aug 2025 06:51:05 -0500
To: <buildroot@buildroot.org>
Date: Wed, 13 Aug 2025 12:51:03 +0100
Message-ID: <20250813115103.2842781-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|CY5PR12MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: fba5cc8c-fec8-4f70-97cd-08ddda5fb10e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hKud0li+46WNhHQhcoXdDSdb1kXG1yqZDqGw3QMQRCgLcOPryxwDUS/OxbV2?=
 =?us-ascii?Q?+TTqP+6VQhXPAh+wMORSW/QlFSDmwU0uLFesIF4uXCuBYlvqJPgOfDeb7UHU?=
 =?us-ascii?Q?OzLqZJwSAQ9r7f6UXiGmLWr1FzUavHsH7NLogKaZW3CVSw2BDBCf5BkIKuy5?=
 =?us-ascii?Q?iYld/crNYO7DN7gLzx13FPlSK9ZKZR591sWO11aNxIB+m587eeY9wTpmDjjZ?=
 =?us-ascii?Q?eilc9HEl3+JFbA/d8IeHqbxLZAgt/wR9fNsPdNV7a1+//XhW0Pxa6EMC8dxx?=
 =?us-ascii?Q?Pf32rex6a15VewGCx4JXtc06BBy4FJIo4iHtHLSJoS7nIJuNglPM89ZbILRr?=
 =?us-ascii?Q?GzXN+I7891r77M0HsQMlR+L6PlbfaB+2H/4yK3vvgtHTzEgiw/hgthxeHACa?=
 =?us-ascii?Q?VoKfWe6C4V+DhER7100+Anti6Sa+/2ItSNm6eSZLwKBsQwcbTX3dIJXf5yXS?=
 =?us-ascii?Q?XeARkNCRakO9mCnaEcx7lGijzGQroDJnl2Cv2p3dYD4codvSuXyJhyrIP+E3?=
 =?us-ascii?Q?4REEjX1PmXcyiJXZblwEzxfC4ioVW7mpQt/2kbAY4Yg+VFzKIqKQDf2DSNcb?=
 =?us-ascii?Q?N8MYQtPYA70cz9MPCgOpp7ji0ciX20d9Zp9yQ3h9QmbpdBqhXQB6H47N1hHW?=
 =?us-ascii?Q?VbvhGpYrTmfYCeiABZcLjmwdUfpOo8TM8/c2IOwQW88mWZ10wbrQT6syiciz?=
 =?us-ascii?Q?SBVkrIWF37QgIsLttzpzCJHi/wDujA+nKgeKmh9st6ZeO6nhhysd7BuWustB?=
 =?us-ascii?Q?2W8DBbY+kxJj1QAir6feWOocV0gierPHPuenoXG4ICN6YzkPAwRIa/OO4paJ?=
 =?us-ascii?Q?wCPIwN8AuHTl6aypqwiBgIwunXTesqRflZIKbZ+k517yI5Imfc9MAQFkLOxT?=
 =?us-ascii?Q?S5y8diNDv8IXbFpj34VkAf0UQGOXBNwnrQb92ywm8bsCGosOdww91JqklLON?=
 =?us-ascii?Q?bBYtdwCW5CZGx85y2uU6b8tQSrZtgYyURgomHGyvg/xBJMssD6AO8FFCF2Ax?=
 =?us-ascii?Q?uMNwraIeQYJ3hGWThxC11typSvAkEdseSNHATr4/2uDybOYMuoOHOxQIceDx?=
 =?us-ascii?Q?MqmfptsmPlRpejqxYWMuNK450u6uHalRzjNeDR3GeoS/5vAH8cG71kIcPKW7?=
 =?us-ascii?Q?222d6wkSmxtoZhrR2EFDXt1AnTjiJdbYuAlESyvwhcUZrOMK5s4pjVwkXW6p?=
 =?us-ascii?Q?XrGEq9/S+Nxtx/9JZ1AD0ejVbT6K74TaUR7ygjxb1kEBooANuQn9tKiWhhxW?=
 =?us-ascii?Q?rrU7qnlWvv11bjdHtRpmU7AlZc6hCJo9jtVCGfJh14mRlIrKXSiMPC1jxl57?=
 =?us-ascii?Q?fBjrp98EEfaH+GUEBMtujfL8aojetwDXZIOn9kYIc2YgnPcPhASa116cdYR2?=
 =?us-ascii?Q?Ke0+F1zPt2G01J0/cp60fahOaos/Yo9UozSr3v0F//QHpW/b5Dx4wySAncRU?=
 =?us-ascii?Q?aFpBRexsEJfJkokG1ICaGKclEkyMsUeH3wDEdSPWIS+tYA69Mri34yZqiW37?=
 =?us-ascii?Q?nmYlZLbdcJTB4O4ktresJBfiYm2jVgbr7s7yRoQkf6IKyx+9NihGemofouFt?=
 =?us-ascii?Q?57z/7/1/xF5F61kJ+EU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 11:51:08.3333 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fba5cc8c-fec8-4f70-97cd-08ddda5fb10e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6108
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lIk2jZaL/iJ4zLkELyaGLnG7jgmDDxFFHzeWsqQUMU=;
 b=M1h6qor5qPsJWVTjgeTeJHWN3pfBlIJSl5LZx0LljJ+YrKtoKh5/+jzkJUFkDRh+81KcKNJZKu7pqxa4uez00YSK1VI+7JtIoakkZT0IzsokHk6FBAlTEUgizhsWDpMOj8kBuuPA+Ngi+Sb6LPG5/xwB5jBjkbRnhPPEImj23BY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=M1h6qor5
Subject: [Buildroot] [PATCH v5 1/1] boot/xilinx-embeddedsw: only allow apps
 for device family
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
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds an architecture cpu dependency to each application to make
sure that users can only build applications which are applicable to their
target device family.

The versal_plm and versal_psmfw applications are specific to versal devices
which are based on BR2_cortex_a72.

The zynqmp_pmufw application is specific to zynqmp devices which are based on
BR2_cortex_a53.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- Replaced new family variant config option with an architecture cpu
  dependency, so no new configs are needed.
- Updated patch title and commit message accordingly.
V2->V3:
- Changed package dependency to only appear if the cpu is BR2_cortex_a53
  or BR2_cortex_a72. This way, the xilinx-embeddedsw package will not
  appear with zero application options if another BR2_aarch64 cpu is
  selected.
V3->V4:
- Added BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS, so that all arch
  dependencies are in one place
V4->V5:
- Replace leading space copy paste error with tabs
---
 boot/xilinx-embeddedsw/Config.in | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 0dd6433608..2bc4bec7c2 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,12 +1,20 @@
+config BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS
+	bool
+	default y
+	# All Xilinx SoCs using this package are aarch64 only
+	depends on BR2_aarch64
+	# only CPUs with corresponding firmwares:
+	depends on BR2_cortex_a53 || BR2_cortex_a72
+
 comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
-	depends on BR2_aarch64
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
+	depends on BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS
 
 menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
 	bool "xilinx-embeddedsw"
-	depends on BR2_aarch64
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
+	depends on BR2_TARGET_XILINX_EMBEDDEDSW_ARCH_SUPPORTS
 	help
 	  Build boot firmware applications from source for Xilinx
 	  boards. Users can mix and match applications to be built
@@ -30,6 +38,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 	bool "versal plm"
+	depends on BR2_cortex_a72
 	help
 	  Build versal plm application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
@@ -40,6 +49,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 	bool "versal psmfw"
+	depends on BR2_cortex_a72
 	help
 	  Build versal psmfw application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
@@ -50,6 +60,7 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
 	bool "zynqmp pmufw"
+	depends on BR2_cortex_a53
 	help
 	  Build zynqmp pmufw application from Xilinx/embeddedsw repo.
 	  If selected, the xilinx-prebuilt package will not install
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
