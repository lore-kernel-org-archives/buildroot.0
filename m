Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3771C02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 08:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B7DB80F55;
	Tue, 21 Jan 2025 08:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aCIdVXA9uMid; Tue, 21 Jan 2025 08:41:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 994C480FF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 994C480FF7;
	Tue, 21 Jan 2025 08:41:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ACA3E69
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 08:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C5B0416D8
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 08:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GiBw4KWhChyh for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 08:41:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=192.198.163.13;
 helo=mgamail.intel.com; envelope-from=francois.dugast@intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3332A416E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3332A416E2
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3332A416E2
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 08:41:34 +0000 (UTC)
X-CSE-ConnectionGUID: Z6Mj8PCyQj+jwrlRkJ4bdQ==
X-CSE-MsgGUID: g7EahMOTR5eBCms2CHI82g==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="40665945"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="40665945"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 00:41:34 -0800
X-CSE-ConnectionGUID: nenEVKwjQYOyuStCqBngLw==
X-CSE-MsgGUID: lVyXSgU1RFaL4BVWuv7bvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="106858158"
Received: from slindbla-desk.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.169])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 00:41:32 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.petazzoni@bootlin.com,
 Francois Dugast <francois.dugast@intel.com>
Date: Tue, 21 Jan 2025 09:41:01 +0100
Message-ID: <20250121084101.2052867-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737448895; x=1768984895;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CLm633czCy8VZUmI0rv06b95ryTyHCWNIAk92sspHhw=;
 b=G6we2ZW09WPVFKdwBjrkiJb8Y42IL7WGNzzQ8zIhOcwXUI91NJh+LuR3
 svfbQwC/xd1oh7KKxlrXgeImbUL1EghbQdJ4x+CQbu8k8IPCAXwTXuvq0
 o0b1rJRVZxDAyZP3xmkW85/GSMDLHCSSloHpssjLcTboKErQU1KEm0ruM
 Jkw0JK7Z3mZZI51DXyYPUPpj3fjG6QGL+5WS6spYGkcCwBe+Q0Fcd0W5q
 sQRiGfqEwrWgFQJgX9kggbF8AJlj/AzS4DfmSn+uan1NdFjU5zRPmvAu6
 cTLwfy4rLi2POShwfv5Y+pIbnJTdFNSaxSqiP5dqkBnm7e1x02+Kr6mjB
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=intel.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=G6we2ZW0
Subject: [Buildroot] [PATCH 1/1] package/igt-gpu-tools: add option to enable
 tests
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

Leave IGT tests disabled by default but allow users to build them with a
new Kconfig option. Those tests are helpful to sanity check GPUs on a
system.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 package/igt-gpu-tools/Config.in        | 10 ++++++++++
 package/igt-gpu-tools/igt-gpu-tools.mk |  9 +++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/igt-gpu-tools/Config.in b/package/igt-gpu-tools/Config.in
index de87bf8e99..184acb4cf1 100644
--- a/package/igt-gpu-tools/Config.in
+++ b/package/igt-gpu-tools/Config.in
@@ -24,6 +24,16 @@ config BR2_PACKAGE_IGT_GPU_TOOLS
 
 	  https://gitlab.freedesktop.org/drm/igt-gpu-tools
 
+if BR2_PACKAGE_IGT_GPU_TOOLS
+
+config BR2_PACKAGE_IGT_GPU_TOOLS_TESTS
+	bool "enable tests"
+	help
+	  Enable IGT tests, resulting in individual executables
+	  for GPU testing under /usr/libexec/igt-gpu-tools.
+
+endif
+
 comment "igt-gpu-tools needs udev /dev management and toolchain w/ NPTL, wchar, dynamic library, locale, headers >= 4.11"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || \
diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
index e3e7d4a896..bc430b6222 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.mk
+++ b/package/igt-gpu-tools/igt-gpu-tools.mk
@@ -24,8 +24,13 @@ IGT_GPU_TOOLS_DEPENDENCIES = \
 	zlib
 
 IGT_GPU_TOOLS_CONF_OPTS = \
-	-Dchamelium=disabled \
-	-Dtests=disabled
+	-Dchamelium=disabled
+
+ifeq ($(BR2_PACKAGE_IGT_GPU_TOOLS_TESTS),y)
+IGT_GPU_TOOLS_CONF_OPTS += -Dtests=enabled
+else
+IGT_GPU_TOOLS_CONF_OPTS += -Dtests=disabled
+endif
 
 # On x86 systems, libigt resolves igt_half_to_float and igt_float_to_half as
 # indirect functions at runtime by checking CPU features with igt_x86_features.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
