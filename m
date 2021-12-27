Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9A8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 13:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0AFE60E5D;
	Mon, 27 Dec 2021 13:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZej90_S5Eb3; Mon, 27 Dec 2021 13:45:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EE0D60E57;
	Mon, 27 Dec 2021 13:45:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 53AB31BF48C
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 13:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4287360E57
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 13:45:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ugDwywV6vn8F for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 13:45:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EE2060592
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 13:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1640612742; x=1672148742;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zQAqmr6itbApQwSmCnmfWkZ4Omh6UROUOyuSetWWR/U=;
 b=TdqXrTm2fXTFX11C8DKt7K31cpUa2A3v+jovoNZDZEgVa8BpRvMZCHl4
 Npcf1M2VggE3p66Qdu6GIs9w56O9j1wxJsTPS1ir4X0lemBK5ADu8wog1
 TzxnGZ/lA42uHOTFQ+FGfgzT//1ndrU+Zz+2cxUWh0/wHjBJ/EZuSSBAc
 YyXDcKKSfO0DS1zju8tnX6fluFIgDHFXq1B4Rg/1kXcmsg+2R2Mgwbp0H
 qa1kxwCvSmWlte20hQ1PDtjRXb8qz/f07Yn7tB7wcR1IKPjDV83jn/2YR
 F7TuwDAhIBxZSB251EF4cj6CJy/nGcO0yD0YU5pSXzizre6awuiX1CnHi g==;
IronPort-SDR: 0lnOXT03apObE3lCn+WXlybGMGsaJQ4H0xnorXAid9TrK73g0ARnUr3qWkbCRVb/pG64VU+iwt
 KTFa1JMWXBKil71n9Xb8jC/zdozflJtScOwXqAO4nShNPr6famJ8lVFEqajfLPBL5+/d6L/vMv
 Y6lHhbRb20ReW7kmpcwvfGj4ipi0dJoMdytqHvx4C3mqK6emuWC4T3BE2vyYqCNaIY3+t1YSP4
 XwmXXuB7itlrTjJgKP3uzIdmrG3QYJy0MEcdv0KLdc3HA9ZqtxQ69GhtG1Yf+LeenDAlIkT4b7
 mqslVcNizBQrHLj8pEEB3wEa
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; d="scan'208";a="140958610"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Dec 2021 06:45:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 27 Dec 2021 06:45:41 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 27 Dec 2021 06:45:41 -0700
To: <buildroot@buildroot.org>
Date: Mon, 27 Dec 2021 14:47:44 +0100
Message-ID: <20211227134744.2921600-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package: mrp: bump to version 1.2
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
From: Horatiu Vultur via buildroot <buildroot@buildroot.org>
Reply-To: Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: Horatiu Vultur <horatiu.vultur@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version requires cfm package

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 package/cfm/cfm.mk    | 1 +
 package/mrp/Config.in | 1 +
 package/mrp/mrp.hash  | 2 +-
 package/mrp/mrp.mk    | 4 ++--
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/cfm/cfm.mk b/package/cfm/cfm.mk
index a998bb11ca..850b8d604c 100644
--- a/package/cfm/cfm.mk
+++ b/package/cfm/cfm.mk
@@ -9,6 +9,7 @@ CFM_SITE = $(call github,microchip-ung,cfm,v$(CFM_VERSION))
 CFM_DEPENDENCIES = libev libmnl libnl
 CFM_LICENSE = GPL-2.0
 CFM_LICENSE_FILES = LICENSE
+CFM_INSTALL_STAGING = YES
 
 define CFM_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D $(CFM_PKGDIR)/S65cfm \
diff --git a/package/mrp/Config.in b/package/mrp/Config.in
index 0ca18a4ef2..ac42fa4773 100644
--- a/package/mrp/Config.in
+++ b/package/mrp/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_MRP
 	select BR2_PACKAGE_LIBEV
 	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_CFM
 	help
 	  This is the userspace application that configures the kernel
 	  to run MRP protocol. The userspace application is made of 2
diff --git a/package/mrp/mrp.hash b/package/mrp/mrp.hash
index 02a848c7eb..47cf461882 100644
--- a/package/mrp/mrp.hash
+++ b/package/mrp/mrp.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  1a6c76d058bb425a7ec8b69a65de797650961161ec016b51ac8a1965e1ac304f  mrp-1.1.tar.gz
+sha256  2b960d14c861b4e0332f411440b41a9c1c06ecce8ed6197944a74b1c8279c1cc  mrp-1.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mrp/mrp.mk b/package/mrp/mrp.mk
index 7e31e442ce..213afbcdf5 100644
--- a/package/mrp/mrp.mk
+++ b/package/mrp/mrp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MRP_VERSION = 1.1
+MRP_VERSION = 1.2
 MRP_SITE = $(call github,microchip-ung,mrp,v$(MRP_VERSION))
-MRP_DEPENDENCIES = libev libmnl libnl
+MRP_DEPENDENCIES = libev libmnl libnl cfm
 MRP_LICENSE = GPL-2.0
 MRP_LICENSE_FILES = LICENSE
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
