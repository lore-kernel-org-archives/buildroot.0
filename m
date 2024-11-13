Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43887D41C2C
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 09:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1213180872;
	Wed, 13 Nov 2024 09:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WUfGa0JVJSq; Wed, 13 Nov 2024 09:54:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED75680ABF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED75680ABF;
	Wed, 13 Nov 2024 09:54:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D6EC1DC4
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 097BA405EB
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2uOTVVmFN5a for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 09:53:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F22140AF9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F22140AF9
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C6358621D; Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Nov 2024 09:27:33 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d115b018596ecf5f4869398c984cfe659401a3ac
X-Git-Newrev: c8198f6e0f464c135c24b78928408a38a2d7c35d
X-Patchwork-Hint: ignore
Message-Id: <20241113095351.6C6358621D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/ntp: fix build
 with GCC 14.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8198f6e0f464c135c24b78928408a38a2d7c35d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix pthread_detach() detection that is broken when building
with GCC 14.x:

checking for pthread_kill... yes
checking for pthread_rwlock_destroy with <pthread.h>... yes
checking for pthread_detach with <pthread.h>... no
configure: error: could not locate pthread_detach()
make[1]: *** [package/pkg-generic.mk:273:
/home/user/buildroot/bsp-barebox/build/ntp-4.2.8p17/.stamp_configured]
Error 1
make: *** [Makefile:82: _all] Error 2

Reference: https://bugs.ntp.org/show_bug.cgi?id=3926

Additionally, refresh patch 0002 to fix the offset of hunk 1.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 40d0797027a610a3afcb8c2703210298a52f60f5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/0002-ntp-syscalls-fallback.patch    |  9 +++++----
 package/ntp/0003-fix-pthread-detach-check.patch | 26 +++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/package/ntp/0002-ntp-syscalls-fallback.patch b/package/ntp/0002-ntp-syscalls-fallback.patch
index 535fc93dfd..46704b9d3f 100644
--- a/package/ntp/0002-ntp-syscalls-fallback.patch
+++ b/package/ntp/0002-ntp-syscalls-fallback.patch
@@ -8,10 +8,11 @@ Signed-off-by: James Knight <james.knight@rockwellcollins.com>
  configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
---- a/configure.ac
-+++ b/configure.ac
-@@ -1523,11 +1523,11 @@ AC_CACHE_CHECK(
+Index: ntp-4.2.8p17/configure.ac
+===================================================================
+--- ntp-4.2.8p17.orig/configure.ac
++++ ntp-4.2.8p17/configure.ac
+@@ -1472,11 +1472,11 @@ AC_CACHE_CHECK(
      [ntp_cv_var_ntp_syscalls],
      [
  	ntp_cv_var_ntp_syscalls=no
diff --git a/package/ntp/0003-fix-pthread-detach-check.patch b/package/ntp/0003-fix-pthread-detach-check.patch
new file mode 100644
index 0000000000..894b422f2c
--- /dev/null
+++ b/package/ntp/0003-fix-pthread-detach-check.patch
@@ -0,0 +1,26 @@
+fix pthread_detach check
+
+Upstream: https://bugs.ntp.org/show_bug.cgi?id=3926
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ sntp/m4/openldap-thread-check.m4 |    6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+Index: ntp-4.2.8p17/sntp/m4/openldap-thread-check.m4
+===================================================================
+--- ntp-4.2.8p17.orig/sntp/m4/openldap-thread-check.m4
++++ ntp-4.2.8p17/sntp/m4/openldap-thread-check.m4
+@@ -262,10 +262,8 @@ pthread_rwlock_t rwlock;
+ 				dnl save the flags
+ 				AC_LINK_IFELSE([AC_LANG_PROGRAM([[
+ #include <pthread.h>
+-#ifndef NULL
+-#define NULL (void*)0
+-#endif
+-]], [[pthread_detach(NULL);]])],[ol_cv_func_pthread_detach=yes],[ol_cv_func_pthread_detach=no])
++pthread_t thread;
++]], [[pthread_detach(thread);]])],[ol_cv_func_pthread_detach=yes],[ol_cv_func_pthread_detach=no])
+ 			])
+
+ 			if test $ol_cv_func_pthread_detach = no ; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
