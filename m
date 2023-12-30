Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E8FC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 16:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81DC48272C;
	Sat, 30 Dec 2023 16:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81DC48272C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qz9wsoSR1uMQ; Sat, 30 Dec 2023 16:21:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E8398223D;
	Sat, 30 Dec 2023 16:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E8398223D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 299FA1BF3DE
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 16:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0139740598
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 16:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0139740598
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ux2rKXKQxgNz for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 16:21:20 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 395704036A
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 16:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 395704036A
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-336f2c88361so3112607f8f.3
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 08:21:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703953278; x=1704558078;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EGy0lkwrcJ9DaalPXKxx2X6HoJE/dVRGS5L39zYrcqc=;
 b=J6baJNzphBq+Otf1KHKo2AyqpJ6oh3VgIp0T4gsVSVPFI5N8wL6c1F7uS1l+PIqZwD
 fsnjnl0HSZjc87jI5chL2wduyi4T1/ACCHAnhfCVgrhlHWdCpc5pY9XISbPyyKXfRIjx
 piN9zGuYusD4l43ZR+mO+iwem/TF4RiAWws2ST/9WAjz6ilqRPp1CIG2IzBIg9xPvRkH
 N1EbiQ5wAmkegkrNFcrlZ3o+/UFhmi5pWaFUOod2yYTs85MMlVVoLJVm7tfF3rPnNdE6
 DnRTYZNKzIYNHbQlg8bdqd40oT2NYz03MSy+UmMiwOObrO/6sf2+RTKCIH0GGzLDOyzV
 9I8w==
X-Gm-Message-State: AOJu0YwmFERa+3eiyZl+f86dWjTnFY4Uz+C/O94XliOdOpJVsVFWRpWl
 GhP10/FF7LJagThfDXJKr4WqzlfuHXQ=
X-Google-Smtp-Source: AGHT+IEPFHd+rOgOwrE+XzGBTwJltQTX7AtEpCcSY9TVfrYBbSaUxdsAcPCXM0qRVkJGbRx23UkiYw==
X-Received: by 2002:a5d:6511:0:b0:336:7357:acc5 with SMTP id
 x17-20020a5d6511000000b003367357acc5mr5831601wru.73.1703953277581; 
 Sat, 30 Dec 2023 08:21:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r8-20020a5d4948000000b003367a5b6b69sm21682050wrs.106.2023.12.30.08.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 08:21:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 17:21:11 +0100
Message-ID: <20231230162111.349884-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703953278; x=1704558078; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EGy0lkwrcJ9DaalPXKxx2X6HoJE/dVRGS5L39zYrcqc=;
 b=B0aqtm5bbJ/ucfCm7FOVAyXpRiUGg9jB9pdfMZqDehNEBWMq5kBjg5AMyNMFnM1aco
 PbCWHfelHtFS2e2qVkhUHgYlFat1DtmzUW4yi7+HbTAwTPS3jgF0yQoG6FaYK/m5hW+w
 lvgNDUcub2sFT7e1R+rpIq0syl8ZWiXM4uWIJlfQmCCpzy2jGoRn6w1Rz6zhNU4W1ziO
 Fv1hKvXmUMt7h12KHCGjijUFiBr8Fb5/kDZXg1a4CH1yMGc6+ZfhE0Ibdidpj2gyi5A4
 9E7lQvLBPDVAxWbrJNRV8Fpwo4jH7kDyD3GGD4U8fcOU8pffuRjLYGZh38BzevYqNb29
 vvFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=B0aqtm5b
Subject: [Buildroot] [PATCH 1/1] package/catatonit: bump to version 0.2.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop first patch (already in version)
- Update second patch
- License changed to GPL-2.0+:
  https://github.com/openSUSE/catatonit/commit/fe191ef859c6365d44a4d7f4ac9765dee825d78c

https://github.com/openSUSE/catatonit/releases/tag/v0.2.0
https://github.com/openSUSE/catatonit/compare/v0.1.7...v0.2.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...e.ac-call-AM_INIT_AUTOMAKE-only-once.patch | 41 -------------------
 ...h => 0001-fix-build-with-kernel-5.9.patch} | 15 +++----
 package/catatonit/catatonit.hash              |  4 +-
 package/catatonit/catatonit.mk                |  4 +-
 5 files changed, 10 insertions(+), 55 deletions(-)
 delete mode 100644 package/catatonit/0001-configure.ac-call-AM_INIT_AUTOMAKE-only-once.patch
 rename package/catatonit/{0002-fix-build-with-kernel-5.9.patch => 0001-fix-build-with-kernel-5.9.patch} (83%)

diff --git a/.checkpackageignore b/.checkpackageignore
index e5ab42097d..7554df6f56 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -234,7 +234,6 @@ package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo
 package/cairo/0003-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch Upstream
 package/cairo/0004-Fix-mask-usage-in-image-compositor.patch Upstream
 package/caps/0001-Fix-stdint-types-with-musl.patch Upstream
-package/catatonit/0002-fix-build-with-kernel-5.9.patch Upstream
 package/cdrkit/0001-no-rcmd.patch Upstream
 package/cdrkit/0002-define-__THROW-to-avoid-build-issue-with-musl.patch Upstream
 package/cdrkit/0003-Add-extern-to-char-outfile-declaration-to-fix-build-.patch Upstream
