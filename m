Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC270C83F01
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 14:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2CE440C27;
	Thu, 31 Aug 2023 14:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2CE440C27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L7awh6ljiPpv; Thu, 31 Aug 2023 14:52:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C2B54185F;
	Thu, 31 Aug 2023 14:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C2B54185F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB9BA1BF418
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 14:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B184783449
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 14:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B184783449
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X_nvkZRyzyjA for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 14:52:08 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0A828343E
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 14:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0A828343E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAmuplAVfcGJIIfFXtfBdBfR6wOaTzKuLTunkOxjvbzrRp2HbB/wWRUKL37uTD55FgVwM4e/maIMlix/I+FeW4Smipce5fYCfQt3NF6/Gi35oUsCkKkN9WkMYBwP7GTNWYTSAaE1WQFD4ZeBJlLzLySXOEsQe+Pxugu6brLy+oqdIMIKBBpNDEDyT4qxXD6wTAqls2LH7gyFdeFXBMgTHv92ss3RbqOXH6+I1xvysYZrFjUOHtq2Gp2xBd/n4M5LsrlqUPiayYq6wYkrdJ8pXeLz6hUQAZpMVjqlXnNYFb60g8BhNUIyFbhKJ1r6OCypzzmIJTpOhZODQFH8Se5fCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fS8YCgxhXmfHUVnjdDolwMK5EBqAM1ddbZKGPl4yXvc=;
 b=Ihb0Yj0UbF0daRD1nlgLTY9zBcr4WjvXc9cUYAlwCnGLh/ehYoaIKPcfYGB/3hWKLCm6WmmkSasYm6uL7xVIPM8ywekkgVBMyLVMRpQS8owGI4ykIc/1UfV35bdDPbkoyHnDsyYEXqX7sCtLsXyl7pwIwNmWVSdZBn87j5qHFBZ5IktnAVXScIH6VW4gQJD4W6auC2dSuamcrd7YEbT4d1Zh/L8YjZIPozoH1F+zqeFl+1JZekfGTatYvBX8jp0WQ6tjSBltHWOPi/2n2NTdc956/SFFx+1b+dCUEGye4bM2indflNV6WuO0uOEaWZMYzMCyW3a8MpX62S1NOqdFtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CH2PR08CA0023.namprd08.prod.outlook.com (2603:10b6:610:5a::33)
 by MW4PR12MB6681.namprd12.prod.outlook.com (2603:10b6:303:1e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 14:52:03 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::ba) by CH2PR08CA0023.outlook.office365.com
 (2603:10b6:610:5a::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Thu, 31 Aug 2023 14:52:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.20 via Frontend Transport; Thu, 31 Aug 2023 14:52:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 09:52:00 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 31 Aug 2023 09:51:59 -0500
To: <buildroot@buildroot.org>
Date: Thu, 31 Aug 2023 15:51:37 +0100
Message-ID: <20230831145140.2537382-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831145140.2537382-1-neal.frager@amd.com>
References: <20230831145140.2537382-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|MW4PR12MB6681:EE_
X-MS-Office365-Filtering-Correlation-Id: 588d9e63-25b1-4218-b8f6-08dbaa31d6a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dWnxrYJKNowh4uI7gfM/syDTppmMEdA0Nu7Ft9HF6xSVqf1AcrX1ReDbjhRX32iRY06sF8p007c9rV8y8Ooc176gzFjC1lVbi2lvgIurDYqBN2pTjLC2MRH2cULnPCQopBCIxn0ThRWbbkabgVyuchvQJ09Nvna1sDVbiGsqTLHyAoW/q7PaWSCHTt4IS4rbIs9+2iOUnqRRYuiqjCTAkFMXQZF1kJAlBFuPNpIpEztOuyzDXCgB+bCGCdrfWUB1zdAdXvIrC9X+g3Ep6LD39krW5TqphRSexaZoeByq6SBzfX+jlKtaqqHufu+XccJ0WJsGV+j9ffD6l29GClSUxusMNGFahgdnnTWkfxNhU3lGqj3+qIL3Z3aQZaYUtc2z7AeTyjVwyU4MxTvXMxtpIXkKdAl0gs+fgDG3wzlc7kCJu4WSxUwlV2nfwpidQSaeSHi4DTXHLiPj9QzVjmAQgL89NyVeSbjNzz1C6BZLarW0MtaJ49NUB7r4H6478CmZIIMYoCouBN1N/7wBZTCXXRCQ8l1505Q/IQdccsvgUsNreFJ20D+/akohiTD/2mohIEDa7dauFomFZVrhs7UaPbkeCGfwStNBGBq8jskde+fKt6RZWo4m/rF5M3SYz0lnrXIz5YGAkAoJRC4FZjjytuVehJv45w8XhHt2G6CoWDMOFCXBJEwv1teFQ5JmS0rHE/vJHhUDgccqCqT4RMUnnFxXQEH+PgYxznmwXm69Js1FLr94zsmRm89tDv2ILBdK
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199024)(1800799009)(186009)(82310400011)(46966006)(36840700001)(40470700004)(82740400003)(6666004)(86362001)(40480700001)(1076003)(40460700003)(47076005)(36756003)(36860700001)(81166007)(2616005)(356005)(426003)(478600001)(336012)(26005)(5660300002)(54906003)(4326008)(8936002)(70206006)(44832011)(70586007)(2906002)(316002)(41300700001)(8676002)(6916009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 14:52:03.3580 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 588d9e63-25b1-4218-b8f6-08dbaa31d6a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6681
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fS8YCgxhXmfHUVnjdDolwMK5EBqAM1ddbZKGPl4yXvc=;
 b=aGaCF+jHTyUsbyLKiUBVcgoiHVojsSpLzf3mV/avrFRO3FxxmqjA0p+zDlSJxQ8lG8+ojUTidTxGLNTTVXUNQLcSLh7K5N+hMqY4HaC03IKGFA7HrE8YC7dLtawMdm6yc/59eDRWbkQ2Eq9O2eUg1VS2yyCickgyGoch2Np2geM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=aGaCF+jH
Subject: [Buildroot] [PATCH v2 3/6] package/newlib-bare-metal: new package
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
Content-Type: multipart/mixed; boundary="===============1396377208807849577=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1396377208807849577==
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

This patch adds a new package for building newlib for a bare-metal toolchain.
The cpu architecture is defined by a toolchain-bare-metal virtual package.
While any cpu architecture could be used, the default configuration will be a
Xilinx microblaze little endian architecture, so that buildroot will be able
to build the microblaze firmware applications for zynqmp and versal.

Signed-off-by: Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - removed default enable to be replaced with toolchain select config
---
 DEVELOPERS                                    |  2 ++
 package/newlib-bare-metal/Config.in.host      | 18 ++++++++++++
 .../newlib-bare-metal/newlib-bare-metal.hash  |  8 +++++
 .../newlib-bare-metal/newlib-bare-metal.mk    | 29 +++++++++++++++++++
 4 files changed, 57 insertions(+)
 create mode 100644 package/newlib-bare-metal/Config.in.host
 create mode 100644 package/newlib-bare-metal/newlib-bare-metal.hash
 create mode 100644 package/newlib-bare-metal/newlib-bare-metal.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a0b2ccfe4b..49980fe443 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1329,6 +1329,7 @@ F:	package/python-rpi-gpio/
 N:	Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
 F:	package/binutils-bare-metal/
 F:	package/gcc-bare-metal/
+F:	package/newlib-bare-metal/
 
 N:	Ignacy Gawędzki <ignacy.gawedzki@green-communications.fr>
 F:	package/angularjs/
@@ -2197,6 +2198,7 @@ F:	configs/zynqmp_zcu106_defconfig
 F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
+F:	package/newlib-bare-metal/
 F:	package/versal-firmware/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
diff --git a/package/newlib-bare-metal/Config.in.host b/package/newlib-bare-metal/Config.in.host
new file mode 100644
index 0000000000..3bbf62e3fc
--- /dev/null
+++ b/package/newlib-bare-metal/Config.in.host
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_HOST_NEWLIB_BARE_METAL
+	bool "host newlib-bare-metal"
+	help
+	  newlib-bare-metal is a host utility for a bare-metal toolchain
+
+if BR2_PACKAGE_HOST_NEWLIB_BARE_METAL
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
+
+endif #BR2_PACKAGE_HOST_NEWLIB_BARE_METAL
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


--===============1396377208807849577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1396377208807849577==--
