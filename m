Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CC6CDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 15:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4DF982468;
	Wed, 18 Oct 2023 15:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4DF982468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CVQ9EJ0BqgPR; Wed, 18 Oct 2023 15:11:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D82BC829B6;
	Wed, 18 Oct 2023 15:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D82BC829B6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B387A1BF98D
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99CC940878
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99CC940878
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5dKdrbOVhMlr for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 15:10:12 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::606])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4D00404DB
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 15:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4D00404DB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAFjuELgyWgMuwc+muGIcRETVaC1QTRSACBgfjWZA2M0Hp5kIBMOkTvl9U5dhkDgzU/PQ59vo39Gt873WoSUBM++er4uY0e8Cgi/hKU3rlXYa5HSbheh4CTS+Aj75ZKc8DwtEsNVb0f14LkAzXG8MWjHuRL+K/V8I/FtsEyfeLe+UDD5LIeBBSwpfLGkcqOe8zZBmpIqtXoUPjuhCfKK4vONqwUU6fySYvfaBT6xFmhNK6l8cNGQKozwdUGxyGuBhozYtuf21pYm+G2vEtRcaWibTRLnCgumU1osHhb7mTLFNG7TvjkrKJ64vUttD4iwzgw7nT8seuJ6VdpiiyvNkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhIfWjGktf3Fwja0xkEMcKfud4a751mbLaZQHS+5/KA=;
 b=Rdb9+u1R5Kc2KVZX+0A/PvsEjTbjSj16ewgtv38MK3ZfRFhEFQrcAvQsBUk9QFY4EyN82StLg5t3Shy2kxnB+IMFVMUhCDqnynS7ph56QUk0kyB1a2TABetgOsWb89ogqKtGsu9Dkps/hQ9iKIOW09QFAJdCckrCdWjw6uQ+C/Qk4AvOyGdPdHvsF0v0EcsbEnEE/RoHJ9hTEw+zvW24cBRCR6h8AKhW2Dwu4kfd+6wepQoZCe4+N0P27Qb5Xu4my53fZ4YcmhvlBqLX6Oiq78uRYb7Q5ZJHGth56lUu8lfq5lvwFBGnu0nfsIpns4la1RFvmSYUTT906ipzU+r8sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MN2PR08CA0013.namprd08.prod.outlook.com (2603:10b6:208:239::18)
 by DS0PR12MB9345.namprd12.prod.outlook.com (2603:10b6:8:1a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Wed, 18 Oct
 2023 15:10:08 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::27) by MN2PR08CA0013.outlook.office365.com
 (2603:10b6:208:239::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.37 via Frontend
 Transport; Wed, 18 Oct 2023 15:10:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Wed, 18 Oct 2023 15:10:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 10:10:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 10:10:06 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 18 Oct 2023 10:10:05 -0500
To: <buildroot@buildroot.org>
Date: Wed, 18 Oct 2023 16:09:29 +0100
Message-ID: <20231018150932.3961564-7-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018150932.3961564-1-neal.frager@amd.com>
References: <20231018150932.3961564-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|DS0PR12MB9345:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc832d4-d547-4847-6fad-08dbcfec5125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PEgu5MnwjfVCSIuo7s+h9ZcomOShhFZiYDjy3+FlpgDwcNypW981RFjgd+Jawb+g3/ayXN0ZZP7Xm5Mjy73IvWaX4GIqYjUubYZSB9c3paSORKny1AmMAKAcFUGEhdopKyWGhi8kLXLCZMdLQYV3lrrsSChlrfV0cOmO5CkPLD/gV80CcpNYPGM18i8X7tYqRhwocDdiPKfkwJUzYmVJP0l3p3KLYNZ63KnjizPI7MJ0FzsO0xU0p5KKsOLHqAafJWP5nDn2V2QIqAGgzImZgs1smBV2I1OGjrs5Teo+w2L9gedvhUUrFOZdZeELNEq36rs6K48Z6qvIajkpLnCdgFF2Yvhu1Oycs37bYKFNzSIV4XzkKNp5O+apOATAvpRqs9I0xALiubfqbickOSf1WNyTps9L/mwhiBNOtlBGiM9SHqZ0DXbQ5peUb5MGv7gwE6CBPKEGBLo84NttdOX92P5DEvFrPEYXyGTzceswiPpFRVT6azAihX87QImDT2A3E8xp0jZ2X3cwQo5TH7fI03aR4sT33rRpBL2ibedKLGVszC3v5aJ/bc99vdjEBbJti8PckMq7IEe/9/XQEuXG7VoZZFoZOzugrBvefj/KW195+PJ/etuLEWxWpdxKvD1gBiQOtHSTuak2dt7o6IxXd/PQXeYSd5AiwOu/CHqyjO8dQ2Q9fxWUD0Jl5/+PxHlftt1aRBiQEcWf4Fa1ShZAbC96tLT1jvg0vPouCAaYdemsNAbKnyG4LJpsRRmevioWGptu43FiZIcTzrba54SpgcLltEsmKeJ5bQxRX7AnuDY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(39860400002)(376002)(396003)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(426003)(336012)(82740400003)(26005)(356005)(47076005)(36860700001)(83380400001)(41300700001)(5660300002)(54906003)(70206006)(8936002)(8676002)(4326008)(70586007)(1076003)(316002)(2906002)(86362001)(6916009)(44832011)(478600001)(6666004)(40460700003)(40480700001)(81166007)(2616005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:10:08.3227 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc832d4-d547-4847-6fad-08dbcfec5125
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9345
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhIfWjGktf3Fwja0xkEMcKfud4a751mbLaZQHS+5/KA=;
 b=bpp4nJzNTEiEjczr0WoIrmP4QEs0zpIv01o09r7OK+Nq6psZvoWK0MnCmeudcljuu6Y8AoH0BbsqhHJqf3Qg/JajuLTg4/G6Y0im7Ll+wbc1mn45iOww1rm+++m1Qp6OxzVyDcd07+/mN/RYLYkG9EpOOvccjzl/snvup+Il/LU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bpp4nJzN
Subject: [Buildroot] [PATCH v5 07/10] configs/zynqmp*: build pmufw source
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
V4->V5:
 - no changes
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
