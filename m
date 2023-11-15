Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADBAC48BD7
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 13:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEBEB4203A;
	Wed, 15 Nov 2023 13:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEBEB4203A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XYEVhG-j2v3R; Wed, 15 Nov 2023 13:38:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AC5741F55;
	Wed, 15 Nov 2023 13:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AC5741F55
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ABA0F1BF228
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 13:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 825F340585
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 13:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 825F340585
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gt0xK_Yc0bUC for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 13:38:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78946400D0
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 13:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78946400D0
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="455166200"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="455166200"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 05:38:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="714889386"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="714889386"
Received: from omuller-mobl1.ger.corp.intel.com (HELO 559f818c8b97.intel.com)
 ([10.252.56.139])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 05:38:35 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: buildroot@buildroot.org
Date: Wed, 15 Nov 2023 13:38:21 +0000
Message-Id: <20231115133821.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700055518; x=1731591518;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WBAiE8b/h9jYHfGUgt4PEQxryhENJKkXn/yW56VVigo=;
 b=Pr6oL+I1wR9PVRRdMCZ5DdrBIuvdrZJ7GCXx6OncPnSVMEk6Me0Llk5P
 sfDG8rU97vyNcx8/XtS1J02mzyxDTSCbjsqnCtqLnqAtrDE7hRtztthoG
 UBwfEBrS5me5uDh9i2ezGKa1ZlupEKbByu5CmDqfVP2O3iIcGpFzNXXTD
 B9d2ueArvSBjdYDOzVOLdhquK2WQTg+u4L1VSvqA3X3kYvI8WnRbVM5PS
 f1sw1CQ7BWx7MJ8vcu511P+zAzrztzFZOYc8I5/AXAuHEmzXoCR1BAA1C
 si/p+oOXrs07VazK+x/8CzP3HCxyCvrXYL2swkdQs892rpFZ3n5TwrAdG
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=Pr6oL+I1
Subject: [Buildroot] [PATCH 1/1] package/libdrm/intel: Remove dependency to
 x86
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Francois Dugast <francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_LIBDRM_INTEL was dependent on BR2_i386
or BR2_x86_64, which made sense for integrated GPUs.
This is no longer valid with discrete GPUs so remove
this dependency to allow building on other CPU
architectures.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 package/libdrm/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 3cb0e02a41..fab8289be6 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -20,7 +20,6 @@ config BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 
 config BR2_PACKAGE_LIBDRM_INTEL
 	bool "intel"
-	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
 	select BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 	select BR2_PACKAGE_LIBPCIACCESS
-- 
2.42.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
