Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D6AC27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 13:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 421E260855;
	Tue, 18 Jun 2024 13:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWzjX0mo3Lmv; Tue, 18 Jun 2024 13:04:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5861A60B10
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5861A60B10;
	Tue, 18 Jun 2024 13:04:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B93421BF309
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A68184058B
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNbjSfdsLS-H for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 13:04:06 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.198.163.8;
 helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9A5564057E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A5564057E
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A5564057E
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 13:04:06 +0000 (UTC)
X-CSE-ConnectionGUID: dw9Q6r1tQU20oc8VUTzqRg==
X-CSE-MsgGUID: xnwZtlXWRHG02B+JL1Liug==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="33127256"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="33127256"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 06:04:06 -0700
X-CSE-ConnectionGUID: /K9sLGWKRzy9r8HHCzuWtQ==
X-CSE-MsgGUID: 2cnpjwD9R4G9UlDailCrog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46455956"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa003.jf.intel.com with ESMTP; 18 Jun 2024 06:04:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 829C81CB; Tue, 18 Jun 2024 16:04:03 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 16:04:01 +0300
Message-ID: <20240618130403.3387346-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718715847; x=1750251847;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=01VNq8EA7o9HzPDiWXwac4B7db502QKmgd3YixA/exI=;
 b=ddcksq6MqVLKws63Env4RktjFYmoTVf85Q1arSGZkV9gRSNqxUesBM6n
 u/0r6V5EipTxqB9C86/BcoHg+ti9d/6yt+j9t75hzMAN95fdNarA83kuK
 8ignFl/BxyK9zKbKC11XWDOrJgWTulVz0xrVmIDx5WJzU6O9UzV9xnKdF
 gLZbBhN1ClD1dlAhPmv3r21/3AhJ8wu7ee1z8wdN1xrnV9dHtimf2bqeT
 J+JFRtmIe4PkU2mtOp85Ii46hdvp7NbkJsxgozZ8YfQLGXcsO428QKuip
 7gPXMUYsKxjHEyszgaljiW3eVScrUruHuZNzyyUyOyh3L0tJvectSpjf1
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ddcksq6M
Subject: [Buildroot] [PATCH 1/3] package/tbtools: bump to version 0.4.1
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

Update to the latest release of tbtools.

This should also get rid of the couple of build errors seen on sparc64
builds.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 package/tbtools/tbtools.hash | 2 +-
 package/tbtools/tbtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
index 06705fc19d..85efbfa4ec 100644
--- a/package/tbtools/tbtools.hash
+++ b/package/tbtools/tbtools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1276ded79276d42c06a16293e26de32566c023383416fb8c91f86d141acce691  tbtools-0.4.0-cargo2.tar.gz
+sha256  d35c50063b254a561d567926fe8e5280206f6144c12f3f82e832f87392b67510  tbtools-0.4.1-cargo2.tar.gz
 sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
index fc5ffc4215..15766b67c7 100644
--- a/package/tbtools/tbtools.mk
+++ b/package/tbtools/tbtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TBTOOLS_VERSION = 0.4.0
+TBTOOLS_VERSION = 0.4.1
 TBTOOLS_SITE = $(call github,intel,tbtools,v$(TBTOOLS_VERSION))
 TBTOOLS_LICENSE = MIT
 TBTOOLS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
