Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76443C433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 09:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4E594196D;
	Thu,  5 May 2022 09:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cyC04klrDMum; Thu,  5 May 2022 09:15:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1EEC4195A;
	Thu,  5 May 2022 09:15:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 391CF1BF3D5
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 09:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26C4241953
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 09:15:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6LfkCPgFR8b5 for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 09:15:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::627])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 091104195A
 for <buildroot@buildroot.org>; Thu,  5 May 2022 09:15:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpS+cuop+nNTEh31BRoho8xd+/+h8qwPxYoL93saC5gjgNirc3yufec3iDFL6oPdcCqlJ0899Cfl0Si9t1xmRJetD2fxNVAbPRugUNszHQe5kO2MRG46VPA1i3GP3zJ7ckRhE9MJbm1K68RtPtyEATSoG2+ZeikjLixBoheTjyTMKaOXoVR2d94///7XSlZ30ofhp7x33cSn3RIu38AiI4vH1xy/DZI+2pAh6sxYynhJIcpSv/0Z6iWUTyqlZZJzB3h7pKkx3aM163erWnADS3mHNZRMiO1cHz1Hvn3ENcxnnPehroRJWkyykNbdobxSTR2bgJmi+wWyHLB2MiPQvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ihv5SsSxTxWBdJ1GfkWjmkRCvhB0KjRvzq7o5VV0ILA=;
 b=Tlkqd7PU7puEPNtElHtiRwD6g0F/uf4xHwrolbEkOTu7i6IyoMbCazSMIlm1xERfyI4kk0TUpbxTPxUiFIbnE5x9N+5HcUa+Qq4K5u0nCze5EqgHz7apDeenQT3Qg4rq1mwByqQFkD1mUcRErAQETlJLBzGsNq2H6et/yZxNxVBbm/w3t/mitP0RcqgpSo2KefqJVviuMb0kurJfuXITAZKRLuQOyZZWjyIuM0zMe6XForA0gJqlgmhnJbjsTSShphqIt5RtmH9pXEnVJTefqjw+m9EhXlKmyZz3ZwOCVPYNiVnJ2dpA6tGUKgtATYhlOuFL/ImgjQf6/ge7+KWAWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ihv5SsSxTxWBdJ1GfkWjmkRCvhB0KjRvzq7o5VV0ILA=;
 b=Y3CwgaNti/D/GNaYMy7ADv4aCIWhsE9qCzWjglTUl8vE7gQGf7FS3RKVwNcWEXHNRIIAgAKhBj+QE2cayEa3jaN80JOeA7urxsqbuprtpclO/o8FA15004RjjOjYxMx5l5jCBtmlEyffNA4TviHZe7sEA2luoFZofLX3hzzk6Vc=
Received: from BN9PR03CA0317.namprd03.prod.outlook.com (2603:10b6:408:112::22)
 by DM5PR02MB2713.namprd02.prod.outlook.com (2603:10b6:3:106::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 09:15:31 +0000
Received: from BN1NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::37) by BN9PR03CA0317.outlook.office365.com
 (2603:10b6:408:112::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Thu, 5 May 2022 09:15:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT016.mail.protection.outlook.com (10.13.2.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 09:15:29 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 5 May 2022 02:15:27 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 5 May 2022 02:15:27 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, neal.frager@amd.com
Received: from [172.25.185.186] (port=53514 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nmXa3-000D06-31; Thu, 05 May 2022 02:15:27 -0700
To: <buildroot@buildroot.org>
Date: Thu, 5 May 2022 03:15:21 -0600
Message-ID: <20220505091522.646109-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a6fb07e-d721-4d36-7869-08da2e77cce7
X-MS-TrafficTypeDiagnostic: DM5PR02MB2713:EE_
X-Microsoft-Antispam-PRVS: <DM5PR02MB2713912CAC30E9F01245569FF0C29@DM5PR02MB2713.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KFaGUic9bhsZf56FP564SpXzy7SQ6W5TaRgRnwiD8kQUWM3vbUdau/B/ozWr3WjpRsdnAl3QtHth4c6o+6QdA7VOEAHQKYBT1mlU1/SK/FNZH8+RKoXtXnO5CjNQ5TpvQ8Lm/2+z782iUEFFJjccCtiSSyAkPRedw9aPvUdxkpFrcYdoxEoOSt9hjrk6xmAIB0brDAyQoCqSCUqOjGhfW7fBEyV+ybRegsAX3HS8PSDfWxSrBA21kIPtH3iaqgAaBVEXCX7JAPtOl2bsY0J1rWbaHUIyh0jHfUykqqszgyIJmyfNZ3HI8VZlKDqugnPXKRLH98IbU+jFXC38JwMHFf1bgIh8oskwtd+ypUMOxgOIBcVjqs7RMg1E9ItwriZ/ElxUIu69KXOfxbR0DgJALAtrj3/OW0wDWG8AZapMR9eo2kaz4y4SPmuGbFOSom6g0FAjmJaErJJTXsw1mCgfAKoRKHPfImaYT60iKIlyf5su2ab/meY8mZgR6ZCVkKaI2mR+yl6tGv9Z2dusENuKIX6woE8Smc1bEVBuSvVhFvo97zeBWR5boH61urC07EUXZfgoGxo3s9PU74z1Lf0XRO6GFuypDe2NEW77c++uhkLvByNBKUjqJbHKvnIZdxAxyz68k9OZLX53OyqcCwWW21OO7rUCoMJClTX+2HIJglmmTSDb2GQufg6YUxZWjG2y7/rX7E84iEtFXSulqCcx8qko709tIkOcEzHPxyR6W4H/bSeN7XscVQUir6vfD7n4JKyISVdqTbjd6yubqTMM/ZV0+m9RfjzdtcTci/gPzlXoc4v8Z9wcne/PsNVsEKHiAiWY6HPmTpaCJl+9VNCk/A==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(2616005)(1076003)(36756003)(47076005)(86362001)(83380400001)(9786002)(356005)(5660300002)(7636003)(44832011)(35950700001)(8936002)(6916009)(40460700003)(54906003)(508600001)(2906002)(8676002)(4326008)(336012)(26005)(316002)(82310400005)(70586007)(70206006)(6666004)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 09:15:29.8647 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6fb07e-d721-4d36-7869-08da2e77cce7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2713
Subject: [Buildroot] [PATCH v1 1/2] configs/zynqmp_zcu102_defconfig: bump
 pmufw to 2022.1
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps configs/zynqmp_zcu102_defconfig pmufw to 2022.1.
The pm_cfg_obj.c has not changed between 2021.2 and 2022.1.
The pmufw_v2022.1.bin has been tested on a zcu102 board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu102_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index cd33621e67..5361981f5b 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -28,7 +28,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2021.2/bin/pmufw-v2021.2.bin"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2022.1/bin/pmufw-v2022.1.bin"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
