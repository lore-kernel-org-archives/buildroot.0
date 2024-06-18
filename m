Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53414C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 06:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 193F460741;
	Tue, 18 Jun 2024 06:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mxJOBdtmcVbI; Tue, 18 Jun 2024 06:24:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CFD460824
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CFD460824;
	Tue, 18 Jun 2024 06:24:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C4D21BF284
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 06:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 892EA409DB
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 06:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mk106ynFfbo7 for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 06:24:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::62e;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 696EB408F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 696EB408F3
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 696EB408F3
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 06:24:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXy/dBFdFz1DCYvq6uDLlKAOYk2UyFBsdsGrpRQbo18IWqYNsYGwsQMcZaJfbXln8rgBfjAEXhKxS5TqGGtwD7y6wWihJ44mAD3MfkNi+22Cr5mBFsCKLwGM1JJ27NkVWNhAZRhfp3TId2DFacE81OTlQG+NlkU5+IGIpl2aaa6uEFnGn5qfZghgHZk7Pb+0LVaYOgQw+wa4KKw6uNwFxaQ+RkacrXGZfu4GJL4Wk62g2cBH/YHD0r7MYo0GhqoYM7PGwxWqWLXVrwLE69GMaPYHtcH5EpNuJPi1OpOIseGgfmaXIbVksT14pJVLWz1VpXk1fF1Aft/e6Ap9gM8kVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byz6krfDxCe/S+WZypwKbvRIEpCJ89wumndr+2DP2i4=;
 b=Dy7gFdeQq01+CLiHaFYPm0QEBA3mebuRWrRIw3zxXQT/VqVSNy4TS71X9qzje4ZgwqD5ypspp/W0Sxl9jVLPABuI3Rw+eFCAvmKWxYW9pe4MAgjJz7j8qrT2VW8C6k0UR9X9tGj0xYVjfz9s4FhidBCKIt7gJVNMk7wnDIc9wV26/lVkibzE6eyFF/3T5pGafXo6QhPm8SJxs4xkrQ8qj13Wxj+0NwZYhOo1PpcKFMPS+dlrDiF9zzzySSUwLAXLqoZ7TARMDtmeYkfwBl2IInLzmCBWmlWeQ+uNhiKht4utLmm8jW6sWHKOwL3o8ln1uuKBWZKgxET33v4mi20Fzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR03CA0303.namprd03.prod.outlook.com (2603:10b6:610:118::16)
 by PH7PR12MB6394.namprd12.prod.outlook.com (2603:10b6:510:1fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.18; Tue, 18 Jun
 2024 06:24:28 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::d6) by CH0PR03CA0303.outlook.office365.com
 (2603:10b6:610:118::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.32 via Frontend
 Transport; Tue, 18 Jun 2024 06:24:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 18 Jun 2024 06:24:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Jun
 2024 01:24:27 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Jun 2024 01:24:26 -0500
To: <buildroot@buildroot.org>
Date: Tue, 18 Jun 2024 07:24:20 +0100
Message-ID: <20240618062422.2916787-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618062422.2916787-1-neal.frager@amd.com>
References: <20240618062422.2916787-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|PH7PR12MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ebae79f-436d-47ce-5e16-08dc8f5f4ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|36860700010|376011|82310400023|1800799021|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6gTAnBM6la/Fc1UVfSF7Q5l50IxJjfD3f+dIJHchcumSVFtiCcqyRWjlfd96?=
 =?us-ascii?Q?J8v99GmB1JCRYgy2qGNRC+RRhzoh93LEjemrJZuGK2rgPAfYLSruEl6r1B+v?=
 =?us-ascii?Q?cr9Q7eCpS20nC1JI5hq9lTXv5nY/u5PeT+HjiF/luv8+ZwuzS8rZlaq1eMN/?=
 =?us-ascii?Q?x/IhwrDkfNbN0dwPf/PT+OvCenJFbdSf+ihUo9BAzfk8DaRWBRWEULT4Hrxg?=
 =?us-ascii?Q?AWpJZwTvTXAG6+qZNlLaQyK9qQ4olC9ukmeaB8Y/PtE0GCKMxWHbKtx9llQH?=
 =?us-ascii?Q?Z7DnBEWqzuuofOjXyFzvGkYD0m6v/U7rxETdFZ4WzpSfcxBY3mBITZCkPSo0?=
 =?us-ascii?Q?5lZqXlj8V33NrJOTl7fEu3ZCgmo3YMFMnj1M92JXCEc0tHZxjzNvGbXKz0jP?=
 =?us-ascii?Q?6++7STLCpNhUFIvrwlNEW+gfZMHnlihxdvx/l31dOP94gbDB8I6eecNZDPxa?=
 =?us-ascii?Q?/HZ3L5oh9IH4B7Jol3tBrSjw0sf5SCEw9bE+GAzdq8/Oi7UBKEaryXrJqc2E?=
 =?us-ascii?Q?B9DJb9FR6lbmNOd+ruS1Mnp4uuVLblHLtwXN8V5ssFcoygprNHedONAdTMji?=
 =?us-ascii?Q?Azp8jvgn7ongdqsRvkzIW1kfGrA/BOe4HzwHF6TMIebpys0KOeS7foJyKysm?=
 =?us-ascii?Q?GwJ1MmztLlLJfnbUR3BTMox1P5Ex+jNSl3nU+oUqJ6+asPM+a+VUFGy9Y83n?=
 =?us-ascii?Q?odY9W0iaWXhg5fF7KNxO93cAPTOVlj1Jo5w9O9604EjiCzrebXGgpim39BoE?=
 =?us-ascii?Q?lhwdqqVm5FYxXARVsnkoHPeAN8nfgRZLWCnYMb0CBcOLxGhGd1TTDHZm2Mk2?=
 =?us-ascii?Q?Pgup7yQJ0Vl8XNkkOgm6Jro5IkG+UuqKB5HEEjleHIFKcwT44/+T6qhM+CSl?=
 =?us-ascii?Q?0htoILIrDW/oXwE2bGb+x7vMX/vrYw/mexSdL8CGPP0gr006pQE+eYjJR0Tm?=
 =?us-ascii?Q?5BHGYV+utdqYvXrBEIV/ulgAVP8cQWNsPQ6tzvKxWdLFqXUujQ4hu5aVtcI4?=
 =?us-ascii?Q?cyktBiDqNOJ4jvWdJpwBJgGnOF/rZU/LddA309fRABTyqC53McIdE9TR2W+4?=
 =?us-ascii?Q?ZoC7StfrF2F47CAPhvYe5dKrPxaIpSTRQEMxlFF22Ln3VOaLC75PFG5t01lP?=
 =?us-ascii?Q?cb+MMnYRx8a4cGHl83CpzvGl8TOZ4KrJVPSj2YDzjGxEwk6yq8kswSuUtAJ/?=
 =?us-ascii?Q?PAk94wjH47TrreCmF/GymAITm3zCo0D2AigRD4sM6h+WBwGHa4o4ixLSzWhE?=
 =?us-ascii?Q?EdIcw7qXN4rl70ZyWZjrAa8eV36tBKoNW9Qwx09dmaK7eMhGgZWgurSxdO/A?=
 =?us-ascii?Q?C4J4tiWdTnhErPEOBod3UzZG3goD3DrzW0OTfORwaovQPMYCxWmY6pgfCcGI?=
 =?us-ascii?Q?QeGr+B3gjfCTCZ9b0iTDg5TINx74+Utk7m8c640L4geMRHtz10o160nUo+pp?=
 =?us-ascii?Q?kr8yErAVp70=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(36860700010)(376011)(82310400023)(1800799021)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 06:24:28.4659 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebae79f-436d-47ce-5e16-08dc8f5f4ebf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6394
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byz6krfDxCe/S+WZypwKbvRIEpCJ89wumndr+2DP2i4=;
 b=r+mSqpmphiVIj9x19HKTKS90XfggkqdF5Re+ofXyVZehso7JNr4QNNKdgZejOaL4nj+U6vTM4KhpTmB3FWinwVa22+oDBcOu15KnhgftjAritTm+WJJnxAU15u6pyGzUbDJBFRdmVBjWiBB4FVWRxrX1AmypQZZpbMySBNpiIXk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=r+mSqpmp
Subject: [Buildroot] [PATCH v2 2/4] boot/xilinx-prebuilt: wire up
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
V1->V2:
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
