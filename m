Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4845FC433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 14:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C598B405A6;
	Wed, 23 Nov 2022 14:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C598B405A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GMRaoNouiiGY; Wed, 23 Nov 2022 14:31:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F30E40491;
	Wed, 23 Nov 2022 14:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F30E40491
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09C0E1BF3E9
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 14:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D89DA4025F
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 14:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D89DA4025F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Itj_94R4YBtE for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 14:31:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF3A240242
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF3A240242
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 14:31:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyqrVKJD5k72VduIm8o9X2ygKus6WW4Gxckt5mD35rk87igFhTda4pf+DwV/sudYyhfCaV2KfHEiMO9UcbWFTM/nnVBFuhhPPIpNnIn/fCT6sZqzsr6roH23A73PVinJWX++eqXx7RGzoMNIpFsB6oKAgp7nVHPb7mX0cVpKzfNLI3/O8qnmXoWIYr97WQvGQ43/hLd1b0aOd5EregJvRtZ/8Uyq2u7U29DIdSQgOUZsr7ORkAYKzJsd4LMwxGxSL5J2SmRaraCyYTLBQI80WbeMpcudD9g+5Tokw1FAfZBFIWwKCZBr/L0VQ4IMHl3mtGLM3s79STILQlBtdECn4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2quyBQzZbHZ0JPjkI+HV9dtyxiAvKN42HdK98P4EPM=;
 b=YtTqSoAr3NvCiCagF68d8Dv6RMPF4dyXF4X4u4ztvhtKIb1NhJ2iiU0QpKXnxMdPmRvQvFCFiKxsejMXw6a4LH5TP+vlNE9T+PWNLFlGXfWllu+nu1R2LggC+Ul8hgIuxdaqwmQbCksHiCXHxBivoJjtVXKREndrCC6nHzEe6YFZqIjUYm0SKXEX5rOmtdriRijMXDEmf6AkXJXAdWMDdZ2cwMxVd1GLZBzI4kza8BdGzYsjn5eoNFHu6OjvpVFEgDIJRiWbO4ZadwpPXo+I2SWM69XhZmeNoWhWxxRgnjIPVg5SMrkSukiVQZHZSW4nmeHGCGifg7ojCmOZUWmUpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0124.namprd03.prod.outlook.com (2603:10b6:5:3b4::9) by
 SJ0PR12MB5471.namprd12.prod.outlook.com (2603:10b6:a03:300::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 14:31:31 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::18) by DS7PR03CA0124.outlook.office365.com
 (2603:10b6:5:3b4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.18 via Frontend
 Transport; Wed, 23 Nov 2022 14:31:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Wed, 23 Nov 2022 14:31:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 08:31:29 -0600
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 23 Nov 2022 08:31:29 -0600
To: <buildroot@buildroot.org>
Date: Wed, 23 Nov 2022 07:31:26 -0700
Message-ID: <20221123143126.17843-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT054:EE_|SJ0PR12MB5471:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f3c3534-bc42-4909-904f-08dacd5f6969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wPUj4eTd9aW6niydW8MIVm43aR1Y9nBlkstRdieK+rtCweaCRtJuGh/VuVLJG7ne5bsjNHOWbhrQy6rW9b40R9zYosenyeOP8F/rBplaOly+78vTMvOYO9Tv1HtxCiYgdr3K5IEQCUcfzZNerfmFHgF38Qlg7Gr4gLF+XnLlIC/UjyCVQAbdq0pQYMGJpO/PtWQuM7T56Q54NI1RUPHdfx7yR1fQ8WsOAt8P/Y0iD6k8en/vv/GOgyNKrL0nQyiYSnX/5IyT9pGhYTe3Lw2B6ylZjF3bK7vYwot4AVBYLGrCi2WBz/1nylZfyCCT1wcxIm65QAjhApMs2yNCdEDynGX1N2a8hZa9riHcDM41g0zEpIFV8SNIxkvDApwAAdwijy/Mgh0R4/eDHlaBbLkitplgRQ/Fts5nk3sY+SXzzqbqQtxznyPTO8bZF5JSnILEMYDYBvPNP5MaQHpTCZazgr0Ywqk7lnMmeYsCT7Au+TSsv7cGJruPawilmUAHdE+EwVe0jdxhL14rvYdcdV6S8dspa+6k1EW4JZWTYvMlW7bA+4hAeVjnPji1fK6YZl9bMEUOBbjW0zNMZsEOHBYI7JmacrGxdkcVyfc1W7GU7UrRM1XO8XQRX6DIsKgOXU7Osv4wk8rwDXQeoXYn50U7AR8SR6NfwIi7paT+ZupG4hPcPPDSKWffBr/NhQN/uk2tWR12T1SYl4QdqC/Fzh0WXTByMFuouQW8H/Cj7YtRhGM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(86362001)(2906002)(40480700001)(40460700003)(44832011)(5660300002)(8676002)(47076005)(83380400001)(426003)(356005)(2616005)(1076003)(186003)(26005)(81166007)(336012)(82740400003)(478600001)(36860700001)(54906003)(41300700001)(82310400005)(6916009)(70586007)(4326008)(6666004)(70206006)(8936002)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 14:31:29.9522 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3c3534-bc42-4909-904f-08dacd5f6969
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5471
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2quyBQzZbHZ0JPjkI+HV9dtyxiAvKN42HdK98P4EPM=;
 b=ICzbA+2QDOYOQTxMr15XoX/rLeG7bn7v+3u0k6x29j1ZdsJ4zWHnhuq3SURE09lDJnC5IfVaUg58lQESmZ55NQg5OzLnZGvEcFlFjoslMGN4v9eaanC6pHFdpuHcqPb1m79RzJESGZyB7lgzA2MqFizkZE3wbKPqQS4oJnb3zWI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ICzbA+2Q
Subject: [Buildroot] [PATCH v4 1/1] boot/uboot/uboot.mk: add binary
 u-boot.elf support
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
Cc: luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If a user requests a u-boot binary in elf format,
they may actually want the stripped u-boot.elf version.
This patch provides the stripped u-boot.elf binary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - reduced scope to only 64-bit ARM arch platforms
  - non-ARM platforms may not have a u-boot.elf by default
V2->V3:
  - test and verify u-boot.elf exists before copying
V3->V4:
  - added a new BR2_TARGET_UBOOT_FORMAT_BIN_ELF config
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 557472b58b..b7591d4542 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -277,7 +277,15 @@ config BR2_TARGET_UBOOT_FORMAT_NAND_BIN
 	bool "u-boot-nand.bin"
 
 config BR2_TARGET_UBOOT_FORMAT_ELF
+	bool "u-boot"
+	help
+	  Configures the u-boot ELF file with debug symbols.
+
+config BR2_TARGET_UBOOT_FORMAT_BIN_ELF
 	bool "u-boot.elf"
+	help
+	  Configures the u-boot.elf binary version of ELF file.
+	  Debug symbols are not included in this ELF file.
 
 config BR2_TARGET_UBOOT_FORMAT_IMG
 	bool "u-boot.img"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 9e073daa38..55ed6b1ba2 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -60,6 +60,10 @@ UBOOT_MAKE_TARGET += mdbtrick
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_BIN_ELF),y)
+UBOOT_BINS += u-boot.elf
+endif
+
 # Call 'make all' unconditionally
 UBOOT_MAKE_TARGET += all
 
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
