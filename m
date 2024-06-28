Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADA8C3064D
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 15:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DE25400BA;
	Fri, 28 Jun 2024 15:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sBSsoq3xKkKs; Fri, 28 Jun 2024 15:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56FC941C32
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56FC941C32;
	Fri, 28 Jun 2024 15:21:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A7A731BF398
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 15:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A062D418A3
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 15:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58_V0UZQG96A for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 15:21:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::61b;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F443407DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F443407DB
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::61b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F443407DB
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 15:21:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwhfsKa7O3pE/BjSfXqxB5dhu9O9XF5mXlAKAQy+CqI760mChQ05Ai0//MgEMaoQLlubvm3vaAZTFLIlKwNCB6RQKxgod0Yikf5tctgNC0jxT+cTbN5rVd0iDIePORYW0x64y3XxfQVXqCnPHYVGJIlI2NG6TPDuuny24mk8cBscBU7ixX6+KwOB/F0yro595eZysdom+UikQfK5QkZGI/Ks+EGxrCrkLSAFC+EydG+W4efc7i0ihTEVZbBQb8XZoNqfdx7sjDPpyNVKTmfUve3u6GT/EZbhaiUtoLm+LPCw06eNJrxWIm2qx836AhShV3ztfRQ3uZWqU1o0MwMpoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMvUr+GDTmc0bY87VVvUa6vFnlHIML5X1/dU9NmoWwI=;
 b=bKJYm6/pRFgXSkiAjguKjMzeTq8LjeCv0MwxbCWajk7GS0PfZ/KXNijgTK+J6v3hcWrLVdDXCY1ta1TraupWpp3Esys8FWBtTpqfwTCSJOSHXbCswNqrMiE5uACdhOUkG98YQTsdgzTwoC+meB+xqff0g84dp17Zp0GPmxRs4YL/ZPVM3LEpDrVdBRu1RZhqU5BxsdNs6sEg988s5IotU7dO26+s6mqwRPOwEvU5oWSHovvV1b/PX8X1uyN8OyqFC70XFuXF8gAoqDj/ntB/VvYyHKJ0+mtlu69UFGJX7RamY50Sw0I1VSUiT6MV/2WWpgcPY7zGQ0WpgGftF4usjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR06CA0037.namprd06.prod.outlook.com (2603:10b6:5:54::14) by
 PH7PR12MB8593.namprd12.prod.outlook.com (2603:10b6:510:1b1::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.29; Fri, 28 Jun 2024 15:21:12 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:54:cafe::cf) by DM6PR06CA0037.outlook.office365.com
 (2603:10b6:5:54::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26 via Frontend
 Transport; Fri, 28 Jun 2024 15:21:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Fri, 28 Jun 2024 15:21:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Jun
 2024 10:21:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Jun
 2024 10:21:08 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 28 Jun 2024 10:21:07 -0500
To: <buildroot@buildroot.org>
Date: Fri, 28 Jun 2024 16:21:05 +0100
Message-ID: <20240628152105.2233086-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|PH7PR12MB8593:EE_
X-MS-Office365-Filtering-Correlation-Id: fc3d99a5-4893-4ca2-0337-08dc9785f142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ISSsWKU5dqDFP+W3N8+cyvz23Ml1XSi2wu/kuGsxZbFtXkXxgUdQ+6ODN3++?=
 =?us-ascii?Q?dgQ6JwqjpHet/71I2oJKJJDBTdLmi+rZcbVsNgKpJnF6PF9YK3xGp4d83BxO?=
 =?us-ascii?Q?FZY2P7E+c4qRx1v2LhKvXFRdihx7Sj7X5Mt2HQqgwpWvE7ve4l313WBHOybE?=
 =?us-ascii?Q?DpnCUHnLan9JcgQAfU2N16Jhx9gQ/Ikhf8567qzouA139LgkJowzUVXeZnQG?=
 =?us-ascii?Q?hSFIQPsvQK4zXBnp8BB1HKfGFW6CzvIA++l+t7gWWKp7dWvl+MZihBgezy2B?=
 =?us-ascii?Q?I0b7bOsUjtHlgInEGnXiSQAFuk3PMyb21qOaH49/DR/FSENYHXR0Za1dF055?=
 =?us-ascii?Q?f2sWqPmB7aRhC3bM+uQUKSrg7ZcHXJua0VEgf6yeuTZT5snKx0jwbc1bRRfZ?=
 =?us-ascii?Q?KeLqncN22SuxTJ5EZR4qwQXQjpoueD1ocK2azvaSlYP7Wb+pIHHt9moqxwLB?=
 =?us-ascii?Q?e2cee3P9pwLCydRNjaug7gnfi0fJDlnmIdrqQT7Pi5g+1d6Vd5mwqvXvSCRq?=
 =?us-ascii?Q?kEWIC2evet4ru6j+jYZp245aN20TRRa760saVfhdrs6HsOjJgOQa5+ZY+OsN?=
 =?us-ascii?Q?W4QW0tKfntE6X54Z9ANTcNW4r6ZnxmrglwmedLSiszMAzIIjWjpD8pGHtU68?=
 =?us-ascii?Q?PqmWIf8co0re49C0K3b8wOMF2WFEUtAotkZcDqXpoP9EPuo4JUKYRicP4AKc?=
 =?us-ascii?Q?cFbXnMLVEwthSDvUIDuAtv9GzcYZUfW6jG93xtmeeubZxa63O8/zYOUI+a3p?=
 =?us-ascii?Q?XNU7bNIoAlTb73ww1MYvy1ONiPd+b7/vQ52UIL0FaNNanQicFTfQYkpBNHRR?=
 =?us-ascii?Q?ZQ/cMQfDXH0v2InEJnGOXYKEyxv2ZoCT7mV51RF54cDtzHO/DDl8fI7QfTGK?=
 =?us-ascii?Q?ql7gRmXyItb3hurK6YyUAxCk3KPsDluKCOTUhm6k0ryOIhdNXxQOk3bICVF/?=
 =?us-ascii?Q?o7m36frHC3PxmelDJi8anyj5HRpGIRk2DtiXF9bHN38uDNTTmkyn6aohk9Pd?=
 =?us-ascii?Q?4UKiFjtdEojvhAkIZxMUEGGR/VHi6nu7CPEecLvLi6f2o7xrrcWmsWO1RMPP?=
 =?us-ascii?Q?HTkWc3AncW3RsqOZ34v6cyKtDpNX62sAw5a+XawYzmYxxiwZ+taXqX8TMGfx?=
 =?us-ascii?Q?fG3v7h8p2IACPXNmVWFi2m+ANfGlos7zeUl7Mr64xexaifNjaAuiju6NUgtW?=
 =?us-ascii?Q?dczzqob0es7onjin9YGV8MsuL92kIdKNXmF2cshyobSCUscOObt+n3HWxQUq?=
 =?us-ascii?Q?jXLnC5bf+iurFaneLRa2wGJY3f1QxuX5Auu6VAte5ESToLPTaQh/7wYvHkAi?=
 =?us-ascii?Q?DFFxYd+jiiSEOB/A+vy5c+2euruHhYtVoVOu5+KPesOsQadDv04RaixhKzp5?=
 =?us-ascii?Q?OHErWJXOBe9JvVGW1OSxtacyfaPNnSOQ6nP+4ejfJC6orpvKohK+lSX4Bey3?=
 =?us-ascii?Q?LhNSupsLFLvKXw9hPG8f9msmGVKCgEcwL7mcmd71HRt83InJzhlijw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 15:21:11.2753 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3d99a5-4893-4ca2-0337-08dc9785f142
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8593
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMvUr+GDTmc0bY87VVvUa6vFnlHIML5X1/dU9NmoWwI=;
 b=YX4JvmMUob5ec5wV34sMblR40Bfh/VvAoQ3nGiSL0spWKuwGvTcUe1E4CDsaFKillATeD99/UGxTVPfpDc7UFMSscxmEP6yWNXEjqZVHWxwVUvtmZNXHBTykB9qlPn8M8L/U8mFH1SFAAHDVhJ8qOschhSOjMVu2xPwg6CBLRLc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=YX4JvmMU
Subject: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt/xilinx-prebuilt.mk:
 simplify variables
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: andy.a.kennedy@collins.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch reduces the xilinx-prebuilt package to a single install variable
that changes depending on device family variant.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index eb78ed10cd..0c5456f577 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -20,7 +20,7 @@ ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
 # We need the *.pdi glob, because the file has different names for the
 # different boards, but htere is only one, and it has to be named
 # vpl_gen_fixed.pdi when installed.
-define XILINX_PREBUILT_INSTALL_VERSAL
+define XILINX_PREBUILT_INSTALL
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/plm.elf \
 		$(BINARIES_DIR)/plm.elf
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf \
@@ -29,15 +29,14 @@ define XILINX_PREBUILT_INSTALL_VERSAL
 		$(BINARIES_DIR)/vpl_gen_fixed.pdi
 endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL
-define XILINX_PREBUILT_INSTALL_OTHERS
+define XILINX_PREBUILT_INSTALL
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf \
 		$(BINARIES_DIR)/pmufw.elf
 endef
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
 
 define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
-	$(XILINX_PREBUILT_INSTALL_VERSAL)
-	$(XILINX_PREBUILT_INSTALL_OTHERS)
+	$(XILINX_PREBUILT_INSTALL)
 endef
 
 $(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
