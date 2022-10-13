Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE33C4332F
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 06:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E58340C3A;
	Thu, 13 Oct 2022 06:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E58340C3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5q2BZ-i0w0DX; Thu, 13 Oct 2022 06:49:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A785140283;
	Thu, 13 Oct 2022 06:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A785140283
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C03E31BF86D
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 06:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A83896111B
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 06:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A83896111B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T5Rv_lVWjP0V for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 06:49:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E10461118
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E10461118
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 06:49:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRBxbszPMNsq4Ud7RzVDtezU3LOP30OMUgcIAhMihM4W7vxgklS4GUutArBXaQePOu70LU68/YOd173vaXXOqP6CojnBj21XDE7biNmh+QAnPUoqAcmLwrkmEv+alvkgCvv2MPZJGX0McrErG0/r+f+iseo2jnvPd+H/Ror4z252qMIfmTlxkk7MfPqYt7HZLUjVCDeiSyDByv7zKiv4B8KlCDDGn25+VDta+BMGjzRU//ZWqyolBK99oILsLfVajxj9bORwNfz7TugrQRbh9IUXtifOJZ4i/KzNlBusjy0RuY8ZV8ZMwd7SfRvqWqxn7JYCJK9Pkh7l1MreDN43jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3HR1qpJsik18pENcmFdrxDdy3/a1Ymcl73Ky41+ADk=;
 b=VwtxQLZ9cfT9ZOohYX2Gk6soUIogB15jvgNyMa5L4+MlIuH5Xu5UDmbs4POBH6kjIYlqmZ22ufo+v5HoX1QSB9dnb/U+1XsB7O2kQwH8RaKCeJQmUhwLc1oSLMk+K/cFnOX669csIqQix4lOEeokr7WpIG2ba2VRUapIUZxyu0zUuHSe5crtR5wktyTC8mntrheR7rr6NGiAJh5c+XZ/Wd7LJbourXL10RgE3YD+WZzfiW+FADK3ILAMRxzqLVdRBYacI46uaxieZ2E+7hYK2bFta1weB8uIFyQyhaxD3XRE//h9IKPwscozd8ilmk9ejb0yAbzePnrHW7y684BnQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DM6PR21CA0026.namprd21.prod.outlook.com (2603:10b6:5:174::36)
 by DM4PR12MB5312.namprd12.prod.outlook.com (2603:10b6:5:39d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 06:49:36 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::f1) by DM6PR21CA0026.outlook.office365.com
 (2603:10b6:5:174::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.8 via Frontend
 Transport; Thu, 13 Oct 2022 06:49:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Thu, 13 Oct 2022 06:49:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 13 Oct
 2022 01:49:34 -0500
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 13 Oct 2022 01:49:34 -0500
To: <buildroot@buildroot.org>
Date: Thu, 13 Oct 2022 00:49:31 -0600
Message-ID: <20221013064931.60174-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT016:EE_|DM4PR12MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a2e8a08-1669-4d5d-99c2-08daace71763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ujSKb3FfMowiLaF/kZUq8AYZV12mjXY8gVc96rUmSONPkBN6/89M5/x1mw1qQMy+deOl8TLbvv7xodLal4NUrKyRNZkzemRACvkHDWbnmFW9DAtSy02owov1+cvEYldWjdC/jVL0Wq+SpJPWq9grjuMMHScfcL/DpA6f/PCCVuxrVZ8TNBEaykRzEL0nXh+PtN4aYiyl7z+WI3CxtP9xpFt+RmCDEd5CcS+jr1ELYW9Dy07ADhWDudH+iVDKuprOzopNIQC7K2OUw27BUGSJRZDTAzW1NJNK8b+gU2FKe2RI0JkTmeIUFXyNFrYnMfnlib2oAHX0rNqc19AoZzYkVx1Cr3rmpLtUI8uSqSATTxheOKsV1KKSALGB24waxAK7l2gNkua8WhPw8mUP2mVJxL4ONRFPRizDFViN4/qBLVbyC7liFBkr7DYEQntHqc0+jpRrOlKbYp0M8WZz5EbG5ciMpfGQK695/8p8SJu/sPLhGIvK6RH3iVI2g2x8mam/V4xU98WBZzrwIEQZW65yovLmwqu/o453YDqo3IivQechRkqtD1NFZvs7aPR0Il+8Fs4Pe2uNLEUxF6MTQdTy2D2ogO7JlrzX8x6lAZVt7snARGkF0OPsXUES2VZSWan27hN0JDCbblCxhUUTqajWpFE59KmL+QzoG4/860q1O9AoWYG7zHadKErfFbAIE8f7Kqv3nQMe2zoZStcb1oKvLj3MbNoenPeIix4I9HCI4ualTtDczpnWH4A/MJNTBtIfIb5mxWcBO351Xw6WDeZzNq/Fe9r4jROq0nW+Mi8NCxD6Zdtha8AqVojL9nUic1dpyeJCsJxM9haewniYV1cqVjv181Zhw/s4FZGRcCjbYI0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199015)(46966006)(36840700001)(40470700004)(36756003)(40480700001)(2616005)(186003)(1076003)(336012)(26005)(2906002)(82740400003)(316002)(8936002)(6916009)(54906003)(41300700001)(8676002)(4326008)(70586007)(70206006)(86362001)(6666004)(81166007)(356005)(82310400005)(478600001)(5660300002)(44832011)(40460700003)(966005)(36860700001)(47076005)(426003)(83380400001)(41080700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 06:49:35.5235 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2e8a08-1669-4d5d-99c2-08daace71763
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5312
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3HR1qpJsik18pENcmFdrxDdy3/a1Ymcl73Ky41+ADk=;
 b=4s9S69ftXFB7aZlGRb0b9jTln/OC4ZymylF16FRWJLW57kcHSN9dchSFq6wgyQRnPhJW9fCKkCeYaBiJp+NVtmnWAIRc5KlJ8yL7BkSIrUvEixdqMvr6+A+PBINJchpFTb/ktYxplMFFlQlNe3JRiz7f3R2YsSUDRNFQBMk7vOM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4s9S69ft
Subject: [Buildroot] [PATCH v4 1/1] boot/uboot/uboot.mk: add pmufw.elf
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
V3->V4:
  - added spaces around = sign of UBOOT_ZYNQMP_PMUFW_BASENAME definition
---
 boot/uboot/uboot.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a9f9b1bf16..0439ec5e4b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -391,9 +391,12 @@ UBOOT_ZYNQMP_PMUFW_PATH = $(UBOOT_DL_DIR)/$(notdir $(UBOOT_ZYNQMP_PMUFW))
 else ifneq ($(UBOOT_ZYNQMP_PMUFW),)
 UBOOT_ZYNQMP_PMUFW_PATH = $(shell readlink -f $(UBOOT_ZYNQMP_PMUFW))
 endif
+UBOOT_ZYNQMP_PMUFW_BASENAME = $(basename $(UBOOT_ZYNQMP_PMUFW_PATH))
 
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
