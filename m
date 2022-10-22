Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0500EC433FE
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 11:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6209E416D6;
	Sat, 22 Oct 2022 11:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6209E416D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5r6lyrrGNU-I; Sat, 22 Oct 2022 11:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0366B416BF;
	Sat, 22 Oct 2022 11:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0366B416BF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F08A1BF2C3
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 11:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6E2E83372
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 11:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6E2E83372
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YCnFdAm2DHXf for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 11:22:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 890898336F
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 890898336F
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 11:22:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6dY0b95/oULODDyBDR6vfyYTKvAx+jOIxhaEEH2I0faG0f+47T1+IkqQkRfC5LswP6RwwwUpTXyTfTPmEhsdmmDtlxz7YK7TfSzklLmcI/ylkej/kPpzte0cdgLX2MTdR5k/QAoFMZDxemOkcbyCl5My+/ViP2oNvEbm7noKCV26RVRBHVlpuIKdvCK72JiV6T1qW3+54oqQmqKYMNdr/a30CabquGg/Fv5B76NM13j1DTeh2ag9TBhnASm3SElawnGOLTcf+kB/u0C7FCW+q3jCompuISgOH6/Ckb3y0i4dm3XrEHxqzxnv1F+jxdvgB+vg0cHt4lWHzkqf77Dqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lY+40gLPugheJte7Lej6ohpqGiVe4TUhm0VqoqhteaQ=;
 b=jC6MqzN1rjDYdfgNG3ryJAXW/k6IYlpmqL2KA9hWIdP+Ongb7JYIveTf6+5DfcDn0mdt+EGNcAR7vX/+/CMIjjaNkvby8gHUag+WwK2g+cXb1DVddI7y2VbK0p7upi7OZdvBuYhkjUaBtgcGhnZxosvRadm8g6Kz5HXKF66qPxmcEsLthUp/6PnOe3xJBsghdDNoiUWnuYVXenhfTd+7Cw8LDfj0rp0yEJaoTGm6i46SjspTOzpeQFhZryxfgwLZxvovF3NEE7iYcrweOSFciyEuhUF6KAJFDembIOPIwGjAaZCkCnawsE4M4/08KPljHcbyDFpmEKEjKMk2ac+c8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR04CA0305.namprd04.prod.outlook.com (2603:10b6:303:82::10)
 by CH3PR12MB7619.namprd12.prod.outlook.com (2603:10b6:610:14b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Sat, 22 Oct
 2022 11:22:53 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::f1) by MW4PR04CA0305.outlook.office365.com
 (2603:10b6:303:82::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Sat, 22 Oct 2022 11:22:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Sat, 22 Oct 2022 11:22:52 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 22 Oct
 2022 06:22:51 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 22 Oct
 2022 06:22:51 -0500
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Sat, 22 Oct 2022 06:22:50 -0500
To: <buildroot@buildroot.org>
Date: Sat, 22 Oct 2022 05:22:43 -0600
Message-ID: <20221022112243.31889-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT019:EE_|CH3PR12MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: b310c120-ebd9-4e6d-5514-08dab41fc260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jxAEVzIXn2QbuADexRygvsiye16qAzK121qLzLipq3sejPAt7Vq7SUgeSgt8Z/EbfZmMdjaR2xnd6awm+k2FT7kv5hqrBv0wNs73JQHFt4tptbZQ5lIkvFAgloE4OQrrFXfJ/R7MlUrI2BK8HszL/2ozke+DGUtYYm1B9HT64GmUFM8Gi3QeJWsqfo7DQqltTyZJ9lr9DywkPd5liRszWTfuQJUD0qkSsx6U35DkhZhr97d4lKL1gW2VSmJVRF67gPfMkLYE0f8IOXCkZC8I6AI+M1ZqJ7B3v6S/JsMbNzJi0aWPsaQdFg0Quk/8s7+OR2wKlY2z3/J0lHdnsFj7ltei3UCtGE02Z+zcyRjYZCgAAGIKFj1oQRoIX5T+QWUTb1xFE8CfkJfO6honj8hBzNyKycp0RhPTEVCAb7l/JpwngSp0yK0OKnT6/dovuxcXNet81hLs9T5+SfDPXeo9h8keKduX39PN39ZoIo57hdvxplPJRj1q+o7Hh6q7nuWvYlVUn5YUC0kkeMA4B9DmZln5M0tFLTT/fSGT+TiC2uFUP03ojpi/oVvu8AWMld9vjJj3wn7qAYGjdS6EY+Uy4WkrwpQU6SKAPpLTzS3gZxqDs6AhIdE00nrJwVw98vaVfN6M04Lf4Zwcv/c1+ChsK8HaDl6Ws5hIbxUW4px8EmF/hbq+U5ZIWk2wQI2Rowo5hyqLvrRoHk9WU0WWeQL4rnPTfJ1/7ZvhHGe4fm32ucR5lm8oDzM/Ji+DroaIbvVRDMoBUZw5nUy80/yv8SoR32HHMi5A39B5NNS94Jl0fqrQjYhv0vq6Q0ZukmCp6jCO4MnDaoLuM6yIntGT9BJCOg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199015)(36840700001)(40470700004)(46966006)(966005)(8936002)(70206006)(70586007)(86362001)(4326008)(1076003)(478600001)(316002)(2616005)(336012)(6916009)(356005)(6666004)(186003)(2906002)(5660300002)(36756003)(26005)(81166007)(426003)(82310400005)(40460700003)(44832011)(47076005)(36860700001)(41300700001)(8676002)(54906003)(66899015)(40480700001)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2022 11:22:52.2863 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b310c120-ebd9-4e6d-5514-08dab41fc260
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7619
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lY+40gLPugheJte7Lej6ohpqGiVe4TUhm0VqoqhteaQ=;
 b=RzNao7UvxZHLxXecmKm5d6hzhwRXYOu4epZcvqJw7tps/k1sowxllfYJAhDMW9I2eufM9QDXaDIVzjlSvlGHNklIC0LMLkiUCgwwMbWIv/9kWTJTGFq8JWyrBbXhCT/laG51dkpIa+iELKiFQudx22Du0gZgmwlIQ/TsXyasDis=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=RzNao7Uv
