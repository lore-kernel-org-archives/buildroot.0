Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35ED9C4708E
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 12:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0F0F40A01;
	Wed,  7 Dec 2022 12:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0F0F40A01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ncHBoB8Atrb2; Wed,  7 Dec 2022 12:22:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4EF5405F2;
	Wed,  7 Dec 2022 12:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4EF5405F2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD0CA1BF4DB
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 12:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BD4B41755
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 12:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BD4B41755
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wVVRSvkFB9xJ for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 12:22:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE644409AE
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE644409AE
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 12:22:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPorhtAmYR1765umuk6J4dGtXLyqt/4fXwKVtZZfcsWC+1trkgXuV9xtrBkT4FYH8+otLSb82G8Ci3ZGp0I/DUEzEMa7/kLpHX88NP+QNvTiYpk8waNvZKPb+HCJsOL3v/jePJkwVLR52dwAoHTU7khKw+QjSWPJuzfiiz91yWL+RBtLYrfTeKisdt07NLmaIJvggQqPKGlaVY7bdP0cbW4tvV4GD4KaGsSxPYVg57svtkFOd4TNZWiVdhoudbvHDnxH1D4kYYDh6QVRNDfE0L9HQDkzJYStw7nexj3eZeeajwaUN78nb2CfX2vadJOOfeQ4XWvhKbUdc7LaeKIYyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncKAA686mN5M+xYkBm3Bd61rcJ3LwbTsUSfN+P6FmKU=;
 b=kCapZNLMEH0YGIPApRi4B1koZVOF3kfMJvGAzc7KokCiANcIUPBkQ0eRbz5vDxmI17HiuXA6ZErNNfbf+/XmP78Losubhvnr0CQuffB1E0F9ymCh2foUpVUGabDg5CpWqSND5E8D9dPq9fqx2DcGAtFWbgaPJobWrCkCnOYx0JUMM45evFsLhTSVCHPjeEDR1F7Wgkdkp512KPIw5mgtXqD7epwXAM4lPs3LwfCjzp7rAng71W2HgfTMAAJfZGjvDSAMdK3cswBJoRP+KgSKu04vCR85Lcl2PVj9fxC2oW/QCNFozdrMj329UyHmc8Jr9g8f1oIbV+JEJPJYMYaYbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR03CA0343.namprd03.prod.outlook.com (2603:10b6:303:dc::18)
 by SA1PR12MB5670.namprd12.prod.outlook.com (2603:10b6:806:239::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Wed, 7 Dec
 2022 12:22:18 +0000
Received: from CO1NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::dc) by MW4PR03CA0343.outlook.office365.com
 (2603:10b6:303:dc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 12:22:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT114.mail.protection.outlook.com (10.13.174.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.16 via Frontend Transport; Wed, 7 Dec 2022 12:22:17 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 06:22:15 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 06:21:37 -0600
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 06:21:36 -0600
To: <buildroot@buildroot.org>
Date: Wed, 7 Dec 2022 05:21:32 -0700
Message-ID: <20221207122133.14860-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT114:EE_|SA1PR12MB5670:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ed8c4bb-48ad-4424-37dd-08dad84daea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FcxPsvrMEtP5M4XYwKWwTVfwW7TToThY63EnDz9ffZ+A61762fw662JAQrpdFkt581Sn8S6BzTsFshcmVytvwHxZl0Dk5S1DPSgivSAbBWq6c1C4k1kiZnRkuS1ht45HZPfAKGmcLVnXnUsM7s06fpgMF99Eof1FzzZA51UKHK156gUhJZgH4G+kTMya/Kr5fGBgKjJdUm6sA/wFO7vVqRaz04NVJwCE74ZooCvseIOvf5zPQxmUATyVmPFpNGH9KARHKnzUK842q5/CJobGr3t7RkYqSjIIWQE/h9oJKeUIa08AlDYcSiHHzqfxc1GUIBW7UrF5GL6M2jDQZOXXE6GGIIQ0bSv3q3mLgBRC4U3iJt8C55itvGBlHFCiFQXvwBbpB3QP5GuojH1oxEaPOHPXjFTKOGq0xBwSiiN8xXlu0zj0OE3HD3uqLN6sTkUZznjZfQOEo3VHlnUyeGKFAE3uqdXLTzDL/gyvo+3rN8a7fVwzSTfAJYJWCzsIT35r9VdXSXoHZkxxMGqkN68bJRF7ozilMZnxUny9i5tx0Fi9xpJSvBCQsEsmR9LzmjzRWpUoL5wxWzWW9lyisV5YOfHVulI0PAHrXgTu4F2BzdUR67NMRt28Vn1yl+EOjkZCExcoKo+0yIT6MgQRlw9ec5z9XfgwXoePKVpuzqDcHC3J7eYoEEx5XR6Us3Fv+zt1xIi5Az9REI7GZgM05ExOzHpxjP3rDAxNI+QsDE3ZAJk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199015)(36840700001)(40470700004)(46966006)(19627235002)(36860700001)(2906002)(316002)(26005)(36756003)(6916009)(54906003)(40480700001)(1076003)(6666004)(336012)(86362001)(426003)(186003)(47076005)(2616005)(478600001)(83380400001)(70206006)(70586007)(40460700003)(8676002)(4326008)(356005)(82310400005)(41300700001)(5660300002)(8936002)(44832011)(81166007)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 12:22:17.8888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed8c4bb-48ad-4424-37dd-08dad84daea2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5670
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncKAA686mN5M+xYkBm3Bd61rcJ3LwbTsUSfN+P6FmKU=;
 b=jwdEkWJIlc/HKT/Jc2JhglNU+LvTCFaAeMLhhUhxq+3rqbEsLGXavfWvdSIeuZjbDfhGeEtSNWzmauN2EiC2/wKpcWdQlIh7Ms70zsDvNItKeYwowLTkrww7DilJqIveh8/Bp/zd3fzjCFreJwzf3j4ftMqlJhL23ZaMRWmmh+w=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=jwdEkWJI
Subject: [Buildroot] [PATCH v1 1/2] board/zynqmp/zcu106/patches: remove patch
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 0001-arm64-zynqmp-zynqmp-zcu106-revA-Fix-DP-PLL-configura.patch
is already committed in the Xilinx 2022.2 u-boot release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...qmp-zcu102-revA-Fix-DP-PLL-configura.patch | 40 -------------------
 configs/zynqmp_zcu106_defconfig               |  1 -
 2 files changed, 41 deletions(-)
 delete mode 100644 board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch

diff --git a/board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch b/board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch
deleted file mode 100644
index 4281880da0..0000000000
--- a/board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From aaaa10b613165b7790fe1c084de007240b5bd77a Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Thu, 5 May 2022 13:34:43 +0100
-Subject: [PATCH 1/1] arm64: zynqmp: zynqmp-zcu102-revA: Fix DP PLL
- configuration
-
-This patch fixes the DP audio and video PLL configurations
-for the zynqmp-zcu106-revA evaluation board
-
-The Linux DP driver expects the DP to be using the following PLL config:
-  - DP video PLL should use the VPLL (0x0)
-  - DP audio PLL should use the RPLL (0x3)
-
-Register 0xFD1A0070 configures the DP video PLL.
-Register 0xFD1A0074 configures the DP audio PLL.
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
-Signed-off-by: Michal Simek <michal.simek@amd.com>
----
- board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c b/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
-index 15f0be1a43..cbc436289f 100644
---- a/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
-+++ b/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
-@@ -81,8 +81,8 @@ static unsigned long psu_clock_init_data(void)
- 	psu_mask_write(0xFF5E0104, 0x00000007U, 0x00000000U);
- 	psu_mask_write(0xFF5E0128, 0x01003F07U, 0x01000F00U);
- 	psu_mask_write(0xFD1A00A0, 0x01003F07U, 0x01000200U);
--	psu_mask_write(0xFD1A0070, 0x013F3F07U, 0x01010203U);
--	psu_mask_write(0xFD1A0074, 0x013F3F07U, 0x01013C00U);
-+	psu_mask_write(0xFD1A0070, 0x013F3F07U, 0x01010500U);
-+	psu_mask_write(0xFD1A0074, 0x013F3F07U, 0x01013C03U);
- 	psu_mask_write(0xFD1A007C, 0x013F3F07U, 0x01011303U);
- 	psu_mask_write(0xFD1A0060, 0x03003F07U, 0x03000100U);
- 	psu_mask_write(0xFD1A0068, 0x01003F07U, 0x01000200U);
--- 
-2.17.1
-
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index dcbc4319e8..699e528f32 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -36,4 +36,3 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/zcu106/patches"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
