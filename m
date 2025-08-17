Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186A8CA0EE4
	for <buildroot@archiver.kernel.org>; Sun, 17 Aug 2025 17:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C084D83E6E;
	Sun, 17 Aug 2025 17:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dNH8HixDsuj6; Sun, 17 Aug 2025 17:39:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 093D783BFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 093D783BFC;
	Sun, 17 Aug 2025 17:39:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CD30196
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 17:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79647410D5
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 17:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6uO1eSE24upA for <buildroot@buildroot.org>;
 Sun, 17 Aug 2025 17:39:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::609;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C1EED40FA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1EED40FA4
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::609])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1EED40FA4
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 17:39:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjUDoIweZ8ZpnG/L1q6QxZ9AW3xWgntZv9ukv4REZTTvyFCWL//BA6OSb/QmzfteKP919bHmTNuqwpIGDDhPVCkhoMNeaKOSEJvdq6h3LJaUt5zngPCy7PCrPa7xogasPkUHSMamEly/Cz3tS4+HRTnwotRlNquqWpv4YCmOElY/n8H5mAtzdnDG+5h0IB+IEWx+tb7SO9DKVXz+QvYMB9/4jTaUCLzLdNTCl0r41oVe4q4UUa68SwOAgvQPNEajyUz4geGCIU0c635QxduJwl9oLqS7T0Iyyi7msK1tQJs7QswdpthjFickyQBYV8T0xISCze4Rn9LJnNxcGWdJWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeVjQvzP5Zn5nhAARLWikan9B/LvgiREzP7SuOBBTJg=;
 b=JOktH80vb0W/nLHnMCYhNpO79Kw4D1q5SX/HADbIxJz0a+La1KUeD6clYpIJcAWl5kD9FCtYjENY2MFT1uwIfTyacOyhCRTGwI3FsS0/JIRLNg83PDxkqyaeXftBxDNWnpw4JUPl56c75cH88ekmaBEbAiFaQS0h9OUg5eQRkD0A0UayhVOj6Nxn46sKwjNXina4kn2ZqgDMZ1PTzOs5w4bAyC8TEadpa1LjLCv37APC2f6KewYkk3IQTriz7kfNIfXW31izhxiKep4UJ4uh7lLQGWPN1lvTQx4JRhhOxBXLlczt/5IAhILKrlanStycp/VvUAXTFrjXCXDV9sQvcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR05CA0058.namprd05.prod.outlook.com (2603:10b6:610:38::35)
 by CYYPR12MB8853.namprd12.prod.outlook.com (2603:10b6:930:cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Sun, 17 Aug
 2025 17:39:51 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::e5) by CH2PR05CA0058.outlook.office365.com
 (2603:10b6:610:38::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.11 via Frontend Transport; Sun,
 17 Aug 2025 17:39:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Sun, 17 Aug 2025 17:39:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 17 Aug
 2025 12:39:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Sun, 17 Aug
 2025 10:39:49 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 17 Aug 2025 12:39:47 -0500
To: <buildroot@buildroot.org>
Date: Sun, 17 Aug 2025 18:39:44 +0100
Message-ID: <20250817173944.2438874-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|CYYPR12MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: baae8647-c839-46e3-b2bc-08ddddb5110f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3Doj3DVgJSNhMOMOhkx5PjP571xUJcU92m7chGbcQC/RHv68NUF7CzE5G/1l?=
 =?us-ascii?Q?cU2aRmBFfbu4CQYB6SCOzF6FOGQ+PbbCfE+o5QfdUbva+DLc6xywRGm23Trn?=
 =?us-ascii?Q?PepQ0FSrtxBjyn4Nyn6qmu5AX9TFkJGskbYqELjuk+0AnOWs3lcNGU9Hx4wk?=
 =?us-ascii?Q?QbsP9DTP9zvzI5jw+9SdbOdafCM1/UrUKoKWl242q3+uVzYaAc0/11sdUdYR?=
 =?us-ascii?Q?b9xBCdbMpmKPp6V78rWkT0SpQBKBlT3KrzBwYmiUtFN8a+LeGGXt59EGmB/U?=
 =?us-ascii?Q?h7PwDfPuMYE7OEE+Q5jENB+Q+MU1efB4Nqlmf2TpIMf2rlB945MZxmLyQoGA?=
 =?us-ascii?Q?HEFEOD7j57va1Jg0c8hC02CoJm7yg23kpGE0D8tb05+xZEbCakwliivO1IAC?=
 =?us-ascii?Q?CJJdL5fY/sm7+JF1XXhtViA6QQpA/CBV33zhHAF/EYMTbl0ES+MAbVn3/bUG?=
 =?us-ascii?Q?RvxeahShYZ0++Jpszu9kp8EU0tJ6BH4p1VDPL5UBJct9U92BkNXarzqtF6Ox?=
 =?us-ascii?Q?uacmQTd1gvUAzYyROcgvgcD+dI3JXbMhKFf3kyvDjW0kMRahozKpHWxvvMWx?=
 =?us-ascii?Q?4tKNJwCeyh5nl9tvw7tDfCqODqPt+joA57eMyy8bjnwhyEoGzhWmVYNR7N1N?=
 =?us-ascii?Q?onsQpKPgkIGXOK9Ycbl5la1PNJiUta94DWLF1iwOqrxn27FJsTNHTC5TFvrU?=
 =?us-ascii?Q?kXaYhmUKj5Y5T8KF9FHHbE4YJ5qjwmYT7FP/J1rpF+CM7nq4q5Ei0R/jzKtB?=
 =?us-ascii?Q?dp0N1BxWR3qTXCa9XiWQsB5Fe4Iy+oBXgl9XlqV4HPG6LOHLtksNXiZhWmdV?=
 =?us-ascii?Q?CGb6RfsREPutvwjhQVO9UeZOrFIA/S/t68F9QM/HmWi/wAyTnr9+XsSPbn47?=
 =?us-ascii?Q?G6lA3ECD7bn4JzKMaTGerUw4fWUNw/f38eWTslC291jRK/cTjdzqFrsRNdwu?=
 =?us-ascii?Q?TQwXn0BrigabyJZd1xMU+4OWhLrGPFWyGlrID14qRkTA3f4VdSTPGLyq6bl+?=
 =?us-ascii?Q?FWG4aaN/Yt9oUZJfXir8CtAGmi/U1P7smyPGGEbaWrb+TY7CBDVKm1KXA1BT?=
 =?us-ascii?Q?TmqRBGmNv1yYFwsQmbMaxOv1oIhu0mDlUNZ0A2Pu0QBObKfD5Wq4f/ef1M0T?=
 =?us-ascii?Q?q4HSyANdNs/2GdL5tJZTP5+jwjFyZqQsLZuOUS2RO2hBe3K0u4facR7V3Yj6?=
 =?us-ascii?Q?YsVJrbu9a9fDC4XNpEy5cU9DX8Z3Q1YjM30E1T8skOyseB/p/CxjW8VOS/TK?=
 =?us-ascii?Q?qSLVRXN5FeL6PyhNUu7xIV7f/lS+4NkOy2UrmKh+pPnxx9W/BXRbhwhRet1W?=
 =?us-ascii?Q?UFOiB1Io9LQlUdnjtLL48XtP7U9YoUFrJGblXHAqtveduyby3xoxNSG9vzZr?=
 =?us-ascii?Q?/dpiySHC7owrfBhZdnhvkPpn6ogJBjlYYKJ9vsm357nCGoI+vL/KNCbSyocD?=
 =?us-ascii?Q?9XreVkO57yFcQrC1v3Z527l0hfk7jKzrEWsPGW14xzWkJyt5pLFROF9fwqVi?=
 =?us-ascii?Q?GmazLfjGPeALUBiAUJ0PqqyZdx0bhY8lLjT9xSvrGVIznRdc5+dbsPkv0Q0b?=
 =?us-ascii?Q?88yaXri6B/sbOytH/Sk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2025 17:39:50.0974 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baae8647-c839-46e3-b2bc-08ddddb5110f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8853
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OeVjQvzP5Zn5nhAARLWikan9B/LvgiREzP7SuOBBTJg=;
 b=iIbIJL4s8RxMRWPe66krfbLDz+GURxvsg9lMWPjg8+XglLGXQys622vw/0GxN/RywXX4gc43HG0RJ9gW4ET2GdOYwjX7YVXtqfLWP4EsWt99VZ7BjlRgVbYymzI601E5ZhVYL6hPL7uwH7uEXm3biG6Qxs5BTQVuJ1SCunSHFVg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=iIbIJL4s
Subject: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt: add support for
 plmfw.elf filename
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

AMD / Xilinx has made the decision to change the name of plm.elf to plmfw.elf
in the prebuilt binaries repo starting with the next update.  Both Ubuntu and
Yocto build flows are adopting this new filename.

This patch updates the xilinx-prebuilt package to support either the old
plm.elf filename or the new plmfw.elf filename.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 62b60b88fa..5d984c4f82 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -28,7 +28,8 @@ XILINX_PREBUILT_BOARD_DIR = $(@D)/$(XILINX_PREBUILT_BOARD)-$(XILINX_PREBUILT_FAM
 
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
-XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
+# Supports either plm.elf or plmfw.elf filenames
+XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm*.elf
 # Unlike the psmfw.elf file for Xilinx development boards,
 # AMD Vivado Design Suite currently generates a file named psm_fw.elf.
 # Future versions of AMD Vivado will generate a file named psmfw.elf,
@@ -60,7 +61,8 @@ define XILINX_PREBUILT_INSTALL_VERSAL_XSA_PLD_PDI
 endef
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
-XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
+# Supports either plm.elf or plmfw.elf filenames
+XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm*.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
 # We need the *.pdi glob, because the file has different names for the
 # different boards, and it has to be named boot.pdi when installed.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
