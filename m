Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B809C77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 08:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A2AC6FE6E;
	Mon, 10 Apr 2023 08:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A2AC6FE6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ch7g_zmux21; Mon, 10 Apr 2023 08:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F22060EA1;
	Mon, 10 Apr 2023 08:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F22060EA1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 172811C3B02
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 08:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E450360EA1
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 08:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E450360EA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6gcZu_2ttOS5 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 08:40:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80FBE60B43
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80FBE60B43
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 08:40:44 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id s8so2481537wmo.0
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 01:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681116042;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XxZAcqSgUAK8S7MrjVDDXSX7V+F04j//j08CkGptbV8=;
 b=jZOAVt1npXYbIsdFo2Nq/djjPoYNq6KL9vmpdycWf/eSoGe7RiIT9CvG1EIIGocq8w
 D/vK+z0ms3nYgGJKxX9zspf+JvxPLVcsZzsKW3DrL9PL0Mg6fPt1Xl9/fSQj6H6UtfoX
 2iYEGExcgKMD3B0IZ7YYPG3BPZK7Mtf2YSPsQTCh7Ku22oMsBi6B95hvgPGxqLF6N/e0
 GH5WA95cpn9QMBxAy96NbFh1HrNyfK+NGP7MFGYrq0cb5nkRqDjYmguVZOPC8/ZfqXpI
 QyQh4d3aE50J7hbcOFShklZiyh+EOQEj6eM3vA4/n9oMtAumU1z51NpWLWvCU8mjXYsL
 3ZKQ==
X-Gm-Message-State: AAQBX9eaA70Abx7CNRTiS6oOdNYS728gWjkPr6D6PCi+f5YclEjWY8oA
 7yLptt5+upkbjzTw0ATGdTB4+qtitmE=
X-Google-Smtp-Source: AKy350YHqEzyon3U0cT2py9uDEvtS0qHhUYdFjZzYz+U21Ja6+kmMh4nRzNhAt1rozxp7VblsG9mMQ==
X-Received: by 2002:a1c:7505:0:b0:3dc:1687:9ba2 with SMTP id
 o5-20020a1c7505000000b003dc16879ba2mr6475226wmc.35.1681116042134; 
 Mon, 10 Apr 2023 01:40:42 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
 by smtp.gmail.com with ESMTPSA id
 q31-20020a05600c331f00b003ee610d1ce9sm16664592wmp.34.2023.04.10.01.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 01:40:41 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 11:40:18 +0300
Message-Id: <20230410084020.1812422-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681116042;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XxZAcqSgUAK8S7MrjVDDXSX7V+F04j//j08CkGptbV8=;
 b=RufsUYQfKxYNR7pUZ/EF5Fn3n96j1+clIFxfB38lf/15b8mTZ1Eb8iD16k4FVkHTrl
 ZH2q3IUi+z3puJpEzYed3fHdRbSPph89xaVQMs9XuTL3bFdG4qu7qsVED5Ri3OWZnvBU
 ORjhlBMGTKwdUUcWo+O5hMoFWSXLND7brGDeIFBv/QegDqqXqf+YiJmOKsjc2qxdiwJ6
 SsdoRcnEqU7trtIzgk0aFYSYTYMnAOjehtXlOut4/9CSkMWUfpJKPqCXH57KxsBpIyXR
 cwx0II5FMlzjWJIvwIRpg4Cb4r43lYeepVDCmLL3FhAQNKp520m34mavjPxZJS6KpS22
 IikQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RufsUYQf
Subject: [Buildroot] [PATCH 1/1] sunxi-tools: bump to version
 1.4.2-168-ged3039c
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
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps version of the sunxi-tools to latest commit on master branch.

There are no new tags\releases since 2016 so let's use commit hash as version.
New version brings support for the following SOCs: A63, V5, R528/T113s, V853,
F1C100s, R329, H616, H6

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 ...nfo-Access-to-io-memory-via-pointers.patch | 59 -------------------
 package/sunxi-tools/Config.in                 |  1 +
 package/sunxi-tools/sunxi-tools.hash          |  2 +-
 package/sunxi-tools/sunxi-tools.mk            |  4 +-
 4 files changed, 4 insertions(+), 62 deletions(-)
 delete mode 100644 package/sunxi-tools/0001-meminfo-Access-to-io-memory-via-pointers.patch

