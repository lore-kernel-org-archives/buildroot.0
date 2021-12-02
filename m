Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C7CC433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 17:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9763841DFC;
	Thu,  2 Dec 2021 17:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IDn8F9nK4x_L; Thu,  2 Dec 2021 17:42:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E22CF41DF0;
	Thu,  2 Dec 2021 17:42:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8819D1BF3F9
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75B1440162
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cHl1mQkmKfHb for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 17:41:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BB2340101
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 17:41:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2E40F922D0; Thu,  2 Dec 2021 17:37:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 Dec 2021 18:40:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5847208213952c5d2e1ce44d2db19ead9706d5d7
X-Git-Newrev: ef98158a2d4f5af00501072c10c2e057fe80dd65
X-Patchwork-Hint: ignore
Message-Id: <20211202173711.2E40F922D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/diffutils: fix build with uclibc <
 1.0.35
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef98158a2d4f5af00501072c10c2e057fe80dd65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with uclibc < 1.0.35 raised since bump
to version 3.8 in commit 1f89c80417ad03127650b22c41ec4e30d42c549f:

In file included from ./sys/random.h:40,
                 from getrandom.c:22:
/home/giuliobenetti/autobuild/run/instance-0/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
      |                                   ^~~~~~
/home/giuliobenetti/autobuild/run/instance-0/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
    7 | #include <features.h>
  +++ |+#include <stddef.h>
    8 |

Fixes:
 - http://autobuild.buildroot.org/results/adecc3e5def140348dfff30961fe6514c9a8e7b5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...3-sys_random-port-better-to-uClibc-1-0-35.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/diffutils/0003-sys_random-port-better-to-uClibc-1-0-35.patch b/package/diffutils/0003-sys_random-port-better-to-uClibc-1-0-35.patch
new file mode 100644
index 0000000000..f9dd12f8e6
--- /dev/null
+++ b/package/diffutils/0003-sys_random-port-better-to-uClibc-1-0-35.patch
@@ -0,0 +1,39 @@
+From 135414a7f543e4d40ad0a7cbd51885e159a6e0f4 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 30 Nov 2021 17:50:01 -0800
+Subject: sys_random: port better to uClibc < 1.0.35
+
+Problem reported by Fabrice Fontaine in:
+https://lists.gnu.org/r/bug-gnulib/2021-11/msg00043.html
+* lib/sys_random.in.h [HAVE_SYS_RANDOM_H && !__GLIBC__ && __UCLIBC__]:
+Include <stddef.h>, in case this file is included before
+__UCLIBC__ is defined.
+
+[Retrieved (and backported to remove ChangeLog update) from:
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=135414a7f543e4d40ad0a7cbd51885e159a6e0f4]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ChangeLog           | 9 +++++++++
+ lib/sys_random.in.h | 6 ++++--
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/lib/sys_random.in.h b/lib/sys_random.in.h
+index 1abd6c544..8b4b934a1 100644
+--- a/lib/sys_random.in.h
++++ b/lib/sys_random.in.h
+@@ -23,8 +23,10 @@
+ 
+ #if @HAVE_SYS_RANDOM_H@
+ 
+-/* On uClibc, <sys/random.h> assumes prior inclusion of <stddef.h>.  */
+-# if defined __UCLIBC__
++/* On uClibc < 1.0.35, <sys/random.h> assumes prior inclusion of <stddef.h>.
++   Do not use __UCLIBC__ here, as it might not be defined yet.
++   But avoid namespace pollution on glibc systems.  */
++# ifndef __GLIBC__
+ #  include <stddef.h>
+ # endif
+ /* On Mac OS X 10.5, <sys/random.h> assumes prior inclusion of <sys/types.h>.
+-- 
+cgit v1.2.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
