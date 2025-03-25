Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999E8C35FFC
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 09:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F31A81926;
	Tue, 25 Mar 2025 09:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hiG-cmN9P6Z0; Tue, 25 Mar 2025 09:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71D1B81F33
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71D1B81F33;
	Tue, 25 Mar 2025 09:21:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D4B5C0
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 09:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6712C4074F
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 09:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbKbC854X3X4 for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 09:21:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=192.198.163.16;
 helo=mgamail.intel.com; envelope-from=francois.dugast@intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A1A1406F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A1A1406F4
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A1A1406F4
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 09:21:52 +0000 (UTC)
X-CSE-ConnectionGUID: s5RHk9+zRlOPG9HuSWuKWg==
X-CSE-MsgGUID: fOSyYOukRLi6v6x0kgmiNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="31733947"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="31733947"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:21:52 -0700
X-CSE-ConnectionGUID: uqmCJzFET8uiQLSGRieEow==
X-CSE-MsgGUID: JEik8g3sQbW3k1rxFZBz8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="129416202"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.119])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:21:50 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: buildroot@buildroot.org
Date: Tue, 25 Mar 2025 10:21:14 +0100
Message-ID: <20250325092115.2588697-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742894514; x=1774430514;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=obQofVLAIQEIPd4YMoYUDFrnzGB/xCyvoM0+eKCI+/c=;
 b=N+g9O//s1QNZJKcySmX/Ck7tzp0ApDfANBkUEOlcAlOGf/a0io2clCzW
 hUP72uypN2QqSOUWqjUGnJgNvz4ZjOO98/Uc+l3askCKC2FANd3/qbWM3
 SerOrF7bcQS+lC1stdIDlMGgi0TXg0tUwVt8UvaC/fm8BeCNGqPmv/BKO
 fUr4RL/QEPs4yBCV5RyrP7NM+ETx7tHwVKMUy7kqW6k4cF2uCblGPUzzA
 yT45VbANKL5XKbC+VFWCS6Kki0kEreQabfJc0U1MiGconwF6TCT3e0Cmd
 a3XtRTY1ngz+DkgG2KFBr8BoQ5qIv+aiQQ3UHpS7azBu6uej4UnM5qVS2
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=intel.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=N+g9O//s
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: add option for
 Intel Xe firmware
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Francois Dugast <francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add an option to install the firmware files used by the xe driver.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index af36b8a6b1..2daeeb53b4 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -29,6 +29,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_I915
 	help
 	  Firmware files for the Intel i915 video cards.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_XE
+	bool "Intel Xe video card firmware"
+	help
+	  Firmware files for the Intel Xe video cards.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_RADEON
 	bool "AMD Radeon video card firmware"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index fac5733ad4..e9c20339e1 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -25,6 +25,11 @@ LINUX_FIRMWARE_DIRS += i915
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.i915
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XE),y)
+LINUX_FIRMWARE_DIRS += xe
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.xe
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RADEON),y)
 LINUX_FIRMWARE_DIRS += radeon
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.radeon
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
