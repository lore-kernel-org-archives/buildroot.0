Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23600D1268A
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 11:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9670F6082E;
	Tue,  5 Nov 2024 11:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cP9MX5eEY6Tp; Tue,  5 Nov 2024 11:20:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF1D460801
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF1D460801;
	Tue,  5 Nov 2024 11:20:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3690C723
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 11:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24DEE405A0
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 11:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ku35syf5J8dt for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 11:20:42 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.198.163.19;
 helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2B6A54057C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B6A54057C
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B6A54057C
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 11:20:41 +0000 (UTC)
X-CSE-ConnectionGUID: wQJ1ZEIeTGySVpq0dJpMQA==
X-CSE-MsgGUID: gFiEqJNVRzieaqXOYIAxTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29964570"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="29964570"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 03:20:42 -0800
X-CSE-ConnectionGUID: lQ0OlKuXRA+5QWUYEy4vgA==
X-CSE-MsgGUID: 6qI6y4FwT6SYE2UsUoigDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="83873274"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa009.jf.intel.com with ESMTP; 05 Nov 2024 03:20:41 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 504491E0; Tue, 05 Nov 2024 13:20:39 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: buildroot@buildroot.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Tue,  5 Nov 2024 13:20:38 +0200
Message-ID: <20241105112039.532435-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730805642; x=1762341642;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4wIaarHu/85TnIo8q8LpKmE7Sw35wYaPZLqRxMZcBKQ=;
 b=SbGo7MlHCLrLvjykeNhLydKGNdI3QOL4ve+/ms3XFOwrO5HTkLiAzGVh
 14mEx9/HoygXXgnmsj+6mDfOcgxsBmk2dWxetVDd3x+E+1d/XLF2/y84t
 HO20/PPYEhAdsg/GhdiCg18f3zejGkewbGn4W8KjzXaTxULX3E5JVMkAV
 jXmNs0ktnrrxSPHfThZMMFn89BfQhKvikWgq+j5RHaK4T4+3eFQu1S0Zx
 rvg+FC+sU2Zdqf1lhAGZDHVXZDFPqlPqzYo2COnZ6JBeJo4A5EOnS7VnK
 sGGt545cYIFKcuxV3al7hX6FuiOuWYV53JwgLagns7hna1/GOOoW6lL0x
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SbGo7MlH
Subject: [Buildroot] [PATCH] package/tbtools: bump to version 0.4.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to the latest release of tbtools.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 package/tbtools/tbtools.hash | 2 +-
 package/tbtools/tbtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
index 85efbfa4ec..25879c2780 100644
--- a/package/tbtools/tbtools.hash
+++ b/package/tbtools/tbtools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d35c50063b254a561d567926fe8e5280206f6144c12f3f82e832f87392b67510  tbtools-0.4.1-cargo2.tar.gz
+sha256  6ec94630bc4e1afec1342cfd635d1c7da7d82f6c5f00adac61d164505c2a0717  tbtools-0.4.2-cargo2.tar.gz
 sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
index baba0e8a3b..13b2ee65f9 100644
--- a/package/tbtools/tbtools.mk
+++ b/package/tbtools/tbtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TBTOOLS_VERSION = 0.4.1
+TBTOOLS_VERSION = 0.4.2
 TBTOOLS_SITE = $(call github,intel,tbtools,v$(TBTOOLS_VERSION))
 TBTOOLS_LICENSE = MIT
 TBTOOLS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
