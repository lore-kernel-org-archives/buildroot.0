Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584C4C54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 09:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 005A082400;
	Fri, 27 Jan 2023 09:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 005A082400
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dE7d9VU7ppW5; Fri, 27 Jan 2023 09:44:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42E5C82350;
	Fri, 27 Jan 2023 09:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42E5C82350
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 389131BF346
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 09:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04A446121A
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 09:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04A446121A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1prpKSTZIMdg for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 09:44:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C4A960B8C
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::61d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C4A960B8C
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 09:44:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrJQv1BKqMULvmoAkV/hkS2fwmXno/IegPW/nyIw/aZebpTlwoRksHXg6LrnF85iyovb7Iebpb+6zQ53JHsX8xrNRdxg/fCE9qhd0XC5zplepQNvRC4vCTH1uuFeoPZajpvCli6FhA6V9aC3M0OmM3TD4N6yAoj3VIcZEsG8sqWbFBrWAsuOheTegPNOzRQxyC6oGF3u45mHmvY4+X0B5GitvABWUjgV7sl0c/Tn1+wll/CFgLXNM/eGN11ZucfEZ4OFBvYDivevNyRQhJNsCrWPFBJnQQPa4WCUsxTJNFFJBL+F8VRejuZAgvogIxWOrKkHXD6G7puUBhMMp+wJoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImZsLVXfEsR/tA3ptKBuLRmRatyN6oI1bivQO6mo16c=;
 b=ROnV23xJK9Toi4tDlsW4c7S3LFdy5wfKQBLxdiB0S3f+T+uNBaRTFB/zmLhgGijdeCgBYr7W4IsB+BYTixvGRc34fgPIJKDWwI3nfocjPbffhklo18+4LKF4LxfdKbAFbllq5TH6MofN7rF6QaN8sPPoml8bk+oJwT5BqkodXy7cltX5anoUKVASHHZWGs4ihi/OOcwTC2L+ybGqlPU5z9eDXW63AdTnQz0UMGcRRzFp5dRRZ+3qtLEZvop4GqFu+epb2MHfiSbSGi/HFkAApJrFt6q7x4DgZyO6y/hwl5saQEeo+L14JIDDEhh7IyRL338nBkoUvvFt/vDbZe3JYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BN9PR03CA0711.namprd03.prod.outlook.com (2603:10b6:408:ef::26)
 by PH7PR12MB6835.namprd12.prod.outlook.com (2603:10b6:510:1b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Fri, 27 Jan
 2023 09:44:16 +0000
Received: from BN8NAM11FT091.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::aa) by BN9PR03CA0711.outlook.office365.com
 (2603:10b6:408:ef::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Fri, 27 Jan 2023 09:44:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT091.mail.protection.outlook.com (10.13.176.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Fri, 27 Jan 2023 09:44:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Jan
 2023 03:44:14 -0600
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 27 Jan 2023 03:44:13 -0600
To: <buildroot@buildroot.org>
Date: Fri, 27 Jan 2023 09:43:59 +0000
Message-ID: <20230127094400.6267-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230127094400.6267-1-neal.frager@amd.com>
References: <20230127094400.6267-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT091:EE_|PH7PR12MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: 719188c4-2243-41ae-f6b0-08db004b0d54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8x+tj83T3P2OEwPz+5fcd4FgtpkSVjWJPoBeXyqZIodLhCA4tz/yjXBaFnDQQlEHK5BhVVsGqXwNRBaAaT0U+9shBGAZslCrEiLatc8ONhUfw3/LkeVpMpVSGyP05gUUog4CtCNZRnk10GB8KeeRim8ONzouxfgN2Gv0q6+BgCdNoSPep2wvnnkaNgaD1goXbCqDZZJBv1eT4RAEWVzbuDnv7YYcYeOM99FU6oQO/UA3y9CHgOJArvey3DDhG+rBb2owLYWrFC8pt0i9SDKgs32xraFiJhFwhp+ysBSwnb2lNYsGZPU0DevVkrRMYuB3ERgEg6FrHGgg1MbJYNtlLwFdtTA6tOLWN8v7N3ATw1m9hJId2/Ke3X5Q5hF+IDzyIBEnhjHiZevlV3M186b/liPq3ZBhNeOV1CYyTtK2+9Odvw6VXZ1zBhtBrm1F3Yf44vyzK3eEB8GwXhIRZqCTNzgmTtaQ3IakVH4UjlkOguVmII1SmS9E/4wz4I42ELEsJoti8bw3xURtq/ZscFu4ZxJfXSBvrKIC9mtK9lYXe4gvLer91Vpe1ONvKta1SA4EHssURLfneNFGxmGobDPWX3ryuAOwtP896H/PWFyXZZihowxcLrMalAal+gLbybD0agv3goVaTOkG+RMrNG/pqWzuFPyiDg905/8vOM6t2EaeZSYvulbyDfcIoosKdKXP3LVW4drU7qmsHHVC925VJ+k7uKjD4Y5bHyfis4Z2KdhB8+kIPI5CzsK6IMJSND/fQ5k3b5cN92x+nB4GmFQwgzPClkNql8d8yJ7yzqS/sEiczypOwLOXLWgv4+ohf2D8
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(6916009)(82740400003)(6666004)(70206006)(41300700001)(36860700001)(478600001)(8676002)(316002)(70586007)(54906003)(47076005)(4326008)(26005)(83380400001)(36756003)(86362001)(2906002)(186003)(40460700003)(1076003)(336012)(8936002)(2616005)(356005)(82310400005)(426003)(40480700001)(4744005)(81166007)(5660300002)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 09:44:14.8651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 719188c4-2243-41ae-f6b0-08db004b0d54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT091.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6835
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImZsLVXfEsR/tA3ptKBuLRmRatyN6oI1bivQO6mo16c=;
 b=VnK4IXW4iNv7a5nt2Qj4UdES8aW33H6GuUi84fz4DrYEp+My7KP3qHPjF6Wa2psrEYZz+Wyk9h7AVedW1qkUh25Ii2Et3ZdPPnVAsiSv80n62Z/y1ldG0KG/4GAQ8TF2nfFFfqk5Z/jJDZ7cEdP2zmO3ixhiqLrTsGbvaUX2d6k=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VnK4IXW4
Subject: [Buildroot] [PATCH v1 2/3] configs/zynqmp_zcu102_defconfig: use
 Xilinx github for pmufw.elf
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
Cc: terry.oneal@amd.com, luca.ceresoli@bootlin.com, kris.chaplin@amd.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate zcu102_pmufw.elf location from nealfrager github to Xilinx github.
The image is identical, so this patch has zero impact on functionality.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu102_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 6047d4299c..00b33261b6 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -29,7 +29,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/nealfrager/buildroot-firmware/raw/v2022.2/zcu102/zcu102_pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/2022.2_br_1/zcu102/zcu102_pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
