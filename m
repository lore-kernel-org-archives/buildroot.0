Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1182C4345F
	for <buildroot@archiver.kernel.org>; Fri, 26 Apr 2024 11:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A498613E6;
	Fri, 26 Apr 2024 11:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2U3ohzg5WmoN; Fri, 26 Apr 2024 11:38:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19D2B61403
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19D2B61403;
	Fri, 26 Apr 2024 11:38:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7968D1BF5E6
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 11:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6684F40108
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 11:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIRR2lIyjMLR for <buildroot@lists.busybox.net>;
 Fri, 26 Apr 2024 11:38:08 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.9;
 helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 457F8400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 457F8400AB
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 457F8400AB
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 11:38:08 +0000 (UTC)
X-CSE-ConnectionGUID: RrT6+YOfQTC8Ok92GIqSaQ==
X-CSE-MsgGUID: G83kysL3TImI2MoLDzIv5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="32361587"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="32361587"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 04:38:07 -0700
X-CSE-ConnectionGUID: nNeXQV3BTOGaFRO0C3+yvw==
X-CSE-MsgGUID: cBc2SAoaTL2782l5pJTp6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="30035002"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa004.fm.intel.com with ESMTP; 26 Apr 2024 04:37:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 9097E1CB; Fri, 26 Apr 2024 14:37:56 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: buildroot@buildroot.org
Date: Fri, 26 Apr 2024 14:37:56 +0300
Message-ID: <20240426113756.3962234-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714131488; x=1745667488;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nvzP+sGVWpuLxjCaYjZdI8v+uhVc0tb8oB/D1SOGj88=;
 b=Uc5Qo8XXfRTMZbSxr7gp0Hc3cKFpqBNG6UjApWsBx2dYsoTaERWVxP//
 dkuPgnzp4oTmokc9m8rqYecxGvA9qOckHg1MfC+36p5ZiSujJeqbsCUtb
 NNcCRLyrD/m/5OfeMLo8B9N3sJ1ZzSpmla0+sGBsCGT6M8z9ScqyodcAE
 sYkvTbdamBZ/UQRPpEBgpE+9E62tj1FAnf+u1lDox/qfu2SUYGLhSQXZS
 3PXuqxNwrrzkHUrG1FYT2Z3Gii9jKM18SFTuLrWV3G4f6o3SJPs6NFfYI
 oiAJG7IJQk3eSE2SF7nSdxYLQpgX8PNk5QVC7YUo0eHjoFdHBt05DNiXn
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=Uc5Qo8XX
Subject: [Buildroot] [PATCH] package/tbtools: new package
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
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a collection of tools for Linux Thunderbolt/USB4 development,
debugging and validation.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 package/Config.in          |  1 +
 package/tbtools/Config.in  |  9 +++++++++
 package/tbtools/tbtools.mk | 12 ++++++++++++
 3 files changed, 22 insertions(+)
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
index 000000000000..d2a1405eb5e8
--- /dev/null
+++ b/package/tbtools/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_TBTOOLS
+	bool "tbtools"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
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
