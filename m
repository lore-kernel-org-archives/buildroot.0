Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF78BE77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 14:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 293FC606D6;
	Sat, 28 Dec 2024 14:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFKyU8489KNR; Sat, 28 Dec 2024 14:58:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BF5A606E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BF5A606E1;
	Sat, 28 Dec 2024 14:58:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72EDEF1B
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DA954019A
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id voxBzmmYdGqC for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 14:58:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::611;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0CC340176
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0CC340176
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::611])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0CC340176
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQdb5nNsNN9tL8NjMIz/EHw/RNLxxNs6x/PQo0XsQ62GLMvGJAmII7My7SsMiVXtENwGB+QUnJ6H6m2QjYVOELJVbY8EpBYbJXmYY7z+HkCIoFJan+q+L0yIK7J/piAeHYEL3usQcP73783YIT20+D4EIJ6zZbrvfMGdcISEQztIQBlciYFYaWMp7UROypn8W2wIejBGK9ZwySD1vw5LcTRON428q5lMykzeuOGHGCFwWdmAM7EpmUqQRVfiPL7AwMXs033F9CGA+149fzcOlBGu1ggf5PgeBaANgbr28VQlR/E507QrosYQYjfE6cJBY7Mkw5bwE3rrfsR16WSHBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWk6rJcCSEWluuCnw5zTAzeVzKoK1Ky6K0H/UvXHRSY=;
 b=owe8OXxJLJtxCvJsOP1IQGVjnJLj3wdSKn77gNOYNITa8Ul8P0hrMX8sSn9rDCadtVKgrQ05r4OLIGrYrHXObFKqw9XRxrqmVOpSCkqTWNZFQWMmXabqc+SP7Q/XKBGVt+QFda+ycEdwCwbTAbxVv6eb2XIiA0G9BvXsbOzdiYdHZ4lOZ6nQEILqZ03ncwa3w+eEZHylnN72IA86oLi3ryM7TiYVj2QiioVEjJvbyHhGf6usJaifT4xU/nNQckaHxlbnJBRSzsmdOUfm+OLmz8vzD1GC/wU3U00JGCI2XlpC9eCOGa24q+hEzK7zZ4tamIkRcUgzZUtMI3l9NGsYhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0183.namprd04.prod.outlook.com (2603:10b6:303:86::8)
 by LV8PR12MB9156.namprd12.prod.outlook.com (2603:10b6:408:181::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.17; Sat, 28 Dec
 2024 14:58:24 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:303:86:cafe::d1) by MW4PR04CA0183.outlook.office365.com
 (2603:10b6:303:86::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.14 via Frontend Transport; Sat,
 28 Dec 2024 14:58:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Sat, 28 Dec 2024 14:58:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 28 Dec
 2024 08:58:22 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 28 Dec 2024 08:58:21 -0600
To: <buildroot@buildroot.org>
Date: Sat, 28 Dec 2024 14:58:13 +0000
Message-ID: <20241228145818.2211273-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|LV8PR12MB9156:EE_
X-MS-Office365-Filtering-Correlation-Id: 9067fdbd-1fa7-4311-8bc2-08dd2750131b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gyWoWb4bZ29SO8ZOL1CAkDqS/wVeArE+DEbZJ2cstEhDVhpBOgwNTguIfMJc?=
 =?us-ascii?Q?ORiD0R2Z/Qm4kwgwvHuP5oue8kLIAzE2SdX9fdw6kCtVvfW8M2sheqNaOsOx?=
 =?us-ascii?Q?l57uS8g/wOOCQW/E1EKbGLgUdv24j+vD752kSj8EnLIrSHJ6qMbmUiDhq8Ct?=
 =?us-ascii?Q?i1iIYrRjGgOqkbue64ustjWXXBMHxs6bfI7bwo5ccc0I7AP5XzQIMSB2yOSC?=
 =?us-ascii?Q?AZj67vXy/9quQA9ZNLxGb2J0kBKo50/H5i/3d5sYhEup233FyO5PxZSNiTDC?=
 =?us-ascii?Q?kHE1Bey3PFPAUKupskFX69VwfYhM7TtgT8gnR4rpAZWHYTjwntVSjEpH8uob?=
 =?us-ascii?Q?aXTdtiI1FHrb8ZspRMDhZ+DliE+NfQtE0JbtGJfcfjQvbQRGhmtGQ4KtrThH?=
 =?us-ascii?Q?6FyO5Iox0ExmCNRaDDHeDJQ1t8ZQe4/3umEA92v6YGZ8rEQo4mgNik/Nkr1S?=
 =?us-ascii?Q?Jp0Axgnql0THRclPzJxSAg/p55Kjwky77KR6VPlb3KxGzjkcs984CiHnwWVH?=
 =?us-ascii?Q?SRqF5/hvtwDtdRxoOxSAMLlIqC0z/jtwUVwpFb7Q0v6yk+wF7zGj80ymdJCA?=
 =?us-ascii?Q?TiPM/OactIpg+tve55VLrF2q3pwlt0DmSD3SahNG6l2/7LPl0YjJVuqlTJi5?=
 =?us-ascii?Q?HaQXXuTq7BYGbz6BJVWHqTcWAkYzUD32PVIvI72vHyjch2tv5sMH6ovBB4Qe?=
 =?us-ascii?Q?p+kncFp+WCq7Mcy11UoZFmYZCVqqw0gVv7W9vhBk2OmzXoN8Odj1DT6OiWAE?=
 =?us-ascii?Q?sw1TeUyAaQuhhsMurx05q3QVld+1rD4x4icVVUOgmTLFGAwBvhkfbb/SxHms?=
 =?us-ascii?Q?NSA9PmUNrxe8AZm/ssAVpQwFRt7o/YfI2GWF+voSh0LgPtjaS03kWcehvJKE?=
 =?us-ascii?Q?YvZCMboz52+FoHSdbf9ugKqkXlfKapxDRkz11+PFRnGaqYXiVnxb9/B5PYMJ?=
 =?us-ascii?Q?OIb4YK7aQDIyV7jca1u2ueYqvH6dmIhhe5Ox1at5RRdF2zmpckWfQr0SCK7G?=
 =?us-ascii?Q?Hn03JI6TsG+5a52t7ym/duslUI+CRhk42htoLpra1SRYgkuDlG6qd6a0oh7Q?=
 =?us-ascii?Q?q2dh6SoesTq/o6HkwtIb4yIjGhJEpQ+4WmAZJh03kpucSbtUZ5JMMNa84e7a?=
 =?us-ascii?Q?ARV1pUWPkz0qYLPwp368pb2GyBeTDyTBGFRS7GnhlpjEnNXD7eo9DXww4yaa?=
 =?us-ascii?Q?oiw6O19+XNtgASjP9SuZGP0ngstSkrtmPVSj1F2ul0SIffArljUyv5+m5ejD?=
 =?us-ascii?Q?9VGVPuoe87hRfOmouJAC5LkL9x3AVm1xtwSnOxsLriRrM8be0Tssj9yXYdu5?=
 =?us-ascii?Q?3Rug0OegKMnpgFicvSNx32DSyXA97UTQDD0MebUt9J2CguxvoLobauc9q3A2?=
 =?us-ascii?Q?CHCKj7afVqo98Yumd8g79EysnX4ITKJ3zYqwdgSIiJGOTNTtPfu+yuRxpQ0J?=
 =?us-ascii?Q?J3jEYcPmXijhyHebNOmPVcDrnKSfL/fRo0Ea6tRaabg9dZ/u+TlRi0UE/2vT?=
 =?us-ascii?Q?y5eLm3VchwZR9T301lcL8rFXVVQLUESeIXVZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2024 14:58:22.6355 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9067fdbd-1fa7-4311-8bc2-08dd2750131b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9156
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWk6rJcCSEWluuCnw5zTAzeVzKoK1Ky6K0H/UvXHRSY=;
 b=ZlVPPcfWasf3F/w9Ss1/7W6hbBsWUiOYXtIKHxyH4WTGuyU1zvPGciJ3Ks72G8CcAq/DWakHGU3YTDIV7qVmzN+QEH5VB4hhU3QAEn8SAbKQ/W8AySQYs0onkzKpIlhN01OUWhMMhvCw6bp3uTKN0LcoLt69paU840m28PSdWoA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ZlVPPcfW
Subject: [Buildroot] [PATCH v3 1/6] boot/uboot: binman generates u-boot.itb
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

When using binman to generate u-boot images, there will no longer be a make
rule for generating files produced by binman.  However, these files will still
need to be installed to the output/images directory.

One such file is the u-boot.itb.  If the u-boot.itb is generated by binman,
then the file still needs to be copied, but without the make rule.

Here is an example of how binman generates the u-boot.itb:
https://github.com/u-boot/u-boot/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V3:
 - no changes
---
 boot/uboot/uboot.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d8faef648f..fd0323bb71 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -103,8 +103,10 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ITB),y)
 UBOOT_BINS += u-boot.itb
+ifneq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
 UBOOT_MAKE_TARGET += u-boot.itb
 endif
+endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
 UBOOT_BINS += u-boot.imx
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
