Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C50C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 17:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7D43822E9;
	Wed, 30 Aug 2023 17:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7D43822E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cPEod8Kdezfq; Wed, 30 Aug 2023 17:33:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 066E182335;
	Wed, 30 Aug 2023 17:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 066E182335
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B7221BF426
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 17:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54975822E9
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 17:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54975822E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SOcXJHcRj47Z for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 17:33:10 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A27F81F2B
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 17:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A27F81F2B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RY9FCv/fjmTycKv0FJwhMSK3y0M/WGd/h+fcnJnJTV62k8iMOMlAJdZn4USNC6XUEfPufm1z1hlAld9bFIkFgRbN/BAHVOieNVufOzj8PvJliK7tH8RAPrGk1rHueeT6A44PR5fErSn5Yao7WmPKXBnPKNoEsemwQ5M6rdc89JyySO/HOmzdUAys3DXl7rXBDT4SaaPoXk8psIjoi/Etmv8IRCpUwJqz87MY5DQmU1o56xdc4WfQICvsnIdOK5xH3hRL+r16mUkPdS42odcQFpArgFkQKVkykuC66hwe44HzjhAoEEBDOa21Vc7n/qVfy0WRHKnqULUFtAEMYs5tDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxpeFNsz5hGSMuG0i/Sd/Key3BNts2clstdcXAyGVbg=;
 b=S+RtaFptXe0Oo3jmTUhiZtpL0nuD/VHkXeXq/ivBRp4WGR4UD9zzvIEKmjvg4qXW8pv2tzimQvUhYXRfYVOi7Bw/0xt8el44uaTQ6Ay/RAD7fwfjq9H9H4pzkbEpdyiu1PitOWPDJBfgL3I7mQnDioaDgNLcxUL6k/GfCMwpWwxte60srhSQpWZ9oXr7a5hU/BokoYg+I8XtkXfNSiAKsDhuEpW/m77o8M4RltXTnnjqQ0IYlcBZcbOitoqUIx9mxHl9+4kqfa3d+/I7m1h+9nMmi0drQM6nGvpZBG5sAj6Mkw5pqycvjIiACjNC9yW4n5UnNV4KBHhMZX+rjg+0Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from SJ0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:a03:33b::10)
 by IA0PR12MB8205.namprd12.prod.outlook.com (2603:10b6:208:400::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 17:33:06 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::75) by SJ0PR05CA0005.outlook.office365.com
 (2603:10b6:a03:33b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.17 via Frontend
 Transport; Wed, 30 Aug 2023 17:33:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Wed, 30 Aug 2023 17:33:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 30 Aug
 2023 12:33:05 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 30 Aug 2023 12:33:04 -0500
To: <buildroot@buildroot.org>
Date: Wed, 30 Aug 2023 18:32:54 +0100
Message-ID: <20230830173255.1620616-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230830173255.1620616-1-neal.frager@amd.com>
References: <20230830173255.1620616-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|IA0PR12MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d527aa-0db4-4f7f-f97c-08dba97f2b78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oCR+0yvNON+HV1qMxMxFC0SsH0W/0vPSq0NosYwzfyNEFFTnPr7thwX431k/ZliiUQjLI6ialdEZ9Nsg6XDOCMh/dHDskzNZfFS0hbx7us/lnLsT2gp97G4a6aEZwex0c1ryueM2D1c4B1rL2plABtqEzL0+89dSU4EP2uwm6NSK/Lux2O7cyk56d0XtBuxeABk7sjWW/UC8yr9o1cm8imLElxintGDxrj5g8wXCzDTsxoPrB2nE3KvWEJPmfLG7Bo9wPmxer1TFrvaCpFbHdQr73vSXuHWUWvv2XscY5lPjLU4E6KLkfbTvhIrPvZR6shgoUUOsY7XJY1REO12Uo+0qwXMCqFTrV7eOskemkmAH0R4E+HMYtGtzyLW1iEn1JLaM7XNGyq7a0RvwyM4JRwnmA85htZJbinuFy6PQ8cO4XvxGO8JmgrUphYFqs8I+l0qk2ffAJgSeOhxnGLgrgff/J6RgaUTgX6wTX8dgg9FUhAuQdPIALJ4ydr8upA6yYkEG4TzUdWCsu4DU3lxy0lViqlEdBfc3l34T0CNL8hmaRQ1wPGH+LF/cZrCFeEl3DEwBUQu8w3zNK50UyqMI06ryVLbysB/AgupLH+IW72p7v3woVbLsLo7Dua4kX6qhToNY7akN3Ff5DQMJtBnWUO2DQrqYIljhVZYQD7hcXJzn4PzOuG/Hbs3YhrT7HXx49RmvDnkNK8AdMETQy8jnS/Q81JO1atW2tV/yJUp2G9CiK9sV+IkF0d1EiQCal95L
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199024)(186009)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(6666004)(2616005)(1076003)(40480700001)(54906003)(8936002)(5660300002)(2906002)(86362001)(36756003)(70206006)(6916009)(4326008)(41300700001)(70586007)(316002)(44832011)(8676002)(40460700003)(356005)(83380400001)(82740400003)(478600001)(81166007)(36860700001)(47076005)(26005)(426003)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 17:33:05.6783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d527aa-0db4-4f7f-f97c-08dba97f2b78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8205
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxpeFNsz5hGSMuG0i/Sd/Key3BNts2clstdcXAyGVbg=;
 b=SPprrFtld+NjaL3Vj66ho6wc3MfDh9g32XSyrcujBKyGsWUpYjIHxhq4+CfjVZQwtAWhaitJ7mGJe+cogXx+hrnhWjCAK1ym4kZaic2xc0RjhBUJGeaOgNNZskbKqvYEJzuPn4NkjxuORBRXjK7C3ABO65tpfzIuFDwaw3z4k0k=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SPprrFtl
