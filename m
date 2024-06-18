Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D20C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 05:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CCA060B38;
	Tue, 18 Jun 2024 05:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Btkgd-59btr4; Tue, 18 Jun 2024 05:57:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1907B608DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1907B608DD;
	Tue, 18 Jun 2024 05:57:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F105B1BF285
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 05:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEB9F608DD
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 05:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLdhxvXVU6V0 for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 05:57:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:7e88::614;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BBCE16088B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBCE16088B
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::614])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBCE16088B
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 05:57:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqfEa6nfxQ02kFWiI6HbyPNO9kl6XmrH06CqlVXlXQM/WWTNZ2tP7YGyOz+aKnX38WcbnzR9Z1IdlklpAVLQFrkPF4WwAIztYKOEthv0dE02ncrNvuiLDzUHsXTfbBpN9JaZBXqYHrihzw+8v20kJqvhjND3DeOY+O7hHxVTKkjcTLiyAeJIyBQCRCRDQOiO9G7TX9OvNzzeR9vjextbueZZU3lhzuX1hziEnJKMprXHCvsw1pghuB29n9qU/y+m6oMBgHfGBURSBGlrBkjLMhHmO87MfAFuJEyK49ldGVqXeLZ546OKqWg+1xUwbyl2DH1wB7M808oKimGC+nhUzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kMcYuUjALCY4oNaX8JUx8EpIL5CK2GcAV6yF3LNevY=;
 b=ColxX07lEhbpAlgrf9xBeAHnoY4hJB9ABhHZBxw/xmWI2mNtCn/GN6abJTtoQ+SVJOhIno+zuTn7po5oAqmOPiJbvpjoTeCzB2F9lA9rOhvPTf2Pd+2UjZLSK94diaBE09SfR90+cBDxwoPkN5rWlqJrJXc8me8OotAXbp1epy0BIjuudZ/ElMohDUMVtQC+LJai3t9dWzzVoWB88rms/YUWEDgr7C19+52tOkJ8x8gCLLzE3hYA2wDtvv7U0jmPIa4EzLT3f2yqoETkaHFZHCDTQh9ygCxWpCqJgZN/1RsWf3cqFvGuig30QUw/OuyMKbVhwifrn2A1iVf0LMzySw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0347.namprd04.prod.outlook.com (2603:10b6:303:8a::22)
 by IA1PR12MB6164.namprd12.prod.outlook.com (2603:10b6:208:3e8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 05:57:48 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:303:8a:cafe::29) by MW4PR04CA0347.outlook.office365.com
 (2603:10b6:303:8a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31 via Frontend
 Transport; Tue, 18 Jun 2024 05:57:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Tue, 18 Jun 2024 05:57:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Jun
 2024 00:57:45 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Jun 2024 00:57:44 -0500
To: <buildroot@buildroot.org>
Date: Tue, 18 Jun 2024 06:57:37 +0100
Message-ID: <20240618055739.2777769-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618055739.2777769-1-neal.frager@amd.com>
References: <20240618055739.2777769-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|IA1PR12MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: c31ba6eb-ed41-4ca9-93c5-08dc8f5b9474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|36860700010|376011|82310400023|1800799021|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jerHUQ5QEiD1RvBnr2RH3Qi4Vv3S5f+c6wRCK6HT2hk89Ry2vVfAhrO9frb/?=
 =?us-ascii?Q?ia6MczVEyILPKG/TDwTfzOuOb+d9+Vax77QPA8YAy9/IdidxlVkD3yzu1NT/?=
 =?us-ascii?Q?RlaMow9s4Z+7lCwt17IDr79UZyzS9haoEIgfGrCviqYEEuYamE86HEZq46LB?=
 =?us-ascii?Q?qrYtyCAs2zxcLwBffeX+t0EYveaYMDrgWu/FsWNcIpe4djg9bP3uclIHjOf8?=
 =?us-ascii?Q?5XC7WUuWj0df5LVXZbXW2aMFkx7J4idKydhzJ4gXUgoQeTl/+nbXvMkYkwNs?=
 =?us-ascii?Q?pZItxm/gjVk1DMfWgzUZXQVj73QCUIcQd5zKJLN/dREINSVIxUdeyJP0fuug?=
 =?us-ascii?Q?1mwGdpq0dNzxEhk8ZdXJS9i36SQNW0Yy1TCZkhxE+4DV3HAVDjGneNTckmHx?=
 =?us-ascii?Q?xJPF2SdssXEBOSeHKjxa+5rIcIX4FR77YcYUulnCJgaChGL6EeNTRRNZ1KB6?=
 =?us-ascii?Q?g1DBlknWG1SzhmQMC2dUArUeUXMfKBa4gWPiaIKnV33yn8s1KiF8vbC2o2vE?=
 =?us-ascii?Q?ARWhwhqKTYsiyhDDjL7x9oaGxA2qjMKxtNyeB/MSylnWm4TIwOS5d8PVRfq5?=
 =?us-ascii?Q?mtWcMmuonVmW3A02kjUSMTSBX9aAapCf3N4m0c7N6d2wpf4NGhZcu56SA+Xw?=
 =?us-ascii?Q?3GRtDYVKGT0YfxpZ/bj2z3y7SsmFIuHw4vKQhvVWOsWPtiAppdD0pjkddIn4?=
 =?us-ascii?Q?8jLcKNeaPLBm3u/OLRwjr3aWqpg6+nGMuYDKNU6YZgIag+pcBjlED5mEpZmr?=
 =?us-ascii?Q?ritZaJbtcHi7e2aptgyvm8RNkaH8H0sm/J3O6CYEKvYnEyz210bqLXGsA/wJ?=
 =?us-ascii?Q?evCvHFtVPbQya1engz/kdSJq6bCdq2jDOsE5biQPgmpSEI52pDeVnZRFLxX4?=
 =?us-ascii?Q?eoZaVL7S6v+2AIH5Io9B2U4K4c9hC8wQSRlIZs2Fn6XwnYngAb9Fzu/6Xvtg?=
 =?us-ascii?Q?cS2PtF+HqEe5vJXbVG/JDaO5W/qVIUfkvMTrsaxDFGzRHaUSK+oPP31R1j36?=
 =?us-ascii?Q?5yaxvrGTA1KKT2gJkR6sM9833jvVl6uFItlM6RPWkT7OzevluGr4uCl+1idc?=
 =?us-ascii?Q?XFPUcrR+YRq0h8w6vybDzF97hB/t3/vTa0C3i6tIoPN84Xqci5RYsY91aFfj?=
 =?us-ascii?Q?Hu28cxZITd9CeHQRGmBtNsvGIaA3EYUOpi+jpq3pOBgzmSZtZH2PsfKDUeni?=
 =?us-ascii?Q?a8MJuIKPoNPD6yl0ihYyPRWuvuqAPVv+kDr81SoPMr3kY/9in90uYOw+hN0V?=
 =?us-ascii?Q?jMng/TC+YMPaQu528joPFi+NzYYE03+9tNhth7ZqNAzUyo3Xex+NPCoFR3yV?=
 =?us-ascii?Q?/dnrnqdidOlcanz7z4o3tZQoMOcmO8vgrcRTUp5/gmZiLNMpPeGdPYuH8+6g?=
 =?us-ascii?Q?rWvgUzPnLaG6M+80CYxpK7Yn6eRfAv3fXu6zFlddEMNjWMvjcJmL7X0w+KT4?=
 =?us-ascii?Q?qrLEChaiFthcJwL+rnqnwqDVxqVeT5GG?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(36860700010)(376011)(82310400023)(1800799021)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 05:57:47.3044 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c31ba6eb-ed41-4ca9-93c5-08dc8f5b9474
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6164
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kMcYuUjALCY4oNaX8JUx8EpIL5CK2GcAV6yF3LNevY=;
 b=tET8zbN15V4Q00OMlFha9zhdWVSxsbhldvKLmnZ31t5I51NUmSk0PasqaXQKrk5mh9RivzjUWxlosf9TsMPhL9128FESKQl3PJEgVKxXy03UmzGIBqLa5Yn5ZiZUQQXof2CvMirg8DEIgOmZWdilqAkh3zxYPPB+PKGwWA6mw/s=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=tET8zbN1
Subject: [Buildroot] [PATCH v1 2/4] boot/xilinx-prebuilt: wire up
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
