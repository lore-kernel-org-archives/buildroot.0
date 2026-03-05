Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB24F3092B
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 10:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53DF54051A;
	Thu,  5 Mar 2026 10:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5u4Mwfl3Z1vB; Thu,  5 Mar 2026 10:17:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6149A404C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772705833;
	bh=5sYIrOePNUbVq6d1oV33mKkOwyoAdVhwAHLSy7N8PNo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=RPq/xls6Ww8xv5YzdF8dgHkZgzJ6ICI2Cg3wm26OasuFhoqx1bDBTuF7zOGolqQ1Y
	 8/l++ikuTOuGlpYOk6RzunvXLLY4TORQUQLwE5W0RohWpsk54uwPx7RdPjFITmOvPa
	 OKEAizkfN7iSAHK2fpCNbPc68tP3oNcNbeve3loEtp0Lv9w8WZ3576aIjCCW1blwRg
	 a195l4490a8imi8MHOZyBv2IA9v39ywK7JxBjFTccnBM93Ra5zOgLcubZOfdqPlgUK
	 G2w9tTF9LbJl7p/ijSO16rfcP77ZgWYGWNs7Id85mlVN2FttgkIeVkIvzQ8IpP1ZXY
	 6e9w67LrYzz9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6149A404C8;
	Thu,  5 Mar 2026 10:17:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F12A61EB
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 10:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D70B6811F7
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 10:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7KAvrIo8IMGG for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 10:17:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c001::2;
 helo=sj2pr03cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1800881162
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1800881162
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c001::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1800881162
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 10:17:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdQLRSNDBAMz0LQloGVyB+t4ey/2+ctUEf/lG41gH2ryQChtJrUQ7AwSzwp8ACwUp2RjtnogehtjvgicfyWbDbMvrNFO/ZQTjjf0bknCjxH8OtjA3gQC/yjZjJ6ADqhsmvp+PhvhbFtKeGA58vGdwtTwPtbGFBzd3C/s+PL+rmzVRYXWUZzJ/ASriP86gVdiym+5E4olW5f8/qWTHqQO1kz14HstTFUAwyHWEgExPFy5bjgo0ndRyrFWsx0DLTVuhoqO2V9njz87rYyLDvAqsqKrOulwGbGBcv5Bg2K4TKCsh7LGV64yuv11SL8xgk+H1fyqxZHh4pO60EZHy9syEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyzYBnZkXU2UK9/BlWcYMB0Nz19SouymhNNAEVhGMaE=;
 b=iAo/fW2t5WgPNurVM82lD89VxIQMBfShU99kz2vsH0TO8qMVX+p6xvd1fu2bzStjvruA6bI03cs/VlVfl/7O835+mED8pMvFAmsa9RD/+KsshYzqzRAz2OeMqL6LHkSEjPIbIo8sUJpiLlTBaQQz/dJWMXpnGsbvniLfGLHlPdukj47ip0VSkV2mimXPXu7qBA9sWNwpymfzDU45Ppo+Y8s3JY4vyKOS7dGTeBMgBOt9R6t2lvL+qPlu77kmpNnxwh/AYXRAlgCKBJpl/PBzA61DJP05xthU2FPErD3s9AeXi0HjQj57tS7vB7plZZyw1z9Tz/aoAZyqbU/TpAg2zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR08CA0066.namprd08.prod.outlook.com (2603:10b6:a03:117::43)
 by PH8PR12MB6794.namprd12.prod.outlook.com (2603:10b6:510:1c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 10:17:06 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::72) by BYAPR08CA0066.outlook.office365.com
 (2603:10b6:a03:117::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Thu,
 5 Mar 2026 10:17:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 10:17:05 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Mar
 2026 04:17:05 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 5 Mar 2026 04:17:03 -0600
To: <buildroot@buildroot.org>
Date: Thu, 5 Mar 2026 10:17:01 +0000
Message-ID: <20260305101702.924587-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|PH8PR12MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a1c609c-942a-4731-5d1c-08de7aa05a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700016|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: hdVILx05uqgIWJpeyU0QVHIeNZhdNwCQNCSofEvGfCI3Ib2QkudfQbhPp+1z0zIDsigoU9YV+JXSPu7G5q/b15Dgv4nL3f2GKNT5rbYHtjHX0xwPvB1rNzqyJgkTZkKOqC5hjGi1RT+Oqsfs+igrGd3ubUWFiYzf8cDQPEf5Mr/kYvMKTLIo2cJW8Co/rI7AYERQ2brlKMYR5Vn6WEOnej6skSUT2iulicgm20fJqrmFex9dD2mIOpl//VhtS47q5zYH4fJi3TuNnfDoHyZ7kc1c5O6LrLPhOEgN/+Qhgg7aps7rgZSAFphX35CitySGh6h98YPjzz+izij9PY4qztaVZ5ZqzN3VQEUpl2SNL9c65sO9pXdzaoSGuKjiNTz15Sw2A7U7hbnLApWmFDoAsJny+L6dK1bOY+VXiG/M0fsKXJ2r5bgXuHgkywV2kec0LjBJ8N19c5Sn0OYv5SumS1pf8tfxLaK2FPmvdAcpI6vZsaJBFv8Ro0m3Hq3JwAysQZQ5VNkpytUlr7rdAkV5B8Py8zjNKWQHZzoe8LC5nlp4U2BBXp7iEohT3oPkZfObGU0LmSIyEkRKq9fzBNFH8umC6M1QvX0gRQCMr/PTr6K5qCTg02fLWrnE2X3XLecivDDQ5PWpTutF+Kqhx2ESdWfLHJlQnfDKjuV0FZL5SGfdQuJcoJ/dGwW0JyekaGYyAx9QesadnZnvIaaB10HLxKg1Psex6dGf7SIr/jkYDpo84Rur4gErt7cKtHwfNbcZXh55OEHCF1tIBEXEhfzbDAvgjHGFmZbF6f72jLdy8kEHa0SWzs9MNQqdsRZc3ITgcwbiy8hrUlv+LONmF5G7kw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0bXICPN2OwsimlFc3uN5Iisdd8EmA3hb5ouL+H9iSjjhH/+CcjjlvOyvG2HbLyAv6Wl0Og7DIHDIGz1p2L1f0bEztc31Dql/5U3yrlqLexHbP27wr1owEv1oN8QuEz55j6wNHGKvdDZejDWPRpSGYm2DOfmA06wmpr6kKnFXMYaeueLhOVciS0l/fiyi0QfRUzgH6n++ueG4ljiNJ64LELaZEnodpWhNSo5v5OyljAPUH2kG2EIXFE+Gd3qkxXE4733V7Me2kSoKvAWqISqukZ0Fcb2mUx3JkTnntL/+iQ64srtTMzNyHcVH1zRdzLlzorhQTCzWZWgRwGRxJ8ZdlnHV/eoDpa31v3Jfu+bCRjSdrcjZVy7wlQh7P5iHNuxRlT1sAAaTnNoaCiIqEg/cLBFtfpW+f5lpjIMMMqpCe7ak8tpY3U4LpGmLzYcRm1Au
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:17:05.6926 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1c609c-942a-4731-5d1c-08de7aa05a17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6794
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyzYBnZkXU2UK9/BlWcYMB0Nz19SouymhNNAEVhGMaE=;
 b=PlqXoEXaBkK+BGlTODwWQR+hf2zfHyHXhgfyxIlrQ86od1aKPch70LgumAfOElVE55yEtsCk/INxhtvIPPFydoDg+ayeWvAZOH4BhTw6ZihwBJyhG5SaIV67CFxmo30sWmyWRPLwRX6CZNLUfO0QSxCan9tl/6g9LM00j3T0nRc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=PlqXoEXa
Subject: [Buildroot] [PATCH v4 1/2] board/zynqmp/post-image.sh: use
 LINUX_DTBS variable
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

By switching to the LINUX_DTBS variable, the post-image.sh script can now
work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
the transition users will make when migrating from a zynqmp evaluation board
to a zynqmp custom platform.

To keep the example post-image script as simple as possible, it assumes that
the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
filename that u-boot will use for booting. Users are free to implement their
own post-image scripts for use cases with multiple DTBs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- removed unnecessary $BINARIES_DIR from symlink source
V2->V3:
- ignore anything after the first space char of LINUX_DTBS
V3->V4:
- use make print-vars to get LINUX_DTBS variable
---
 board/zynqmp/post-image.sh | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
index f44b66342d..3a47f75533 100755
--- a/board/zynqmp/post-image.sh
+++ b/board/zynqmp/post-image.sh
@@ -2,13 +2,9 @@
 
 # By default U-Boot loads DTB from a file named "system.dtb", so
 # let's use a symlink with that name that points to the *first*
-# devicetree listed in the config.
-
-FIRST_DT=$(sed -nr \
-               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
-               "${BR2_CONFIG}")
-
-[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
+# devicetree in the LINUX_DTBS list.
+LINUX_DTBS="$(make --no-print-directory VARS=LINUX_DTBS printvars)"
+ln -fs "$(basename ${LINUX_DTBS%% *})" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
