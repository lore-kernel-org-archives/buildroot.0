Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA546C83F33
	for <buildroot@archiver.kernel.org>; Mon,  4 Sep 2023 10:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AC0F81BA8;
	Mon,  4 Sep 2023 10:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AC0F81BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vj2koWWYDpT9; Mon,  4 Sep 2023 10:06:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7750181C46;
	Mon,  4 Sep 2023 10:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7750181C46
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 810071BF215
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 10:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59D2C40407
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 10:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59D2C40407
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id diDeGSmeJ9CC for <buildroot@lists.busybox.net>;
 Mon,  4 Sep 2023 10:05:54 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB87A40328
 for <buildroot@buildroot.org>; Mon,  4 Sep 2023 10:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB87A40328
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JffBOGTOm/S2M+UJ4CbVILeGwMN3CSmmNBTQGYf/EYy4nC/pFiZ5vEqZTVEfXFpltTk7pH9uLIw6FuU0n89C2MzF1gC1Uanhx36SknVeS5HvVVFZx23YGdIhgfMIq/AnuI030bqOrg9sT4ldzKQB22Uu1mThEreYNoATn4TJYFAzHzFop/0anOAH0CMpa5kzwTuN7AO3PVZEh8rgTddz/II7B24T6DrjzYDHjRcs7zgDs7bNLc7GPEpEbgJeKE+E9zaiEuKHDhX4Wuqt3jrpUW3zuSDg2Edi89VLXouZzUOzih4YikVQJttQ18qdHrhf2VSJ1wfuVMGAzpW5CyZJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eXLE2cJ0qwgq6v4PAxmUAJq1CIoO9xycaBdzEwJ3iE=;
 b=AowbGmqBsAQWCoMWTwkrQO64yqZ8T5P8WGmme6S+sNvTuAqkL8DfOscpc7vk0vVrtx2nAVmFKQb059l8D/RLn508T3MYumIK6dUZMVYYXUsZdUrI7Tlx4LNOkD14bVljtKF0CqaK3pgLoFD92epaB/Pc7Sftl7J2WQE46pXa3eDR52cGOgVFA861IutfioFBOyTgqRMW+mObRNVar4ZNdcPu37to0nSAyZVY6djUywQ1xvsVrt2CFI8mi4fwct2oJXr7gMVHMaf09WjeRjIAKMaL7tdjXR/cMLe1UYS+t3yp4RbhB5uLkyAftpKK2A6DZ94GSwm3ULRwl2DNyBGEGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CY8PR10CA0015.namprd10.prod.outlook.com (2603:10b6:930:4f::13)
 by SA0PR12MB4528.namprd12.prod.outlook.com (2603:10b6:806:9e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 10:05:49 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:930:4f:cafe::3d) by CY8PR10CA0015.outlook.office365.com
 (2603:10b6:930:4f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Mon, 4 Sep 2023 10:05:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 10:05:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 05:04:52 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 4 Sep 2023 05:04:51 -0500
To: <buildroot@buildroot.org>
Date: Mon, 4 Sep 2023 11:04:40 +0100
Message-ID: <20230904100443.1613306-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230904100443.1613306-1-neal.frager@amd.com>
References: <20230904100443.1613306-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|SA0PR12MB4528:EE_
X-MS-Office365-Filtering-Correlation-Id: e1754021-bb7a-4051-91e4-08dbad2e8368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZZJsvSa/FnjQ6wzNgBp1/4AN4UpyY9vzkOWGewHe8S0h7/koYgmQ/RV51ntvZs4wMLneZ/gzrTEjBIDcUDjFMVUWGmrfjluyWHPhEFh7DbeMYIU+5o/JMBVnLo0HctpO4IQZb3gJOOIDVmPp8g4y+BQ61ri4MIKbAfPnUK7rKyM8HyUDlAIu80GUA6D4acrmmFFvnYDIboyLbUQSE43fkJdwbHagsXn4tTfaO9pT5r+30L+MiksIRaxO9JyYSrDv7Lml38+JdGREErQGPmGXwvHDW5HrdWDKMYwVfYj0UbNhWb/XLWdypdUA9sBR7AZ5ldnsjqsdkcgiKjGbTLxK5aBaBWlJPQ+GEKLZpa4D0XmQ1vNxnqJOpQJUcUgLuTGZQnZ8i/5anQDUBmEUVZlqP9fmb0i2pAWxm7Dbri0lO6NHoziwjj7KgumrTQ6OXiPNpLhMIuM/GjYVfYpjZwysGJoxcebRutGxvCasAAf7oALytOKgAchR0rPH0a2kzOsKXOAJmiCv8MIiEws/9KxEEwADxBrmvT/luKsYch/lxz+NUu3BjimcqAr8F24PyqtDVvJGOh9twppI3E6tTgc9hwkKasPtE8gYOjohTvZrVdY/YjtJMnaUevxOLT5cOyj4nkrXTs2EFfm4/2yBdYcJeNX0sLekwWGQYRuNsgNiattC9Y6qrm5uOPgAE7RsLIbSnbboGJ3CcnjoXVSA6muGNp2iuPekbgzQJCJ1BIquUJTJkiu0R5ol0OIx6IO4ZvUF
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(396003)(39860400002)(346002)(186009)(82310400011)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(40460700003)(26005)(2616005)(1076003)(47076005)(86362001)(81166007)(356005)(82740400003)(36756003)(36860700001)(426003)(336012)(40480700001)(44832011)(8936002)(41300700001)(6916009)(316002)(54906003)(70206006)(5660300002)(70586007)(8676002)(4326008)(2906002)(6666004)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 10:05:48.6732 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1754021-bb7a-4051-91e4-08dbad2e8368
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4528
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eXLE2cJ0qwgq6v4PAxmUAJq1CIoO9xycaBdzEwJ3iE=;
 b=dkIx8tC6dF2WRBp4aSvG/48HLRrobsfqfkVSdflSdnZxSAd/Q4xbPSHJ68RDpeFf4HOXGnth/XU3XWg4nvAEWN/D/jmFTU/xm1WMj/sWcRyuaSn/IL5y17Hee2mS7D82pvyCW+ffTtLidm7S+jq/ftZl19VHdakGQx1i5Sao1kE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dkIx8tC6
Subject: [Buildroot] [PATCH v3 3/6] package/newlib-bare-metal: new package
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
Content-Type: multipart/mixed; boundary="===============1738528565773586468=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1738528565773586468==
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
V2->V3:
 - no changes
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
index 9fc597da07..b8daa9183a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1330,6 +1330,7 @@ F:	package/python-rpi-gpio/
 N:	Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
 F:	package/binutils-bare-metal/
 F:	package/gcc-bare-metal/
+F:	package/newlib-bare-metal/
 
 N:	Ignacy Gawędzki <ignacy.gawedzki@green-communications.fr>
 F:	package/angularjs/
@@ -2198,6 +2199,7 @@ F:	configs/zynqmp_zcu106_defconfig
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


--===============1738528565773586468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1738528565773586468==--
