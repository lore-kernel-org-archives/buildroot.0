Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82075CA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 21:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2708740766;
	Thu,  4 Sep 2025 21:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CxBhN58GUJoO; Thu,  4 Sep 2025 21:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A55440761
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A55440761;
	Thu,  4 Sep 2025 21:13:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C440B69
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 21:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2993580DEC
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 21:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RG4m1b1stlJC for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 21:12:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::618;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6738B80B1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6738B80B1C
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::618])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6738B80B1C
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 21:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/lQ+w18uE6kUAxaf2Qg/SRIg0NEwaw8fZWVswf2A4Gt7m93uOc9H1ksiM7bSeT+4jPrNyhHl95L0zmbJ4nL3kwoaQriRk/lr54AJTQjAxoyZBFiCH82MsS+5uRLVX9z3FxNPm1us1kzKaWF6HGRHr3IVY19t/v+mRWElustTPhURRtDwxJ2SaBprqmfV/jSUAhHJPU/zQxygOFMVz4YVFWnva0yB0GDaZ3rd4ZXgalxlV+CfAZws3HCrjO+0EzKz11VJy7i0VVFeVIVwXeESq+YdY8SzesTfhJdho7yVMoFbPMnrMnbFi7Pbp8HJJTR7KO6CNCgeIiscjIXCcHZDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qs6+XuOBrTbUl73UhtbJqsgddpUmlf8diARIXllai5s=;
 b=Ur/IL+2MWHFljQQtOOh5FjqXkJiuNo+c1PMGrhrGCgFlLep7n+j6tzHLYHHDF84XOIzDlCbGIQTX5be9TUipYnl6rPFLWhdHHfMjO4fxcEzMS9ONLj7QnkGp7VNMltAauhxrosa9cZz0QhGkvJObo3uXm/TfvWRKp/fl+82Cb4aY4qc66u3w2VV3xkYrwSb20pgvLdDSR0ktJnuNt8nXbMFhd7CJxhsL3ZfIpnz1+0uOqLTwf5l5TBy4L77iaapB0xjvPgXPEwR8e6ZTNCFB5AYV/VaKunPdcAB61/0CAimIiZ2Hjs9RPVXIkCYYleEv+/v6HBTdq52Q1n7WQDSlow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH5P221CA0023.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::25)
 by SJ5PPFF62310189.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.31; Thu, 4 Sep
 2025 21:12:50 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::a9) by CH5P221CA0023.outlook.office365.com
 (2603:10b6:610:1f2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.19 via Frontend Transport; Thu,
 4 Sep 2025 21:12:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 21:12:49 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 16:12:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 4 Sep
 2025 14:12:48 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 4 Sep 2025 16:12:46 -0500
To: <buildroot@buildroot.org>
Date: Thu, 4 Sep 2025 22:12:36 +0100
Message-ID: <20250904211239.1928818-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|SJ5PPFF62310189:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b589bf3-a02a-45b0-81b1-08ddebf7cde7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9nHexqfvVG2vxfiFCfYJk5JrsNmDxN39YLqFWtr/cF5h4tFYzI4Hf6+Hb0YO?=
 =?us-ascii?Q?Sx21ZwuQtUwFehul6KtLifJC6bXX/Znx3UA+j8QnNkgCJ+x5Oao0bwMamEnV?=
 =?us-ascii?Q?rOFddldMaAHXOj22DUzlQ6Y2p6BdZskoAMpTe+M1J5e+BvrQq9OE0F67yhNZ?=
 =?us-ascii?Q?pd/tiLw6QGIBFmDtBv8r3m/ZSLUJBEHyjGIvSvxH7XpUxpDDZTtpHHCAp+jf?=
 =?us-ascii?Q?4cn+yJY79fmiD0LgRSkBo/sVr/WQY1wFrFGMo6/aZbqsPkFxeprH315WsIln?=
 =?us-ascii?Q?blHYypkhnMvlalAthqyiF4KHOo8CQ1DV8T8s9Yd7IP7bTgSpBozSN7RwhHvg?=
 =?us-ascii?Q?e8oIoNOlczeXGldHYJHg5iQlTiebQM4mqJWvU0euNgWYtOhlhwWE82Tj8aok?=
 =?us-ascii?Q?aNTjIiIrSompw2FrV2FF5eNGaC3C6wxuZK2wnWwwHrM57pShbIHIG4KtcT+3?=
 =?us-ascii?Q?nkRpircxf6t2G2d9HVKK3la+a6CPAq+JoSVAbH0yTayV//ZYsEHsq43xhB3n?=
 =?us-ascii?Q?Tc7NwLE1ucN3R2ZH2EoW99u7jEGmyfzgbEyZugZhwrt21sqiJHV5+kgM9Y5S?=
 =?us-ascii?Q?CvjpcC7QJ/YfxlucLDVmDcH5D/WdD5pLeXrafjqb6/m7ADZgArqkVATSOg7W?=
 =?us-ascii?Q?0YorRS0ZLZPoX6jHlnaCbb1KsHUjPEKt89h3u3TAQFvTwD7SwLCo6NYxu9Oo?=
 =?us-ascii?Q?k2IgXkTRI67GPltF2GCwnfixY5x+9q5IyI3qRSxitYE4kbJ/ZIjAF5BPcOIq?=
 =?us-ascii?Q?9oPWi6KGs//rnnhXePANhuh3mlqERjLTIpRuocop3NtpphfRe5Aqbw+3T8jY?=
 =?us-ascii?Q?ujyAge5Vvk0f/gZVRtTQArqyOeMY6x3fU+P1MlfB6Kbqg3dHFcBN62vAa3QC?=
 =?us-ascii?Q?nYAxA1agpRBJVPZwQszNSUORM2iGbyrdA6X94DccbqKbKr0sbHzmVKSGEQYr?=
 =?us-ascii?Q?oK8Or/zMj0H4m8Lm9B8P6P617N04ji9T0Mo4mlTgtNC3Gx6JSv2TICoVVtKI?=
 =?us-ascii?Q?hD6LIvGkF6cBH4fTjZoyqpEBt3LE5l6Xgqq3x/XN8vyqn7o2lgfEd/kYGJuG?=
 =?us-ascii?Q?hoHPc5yxLjnlCvAwyzRtG+p+WZ2EwBK33mXe2zgqOIp9VQsPov+vBYbijBnw?=
 =?us-ascii?Q?3X220xBPw8Wu+anmdRA40yCdEPM7kqOHN4hw0Bq8NFgnS4Xo3iYn17pLnjcw?=
 =?us-ascii?Q?l5BbiBS/LKjlOvwz8lvw+mwyHJzAuMO5/DwcdQyOkAuy4PF5xWMAXahOtcDd?=
 =?us-ascii?Q?olHdPFSCxw37RlqJxYsuX5aU+cpnnNm/6SuvFTbOFvHrmqohnqQGJ+ChZp0Z?=
 =?us-ascii?Q?o+yz3cxjK+SpUhouAKoiHvI16oDeRb8XYYMtFJyVJU/q/ic82czNM5uFs0ih?=
 =?us-ascii?Q?Awxmb0odP2hv8HmoHPoMFLGIbQ8QDoMK8Vr7t5IsWZPkA0Yw0lV8b5+/OczO?=
 =?us-ascii?Q?8uW+CZYhsKO7fh0WTkklwG5Q5nA+dyB7hC/agAsnk+i00JTzA3aSNLf0O9Jy?=
 =?us-ascii?Q?trqVGdRkVF49zq4fac7s422rchQa+tQDiG2tOxZY5/N+JGPWSXT7Y44KpphV?=
 =?us-ascii?Q?hSG+eKG/YdU3wAZFipE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 21:12:49.9715 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b589bf3-a02a-45b0-81b1-08ddebf7cde7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF62310189
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qs6+XuOBrTbUl73UhtbJqsgddpUmlf8diARIXllai5s=;
 b=V68BNXod8We99UTx1Nx1Om9fteny4EpOzS/Fud/AeUAjj2blzAOBNGq2uVCcU89MEZsRLc0f6LVhC4S4CSkkvcjip5p+jcDxDItFp/f4f5QKhbXVNsjtMz+FOs3NZZ4pI8McSqKVwwQcQ1Zw3gqsXvA4iPKzPzd2yYzVhvJDWFw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=V68BNXod
Subject: [Buildroot] [PATCH v4 1/4] boot/xilinx-prebuilt: add support for
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

AMD / Xilinx has made the decision to change the name of plm.elf to plmfw.elf
in the prebuilt binaries repo starting with the next update.

This patch updates the xilinx-prebuilt package to support either the old
plm.elf filename or the new plmfw.elf filename.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- no changes
V2->V3:
- removed unnecessary comment about Ubuntu and Yocto from commit message
V3->V4:
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
