Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA16FF8860
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 16:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A83FE610B0;
	Sat, 25 Apr 2026 16:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pj_W-EAF18gl; Sat, 25 Apr 2026 16:09:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8697B610B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777133369;
	bh=Khuvzx1pmZHna9ZGHmzPLDqaAOdaBVBqSYKxyVXH/tM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PLZXKxMRQRKCEt8daVbyV4mvA3C+6w0K/FrAXoKHNjYm+RJUTEgVi9yizzfIqoxE1
	 9IiIqjVILaeYLlvN2PIrP25eb5DTUIC/CkagPLQL0Cq6ZmlzJ3uT2NRoCEX0+vQkh8
	 HuDCAg9NE8oB3LqYY3LXLQe0BkGVhvj2u/Wkar/FzoTAjkoQPjE/cPDDILb1SgDYo6
	 kAdTV0XKp6h+/aze2+wslrm09XXXIYC7yRSzPt9mwjL/EoO80ohAQ5F18hYdVLyWM7
	 s7LOMksX2QUiET8gf5PCCgz3/AnxqQDOHumLtwGcUroP9CVXjZC7QRB5hWvp+t2OAS
	 OGDqLysFQJnew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8697B610B3;
	Sat, 25 Apr 2026 16:09:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DE20231
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 16:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F37E840891
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 16:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQW5lsp-oacf for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 16:09:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=maxin.john@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A84534084D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A84534084D
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A84534084D
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 16:09:26 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-38e12c67a6fso88866021fa.1
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 09:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777133364; x=1777738164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l4u2l8hS8/DAUaSPusaCsv2TW6I9cHYd/YrRaT2Svbk=;
 b=alhPFpOBBusKoYqzCtqTh4UjCLsh8bpN8il7x6ZQZL5vHlF1La7obFSfme3qH57NOU
 5DTez9JQEdj3NgwAmKW/2U7hHguGm5HT8iMbmRQPoi/tic3CbKkRVMn3rer9fJjzjyDa
 Ce42Utav+OTbi4m9Rtp99kTaY15gfm5KX6BkfTedhZItXYSRT+w9JX9jK1iVTOKp9VLJ
 cUfwcVcoEFRko1S9inTkwRxrsiOy1bPfmbg02T3PYmrJS6AYL9KLGg2jG9Egbrn3hsXx
 GbaHo5IBfuJpchuk80qgOfXWvP3v8dG1MROpLsgWZH1F9O42x+OdeLYbT8IBGWSWN2B7
 KOxA==
X-Gm-Message-State: AOJu0Yxpm1qUlmOdFwQFB51T67e/tDHcBBJsvBNv0aaobYnBpBUd9IwQ
 4uyqPzNiZLKuJPgi3jLrlDdcys2XCixYqc5WpYY11muOd4QhtHcmJW8poS6zTg==
X-Gm-Gg: AeBDiet3OdfqMg/PuyAR+O/086kUGWz7oBEfXmV/bcPUbS2WLsmN8o+Vpya9q/yaMAu
 Gfwvb3eqqd1dkt4JdWTCxsldUPjDzBv5ApkGRqZOhsVCyVbdSE4GZ+GVXSxSBGR1dAbiSVE7ryi
 H/sKPjPKZrQsRs1gDWBUeXc3HtqzhYqscoqLRqsmBLvRrVD0dZaZe+pljTF+JXR5Ta5uDpeiszN
 IP0RiwuE6zh/QOc1F8ww+D1JLk1iJ5W89PkwCK/RUAWFyQNRE60BWVRJPFwX+d0T9agPr1XSmx1
 QJ7Eum1+xdzHBY7nCXXsKWK7T/eaZLnmL5qv+DhzTXSh9XwbXnTTCz2YRupnsemwbaF0WknSdO/
 UCm/UNWawRgangWxkfovUhv5I1jKTIy5M7LxFKv7yTLJCLThQWO+/jFbVDXiM6LOB5gVbSnogcp
 NPYUi6yahRSbem+xVMgLsNVHM3SYOnWzCF91fgakJJVlnECG/mU4dnlBXEIXYi7KwdAYt6zooVT
 EHHcjwFldk=
