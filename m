Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9D2C25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 10:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7242C4015A;
	Fri, 31 May 2024 10:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSy0Aj192yaj; Fri, 31 May 2024 10:05:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DBD64044B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DBD64044B;
	Fri, 31 May 2024 10:05:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3B51BF3CB
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 10:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08F16606C7
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 10:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DhlXvsvVc7ja for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 10:05:23 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.10;
 helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2684B605FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2684B605FE
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2684B605FE
 for <buildroot@buildroot.org>; Fri, 31 May 2024 10:05:22 +0000 (UTC)
X-CSE-ConnectionGUID: ZAaVIdfNR82RXmxtZWe9Zw==
X-CSE-MsgGUID: cBI77lmySiGAVsGHWsCKew==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="31182625"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="31182625"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 03:05:22 -0700
X-CSE-ConnectionGUID: Jm9u6IPQQfGPSqxUzPxRqQ==
X-CSE-MsgGUID: p+th9gEQS52mOHcWoh7wqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="36217360"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa009.fm.intel.com with ESMTP; 31 May 2024 03:05:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id DED6E1A3; Fri, 31 May 2024 13:05:19 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 13:05:19 +0300
Message-ID: <20240531100519.1273674-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717149924; x=1748685924;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OFRGANf8zoBtg8fIt1bLJqv9GIHJ8LbYW4Qe+DtxIM4=;
 b=OTt7DOolvH1Qm+adFEl93ROjeJ5ilWv0GHNUjGY4Q457T5jRgmyzybug
 r/GitJ7DQe2umrBCS0vtvZRdTcEkJGa9B6chg4WELKDFrcqM6jDJ5nVn8
 XZfVY4wZ+uLUchoJp8OXVMlOZ8rDJy983eY5ikgQUy7ItBBZkMY82xDom
 TtvTbwa2xGk1PsSg7d5AmRxZ7Aptj/M4u5NC5EIzUYGgvMm3rlwoGzRBM
 7tjpg3VPMU7s86RCZy6AGQHMpFfXvrpcRKLDVNfMpYVmSxbHpTpSs/Dkl
 Ei0+Afn/uDhnLuPS/Rw60nE8yGs1MRdJ2zc325VJspSQW7jl/Rcna7KNr
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OTt7DOol
Subject: [Buildroot] [PATCH] package/tbtools: bump to version 0.4.0
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

Update against the latest release of tbtools.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 package/tbtools/tbtools.hash | 2 +-
 package/tbtools/tbtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
index ebd838ebe1..06705fc19d 100644
--- a/package/tbtools/tbtools.hash
+++ b/package/tbtools/tbtools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e5ddbcb3dcf6315a1fe6fe2d4846b5208e75f24e626d43a0ea68358e8b15dba7  tbtools-0.3.2-cargo2.tar.gz
+sha256  1276ded79276d42c06a16293e26de32566c023383416fb8c91f86d141acce691  tbtools-0.4.0-cargo2.tar.gz
 sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
index 36bfcd7f49..fc5ffc4215 100644
--- a/package/tbtools/tbtools.mk
+++ b/package/tbtools/tbtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TBTOOLS_VERSION = 0.3.2
+TBTOOLS_VERSION = 0.4.0
 TBTOOLS_SITE = $(call github,intel,tbtools,v$(TBTOOLS_VERSION))
 TBTOOLS_LICENSE = MIT
 TBTOOLS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
