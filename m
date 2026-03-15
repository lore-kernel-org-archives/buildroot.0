Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A93F30275
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 15:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FBD782792;
	Sun, 15 Mar 2026 15:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPSD51PT3HhY; Sun, 15 Mar 2026 15:44:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CD1D827A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773589446;
	bh=wZJdKLxrpKkqnRt4Wo7WfNmRJEpgOKCsoaHx+MDRt8M=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=glcvF1EspaXDZC5yzDGljxOldDe3WMHlyWmchb5hOdPe3rOUnDcxCaZvIkW4BC3Yt
	 LmkvXNiBC4/Z6l8/5Kfc7+Chpsx1FmlUT8BeLKuv1y/x4XL2KJNjRwVc+Tyqt6R+dx
	 UxYLf+D7YN0EmNN5Z8dThWfT+juVf1T6uetpeEVYdAyC0xJb0SK6DVHozJHvs0IFiu
	 I4jrciRqzqkOn8wHtnQ7bJxco7W4vtz6nt+BeYQdtR6foKZg3OcT8tXh8TQ19zIQ+8
	 fazPyPL7j75uJPDGMmZkcD7BxyTtzIKPwWUuB2FQQJCIR9xd7BfdKxqYJOOHRaF/EJ
	 CrUbxrok0aPwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CD1D827A8;
	Sun, 15 Mar 2026 15:44:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0426F1B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA05E60B11
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DgfwROM21d3p for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 15:44:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c110::3;
 helo=bn8pr05cu002.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 22C4060B0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22C4060B0B
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c110::3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22C4060B0B
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:44:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKhIahTysfUkiZ7En6uigpsd3sMinyyeSxcJKpoMJSM766iFjpZl+0IzF5xAWQYCcSCznFXo4KX80mRMDytQZ/pgVv5eCkoziW7YOwt+CDUBxy4BmTABZaIUnDDGnRet8U9Oy1dp8oosepnxq/HC7v6flUcnL7hpamJwq8uMxmk1C0l8fSNmbKo5839mynonkaiTfef+dtC5V3HWFcnaxZTmwS7HwVsDxI6vCDSRvgXNAQXEwHpwDymQkmnEIg4MxSnWVYhv2tbRWGb4lJJfruW4KAd8+bRmEIuZcHDazA8RZD51SbU9k3n9MZ94pHKK637I8Cdnjb5EGRKRimfIAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUvz+PBdiiSujRNqYuPoO65ZYgbbD79KM/EXtyRj6ug=;
 b=Y5auutQ1f9avBAx4lGhsUZtiNR8uDm/NdLEZTHcMpc+B52V7AtkIEZ6Ma+bZETSO8w0OZfve6tP/Z0pKmNFxvRPHiF5JspTL03D4Pg5XitZ4cztTTmgOPy8cbApZ89/w/Z4S26KJnqDmhziBiSa4uXpCkHgp1aj2qFKZjTDK5oG7uRdN66mENhDrp98igGf38uZI5j9pmYyG1oU8ApintTUKfCT6WOZAAsS7DFpLOkwgVviF/tTMC6K2EjnRMaS5SVUdcfDQdfLJqKnrtYFeM1nsgCLLTZSwT+D70/XZ3YUVP6oOhCZTuaAoVmCvEcobXlewvQ2qcSFoELMzmS/i9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR10CA0033.namprd10.prod.outlook.com (2603:10b6:5:60::46) by
 DM4PR12MB6039.namprd12.prod.outlook.com (2603:10b6:8:aa::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.13; Sun, 15 Mar 2026 15:43:57 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:60:cafe::c0) by DM6PR10CA0033.outlook.office365.com
 (2603:10b6:5:60::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.21 via Frontend Transport; Sun,
 15 Mar 2026 15:43:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Sun, 15 Mar 2026 15:43:57 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 15 Mar
 2026 10:43:56 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 15 Mar
 2026 08:43:56 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sun, 15 Mar 2026 10:43:55 -0500
To: <buildroot@buildroot.org>
Date: Sun, 15 Mar 2026 15:43:43 +0000
Message-ID: <20260315154343.3144013-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260315154343.3144013-1-neal.frager@amd.com>
References: <20260315154343.3144013-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|DM4PR12MB6039:EE_
X-MS-Office365-Filtering-Correlation-Id: fb1a4269-b679-4f28-d57a-08de82a9abbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|56012099003|18002099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info: RqSD/fuTBAfrf5Fs8vtayIgI/aSEx5r+aX+owcjRnkcxWIR4P8rAma6UvuZNAzX8NBB650HvfE36R/LO9MhO2azV7Bf2XoHUV9oOpxvEwH/+Oj2d0MvuIxdn3EdS2Ev83KVtStoGnNqqkRkjTyo3nDLzreb1z3fqGUyJs0sONZzW++cRgcwHiBs/XHFYzonecoo1EfiwRMSha05XEpSWODPLIm6N8XzPIH9bx5sFPkMf4l41h6lOrEBtEbjdaveM9j+9Pl8x7Q2bybHA6aPvDo9QtFBWisM7OJy8RaoL0GXwI62F48hsdzUFIiBkLMiS2Yrauq93XDj3IVXBxt57JIKjXYuSGU9Qg8qtmab0YqzppEWL42881Hb9yncmFFiSaV6MGk6iW2CavYx9AeIrHS3ayXbPF+vjJv5gcXSHKRlmlXcS0p/LLrBI7C4V88QbeK7MOC/A/hifhXXzaR91tVJRntHzcksrwQ60vv1kC2BqEGwS/N86SQ8SR4LrjDKwQ6cHhipprHcRacvd5jAScE5b26Y3MBm3T02L1m+OsDPsHvqhFSA/q54Hsuoy12VAUiAgewYnOiJSnSVGMxZQeYns4PPxYHYBt/o1cJUZ3RgGAnzQGHLh54K3ehtwTEyN3TOMQ5ZYqyNh2LvPosoQbmwbQ9aYzbWq0brSgjVbnreMuperHPibIviXp4nSy0oJUzsFL4FzvHPN1VkgrsqHiSKxTWRku8C3CHoDuNjFpOekfDT9U6f7kWvHvN8joIPTpDsjDZs5UE+v2GD8uANfg4ZMlPwyB9xuUAVV2Hrgdt/lLvSOdvQh+Is1UlENsQDfOimJTHULGMXNbGyGSndMfg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(56012099003)(18002099003)(22082099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 78V2XY54w9+kYX2sYrxq+dAQipl6g37zxVHZavTqcw329M67N9r94otDIJw+JUrtJihFS2CuRNITKG4yeNUkHxQSwxejHEMOh8acCt7UXU8X7ZTEbRIe4M0F1bIn9xZsxpJxUz/PGqddVbafhRct3dz8jBuK4TvSKj3/YAwyLYriqj2Rh/n1908L1CvBhBpr4zgx08eP3NFhzqCb+14Iqo6qq/Fb3XNnmxX74yEuGdg6UrRfOD6cnhtClugrZOwr08aiRl2E4tTzOrmXFz+/fOXE4JhwfeithTaD13+cZ0E4qHSqnsvBLKpkPdN+OJ9IHf2pDPJ4b8lrcBdHlt/lQh4kBiQr25E5RG7l+xEezRT9weCcM6V6ILuRsMi0nWikl4O4iqkf3iV9uAEZWHFk8GjZXPMXl0gcpJkG0r19ff9bNPhbWuAULpMqg4tKlLq3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2026 15:43:57.4740 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1a4269-b679-4f28-d57a-08de82a9abbc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6039
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUvz+PBdiiSujRNqYuPoO65ZYgbbD79KM/EXtyRj6ug=;
 b=Q3pvq2NFQ34VfQpTYHblSRM7eqnFza4+T1ijhvGNVLY4I+yRDx7tu3u+S4fZBC0f1sCkpp2gX3bYKt/8MNVFFZ4T8KAPl5d+o3G7QH4+Cqqwt9e2w5Fdx7pBTuEpafq8OfmnhaourijhK/FnMApyNr4CH/SHrkfx5EN0nCjHaUA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Q3pvq2NF
Subject: [Buildroot] [PATCH v5 3/3] board/versal2/post-image.sh: add custom
 hardware support
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
 yann.morin@orange.com, brandon.maier@collins.com, fiona.klute@gmx.de,
 ju.o@free.fr, Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Users will ultimately need the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR config to
import custom dts files for custom versal2 hardware. Improve the post-image.sh
to support either the default device tree which comes from u-boot or a
custom device tree for custom hardware.

To keep the example post-image script as simple as possible, it assumes that
the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
filename that u-boot will use for booting. Users are free to implement their
own post-image scripts for use cases with multiple DTBs or overlays.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- new to patch series
V2->V5:
- fixed shellcheck issue
- merged with zynqmp and versal patch set
---
 board/versal2/post-image.sh | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/board/versal2/post-image.sh b/board/versal2/post-image.sh
index af50909fb1..3037e0a5ab 100755
--- a/board/versal2/post-image.sh
+++ b/board/versal2/post-image.sh
@@ -1,9 +1,17 @@
 #!/bin/sh
 
-# By default U-Boot loads DTB from a file named "system.dtb", and
-# with versal2, the Linux DTB is the same as the U-Boot DTB, so
-# let's use a symlink since the DTB is the same.
-ln -fs "u-boot.dtb" "${BINARIES_DIR}/system.dtb"
+# By default U-Boot loads DTB from a file named "system.dtb".
+# With versal2, there is no default dts in the Linux kernel tree
+# because the default is the same as the u-boot.dtb. This means
+# it is necessary to cover two cases, a custom dts or the default.
+# The BR2_LINUX_KERNEL_DTS_SUPPORT will only be set for custom dts
+# files, so it can be used for checking which case is configured.
+if grep -Eq "^BR2_LINUX_KERNEL_DTS_SUPPORT=y$" "${BR2_CONFIG}"; then
+	LINUX_DTBS="$(make --no-print-directory VARS=LINUX_DTBS printvars)"
+	ln -fs "$(basename "${LINUX_DTBS%% *}")" "${BINARIES_DIR}/system.dtb"
+else
+	ln -fs "u-boot.dtb" "${BINARIES_DIR}/system.dtb"
+fi
 
 BOARD_DIR="$(dirname "$0")"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
