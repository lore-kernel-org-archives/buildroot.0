Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F16D59F60
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 18:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41B976072E;
	Wed,  6 Nov 2024 18:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7LHs73H1TUx; Wed,  6 Nov 2024 18:49:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5072760776
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5072760776;
	Wed,  6 Nov 2024 18:49:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31C8D27D1
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 18:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F66140735
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 18:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GLKaSpUw2rD for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 18:48:59 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.19;
 helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 142DE40732
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 142DE40732
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 142DE40732
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 18:48:58 +0000 (UTC)
X-CSE-ConnectionGUID: NysYpGI2TaiTVjVJyg1L6Q==
X-CSE-MsgGUID: FGVsccOeQdWudkBdc/gfcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30593485"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30593485"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 10:48:58 -0800
X-CSE-ConnectionGUID: B43fFZENQUWQh/skLtYpDQ==
X-CSE-MsgGUID: +LY7rpDNRuG4nXgUQ6oYOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="115490159"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa001.fm.intel.com with ESMTP; 06 Nov 2024 10:48:56 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 3AD8F488; Wed, 06 Nov 2024 20:48:54 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: buildroot@buildroot.org
Date: Wed,  6 Nov 2024 20:48:41 +0200
Message-ID: <20241106184841.1053511-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730918939; x=1762454939;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4qKZJt2XVMv5+TmzRJOmPS9H0+rFUry02brx62IS/yI=;
 b=IdWMzxZCt99jMGu3YTKURkNZdpm9W+HZj5Y5ikMMVG3jw07wBzeqdsKn
 KR0z223eWBEj/80J6mXdF1+NgxNJfKVcqjB/xYtO1zF6H/oOSY6Jn+FPZ
 esraddzKww7RgkDuyyXdPPLGYgdlI6CGqeRseZDYj6yaGk0wDWgT27CZq
 c0YeN7035wylqhEAouw3COwNq+fyvm82gqVCWrjNF/rId4/pCkKQFXQwR
 qDtbyxT2xmhl+eqs/5NAnwEKG2r3AcZz14362nCoy5DKWy7XVK8gvcJ6/
 rdHawol6dTMONSChByZarykc3uiV+dGeRoQWAlPm8iDKXQen/apLnFxfl
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IdWMzxZC
Subject: [Buildroot] [PATCH v1 1/1] package/iotools: Update to v1.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Andy Yan <andyshrk@gmail.com>, Andy Yan <andyshrk@163.com>,
 Aaron Sierra <aaron@bubbl-tek.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is minor update to iotools to fix some issues Aaron noticed and
addressed. The bigger change will come later with better integration
with the regular build systems (CMake).

Cc: Aaron Sierra <aaron@bubbl-tek.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 package/iotools/iotools.hash | 2 +-
 package/iotools/iotools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iotools/iotools.hash b/package/iotools/iotools.hash
index 11d7ffb73e39..48d347bb3c11 100644
--- a/package/iotools/iotools.hash
+++ b/package/iotools/iotools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  13b8b87c7d1f22b8d8f50c499af09f9414a0879d69c22393f1051ed4bf28f378  iotools-v1.7.tar.gz
+sha256  9cb6184030b2e5c2e6a7c7a2d016d29d42d4075a77e1ba982bdc3cd919491faf  iotools-v1.8.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/iotools/iotools.mk b/package/iotools/iotools.mk
index 03b87c89e9d0..f5e322eab818 100644
--- a/package/iotools/iotools.mk
+++ b/package/iotools/iotools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IOTOOLS_VERSION = v1.7
+IOTOOLS_VERSION = v1.8
 IOTOOLS_SITE = $(call github,andy-shev,iotools,$(IOTOOLS_VERSION))
 IOTOOLS_LICENSE = GPL-2.0+
 IOTOOLS_LICENSE_FILES = COPYING
-- 
2.43.0.rc1.1336.g36b5255a03ac

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
