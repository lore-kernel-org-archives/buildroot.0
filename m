Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F306C2BA15
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 07:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED86661206;
	Tue, 18 Jun 2024 07:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbTwEDhklHnD; Tue, 18 Jun 2024 07:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFA7061219
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFA7061219;
	Tue, 18 Jun 2024 07:49:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 641FE1BF283
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 07:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BD0F414F4
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 07:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ipCU3zhY6rCd for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 07:49:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::61d;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C85A940786
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C85A940786
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::61d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C85A940786
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 07:49:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIP28lyX6OHeYMtNTs2b39GgtyrD2sA639kw22w25DythS5YbuEmDhE+iIx8DywTFF21op7Fal6HjbI1Kg6AIhtY0YDx0CD4m5rdwC7Sc5Dkn2nXsehdIdXJ7c6HisUJISrPhK4A46feFQoRoNDxCzeH07no6f/zzYGOVaLDwtkLLQus8YloiAYzepiBwn0CIsWEUyFKCgti9RJ4TBD2u3Q56rjYga6MzB/RPQ9OfcvjLbSC66XmOrAm/mbZRaI7q/n1RSoLCM1yuHz2/AEiau4lkGmMQsQWse49q/ZRyHq+akmhAE9b7UDz34kmu/J5eDZorxOksaei08+06vaoOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSnHAFv56udh8ZYwK70yBefaEdVjFvYYD2+CfFIV/ro=;
 b=fM6GDlVyvYAmjxIr0/S1UOnfUHlH7+7HeJFzDo4C9E1x8pm2jaxXhyhu1uBOySyfOGhb9OAFGdefGejUZ+6MFnuPhBuqSQeJDFCF3CrvJn8mt0O51GPSVIF+fEjL+lL+uKbwbMw0udzSN2hx//xIJ2UBrfUl0biHcP1meiZ58enS2r+X0geHoIo+E+cLU9orP7lnWeDxZabPffdm2AwHEDuI1Al5AZ+eGu0f9Ac0xZHrFHCXbU/X03XvC7kxAsMUtwiNWfArlms9KF466VXtMPBb7Jo/I4BYoZJKvkL7CVrA5bYBAwNDAbgy54dEvVVwx+8h3w2mHiSm/mWiDkysBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0102.namprd03.prod.outlook.com (2603:10b6:a03:333::17)
 by SA0PR12MB4400.namprd12.prod.outlook.com (2603:10b6:806:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.29; Tue, 18 Jun
 2024 07:49:32 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::26) by SJ0PR03CA0102.outlook.office365.com
 (2603:10b6:a03:333::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Tue, 18 Jun 2024 07:49:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Tue, 18 Jun 2024 07:49:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Jun
 2024 02:49:28 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Jun 2024 02:49:27 -0500
To: <buildroot@buildroot.org>
Date: Tue, 18 Jun 2024 08:49:20 +0100
Message-ID: <20240618074922.3555070-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618074922.3555070-1-neal.frager@amd.com>
References: <20240618074922.3555070-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|SA0PR12MB4400:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eba5b2b-30a9-4062-6aba-08dc8f6b3081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|1800799021|376011|82310400023|36860700010|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n2WME139MgFdWS4rERCi5+p/Aya3QXXXMSxhtIO0wAPgqygNE8kAppoRviyb?=
 =?us-ascii?Q?vhM0xsiS4DkKXWHPgQss80nfWR5feSCJYhCOZbXZjQw7ccdiSKZ540vGmJat?=
 =?us-ascii?Q?dd/O1cetBk37CtUlBb4irBManMZQ33wEClpmkTQGbJHqXHbvYEuo2Jyo3bjA?=
 =?us-ascii?Q?LOoA4nDwsGVKpQ8y8UgFQC8gGjYbRmpATJjBw40TV9Q2WmbGzLTPkYVO6n/R?=
 =?us-ascii?Q?A/eMTy5DksxcUaHUTCT/NpRQIVGnzpb6eUNzKgb5LJaqQDdwMYh0bxiD7KCa?=
 =?us-ascii?Q?ZDyKnufcSLRRaCvRdsFGeuxTfa28w2szHC+KR2gnXq9OTfIDENDPNWhFNbTx?=
 =?us-ascii?Q?yPdXDm+qVCeevuH/Lkcgdz66WNgsNU6xrJDqVYgG5H2Aq2C0SxpjMDZT5Es3?=
 =?us-ascii?Q?1jmvsodWVdB6xxqzonogIKHlq2o+OJKUhFt5RSsMh2e0dwXAmdBy44MibjeG?=
 =?us-ascii?Q?jzEOk4ys4sotO8Jf04CRmSn5UMB2I6z5DGiNh+qtdJ9ZXi8HOkCWkEkw/Cd8?=
 =?us-ascii?Q?MLU50gNKGlEMFONsSxcm3erzrh+SSbsRvNJk1H+Y/20ziPr2WKQGdNEnLWhE?=
 =?us-ascii?Q?WET6WoSR2zy+dVbMM73M8e+hGILR9WDpHpqKfD58SY3RO4bKs25ghrTjdZ6U?=
 =?us-ascii?Q?k4Q4EHS6q2n0tWHBwua5QFfiObVUFkzja1IVuFSLt1bZ/SBUqxIWU7rschIM?=
 =?us-ascii?Q?IIu8AW3E8dXjfZhqUjLSDPWWpvVubAYHV6O1JGRYw9a6j66D2FbEw3mnCKDg?=
 =?us-ascii?Q?GA7QmHAfuyzOXBDmyAmOoxTSegWDKbjodfvXwtkMWeTwlD+twqsUme8Ba+TU?=
 =?us-ascii?Q?J2cW0YEHrC/w4+gjYFOoJNm7oZZDZqHu0G7Drne5wssqjZuUfTjisfODVpRO?=
 =?us-ascii?Q?LjepLvaXWEuxGcOfDdpBt/HfMqoAboeZAaRPFXc8Uei/xSGfH+K8XOTQhzol?=
 =?us-ascii?Q?Y6C3eQW2ZrC2jme165xx4er75PuoHtCI/i4hSSZ7rvZ/QYhDpvdy7awm/816?=
 =?us-ascii?Q?QBGoPaQCVSRACCoc2WJ1purMc76BtmvVXoOS1xQK47USvCnXyOjc+hliGsiT?=
 =?us-ascii?Q?xBQvquofHd+6mWkIZ4SbH7mHoJKX37VXa1ZwrdkZs4DgN0+FJaTGk02S4sJR?=
 =?us-ascii?Q?pJVKu5HaXLSmkSytRctHvSQqV7RyenwiqVfsWENIkIMfV9nR1CstH0RShGho?=
 =?us-ascii?Q?heOq7BdkO20ScJPTJMyMMeyMhRcJKoiEJHimlTQSmfAsou5iU7Tw5A8AKgi1?=
 =?us-ascii?Q?Myji2axDbjP3iPw6BD8y5ZF4awRvMN+7LcgtmQs1FHdXdIASEIyYyEr+gcXk?=
 =?us-ascii?Q?UfeK+3dVjr8CbZPvO2tLOGpqmzTX1zBYlggG8a/H1wwlu7N7WG0yjVn1hJfo?=
 =?us-ascii?Q?+1VQCnOmWV7HE+gsn6J5TBnmaIXfqkde+MHtIATH96aO2tfFMsM3swuVbvBe?=
 =?us-ascii?Q?PR08yqg2DSg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(82310400023)(36860700010)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 07:49:31.6265 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eba5b2b-30a9-4062-6aba-08dc8f6b3081
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4400
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSnHAFv56udh8ZYwK70yBefaEdVjFvYYD2+CfFIV/ro=;
 b=HH35hx0tetMl7FJjj1/dv77aW47NP8pjeL06rwgjD9GauBzvxi+VE7t2q4B/CphYdK6vjUzuuS94JoGctxjfbNZGfhj1sGZ9wgtVQJ468WjoVJQ+t1/wUv1e9cJUEOBLIayVgti1GotnktjOh4sWFJkno3C41I4YQ0gcmtB8jZU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=HH35hx0t
Subject: [Buildroot] [PATCH v3 2/4] boot/xilinx-prebuilt: wire up
 xilinx-source
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch wires up the xilinx-prebuilt with xilinx-source.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V3:
- no changes
---
 boot/xilinx-prebuilt/Config.in          |  3 +++
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 13 ++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index d3df1c06e7..34b89337fa 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -22,12 +22,15 @@ choice
 
 config BR2_TARGET_XILINX_PREBUILT_ZYNQMP
 	bool "zynqmp"
+	depends on !BR2_TARGET_XILINX_SOURCE
 
 config BR2_TARGET_XILINX_PREBUILT_KRIA
 	bool "kria"
+	depends on !BR2_TARGET_XILINX_SOURCE
 
 config BR2_TARGET_XILINX_PREBUILT_VERSAL
 	bool "versal"
+	depends on BR2_PACKAGE_HOST_BOOTGEN
 
 endchoice
 
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index eb78ed10cd..4cb3e2a33e 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -18,8 +18,17 @@ XILINX_PREBUILT_BOARD_DIR = $(@D)/$(XILINX_PREBUILT_BOARD)-$(XILINX_PREBUILT_FAM
 
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
 # We need the *.pdi glob, because the file has different names for the
-# different boards, but htere is only one, and it has to be named
+# different boards, but there is only one, and it has to be named
 # vpl_gen_fixed.pdi when installed.
+
+ifeq ($(BR2_TARGET_XILINX_SOURCE_VERSAL),y)
+# The plm.elf and psmfw.elf images will come from xilinx-source, so only
+# the *.pdi needs to be installed.
+define XILINX_PREBUILT_INSTALL_VERSAL
+	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
+		$(BINARIES_DIR)/vpl_gen_fixed.pdi
+endef
+else # BR2_TARGET_XILINX_SOURCE_VERSAL
 define XILINX_PREBUILT_INSTALL_VERSAL
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/plm.elf \
 		$(BINARIES_DIR)/plm.elf
@@ -28,6 +37,8 @@ define XILINX_PREBUILT_INSTALL_VERSAL
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
 		$(BINARIES_DIR)/vpl_gen_fixed.pdi
 endef
+endif # BR2_TARGET_XILINX_SOURCE_VERSAL
+
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL
 define XILINX_PREBUILT_INSTALL_OTHERS
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
