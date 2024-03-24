Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0855CD11BF
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 09:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21B43600B3;
	Sun, 24 Mar 2024 09:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBmIiKO-Bs8O; Sun, 24 Mar 2024 09:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D89F605CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D89F605CC;
	Sun, 24 Mar 2024 09:03:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CBF3A1BF5A4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 09:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9EDB605CC
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 09:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggX94jIADTcq for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 09:03:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33880600B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33880600B3
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33880600B3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 09:03:33 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-29f1686ff12so2273652a91.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 02:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711271012; x=1711875812;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q4CZ9t2CG4b00dATISAn7/GOMTZ9XbNsLMswihdkCgE=;
 b=JWa9NX73pEOLJx94J+BOUhj4aeix21pEbafwjsMLfUa0W3l3t5UUEDGHdyQBPkpYmK
 fPM7J8JGHXVjcl15w3tuR/TGZwQTBlc3OBShU7I13nUauZq/34Ap1P0M4EQZYBFHJOtF
 EexwA8R0bwEWSJmecBiNNLImuzfFLYGOpCWYs/lGJzRp8G2F0Ry+2D+iY+sPJDHEsXk0
 qgpNuAPNyn2gILqRZGpY1jj03B9bRQrt13bOOZ2d2Ygk4/Ko03K2XibZ1p7Zk93CIeaa
 E+BOLC2ElMiB4RSjkZoodEzy7AlPpfDj0VquRtns015o5O6DwGHuZcr6ydTBC3zQCdwJ
 3Ywg==
X-Gm-Message-State: AOJu0YzNrYLomMZkFELT7QJBk6QJxX3pK/IuEoyZ9DNZ2sIModgGgvgC
 KpUhaHlvgaHlBNA1HvTiYuBFDGKguc0+nO00O/uUR2rHO7KLlxC7GstHAyhD
X-Google-Smtp-Source: AGHT+IENSVEfGXSHp49/rpKbjpsgSiDIozs0G0VKh2G6wi4xhOhoN2jfQZbYcxHhECVRX7K1MlgvJw==
X-Received: by 2002:a17:90a:6983:b0:29f:ea48:25dd with SMTP id
 s3-20020a17090a698300b0029fea4825ddmr2686267pjj.33.1711271012095; 
 Sun, 24 Mar 2024 02:03:32 -0700 (PDT)
Received: from localhost.localdomain ([2600:8802:2a05:9000:5be:8083:7ea:b94e])
 by smtp.gmail.com with ESMTPSA id
 ns13-20020a17090b250d00b0029b9954a02asm5102246pjb.0.2024.03.24.02.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 02:03:31 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 02:03:25 -0700
Message-Id: <20240324090325.1768623-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711271012; x=1711875812; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4CZ9t2CG4b00dATISAn7/GOMTZ9XbNsLMswihdkCgE=;
 b=hKyOFNsKwf6dWejJJ0qK3+mIqPuB/SmXUAMrCensLEUfecHwWlh1Y0FxYQ+44X5UFG
 2msIUq1F6Z9IKO9zMgOaZCIuWW1B6+o0iquYVufUChq7bCuVNx2imzyJXnWTzPeFumVs
 HVEgdJ4pu8wupi5X9HKaLMJ9FVo5uI05Hx9ZP6LDUpXWXUnEKxN9uxluv0worNNbTWwy
 8b6Tw/z2XtF5pO3uvIFg4gLmc2Yp8hyTiAviNXLagj9Vvc1YxqATX6f+zIuii5JL1/a/
 X+PLuVPJpZTPhXAJqCB+ZhXUnvKNXJFX9Fxj9xtORr2UWIZTr3/5rMvMpdyXPvUhT5KB
 rw3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hKyOFNsK
Subject: [Buildroot] [PATCH 1/1] package/procps-ng: bump to version 4.0.4
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
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes - https://gitlab.com/procps-ng/procps/-/releases/v4.0.4

