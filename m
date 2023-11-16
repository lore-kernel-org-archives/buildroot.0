Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA59C47071
	for <buildroot@archiver.kernel.org>; Thu, 16 Nov 2023 20:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D18D640C13;
	Thu, 16 Nov 2023 20:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D18D640C13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZMLWIJbz2oS; Thu, 16 Nov 2023 20:17:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8308841464;
	Thu, 16 Nov 2023 20:17:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8308841464
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AEA5E1BF330
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 20:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87E5B610FA
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 20:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87E5B610FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNFxg8HWhDBL for <buildroot@lists.busybox.net>;
 Thu, 16 Nov 2023 20:16:58 +0000 (UTC)
X-Greylist: delayed 3331 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 16 Nov 2023 20:16:58 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 578D7610F1
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.78.210])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 578D7610F1
 for <buildroot@buildroot.org>; Thu, 16 Nov 2023 20:16:58 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxd-775f8c97c6-d4tv8
 (smtpc-mxd-775f8c97c6-d4tv8 [2a02:598:64:8a00::1000:a1b])
 id 2ea6e77a988658212ea1590d; Thu, 16 Nov 2023 21:16:46 +0100 (CET)
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
 by smtpd-relay-79cfdc7465-bkt6g (smtpd/2.0.15) with ESMTPA
 id f2a8a052-b631-4488-8e8d-3417e28e465a;
 Thu, 16 Nov 2023 21:16:42 +0100
From: Petr Vorel <pevik@seznam.cz>
To: buildroot@buildroot.org
Date: Thu, 16 Nov 2023 21:16:29 +0100
Message-ID: <20231116201629.2623827-1-pevik@seznam.cz>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=seznam.cz; s=szn20221014; t=1700165806;
 bh=mgVj6qoxMsccah9qS7pp+L3KL3SEqUZ8DsVGNQCKyp4=;
 h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 b=GKLwji5JlbQZOrUxLaq2F2FnL9jZ8vmTd3zYyUXBK625PnQ38JOUzBJqk2kt2GY90
 AOnPDdnjbeboXMS2wxCX3RhyJbFiSeKTxDdOQIcny2P2jYp8Wyo0UNmPseP6IUarcL
 bNCO+zScI4+moXWGmVzxxz96lHP+gBns1M8ULwRerYQ3BzvQY7ER8Z9/yGROrNgOwl
 E920DMej2zXKXDkwzMzOq5IReE4e/Pnk7f2DZYEGbw+uqHMiAiG2HWtqgaVAd9lo0D
 4JOLlqamKG3b6xmr7Cp0MYXBHxLg9wwfrqxn2tB3uL3CdDMcrlXAVCUI9hzk43+gBi
 HAmndtLwCV/SQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz
 header.a=rsa-sha256 header.s=szn20221014 header.b=GKLwji5J
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: fix build failure due to
 glibc <= 2.24
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Petr Vorel <petr.vorel@gmail.com>

Backport upstream patches that check if <sys/random.h> exists or not. If
it doesn't exist it uses uses the corresponding syscall.

NOTE: This would not be enough on Linux kernel < 3.17, but that's old
enough.

Fixes: http://autobuild.buildroot.net/results/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

I'm sorry for the noise (I sent unsubscribed).

NOTE: I was not able to test the build, therefore it *should* fix it.

Kind regards,
Petr

 ...export-fsidd.c-Remove-unused-headers.patch |  42 +++++++
 ...ort-reexport.c-Remove-unused-headers.patch |  43 +++++++
 ...kend_sqlite.c-Add-getrandom-fallback.patch | 113 ++++++++++++++++++
 3 files changed, 198 insertions(+)
 create mode 100644 package/nfs-utils/0003-reexport-fsidd.c-Remove-unused-headers.patch
 create mode 100644 package/nfs-utils/0004-support-reexport.c-Remove-unused-headers.patch
 create mode 100644 package/nfs-utils/0005-support-backend_sqlite.c-Add-getrandom-fallback.patch

