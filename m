Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E305EC433FE
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 06:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7361B61100;
	Thu, 13 Oct 2022 06:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7361B61100
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K1lYtJFdAZS5; Thu, 13 Oct 2022 06:09:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A12B060AA5;
	Thu, 13 Oct 2022 06:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A12B060AA5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCA2C1BF86D
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 06:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A249660AA5
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 06:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A249660AA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ptawySgIYjm for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 06:09:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B175660A81
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B175660A81
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 06:09:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiAwMIvughciEV4ul2QE2HNDnlyCMOCtbRWpdtmK3uwhWpKWAw/TNYkKiSBnYOXCrIcPREVxXrp9zQk0yg30sUwHt5lkq/RUqMVMKnZ8hv9BgVyz8PDOihlNbtNdZhCoSUfelYzEeeHwf/phlYikYzTub05eKrb+SrYUKkrjzKf7VCsFbZqWzt3Cabz0Q9vC01Mvq+h2gUxKaVdKfcGql+FV6pdzG46FqcB9tOysG1wiHNHeIMi2RC6++rpthI/YvbsaMAqWQI7ZTxCmdm+ymHj1tnXaX9Gwd9g4ZOfRQNZvlxZ4B7+jvxVUMg6hAWWen1X+1DYg2tPGWEhRW7HhpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRtg2IOMiaoFTr0zRy+eQ+RzS5YHHApXL4uGwv2l/as=;
 b=MO7BZ/bKaKBQaaZrAiBkHcoaWEN53RXip3jwM65OuP05dXFIUeN8AKfPWBllURbseOToSY6tkFHqp8PhEY/9i0TUz4KpCiS4xlT12BofdmDs6hjxQoaCUujDm+xrardcNo4a/kWHTzTjxXjKjISvsEdWI9QWEQUxZDu2HrkCtKOQhDsRmlyliBAODokgvckTIky4pOB6Kt09uiRw5pEPWG23XLP/Yvl2brpVR4XX9bTAyv9tOubcuCINOiALHQEwAXxpiKw5STNYDtdGjGog0VHzNLyFHT3X0hGCJVa/HvoxJP1+wlFYdHjmI1PSmadFwoqcw2L2udA388qHqd/AkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0238.namprd03.prod.outlook.com (2603:10b6:5:3ba::33)
 by DS7PR12MB6240.namprd12.prod.outlook.com (2603:10b6:8:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 06:09:13 +0000
Received: from DM6NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::40) by DS7PR03CA0238.outlook.office365.com
 (2603:10b6:5:3ba::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.22 via Frontend
 Transport; Thu, 13 Oct 2022 06:09:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT107.mail.protection.outlook.com (10.13.172.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Thu, 13 Oct 2022 06:09:13 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 13 Oct
 2022 01:09:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 12 Oct
 2022 23:08:44 -0700
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 13 Oct 2022 01:08:44 -0500
To: <buildroot@buildroot.org>
Date: Thu, 13 Oct 2022 00:08:41 -0600
Message-ID: <20221013060841.2766-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT107:EE_|DS7PR12MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb98257-2ace-4ff0-403e-08daace173a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: upxqdw1lWvfA5B5q5MCnHQSMcbc0xiZg2cXfaOLpL44gYIy4YKv+im4T4cmK98Filz+3KbAY8/WMxEYxyBvyeqrhPFuFffB6Xp29nT/FQcMr2mNs9AjjXf4CfCP/tRQwa+g1Clj8ykVkH6QOHSwpKES/IVPtGlJLGbRrISHFWDtgQfMCXu1OsIE+UaqX3cN1t4TL0zBD4/3arQRWybLV3sN3UWOBhbHWUteH0u4JKkCTh7oekUrAWYBl156nxYbgqa4XqmK0APtl5IB/DqbhgZFlfbz2/mkujBS2eDVygAES4Clyne6mCEe90J7dDhN6KqArfo376BGn6ghNOIpw8MeHvJ+MS3dkwb+j4nmB0R5vIs3Rj4mbuJ7bWtQJceoVAAs4CPSGAoLkU304w0djl+LhVzGCR1To/5TPjR4ZQB3kusib58GtlYduJj+qcLhu/DiEBkSQiBEC/je29p/afyxNN/j+RLP6q+Ku6hedEGCmTHHpL8Lb+Pa43TedV6dHXnj+JoN9+NoQBiVZiSmVd/fcQPW4osAm4pUjXW52S0AX7hZUzzoztLOX2g1/jjf/cs8fuW1Sz1HaiKpjYQCyeiPUYRY09uLe8MhKAGXxnzOK1yQ0LGxFMI+QjVtL/AOXZ11vm4dGOSbkb7efNCx1vmtRXjTfpRfURNaG+5hOEut3QXFCX5IIjmBRiWTSO8zt99SkSd75hNl1f68IISCHGa2z18C5iFqiWvLTbgB8n1IEloLVZQYeV4z8de5TFmbRS83gXv/nFTiGzz3TCktz5fexpzBR4Yesgkc17XXU4mixwBOmvU9wS8LyESPUWBydDzRxVn9RCi6kR18DCXfexTdij4d9hM0knz2yL46fLD4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199015)(40470700004)(36840700001)(46966006)(70586007)(82310400005)(36860700001)(36756003)(40480700001)(82740400003)(966005)(316002)(426003)(47076005)(54906003)(6916009)(478600001)(83380400001)(5660300002)(44832011)(8936002)(81166007)(356005)(2906002)(41300700001)(4326008)(8676002)(70206006)(40460700003)(86362001)(186003)(1076003)(26005)(6666004)(2616005)(336012)(36900700001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 06:09:13.3263 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb98257-2ace-4ff0-403e-08daace173a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6240
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRtg2IOMiaoFTr0zRy+eQ+RzS5YHHApXL4uGwv2l/as=;
 b=bCWI7SyHGwv6Cf+/yTwYDVgTA4SVjVbIWhJdtAqj12lc97iprC/4/FVkLDYCuIHYKdeatyCOtf9QySXCRLviUNQoOBBBP68+M/1e/+kdZQGQT4ZpwkbDbyfh+NijL/URBadQwZOAVzLEYWiPcdXKOOo6fCCX3enWzrj+g0CqRso=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bCWI7SyH
Subject: [Buildroot] [PATCH v3 1/1] boot/uboot/uboot.mk: add pmufw.elf
 support
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
Cc: luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>,
 kris.chaplin@amd.com, wesley@sonifex.co.uk,
 giulio.benetti@benettiengineering.com, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for zynqmp pmufw.elf files.
It will allow buildroot to use pmufw.elf binaries directly
from the Xilinx git repository built by petalinux in
addition to still supporting pmufw.bin binaries built
by the zynqmp-pmufw-builder.

https://github.com/Xilinx/ubuntu-firmware/tree/v2022.1_22.04_1/xlnx-firmware

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - corrected objcopy instruction for converting elf to bin
V2->V3:
  - removed unnecessary spaces
  - simplified if statement to check for a pmufw.elf file
---
 boot/uboot/uboot.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a9f9b1bf16..931a574f0f 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -391,9 +391,12 @@ UBOOT_ZYNQMP_PMUFW_PATH = $(UBOOT_DL_DIR)/$(notdir $(UBOOT_ZYNQMP_PMUFW))
 else ifneq ($(UBOOT_ZYNQMP_PMUFW),)
 UBOOT_ZYNQMP_PMUFW_PATH = $(shell readlink -f $(UBOOT_ZYNQMP_PMUFW))
 endif
+UBOOT_ZYNQMP_PMUFW_BASENAME=$(basename $(UBOOT_ZYNQMP_PMUFW_PATH))
 
 define UBOOT_ZYNQMP_KCONFIG_PMUFW
-	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH)")
+	$(if $(filter %.elf,$(UBOOT_ZYNQMP_PMUFW_PATH)),
+		objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin)
+	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_BASENAME).bin")
 endef
 
 UBOOT_ZYNQMP_PM_CFG = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PM_CFG))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
