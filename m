Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10608C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FB894F1FF;
	Fri, 28 Feb 2025 16:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oukt8qrECDsE; Fri, 28 Feb 2025 16:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACB694F1FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACB694F1FC;
	Fri, 28 Feb 2025 16:35:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05F2B1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F5B64199F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V7TXaTLP4pBr for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BD91417FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BD91417FF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84C698769C; Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Dec 2024 17:55:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 80f25d47060dea19b8f3b5fd84b6238375c54729
X-Git-Newrev: fee18cca535f6f08e8d94bb13450e65adbcb7a27
X-Patchwork-Hint: ignore
Message-Id: <20250228162932.84C698769C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/procps-ng: fix
 pidfd_open checking
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fee18cca535f6f08e8d94bb13450e65adbcb7a27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/02a2b1d9ece040c529308800403f0230ead4ed3e/

The previous build setup would check for pidfd_open using
AC_CHECK_FUNC and would be incorrectly reported as true.

Backport patch from upstream:
[1] https://gitlab.com/procps-ng/procps/-/commit/2507bc475782ff5e0541d37c780dff1e293c9553
[2] https://gitlab.com/procps-ng/procps/-/commit/587efb47df7ddbfda4e6abdd1e7792a2531a238f
[3] https://gitlab.com/procps-ng/procps/-/commit/5acbb5dc1587d688de646d739a97251eb893bbb0

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-build-sys-Fix-pidfd_open-checking.patch   | 99 ++++++++++++++++++++++
 ...4-build-sys-Fix-define-of-HAVE_PIDFD_OPEN.patch | 37 ++++++++
 ...p-Include-sys-syscall.h-if-making-pidwait.patch | 41 +++++++++
 package/procps-ng/procps-ng.mk                     |  2 +
 4 files changed, 179 insertions(+)

