Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D99C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 15:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 031FF60DDF;
	Sat, 30 Dec 2023 15:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 031FF60DDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6P-8VMUE8asU; Sat, 30 Dec 2023 15:17:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30EA760E31;
	Sat, 30 Dec 2023 15:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30EA760E31
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2EF9F1BF3D7
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 15:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0266660E31
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 15:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0266660E31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EX7AwHj5mLnj for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 15:17:23 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BABE060DDF
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 15:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BABE060DDF
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33723ad790cso1150991f8f.1
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 07:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703949440; x=1704554240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RcF66vFPne+8xB3W72sM6ZUlfzyua5DjumA1YQe1Rb0=;
 b=LeqG3eSgoGXVU4A8TAhRQ1n7QiJBZiIfRzq7jiIUvxu4W5IuM/OApBw6b1VZZCls7Q
 FPfxOODilrzd0GCEdbkjDLWHTM0tEoPFRIWBsjWtPJAMn+WqFg4TRxes4Sn1eFpon3cA
 XFGQ9qYl2N5bFmNcsK+3xYd4QGfBUH+lg5zM+u9XpSzdj02+062aZnDs+QrIz/kyqHqz
 jnnGJYZdNtfrM7uemWoywIPVuNsZ6p/n+kSYZYYDlP6eBF+GBh1GmfFPoW6YS/hmSCRP
 g5mjQbRhKvSKmZtfhD7bF7TUOa1icelNrUwpBzqXuK1iPKCuKYwZQuqBkcxu8uXy8rQe
 dEJw==
X-Gm-Message-State: AOJu0YzfIHc7tIBj6GtnXauVqAzSMfwRKzl4xxgqMwNFy7vHKTqI+MQ3
 xpt/Mw1/SJYlD82arKKZRwN9fMEcaWc=
X-Google-Smtp-Source: AGHT+IE8wZilKDQtyWBlN/80UuUt+J917tFldninOOaaxj2geaVXUH0TOhVVBibRd6wdXpV4jKUPww==
X-Received: by 2002:a05:600c:4ecd:b0:40d:79ee:bc6 with SMTP id
 g13-20020a05600c4ecd00b0040d79ee0bc6mr854171wmq.219.1703949439467; 
 Sat, 30 Dec 2023 07:17:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v4-20020a05600c444400b0040d83ab2ecdsm2066883wmn.21.2023.12.30.07.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 07:17:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 16:16:50 +0100
Message-ID: <20231230151650.234413-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703949440; x=1704554240; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RcF66vFPne+8xB3W72sM6ZUlfzyua5DjumA1YQe1Rb0=;
 b=UBjSM5gYAwVLV1+bQ08hEv/pJpbftKP5BL1MqF2LlGUjHcmmRlhFiVGoarPFOnoare
 0LCsgCWecsJ5CD9l4o/acm269QxSiVamwFupev1RR11TCIl48YHExipkMuy8DdJny/Az
 QKYWMn/6D49Vyp1yP8GSKv0Lbs+Eis7QnxvmKTvgque9GP+1uAq7zL2h1fxgVkqeBCjh
 9dbAV6bt4NZfq9BMKVwpoU1fdgLIM3hocS8uOiABb8ApNuGERt2OJPr0cQo3Xb/gp6XS
 cRMAA25pmZWydRBFRfosPw6ZpmFGggqmPe1YzL58T9mnz1k6O2wlqG2n7DKHl4Z3BQbP
 DwEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UBjSM5gY
Subject: [Buildroot] [PATCH 1/1] package/atest: bump to latest commit
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 .../0001-seq.h-fix-build-with-gcc-10.patch    | 40 -------------------
 package/atest/atest.hash                      |  2 +-
 package/atest/atest.mk                        |  2 +-
 4 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 package/atest/0001-seq.h-fix-build-with-gcc-10.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 67cd6fabc1..7c38fad6ab 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -163,7 +163,6 @@ package/asterisk/0005-configure-fix-detection-of-re-entrant-resolver-funct.patch
 package/asterisk/0006-main-iostream.c-fix-build-with-libressl.patch Upstream
 package/at/0001-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch Upstream
 package/at/S99at Indent Variables
