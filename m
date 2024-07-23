Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD02C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 12:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9FCE80F78;
	Tue, 23 Jul 2024 12:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 60rLkr0LYhry; Tue, 23 Jul 2024 12:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F3688105C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F3688105C;
	Tue, 23 Jul 2024 12:01:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E3DE1BF28B
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 12:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A14C8105C
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 12:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsgsC9grR2K9 for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 12:01:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 74A4280F78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74A4280F78
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74A4280F78
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 12:01:49 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3685b9c8998so2328187f8f.0
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 05:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721736107; x=1722340907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PhRtCqZDXI+YbejpJU26pB9+6MpVbbmowHvcolMhkyQ=;
 b=HzW0isujjYpcOqh9EOcg8HA1to4Hrm8+DFQimF1aiOrpjozbVnN/cX2Lj8O7GmcBz9
 P1eNjSSzQCCnSWk2H7Jw/yj0TQZi5w3DE9TEeOXsgDQrB6k0H1a62d5rUuRRL31SugsT
 ZyPC9hjgsLQiFQ5VTa9Kx/eHapCZ4FfirobwrEZDeb/E6ky36Vq9Z9+NS3AOia3b/cBN
 eDdXi9nja4UDYmojEWeVJ3M3iM6Z1djmY0o2Ja9pewy80p1kOEbSpzxGC6r2VJf6oysC
 +ignDFcpUVvvPNbG53O/mmw7YbcQWtum2u3NimmIPmWwsISTzrDHOQv8sYtyIMrWmAvb
 eTJg==
X-Gm-Message-State: AOJu0Yx3Dohp5HUb0Peb62okBJFWkDCyEY+1VJK2Mz1xH9fbZ2R1yV09
 WeMzVD/m3wQ4ajlN+ldssHvCG8tTNlTkjPz4r6D+vJBu0Ap7t3D0jTv52g==
X-Google-Smtp-Source: AGHT+IECmEyZPOpGrUEA723lKQQsC8xo8BeAiFTQtIkL75uOd+tAILtFyiVa5WtmyPrISU7ofX1v1Q==
X-Received: by 2002:adf:ebc6:0:b0:368:7f4f:9e95 with SMTP id
 ffacd0b85a97d-369dec0481bmr1795849f8f.10.1721736106641; 
 Tue, 23 Jul 2024 05:01:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3687869447dsm11356527f8f.53.2024.07.23.05.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 05:01:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 14:01:40 +0200
Message-ID: <20240723120140.176562-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721736107; x=1722340907; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PhRtCqZDXI+YbejpJU26pB9+6MpVbbmowHvcolMhkyQ=;
 b=Zhg2a52G2CnnQhorS8Lwr58A8AwvJoSX0/etukpJyzdfzaLWI6aCK5pgUbZ8RpFtfI
 ZqVnypZBECjWdHme6n3XDl4/uY6fUATR1tTZh0WVxnU1CIxmC0Rn6qA6bVR/KEpxYkI/
 +PoFVy+l0QfyUv/1gABrcQiZzw+WK/lsvXRrdaxAw/n8fp9ffqjZCj4T04gzfINBtC+t
 yqFCR1vip2tVGfdM9VAB+dYKIUwOnfhmx0MxkZgptJr2zU61iUx4zbrwk2JxT4QGAr62
 qUEbF/O/nxBZNT3t+6hL63bjOVDWePEDP+BDEbCayqQlxXKHgWwC23ww1Igcoeu8ARKB
 hrdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Zhg2a52G
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop all patches (already in version) and so also drop autoreconf
- This bump will also fix the following build failure with gcc >= 14:

  pgrep.c: In function 'main':
  pgrep.c:1066:37: error: implicit declaration of function 'pidfd_open'; did you mean 'fdopen'? [-Wimplicit-function-declaration]
   1066 |                         int pidfd = pidfd_open(procs[i].num, 0);
        |                                     ^~~~~~~~~~
        |                                     fdopen