diff --git a/package/procps-ng/0003-build-sys-Fix-pidfd_open-checking.patch b/package/procps-ng/0003-build-sys-Fix-pidfd_open-checking.patch
new file mode 100644
index 0000000000..fc7e092347
--- /dev/null
+++ b/package/procps-ng/0003-build-sys-Fix-pidfd_open-checking.patch
@@ -0,0 +1,99 @@
+From f37d178d5c25c547835d054fbb1eda32c25034b3 Mon Sep 17 00:00:00 2001
+From: Craig Small <csmall@dropbear.xyz>
+Date: Mon, 30 Sep 2024 17:26:01 +1000
+Subject: [PATCH] build-sys: Fix pidfd_open checking
+
+The previous build setup would check for pidfd_open using
+AC_CHECK_FUNC and would be incorrectly reported as true.
+
+Also, if pidfd_open() and __NR_pidfd_open were not present,
+pidwait would silently not be built.
+
+So, changes:
+ compile a small programin using pidfd_open to test it properly
+ conditionally try to find NR_pidfd_open if the function fails
+ complain if neither are present
+ have --disable-pidwait configure option so you are explicit in
+ not wanting and knowing you wont get pidwait
+
+References:
+ #352
+ commit d9c3e3676d86094abaa239b3218f57bf49d70b4f
+ commit 17f94796a9b3c4f1ff28829107a82107dcb362b4
+
+Signed-off-by: Craig Small <csmall@dropbear.xyz>
+
+Upstream: https://gitlab.com/procps-ng/procps/-/commit/2507bc475782ff5e0541d37c780dff1e293c9553
+
+Signed-off-by: Scott Fan <fancp2007@gmail.com>
+[Scott: backported to version 4.0.4]
+---
+ configure.ac | 45 ++++++++++++++++++++++++++++++---------------
+ 1 file changed, 30 insertions(+), 15 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index fec27e3f..0719fcd1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -170,21 +170,6 @@ AC_TRY_COMPILE([#include <errno.h>],
+ 		AC_MSG_RESULT(yes),
+ 		AC_MSG_RESULT(no))
+ 
+-AC_CHECK_FUNC([pidfd_open], [enable_pidwait=yes], [
+-  AC_MSG_CHECKING([for __NR_pidfd_open])
+-  AC_COMPILE_IFELSE([AC_LANG_SOURCE([
+-#include <sys/syscall.h>
+-#ifndef __NR_pidfd_open
+-#error __NR_pidfd_open not defined
+-#endif
+-    ])], [enable_pidwait=yes], [enable_pidwait=no])
+-  AC_MSG_RESULT([$enable_pidwait])
+-])
+-if test "$enable_pidwait" = yes; then
+-  AC_DEFINE([ENABLE_PIDWAIT], [1], [Enable pidwait])
+-fi
+-AM_CONDITIONAL([BUILD_PIDWAIT], [test x$enable_pidwait = xyes])
+-
+ dnl watch8bit must be before the AC_ARG_WITH set as it sets up ncurses
+ AC_SUBST([WITH_WATCH8BIT])
+ AC_ARG_ENABLE([watch8bit],
+@@ -321,6 +306,36 @@ AC_ARG_ENABLE([pidof],
+ )
+ AM_CONDITIONAL(BUILD_PIDOF, test "x$enable_pidof" = xyes)
+ 
++# If pidwait is enabled, we need either pidfd_open() or __NR_pidfd_open need to be defined
++# Cannot use AC_CHECK_FUNC as it (incorrectly) passes with pidfd_open missing
++AC_ARG_ENABLE([pidwait],
++  AS_HELP_STRING([--disable-pidwait], [do not build pidwait]),
++  [], [
++    enable_pidwait=yes
++    AC_DEFINE(ENABLE_PIDWAIT, 1, [enable pidwait])
++  ]
++)
++AM_CONDITIONAL(BUILD_PIDWAIT, test "x$enable_pidwait" = xyes)
++AC_MSG_CHECKING([for pidfd_open()])
++AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[ [pidfd_open(1,1)]]])],
++  have_pidfd_open=yes; AC_MSG_RESULT([yes]) ,
++  have_pidfd_open=no; AC_MSG_RESULT([no])
++  )
++
++AS_IF([[test "x$enable_pidwait" = xyes -a "x$have_pidfd_open" = xno]],
++   AC_MSG_CHECKING([for __NR_pidfd_open])
++   AC_COMPILE_IFELSE([AC_LANG_SOURCE([
++#include <sys/syscall.h>
++#ifndef __NR_pidfd_open
++#error __NR_pidfd_open not defined
++#endif
++      ])],
++      AC_MSG_RESULT([yes]),
++      AC_MSG_RESULT([no])
++      AC_MSG_ERROR([Neither pidfd_open or __NR_pidfd_open found. Disable pidwait with configure option --disable-pidwait])
++    )
++   ,[])
++
+ AC_ARG_ENABLE([kill],
+   AS_HELP_STRING([--disable-kill], [do not build kill]),
+   [], [enable_kill=yes]
+-- 
+2.43.0
+
diff --git a/package/procps-ng/0004-build-sys-Fix-define-of-HAVE_PIDFD_OPEN.patch b/package/procps-ng/0004-build-sys-Fix-define-of-HAVE_PIDFD_OPEN.patch
new file mode 100644
index 0000000000..aa65df7706
--- /dev/null
+++ b/package/procps-ng/0004-build-sys-Fix-define-of-HAVE_PIDFD_OPEN.patch
@@ -0,0 +1,37 @@
+From 1e2d53e1d86cb75e8f39b42b9a5c409e5d3261ed Mon Sep 17 00:00:00 2001
+From: oli-ben <24815225-oli-ben@users.noreply.gitlab.com>
+Date: Wed, 27 Nov 2024 20:17:11 +0000
+Subject: [PATCH] build-sys: Fix define of HAVE_PIDFD_OPEN
+
+Fix cross-compilation issues when using GCC-12.3
+* configure fails to detect that the sysroot does support the pidfd_open
+  syscall wrapper
+* configure fails to define HAVE_PIDFD_OPEN which is used in pgrep.c,
+  so it fails building, because __NR_pidfd_open is then undefined
+
+Upstream: https://gitlab.com/procps-ng/procps/-/commit/587efb47df7ddbfda4e6abdd1e7792a2531a238f
+
+Signed-off-by: Scott Fan <fancp2007@gmail.com>
+[Scott: backported to version 4.0.4]
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0719fcd1..6242a8f8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -317,8 +317,8 @@ AC_ARG_ENABLE([pidwait],
+ )
+ AM_CONDITIONAL(BUILD_PIDWAIT, test "x$enable_pidwait" = xyes)
+ AC_MSG_CHECKING([for pidfd_open()])
+-AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[ [pidfd_open(1,1)]]])],
+-  have_pidfd_open=yes; AC_MSG_RESULT([yes]) ,
++AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[pidfd_open(1,1)]])],
++  have_pidfd_open=yes; AC_DEFINE(HAVE_PIDFD_OPEN, 1, [pidfd_open is defined]) AC_MSG_RESULT([yes]),
+   have_pidfd_open=no; AC_MSG_RESULT([no])
+   )
+ 
+-- 
+2.43.0
+
diff --git a/package/procps-ng/0005-pgrep-Include-sys-syscall.h-if-making-pidwait.patch b/package/procps-ng/0005-pgrep-Include-sys-syscall.h-if-making-pidwait.patch
new file mode 100644
index 0000000000..74f93c8e49
--- /dev/null
+++ b/package/procps-ng/0005-pgrep-Include-sys-syscall.h-if-making-pidwait.patch
@@ -0,0 +1,41 @@
+From 81ded587d2484b6f470f2d5c837c5591491377ce Mon Sep 17 00:00:00 2001
+From: Craig Small <csmall@dropbear.xyz>
+Date: Thu, 28 Nov 2024 07:20:42 +1100
+Subject: [PATCH] pgrep: Include sys/syscall.h if making pidwait
+
+sys/syscall.h would only be included if pidwait was made
+and we found pidfd_open() The previous commit fixed the
+finding part, but in fact we want sys/syscall.h either
+way because syscall() is defined there too.
+
+Most of the time the header is included by other headers
+but adding it explicitly means if that header is removed or
+changed it still works.
+
+Signed-off-by: Craig Small <csmall@dropbear.xyz>
+
+Upstream: https://gitlab.com/procps-ng/procps/-/commit/5acbb5dc1587d688de646d739a97251eb893bbb0
+
+Signed-off-by: Scott Fan <fancp2007@gmail.com>
+[Scott: backported to version 4.0.4]
+---
+ src/pgrep.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/pgrep.c b/src/pgrep.c
+index d8e57dff..a2607532 100644
+--- a/src/pgrep.c
++++ b/src/pgrep.c
+@@ -44,9 +44,7 @@
+ 
+ #ifdef ENABLE_PIDWAIT
+ #include <sys/epoll.h>
+-#ifndef HAVE_PIDFD_OPEN
+ #include <sys/syscall.h>
+-#endif /* !HAVE_PIDFD_OPEN */
+ #endif
+ 
+ /* EXIT_SUCCESS is 0 */
+-- 
+2.43.0
+
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index c5185c2c8a..9200b6faa6 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -16,6 +16,8 @@ PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
 # Applying 0001-build-sys-Add-systemd-elogind-to-w.patch touches Makefile.am
 # Applying 0002-fix-ncurses-h-include.patch touches configure.ac
+# Applying 0003-build-sys-Fix-pidfd_open-checking.patch touches configure.ac
+# Applying 0004-build-sys-Fix-define-of-HAVE_PIDFD_OPEN.patch touches configure.ac
 PROCPS_NG_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
