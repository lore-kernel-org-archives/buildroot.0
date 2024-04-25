Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47470C4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 17:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10B6681C6E;
	Thu, 25 Apr 2024 17:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WvnVY79QmYYZ; Thu, 25 Apr 2024 17:32:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07E7382538
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07E7382538;
	Thu, 25 Apr 2024 17:32:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD18B1BF39A
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 17:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B954040B9A
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 17:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3HQfQJBRf7Qs for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 17:32:25 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.9;
 helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F2DA340650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2DA340650
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2DA340650
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 17:32:24 +0000 (UTC)
X-CSE-ConnectionGUID: JgJhkBlCQuus1WZOBn/MyA==
X-CSE-MsgGUID: 7Ovix1zmQlmpAqHbkoprZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="32267505"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="32267505"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 10:32:23 -0700
X-CSE-ConnectionGUID: KoGfy2PNS8mkGwQuW3JMxg==
X-CSE-MsgGUID: oSw8+dvSRZO2DZ4zv/xOqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="25150584"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa009.fm.intel.com with ESMTP; 25 Apr 2024 10:32:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 75BA21BD; Thu, 25 Apr 2024 20:32:20 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: buildroot@buildroot.org
Date: Thu, 25 Apr 2024 20:32:13 +0300
Message-ID: <20240425173213.3772586-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240425173213.3772586-1-andriy.shevchenko@linux.intel.com>
References: <20240425173213.3772586-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714066346; x=1745602346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lrQZpEXnA8ervUlRD6v5UPBXo9F7wBXoxKrYAvcN04g=;
 b=lrIG5XGi+tRnRxdEWcT8IDZM7F7NQRv4k50KIxwL8qXR94jboVnH5WTm
 F6XV64+oQUqdkmzj3fSym8uW2+AuvLe3RlytTQ0KQ997xyqOOEDbHLXRB
 mYUukdaRwGaqL8Vx6N1WBiwaCt5JOqTzW2pDX99kObeNiNa0RTX2YYrgi
 H1l4uqBVxXbjQa4HRPplRjkfV7n+UdnfGHinFjfrnOj7xlg6JHBfyeZrK
 +7UA6trG5N45/Ejxa4BU5ie/9JjVohLiLTYH4T6mbocou2p60xd0X6Yp3
 fdC2Rf5qO+xWr10hOz7070aCyR4Y0B65/97zeKhypM5ewsV34+5WFFTvD
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=lrIG5XGi
Subject: [Buildroot] [PATCH 2/2] package/linux-firmware: Add Intel AtomISP
 v2 firmwares
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

Many of Intel based tablets (and all phones that were designed with
Intel SoCs) have Intel AtomISP v2 engine. Add an entry for recently
added firmwares for them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 920c0a2ef16e..ce0b88ad6c2c 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -637,6 +637,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CX23885
 	  Firmware files for Conexant Cx23885/7/8 PCIe broadcast
 	  A/V decoder needed by the Linux CX23885 driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_ATOMISP
+	bool "Intel AtomISP v2"
+	help
+	  Firmware files for Intel AtomISP v2 (also know as IPU2)
+	  needed by the Linux AtomISP v2 driver.
+
 endmenu
 
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index a378e4344aaa..08d84baaaba7 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -855,6 +855,12 @@ LINUX_FIRMWARE_FILES += v4l-cx23885-avcore-01.fw
 # which is installed unconditionally
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_ATOMISP),y)
+LINUX_FIRMWARE_FILES += intel/ipu/shisp_2400b0_v21.bin
+LINUX_FIRMWARE_FILES += intel/ipu/shisp_2401a0_v21.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ivsc
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
 
 define LINUX_FIRMWARE_BUILD_CMDS
-- 
2.43.0.rc1.1336.g36b5255a03ac

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
