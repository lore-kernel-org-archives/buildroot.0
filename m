Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF93ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 12:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99C2861028;
	Fri, 16 Sep 2022 12:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99C2861028
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8XFY2xfD09_u; Fri, 16 Sep 2022 12:28:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B65B961027;
	Fri, 16 Sep 2022 12:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B65B961027
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E22C1BF2E5
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE133405FD
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE133405FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PYGEc5fwSW3O for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 12:28:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD01E4162E
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 12:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD01E4162E
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A9BBD83D2D; Fri, 16 Sep 2022 12:28:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 14:27:26 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7164554c1fd671b48ea2f96fe5516e49aef412fd
X-Git-Newrev: eed6b96216102f66f8cd6e4c0ef5f4bf66899c55
X-Patchwork-Hint: ignore
Message-Id: <20220916122817.A9BBD83D2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rng-tools: fix
 uclibc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=eed6b96216102f66f8cd6e4c0ef5f4bf66899c55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following uclibc build failure on aarch64 raised since bump to
version 6.14 in commit 5292d1cf9ad0605cc264fedc75c1b9a169aa183b and
https://github.com/nhorman/rng-tools/commit/9070a04adfcd21ec3839ee8ff190e7130ccd5c9b:

rngd_rndr.c:34:10: fatal error: sys/auxv.h: No such file or directory
   34 | #include <sys/auxv.h>
      |          ^~~~~~~~~~~~

Strangely enough, there is no autobuilder failure for powerpc64le raised
since version bump to version 6.11 in commit
da83261c9be0484924c845bb033e2ca752556504

Fixes:
 - http://autobuild.buildroot.org/results/41d5ab9e67eb0d8af8d789fc94d4366f130a7fb2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5874667922ca4d83994fd9649ea91d28be5a6042)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...configure.ac-fix-build-without-sys-auxv.h.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/rng-tools/0001-configure.ac-fix-build-without-sys-auxv.h.patch b/package/rng-tools/0001-configure.ac-fix-build-without-sys-auxv.h.patch
new file mode 100644
index 0000000000..0c15ab6b7d
--- /dev/null
+++ b/package/rng-tools/0001-configure.ac-fix-build-without-sys-auxv.h.patch
@@ -0,0 +1,52 @@
+From 6ea89861c300a732d1bbcffd085d92f5c4c9228e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 15 Aug 2022 11:57:21 +0200
+Subject: [PATCH] configure.ac: fix build without sys/auxv.h
+
+Fix the following build failure on aarch64 without sys/auxv.h (e.g. on
+uclibc) raised since version 6.13 and
+https://github.com/nhorman/rng-tools/commit/9070a04adfcd21ec3839ee8ff190e7130ccd5c9b:
+
+rngd_rndr.c:34:10: fatal error: sys/auxv.h: No such file or directory
+   34 | #include <sys/auxv.h>
+      |          ^~~~~~~~~~~~
+
+The same issue could be raised on powerpc64le since version 6.11 and
+https://github.com/nhorman/rng-tools/commit/ade348cdb90c25b44b203fd4e9c33ec4bccff323
+
+Fixes:
+ - http://autobuild.buildroot.org/results/41d5ab9e67eb0d8af8d789fc94d4366f130a7fb2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/nhorman/rng-tools/commit/6ea89861c300a732d1bbcffd085d92f5c4c9228e]
+---
+ configure.ac | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0af64e7..411c7b8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -76,14 +76,17 @@ AC_PROG_GCC_TRADITIONAL
+ 
+ AX_PTHREAD
+ 
++dnl Checks for header files.
++AC_CHECK_HEADERS(sys/auxv.h)
++
+ AM_CONDITIONAL([RDRAND], [test $host_cpu = x86_64 || test $host_cpu = i686])
+ AS_IF([test $host_cpu = x86_64 || test $host_cpu = i686], [AC_DEFINE([HAVE_RDRAND],1,[Enable RDRAND])],[])
+ 
+-AM_CONDITIONAL([DARN], [test $host_cpu = powerpc64le])
+-AS_IF([test $host_cpu = powerpc64le], [AC_DEFINE([HAVE_DARN],1,[Enable DARN])],[])
++AM_CONDITIONAL([DARN], [test $host_cpu = powerpc64le -a "$ac_cv_header_sys_auxv_h" = "yes"])
++AS_IF([test $host_cpu = powerpc64le -a "$ac_cv_header_sys_auxv_h" = "yes"], [AC_DEFINE([HAVE_DARN],1,[Enable DARN])],[])
+ 
+-AM_CONDITIONAL([RNDR], [test $host_cpu = aarch64])
+-AS_IF([test $host_cpu = aarch64], [AC_DEFINE([HAVE_RNDR],1,[Enable RNDR])],[])
++AM_CONDITIONAL([RNDR], [test $host_cpu = aarch64 -a "$ac_cv_header_sys_auxv_h" = "yes"])
++AS_IF([test $host_cpu = aarch64 -a "$ac_cv_header_sys_auxv_h" = "yes"], [AC_DEFINE([HAVE_RNDR],1,[Enable RNDR])],[])
+ AM_CONDITIONAL([JITTER], [false])
+ 
+ AC_ARG_ENABLE(jitterentropy,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
