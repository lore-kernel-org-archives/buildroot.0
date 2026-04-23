Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95547FDEE45
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 20:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35EE360F1D;
	Thu, 23 Apr 2026 20:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njjAoDbyyhl9; Thu, 23 Apr 2026 20:54:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3263460F76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776977680;
	bh=mxw1eJ1CaggiVcQL/cqLylYEK6gH6841KGyFT1jXeS0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Bn/er6D8AsWLVkDdQDlfcc1KrggN4lRPrqN6pSMdHSgX5xmzwAfS4P44bfanLrjuO
	 v5y76mshcAa3FGdfuDPukLQxQRmrkMI8Y5jU2TIQvbogdWEMH7oD0QbwI+yc21evbP
	 071qHwRuUrxnQCibAEBy9c/UJ4qTSzWq0tKmIU/DuKSASf7PpRlYETEAHK7S7mGK7h
	 M+bZJhkBRKpkbz+jrBWpImAwcZUvVd9nmxFcVpv5LIUfvihA9vDHaocBaZe9qPpFQd
	 FGBZh7rhSWhAqYKbjyXuHEjhFR4VVIZ2Z8veXQgj/iiz0LYyJ3uXvRNWzFmqD5ozWi
	 7PlL+7N2vPd5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3263460F76;
	Thu, 23 Apr 2026 20:54:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF772206
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6E8B80847
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egYy_HzQXCFS for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 20:54:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=maxin.john@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8346980729
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8346980729
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8346980729
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:54:38 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-38e7d983f79so55142601fa.0
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 13:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776977676; x=1777582476;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4lC/0odhufck4EZKxN+Zc4gwW4WFEglgjhu5lzyGE4A=;
 b=mY/GsEei2oAOrTRLy0f7DRKd7+Cvc2vEU6HVQdfgZTNsaS/3ecvYrRvmEvMtYgdpeP
 XegnGC+eYyN9OLtFXa6lZy88tvtVXarahncd3ZRvAz6EDyYYGRHoSwUc+xjgS/NkLpi/
 80s7xwmcEromB51JmNudgmX0g4mSs1COs8Uq6d/VDCj3aEmu7+fC23sK/FmPzcZ3dLwb
 d/VpM6THoAIKSwIUk4iThUSK4zu7ESyr6OOQjXnkfH8ytiwn3Hzn7OnvkDZeje+fg78K
 0tWl15Rc9+dtWxKSuTni/FHGNsuO6M93FbCHgDF9Ohtm0xpL/ttfGjC/Pzu0KdsYATfk
 u85g==
X-Gm-Message-State: AOJu0YzvQ7YMCs1fext72tr055jX1T6KSbKxHbElHteaY/Rwf0f3grLU
 ckXlumv6a04589QBt1qDb3CwdtqeCH/RlvASP2viEwgRNLPgXloN/J5LSh2jhw==
X-Gm-Gg: AeBDietCQohIU6zwAIy4LyNduCAJ0aA1JxdezApv2eT3K7EpRPu3m9Y2yKXsvk9teSC
 C5ZxDQglhvuuld5P+0tZHzRuUPGjU4f3W3ik+EY44dNhg1VxYzyFfKE3pAkt3EODRi9gWeNs2ox
 lKRJwjRsq3RpQHdLiWJJINUc6HvD+PS0L86UuF9IRPkQkR6eVvuR2OjDdC6/ZQ4TqEDaBUxBVg5
 H+Q0Rujv8YofxmK6wV8vsl+p5omexvjlARMJmbhxTC4H7ZLBe6vffxUEqIK3JfL7FaIm0DVChoU
 J3uKy0Vqe9RKNGBFHfa0AK+aGOgJ8GBgzHiboI5SU/PtDoAyDpvUnI62xAhztVyGEMf+CtSkGIz
 D2Nh9sXYapJ4ia+Q8EfZnFAVGeOlTqAT0Q9X9auycyU8Lt7EIi67QIS/mQJkg4Z9MXka97xQkGJ
 Q3kajxtCX1LcbJ+y/yBlKhHi5+wL4SZGOsOZp41Q3Y4ZCvfgy7POHoWtJxH4JJVHYaL/z5pFrlf
 5Jm7cYNZDk=