X-Received: by 2002:a2e:be9b:0:b0:38e:8902:7a7f with SMTP id
 38308e7fff4ca-38ec7841128mr120209421fa.13.1777133364130; 
 Sat, 25 Apr 2026 09:09:24 -0700 (PDT)
Received: from Thor.lan (nb6bp2luucgh1ubvhqb-1.v6.elisa-laajakaista.fi.
 [2001:99a:a58:9b00:9119:221d:45f0:de83])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38ecb724929sm55197141fa.32.2026.04.25.09.09.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2026 09:09:23 -0700 (PDT)
From: Maxin John <maxin.john@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Apr 2026 19:09:22 +0300
Message-ID: <20260425160922.246044-1-maxin.john@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777133364; x=1777738164; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=l4u2l8hS8/DAUaSPusaCsv2TW6I9cHYd/YrRaT2Svbk=;
 b=BlSBe06ulmN2nssdG6aFR4hbXcXCkxHjXh50AS/QFH4iZ+ohlZtrEdfb9ktd2mMJ3N
 qc49QZEJavUQlWrp89DS2m8xTEFHxKChxKTqJxpVx63nw7jbrq0kGidj6o6/mgkOdGZB
 bSq5jRr7Ch4yTG3MQgnzRXE5xsyg1lY31Piv2THVGaUQUb60u4aRX+iZKHv9ZY1CQ7Oc
 cxJMdhzhhzvWJFBrchewqkxSP1n+l7ucxTwSkGrM9scLAWI5ZAtllbhpIJly4OGgMC6u
 xmkP85MXsy8iik+md06BsC+PkwLiSiPoplW0JNu9OAqNnzNz8GfKzOOVZx05bOXUkk0d
 9eNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=BlSBe06u
Subject: [Buildroot] [PATCH v3] package/mdadm: bump to version 4.6
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

Drop upstreamed/backported patches.

Release announcements:
4.6:
https://lore.kernel.org/linux-raid/CALTww2_2pjjOSsVj-WT++m35555CjnPWokU7fut+HwUJVV-=ZQ@mail.gmail.com/

4.5:
https://lore.kernel.org/linux-raid/CALTww293wnLE2+eZsZ42oyNZhS_cc2agB4GNqTz8j3xiP0ALWA@mail.gmail.com/

4.4:
https://lore.kernel.org/linux-raid/20241213121438.7ed6a0fd@mtkaczyk-private-dev/

Upstream mdadm project has moved its primary development to GitHub:
https://github.com/md-raid-utilities/mdadm
Updated download site accordingly.

mdadm >= 4.5 removed fallback definitions for MD_DISK_FAILFAST
(commit f5889f9a1b8753a1472dfef9d025da2bae395239), relying on
kernel headers instead.This breaks builds with toolchains using older headers
(e.g. 4.9). So, enforce BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10.

Since mdadm 4.6, `mdadm --create` may prompt for bitmap configuration,
which breaks the runtime test.Fix the test by passing --bitmap=none to keep
it non-interactive.

Signed-off-by: Maxin John <maxin.john@gmail.com>
---
Changes v1 -> v2:
   - add missing 4.4 and 4.5 release links
   - switch download site to GitHub
   - drop unnecessary MDADM_SOURCE

Changes v2 -> v3:
   - fix mdadm runtime test (avoid interactive prompt with --bitmap=none)
   - add kernel headers >= 4.10 dependency
---
 ...not-require-libudev-h-if-DNO_LIBUDEV.patch | 34 ---------------
 ...ts-h-include-for-NAME_MAX-definition.patch | 32 --------------
 .../0003-Create.c-fix-uclibc-build.patch      | 42 -------------------
 .../0004-Makefile-Move-pie-to-LDFLAGS.patch   | 40 ------------------
 package/mdadm/Config.in                       |  4 ++
 package/mdadm/mdadm.hash                      |  5 ++-
 package/mdadm/mdadm.mk                        |  5 +--
 support/testing/tests/package/test_mdadm.py   |  2 +-
 8 files changed, 10 insertions(+), 154 deletions(-)
 delete mode 100644 package/mdadm/0001-udev-c-Do-not-require-libudev-h-if-DNO_LIBUDEV.patch
 delete mode 100644 package/mdadm/0002-util-c-add-limits-h-include-for-NAME_MAX-definition.patch
 delete mode 100644 package/mdadm/0003-Create.c-fix-uclibc-build.patch
 delete mode 100644 package/mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch

