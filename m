Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0F9C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 08:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86D3D83ABF;
	Fri, 17 Jan 2025 08:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0fGijQX73Qt; Fri, 17 Jan 2025 08:00:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64CD583ABD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64CD583ABD;
	Fri, 17 Jan 2025 08:00:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2530E94B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29A1B83ABC
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIE26ustfw_B for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 08:00:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::60d;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 055C983AB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 055C983AB6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::60d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 055C983AB6
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 08:00:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCzu5pNhAwNI6oaBm7yinI0ylUXAiMxv+5lhb3TVc3cQocan4Vz4VtMNsQ4q/qapoSsXDnopaNkWPLx5OlmVy2TDGrjU2zjivixAA5y6e1zE5ciWec3aHHK9nLGWhJyD/MPp3AUiXyfAtr9NDyI/Ujrx2sjzE7XIYUZV8gNm+kPmSAjzQBmjf9QjIfapsDP3nkBakGjiRoyRN7c4vLU4oQ6rH0nV3G6QuSDxovVf4vh0zjEE+I+dtlPbv9vlhFablz5JkHqBRIJVbuYKly9S0oCxW/wwLPU08WKLj2YCeXPoJCci9LqsQYp5/UtNqy6lXkEe7GrySrnIJ9m4sdzMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfH05x3OkzHXemWhdQ21x2U72VlO700mcWzDsrhI/TY=;
 b=xd4datQO4W2bhJ/OB9t+FKjEbb4RBH9O2YMTkGdmTch7XM6cDPxjU1sX8aSNwo7WHbL7yxta9n9p66xChJ2n5dNi0L9gudST0TangVqvoLyGt/XV6nJra1pGoE7l/oHaNmdZcvWmrccK84GQZ5edKnSMf2T/qpryJt/Iqzh5cx9cMDAIuZvFvYGA6ZFdoYMtfMNtxUh8BS+y6XMO5qq7nE6Kd0t/lwyhqm7bvrDQq7Sntxxb8bCEA2Zpku2BoHtXgzsbQeRHyqRIJ44CgnUfpDI5rWZEfM9uan0OasWUPIZDcTWd7LMC7104WkGLxYTA2zUkDyGRoQdqqrOHyhynVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN9PR03CA0154.namprd03.prod.outlook.com (2603:10b6:408:f4::9)
 by IA1PR12MB6258.namprd12.prod.outlook.com (2603:10b6:208:3e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Fri, 17 Jan
 2025 08:00:16 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:f4:cafe::83) by BN9PR03CA0154.outlook.office365.com
 (2603:10b6:408:f4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.16 via Frontend Transport; Fri,
 17 Jan 2025 08:00:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Fri, 17 Jan 2025 08:00:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 17 Jan
 2025 02:00:15 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 17 Jan 2025 02:00:14 -0600
To: <buildroot@buildroot.org>
Date: Fri, 17 Jan 2025 08:00:05 +0000
Message-ID: <20250117080009.774814-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250117080009.774814-1-neal.frager@amd.com>
References: <20250117080009.774814-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|IA1PR12MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be7e4d2-e4cf-4d10-4a61-08dd36ccfa74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2b20skJJFeW8z5k7oVK1V8bhdE3aptI3y10UnUo6614W4j76rsq2OmXD0fsw?=
 =?us-ascii?Q?EXuZ2W2rKdjU/mHw36H2m4F4GAu7tx03B1NfTXV+0izDq8EB6INdSZdTp9Dm?=
 =?us-ascii?Q?JPiCCLquIkna59C8eR/vzNN69QhAPmqN92J0GltLNZJfe/YUZGo9T62dVJ3A?=
 =?us-ascii?Q?E97Fu0vfHQUoqNFefg1SffFTGKSalFfadx0UW/RV/O7OA+qflrcA0Dz21FdP?=
 =?us-ascii?Q?a8TLiSfssh1OIyo6Dnjj5gA7poIEGo91jjZy5QiE5yfNpyzV8GbFQbvbIQM+?=
 =?us-ascii?Q?uyDVJuYshMi3la3wgADsk7bN00FIzaRzFhFSQhKfSQATKcKO3WH/+9nf99IX?=
 =?us-ascii?Q?FUcjJRyrO5ElOLw1NG/MZD5NbcxOPagmXDlwaTV+Wjm9m4K2Q/skeSObZoHR?=
 =?us-ascii?Q?AQtNC+NvtK1+VYm1qEvUKIXyaHpuv8d2DAGDadmjvLFjCrNF2208qSry0gYz?=
 =?us-ascii?Q?DubgOZX4SAoAiS9lQKnWpHNoMlDmivs3pG8mqS25EaLuTiB/jYwQqPbK3oRR?=
 =?us-ascii?Q?Jc9Xenwg1snY3y1zzcy2jqL3G3MRbiDVzC4xcTBCDtZRa8KqG5afd1ib5GWr?=
 =?us-ascii?Q?H2foe0s4+uFBOyv4j7eJ2kNC8VCgCttCaURc5VmUaRhFIh5NCrnxFFfgJQ21?=
 =?us-ascii?Q?y5fDtlHjp02Qq08VwM/+mFo2DPgLBx8FLp9ySULWcxkmc0Mjnq5o2u1st28s?=
 =?us-ascii?Q?wjW1fg0zv4o8ry1XcyuEAAlCXGlPOOws31IWJ01/peunGmpi6Hgk8hM4/o/S?=
 =?us-ascii?Q?kdUujeUlmf6V1C6PrnWi1cnGq06sclLiwmy7LRp/tFV/S4bvBKsHGB/EU3rt?=
 =?us-ascii?Q?mKevhUs6pItbv2t90NACjdVgeDifzNsKj8Kqs29B1tMdy0u5R5iWsjRZdW/M?=
 =?us-ascii?Q?3InMzy0tCZcob9jrA72QP60795xBjn61K1RlW8aYQVarUB8l0bOA1SN36wAl?=
 =?us-ascii?Q?pBAlGjacl8KF7tSQ5u6BKzMoIq4nQfcgeP4Q7a0UWJyHabE49Jql/IYAx5oH?=
 =?us-ascii?Q?tf9ybkFk856CjAUcfYja93UW64a+S0313H1dBvy1LOiJcBV0nEuiIJuOfET/?=
 =?us-ascii?Q?/bgyhjFAQcu0YN9xAHPmasfBK1+P2JvPeO8iBWc9LjbUf747zBTcIA6VMUZx?=
 =?us-ascii?Q?d0plQqs0o9DROXH0d3LHt/6jw4jbTJDYciH0I44VxaweodLly5yNtgs9cR5q?=
 =?us-ascii?Q?FCPJ2K3PqkUxWEWRxOPJgtinDzlYLhucJeqlVMDvKP1lrpHstSYS6abDam4q?=
 =?us-ascii?Q?aRtovCu/RgjXOsReDnjlL6LKQC4W00mnqi1ctYC7ieUuS4HQ71nDPBicAu9I?=
 =?us-ascii?Q?f7pvJ8uMZv6yeZxKQBFRxmiTGUrLSXND7DyuE/LqsUDSI9DrHotqQ4xYfcTi?=
 =?us-ascii?Q?Kqw5ox7Oe55ZpMHqQxkBWsMYEJSjlWtXrtmZVvEf1HYh34S2pi3oA1fOkw75?=
 =?us-ascii?Q?d2r73xQIbqyXVqQqQbYTo1CFHzAiLAGU7WJuLGb0kEGigduSIqFMUg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 08:00:15.8850 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be7e4d2-e4cf-4d10-4a61-08dd36ccfa74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6258
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfH05x3OkzHXemWhdQ21x2U72VlO700mcWzDsrhI/TY=;
 b=pSF5HRksCVinx6gH7/LIj3PBBuZCmNGGqtfHY9PiUcHhuonJDc/i/SGjikxpMwf0SLyI346AjKDQ/xO/57BvJYvCSBQXlZIZ5gBabIIPpBhmJVZLYlxw0kg7C7sYuoAJ163GV5NbeOWjSKBGdyM+7dmSVsnBFKZK3N1m9ghNoFM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pSF5HRks
Subject: [Buildroot] [PATCH v5 2/6] boot/uboot: add qspi.bin file support
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
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

u-boot has introduced a new file called qspi.bin for users who boot from a
qspi flash device.  It combines the spl/boot.bin and u-boot.itb files into a
single binary that can be written to the qspi flash.

Here is an example of how binman generates the qspi.bin:
https://source.denx.de/u-boot/u-boot/-/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca

At the moment, the qspi.bin is only used for the zynqmp platform, but other
platforms may adopt it, so the buildroot support has been made in a generic
way.

This patch adds the necessary support for buildroot to install this binary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---
V1->V2:
 - added dependency on BR2_TARGET_UBOOT_ZYNQMP
V2->V3:
 - no changes
V3->V4:
 - changed config to BR2_TARGET_UBOOT_FORMAT_QSPI_BIN
V4->V5:
 - no changes
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f6823d537b..88cda4a9b5 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -470,6 +470,14 @@ config BR2_TARGET_UBOOT_FORMAT_SD
 
 	  See doc/README.mxs (or doc/README.mx28_common before 2013.07)
 
+config BR2_TARGET_UBOOT_FORMAT_QSPI_BIN
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
index d06ee2a792..e650452739 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -108,6 +108,10 @@ UBOOT_MAKE_TARGET += u-boot.itb
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_QSPI_BIN),y)
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