-package/atest/0001-seq.h-fix-build-with-gcc-10.patch Upstream
 package/attr/0001-build-with-older-GCCs.patch Upstream
 package/audit/S02auditd Shellcheck Variables
 package/aufs-util/0001-remove-user-settings.patch Upstream
diff --git a/package/atest/0001-seq.h-fix-build-with-gcc-10.patch b/package/atest/0001-seq.h-fix-build-with-gcc-10.patch
deleted file mode 100644
index c0ae042b01..0000000000
--- a/package/atest/0001-seq.h-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From fb374e0775fd9772a2cd7b99a5c21f96f7fe2a9a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 10 Aug 2020 12:12:07 +0200
-Subject: [PATCH] seq.h: fix build with gcc 10
-
-Rename state structure to avoid the following build failure with gcc
-10.0:
-
-/bin/bash ./libtool  --tag=CC   --mode=link /home/test/autobuild/run/instance-0/output-1/host/bin/arm-buildroot-linux-gnueabihf-gcc -include config.h   -Wall -Wno-sign-compare -Wno-strict-aliasing  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os     -o atest atest.o seq.o alsa.o capture.o playback.o loopback_delay.o -L/home/test/autobuild/run/instance-0/output-1/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/lib -lasound -lev
-libtool: link: /home/test/autobuild/run/instance-0/output-1/host/bin/arm-buildroot-linux-gnueabihf-gcc -include config.h -Wall -Wno-sign-compare -Wno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -o atest atest.o seq.o alsa.o capture.o playback.o loopback_delay.o  -L/home/test/autobuild/run/instance-0/output-1/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/lib /home/test/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libasound.so -ldl -lpthread -lrt /home/test/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libev.so -lm -Wl,-rpath -Wl,/home/test/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -Wl,-rpath -Wl,/home/test/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
-/home/test/autobuild/run/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: seq.o:(.bss+0x8): multiple definition of `state'; atest.o:(.bss+0xbc): first defined here
-/home/test/autobuild/run/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: capture.o:(.bss+0x0): multiple definition of `state'; atest.o:(.bss+0xbc): first defined here
-/home/test/autobuild/run/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: playback.o:(.bss+0x0): multiple definition of `state'; atest.o:(.bss+0xbc): first defined here
-/home/test/autobuild/run/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: loopback_delay.o:(.bss+0x0): multiple definition of `state'; atest.o:(.bss+0xbc): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/887c466b3703449239eedaf86f3f4dd2a2dc8afe
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/amouiche/atest/pull/3]
----
- seq.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/seq.h b/seq.h
-index 0fa1a95..b7ba8d1 100644
---- a/seq.h
-+++ b/seq.h
-@@ -30,7 +30,7 @@ enum seq_stat_e {
-     NULL_FRAME = 0,
-     INVALID_FRAME,
-     VALID_FRAME,
--} state;
-+};
- 
- 
- struct seq_info {
--- 
-2.27.0
-
diff --git a/package/atest/atest.hash b/package/atest/atest.hash
index e411a934e5..a7ade8ad37 100644
--- a/package/atest/atest.hash
+++ b/package/atest/atest.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  91da5a6d4d0b0a8d4bae156a40e91a6dccf62863bfa7acae948efbbd2b4154ca  atest-895b0183a89c15f5e2305a6795bb1667753cd3f0.tar.gz
+sha256  53980d44af542cc02cbcecba1f10c8a16523aa80196fbb8fc257ff6e949344de  atest-9ff52ee5d7764984e21fe40a381b41ecd2d63548.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atest/atest.mk b/package/atest/atest.mk
index 68def46cf9..e9f338acf2 100644
--- a/package/atest/atest.mk
+++ b/package/atest/atest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATEST_VERSION = 895b0183a89c15f5e2305a6795bb1667753cd3f0
+ATEST_VERSION = 9ff52ee5d7764984e21fe40a381b41ecd2d63548
 ATEST_SITE = $(call github,amouiche,atest,$(ATEST_VERSION))
 ATEST_LICENSE = GPL-2.0+
 ATEST_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
