Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCD8C10F15
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 17:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F5B882538;
	Thu, 25 Apr 2024 17:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6X9kLMXSr2ZV; Thu, 25 Apr 2024 17:32:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D668A82F2D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D668A82F2D;
	Thu, 25 Apr 2024 17:32:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D8D2D1BF39A
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 17:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5C1240650
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 17:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3eHW8GrOaWcT for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 17:32:24 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.9;
 helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 42972400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42972400F1
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42972400F1
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 17:32:23 +0000 (UTC)
X-CSE-ConnectionGUID: InA1Y9NST4GdljHLSIVKqA==
X-CSE-MsgGUID: 3QtwQKCFTYGhEtPX3vsAsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="32267500"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="32267500"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 10:32:23 -0700
X-CSE-ConnectionGUID: eRO4N2p+Q2KgyJFgItNM9Q==
X-CSE-MsgGUID: POPjg6YjRVO4T4x8fY2nqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="25150583"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa009.fm.intel.com with ESMTP; 25 Apr 2024 10:32:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id CB2D5136; Thu, 25 Apr 2024 20:32:19 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: buildroot@buildroot.org
Date: Thu, 25 Apr 2024 20:32:12 +0300
Message-ID: <20240425173213.3772586-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714066345; x=1745602345;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2PF0XWatmY6i/s3szxjpvITX20CuP2qp7E3ZInm+/94=;
 b=ROU+LhpSICFfz57ZbiBWcKk4kexcsM67qX+KARrSra1XYp+pjIjWML08
 x90GssfNNibfv3/U4cqwjH6dxXt/6qax1vJpWbezHq/xBDQX2FUSw3eJX
 66Hg4Jt9JfOQvQV9m7Ou4dryk1jtmoBfnkaJhO2cPMTNsXgveWqddo9B2
 fMeOczgbrwMsIcNwA6c5m56LwakbX105fqsmtLDObfNYA5L4Gd3H3+RbI
 yeKM4/EmBoutlNuE+90r4hiPYoVKGe//R/YkKUb6shpcOKTQbP6vYmTMV
 hprfudY2qt+Y/TezCwpn+38iD8QhmrWqw1BgHTiCU5AkjtRPtur6LPlTB
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ROU+LhpS
Subject: [Buildroot] [PATCH 1/2] package/linux-firmware: bump version to
 20240410
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated WHENCE hash due to various new entries for new blobs.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 package/linux-firmware/linux-firmware.hash | 4 ++--
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 5a19292a74ce..6462112fea01 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  ab7caff09bbb9e68e2b8a7c3e86d32b65f6444caa4ef8b0aabca9503da2c678d  linux-firmware-20240115.tar.xz
+sha256  b7f231228439c4302be2dfb5014dad18f4a77d663a11667c08c7b8aea7580d99  linux-firmware-20240410.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -38,6 +38,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  92d477fe15d81875bc5bcc4c54df7e95b65f42e4c44d64d840f39cd0aa153d6f  WHENCE
+sha256  77a4c5cacd61e58b47af61a6bf636f7fc37b626647a2a406210ac61d0ddd9aef  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 60e8861abeea..a378e4344aaa 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20240115
+LINUX_FIRMWARE_VERSION = 20240410
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.43.0.rc1.1336.g36b5255a03ac

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
