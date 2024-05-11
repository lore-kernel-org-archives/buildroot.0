Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A983C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 08:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04D03606AF;
	Sat, 11 May 2024 08:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e53OwW-WRUwq; Sat, 11 May 2024 08:06:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCAA560843
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCAA560843;
	Sat, 11 May 2024 08:06:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CFB7E1BF57B
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 08:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC4AF60843
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 08:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BZhBIjR36S3 for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 08:06:15 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.198.163.16;
 helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BA6A4606AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA6A4606AF
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA6A4606AF
 for <buildroot@buildroot.org>; Sat, 11 May 2024 08:06:15 +0000 (UTC)
X-CSE-ConnectionGUID: ELQva1STSYepqB1ECqNb/w==
X-CSE-MsgGUID: 4PvnCzD/QD2wcWJV7lVXcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11481340"
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; d="scan'208";a="11481340"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2024 01:06:15 -0700
X-CSE-ConnectionGUID: wfsT+eWcQeienpUw0vaK5g==
X-CSE-MsgGUID: 65xtd2PiRSeXw+ARbCdBCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; d="scan'208";a="29886868"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa006.fm.intel.com with ESMTP; 11 May 2024 01:06:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 43C60142; Sat, 11 May 2024 11:06:12 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 11:06:12 +0300
Message-ID: <20240511080612.2602362-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715414776; x=1746950776;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PBDSAZE6SOrLn7tcHvZ2j+OXqfwBFEShSYpwPKI2ing=;
 b=VLh7RiGqhdbm9koADFbgdJXReBGUKWajJgoNncrel90ZUlbv9uprN1Al
 we24p90RhzzVwepq/Le6OByxKGaaF7EeLoUaEeRPv6r620ekvzv9ZbSFe
 M96OxBDQ+C2y1Fkh9wzHFDk8CdWW1IDDG8Nh90H1UCdr7v9LOXdbKDYzb
 QP6KTLfpzjKz0811kAha5JODdGJe62Lqdu+L3bbRyxNWNI8iEGi+9it46
 mgV54fiMyZEHYvhbluhfAVLoQ/A9z7AdIT2fUe9mciLATsCV97QtSBai7
 qkuoaXqLpPrbyL8KkxI92o4wxfJGnxadqzyezOZM72eWPxkLdGFQN7EaP
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=VLh7RiGq
Subject: [Buildroot] [PATCH v3] package/tbtools: new package
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
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Aapo Vienamo <aapo.vienamo@linux.intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a collection of tools for Linux Thunderbolt/USB4 development,
debugging and validation.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
---
Changes from v2:

  - Added entry to DEVELOPERS
  - Added comment about 32-bit build failure
  - Added Config.in comment
  - Added TBTOOLS_DEPENDENCIES to tbtools.mk
  - Added dependency to glibc

The previous version of the patch can be found here:

  https://lore.kernel.org/buildroot/20240430045945.2164313-1-mika.westerberg@linux.intel.com/

 DEVELOPERS                 |  3 +++
 package/Config.in          |  1 +
 package/tbtools/Config.in  | 18 ++++++++++++++++++
 package/tbtools/tbtools.mk | 13 +++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/tbtools/Config.in
 create mode 100644 package/tbtools/tbtools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f6fc301373ad..c183e9f68067 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2255,6 +2255,9 @@ N:	Michel Stempin <michel.stempin@wanadoo.fr>
 F:	board/sipeed/licheepi_zero/
 F:	configs/sipeed_licheepi_zero_defconfig

+N:	Mika Westerberg <mika.westerberg@linux.intel.com>
+F:	package/tbtools/
+
 N:	Mike Frampton <mikeframpo@gmail.com>
 F:	package/qcom-db410c-firmware/

diff --git a/package/Config.in b/package/Config.in
index cdbf3577f8e1..e346917649a8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -157,6 +157,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/stress-ng/Config.in"
 	source "package/sysdig/Config.in"
 	source "package/sysprof/Config.in"
+	source "package/tbtools/Config.in"
 	source "package/tcf-agent/Config.in"
 	source "package/trace-cmd/Config.in"
 	source "package/trinity/Config.in"
diff --git a/package/tbtools/Config.in b/package/tbtools/Config.in
new file mode 100644
index 000000000000..9c27bf0e30ee
--- /dev/null
+++ b/package/tbtools/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_TBTOOLS
+	bool "tbtools"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_HAS_UDEV
+	# Fails to build on 32-bit systems
+	depends on BR2_ARCH_IS_64
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  tbtools is a collection of tools for Linux Thunderbolt/USB4
+	  development, debugging and validation.
+
+	  https://github.com/intel/tbtools
+
+comment "tbtools needs udev /dev management w/ glibc toolchain"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_ARCH_IS_64
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
new file mode 100644
index 000000000000..94340616db62
--- /dev/null
+++ b/package/tbtools/tbtools.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# tbtools
+#
+################################################################################
+
+TBTOOLS_VERSION = v0.3.2
+TBTOOLS_SITE = $(call github,intel,tbtools,$(TBTOOLS_VERSION))
+TBTOOLS_LICENSE = MIT
+TBTOOLS_LICENSE_FILES = LICENSE
+TBTOOLS_DEPENDENCIES = udev
+
+$(eval $(cargo-package))
--
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
