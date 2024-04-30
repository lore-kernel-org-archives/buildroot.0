Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EB0C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 04:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 395CB8194A;
	Tue, 30 Apr 2024 04:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8tospG5dWLd; Tue, 30 Apr 2024 04:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 343D1819F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 343D1819F8;
	Tue, 30 Apr 2024 04:59:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80BB01BF20D
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 04:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B1BE60851
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 04:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wnf3XXy9xFYZ for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 04:59:48 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.19;
 helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7937160843
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7937160843
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7937160843
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 04:59:48 +0000 (UTC)
X-CSE-ConnectionGUID: sB/Z1C8sSzKlr1jiSqVusw==
X-CSE-MsgGUID: ysaXrT6PRweIDRiZM1Vu8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10001403"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="10001403"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 21:59:48 -0700
X-CSE-ConnectionGUID: 4QaotKl6RjOiYv28sPivKA==
X-CSE-MsgGUID: WzQjirIaQBmTHFvvxcoShA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="31035097"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa003.jf.intel.com with ESMTP; 29 Apr 2024 21:59:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 4894E194; Tue, 30 Apr 2024 07:59:45 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: buildroot@buildroot.org
Date: Tue, 30 Apr 2024 07:59:44 +0300
Message-ID: <20240430045945.2164313-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714453189; x=1745989189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=azzhStleMNNyX4xqn81lrIX8WamZscflQB5v8V3EUFU=;
 b=gBI4NaeCv4nsZnu6yOTOelZg3l6UOqUwpI9Tf/VnR7ak741UVmwux3qR
 IEqjA6FA0amzHIe8k/e8omCgqjRQFQk2bfYnUeUa2OVkRXVoNOQ5z+hlB
 zXks1qFVAqk34WY/4Ro/+oiPSPTM2KfW6uA8YVecaJ6WUfubU0eWUO3X6
 JTynh1KVAYfWqx8iLtXL+2ZN/BOhUFmSWupL5qD+iqvo+p4+YxR1PB+75
 YuVvSy9CrAm2mcCpKng2t+qQrczVbfjZXZUrXKnoKUm/J9ckYYBEN08jF
 luFjWqt+bypXRGV1djhd5+ccjvCC2qKwJzpuxoGKEgS1GxScHW3oOb98O
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=gBI4NaeC
Subject: [Buildroot] [PATCH v2] package/tbtools: new package
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
 Aapo Vienamo <aapo.vienamo@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a collection of tools for Linux Thunderbolt/USB4 development,
debugging and validation.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
---
Changes from v1:

- Added dependency to udev (libudev) and 64-bit builds.
- Added tag from Aapo.

 package/Config.in          |  1 +
 package/tbtools/Config.in  | 11 +++++++++++
 package/tbtools/tbtools.mk | 12 ++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/tbtools/Config.in
 create mode 100644 package/tbtools/tbtools.mk

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
index 000000000000..2627ea8bfcca
--- /dev/null
+++ b/package/tbtools/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_TBTOOLS
+	bool "tbtools"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_ARCH_IS_64
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  tbtools is a collection of tools for Linux Thunderbolt/USB4
+	  development, debugging and validation.
+
+	  https://github.com/intel/tbtools
diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
new file mode 100644
index 000000000000..61986ca8d311
--- /dev/null
+++ b/package/tbtools/tbtools.mk
@@ -0,0 +1,12 @@
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
+
+$(eval $(cargo-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
