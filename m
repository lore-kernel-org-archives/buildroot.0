Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4935CCA0FED
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 12:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD71B81ED1;
	Fri,  5 Sep 2025 12:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXMRdY8F13-3; Fri,  5 Sep 2025 12:21:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF1F781ECC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF1F781ECC;
	Fri,  5 Sep 2025 12:21:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFF851E04
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 12:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5AC5405F3
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 12:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lthPw057r9UR for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 12:21:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::619;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 551B8405E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 551B8405E4
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::619])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 551B8405E4
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 12:21:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gl8d8RsOS5vkXMqNirNht2Yt7WVASyXmpIya2yLxoXYNgSb24Rb3R+GbKlvf4J+2XWZM7DH6W29ShWSBR0fQOmN6gfxVKhpyqgc64+BqHgm03wnBvQ+A5fbhj+jEnVXpnabeO0yeEAB82DP5h3U9rXOiLzpmFcNGPOPET+NZQZVzFdVdnBIklYYpYYB3z6xPTHVQZWmLOzZfpjOTw8RrRr5FmLarIMETm3g/FmqnEqLygKgaQhdDzI64GC9snnZCZOGEKhq8+Vr8hnk1T4pPSm7NUmXQ0NPoKGboFeJcDwl8PU/6IJD2wPLAvN2GjlOCL8LGugSTgh+sJAsZauJwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Fl4bZNv6vFqdKzbKoRhtoAvYTSNU2gvO1d4sMVpnVA=;
 b=evgVmbGnsJvxrq3G6mSqCYM8PLYjA6rO6kG9d5Gi+CwRAEOr2qUhcN8aa5Ha16CPrBdx9ASBM3WncGoD/ekHhbE95BHFOpkToqmAXx54+tL9PMb1Kfg6od2imdW1nPnR39UIntmNv5St34gNsmEjVTLLr/okZmKiKilHUdO2hYlTD8G8hMMA//0nhvQc0MNcCmgWEben3xGhuTG5TFpEz9LUmb9ibdjziChTpKpQ1xIBU5erwAOPZS/rpk0Cs023KNYaGBG5YeSkCfldvUd5mP+ZaQtV3ZmO/BuOUQUjl8zy0+Ce7yqkdDXlJmjQPQvyyL6MwkgahnXf1zs/DtUErQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR03CA0009.namprd03.prod.outlook.com (2603:10b6:303:8f::14)
 by DS4PR12MB9748.namprd12.prod.outlook.com (2603:10b6:8:29e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 12:21:08 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:303:8f:cafe::14) by MW4PR03CA0009.outlook.office365.com
 (2603:10b6:303:8f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Fri,
 5 Sep 2025 12:21:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 12:21:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 5 Sep
 2025 07:21:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 5 Sep
 2025 07:21:06 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 5 Sep 2025 07:21:04 -0500
To: <buildroot@buildroot.org>
Date: Fri, 5 Sep 2025 13:20:57 +0100
Message-ID: <20250905122057.2520997-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|DS4PR12MB9748:EE_
X-MS-Office365-Filtering-Correlation-Id: 145b6c80-630a-4949-cc19-08ddec76b0c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2mf/iwwyzfppWiKNxvB2HQobX7JobEdkBL/q6fIagKUxliG6v2LHG9eB534c?=
 =?us-ascii?Q?Ip7tGvMNec4MbPFUG2BZ+77zX3K0SbyR3KLtDiNdXKXmngiboNkL+/A/aPIN?=
 =?us-ascii?Q?yR7zCTx9lz04i2uOTmQZlnTZxywU6GKqRpKB8Yp55viPCvqtwzXUe+tl3Dih?=
 =?us-ascii?Q?TSYBVRyKR56Uened7/8yNp3lg8ZnYuhhG1Ynm+PTmNH6vJ3sXbjeoKTgY6qh?=
 =?us-ascii?Q?6L3ToI8CHVyQV0iBt3wIE4lAcyuGvMfsCeHgVRH1ubXu2UZ8MFqUllRZ4w7N?=
 =?us-ascii?Q?QOGAOmSeDG5lapj19cOvaaS4G2Y8KkxC+/Hz7G7mtfhDRAlCKC9HyPCZDJ2l?=
 =?us-ascii?Q?yvm+0473ta8QhtvGD1s0QPDVujzM4qSYl/cvT+VtNDF643TmTNWL/m6zBpJD?=
 =?us-ascii?Q?vSMIhWp1AWCkFu5DyOJ9fs9AtkSRlkuXlvAi8tyFsw8OT2NRJdB4lHklPZlV?=
 =?us-ascii?Q?7tQyzejI6bKbdk9uJ/brfe2UrAVd9NxHSKRrWqHEQm9Kpcu/Ao5RNMheZCOF?=
 =?us-ascii?Q?l3Y8KKvsirMaAtPbuy0rYLLLiqf4LLgvI0//Ufuo2BC5z9qwNrZNslqaLQkt?=
 =?us-ascii?Q?g+Mr5BHpxsekG9bMvm0jsGeH0fVMPOLHligDvGd7WEj9z31K1dftAitgjbwb?=
 =?us-ascii?Q?Jp/9n+AXP95tBIwKJmFFX4UIfuACsEryjzDFgxBwzthpuACE366UU/2R0Pgh?=
 =?us-ascii?Q?NX80JNwof0Ko9+NtX1KUFkPijLlA9tSutODiSPK1yxzOxU8nu68vJJNOPrwu?=
 =?us-ascii?Q?/URwSmMCd5UtFfsP70Omokywhaxj/r25jA3qlq84s6clVfeVpvOsIE65eTf7?=
 =?us-ascii?Q?tyRGPuvzJoiQtZvqNIidZKt1OInNZVe2iIdcqGoY/zUlD5I+7NyxKCNgPnIU?=
 =?us-ascii?Q?sJExG4JVKDRU53bnckeOOHGlrgtfTokvy8w0oI+QbZHlo5DMLjw99SXXxXS5?=
 =?us-ascii?Q?8BH7zZrm1s4dIw8Hqfnf0AyKq9paJ3EMwQ0piWtpPyvR/OXxmlMEync/GYUS?=
 =?us-ascii?Q?9jnuqfZ/ol9OaX5GmM0+oIWVIULwNTW8Mogi2eAXc31ikJ7WxP12o+zTAXxJ?=
 =?us-ascii?Q?w3FBFNzwxa0Rw+vd1j+n7BUVnG3N/Q7dqqYrrf49AfRTQeAxbl7WlhE/fwhM?=
 =?us-ascii?Q?vf5+3YTlpYcOjqrCj7OrGJwT7GTxJfkMGzU9OXAfcD67OnBbiS8NM4Po85GK?=
 =?us-ascii?Q?9xBwQKZngCsRKuwvYm7R6Eck7mxDrZxnOdcXJ2EmNOf77suv1NcNz9/Uo/X9?=
 =?us-ascii?Q?SRtIQRidBXgl2SQWGXVpFh6LyZff0K/lCIzVqoh2xOE/xiDTHMMi00jZB8BD?=
 =?us-ascii?Q?KCU/ahpjAr6W8GlvNs4moCwGMCU+iMVTyiInoZJh98N/6XL0G83H6+WlXUF/?=
 =?us-ascii?Q?Xiq4arpzc9mPG6xtS2MwWZAvihboqXBga257BqzMzV7m7nQk+80NcpviNEQh?=
 =?us-ascii?Q?oAEffmKY95EaD1F7GxYVZJUYXNFJWZ0kPCw07TGcly6kcgDLelf6ocu+sGFy?=
 =?us-ascii?Q?MLGnOdxdBPGzh0yqxOIgd8Qr71BrKxv+rRL7HWVKgFRGrJmbotf1/WrCa5rP?=
 =?us-ascii?Q?QBCTnhYt71OF1O8e4zU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 12:21:07.0945 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 145b6c80-630a-4949-cc19-08ddec76b0c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9748
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Fl4bZNv6vFqdKzbKoRhtoAvYTSNU2gvO1d4sMVpnVA=;
 b=UYscmVQvV5vcXeTquMaX/45GRxzX6ef1vTziuegbyYY48kh3APbm5lR5XrqmLkxEAR4043BGPk6fZOVW/v6mzXBe0BQ9Tlg5DwqMm+RAEphVc3xFxWsm05v9n7HTmbnwF2CP184y9gj0KNn1wLzSg8CM+0v5rpk8laiuYl4jNuU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UYscmVQv
Subject: [Buildroot] [PATCH v1 1/1] board/arm-trusted-firmware: override
 BL31 environment variable error
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

When building the arm-trusted-firmware, if the host environment has a value
configured in the BL31 variable such as the following:

export BL31=/tmp/bl31.elf

This will cause the build of the bl31.elf to be skipped leading to the
following build error:

make[1]: Nothing to be done for 'bl31'.
And then:
readelf: Error: './output/build/arm-trusted-firmware-custom/build/versal/release/bl31/bl31.elf': No such file

To fix this, clear the BL31 variable in the MAKE_OPTS, so that building the
arm-trusted-firmware will build regardless of the host environment.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index dca16d3960..021ab5c092 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -162,6 +162,7 @@ endif
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31),y)
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += bl31
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL31=
 endif
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