diff --git a/package/sunxi-tools/0001-meminfo-Access-to-io-memory-via-pointers.patch b/package/sunxi-tools/0001-meminfo-Access-to-io-memory-via-pointers.patch
deleted file mode 100644
index 997c413f23..0000000000
--- a/package/sunxi-tools/0001-meminfo-Access-to-io-memory-via-pointers.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 5c0a443ba336f10a8db6a99c769aa84ad37ed4d2 Mon Sep 17 00:00:00 2001
-From: Vadim Kochan <vadim4j@gmail.com>
-Date: Wed, 20 Feb 2019 02:48:43 +0200
-Subject: [PATCH] meminfo: Access to io memory via pointers
-
-The main reason for this is to be able compile with musl library,
-because there is no support of inx/outx functions for ARM platform.
-
-Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
----
- meminfo.c | 11 ++++++-----
- 1 file changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/meminfo.c b/meminfo.c
-index 0b0ff23..7d9f10f 100644
---- a/meminfo.c
-+++ b/meminfo.c
-@@ -22,7 +22,6 @@
- #include <sys/mman.h>
- #include <stdint.h>
- #include <errno.h>
--#include <sys/io.h>
- #include <stdbool.h>
- 
- #include "common.h"
-@@ -74,24 +73,26 @@ static enum sunxi_soc_version soc_version;
- unsigned int
- sunxi_io_read(void *base, int offset)
- {
--	return inl((unsigned long) (base + offset));
-+	unsigned long port = (unsigned long) (base + offset);
-+	return *((volatile unsigned long *) port);
- }
- 
- void
- sunxi_io_write(void *base, int offset, unsigned int value)
- {
--	outl(value, (unsigned long) (base + offset));
-+	unsigned long port = (unsigned long) (base + offset);
-+	*((volatile unsigned long *) port) = value;
- }
- 
- void
- sunxi_io_mask(void *base, int offset, unsigned int value, unsigned int mask)
- {
--	unsigned int tmp = inl((unsigned long) (base + offset));
-+	unsigned int tmp = sunxi_io_read(base, offset);
- 
- 	tmp &= ~mask;
- 	tmp |= value & mask;
- 
--	outl(tmp, (unsigned long) (base + offset));
-+	sunxi_io_write(base, offset, tmp);
- }
- 
- 
--- 
-2.14.1
-
diff --git a/package/sunxi-tools/Config.in b/package/sunxi-tools/Config.in
index 5f72667284..e748637c72 100644
--- a/package/sunxi-tools/Config.in
+++ b/package/sunxi-tools/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_SUNXI_TOOLS_FEL
 	bool "sunxi-fel"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	select BR2_PACKAGE_DTC
 	select BR2_PACKAGE_LIBUSB
 	help
 	  The sunxi-fel command can interact with a sunxi device in
diff --git a/package/sunxi-tools/sunxi-tools.hash b/package/sunxi-tools/sunxi-tools.hash
index 84acc2c76c..b871f6e17b 100644
--- a/package/sunxi-tools/sunxi-tools.hash
+++ b/package/sunxi-tools/sunxi-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  81f48014a520cb83cac4e17f5ae627a637c4d6a422b60c693c5a705c92e43822  sunxi-tools-1.4.2.tar.gz
+sha256  6589f32e9c2a5991cc49928e83aceea675f0165ce6f13cdd2dd784139a8d4efd  sunxi-tools-1.4.2-168-ged3039c.tar.gz
 sha256  2b0d4dda4bf8034e1506507a67f80f982131137afe62bf144d248f9faea31da4  LICENSE.md
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index 59d1f3b5a0..dab68886b1 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_TOOLS_VERSION = 1.4.2
+SUNXI_TOOLS_VERSION = 1.4.2-168-ged3039c
 SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,v$(SUNXI_TOOLS_VERSION))
 SUNXI_TOOLS_LICENSE = GPL-2.0+
 SUNXI_TOOLS_LICENSE_FILES = LICENSE.md
@@ -26,7 +26,7 @@ SUNXI_TOOLS_FEXC_LINKS += fex2bin bin2fex
 endif
 
 ifeq ($(BR2_PACKAGE_SUNXI_TOOLS_FEL),y)
-SUNXI_TOOLS_DEPENDENCIES += libusb host-pkgconf
+SUNXI_TOOLS_DEPENDENCIES += dtc libusb host-pkgconf
 endif
 
 define HOST_SUNXI_TOOLS_BUILD_CMDS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