X-Received: by 2002:a05:6512:3510:b0:5a4:194f:5fff with SMTP id
 2adb3069b0e04-5a4194f60edmr7169829e87.16.1776977675958; 
 Thu, 23 Apr 2026 13:54:35 -0700 (PDT)
Received: from Thor.lan (nb6bp2luucgh1ubvhqb-1.v6.elisa-laajakaista.fi.
 [2001:99a:a58:9b00:9119:221d:45f0:de83])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187ec153sm5494202e87.79.2026.04.23.13.54.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 13:54:34 -0700 (PDT)
From: Maxin John <maxin.john@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 23:54:32 +0300
Message-ID: <20260423205432.1832982-1-maxin.john@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776977676; x=1777582476; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=4lC/0odhufck4EZKxN+Zc4gwW4WFEglgjhu5lzyGE4A=;
 b=BBvtsCwRkJm9zQXCwW6gvc4mry8AjMIsZIW+MDZ7sVgRNJVUI6MBqwxSWVAzbxbH8w
 TjNjbMYrJu6n4hYmjgeACHTidUn+qrp/2O3ytsXQo9AGCIJZJf8Pubn+f5cFbNKeynS9
 hsSTyFphvNmQvRl3NtvnIVoj+/YNT0n4OtPZjanZXqvh/9mlzMbo+GlCvGwifeqn9eDs
 6AfR/6mj7FHip90V6lMMcQUOt0RA6JUO3u4ZBUPSIckJTDsD4SjjzMCY/oIRTzNBZfgY
 lpfxvWJqhU3ucRacyw3+HRh2KjYSTGKD3AH/pDfML6gHRR7pA6eOKpMPdgCuxQffUYuz
 0SsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=BBvtsCwR
Subject: [Buildroot] [PATCH] package/mdadm: bump to version 4.6
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

Release mail:
https://lore.kernel.org/linux-raid/CALTww2_2pjjOSsVj-WT++m35555CjnPWokU7fut+HwUJVV-=ZQ@mail.gmail.com/

Signed-off-by: Maxin John <maxin.john@gmail.com>
---
 ...not-require-libudev-h-if-DNO_LIBUDEV.patch | 34 ---------------
 ...ts-h-include-for-NAME_MAX-definition.patch | 32 --------------
 .../0003-Create.c-fix-uclibc-build.patch      | 42 -------------------
 .../0004-Makefile-Move-pie-to-LDFLAGS.patch   | 40 ------------------
 package/mdadm/mdadm.hash                      |  5 ++-
 package/mdadm/mdadm.mk                        |  6 +--
 6 files changed, 6 insertions(+), 153 deletions(-)
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
index 84bae1aebfd5..038222c17e51 100644
--- a/package/mdadm/mdadm.hash
+++ b/package/mdadm/mdadm.hash
@@ -1,4 +1,5 @@
-# From https://www.kernel.org/pub/linux/utils/raid/mdadm/sha256sums.asc
-sha256  416727ae1f1080ea6e3090cea36dd076826fc369151e36ab736557ba92196f9f  mdadm-4.3.tar.xz
+# Locally calculated
+sha256  e89f24994f403cea90068d03f3c1ee49957303c7a092cc5b2ed2c603df9649a7  mdadm-4.6.tar.gz
+
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 421f06d6953f..a6d7f98f0eb2 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MDADM_VERSION = 4.3
-MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
-MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
+MDADM_VERSION = 4.6
+MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.gz
+MDADM_SITE = https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/snapshot
 MDADM_LICENSE = GPL-2.0+
 MDADM_LICENSE_FILES = COPYING
 MDADM_CPE_ID_VALID = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