https://gitlab.com/procps-ng/procps/-/blob/v4.0.4/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/bd7b49123905c580842a3dd3b7a338d5aedf55d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  3 -
 .../0001-configure-Add--disable-w.patch       | 93 -------------------
 ...ssing-nl_langinfo-on-certain-configs.patch | 34 -------
 .../procps-ng/0003-fix-pifd_open-check.patch  | 59 ------------
 package/procps-ng/procps-ng.hash              |  8 +-
 package/procps-ng/procps-ng.mk                |  4 +-
 6 files changed, 5 insertions(+), 196 deletions(-)
 delete mode 100644 package/procps-ng/0001-configure-Add--disable-w.patch
 delete mode 100644 package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch
 delete mode 100644 package/procps-ng/0003-fix-pifd_open-check.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 760ae29cfb..687086d3a5 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1118,9 +1118,6 @@ package/pptp-linux/0002-fix-parallel-build.patch lib_patch.Upstream
 package/prboom/0001-libpng-1.4.patch lib_patch.Upstream
 package/prboom/0002-configure-remove-predefined-O2-optimization-flag.patch lib_patch.Upstream
 package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch lib_patch.Upstream
-package/procps-ng/0001-configure-Add--disable-w.patch lib_patch.Upstream
-package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch lib_patch.Upstream
-package/procps-ng/0003-fix-pifd_open-check.patch lib_patch.Upstream
 package/procps-ng/S02sysctl lib_sysv.Variables
 package/proftpd/S50proftpd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/prosody/0001-enable-syslog.patch lib_patch.Upstream
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
diff --git a/package/procps-ng/0003-fix-pifd_open-check.patch b/package/procps-ng/0003-fix-pifd_open-check.patch
deleted file mode 100644
index 7152901e70..0000000000
--- a/package/procps-ng/0003-fix-pifd_open-check.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 0cce3e981540c28d2f703b9ab16c04d0df8fa03d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 3 Nov 2022 18:24:53 +0100
-Subject: [PATCH] fix pifd_open check
-
-Replace AC_CHECK_FUNC by AC_CHECK_FUNCS otherwise HAVE_PIDFD_OPEN will
-never be defined resulting in the following build failure if pidfd_open
-is available but __NR_pidfd_open is not available:
-
-pgrep.c: In function 'pidfd_open':
-pgrep.c:748:17: error: '__NR_pidfd_open' undeclared (first use in this function); did you mean 'pidfd_open'?
-  748 |  return syscall(__NR_pidfd_open, pid, flags);
-      |                 ^~~~~~~~~~~~~~~
-      |                 pidfd_open
-
-This build failure is raised since the addition of pwait in version
-3.3.17 and
-https://gitlab.com/procps-ng/procps/-/commit/c8384e682c1cfb3b2dc797e0f8a3cbaaccf7a3da
-
-Fixes:
- - http://autobuild.buildroot.org/results/f23a5156e641b2ebdd673973dec0f9c87760c688
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.com/procps-ng/procps/-/merge_requests/166]
----
- configure.ac | 2 +-
- src/pgrep.c  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 629881a6..1a3ccdb8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -160,7 +160,7 @@ AC_TRY_COMPILE([#include <errno.h>],
- 		AC_MSG_RESULT(yes),
- 		AC_MSG_RESULT(no))
- 
--AC_CHECK_FUNC([pidfd_open], [enable_pwait=yes], [
-+AC_CHECK_FUNCS([pidfd_open], [enable_pwait=yes], [
-   AC_MSG_CHECKING([for __NR_pidfd_open])
-   AC_COMPILE_IFELSE([AC_LANG_SOURCE([
- #include <sys/syscall.h>
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
--- 
-2.35.1
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
index ba8958d146..c5675e2ee6 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-PROCPS_NG_VERSION = 3.3.17
+PROCPS_NG_VERSION = 4.0.4
 PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
 PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
 PROCPS_NG_LICENSE = GPL-2.0+, LGPL-2.0+ (libproc and libps)
 PROCPS_NG_LICENSE_FILES = COPYING COPYING.LIB
 PROCPS_NG_CPE_ID_VALID = YES
 PROCPS_NG_INSTALL_STAGING = YES
-# We're patching configure.ac
-PROCPS_NG_AUTORECONF = YES
 PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
