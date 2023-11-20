Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2D1C2BB3F
	for <buildroot@archiver.kernel.org>; Mon, 20 Nov 2023 14:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42EAA818C2;
	Mon, 20 Nov 2023 14:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42EAA818C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4p4Tfu4Li9s; Mon, 20 Nov 2023 14:10:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2468481ABA;
	Mon, 20 Nov 2023 14:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2468481ABA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05FE91BF5B3
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 14:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A144B8142B
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 14:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A144B8142B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fTztRIlFW9ot for <buildroot@lists.busybox.net>;
 Mon, 20 Nov 2023 14:09:33 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF9A88145D
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 14:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF9A88145D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAFqmXFQLtC52Psph1sX/+o3m0xmo5qBWa3c+OJjfusy+GVZk3xIcuBm5R2E6QVF4ZD8zKPEk3XvJJ+gQDDHdbo7Ch5Jwe+9Y8Zs/esQ9NAO2/PNdvg3W5miPvuv8qXvn64O+JTJejGBsNpPTZGnPCq4vchvOrnjgJ6kFEiIm6z7Q37JCncLcBTarN+UyoHUptGb7RaeDJ22Ht7khGSKAJRroQSzqRC9pDgR7fnnDnpV0WiV1o+3CFGbS1oZL2v+iE2jANKYG+aPFm3Xf1RKYBWmEUFFmWXamhX3tFSzlg8ZSf5gxwNTM7BOXbPXLH2m9katTPBjqPBGFfW9yEZJVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7JaIpB9CMqbF/GkDD7mjPscib67c5ucGSrSPynX0nY=;
 b=JTbgwPZhOAuyIsLhkP+clEEQWykw2eYEtdfVMHg5BxC4AUWCGdR3fmj3lQeB3yUsy68wJQnwATaT6JuLbo6iAaE2hF2S5yR9V4QoKIXTLycyRLdtLXQo97WXXiebur8UFKV4eupRqW36RfyDcPlTfWSY03CoYDqr/uwV1BEUCINaYe0mHFgZRifhZ/UlRO0mGeWIBz+XKBihyO2lSsN77s4hlIsJk5x2y7zXTm3NMBWRA875Xsz/VmEc6Npnri6KIHppXbHzof1o90137SHY9sRPkCjkMRWlbs+QVTqxUeQOlTrgs6Fg67u5kb1E8ABKxbV+xcgvNw13wn5cZnOeYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DS7PR03CA0270.namprd03.prod.outlook.com (2603:10b6:5:3b3::35)
 by CH2PR12MB4168.namprd12.prod.outlook.com (2603:10b6:610:a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 14:09:29 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::5d) by DS7PR03CA0270.outlook.office365.com
 (2603:10b6:5:3b3::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28 via Frontend
 Transport; Mon, 20 Nov 2023 14:09:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Mon, 20 Nov 2023 14:09:29 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 20 Nov
 2023 08:09:28 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 20 Nov
 2023 06:09:28 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 20 Nov 2023 08:09:27 -0600
To: <buildroot@buildroot.org>
Date: Mon, 20 Nov 2023 14:08:27 +0000
Message-ID: <20231120140828.1903865-9-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120140828.1903865-1-neal.frager@amd.com>
References: <20231120140828.1903865-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|CH2PR12MB4168:EE_
X-MS-Office365-Filtering-Correlation-Id: 051080f5-fcbd-4dc2-5f82-08dbe9d24fc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YV3/nKoHQzQb5SWjisQU+Oh8Q0pf6aoo4vhtQY7+J5sh74qRFVjfZdWXDVtKtGee0/Ghn4AJsYSr92IR8tfiUON6Za7VCQgzCnlNBtrxzMuaWlbyvywp4pUQtgHtRMJcOkFfQyWDT2/rodyFOpQNQu2XK750CEhVhJMLX9MEib/0X+WYmjY0etC3Kq1LGT/OvQUdE8XDqpeeSZd+8JgXi23OiGDB3Ma4FRNHiwr3fMM68BtBjp0yDU0v5fqDmvQsSETwidNVw27ax6eOPYF3PHxuDuCNFQt2maTw2NFo1rHVSzqH4RdHOor7UhZYb1GvlbMG96W8H1mzR0YgEB6EdTGiXYakjLtZ7jmIEL2PWelFRAXSEaGSvxXRBbBqUkd9AeLNwj+A1uju03sJdAIZy4/nn4k6TLWUOMbDUnxp8eSV+mZ2n3vadYmmFuxeEzZS2uMKCZp0nN+SSuIPsUbKck3SSFkY3cPCsVx8+Hl6v5vez3MCt5XS0FCmrltzIuI5JzKWnIVnn3PopXiO7PvlbrK8llxOsSdRsPrOsd8ad4+Uek9LeBWErx1iNkP4mPzsl9X1LAU6FiFH3zdkHyP0Juz5yquAuoA1hip3h/qTZs5RgKlJ6t8MJle7Y7RCKF3N+D482FRt2US7+Ntxv9p3QYWdQn+cIiFFDTftBJtl5gwADNAT/iVYVkJqSrGGkmBqkXM7oXvkGfMEI4sRoU7PlTrFzzJygJ2bkR+krStUSx1QnQ2MvhYHy3lBiFL0E7GXm6c5I2VE+8c2RJ5RcvhQLA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(82310400011)(1800799012)(186009)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(44832011)(40480700001)(5660300002)(8676002)(4326008)(41300700001)(8936002)(2906002)(70586007)(70206006)(316002)(6916009)(54906003)(40460700003)(47076005)(86362001)(36860700001)(26005)(1076003)(36756003)(2616005)(336012)(426003)(478600001)(356005)(81166007)(83380400001)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 14:09:29.2687 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 051080f5-fcbd-4dc2-5f82-08dbe9d24fc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4168
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7JaIpB9CMqbF/GkDD7mjPscib67c5ucGSrSPynX0nY=;
 b=02//cJLPWw+ekuPSovQqnZtqYdmM/W+Bdvll1zwOM4tVTFAB1QlacHDMkJKBvrwrFtPrRf9kQ6/bhcQCPTxBiiv6mzpbZFGnf5EJ/EGGAQjtryeSLajSQCx986fK1ZwwcOmgeJw74gMszJlduHgXYs0ifNqCuz7v1E9iheQKGz8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=02//cJLP
Subject: [Buildroot] [PATCH v7 09/10] configs/versal_vck190_defconfig: build
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
V5->V7:
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
