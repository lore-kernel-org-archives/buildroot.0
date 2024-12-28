Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F6BE77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 14:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73123606E1;
	Sat, 28 Dec 2024 14:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6x51VzK8Br1; Sat, 28 Dec 2024 14:58:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C64A6078C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C64A6078C;
	Sat, 28 Dec 2024 14:58:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A77F6F1B
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88FD280B92
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kPBruvwAlHa for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 14:58:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::60d;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F8AF80B88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F8AF80B88
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::60d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F8AF80B88
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:58:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QR5j/YuEiCWuvV+LPP8K51NS3+qZUpIzKx6TlHXsqH2bzI/DNbc2eApdrwTJDJihFhP3CUCvKKfgtYcBT+HYteTBlQrXSW7NA5SDxM9Vs52du9V3a+pHq/+uUB4Ln6zzcmrx/1Spo86c2e5rcSAQLVBsCZWET7w3JzyeWy+o6l8ptn/rzwiYM8GTlLtSpEJi/Wla3fSYl18hjCOJYIiwj1O4M/bmID5GgtEHxSbkcPAmr6BOOIu17EoUpofQNhyiaye6dsZigpDIfnLbpq9Hr+2KwWyZJ36JycL9jayAIJllXZtQyGfeSm+QSR49YFX+s3LgKGZpDhBY7rhQhxRwjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2jOXGKoX8I92pTmQxi9Z+MNJo9xLLO9csUUePruFD8=;
 b=y4HO6yOD+dX0co2TYW/OeMoneHloq5x7x9KsMbbS0b8kvTI7MGLXrnVAIxij3bYxL93cmROgGqiOdxL21/vfvcO/KtDeAIsEf+ho4FuddjzBw6wLrGdekGnI24yzq73nXAcug94vNFAvrPdhPloRx9ByC7cRPqsOmPK2+pwiqQ0yVy4WcQafzJyM9NqWRvQthb/WB5mTWGt32kyPDnhpRb7GrpcYm9WYIYeXO99zJ2zflIHIiUM+hY0CX/ebnxm4y9fxJu0wBsgi89lRU0sf/C/1DuOMcOAecNUwTPHxfNBspf3Al/gDIeIVcAl5DuC1KUR/XYf4FoV5sEksiQwCzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0183.namprd04.prod.outlook.com (2603:10b6:303:86::8)
 by PH7PR12MB7870.namprd12.prod.outlook.com (2603:10b6:510:27b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.17; Sat, 28 Dec
 2024 14:58:27 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:303:86:cafe::3) by MW4PR04CA0183.outlook.office365.com
 (2603:10b6:303:86::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.14 via Frontend Transport; Sat,
 28 Dec 2024 14:58:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Sat, 28 Dec 2024 14:58:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 28 Dec
 2024 08:58:24 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 28 Dec 2024 08:58:23 -0600
To: <buildroot@buildroot.org>
Date: Sat, 28 Dec 2024 14:58:14 +0000
Message-ID: <20241228145818.2211273-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241228145818.2211273-1-neal.frager@amd.com>
References: <20241228145818.2211273-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|PH7PR12MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e21768-7c0b-488c-600c-08dd27501555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mm5MD2XYp8wgmE6Oc4Rqa6gRcVP5Qb269V1nT91ezpViBsD/t8+mRoqMRQsq?=
 =?us-ascii?Q?6X/3DDOXhfgCZ4OPHKoSMHL3gpZUG6C8E1xbvR6kaTHykmfwU4TaE0gBxjdJ?=
 =?us-ascii?Q?wYWg1IAJLlSvOFFyEv294BiBXQrih6Zv1arDt+keXkOfrtOyQ5XVJCBf7Btj?=
 =?us-ascii?Q?cBYluV0KYdI39Iad6WH0D/Od3KdMVe2MTYoYA/da/a30axYULDL38uMCM50C?=
 =?us-ascii?Q?0KSdEtn8tSBAxIQgEmHTa5USwxykg837c8aHTyDHNtgaVb/5Zwflcve+2tQa?=
 =?us-ascii?Q?mywE2jONbWoRjzhoJ8fnDoEh8wMe1n+r8Wy0ypj+ppS2CksvPj5fMwIWzKGM?=
 =?us-ascii?Q?Z8/J0IryV5mHjsIewyg88PfMvuj/6lp6OUdBBiBGNkumMJpEUXVcmIXToe1b?=
 =?us-ascii?Q?YgLe3GWJD3Dg6gJNeaXbcfpraKs0lrMIYq2w6hj2mwNCQdlWKoAKu6IjNu5O?=
 =?us-ascii?Q?nYfFj4YrDFk0P8s0/Lgix2t/cpEXL7yCWhzdhWtKOEggc8NqAsXwiUCYuGU2?=
 =?us-ascii?Q?DxiPhCXxChsPd3GyVrEk/eShCs83J+It0pT00J/HjMGBkVLi6hPfRahpFLQH?=
 =?us-ascii?Q?ilEc/UMo2B3TAoB/QhzO26a7oW7Z/ngh8+l19xoVifnCt/bx+RMmXgqvvKvI?=
 =?us-ascii?Q?Yk5amEpfVRMzTbWpfpS2/ZA6SeMxwHdYykvZR9+6+yXxf6fCt+eBg4fs09nK?=
 =?us-ascii?Q?4gicP57CvhZ/LlMksyA0/6UHb/4TLGjIL8k8ff1foExEJ5Rmn/BYJtA7uosU?=
 =?us-ascii?Q?RAyiz2dzBsypRrIyM5lOXxItnVQBSnbCRXRA9K74MXPAK0AEn6bmwsjsy/zP?=
 =?us-ascii?Q?wq7mHwgpoX+S6opeWWzzTere7LLn487fEj2q+9hupbASGhtgXkpLfyKPjYbb?=
 =?us-ascii?Q?APwD4tjNZHvS0AE4He6LypXC3QE/XjvP1J+sHRkW4Z00ehjXEOzWBFN2R1F9?=
 =?us-ascii?Q?7xmRNpg6FpYAmGA8S1ja8dDUEGZeNeL7FM6My31aGUupb2E9QbKXG1zTf5YE?=
 =?us-ascii?Q?6sNgmwBLsi71QwnA0QoYI/LEDVWSdoSIzojrT8dTw8jKVQSJiY22RsVNc03Z?=
 =?us-ascii?Q?oPlqwHaCKvdPqQO21P3YkmfH3PtPjzx7P8EWRjYTK4SPME6t2FO6C7Qm6yEQ?=
 =?us-ascii?Q?K3nJqDpottNcjLRQ2Fvh4H/wlTdPz7otZzG9B/LKcJaHJInCXKY3NnJ60hQ3?=
 =?us-ascii?Q?mV9OI1QzL6rhxstL1ICxbgOOXvLwnZ9bS9OjM0llzRy8mVuWTO4fGSJ/BUhg?=
 =?us-ascii?Q?FFhIdcQOy5PZYQkzYzxl2JBgAmtBRaHwAl8ZElyhw4j3odDFgtyD9TC3bAkB?=
 =?us-ascii?Q?cFkg1F/X5iT1QHCpmWNozCgX3VcoeoFp2pzsPBjuDc8NrPgsCYsVwA7j9Bwk?=
 =?us-ascii?Q?pUAjmDLU2P/oW9Msj8EKxB6DbjaDzlFjCBasPoy/VcK1+3xgINvIH1wd5JqW?=
 =?us-ascii?Q?r9zmkSFeAKVGb2FvQg++tpZvgOfPmiPP0Js0jVYFaPHNM+vNVTXHn8jjolhg?=
 =?us-ascii?Q?c2GVa4b2jX2E7pXdPElfJxd1giepaF6f8x1q51fE2qZct/8ujYrQoqqq1A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2024 14:58:26.3542 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e21768-7c0b-488c-600c-08dd27501555
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7870
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2jOXGKoX8I92pTmQxi9Z+MNJo9xLLO9csUUePruFD8=;
 b=RS/stwIZ/sh0Cx7RIQAag0n1CRybuel9OBkjtjOrUXGYmerJachW9zqIwcC5yac1IeHh8fUa6D2YhFqmh0Flis+HATmR5Mr+mF/hWZsSX5BytOYSrsE3QXJ5DILEP6vrhd8m7wycie19b1pPMRFPb8PFSbWM6S9nv203AETNNO8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=RS/stwIZ
Subject: [Buildroot] [PATCH v3 2/6] boot/uboot: add qspi.bin file support
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

u-boot has introduced a new file called qspi.bin for users who boot from a
qspi flash device.  It combines the spl/boot.bin and u-boot.itb files into a
single binary that can be written to the qspi flash.

Here is an example of how binman generates the qspi.bin:
https://github.com/u-boot/u-boot/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca

At the moment, the qspi.bin is only used for the zynqmp platform, but other
platforms may adopt it, so the buildroot support has been made in a generic
way.

This patch adds the necessary support for buildroot to install this binary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - added dependency on BR2_TARGET_UBOOT_ZYNQMP
V2->V3:
 - no changes
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8648d6eb7e..2946aa7251 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -446,6 +446,14 @@ config BR2_TARGET_UBOOT_FORMAT_SD
 
 	  See doc/README.mxs (or doc/README.mx28_common before 2013.07)
 
+config BR2_TARGET_UBOOT_FORMAT_QSPI
+	bool "qspi.bin"
+	depends on BR2_TARGET_UBOOT_ZYNQMP
+	help
+	  When booting from qspi flash, u-boot can generate a single
+	  file for flashing by combining the spl/boot.bin and u-boot.itb
+	  files into a unified binary.
+
 config BR2_TARGET_UBOOT_FORMAT_STM32
 	bool "u-boot.stm32"
 	depends on BR2_arm
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index fd0323bb71..d7cde420ff 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -108,6 +108,10 @@ UBOOT_MAKE_TARGET += u-boot.itb
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_QSPI),y)
+UBOOT_BINS += qspi.bin
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
 UBOOT_BINS += u-boot.imx
 UBOOT_MAKE_TARGET += u-boot.imx
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
