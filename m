Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B625AC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 20:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CAD660B32;
	Thu,  8 Dec 2022 20:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CAD660B32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ftzIQGQmDwse; Thu,  8 Dec 2022 20:23:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0773160B2F;
	Thu,  8 Dec 2022 20:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0773160B2F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 878991BF591
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 20:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E9E8401B7
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 20:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E9E8401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FsId85_WZ-la for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 20:23:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B45E400FE
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B45E400FE
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 20:23:43 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id n7so2090762wms.3
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 12:23:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9+aCS0j7Y+aLpobFS88jfae/wHs/f2C0ggBNpYjI1CY=;
 b=sKC48vgV9sMIto5LbvIJ58wueh9fsPRsqEFJiG9vLlw/q66WWBoczbT2FMVadMw5aI
 AsEMH8V0ufF/Tv9hsrfgPMhyZmdaZEEB6dIEFmMrz9ElTp59O450ghwg/Ap4P/MeKEPx
 XPb9btHmZrhKJDWiXxr5QRcpvr5e38r0DuFlJlOn8/mUIWrBbwPibnYdu8SZUX4twgYq
 K6W7jHLDZHClpz7+VQ0viu8/5JDPpv/bNo1cUwZqjoOgZh1j9hpL/Xm79DS/lSTvckfK
 37TAAimmEw5A9egjL8cY88Xm/xQ6PzTasOWaji5+aODo4V5obmYFC8Mrmok26OwXRgRG
 KaAQ==
X-Gm-Message-State: ANoB5pltWlz7xuJFcWgMjVuy5cCdvgrVHN1FiZPBDjgZliPePX1TJRv1
 PhAfKC4Cn5w2y892AVGf7tXaRTj0ro4=
X-Google-Smtp-Source: AA0mqf58JSBXRDEBNxIS3HsVCyjeNdj3l0CTyxKVoY0vGeDKvBX5fFnRoNG6/aUpIqHx3Lxj+5I6zg==
X-Received: by 2002:a05:600c:5398:b0:3cf:d0b1:8aa1 with SMTP id
 hg24-20020a05600c539800b003cfd0b18aa1mr3049640wmb.0.1670531021182; 
 Thu, 08 Dec 2022 12:23:41 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 az40-20020a05600c602800b003d1e1f421bfsm6382121wmb.10.2022.12.08.12.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 12:23:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 21:23:38 +0100
Message-Id: <20221208202338.4085-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9+aCS0j7Y+aLpobFS88jfae/wHs/f2C0ggBNpYjI1CY=;
 b=Ps1F/VzWsZjxUAx3WFJhkHQSzU/SkN4g8vJzREQZPeSYb6nrqjHfhMVXC09eAQ80mr
 QTkzViU3Gx7wX4flEShmHLRtf2kEVBo72glo5UWJV8wo6vnBAZv70f64gh7dCuLr8cuN
 95nJIyfYr7eQGxgk2aqj1ynunq39ETlZlBrj0htyXt3IzUaf5wv7PmrHWZYDbNS88NwH
 XFY2v5vZY5qBPYvTZ5lkz2+3wtgH+utH3GebTtKRq5A/pGKt2t46/hpYNssR8ELnzBTl
 BLSjcACyr/1/risKE8QvKM0QnNQn+1jrkIAkQBJth5uo4LOik5ICbRGTiHk4yoUR04eg
 ua1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ps1F/VzW
Subject: [Buildroot] [PATCH 1/1] package/libftdi1: fix static build with
 libusb and -latomic
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
Cc: Daniel Sangue <daniel.sangue@sangue.ch>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use pkg-config to retrieve libusb dependencies such as -latomic and
avoid the following static build failure raised since bump of libusb to
version 1.0.25 in commit aad609936fc83acfe1eac6ffc86d29ac35dcf54e:

/nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libusb-1.0.a(core.o): in function `libusb_unref_device':
/nvmedata/autobuild/instance-29/output-1/build/libusb-1.0.25/libusb/core.c:1186: undefined reference to `__atomic_fetch_add_4'

Fixes:
 - http://autobuild.buildroot.org/results/1ca7cd85ae60ad4797a6d8a83b2fb51d7eab96d9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ix-static-build-with-libusb-and-lato.patch | 47 +++++++++++++++++++
 package/libftdi1/libftdi1.mk                  |  2 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch

diff --git a/package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch b/package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch
new file mode 100644
index 0000000000..c818c58d68
--- /dev/null
+++ b/package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch
@@ -0,0 +1,47 @@
+From b5b8fab6063ad90bb5ef05a72708ecde1796bc81 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 13 May 2022 18:11:50 +0200
+Subject: [PATCH] CMakeLists.txt: fix static build with libusb and -latomic
+
+Use pkg-config to retrieve libusb dependencies such as -latomic and
+avoid the following static build failure:
+
+/nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libusb-1.0.a(core.o): in function `libusb_unref_device':
+/nvmedata/autobuild/instance-29/output-1/build/libusb-1.0.25/libusb/core.c:1186: undefined reference to `__atomic_fetch_add_4'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1ca7cd85ae60ad4797a6d8a83b2fb51d7eab96d9
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+http://developer.intra2net.com/git/?p=libftdi;a=commit;h=b5b8fab6063ad90bb5ef05a72708ecde1796bc81]
+---
+ CMakeLists.txt |   12 ++++++++++--
+ 1 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 58f664a..d20aa94 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -25,8 +25,16 @@ if(${CMAKE_BUILD_TYPE} STREQUAL Debug)
+ endif(${CMAKE_BUILD_TYPE} STREQUAL Debug)
+ 
+ # find libusb
+-find_package ( USB1 REQUIRED )
+-include_directories ( ${LIBUSB_INCLUDE_DIR} )
++find_package( PkgConfig )
++if (PkgConfig_FOUND)
++  pkg_check_modules( LIBUSB libusb-1.0 )
++  if (LIBUSB_FOUND)
++    include_directories ( ${LIBUSB_INCLUDE_DIRS} )
++  else()
++    find_package ( USB1 REQUIRED )
++    include_directories ( ${LIBUSB_INCLUDE_DIR} )
++  endif()
++endif()
+ 
+ # Find Boost
+ if (FTDIPP OR BUILD_TESTS)
+-- 
+1.7.1
+
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index d2e3f42e14..66798addc4 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -8,7 +8,7 @@ LIBFTDI1_VERSION = 1.5
 LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
 LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download
 LIBFTDI1_INSTALL_STAGING = YES
-LIBFTDI1_DEPENDENCIES = libusb
+LIBFTDI1_DEPENDENCIES = host-pkgconf libusb
 LIBFTDI1_LICENSE = LGPL-2.1 (libftdi1), MIT (libftdi1)
 LIBFTDI1_LICENSE_FILES = LICENSE COPYING.LIB
 LIBFTDI1_CONFIG_SCRIPTS = libftdi1-config
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
