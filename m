Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BFDC77B73
	for <buildroot@archiver.kernel.org>; Thu, 27 Apr 2023 20:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04F75408D0;
	Thu, 27 Apr 2023 20:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04F75408D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-GPVjpBJyVw; Thu, 27 Apr 2023 20:28:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A1FB400C1;
	Thu, 27 Apr 2023 20:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A1FB400C1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6792C1BF291
 for <buildroot@lists.busybox.net>; Thu, 27 Apr 2023 20:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E0E6400C1
 for <buildroot@lists.busybox.net>; Thu, 27 Apr 2023 20:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E0E6400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gcwV13OrmNcm for <buildroot@lists.busybox.net>;
 Thu, 27 Apr 2023 20:28:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B4EB400BF
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B4EB400BF
 for <buildroot@buildroot.org>; Thu, 27 Apr 2023 20:28:28 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f19ab994ccso67532675e9.2
 for <buildroot@buildroot.org>; Thu, 27 Apr 2023 13:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682627306; x=1685219306;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cGC3rsJq9AOVOBo21UpQ/EBOuUwf/eVt6KqouEtKXwE=;
 b=h9yzsb/3nwgIOQdsk4ITmOydTHGR0TLm6bZV+Uxv40uMST/zwjxo6F7Dq91TcoB2VL
 A29ztrnh7zi+6/CH0VYCJ5cULNr3lH1T0ZImnYyXrg+Vzg1X6uybIAm68ivdquprlCwC
 E3lUCx0QACG2S7Bz7RMY5Dtf5en+mraphwd9pVGd6NYTW2uHMtIrCwa5GJeZtCVi7faw
 mOa+BNERkb3GJ1h+y8TZ8nnzg2XEwR+j6+rxgyUXy4OewjiGvcJqjZEZMevMyddix+Pn
 Rav7rqNCj9SqDR52teYZ3rfnjNePdfuzX17DPhWjnJcyDdm1UtzCG0loDcYo8HWfecEl
 /HpA==
X-Gm-Message-State: AC+VfDwTFbFKFvOf9+BT4w3aFtei+dyuU7amHkE4UpxGouLN+1IXErqy
 MB5QDdCykErPZar/5eX29QdubdfoY7A=
X-Google-Smtp-Source: ACHHUZ5J22XEm5/8m9vUUxulsLLG82uUEp2ssUOqeOYWzFwSIPG4kFL5L1UOOffd2FSJfACHZfcW/Q==
X-Received: by 2002:a5d:51c9:0:b0:2f4:2ad5:15ef with SMTP id
 n9-20020a5d51c9000000b002f42ad515efmr2088857wrv.16.1682627305595; 
 Thu, 27 Apr 2023 13:28:25 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c4fc200b003f1738e64c0sm25787988wmq.20.2023.04.27.13.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 13:28:25 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Apr 2023 23:28:02 +0300
Message-Id: <20230427202802.69965-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682627306; x=1685219306;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cGC3rsJq9AOVOBo21UpQ/EBOuUwf/eVt6KqouEtKXwE=;
 b=kfhH2brE2J5n5ThjssNI2axsIuF9SHP1QixVZs4FfsPye9/bJCyn3Atg2G1FkkZoBv
 KEkN1ydwrGQzZxKOPVEJsiAx8qTtbvfujQ6/TucZX0xlVfrzU/T1xqZZTM3jX6OzJKIP
 38BTPlv/+p35A6I1R53+mxjT2zmtkCKRUSJyJ1Cx2YjA8zIOX001BVSSXEfzy1LxGlwJ
 KiYPwrKI2Y9c9wiVN5kj3ZQeiWMX2R1OwBwqy+dJ6/Uf3SQ+ZeJ198H4CQnJb69BziF5
 QDA+5vgLB0BobOrhqZX9Pfsy12pVw70TY5m8MdDOe4eyFkEP8NKluG7O9t/f0XhvjIFi
 4/Tw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=kfhH2brE
Subject: [Buildroot] [PATCH] package/sunxi-tools: fix build dependencies
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

This patch fixes the dependency on libfdt for host-sunxi-tools.
Also it fixes the dependency on zlib for sunxi-tools.

Fix the following host build failure raised since commit
2e330dff6a7ce7965ceb0dccdc9dcbcb329167bb

fit_image.c:19:10: fatal error: libfdt.h: No such file or directory
   19 | #include <libfdt.h>
      |          ^~~~~~~~~~
compilation terminated.

Fixes: http://autobuild.buildroot.net/results/2677c69ac34642a7a501230e1dd22b193db0899d/
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 package/sunxi-tools/Config.in      | 1 +
 package/sunxi-tools/Config.in.host | 1 +
 package/sunxi-tools/sunxi-tools.mk | 7 ++++---
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/sunxi-tools/Config.in b/package/sunxi-tools/Config.in
index e748637c72..14f7da5bf2 100644
--- a/package/sunxi-tools/Config.in
+++ b/package/sunxi-tools/Config.in
@@ -27,6 +27,7 @@ config BR2_PACKAGE_SUNXI_TOOLS_FEL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_DTC
 	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_ZLIB
 	help
 	  The sunxi-fel command can interact with a sunxi device in
 	  fel mode. This allows do download code to memory and execute
diff --git a/package/sunxi-tools/Config.in.host b/package/sunxi-tools/Config.in.host
index 51f13cf623..f7c60b37a9 100644
--- a/package/sunxi-tools/Config.in.host
+++ b/package/sunxi-tools/Config.in.host
@@ -2,6 +2,7 @@ config BR2_PACKAGE_HOST_SUNXI_TOOLS
 	bool "host sunxi-tools"
 	depends on BR2_arm
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
+	select BR2_PACKAGE_HOST_DTC
 	help
 	  Tools for Allwinner A10 (aka sun4i) and A13 (aka sun5i)
 	  based devices. This includes fex2bin which can be used to
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index a9569f2910..97863efc13 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -8,7 +8,7 @@ SUNXI_TOOLS_VERSION = 1.4.2-168-ged3039cdbeeb28fc0011c3585d8f7dfb91038292
 SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,v$(SUNXI_TOOLS_VERSION))
 SUNXI_TOOLS_LICENSE = GPL-2.0+
 SUNXI_TOOLS_LICENSE_FILES = LICENSE.md
-HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb host-pkgconf
+HOST_SUNXI_TOOLS_DEPENDENCIES = host-dtc host-libzlib host-libusb host-pkgconf
 FEX2BIN = $(HOST_DIR)/bin/fex2bin
 
 SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_SUNXI_TOOLS_FEXC) += sunxi-fexc
@@ -26,13 +26,14 @@ SUNXI_TOOLS_FEXC_LINKS += fex2bin bin2fex
 endif
 
 ifeq ($(BR2_PACKAGE_SUNXI_TOOLS_FEL),y)
-SUNXI_TOOLS_DEPENDENCIES += dtc libusb host-pkgconf
+SUNXI_TOOLS_DEPENDENCIES += dtc libusb zlib host-pkgconf
 endif
 
 define HOST_SUNXI_TOOLS_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) CROSS_COMPILE="" CC="$(HOSTCC)" \
 		PREFIX=$(HOST_DIR) EXTRA_CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" -C $(@D) tools misc
+		LDFLAGS="$(HOST_LDFLAGS) -I$(HOST_DIR)/include/libfdt" \
+		-C $(@D) tools misc
 endef
 
 define HOST_SUNXI_TOOLS_INSTALL_CMDS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