- Dropped upstream patches - 0001-configure-Add--disable-w.patch and 0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch
- Rename 0003-fix-pifd_open-check.patch to 0001-fix-pifd_open-check.patch. Removed partially upstreamed part.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
$ ./utils/test-pkg -k -c procps-ng.config -p procps-ng
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                             arm-aarch64 [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

$ ./utils/check-package package/procps-ng/*
package/procps-ng/S02sysctl:0: DAEMON variable not defined (https://nightly.buildroot.org/#adding-packages-start-script)
222 lines processed
1 warnings generated

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 .checkpackageignore                           |  4 +-
 .../0001-configure-Add--disable-w.patch       | 93 -------------------
 ...k.patch => 0001-fix-pifd_open-check.patch} | 30 ++----
 ...ssing-nl_langinfo-on-certain-configs.patch | 34 -------
 package/procps-ng/procps-ng.hash              |  8 +-
 package/procps-ng/procps-ng.mk                |  2 +-
 6 files changed, 13 insertions(+), 158 deletions(-)
 delete mode 100644 package/procps-ng/0001-configure-Add--disable-w.patch
 rename package/procps-ng/{0003-fix-pifd_open-check.patch => 0001-fix-pifd_open-check.patch} (59%)
 delete mode 100644 package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index ef1c661812..675f69d212 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1013,9 +1013,7 @@ package/pptp-linux/0002-fix-parallel-build.patch Upstream
 package/prboom/0001-libpng-1.4.patch Upstream
 package/prboom/0002-configure-remove-predefined-O2-optimization-flag.patch Upstream
 package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch Upstream
-package/procps-ng/0001-configure-Add--disable-w.patch Upstream
-package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch Upstream
-package/procps-ng/0003-fix-pifd_open-check.patch Upstream
+package/procps-ng/0001-fix-pifd_open-check.patch Upstream
 package/procps-ng/S02sysctl Variables
 package/proftpd/S50proftpd Indent Shellcheck Variables
 package/prosody/0001-enable-syslog.patch Upstream
diff --git a/package/procps-ng/0001-configure-Add--disable-w.patch b/package/procps-ng/0001-configure-Add--disable-w.patch
deleted file mode 100644
index 8a699df5a6..0000000000
--- a/package/procps-ng/0001-configure-Add--disable-w.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 1524a625e693b956ce0b5091c9f89f24fb7e8614 Mon Sep 17 00:00:00 2001
-From: "Issam E. Maghni" <issam.e.maghni@mailbox.org>
-Date: Fri, 23 Apr 2021 15:58:36 -0400
-Subject: [PATCH] configure: Add --disable-w
-
-[Retrieved (and backported) from:
-https://gitlab.com/procps-ng/procps/-/commit/1524a625e693b956ce0b5091c9f89f24fb7e8614]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile.am  | 21 +++++++++++++++------
- configure.ac |  6 ++++++
- 2 files changed, 21 insertions(+), 6 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index de15e137..d2356872 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -47,8 +47,7 @@ bin_PROGRAMS = \
- 	pwdx \
- 	tload \
- 	uptime \
--	vmstat \
--	w
-+	vmstat
- if BUILD_PWAIT
- bin_PROGRAMS += pwait
- endif
-@@ -60,8 +59,7 @@ usrbin_exec_PROGRAMS += \
- 	pkill \
- 	pmap \
- 	uptime \
--	vmstat \
--	w
-+	vmstat
- endif
- 
- lib_LTLIBRARIES = \
-@@ -74,7 +72,6 @@ dist_man_MANS = \
- 	pmap.1 \
- 	uptime.1 \
- 	vmstat.8 \
--	w.1 \
- 	ps/procps.1
- 
- if !CYGWIN
-@@ -137,6 +134,19 @@ else
-   EXTRA_DIST += kill.1
- endif
- 
-+if BUILD_W
-+if CYGWIN
-+usrbin_exec_PROGRAMS += w
-+else
-+bin_PROGRAMS += w
-+endif
-+
-+dist_man_MANS += w.1
-+w_SOURCES = w.c lib/fileutils.c
-+else
-+  EXTRA_DIST += w.1
-+endif
-+
- if WITH_NCURSES
- if !CYGWIN
- bin_PROGRAMS += \
-@@ -213,7 +223,6 @@ endif
- tload_SOURCES = tload.c lib/strutils.c lib/fileutils.c
- uptime_SOURCES = uptime.c lib/fileutils.c
- vmstat_SOURCES = vmstat.c lib/strutils.c lib/fileutils.c
--w_SOURCES = w.c lib/fileutils.c
- 
- # proc/libprocps.la
- 
-diff --git a/configure.ac b/configure.ac
-index 750c0fbb..3e83fb88 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -234,6 +234,12 @@ AC_ARG_ENABLE([kill],
-   [], [enable_kill=yes]
- )
- AM_CONDITIONAL(BUILD_KILL, test "x$enable_kill" = xyes)
-+AC_ARG_ENABLE([w],
-+  AS_HELP_STRING([--disable-w], [do not build w]),
-+  [], [enable_w=yes]
-+)
-+AM_CONDITIONAL(BUILD_W, test "x$enable_w" = xyes)
-+
- AM_CONDITIONAL(LINUX, test "x$host_os" = xlinux-gnu)
- AM_CONDITIONAL(CYGWIN, test "x$host_os" = xcygwin)
- 
--- 
-GitLab
-
diff --git a/package/procps-ng/0003-fix-pifd_open-check.patch b/package/procps-ng/0001-fix-pifd_open-check.patch
similarity index 59%
rename from package/procps-ng/0003-fix-pifd_open-check.patch
rename to package/procps-ng/0001-fix-pifd_open-check.patch
index 7152901e70..2ff1ef8f3d 100644
--- a/package/procps-ng/0003-fix-pifd_open-check.patch
+++ b/package/procps-ng/0001-fix-pifd_open-check.patch
@@ -13,47 +13,31 @@ pgrep.c:748:17: error: '__NR_pidfd_open' undeclared (first use in this function)
       |                 ^~~~~~~~~~~~~~~
       |                 pidfd_open
 
-This build failure is raised since the addition of pwait in version
-3.3.17 and
-https://gitlab.com/procps-ng/procps/-/commit/c8384e682c1cfb3b2dc797e0f8a3cbaaccf7a3da
 
 Fixes:
  - http://autobuild.buildroot.org/results/f23a5156e641b2ebdd673973dec0f9c87760c688
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: Reverted
 [Upstream status:
-https://gitlab.com/procps-ng/procps/-/merge_requests/166]
+https://gitlab.com/procps-ng/procps/-/commit/d9c3e3676d86094abaa239b3218f57bf49d70b4f]
 ---
- configure.ac | 2 +-
- src/pgrep.c  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ configure.ac | 1 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
 index 629881a6..1a3ccdb8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -160,7 +160,7 @@ AC_TRY_COMPILE([#include <errno.h>],
+@@ -170,7 +170,7 @@
  		AC_MSG_RESULT(yes),
  		AC_MSG_RESULT(no))
  
--AC_CHECK_FUNC([pidfd_open], [enable_pwait=yes], [
-+AC_CHECK_FUNCS([pidfd_open], [enable_pwait=yes], [
+-AC_CHECK_FUNC([pidfd_open], [enable_pidwait=yes], [
++AC_CHECK_FUNCS([pidfd_open], [enable_pidwait=yes], [
    AC_MSG_CHECKING([for __NR_pidfd_open])
    AC_COMPILE_IFELSE([AC_LANG_SOURCE([
  #include <sys/syscall.h>
-diff --git a/pgrep.c b/pgrep.c
-index c4ad5da3..29cfedf7 100644
---- a/pgrep.c
-+++ b/pgrep.c
-@@ -38,7 +38,7 @@
- #include <stdbool.h>
- #include <time.h>
- 
--#if defined(ENABLE_PWAIT) && !defined(HAVE_PIDFD_OPEN)
-+#if defined(ENABLE_PWAIT)
- #include <sys/epoll.h>
- #include <sys/syscall.h>
- #endif
 -- 
 2.35.1
 
diff --git a/package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch b/package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch
deleted file mode 100644
index f3e2b126a6..0000000000
--- a/package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 2763b9880a7aab569694d6ee3170dd7341a26b84 Mon Sep 17 00:00:00 2001
-From: "Issam E. Maghni" <issam.e.maghni@mailbox.org>
-Date: Fri, 23 Apr 2021 16:53:39 -0400
-Subject: [PATCH] escape.c: Fix missing nl_langinfo on certain configs
-
-[Retrieved from:
-https://gitlab.com/procps-ng/procps/-/commit/2763b9880a7aab569694d6ee3170dd7341a26b84]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- proc/escape.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/proc/escape.c b/proc/escape.c
-index 2e8fb7dd..cf4a80de 100644
---- a/proc/escape.c
-+++ b/proc/escape.c
-@@ -24,13 +24,13 @@
- #include "procps.h"
- #include "escape.h"
- #include "readproc.h"
-+#include "nls.h"
- 
- #if (__GNU_LIBRARY__ >= 6) && (!defined(__UCLIBC__) || defined(__UCLIBC_HAS_WCHAR__))
- # include <wchar.h>
- # include <wctype.h>
- # include <stdlib.h>  /* MB_CUR_MAX */
- # include <ctype.h>
--# include <langinfo.h>
- #endif
- 
- #define SECURE_ESCAPE_ARGS(dst, bytes, cells) do { \
--- 
-GitLab
-
diff --git a/package/procps-ng/procps-ng.hash b/package/procps-ng/procps-ng.hash
index 09f2ebd0cb..0d9cd9a835 100644
--- a/package/procps-ng/procps-ng.hash
+++ b/package/procps-ng/procps-ng.hash
@@ -1,8 +1,8 @@
 # From http://sourceforge.net/projects/procps-ng/files/Production/
-md5  d60613e88c2f442ebd462b5a75313d56  procps-ng-3.3.17.tar.xz
-sha1  a52952e8bc6aaab812176c00d25adc4d4e1552e2  procps-ng-3.3.17.tar.xz
+md5  2f747fc7df8ccf402d03e375c565cf96  procps-ng-4.0.4.tar.xz
+sha1  2b859acd7060e9898ac457dbd26dbebf563cc44b  procps-ng-4.0.4.tar.xz
 # Locally calculated after checking signature
-# http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-3.3.17.tar.xz.asc
-sha256  4518b3e7aafd34ec07d0063d250fd474999b20b200218c3ae56f5d2113f141b4  procps-ng-3.3.17.tar.xz
+# http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-4.0.4.tar.xz.asc
+sha256  22870d6feb2478adb617ce4f09a787addaf2d260c5a8aa7b17d889a962c5e42e  procps-ng-4.0.4.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  COPYING.LIB
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index ba8958d146..ea88de7fcf 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROCPS_NG_VERSION = 3.3.17
+PROCPS_NG_VERSION = 4.0.4
 PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
 PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
 PROCPS_NG_LICENSE = GPL-2.0+, LGPL-2.0+ (libproc and libps)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
