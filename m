Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB63C2BA18
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 13:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B32F60B68;
	Tue, 18 Jun 2024 13:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54QwOgCHOxWW; Tue, 18 Jun 2024 13:06:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05EAB60730
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05EAB60730;
	Tue, 18 Jun 2024 13:06:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F14821BF3BB
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB8D281EAC
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9OMjxyUgdaT for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 13:06:06 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.21;
 helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D2EC81EEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D2EC81EEC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D2EC81EEC
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 13:06:06 +0000 (UTC)
X-CSE-ConnectionGUID: S9YBz7BWQBOrY3/RFItpPQ==
X-CSE-MsgGUID: nHdZ4TlORly7W3uxHt/Bzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15558721"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15558721"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 06:04:06 -0700
X-CSE-ConnectionGUID: WeOjbVJESqGV8fZpIh4aZw==
X-CSE-MsgGUID: X1UbRdW7SRKsOQplnxxd3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="72753104"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2024 06:04:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 9A2FCA5; Tue, 18 Jun 2024 16:04:03 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 16:04:03 +0300
Message-ID: <20240618130403.3387346-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618130403.3387346-1-mika.westerberg@linux.intel.com>
References: <20240618130403.3387346-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718715967; x=1750251967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0pF4N4KLf+JPfq6C8bfIVwa1LtzhPR9p7GbqBQ3pC+E=;
 b=dtB72Q7d62HWIvRRlwvQkcI7CreLqIX4FoBSJfbBiK/1JBaTENrGIKta
 yWVeZMEHikc/Iyr3dv4yU2zXBBaIlPmwRfkiTfr7eN4e53atNkiiqpWiR
 dF7doEKz1op3Z6YnT3h86+zbj7NK7gt9jTO4WjijrfiynDqgxnstcmV2h
 CVT5l3GHn6RKOyFznJ/nQXaYiiPIVhaMIwoGp154Om+Rd0bRSBjgvH/W2
 R8gAckH0qT6B8LOmuN/GgHuOySOvR55M137H3MFLc+ecqJoQFMI8F4lE/
 cTWpKKOWJB5A6OAICIsWnu4SQ+EDRRufTx9/tOQatM7U4RK5mcLNvcw3B
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=dtB72Q7d
Subject: [Buildroot] [PATCH 3/3] package/tbtools: Allow 32-bit builds
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

With the latest tbtools 32-bit builds should work too so drop this
limitation.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 package/tbtools/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/tbtools/Config.in b/package/tbtools/Config.in
index 9c27bf0e30..0a649a9555 100644
--- a/package/tbtools/Config.in
+++ b/package/tbtools/Config.in
@@ -3,8 +3,6 @@ config BR2_PACKAGE_TBTOOLS
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_HAS_UDEV
-	# Fails to build on 32-bit systems
-	depends on BR2_ARCH_IS_64
 	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  tbtools is a collection of tools for Linux Thunderbolt/USB4
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
