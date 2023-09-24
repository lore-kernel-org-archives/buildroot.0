Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6241ECE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 15:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16FE04044F;
	Sun, 24 Sep 2023 15:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16FE04044F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uNfiud0UVCn6; Sun, 24 Sep 2023 15:14:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A80041557;
	Sun, 24 Sep 2023 15:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A80041557
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AE331BF3E8
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 131A781E2C
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 131A781E2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QmXwXSXl0FjR for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 15:13:18 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::602])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE4B681E26
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 15:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE4B681E26
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOOOhvA+/J4WfjVns1vvicr59YTxPjJAdnWvVzLXSDPIMI9DDgVqjvTbY35XjshBkNy0rXLxcMfqrzQFS4jaDD6GSB6NP8CM+kkDRNCiugrbIqsSnis/XltYgAfF8JF6OGQGmAAc8ZToMy1rNFO0vEyBAt24HYEss1FxBaOuI11nZKABM6ESaTBtkioxlkX6c4BVeSFuEgtV0P1SHAxVCIB6LnN3c9q2z7VAOMsKCmVjib54s1lx+jM9g+5K6P0LOlqoq4JrJmXuOMq/CGZ/6DZzVNjryfF9jKmsFNpFJvDU8A6+VAFNXOmQEGqNLvNxgK+405FMXQpWh2G5IepSTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIarwpn55/jtx9PTh2/IYC/OPQefqPL0q98wg56bryM=;
 b=fdekDFAMEDm4M7T6qCtt9QGq46mNssduNcsoK3YB9IKeRWTVal3LH3DSKhcI4wOTMFmG6cMyEqoAsw35bwSkVezNrD54VPOepXfNmrykAPY04WXO+xDXCxpGHJSmi3EHnl7m8FT1W783tKkWkBXqW/PnqgMLZS6MPHJwifqlj5w8A40WcDbj98om4UWs7s7aMtJBeE2uNJkwnxJcjBpBEG4R58gjQPRz6GC/3WPzFKoHEUQE4RORd1lCYYVZx0jlP3ZjiP6tnvKX2lf2N52CjhNZ/GpONqGZ+L/d55lIQm4UiVHCv2AhOskGGiAzlxvf5UAImyzc3KVgPhgvZoDQXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0296.namprd03.prod.outlook.com (2603:10b6:5:3ad::31)
 by DS7PR12MB5789.namprd12.prod.outlook.com (2603:10b6:8:74::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Sun, 24 Sep
 2023 15:13:15 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:5:3ad:cafe::fd) by DS7PR03CA0296.outlook.office365.com
 (2603:10b6:5:3ad::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Sun, 24 Sep 2023 15:13:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sun, 24 Sep 2023 15:13:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 24 Sep
 2023 10:13:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 24 Sep
 2023 10:13:12 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Sun, 24 Sep 2023 10:13:11 -0500
To: <buildroot@buildroot.org>
Date: Sun, 24 Sep 2023 16:12:02 +0100
Message-ID: <20230924151205.2099293-7-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230924151205.2099293-1-neal.frager@amd.com>
References: <20230924151205.2099293-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|DS7PR12MB5789:EE_
X-MS-Office365-Filtering-Correlation-Id: 42fb6e04-f549-422e-0a21-08dbbd10c5ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R6ZMI9GombqHWkgjfh11nAhtLftSX7nbOxDwUvSEUROQljqbSYhuVdl1X/GRgBCLAv/8hTJioseOsawplRYvDETbSpi05y+cV6SWh4dd0DuMil/y1S+1EEh7igmf7eZnStxkz9FWXWlunoHHTppPQvM8q5TTGsVoj/PxGlBJGdY+eQV7aHhV3xgWBR5N+KWR4mhs4X5NuZbEkUkAiLz6IH63WAYTbKvdbOmmFM/5KZvu22cosM3RxhjJ87qKNmk8CKAGyI/QMSVrrw7HciCDoDe3GcPIFNPAxF5qe8BFpkRWAun+pdb8ZmyPe00STHdzXdcomc5akOuDMUZ8ZBia0/Xu9YMcKq9YXf9rJTqi6dLnpT28udXk6xXNR1N3Z5+RL1putdWge/1MyZgBM2UxrEiWqnfpxad9OCZ7TBvczdu9W83hy26+R5QX/YFRYWTsTQFnLz/x2pGxywvZ/s4hRrWbmliLlRhLkM1VbhyIaYYpK+pUZT2qnENItfKrXAcSKwi+rMkLmoBs3Mn4ccIOebkezxDwZkfoUgnqqiiE5MYh3Rw79JAsiJXIBeynGFmq4Ysfq4BErwShvbkX/D9ZbMbSVGfxqFnLNxidmQsM0PSrvyAuNG4A1XHHqMOM0vDkwS36DeNbW0t9rgSopQjg3AaiTt7I7RnJhZQ4E1Vp+3t/c9sPSNLw4WPzuKorGVz9DPaZEYSvKkqgUkL8tW84jkrcoUa+B4xE+6FumCy+7QU+46mrCW6QKrEzvigKcTm4ggvKDxl9D5MIh0PH11W6u3XM5eGadjsGrflsEVQfNEE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(396003)(346002)(39860400002)(230922051799003)(82310400011)(1800799009)(451199024)(186009)(46966006)(36840700001)(40470700004)(6916009)(81166007)(316002)(70206006)(54906003)(70586007)(83380400001)(6666004)(36756003)(26005)(336012)(356005)(2616005)(426003)(1076003)(47076005)(40460700003)(40480700001)(8936002)(478600001)(44832011)(4326008)(82740400003)(5660300002)(8676002)(86362001)(2906002)(41300700001)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2023 15:13:13.7860 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fb6e04-f549-422e-0a21-08dbbd10c5ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5789
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIarwpn55/jtx9PTh2/IYC/OPQefqPL0q98wg56bryM=;
 b=AL0a4FNvE/0IUwwpcekybrUu8DmwK4rjsT5pGKgU/q/bnkqQr4HVYEdlDB9NAu97587MiQDeUVg1K3WOIhQDBtqkDaqLcNXawvuOFPpVyoNu34kg3/o8phHlfGYf++Qn9Djg/YtTJNt4xe8vhd0AdMmm34iAVioxBOAPpOvUz/0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=AL0a4FNv
Subject: [Buildroot] [PATCH v4 07/10] configs/zynqmp*: build pmufw source
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
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch migrates the zynqmp config files to use the new
zynqmp-firmware package for building the zynqmp pmufw from source.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kv260_defconfig | 4 +++-
 configs/zynqmp_zcu102_defconfig     | 3 ++-
 configs/zynqmp_zcu106_defconfig     | 3 ++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 78b62a9ff8..5e0c820ba7 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -32,7 +32,9 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/kv260-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2023.1"
+BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS="-DBOARD_SHUTDOWN_PIN=2 -DBOARD_SHUTDOWN_PIN_STATE=0 -DENABLE_EM -DENABLE_MOD_OVERTEMP -DENABLE_DYNAMIC_MIO_CONFIG -DENABLE_IOCTL -DCONNECT_PMU_GPO_2_VAL=0"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 18230cf89b..6674fc6dfb 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -30,7 +30,8 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/zcu102-zynqmp/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2023.1"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 21f41a2d8f..201d3daeda 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -30,7 +30,8 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/zcu106-zynqmp/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2023.1"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