diff --git a/package/catatonit/0001-configure.ac-call-AM_INIT_AUTOMAKE-only-once.patch b/package/catatonit/0001-configure.ac-call-AM_INIT_AUTOMAKE-only-once.patch
deleted file mode 100644
index b978a827a1..0000000000
--- a/package/catatonit/0001-configure.ac-call-AM_INIT_AUTOMAKE-only-once.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 99bb9048f532257f3a2c3856cfa19fe957ab6cec Mon Sep 17 00:00:00 2001
-From: Antonio Terceiro <terceiro@debian.org>
-Date: Thu, 4 Nov 2021 07:37:13 -0300
-Subject: [PATCH] configure.ac: call AM_INIT_AUTOMAKE only once
-
-That second call seems to be there since the beginning, and autoconf
-2.69 was fine with it. autoconf 2.71 doesn't allow it anymore:
-
-    $ ./autogen.sh
-    autoreconf: export WARNINGS=
-    autoreconf: Entering directory '.'
-    autoreconf: configure.ac: not using Gettext
-    autoreconf: running: aclocal --force
-    configure.ac:34: error: AM_INIT_AUTOMAKE expanded multiple times
-    /usr/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
-    configure.ac:19: the top level
-    /usr/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
-    configure.ac:34: the top level
-    autom4te: error: /usr/bin/m4 failed with exit status: 1
-    aclocal: error: /usr/bin/autom4te failed with exit status: 1
-    autoreconf: error: aclocal failed with exit status: 1
-
-Signed-off-by: Antonio Terceiro <terceiro@debian.org>
-Upstream: https://github.com/openSUSE/catatonit/commit/99bb9048f532257f3a2c3856cfa19fe957ab6cec
-Signed-off-by: Christian Stewart <christian@paral.in>
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 12c9186..94c5c84 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -31,4 +31,3 @@ AC_FUNC_FORK
- 
- AC_CONFIG_FILES([Makefile config.h])
- AC_OUTPUT
--AM_INIT_AUTOMAKE
--- 
-2.37.2
-
diff --git a/package/catatonit/0002-fix-build-with-kernel-5.9.patch b/package/catatonit/0001-fix-build-with-kernel-5.9.patch
similarity index 83%
rename from package/catatonit/0002-fix-build-with-kernel-5.9.patch
rename to package/catatonit/0001-fix-build-with-kernel-5.9.patch
index a4c66389db..37def8e546 100644
--- a/package/catatonit/0002-fix-build-with-kernel-5.9.patch
+++ b/package/catatonit/0001-fix-build-with-kernel-5.9.patch
@@ -1,4 +1,4 @@
-From 1fefcbffe4ade02d625bf058a7c07aeaf9fa7a2f Mon Sep 17 00:00:00 2001
+From 65e1b96bd40cb14b3729ac56bb9f1fcb77254403 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Tue, 1 Nov 2022 14:16:01 +0100
 Subject: [PATCH] fix build with kernel < 5.9
@@ -15,17 +15,17 @@ Fixes:
  - http://autobuild.buildroot.org/results/ed9a847905083175c7fcb2f2df28f9ac5b9c3313
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/openSUSE/catatonit/pull/24]
+Upstream: https://github.com/openSUSE/catatonit/commit/663ad1670689143f65af3a288f90cecb7feed54f
 ---
  catatonit.c  | 2 +-
  configure.ac | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/catatonit.c b/catatonit.c
-index a38263a..474c525 100644
+index a33f4cd..b10d9b0 100644
 --- a/catatonit.c
 +++ b/catatonit.c
-@@ -35,7 +35,7 @@
+@@ -36,7 +36,7 @@
  #include <limits.h>
  #include <dirent.h>
  
@@ -35,10 +35,10 @@ index a38263a..474c525 100644
  #else
  # include <sys/syscall.h>
 diff --git a/configure.ac b/configure.ac
-index 94c5c84..a746ea1 100644
+index 69e89f0..b37f146 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -22,7 +22,7 @@ LT_PREREQ([2.4.2])
+@@ -24,7 +24,7 @@ LT_PREREQ([2.4.2])
  LT_INIT([disable-shared])
  
  AC_CHECK_HEADERS([errno.h fcntl.h signal.h stdarg.h stdio.h stdlib.h unistd.h])
@@ -47,6 +47,3 @@ index 94c5c84..a746ea1 100644
  
  AC_CHECK_FUNCS([close_range])
  
--- 
-2.35.1
-
diff --git a/package/catatonit/catatonit.hash b/package/catatonit/catatonit.hash
index 9b7420cdb7..9940309c76 100644
--- a/package/catatonit/catatonit.hash
+++ b/package/catatonit/catatonit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e22bc72ebc23762dad8f5d2ed9d5ab1aaad567bdd54422f1d1da775277a93296  catatonit-0.1.7.tar.gz
-sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
+sha256  d0cf1feffdc89c9fb52af20fc10127887a408bbd99e0424558d182b310a3dc92  catatonit-0.2.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/catatonit/catatonit.mk b/package/catatonit/catatonit.mk
index 3dd58eff1d..a308ea6471 100644
--- a/package/catatonit/catatonit.mk
+++ b/package/catatonit/catatonit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CATATONIT_VERSION = 0.1.7
+CATATONIT_VERSION = 0.2.0
 CATATONIT_SITE = $(call github,openSUSE,catatonit,v$(CATATONIT_VERSION))
-CATATONIT_LICENSE = GPL-3.0+
+CATATONIT_LICENSE = GPL-2.0+
 CATATONIT_LICENSE_FILES = COPYING
 
 CATATONIT_AUTORECONF = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
