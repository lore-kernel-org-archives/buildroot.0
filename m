Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381DEFF885A
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 06:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E419940EEF;
	Sat, 25 Apr 2026 06:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rydj7SwW1EdG; Sat, 25 Apr 2026 06:27:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD09840EF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777098433;
	bh=7IpnkUROdEKUzm9A+niHp7lp1awe5FQftCkoBcAOWZA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AvesbVc62fl5o9x6+VE0AbVxyx5g1Xd7qwXqmSPEysT1nEUD6ehu02ZqUj/4ykTCJ
	 0ZP7S3XL5iM2iAFj45y0cteC3OLBzyxTlVgJ1zS1YdDwLiFEBZLtLuG20uYZO6SwQg
	 s6KgBzFeZlb4twTN6jQ4CUnHYtiNyBvwGpk5A4pz+PyvKWa2falMs9mD+mGKorsRNB
	 yFByCj9uij+8qlktYIow3zZmynShEoDpokG4SLMDRPD++boVlcVboe4bEmZQibF7Zs
	 dG549Nkt8+tZ1LMHnSMAXLyH2aws9Q8w+rpXDdNvER4jv8LjYJ2MeITKFYbNrFy0dA
	 8jwJ/M+hNRn8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD09840EF5;
	Sat, 25 Apr 2026 06:27:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B3AD194
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 06:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CDD3405B2
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 06:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lh4EQ15a82SQ for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 06:27:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=maxin.john@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B9C15405AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9C15405AB
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9C15405AB
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 06:27:10 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5a415fd6bceso9499738e87.1
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 23:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777098428; x=1777703228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+A6EIfDTWMs/c6kCV8vh96GQekoOwo8BlL3BRIYAGbI=;
 b=jmE+ht2AlrHle7OyBXfzb7A8R/D+o6ORemjPov245tU25mMm8/1ZvIg2+nGYMtEXCO
 Tg6SCTlnSbyStLkF0hZDnisqJt77n0qIPjQ3Yan0kuPUTaPBLgOV6zjuneW8OPIicoLS
 JIo0gHwMyDxUHFSp1xBfuZYM/vWu6kfwc+Fq1kYO++EsNjpM7ligtzVZtamU3eGiZfHU
 gsDo3XTMSUxVoW4VsPkC/Dh+JS0MUmm0FRx4duEicypwlzZ+oDxSe9nj0euXk+Fdm934
 xMjkb4gZWoQ+7X2P5jRG4Nk4JQrc66Rtfc/VZGBw1lltWmTpU1PHKrMi6EHVQ6dfnJG3
 xtCg==
X-Gm-Message-State: AOJu0Yxahx4FBjEu/uetCLUD9lqGnSMEWdaz7t5i4OhDOCJWpKXpRKPr
 O3lLP5HQ+TkwI2SNWVgnpliNp8zo6/KZKbDRz/Djf8nuptRW45ePpxXIkgO/kQ==
X-Gm-Gg: AeBDieszrF3862kkOOk85OJ/w5hwonrnsdbJPGnKS9jfF4QKkyXov0ZY02eHFQpzA5O
 QKn9utM7zax5tAFRrV4iL3xWs74cw9n5vTVJmjYZf3wXtGu/7hDWzMu51VeddDg0gbVCt8RU5cX
 6Z1CE0h+OKNstvlcQzQ3i3FONVt/4Uey4nAD64eizxhgOYTEzO6wSx1xL560Hk8r8V/pNkuS384
 IQtCT/LinuTS07T3uRNe/SJR3/d8n3i30mgsHJFLN9OKyteToOW0vCX6DlLDWhCtSCW5ItsQOH9
 dAWxJgwFFgju83M0fmE20pFJURAdzh0ovO7C2+IUhCM3Y186ohcFR0UYLhLT4VXZEB3Va+8Z1Yf
 1tojhi9curP6uMrIuiDiHOrb/kUWwbX+IFvNpdmgnisK5nRPWinF4r0s0QyjU0dOV8skC09u+og
 AvaWCqti90GAxQhX1nBotw06YWRr9E8i9ha1DRMoYUtjmJn7fdNX0gz7h5SwpN2os3P0mBy8q3a
 z75VjWF+FIR3LTg2yzj6g==
X-Received: by 2002:a05:6512:3a86:b0:5a2:9b98:f280 with SMTP id
 2adb3069b0e04-5a4172ac06fmr11429493e87.22.1777098428160; 
 Fri, 24 Apr 2026 23:27:08 -0700 (PDT)
Received: from Thor.lan (nb6bp2luucgh1ubvhqb-1.v6.elisa-laajakaista.fi.
 [2001:99a:a58:9b00:9119:221d:45f0:de83])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4185bc672sm6723847e87.34.2026.04.24.23.27.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 23:27:07 -0700 (PDT)
From: Maxin John <maxin.john@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Apr 2026 09:27:05 +0300
Message-ID: <20260425062705.74982-1-maxin.john@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777098428; x=1777703228; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=+A6EIfDTWMs/c6kCV8vh96GQekoOwo8BlL3BRIYAGbI=;
 b=LTcbk1OddD2LKCEzlcu4pAAFyIGhL+OkAuJ3SJ7WEf3M1Dkw6w8MI/FjEWvAQL786r
 y/nycLi9fni5AMt88AfzCNH4Go3a8ELF4fFEtw3NnS1d1w2vdplHbaX5nz3qIyRXFXnu
 bd1xXzWAArsb9VDiaVawLqaixPhlanyHrDqx1Eh5THQSzyJ2K9CdAUnq8xYnnpuaZpdk
 T9gkeGJMPrKaMSKBg46Lx6bp4U5uN4nbQtn9t7fuKhP+FnjqrkhV7PCn6YcBMXFqWCds
 +CfsbtHsTxBdhvO8rfbb+tdGgH5JPwzys33VKrsUwQ6D2CE3Lass9ZHVQYfaCQADa9cK
 hw8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=LTcbk1Od
Subject: [Buildroot] [PATCH v2] package/mdadm: bump to version 4.6
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

Signed-off-by: Maxin John <maxin.john@gmail.com>
---
Changes v1 -> v2:
   - add missing 4.4 and 4.5 release links
   - switch download site to GitHub
   - drop unnecessary MDADM_SOURCE
---
 ...not-require-libudev-h-if-DNO_LIBUDEV.patch | 34 ---------------
 ...ts-h-include-for-NAME_MAX-definition.patch | 32 --------------
 .../0003-Create.c-fix-uclibc-build.patch      | 42 -------------------
 .../0004-Makefile-Move-pie-to-LDFLAGS.patch   | 40 ------------------
 package/mdadm/mdadm.hash                      |  5 ++-
 package/mdadm/mdadm.mk                        |  5 +--
 6 files changed, 5 insertions(+), 153 deletions(-)
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
