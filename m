Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C3BEF8FEE
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 15:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DD7C60769;
	Wed,  4 Mar 2026 15:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 06zRaaIomouE; Wed,  4 Mar 2026 15:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54BEB607EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772637686;
	bh=/0UWsAwc3Sie8UtVHc5DpRHfo1MwJLI+maRSLmSDkio=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=FSsKrzLktysKjMbkT7dWe33WBJ98QqG5C2szULewEg/JYTsFWw5F94go8XiRFXDOS
	 ZLzESSKvqgwIX5fAjiowWLIQA8gDwCbJuOJbrbPIRbr4Nh1tPePRUBT22pipkgia1s
	 WBJhF/c/halSpRqZ0zlVIXAD7/0Uy4P3BxnUlb+1jMdOM5+kGogApfvxbaJfYYPSic
	 BIswem6jfQmpX/CYl3/ItAQStAIpBdENehQgrdZH9w1zd7VZ4iVZqMcA9g7xC0gdY3
	 2U86DHs1ENybNVBcFja4Swlr798czL9SRjY8JTD46iqrTKMhN54zDJmmFercdvRKGt
	 BpoAXbkky9Vig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54BEB607EF;
	Wed,  4 Mar 2026 15:21:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C19BC231
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B354A407FF
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUV7KCEAIDVc for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 15:21:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=52.101.53.36;
 helo=bl0pr03cu003.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F419407FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F419407FE
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012036.outbound.protection.outlook.com [52.101.53.36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F419407FE
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:21:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noZrDOCgORLaSOaA8r5iXqeOOTxOxMmoO15NmdtvGDtEor2+nDWH9+5Gr2DQBDh8Nu4G9Iwi9K4/U86oX2MEarbmgzX0IlDS0kj3+RAPgTS211XRr/jsk0S9+4wV6FBAJtdpqqZzML/e1AQxnHklZbnCddyNQ3ZM75hwSCH7Cik/Wc44uCl8QnAOBsliO9KDkuHUPggDYNbiGqlB6QQodjNlefZ2TBaBonqU3emLiGtaTeiZDbjhtFJuXuW55dzE2bncYOfEOZVhqQXLDWAjTSPpZ04oFJK95q4l9AisD3lidVvvPSEdG58LMZNQNXb+QACNq8jO6mR4FSg8R46LeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+SIK75PNYeYZd2A/vVK14z8lz1BIQjmxHbpHzazEFM=;
 b=bVa8Ky1YQbqw1BLjtfH7lTPy/hVsPfqR7XoDdiG3u/4e8H4fNSZzH6jO6TFlv7Ng8PJzwD9tLdXKApg3LSUjRXLMySt+qLns/R2UXSFhxo/qJvLv+13ePstM80T7oefuUZmavOuTFhC8aZQsmZh3LJJJaFO1zZKOwtIJ9PRHBtQPfHQxq/2ZqueW/66UE93NcLtWoTsJ1LG5SCvYI9ZDN2Z0R1FgBjjun44VfgmNSXMd5+TNonhukfWRoA6qyZNwNfoFnyMKJFgmduCbhrSq7xe1z0CysJNEHL2j+2dM37Tloidk8fhK5csSm4TGzp5LPn2EX7HN+VreQ99kdwzdFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN0PR04CA0169.namprd04.prod.outlook.com (2603:10b6:408:eb::24)
 by SA3PR12MB7950.namprd12.prod.outlook.com (2603:10b6:806:31c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 15:21:01 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:eb:cafe::95) by BN0PR04CA0169.outlook.office365.com
 (2603:10b6:408:eb::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 15:20:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 15:21:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 4 Mar
 2026 09:21:00 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Mar
 2026 09:21:00 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Mar 2026 09:20:59 -0600
To: <buildroot@buildroot.org>
Date: Wed, 4 Mar 2026 15:20:55 +0000
Message-ID: <20260304152057.3465672-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|SA3PR12MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: 6287c3e7-adf2-47a7-e9c8-08de7a01a4c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|41080700001; 
X-Microsoft-Antispam-Message-Info: GNk5V4rLpfxQcLru+CaEs1nSrG4J0T01ZgOnm/Y6QrzrILYCJ8KO6ICZ/5juJRP8+vzVw8sjJ3YlOlF21l5JYKFORXrJVtisiFL7Rb0F/h9KpfFvBkMXIgaiy6Ulcc2I5a2zZsMQEenpLBEqgFwfof1YdVyNlCNW4uZrVh7G9aCjbJsL2B7mLZ2mUBPLfi+gCPmZsyUaulyRY2aWK3fSA3d5aQPOC6CFIdd5y14weo3Mq8xbl1cRuuauK0V2bB3FJaxGZGqkpXI8wJ6T/wI8+OKLFX9vtFz1RH02I6bhVBqPf229z2ut9px9Ua5MVPjh8rqPnOHNsOFHQYu6i+0T6ix3UkolTwfRW6IxpmR0f85/iwaY23I6uHt0SClmnTw6nhUc06UK+dqpNYmUjXCoWdNHTHscJGf/DqR7jRdBhfSygV+mT5y8bqsePSMYiBBqRyAbJxcl+MBkISf+L/qAaP/pj4Vr5Zml8/jzP+S1uUpJnpjjFHuV6XCzj8uTQNHGjwoL98SEsW+LGASPTVkku8x5K/UpY6FiCFfGwIYwjmAC38LKCafrNzuKELaNlvPTYCk5wibA6VlXLKD+ogyCjz2/cJT0pQINuXEOKqWztV5x23exyL2yn/iyrYIz8tnQwpE3fIGnriMvljhqD+l7rgwAFQMqJwjMzIbAkC2wMISjk0VJGdkZIG9xiOrB4AvL2lv66jnbKSX8s8uIWK7tmOvzm2ShTZuRIjN2HRHUMGHVPbvn55ur7ugijwuoaMg3WwRFNghsH64S0PgtyI0XYP6fh0H5/KbKWTo0QnWVwqdNn9f2iaj6fCePN9beURahMqYozL9+oeLuS+VZkh7yhQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6eV7UhHjQYWZ9nirphR/9/wx0E+nDvRjGVkLPKHsAhqfrFlmerMtVrsWoe55zz79d4ijwgmZqRw8i3SHYnKwDFaxV3w5vsWL2AzsdgOiLO1s5eL0m768MaHH87an1eqyCSiKbtFU74LT7lbtV84lPqxLuHPXFI9ntYjO5u55suA8BM3hAnE/SM2kPSn4gZ1zu5OjZF/FMfRQDgmZlP4FaUAHD4jGkj+tQ52yinfNUwO2BZSyiJ0OJnsg9PxyUKGxu2xD1+lKoEJ+LZ/wY/qlPk3ZbwWnn+nKWJcEaBYJRwhC4ucz2QaemeQufZANNO5Vq7kRb65AVaSmYhRG5mrAdUuL5HM3E6XfmlUwhFjO6juSiDMxKV4nVo7rxskSX+4OD2F+iIke7IEIS65K0GJwStdxZ9/yVy7fsvJVMLted/qS/U52gSBzF2uw4mDw9l+f
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 15:21:01.0507 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6287c3e7-adf2-47a7-e9c8-08de7a01a4c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7950
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+SIK75PNYeYZd2A/vVK14z8lz1BIQjmxHbpHzazEFM=;
 b=QniV5poLZJCkkmL18laYi70UJ1PKqrPbeTINlG1we7cGWYCrs5bCa7o4Lm6LK5vDfYTxOF4O0fng2Qvgv02DBRpaKzJ4b7IpkPWo4TIhVTB+1nfI+GFNEUr/OSaWSJFXM2B6l1ScnuEt3lBApugKzzsuwNc1pHCI5RL94FzKeKM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=QniV5poL
Subject: [Buildroot] [PATCH v3 1/3] linux/linux.mk: export LINUX_DTBS
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

Users of the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR config for custom hardware may
wish to have the dtb filenames for use in their post-build scripts. Since the
BR2_LINUX_KERNEL_CUSTOM_DTS_DIR only specifies paths to custom dts files, the
actual filenames are not available for any post-build scripting.

By exporting the LINUX_DTBS variable, users will have a list of all the built
dtb filenames that are built and installed, and they can use this for
convenient post-build scripting.

Even if users are working with an evaluation board with an intree dts, the
LINUX_DTBS variable will still give them a list of all built DTBs, so the
same post-build scripts which work for custom hardware will also work for
evaluation boards with intree dts files.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 linux/linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index c61089bfe0..6ef9f54ffc 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -226,6 +226,9 @@ endef
 endif
 
 LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME)) $(addsuffix .dtbo,$(LINUX_DTSO_NAMES))
+# Post-build scripts may need to reference the LINUX_DTBS,
+# so export it so it is easier to use
+export LINUX_DTBS
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
