Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE75C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 20:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 745AB40356;
	Mon, 27 Dec 2021 20:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BbJGmR3f-uiL; Mon, 27 Dec 2021 20:01:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72BAC4051E;
	Mon, 27 Dec 2021 20:01:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14A211BF8B4
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F47A40186
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gFD4S87fLFdz for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 20:00:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA50040191
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 20:00:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0E9E182A9A; Mon, 27 Dec 2021 19:54:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 20:59:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b032faa4019b60b34fd96df0a46ee7308e1fe074
X-Git-Newrev: cc28c7aa6df7798ce5ca79d6d1c7c2eb115ba220
X-Patchwork-Hint: ignore
Message-Id: <20211227195433.0E9E182A9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/procps-ng: bump to version 3.3.17
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cc28c7aa6df7798ce5ca79d6d1c7c2eb115ba220
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update indentation in hash file (two spaces)
- Disable w on musl to avoid a build failure:
  https://gitlab.com/procps-ng/procps/-/issues/193

https://gitlab.com/procps-ng/procps/-/blob/v3.3.17/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../procps-ng/0001-configure-Add--disable-w.patch  | 93 ++++++++++++++++++++++
 ...ix-missing-nl_langinfo-on-certain-configs.patch | 34 ++++++++
 package/procps-ng/procps-ng.hash                   | 12 +--
 package/procps-ng/procps-ng.mk                     | 11 ++-
 4 files changed, 143 insertions(+), 7 deletions(-)

