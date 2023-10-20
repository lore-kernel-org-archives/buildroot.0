Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31236CDB474
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 11:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA76A7050B;
	Fri, 20 Oct 2023 11:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA76A7050B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZuOrp7NKQzJr; Fri, 20 Oct 2023 11:44:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9EC37049C;
	Fri, 20 Oct 2023 11:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9EC37049C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB2151BF3A9
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 11:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADD7041467
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 11:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADD7041467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SePOqc-ggDQ3 for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 11:43:23 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::616])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60EFE402A7
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 11:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60EFE402A7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuhKqDMHvZIyUL7QT9wlak+RVa4tZanOBLVFBAMe5jHl0WXKh6T69+x/C+UGBxjakPWXVodLlnYn5bamk1TP5N7n9k/bR4CnhGJiyolizng+fs1D+UijwLZMPiV/bdemWakRK3MXLHdPvleX8VXF0CEkI4yfpp+sFI6LYVDnaZo0MiptfGgeF0VD1eqBb8jmPAG0iRMw+Iv/nKFNwTWLOs3VCLxDfsPwtyB5IMe292m8SmVKAwvWTqvn+Siza9Kf9soWfPcTPmXTe3vaoUzR2OYlgOGNt6hEC0N1GWo/ZdaW4qpytVJ9VlPm4OFP+xBopTgHMrpvhoOmVlOyhhSrfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ap+rYjGmDNu+VAHtT17J7IaxWQMLAp3WJsm+qm32RlE=;
 b=eHG6uWDqQkNmxPsmQjkGwal+X80AQdHCl5Yv974N0ekCV4OTuaBEnRiqqPpePBP7rTxMw0esqDk8Jawas5tgyHpAssKgNduI+V8c0IJM92JLFrZzgTgwg7CO7Ql07xQAUQo/A8ngT3OuYv1D9HNMolGnh7fEP8Tu5UVtgqSPa14FAAd7UTyhGZSbz6um4rRqIdX4GbiPschmHeZMGLL/1kWkna0yJTISy4fHLiznhDNPkcgQdiAYB61st7hnyMTyOC7sp6qBs/my5Fdi4LPClmylo8G/GU+kBCvwX2ocB21jw52SiZk1qVXMkP9UEOh0nV+jHPRRTBiNLLYQg8eeYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR05CA0096.namprd05.prod.outlook.com (2603:10b6:8:56::28) by
 SA0PR12MB4525.namprd12.prod.outlook.com (2603:10b6:806:92::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.24; Fri, 20 Oct 2023 11:43:19 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:8:56:cafe::7e) by DS7PR05CA0096.outlook.office365.com
 (2603:10b6:8:56::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8 via Frontend
 Transport; Fri, 20 Oct 2023 11:43:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Fri, 20 Oct 2023 11:43:18 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 06:43:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 04:43:18 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 20 Oct 2023 06:43:16 -0500
To: <buildroot@buildroot.org>
Date: Fri, 20 Oct 2023 12:42:35 +0100
Message-ID: <20231020114236.4129636-9-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020114236.4129636-1-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|SA0PR12MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb5b333-220d-44ee-f294-08dbd161c175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UIRSd550aKhEToyFzy+M3tmulv8KFnHojpIuRPksYjfZofNw0xplKPC4pcI9fPpADVaaU2DH6jU0QIQDjKCzyE1weXLAESgXC6Nv/7z8oxnOO5edLCHGXQk27A38+9FngIg7B3dpOcuijC1T4gmZlFEAc5aWMGYL5uvlmHO4IqccpETChpnPxleVXoSpuMRnl50ePM3iOsQTLiiY6VX6r6H71Md7D6Vld0sl0tLhMKLugYGRpk+RKn8Lq7YFiSphU6tCuHR79PZpeQHFbD6GFyiKhaD2m54Sd5Gg8jusOkPkJIq9URIrYzYIJetIDw/duZEeIR9qGAKDr5GftID+rDeu/+PPeh2Lx6CzavsOouK9d7KtAybBNtfDFwP+RAM1Ldm6wsHgmrvP/Zcz9cJFj4+j4ATQYCMvDLlAVWlgNz72f5xXEpFzzBkxb8BBpQKjU8qXwK0Z6qF5z1zfy1HtRoO1GK3bQOFB9flmz4Y85GWvY7ncMVQuium53BSjnpsa3S/vdHzBtyE3dpmHHnCm4BTKdbjqCs3Y3+7OKA3hxRRj7Wd3ssBXLHc20Fni2aRhVCx+wMyRovAkzw0WOK0qsGAeY0tbv3Mdf81ltTOXESpIvz3MOTHTQ5PQ+Mn2q4c0xQNr0ACoPiq6AeYcxhYpq2E2LSwo2mQPJCg7gYCc0ZofoOx3T1PDjqp8SMFWipnLa4D3vEBJjCQ3A+THVcADb9M5pMtpGLUPl6dsv0VxWOOuxLqrRIpWxQORHB+B5vel73H5zdhfVGnP4BZ8ete8fQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(82310400011)(451199024)(186009)(64100799003)(1800799009)(36840700001)(46966006)(40470700004)(86362001)(40480700001)(40460700003)(316002)(6916009)(70206006)(70586007)(54906003)(8936002)(6666004)(478600001)(41300700001)(8676002)(5660300002)(44832011)(4326008)(47076005)(36756003)(2906002)(83380400001)(2616005)(36860700001)(356005)(1076003)(81166007)(336012)(82740400003)(26005)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 11:43:18.9728 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb5b333-220d-44ee-f294-08dbd161c175
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4525
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ap+rYjGmDNu+VAHtT17J7IaxWQMLAp3WJsm+qm32RlE=;
 b=NzOEmo2BWtHzdsFUtjwXmOZCMOE0kn5UFZOoKdgdkaZ80Xx8x8geLowH+3IGgVWt8bdZaZbw76QSvcmxU2HGtxzcAtEUUFN/DZzQfeThiybyV1t32HMWawmi+ww7I9llBK7bjsPdtZd9gjEdMCIopT7JmI0TSOAXnpWilwL2ttM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=NzOEmo2B
Subject: [Buildroot] [PATCH v6 09/10] configs/versal_vck190_defconfig: build
 plm and psmfw source
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

This patch migrates the versal_vck190_defconfig to use the new
versal-firmware package for building the versal plm and psmfw from source.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V4->V5:
 - bootgen is selected automatically now
V5->V6:
 - no changes
---
 configs/versal_vck190_defconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index e30bb35b74..1e2fa6d21f 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -32,11 +32,10 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
-BR2_PACKAGE_VERSAL_FIRMWARE=y
-BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2023.1"
-BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
+BR2_TARGET_VERSAL_FIRMWARE=y
+BR2_TARGET_VERSAL_FIRMWARE_VERSION="xilinx_v2023.1"
+BR2_TARGET_VERSAL_FIRMWARE_PDI="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/vck190-versal/vpl_gen_fixed.pdi"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_GLOBAL_PATCH_DIR="board/versal/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
