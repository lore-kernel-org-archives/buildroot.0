Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AFBC10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 07:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4C144010C;
	Sun, 12 May 2024 07:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0JWSJsIw3Ai; Sun, 12 May 2024 07:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2704401CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2704401CC;
	Sun, 12 May 2024 07:06:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A281E1BF473
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F27960830
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8awD6rgzff5M for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 07:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E01860826
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E01860826
 for <buildroot@buildroot.org>; Sun, 12 May 2024 07:06:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B59B87021; Sun, 12 May 2024 07:06:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 09:06:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71c9da92b2e5af27cb4af915142e8604bf563740
X-Git-Newrev: 5a7c40bd1c10d62fc7305db5ac7d1842d7099bb6
X-Patchwork-Hint: ignore
Message-Id: <20240512070632.8B59B87021@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sscep: fix linking error with
 musl-libc
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5a7c40bd1c10d62fc7305db5ac7d1842d7099bb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch fixes the following linking failure:

/home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: /home/buildroot/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/lib/libc.a(getopt.o): in function `getopt':
getopt.c:(.text.getopt+0x0): multiple definition of `getopt'; src/getopt.o:getopt.c:(.text+0x0): first defined here
/home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: /home/buildroot/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/lib/libc.a(getopt.o):(.data.optind+0x0): multiple definition of `optind'; src/getopt.o:(.data+0x0): first defined here

Fixes:
- http://autobuild.buildroot.net/results/d5b1b4e5e9d9c8eca5e75c345db4d1f3f0cd84ed

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...2-Fix-getopt-linking-error-with-musl-libc.patch | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/package/sscep/0002-Fix-getopt-linking-error-with-musl-libc.patch b/package/sscep/0002-Fix-getopt-linking-error-with-musl-libc.patch
new file mode 100644
index 0000000000..ebb9985ef3
--- /dev/null
+++ b/package/sscep/0002-Fix-getopt-linking-error-with-musl-libc.patch
@@ -0,0 +1,67 @@
+From db7fab775d03438b4cfce6b49fab2d3176ecb1d3 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Sat, 11 May 2024 19:38:01 +0200
+Subject: [PATCH] Fix getopt linking error with musl-libc
+
+The buildroot project, to which the sscep application was added, has
+configurations that raise the following linking error:
+buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: buildroot/output/host/i586-buildroot-linux-musl/sysroot/lib/libc.a(getopt.o): in function `getopt':
+getopt.c:(.text.getopt+0x0): multiple definition of `getopt'; src/getopt.o:getopt.c:(.text+0x0): first defined here
+buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: buildroot/output/host/i586-buildroot-linux-musl/sysroot/lib/libc.a(getopt.o):(.data.optind+0x0): multiple definition of `optind'; src/getopt.o:(.data+0x0): first defined here
+collect2: error: ld returned 1 exit status
+
+The commit 65561b53344b8 ("Fix getopt linking error") actually fixed the
+linking error only for uclibc, but not for musl-libc. The patch fixes
+the error for both uclibc and musl-libc.
+
+Link: http://autobuild.buildroot.net/results/d5b1b4e5e9d9c8eca5e75c345db4d1f3f0cd84ed/build-end.log
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/certnanny/sscep/pull/181
+---
+ configure.ac |  2 +-
+ src/getopt.c | 12 ++----------
+ 2 files changed, 3 insertions(+), 11 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9f3ee15686a2..7a968d97dcaa 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -34,7 +34,7 @@ AC_TYPE_SIZE_T
+ # Checks for library functions.
+ AC_FUNC_MALLOC
+ AC_FUNC_REALLOC
+-AC_CHECK_FUNCS([alarm gethostbyname memset socket strchr strdup strstr])
++AC_CHECK_FUNCS([alarm gethostbyname getopt memset socket strchr strdup strstr])
+ 
+ AC_CONFIG_FILES([Makefile])
+ AC_SUBST([LIBTOOL_DEPS])
+diff --git a/src/getopt.c b/src/getopt.c
+index 0109406ba4ac..8793052845ed 100644
+--- a/src/getopt.c
++++ b/src/getopt.c
+@@ -31,15 +31,7 @@
+ #include <stddef.h>
+ #include <string.h>
+ 
+-#define GETOPT_INTERFACE_VERSION 2
+-#if !defined _LIBC && defined __GLIBC__ && __GLIBC__ >= 2
+-# include <gnu-versions.h>
+-# if _GNU_GETOPT_INTERFACE_VERSION == GETOPT_INTERFACE_VERSION
+-#  define ELIDE_CODE
+-# endif
+-#endif
+-
+-#ifndef ELIDE_CODE
++#ifndef HAVE_GETOPT
+ 
+ char* optarg;
+ int optopt;
+@@ -237,4 +229,4 @@ int getopt_long(int argc, char* const argv[], const char* optstring,
+   return retval;
+ }
+ 
+-#endif	/* Not ELIDE_CODE.  */
++#endif	/* HAVE_GETOPT  */
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
