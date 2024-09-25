Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F57DCCF9F6
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 20:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 161F284A27;
	Wed, 25 Sep 2024 20:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ReT1goQBW9Zs; Wed, 25 Sep 2024 20:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A47884A2A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A47884A2A;
	Wed, 25 Sep 2024 20:56:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 889D41BF340
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 20:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 849E9610C5
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 20:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRkzSPjmj1Da for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 20:56:10 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.198.163.18;
 helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 037E2606ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 037E2606ED
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 037E2606ED
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 20:56:09 +0000 (UTC)
X-CSE-ConnectionGUID: T9C1UfO9QEGZr+k3DLO7LQ==
X-CSE-MsgGUID: qtHQpeflSbCfR19kIBX6ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="25846033"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="25846033"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 13:56:09 -0700
X-CSE-ConnectionGUID: 6LV/6t07ThWg9FnWWIeqHQ==
X-CSE-MsgGUID: c0G2vQYFQV2q/COTWGKlNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="76827813"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa004.jf.intel.com with ESMTP; 25 Sep 2024 13:56:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 57785165; Wed, 25 Sep 2024 23:56:06 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: buildroot@buildroot.org
Date: Wed, 25 Sep 2024 23:55:43 +0300
Message-ID: <20240925205558.1176626-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727297770; x=1758833770;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UsLgy4nPWcl4h+PdPgJ2dTeE5usE4DdVMPJTyF9oK5A=;
 b=SiHOZdaTI+feJ8EoUR7Bq7WNOv4BZyI5Hn5PoP1mqWXTiQElFYTf38zk
 e/J7F2LRwS6l0R3eVWy1zf8WyyWLr4WirAkcgoPTXz4rLfmoV588aCRPR
 ti5qZ8CZQ9aF9hGT0LF0ZcoH1MNgzGhzDFnZeuckrI+vyJVH3yd4v2PRV
 yKASgAyRRo9fdoXScbF9Xx+AtN/3a8mIlq+Q3Wl3s+cWb4Cvysnz2I21/
 iomZaJliVpmflTt79wMMDfVgBTwVM8mbiRMFvmUDKfIRIr+hoY1CWdnUL
 HzVIA9Vox9o31veRU2IEQJliMWnOIIdwDTZ86YDTttlrwWTMAqTKt/+de
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SiHOZdaT
Subject: [Buildroot] [PATCH v1 1/1] package: Add iotools package
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andy Yan <andyshrk@163.com>, Andy Yan <andyshrk@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The iotools package provides a set of simple command line tools which
allow access to hardware device registers. Supported register interfaces
include PCI, IO, memory mapped IO, SMBus, CPUID, and MSR. Also included
are some utilities which allow for simple arithmetic, logical, and other
operations.

If you ever have to debug hardware, you could probably use these tools.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/iotools/Config.in    | 14 ++++++++++++++
 package/iotools/iotools.hash |  3 +++
 package/iotools/iotools.mk   | 21 +++++++++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/iotools/Config.in
 create mode 100644 package/iotools/iotools.hash
 create mode 100644 package/iotools/iotools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c3b1d66b016b..158313be9335 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -230,6 +230,7 @@ F:	package/sysdig/
 
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
 F:	package/fb-test-app/
+F:	package/iotools/
 
 N:	Anisse Astier <anisse@astier.eu>
 F:	package/go/
diff --git a/package/Config.in b/package/Config.in
index 5f88d1af4a73..fb90b5e273d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -535,6 +535,7 @@ endmenu
 	source "package/i7z/Config.in"
 	source "package/input-event-daemon/Config.in"
 	source "package/intel-microcode/Config.in"
+	source "package/iotools/Config.in"
 	source "package/ipmitool/Config.in"
 	source "package/ipmiutil/Config.in"
 	source "package/irda-utils/Config.in"
diff --git a/package/iotools/Config.in b/package/iotools/Config.in
new file mode 100644
index 000000000000..ffa1a3666738
--- /dev/null
+++ b/package/iotools/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_IOTOOLS
+	bool "iotools"
+	help
+	  Tools for poking all types of IO, supported are:
+	  - CMOS NVRAM (via /dev/nvram)
+	  - CPU ID (x86)
+	  - IO port (x86, PowerPC)
+	  - MMIO
+	  - MSR (x86)
+	  - PCI configuration space
+	  - SCOM (PowerPC)
+	  - SMBus
+
+	  https://github.com/andy-shev/iotools
diff --git a/package/iotools/iotools.hash b/package/iotools/iotools.hash
new file mode 100644
index 000000000000..11d7ffb73e39
--- /dev/null
+++ b/package/iotools/iotools.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  13b8b87c7d1f22b8d8f50c499af09f9414a0879d69c22393f1051ed4bf28f378  iotools-v1.7.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/iotools/iotools.mk b/package/iotools/iotools.mk
new file mode 100644
index 000000000000..6490b0cde912
--- /dev/null
+++ b/package/iotools/iotools.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# iotools
+#
+################################################################################
+
+IOTOOLS_VERSION = v1.7
+IOTOOLS_SITE = $(call github,andy-shev,iotools,$(IOTOOLS_VERSION))
+IOTOOLS_LICENSE = GPL-2.0+
+IOTOOLS_LICENSE_FILES = COPYING
+
+define IOTOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) all
+endef
+
+define IOTOOLS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/bin -D $(@D)/iotools
+	$(TARGET_STRIP) $(TARGET_DIR)/usr/bin/iotools
+endef
+
+$(eval $(generic-package))
-- 
2.43.0.rc1.1336.g36b5255a03ac

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