diff --git a/package/nfs-utils/0003-reexport-fsidd.c-Remove-unused-headers.patch b/package/nfs-utils/0003-reexport-fsidd.c-Remove-unused-headers.patch
new file mode 100644
index 0000000000..0331a8c9f8
--- /dev/null
+++ b/package/nfs-utils/0003-reexport-fsidd.c-Remove-unused-headers.patch
@@ -0,0 +1,42 @@
+From 1a4edb2aa6b9b88fcdcb8d82b262467d06527623 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Fri, 10 Nov 2023 10:35:33 -0500
+Subject: [PATCH 1/3] reexport/fsidd.c: Remove unused headers
+
+Some of them are needed but included elsewhere, e.g. <string.h>
+included in xcommon.h, but at least <sys/random.h> is removed due
+further code simplification.
+
+Fixes: 6fd2732d ("export: Add fsidd")
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=1a4edb2aa6b9b88fcdcb8d82b262467d06527623
+---
+ support/reexport/fsidd.c | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/support/reexport/fsidd.c b/support/reexport/fsidd.c
+index d4b245e8..3e62b3fc 100644
+--- a/support/reexport/fsidd.c
++++ b/support/reexport/fsidd.c
+@@ -7,16 +7,6 @@
+ #include <dlfcn.h>
+ #endif
+ #include <event2/event.h>
+-#include <limits.h>
+-#include <stdint.h>
+-#include <stdio.h>
+-#include <sys/random.h>
+-#include <sys/socket.h>
+-#include <sys/stat.h>
+-#include <sys/types.h>
+-#include <sys/un.h>
+-#include <sys/vfs.h>
+-#include <unistd.h>
+ 
+ #include "conffile.h"
+ #include "reexport_backend.h"
+-- 
+2.42.0
+
diff --git a/package/nfs-utils/0004-support-reexport.c-Remove-unused-headers.patch b/package/nfs-utils/0004-support-reexport.c-Remove-unused-headers.patch
new file mode 100644
index 0000000000..23d3e80ada
--- /dev/null
+++ b/package/nfs-utils/0004-support-reexport.c-Remove-unused-headers.patch
@@ -0,0 +1,43 @@
+From bdc79f02c17fc9ec7461d48007105caac789cef4 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Fri, 10 Nov 2023 10:39:05 -0500
+Subject: [PATCH 2/3] support/reexport.c: Remove unused headers
+
+Some of them are needed but included elsewhere, e.g. <sys/socket.h>
+included in nfslib.h or <string.h> included in xcommon.h, but at least
+<sys/random.h> is removed due further code simplification.
+
+Fixes: 878674b3 ("Add reexport helper library")
+Reviewed-by: Richard Weinberger <richard@nod.at>
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=bdc79f02c17fc9ec7461d48007105caac789cef4
+---
+ support/reexport/reexport.c | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/support/reexport/reexport.c b/support/reexport/reexport.c
+index d9a700af..78516586 100644
+--- a/support/reexport/reexport.c
++++ b/support/reexport/reexport.c
+@@ -5,16 +5,9 @@
+ #ifdef HAVE_DLFCN_H
+ #include <dlfcn.h>
+ #endif
+-#include <stdint.h>
+-#include <stdio.h>
+-#include <sys/random.h>
+-#include <sys/stat.h>
+ #include <sys/types.h>
+ #include <sys/vfs.h>
+-#include <unistd.h>
+ #include <errno.h>
+-#include <sys/socket.h>
+-#include <sys/un.h>
+ 
+ #include "nfsd_path.h"
+ #include "conffile.h"
+-- 
+2.42.0
+
diff --git a/package/nfs-utils/0005-support-backend_sqlite.c-Add-getrandom-fallback.patch b/package/nfs-utils/0005-support-backend_sqlite.c-Add-getrandom-fallback.patch
new file mode 100644
index 0000000000..71c42f74b1
--- /dev/null
+++ b/package/nfs-utils/0005-support-backend_sqlite.c-Add-getrandom-fallback.patch
@@ -0,0 +1,113 @@
+From f92fd6ca815025c435dabf45da28472ac0aa04a4 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Fri, 10 Nov 2023 10:59:29 -0500
+Subject: [PATCH 3/3] support/backend_sqlite.c: Add getrandom() fallback
+
+Allow to compile reexport on systems with older libc. (getrandom()
+wrapper is supported on glibc 2.25+ and  musl 1.1.20+, uclibc-ng does
+not yet support it).
+
+getrandom() syscall is supported Linux 3.17+ (old enough to bother with
+a check).
+
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=f92fd6ca815025c435dabf45da28472ac0aa04a4
+---
+ Makefile.am                       |  1 +
+ aclocal/getrandom.m4              | 16 ++++++++++++++++
+ configure.ac                      |  3 +++
+ support/reexport/backend_sqlite.c | 18 +++++++++++++++++-
+ 4 files changed, 37 insertions(+), 1 deletion(-)
+ create mode 100644 aclocal/getrandom.m4
+
+diff --git a/Makefile.am b/Makefile.am
+index 00220842..72ad4ba7 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -10,6 +10,7 @@ EXTRA_DIST = \
+ 	autogen.sh \
+ 	\
+ 	aclocal/bsdsignals.m4 \
++	aclocal/getrandom.m4 \
+ 	aclocal/nfs-utils.m4 \
+ 	aclocal/kerberos5.m4 \
+ 	aclocal/tcp-wrappers.m4 \
+diff --git a/aclocal/getrandom.m4 b/aclocal/getrandom.m4
+new file mode 100644
+index 00000000..bc0fe16a
+--- /dev/null
++++ b/aclocal/getrandom.m4
+@@ -0,0 +1,16 @@
++dnl Checks for getrandom support (glibc 2.25+, musl 1.1.20+)
++dnl
++AC_DEFUN([AC_GETRANDOM], [
++    AC_MSG_CHECKING(for getrandom())
++    AC_LINK_IFELSE(
++		[AC_LANG_PROGRAM([[
++		   #include <stdlib.h>  /* for NULL */
++		   #include <sys/random.h>
++		]],
++		[[ return getrandom(NULL, 0U, 0U); ]] )],
++		[AC_DEFINE([HAVE_GETRANDOM], [1], [Define to 1 if you have the `getrandom' function.])
++		AC_MSG_RESULT([yes])],
++		[AC_MSG_RESULT([no])])
++
++	AC_SUBST(HAVE_GETRANDOM)
++])
+diff --git a/configure.ac b/configure.ac
+index 6fbcb974..4bff679d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -277,6 +277,9 @@ AC_TCP_WRAPPERS
+ # Arrange for large-file support
+ AC_SYS_LARGEFILE
+ 
++dnl Check for getrandom() libc support
++AC_GETRANDOM
++
+ AC_CONFIG_SRCDIR([support/include/config.h.in])
+ AC_CONFIG_HEADERS([support/include/config.h])
+ 
+diff --git a/support/reexport/backend_sqlite.c b/support/reexport/backend_sqlite.c
+index 132f30c4..0eb5ea37 100644
+--- a/support/reexport/backend_sqlite.c
++++ b/support/reexport/backend_sqlite.c
+@@ -7,9 +7,16 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <sys/random.h>
+ #include <unistd.h>
+ 
++#ifdef HAVE_GETRANDOM
++# include <sys/random.h>
++# if !defined(SYS_getrandom) && defined(__NR_getrandom)
++   /* usable kernel-headers, but old glibc-headers */
++#  define SYS_getrandom __NR_getrandom
++# endif
++#endif
++
+ #include "conffile.h"
+ #include "reexport_backend.h"
+ #include "xlog.h"
+@@ -20,6 +27,15 @@
+ static sqlite3 *db;
+ static int init_done;
+ 
++#if !defined(HAVE_GETRANDOM) && defined(SYS_getrandom)
++/* libc without function, but we have syscall */
++static int getrandom(void *buf, size_t buflen, unsigned int flags)
++{
++	return (syscall(SYS_getrandom, buf, buflen, flags));
++}
++# define HAVE_GETRANDOM
++#endif
++
+ static int prng_init(void)
+ {
+ 	int seed;
+-- 
+2.42.0
+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
