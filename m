Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775C4C433FE
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 17:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAF4381457;
	Wed, 12 Oct 2022 17:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAF4381457
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wNJMu8S6FzIZ; Wed, 12 Oct 2022 17:55:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B3228144D;
	Wed, 12 Oct 2022 17:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B3228144D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 394681BF2AF
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 17:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD3346080A
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 17:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD3346080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id efMq_WOKO1Ui for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 17:55:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD9BB6079B
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2083.outbound.protection.outlook.com [40.107.102.83])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD9BB6079B
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 17:54:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFmHEa1bUYgosT93vHuPjkw7felMeO6XGIj5+SBN34sllMtQBGVDQY9c0yX1S23lXct2Yo3wZZuR0uzCmGHlWNnGiKIwN8qyI6d0+fkgD1UMGE+iuYDRoW/vDIiRcLi2V0NFL5sKmjYZgbKM6SCvIuu9w6bNnGNEttepydvLxJT4OQV+imgq/kfenyiEYkR95+zyTP97tTBN3b3VGTAqV8u5S4imPvnNXw7umpxMDEEjyY3Yh/8FVBBE5TM9xVa6SKvU7f26pL/e+unG1YNzBlxg6In2fzBmnii687fzN9qLywnywlHU1zqM7hAdb4Be9YKyfZsruzk86YwfJMGMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1x3RLnMR6MDU+3Mghdu8MTtV+hjfbM8sK0ju0UWW3k=;
 b=ZmXkq/R7NxscZjPlF3wYKytaf6WMm5G1X8Hd/mwA8YoyBYc1zuScT9mXz8l4IMA3JNm/GS9qpH2QoTMsbe9mVM+b8l1z+4VlPK9mSkmetVpTN/zWYe/LCNNPfrhsh9x9Ub4HIlVot2qbz3LqmHEgfUKX7rLAPcZSxtjVT/wmGxT3S3dbJRMOR4mQ/fbSEIBzOn396NBa+Pt2w/M7bOOBunMFMxBFxx6YCYHs/Ek7MDPEMJ8m3FSxwv8ThkxFVm4tkrszg8q47L+DEx5sMWrgTgx2pf0DYCsQQOuqIB/DH/rlw/OhJs8087xu0xqJh/HBPHPsixF8Ikb/TIbedNePGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR05CA0036.namprd05.prod.outlook.com (2603:10b6:8:2f::25) by
 SA1PR12MB6775.namprd12.prod.outlook.com (2603:10b6:806:25a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 17:54:56 +0000
Received: from DM6NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::96) by DS7PR05CA0036.outlook.office365.com
 (2603:10b6:8:2f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.6 via Frontend
 Transport; Wed, 12 Oct 2022 17:54:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT087.mail.protection.outlook.com (10.13.172.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Wed, 12 Oct 2022 17:54:56 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 12 Oct
 2022 12:54:56 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 12 Oct
 2022 10:54:55 -0700
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 12 Oct 2022 12:54:55 -0500
To: <buildroot@buildroot.org>
Date: Wed, 12 Oct 2022 11:54:26 -0600
Message-ID: <20221012175426.32367-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT087:EE_|SA1PR12MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 045571ef-4a00-4d17-8416-08daac7adfaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XQTKvnJLA2hG80dYNRJfgZzvPunGnOtY2qVnZhyDtt0R1Y3Uq8tTGlKz9K+G40xm9bZi5RKulfoBTwAb8749uEggwcyj//uSiaRmbrK7RHT7Aj6Gf/Hz7r4nphXmmieJyjHlsRP/H2uBevQCVuSr72Vjw9IVSZ9Rk5y6SHVLSbXdD//X3EtRpakHoKX8cAszOvuT+oyYjMxe5WKtDjYIoqHDzx2qW1sfEbMkNyvvVZ6BX/KJdh8noFFg5uN7y41iRyjSh1oqVT82i+BLidtVxd3fDRkK0R8sEoXBajhR4b1Rik4WogKS1kn4n1U/IWq2xdS8dzMTTaPRBatsbaHRiXi2m2Xiomq47KFB/vlf/mtJCopY7/ggf3Cp7sJChYT3+OfDfnlveuxY4nVpwKX+xkjYMM8qywgwh87X+uahKxK7bOcJpKvlw8elRSZlHTOyIr+kYVUCFjp87kVrNPLqoLnvOEeMJBnEfG4zYulrVPP21p0ZTa6nir4E/21vlhSGd0SvZyHuHDDWytJQnvIPAemHDdA4KLZP1e0WBjmnA7mTSOplNLS6JHGCCuHd7ObiD1WLJ0RRaoE+av40HSURDefBpTTWA6T56ZM1srYetX2Lg8FJbijqW/BDw97Ok3RNdt/YCjNsP18iviD6W0NbbIDhK8dwjixziPuzYogAz1Q0ZTsiaO1/8sQI5yBYpTq55ezyh0D/s71TRJKzSmdm2QKehtswqr4KcDj7ElXESyftPxwVcE1gQzJXYLUM8+8uBvm9MyixvpHWfbpLUJtRpioXBPha86yEceLa5IhKIIGzbx5925J2tdU367ioQo82PSYBn4UKem98wGHhZbXe3ZYCTJ+oqTZbwYuOsWaaEEDo3rh1YFCiSc+z+HfnjlP2r+7rxQ+4XlGxb4wqWA06AQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(44832011)(41300700001)(2906002)(70206006)(8676002)(4326008)(8936002)(70586007)(5660300002)(54906003)(6916009)(40480700001)(82740400003)(86362001)(26005)(316002)(966005)(478600001)(6666004)(2616005)(82310400005)(36756003)(47076005)(40460700003)(356005)(186003)(81166007)(83380400001)(36860700001)(1076003)(426003)(336012)(41080700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 17:54:56.4530 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 045571ef-4a00-4d17-8416-08daac7adfaf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6775
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1x3RLnMR6MDU+3Mghdu8MTtV+hjfbM8sK0ju0UWW3k=;
 b=4F5B8BTafXGexH9xKKLAdrpDFuymvTCw4v3AvoAsp0BeCRNIFNUVn9OgZeIvsLPlF0/Rq57DCoagRkVq/51V72Dujeq+XbAa9SvWzBlZQ5CHTmTa/LFhVpfCqQ4vcEbHlWpE8trfYRllejRjz7z2NlKmF1n8c9dmRFHHUh+IQLI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4F5B8BTa
Subject: [Buildroot] [PATCH v2 1/1] boot/uboot/uboot.mk: add pmufw.elf
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
from the Xilinx git repository built by petalinux.

https://github.com/Xilinx/ubuntu-firmware/tree/v2022.1_22.04_1/xlnx-firmware

It will solve the problem of the pmufw built by the
zynqmp-pmufw-builder where soft resets crash.  Details of the issue
can be found here:

https://lore.kernel.org/buildroot/87ilqccu3k.fsf@dell.be.48ers.dk/

Instead of using a pmufw binary built by the zynqmp-pmufw-builder, this patch
enables a pmufw binary built by petalinux to solve the issue.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - corrected objcopy instruction for converting elf to bin
---
 boot/uboot/uboot.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a9f9b1bf16..ab7dedb4b6 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -392,8 +392,17 @@ else ifneq ($(UBOOT_ZYNQMP_PMUFW),)
 UBOOT_ZYNQMP_PMUFW_PATH = $(shell readlink -f $(UBOOT_ZYNQMP_PMUFW))
 endif
 
+UBOOT_ZYNQMP_PMUFW_BASENAME=$(basename $(UBOOT_ZYNQMP_PMUFW_PATH))
+UBOOT_ZYNQMP_PMUFW_SUFFIX=$(suffix $(UBOOT_ZYNQMP_PMUFW_PATH))
+
+ifeq ($(UBOOT_ZYNQMP_PMUFW_SUFFIX),.elf)
+UBOOT_ZYNQMP_PMUFW_CONVERT=y
+endif
+
 define UBOOT_ZYNQMP_KCONFIG_PMUFW
-	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH)")
+	$(if $(UBOOT_ZYNQMP_PMUFW_CONVERT),
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