diff --git a/package/mdadm/0001-udev-c-Do-not-require-libudev-h-if-DNO_LIBUDEV.patch b/package/mdadm/0001-udev-c-Do-not-require-libudev-h-if-DNO_LIBUDEV.patch
deleted file mode 100644
index 5c3d6e03b436..000000000000
--- a/package/mdadm/0001-udev-c-Do-not-require-libudev-h-if-DNO_LIBUDEV.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1750758c7ff526e3560433f6235e5cfa35cf646a Mon Sep 17 00:00:00 2001
-From: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
-Date: Wed, 6 Mar 2024 15:50:55 +0100
-Subject: udev.c: Do not require libudev.h if DNO_LIBUDEV
-
-libudev may not be presented at all, do not require it.
-
-Reported-by: Boian Bonev <bbonev@ipacct.com>
-Signed-off-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
-
-Upstream: https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=1750758c7ff526e3560433f6235e5cfa35cf646a
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- udev.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/udev.c b/udev.c
-index bc4722b0..066e6ab1 100644
---- a/udev.c
-+++ b/udev.c
-@@ -26,7 +26,10 @@
- #include	<signal.h>
- #include	<limits.h>
- #include	<syslog.h>
-+
-+#ifndef NO_LIBUDEV
- #include	<libudev.h>
-+#endif
- 
- static char *unblock_path;
- 
--- 
-cgit 1.2.3-korg
-
diff --git a/package/mdadm/0002-util-c-add-limits-h-include-for-NAME_MAX-definition.patch b/package/mdadm/0002-util-c-add-limits-h-include-for-NAME_MAX-definition.patch
deleted file mode 100644
index ceaf7f923caf..000000000000
--- a/package/mdadm/0002-util-c-add-limits-h-include-for-NAME_MAX-definition.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8bda86099089b44129ef6206764f9de47a45f0db Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 12 Mar 2024 11:01:50 +0100
-Subject: util.c: add limits.h include for NAME_MAX definition
-
-Add limits.h include for NAME_MAX definition.
-
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-Signed-off-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
-
-Upstream: https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=8bda86099089b44129ef6206764f9de47a45f0db
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- util.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/util.c b/util.c
-index 05ad3343..49a9c6e2 100644
---- a/util.c
-+++ b/util.c
-@@ -36,7 +36,7 @@
- #include	<ctype.h>
- #include	<dirent.h>
- #include	<dlfcn.h>
--
-+#include	<limits.h>
- 
- /*
-  * following taken from linux/blkpg.h because they aren't
--- 
-cgit 1.2.3-korg
-
diff --git a/package/mdadm/0003-Create.c-fix-uclibc-build.patch b/package/mdadm/0003-Create.c-fix-uclibc-build.patch
deleted file mode 100644
index c8399be07682..000000000000
--- a/package/mdadm/0003-Create.c-fix-uclibc-build.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 52bead95d2957437c691891fcdc49bd6afccdd49 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 12 Apr 2024 18:45:13 +0200
-Subject: Create.c: fix uclibc build
-
-Define FALLOC_FL_ZERO_RANGE if needed as FALLOC_FL_ZERO_RANGE is only
-defined for aarch64 on uclibc-ng resulting in the following or1k build
-failure since commit 577fd10486d8d1472a6b559066f344ac30a3a391:
-
-Create.c: In function 'write_zeroes_fork':
-Create.c:155:35: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
-  155 |                 if (fallocate(fd, FALLOC_FL_ZERO_RANGE | FALLOC_FL_KEEP_SIZE,
-      |                                   ^~~~~~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/0e04bcdb591ca5642053e1f7e31384f06581e989
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
-Upstream: https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=52bead95d2957437c691891fcdc49bd6afccdd49
----
- Create.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Create.c b/Create.c
-index 4397ff49..d94253b1 100644
---- a/Create.c
-+++ b/Create.c
-@@ -32,6 +32,10 @@
- #include	<sys/signalfd.h>
- #include	<sys/wait.h>
- 
-+#ifndef FALLOC_FL_ZERO_RANGE
-+#define FALLOC_FL_ZERO_RANGE 16
-+#endif
-+
- static int round_size_and_verify(unsigned long long *size, int chunk)
- {
- 	if (*size == 0)
--- 
-cgit 1.2.3-korg
-
diff --git a/package/mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch b/package/mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch
deleted file mode 100644
index 4d46d5823008..000000000000
--- a/package/mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 893a55831e5abbcd15b171db66fa1f389fb61506 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 7 May 2024 19:32:16 +0200
-Subject: Makefile: Move -pie to LDFLAGS
-
-Move -pie from LDLIBS to LDFLAGS and make LDFLAGS configurable to allow
-the user to drop it by setting their own LDFLAGS (e.g. PIE could be
-enabled or disabled by the buildsystem such as buildroot).
-
-Suggested-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
-
-Upstream: https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=893a55831e5abbcd15b171db66fa1f389fb61506
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 7c221a89..adac7905 100644
---- a/Makefile
-+++ b/Makefile
-@@ -132,12 +132,12 @@ CFLAGS += -DUSE_PTHREADS
- MON_LDFLAGS += -pthread
- endif
- 
--LDFLAGS = -Wl,-z,now,-z,noexecstack
-+LDFLAGS ?= -pie -Wl,-z,now,-z,noexecstack
- 
- # If you want a static binary, you might uncomment these
- # LDFLAGS += -static
- # STRIP = -s
--LDLIBS = -ldl -pie
-+LDLIBS = -ldl
- 
- # To explicitly disable libudev, set -DNO_LIBUDEV in CXFLAGS
- ifeq (, $(findstring -DNO_LIBUDEV,  $(CXFLAGS)))
--- 
-cgit 1.2.3-korg
-
diff --git a/package/mdadm/Config.in b/package/mdadm/Config.in
index 8c6bb08adc05..fabfa115b25e 100644
--- a/package/mdadm/Config.in
+++ b/package/mdadm/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MDADM
 	bool "mdadm"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
 	help
 	  Utility for managing Linux Software RAID arrays.
 
@@ -10,3 +11,6 @@ config BR2_PACKAGE_MDADM
 comment "mdadm needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
+
+comment "mdadm needs kernel headers >= 4.10"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
diff --git a/package/mdadm/mdadm.hash b/package/mdadm/mdadm.hash
index 84bae1aebfd5..90c7c0728e1b 100644
--- a/package/mdadm/mdadm.hash
+++ b/package/mdadm/mdadm.hash
@@ -1,4 +1,5 @@
-# From https://www.kernel.org/pub/linux/utils/raid/mdadm/sha256sums.asc
-sha256  416727ae1f1080ea6e3090cea36dd076826fc369151e36ab736557ba92196f9f  mdadm-4.3.tar.xz
+# Locally calculated
+sha256  202a7525e6f2b44395a9ef2c561082c7d6d8204e9addfe3f6268bfb141efc093  mdadm-4.6.tar.gz
+
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 421f06d6953f..785616f1c59b 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-MDADM_VERSION = 4.3
-MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
-MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
+MDADM_VERSION = 4.6
+MDADM_SITE = https://github.com/md-raid-utilities/mdadm/archive/refs/tags
 MDADM_LICENSE = GPL-2.0+
 MDADM_LICENSE_FILES = COPYING
 MDADM_CPE_ID_VALID = YES
diff --git a/support/testing/tests/package/test_mdadm.py b/support/testing/tests/package/test_mdadm.py
index d5abdb0706c8..095d0fd8be4c 100644
--- a/support/testing/tests/package/test_mdadm.py
+++ b/support/testing/tests/package/test_mdadm.py
@@ -69,7 +69,7 @@ class TestMdadm(infra.basetest.BRTest):
         self.assertRunOk(cat_mdstat_cmd)
 
         # We create a raid5 array with the drives.
-        cmd = f"mdadm --create --verbose {md_dev} --level=5 "
+        cmd = f"mdadm --create --verbose {md_dev} --level=5 --bitmap=none "
         cmd += f"--raid-devices={len(storage_devs)} "
         cmd += " ".join(storage_devs)
         self.assertRunOk(cmd)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