diff --git a/package/procps-ng/0001-configure-Add--disable-w.patch b/package/procps-ng/0001-configure-Add--disable-w.patch
new file mode 100644
index 0000000000..8a699df5a6
--- /dev/null
+++ b/package/procps-ng/0001-configure-Add--disable-w.patch
@@ -0,0 +1,93 @@
+From 1524a625e693b956ce0b5091c9f89f24fb7e8614 Mon Sep 17 00:00:00 2001
+From: "Issam E. Maghni" <issam.e.maghni@mailbox.org>
+Date: Fri, 23 Apr 2021 15:58:36 -0400
+Subject: [PATCH] configure: Add --disable-w
+
+[Retrieved (and backported) from:
+https://gitlab.com/procps-ng/procps/-/commit/1524a625e693b956ce0b5091c9f89f24fb7e8614]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am  | 21 +++++++++++++++------
+ configure.ac |  6 ++++++
+ 2 files changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index de15e137..d2356872 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -47,8 +47,7 @@ bin_PROGRAMS = \
+ 	pwdx \
+ 	tload \
+ 	uptime \
+-	vmstat \
+-	w
++	vmstat
+ if BUILD_PWAIT
+ bin_PROGRAMS += pwait
+ endif
+@@ -60,8 +59,7 @@ usrbin_exec_PROGRAMS += \
+ 	pkill \
+ 	pmap \
+ 	uptime \
+-	vmstat \
+-	w
++	vmstat
+ endif
+ 
+ lib_LTLIBRARIES = \
+@@ -74,7 +72,6 @@ dist_man_MANS = \
+ 	pmap.1 \
+ 	uptime.1 \
+ 	vmstat.8 \
+-	w.1 \
+ 	ps/procps.1
+ 
+ if !CYGWIN
+@@ -137,6 +134,19 @@ else
+   EXTRA_DIST += kill.1
+ endif
+ 
++if BUILD_W
++if CYGWIN
++usrbin_exec_PROGRAMS += w
++else
++bin_PROGRAMS += w
++endif
++
++dist_man_MANS += w.1
++w_SOURCES = w.c lib/fileutils.c
++else
++  EXTRA_DIST += w.1
++endif
++
+ if WITH_NCURSES
+ if !CYGWIN
+ bin_PROGRAMS += \
+@@ -213,7 +223,6 @@ endif
+ tload_SOURCES = tload.c lib/strutils.c lib/fileutils.c
+ uptime_SOURCES = uptime.c lib/fileutils.c
+ vmstat_SOURCES = vmstat.c lib/strutils.c lib/fileutils.c
+-w_SOURCES = w.c lib/fileutils.c
+ 
+ # proc/libprocps.la
+ 
+diff --git a/configure.ac b/configure.ac
+index 750c0fbb..3e83fb88 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -234,6 +234,12 @@ AC_ARG_ENABLE([kill],
+   [], [enable_kill=yes]
+ )
+ AM_CONDITIONAL(BUILD_KILL, test "x$enable_kill" = xyes)
++AC_ARG_ENABLE([w],
++  AS_HELP_STRING([--disable-w], [do not build w]),
++  [], [enable_w=yes]
++)
++AM_CONDITIONAL(BUILD_W, test "x$enable_w" = xyes)
++
+ AM_CONDITIONAL(LINUX, test "x$host_os" = xlinux-gnu)
+ AM_CONDITIONAL(CYGWIN, test "x$host_os" = xcygwin)
+ 
+-- 
+GitLab
+
diff --git a/package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch b/package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch
new file mode 100644
index 0000000000..f3e2b126a6
--- /dev/null
+++ b/package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch
@@ -0,0 +1,34 @@
+From 2763b9880a7aab569694d6ee3170dd7341a26b84 Mon Sep 17 00:00:00 2001
+From: "Issam E. Maghni" <issam.e.maghni@mailbox.org>
+Date: Fri, 23 Apr 2021 16:53:39 -0400
+Subject: [PATCH] escape.c: Fix missing nl_langinfo on certain configs
+
+[Retrieved from:
+https://gitlab.com/procps-ng/procps/-/commit/2763b9880a7aab569694d6ee3170dd7341a26b84]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ proc/escape.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/proc/escape.c b/proc/escape.c
+index 2e8fb7dd..cf4a80de 100644
+--- a/proc/escape.c
++++ b/proc/escape.c
+@@ -24,13 +24,13 @@
+ #include "procps.h"
+ #include "escape.h"
+ #include "readproc.h"
++#include "nls.h"
+ 
+ #if (__GNU_LIBRARY__ >= 6) && (!defined(__UCLIBC__) || defined(__UCLIBC_HAS_WCHAR__))
+ # include <wchar.h>
+ # include <wctype.h>
+ # include <stdlib.h>  /* MB_CUR_MAX */
+ # include <ctype.h>
+-# include <langinfo.h>
+ #endif
+ 
+ #define SECURE_ESCAPE_ARGS(dst, bytes, cells) do { \
+-- 
+GitLab
+
diff --git a/package/procps-ng/procps-ng.hash b/package/procps-ng/procps-ng.hash
index 123db992ef..09f2ebd0cb 100644
--- a/package/procps-ng/procps-ng.hash
+++ b/package/procps-ng/procps-ng.hash
@@ -1,8 +1,8 @@
 # From http://sourceforge.net/projects/procps-ng/files/Production/
-md5	2b0717a7cb474b3d6dfdeedfbad2eccc	procps-ng-3.3.15.tar.xz
-sha1	2929bc64f0cf7b2db997eef79b7187658e47230d	procps-ng-3.3.15.tar.xz
+md5  d60613e88c2f442ebd462b5a75313d56  procps-ng-3.3.17.tar.xz
+sha1  a52952e8bc6aaab812176c00d25adc4d4e1552e2  procps-ng-3.3.17.tar.xz
 # Locally calculated after checking signature
-# http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-3.3.15.tar.xz.asc
-sha256 10bd744ffcb3de2d591d2f6acf1a54a7ba070fdcc432a855931a5057149f0465  procps-ng-3.3.15.tar.xz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256 681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  COPYING.LIB
+# http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-3.3.17.tar.xz.asc
+sha256  4518b3e7aafd34ec07d0063d250fd474999b20b200218c3ae56f5d2113f141b4  procps-ng-3.3.17.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  COPYING.LIB
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 84ada1b133..46f75a48ef 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-PROCPS_NG_VERSION = 3.3.15
+PROCPS_NG_VERSION = 3.3.17
 PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
 PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
 PROCPS_NG_LICENSE = GPL-2.0+, LGPL-2.0+ (libproc and libps)
 PROCPS_NG_LICENSE_FILES = COPYING COPYING.LIB
 PROCPS_NG_CPE_ID_VENDOR = procps-ng_project
 PROCPS_NG_INSTALL_STAGING = YES
+# We're patching configure.ac
+PROCPS_NG_AUTORECONF = YES
 PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
@@ -45,6 +47,13 @@ ifeq ($(BR2_STATIC_LIBS),y)
 PROCPS_NG_CONF_OPTS += --disable-numa
 endif
 
+# w requires utmp.h
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+PROCPS_NG_CONF_OPTS += --disable-w
+else
+PROCPS_NG_CONF_OPTS += --enable-w
+endif
+
 # Avoid installing S02sysctl, since openrc provides /etc/init.d/sysctl.
 define PROCPS_NG_INSTALL_INIT_OPENRC
 	@:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
