Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0245C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 13:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8490060B60;
	Tue, 18 Jun 2024 13:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHxOsRMg-3C5; Tue, 18 Jun 2024 13:06:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4654B60730
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4654B60730;
	Tue, 18 Jun 2024 13:06:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C0E21BF3BB
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56FCA82039
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZ1XnRJQciQz for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 13:06:05 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.21;
 helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9CF2B81EAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CF2B81EAC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CF2B81EAC
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 13:06:05 +0000 (UTC)
X-CSE-ConnectionGUID: f1lPsPWGT3ieGe+0GGI5Yw==
X-CSE-MsgGUID: DZsqHCPGTuGNP3CSWC2Veg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15558719"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15558719"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 06:04:06 -0700
X-CSE-ConnectionGUID: oIhB1dmxTDaKKm1m5G8mmA==
X-CSE-MsgGUID: yzFVkH11TR6JkVh6eJgPjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="72753101"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2024 06:04:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id A442226D; Tue, 18 Jun 2024 16:04:03 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 16:04:02 +0300
Message-ID: <20240618130403.3387346-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618130403.3387346-1-mika.westerberg@linux.intel.com>
References: <20240618130403.3387346-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718715966; x=1750251966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9kHxd8Br32EcJMhgMceUe8UyXi7jMaE1LRBGIV7dF/A=;
 b=ThaaL3xban1Hx0Iyiaro3Z0/1uugAtewJNxtFUpNp8D/Jmyh9rkw2+yc
 NW2TNxephG6sfcTpYF0RRp5onpCLQHJ/eYK6CtLexiRJNS5WiEe/xdlIx
 uBiPi1VGHBnIaZ5KwFJuR2/7bYa/CM1Baw2RABldiY/Q6k7BZO6Mp0JvW
 XAx1gR78h7QxyS9NriuTIItUHyCdATemLLYdCLs81JK1+1ZboDSHhru/I
 Nda3hkZ8+MDg1noVwdzTAbyEE+rZEy4ZyKtbWKGM3JcPl796PaeQsP5aK
 2AGrzZkWgm7pad478byY+OvjxsQGdOJFK1xWvlfUfxgZ9hwBMnph8PAmE
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ThaaL3xb
Subject: [Buildroot] [PATCH 2/3] package/tbtools: Install bash completion
 files and scripts
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

Add hooks to install the bash completion files and scripts provided by
the package.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 package/tbtools/tbtools.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
index 15766b67c7..baba0e8a3b 100644
--- a/package/tbtools/tbtools.mk
+++ b/package/tbtools/tbtools.mk
@@ -10,4 +10,16 @@ TBTOOLS_LICENSE = MIT
 TBTOOLS_LICENSE_FILES = LICENSE
 TBTOOLS_DEPENDENCIES = udev
 
+define TBTOOLS_INSTALL_SCRIPTS
+	$(MAKE) -C $(@D) PREFIX=$(TARGET_DIR)/usr install-scripts
+endef
+TBTOOLS_POST_INSTALL_TARGET_HOOKS += TBTOOLS_INSTALL_SCRIPTS
+
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+define TBTOOLS_INSTALL_COMPLETION
+	$(MAKE) -C $(@D) PREFIX=$(TARGET_DIR)/usr install-completion
+endef
+TBTOOLS_POST_INSTALL_TARGET_HOOKS += TBTOOLS_INSTALL_COMPLETION
+endif
+
 $(eval $(cargo-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
