Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBE1C04A95
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 08:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A779540475;
	Sat, 22 Oct 2022 08:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A779540475
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XsuVRjxJgA2d; Sat, 22 Oct 2022 08:28:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD1E140194;
	Sat, 22 Oct 2022 08:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD1E140194
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D11821BF271
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 08:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B999640194
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 08:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B999640194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OxM9HivMImzb for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 08:28:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92401400E5
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92401400E5
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 08:28:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwY0cs27TXu9JorkwVIETAX8tiOiFP89WlXbjh2Q1c+f9kpkKYxJ8I83lP2DRgdZY5L9nu6M3CVPtme0NiCflnEKFKw+v0H3lvChAhmav8Qhg1qdsZhKp3alQ4XpGwSr48UZ4f6G9Su2wSlbILs6UfphdQ32n28eDQwWQ8zyI8z9/l6rfovZEC5CCiQqlPpnsXme9+B4LUKe7QJJ7aiUxQOQRY25wKZ9ZlTaYSgucql5fAXE7wtPEd3pW052vuhaM+XVx9d+dwtmsz1XaXxikKolnqCL2Blq7GE/bWw4C7g/UYftDc2yp+fl1jrDUFgANOKC3T8eFBzUsggrGiVeVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2IUOjWhutgv9hCuJPwBN92WoVwB/Rrb/wZc5wTIO9I=;
 b=BydWsTE+QXVtYw7Mi2VY5C2Dwa0lW+Rzw5zuaTb+hduE/mHsnNhWYvqo08GEJrfF/ZZETUfpVByUiY2kUXBcua7d1WR/FvBnpnMh289NWQPaHjMA2d2yeKd7xNJbYQMcXnDNYgeOyLXir0SAXphSjbUgMEmccPSvPn0wjNcmqMMPZMqMaq/bsf0y+V/SPfiUu074sD8kL6UyLw5upeLJG4m64wVD1R8nmuxTLhw8NVPNGyNHsoiXXkuRAJQVYEarUYmF1oEU9q8rcaB5HTn5XiIh6CF+hRMNyhtIzISiMVeIYSTE/9qfL/7+ghnkYDObrzUDbCFcw9hJq3EAh+/BVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0070.namprd03.prod.outlook.com (2603:10b6:5:3bb::15)
 by BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Sat, 22 Oct
 2022 08:28:29 +0000
Received: from DM6NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::6) by DS7PR03CA0070.outlook.office365.com
 (2603:10b6:5:3bb::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23 via Frontend
 Transport; Sat, 22 Oct 2022 08:28:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT077.mail.protection.outlook.com (10.13.173.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Sat, 22 Oct 2022 08:28:28 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 22 Oct
 2022 03:28:28 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 22 Oct
 2022 01:28:27 -0700
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Sat, 22 Oct 2022 03:28:27 -0500
To: <buildroot@buildroot.org>
Date: Sat, 22 Oct 2022 02:28:24 -0600
Message-ID: <20221022082824.35440-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT077:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e9a24a4-7940-4246-8c0d-08dab407657e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UggMQMbDGyAfDiGYaLEZE8/Cm8gHOZLC+C/0v4N4quqZq2qbCH8s1Inqe255i9pJ/HVSiRn91iNNDdiWjatopu3amvBiYjd1E1rAD2alrxnN0D6BCbNTq6Zh0zIDUikoiODR7DjsgsyAaQkc7iRkWSRlOERfJ5oy6TinSbFGBRclM1A14RvtTZRCMhofwG5BRgJNdlZJ9EM8jtsYJnHwssvLiiHNkNPNIUVf7bE/b5nQ5rpOyBB7hi16kiFUbALG0+glGxMU3rtonqJFpgNtKprV8w8jsWVh1vPwu3gY/xQ1ogd431DWmit7/vZTrJC3F5Caxz80hDSaz8nCCwlKIDfN501NHQYOVKGL3PjKuGV9dCQe2D2/ePmyHyhgHpe94NWsJhRNFYpyH8e59cAAktECgDhzM3Pcn4QM7MluMmcd+kaTUQk150yfMs9Psqs0dUdJA3u8vvwjDBk8WjehPII9/KP5rT5k+N+lC+O6EgV4K+RQwxA2D3NoxPuc1adC4KmQ0T+59/+Iqph8Mt0D92qJmM25R/TfhiZJC5yO2s269fv19xO4YQ/r4y7xB18F/C32ZhfcHKF27G0Iw0I7xFbcNWZN2Z7Vjb4F1e1vK2+4yc0p97hIhqesaT8CJGReKctN+6acUKxp1l8umfLND6/XEgeBrKWj6ADvS6JfMGBK+3n1j0DAW8n9BqZLMDGrpDeA0akj+8FVhdllZpragFjpmMerDA4/QqDOWzs8ZdbVfSUjeK2Z87/8YVpGcYH7/aQmS9hlTCJalJ1WeRhH2v6t/QhyUrKtTZeFw12FHZAtCUOAHDmJhPygXhaYsIazjcT2vE7eI2Bh/HRrqGMjgw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199015)(46966006)(40470700004)(36840700001)(40480700001)(81166007)(8676002)(70206006)(36860700001)(41300700001)(1076003)(4326008)(70586007)(36756003)(40460700003)(82740400003)(5660300002)(86362001)(2906002)(44832011)(356005)(966005)(2616005)(426003)(26005)(336012)(8936002)(47076005)(6666004)(316002)(82310400005)(54906003)(6916009)(478600001)(186003)(66899015)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2022 08:28:28.6128 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e9a24a4-7940-4246-8c0d-08dab407657e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2IUOjWhutgv9hCuJPwBN92WoVwB/Rrb/wZc5wTIO9I=;
 b=B2EXkTQUmjDtE1EEWBgd5t8s74cbIGLiKz7ki6hBwNrHHPEG+gJIZnPHLb+/dYFl0WBXWPWrgTyQ5g7L9M9HfA1RA8YmfguBti+/Sh5do/++om0fQii/hy8kQH1LkKH2rZ0svMBfOVZcvnWUag4sA7/Dq60cPZiUs/QH4zmJOgw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=B2EXkTQU
Subject: [Buildroot] [PATCH v1 1/1] package/bootgen: add bootgen host package
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
 DEVELOPERS                     |  1 +
 package/Config.in.host         |  1 +
 package/bootgen/Config.in.host | 10 ++++++++++
 package/bootgen/bootgen.mk     | 24 ++++++++++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/bootgen/Config.in.host
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
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
new file mode 100644
index 0000000000..8ba91918f7
--- /dev/null
+++ b/package/bootgen/bootgen.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# bootgen
+#
+################################################################################
+
+BOOTGEN_VERSION = xilinx_v2022.2
+BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
+HOST_BOOTGEN_DEPENDENCIES = host-openssl
+BOOTGEN_LICENSE = Apache-2.0
+BOOTGEN_LICENSE_FILES = LICENSE
+
+BOOTGEN_EXTRA_CFLAGS = "LIBS=$(HOST_DIR)/lib/libssl.a $(HOST_DIR)/lib/libcrypto.a -ldl -lpthread"
+BOOTGEN_EXTRA_CFLAGS += "INCLUDE_USER=-I$(HOST_DIR)/include/openssl"
+
+define HOST_BOOTGEN_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(BOOTGEN_EXTRA_CFLAGS) -C $(@D)
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