Subject: [Buildroot] [PATCH v1 3/4] package/newlib-bare-metal: new package
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

This patch adds a new package for building newlib for a bare-metal toolchain.
The cpu architecture is defined by a toolchain-bare-metal virtual package.
While any cpu architecture could be used, the default configuration will be a
Xilinx microblaze little endian architecture, so that buildroot will be able
to build the microblaze firmware applications for zynqmp and versal.

Signed-off-by: Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS                                    |  2 ++
 package/newlib-bare-metal/Config.in.host      | 15 ++++++++++
 .../newlib-bare-metal/newlib-bare-metal.hash  |  8 +++++
 .../newlib-bare-metal/newlib-bare-metal.mk    | 29 +++++++++++++++++++
 4 files changed, 54 insertions(+)
 create mode 100644 package/newlib-bare-metal/Config.in.host
 create mode 100644 package/newlib-bare-metal/newlib-bare-metal.hash
 create mode 100644 package/newlib-bare-metal/newlib-bare-metal.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4c95686287..85237c353a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1326,6 +1326,7 @@ F:	package/mrp/
 N:	Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
 F:	package/binutils-bare-metal/
 F:	package/gcc-bare-metal/
+F:	package/newlib-bare-metal/
 
 N:	Ian Haylock <haylocki@yahoo.co.uk>
 F:	package/python-rpi-gpio/
@@ -2197,6 +2198,7 @@ F:	configs/zynqmp_zcu106_defconfig
 F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
+F:	package/newlib-bare-metal/
 F:	package/versal-firmware/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
diff --git a/package/newlib-bare-metal/Config.in.host b/package/newlib-bare-metal/Config.in.host
new file mode 100644
index 0000000000..c99766b75f
--- /dev/null
+++ b/package/newlib-bare-metal/Config.in.host
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_HOST_NEWLIB_BARE_METAL
+	bool "host newlib-bare-metal"
+	default "y" if BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL
+	help
+	  newlib-bare-metal is a host utility for a bare-metal toolchain
+
+config BR2_PACKAGE_HOST_NEWLIB_BARE_METAL_VERSION
+	string
+	default "4.1.0"
+
+config BR2_PACKAGE_HOST_NEWLIB_BARE_METAL_EXTRA_CONFIG_OPTIONS
+	string "Additional newlib options"
+	default ""
+	help
+	  Any additional newlib options you may want to include.
diff --git a/package/newlib-bare-metal/newlib-bare-metal.hash b/package/newlib-bare-metal/newlib-bare-metal.hash
new file mode 100644
index 0000000000..b1966c3055
--- /dev/null
+++ b/package/newlib-bare-metal/newlib-bare-metal.hash
@@ -0,0 +1,8 @@
+# Locally calculated (fetched from Github)
+sha256  f296e372f51324224d387cc116dc37a6bd397198756746f93a2b02e9a5d40154  newlib-4.1.0.tar.gz
+
+# Hashes for license files
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
+sha256  f3b7f3e4426b1fa6f60198dae7adfedd94b77b28db2d108adc0253575011e0ff  COPYING.LIBGLOSS
+sha256  422aa40293093fb54fc66e692a0d68fd0b24ed5602e5d1d33ad05ba3909057e9  COPYING.NEWLIB
diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
new file mode 100644
index 0000000000..a0a22bd6d9
--- /dev/null
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# newlib-bare-metal
+#
+################################################################################
+
+HOST_NEWLIB_BARE_METAL_VERSION = $(call qstrip,$(BR2_PACKAGE_HOST_NEWLIB_BARE_METAL_VERSION))
+ifeq ($(HOST_NEWLIB_BARE_METAL_VERSION),)
+HOST_NEWLIB_BARE_METAL_VERSION = 4.1.0
+endif
+
+HOST_NEWLIB_BARE_METAL_SITE ?= ftp://sourceware.org/pub/newlib
+HOST_NEWLIB_BARE_METAL_SOURCE ?= newlib-$(HOST_NEWLIB_BARE_METAL_VERSION).tar.gz
+HOST_NEWLIB_BARE_METAL_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_PACKAGE_HOST_NEWLIB_BARE_METAL_EXTRA_CONFIG_OPTIONS))
+HOST_NEWLIB_BARE_METAL_DEPENDENCIES = host-gcc-bare-metal
+
+HOST_NEWLIB_BARE_METAL_CONF_OPTS = \
+	--target=$(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH)-elf \
+	CC_FOR_TARGET=$(HOST_DIR)/bin/$(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH)-elf-gcc \
+	AR_FOR_TARGET=$(HOST_DIR)/bin/$(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH)-elf-ar \
+	RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH)-elf-ranlib \
+	--enable-newlib-io-c99-formats \
+	--enable-newlib-io-long-long \
+	--enable-newlib-io-float \
+	--enable-newlib-io-long-double \
+	--disable-multilib \
+	$(NEWLIB_BARE_METAL_EXTRA_CONFIG_OPTIONS)
+
+$(eval $(host-autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