Subject: [Buildroot] [PATCH v2 1/1] package/bootgen: add bootgen host package
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

This patch adds Xilinx bootgen as a host package to buildroot.
bootgen is a required utility for generating a boot.bin for
Xilinx versal products.

In addition, for developers who wish to use secure boot with
Xilinx SoC products such as zynq and zynqmp, bootgen has a
more complete offering in secure boot features than the u-boot
mkimage utility.

https://github.com/Xilinx/bootgen

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - improved build statement to support older hosts
  - added bootgen.hash
---
 DEVELOPERS                     |  1 +
 package/Config.in.host         |  1 +
 package/bootgen/Config.in.host | 10 ++++++++++
 package/bootgen/bootgen.hash   |  3 +++
 package/bootgen/bootgen.mk     | 25 +++++++++++++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/bootgen/Config.in.host
 create mode 100644 package/bootgen/bootgen.hash
 create mode 100644 package/bootgen/bootgen.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c0e6f8bbef..c8183b2290 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2175,6 +2175,7 @@ F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
+F:	package/bootgen
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
diff --git a/package/Config.in.host b/package/Config.in.host
index d6b9ee0e2d..8ccbf40a84 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -7,6 +7,7 @@ menu "Host utilities"
 	source "package/asn1c/Config.in.host"
 	source "package/babeltrace2/Config.in.host"
 	source "package/bmap-tools/Config.in.host"
+	source "package/bootgen/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
diff --git a/package/bootgen/Config.in.host b/package/bootgen/Config.in.host
new file mode 100644
index 0000000000..0acb58dee0
--- /dev/null
+++ b/package/bootgen/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_BOOTGEN
+	bool "host bootgen"
+	help
+	  bootgen is a tool to generate a boot.bin firmware
+	  for Xilinx versal, zynqmp and zynq product families.
+
+	  Additional secure boot features are supported beyond
+	  what is included with u-boot mkimage.
+
+	  https://github.com/Xilinx/bootgen
diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
new file mode 100644
index 0000000000..5d77c164f3
--- /dev/null
+++ b/package/bootgen/bootgen.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  7e07c75aa3e3965c8e33faefde037877f78130451cebc2056b096db9c66acbb3  bootgen-xilinx_v2022.2.tar.gz
+sha256  4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a59aa3  LICENSE
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
new file mode 100644
index 0000000000..4589bf019f
--- /dev/null
+++ b/package/bootgen/bootgen.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# bootgen
+#
+################################################################################
+
+BOOTGEN_VERSION = xilinx_v2022.2
+BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
+HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
+BOOTGEN_LICENSE = Apache-2.0
+BOOTGEN_LICENSE_FILES = LICENSE
+
+define HOST_BOOTGEN_BUILD_CMDS
+	$(MAKE) $(HOST_CONFIGURE_OPTS) \
+		LIBS="`$(HOST_MAKE_ENV) $(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`" \
+		INCLUDE_USER="`$(HOST_MAKE_ENV) $(PKG_CONFIG_HOST_BINARY) --cflags libssl libcrypto`" \
+		CXXFLAGS="$(HOST_CXXFLAGS) -std=c++0x" \
+		-C $(@D)
+endef
+
+define HOST_BOOTGEN_INSTALL_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/bootgen $(HOST_DIR)/bin/bootgen
+endef
+
+$(eval $(host-generic-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
