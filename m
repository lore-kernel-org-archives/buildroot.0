Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60385C25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 06:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECC8D41A65;
	Wed, 15 May 2024 06:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZ_B-rSa_V64; Wed, 15 May 2024 06:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93C7E41A67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93C7E41A67;
	Wed, 15 May 2024 06:16:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F24B1BF59A
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 06:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E02CB419DB
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 06:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xf7HaMrsYk9q for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 06:16:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7203419EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7203419EB
 for <buildroot@buildroot.org>; Wed, 15 May 2024 06:16:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D60268715C; Wed, 15 May 2024 06:16:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 May 2024 08:13:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15820bc0cd668fa9e1db78d29a3c44cb1e6cf717
X-Git-Newrev: ad64ddd4f306eb787ce98263148a91b3386be570
X-Patchwork-Hint: ignore
Message-Id: <20240515061605.D60268715C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnpth: fix gnupg2 build with
 uclibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad64ddd4f306eb787ce98263148a91b3386be570
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure of gnupg2 raised since bump to version
1.7 in commit 3ef4d24192b20bd1eb5e34c9fa2a6aa5bde91f91 and
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commitdiff;h=02ce6b2d27f91ed6285e4e92d99c21bcc7823c9b:

/home/autobuild/autobuild/instance-2/output-1/host/lib/gcc/armeb-buildroot-linux-uclibcgnueabi/13.2.0/../../../../armeb-buildroot-linux-uclibcgnueabi/bin/ld: /home/autobuild/autobuild/instance-2/output-1/host/bin/../armeb-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libnpth.so: undefined reference to `busy_wait_for'

Fixes: 3ef4d24192b20bd1eb5e34c9fa2a6aa5bde91f91
 - http://autobuild.buildroot.org/results/9a27ffde79598a39b4fd55c716978d32d0beb924

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-npth_rwlock_timedrdlock-is-not-supported.patch | 51 ++++++++++++++++++++++
 package/libnpth/0003-Fix-previous-commit.patch     | 39 +++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/package/libnpth/0002-Return-a-run-time-error-if-npth_rwlock_timedrdlock-is-not-supported.patch b/package/libnpth/0002-Return-a-run-time-error-if-npth_rwlock_timedrdlock-is-not-supported.patch
new file mode 100644
index 0000000000..0d9b38e4ce
--- /dev/null
+++ b/package/libnpth/0002-Return-a-run-time-error-if-npth_rwlock_timedrdlock-is-not-supported.patch
@@ -0,0 +1,51 @@
+From 01f03a91c9bd63910995aeef412beb3ca6dc9a67 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Tue, 7 May 2024 13:45:47 +0900
+Subject: [PATCH] Return a run-time error if npth_rwlock_timedrdlock is not
+ supported.
+
+* src/npth.c (npth_rwlock_timedrdlock): Return ENOSYS if not
+supported.
+(npth_rwlock_timedwrlock): Use HAVE_PTHREAD_RWLOCK_TRYWRLOCK.
+
+--
+
+GnuPG-bug-id: 7109
+Fixed-commit: 363c370bd35dd0bb4e5636b2d4f06ea88c658794
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+Upstream: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commit;h=01f03a91c9bd63910995aeef412beb3ca6dc9a67
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/npth.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/npth.c b/src/npth.c
+index c0ff8da..f02540c 100644
+--- a/src/npth.c
++++ b/src/npth.c
+@@ -488,9 +488,11 @@ npth_rwlock_timedrdlock (npth_rwlock_t *rwlock, const struct timespec *abstime)
+   ENTER();
+ #if HAVE_PTHREAD_RWLOCK_TIMEDRDLOCK
+   err = pthread_rwlock_timedrdlock (rwlock, abstime);
+-#else
++#elif HAVE_PTHREAD_RWLOCK_TRYRDLOCK
+   err = busy_wait_for ((trylock_func_t) pthread_rwlock_tryrdlock, rwlock,
+ 		       abstime);
++#else
++  err = ENOSYS;
+ #endif
+   LEAVE();
+   return err;
+@@ -533,7 +535,7 @@ npth_rwlock_timedwrlock (npth_rwlock_t *rwlock, const struct timespec *abstime)
+   ENTER();
+ #if HAVE_PTHREAD_RWLOCK_TIMEDWRLOCK
+   err = pthread_rwlock_timedwrlock (rwlock, abstime);
+-#elif HAVE_PTHREAD_RWLOCK_TRYRDLOCK
++#elif HAVE_PTHREAD_RWLOCK_TRYWRLOCK
+   err = busy_wait_for ((trylock_func_t) pthread_rwlock_trywrlock, rwlock,
+ 		       abstime);
+ #else
+-- 
+2.30.2
+
diff --git a/package/libnpth/0003-Fix-previous-commit.patch b/package/libnpth/0003-Fix-previous-commit.patch
new file mode 100644
index 0000000000..5f3ce06bf6
--- /dev/null
+++ b/package/libnpth/0003-Fix-previous-commit.patch
@@ -0,0 +1,39 @@
+From 75c68399ef3bbb5d024f2a60474a7214fa479016 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Mon, 13 May 2024 11:13:23 +0900
+Subject: [PATCH] Fix previous commit.
+
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+Upstream: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commit;h=75c68399ef3bbb5d024f2a60474a7214fa479016
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/npth.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/npth.c b/src/npth.c
+index f02540c..8dced17 100644
+--- a/src/npth.c
++++ b/src/npth.c
+@@ -178,6 +178,18 @@ static int initialized_or_any_threads;
+ typedef int (*trylock_func_t) (void *);
+ 
+ #ifndef HAVE_PTHREAD_MUTEX_TIMEDLOCK
++#define REQUIRE_THE_BUSY_WAIT_FOR_IMPLEMENTATION 1
++#endif
++
++#if !HAVE_PTHREAD_RWLOCK_TIMEDRDLOCK && HAVE_PTHREAD_RWLOCK_TRYRDLOCK
++#define REQUIRE_THE_BUSY_WAIT_FOR_IMPLEMENTATION 1
++#endif
++
++#if !HAVE_PTHREAD_RWLOCK_TIMEDWRLOCK && HAVE_PTHREAD_RWLOCK_TRYWRLOCK
++#define REQUIRE_THE_BUSY_WAIT_FOR_IMPLEMENTATION 1
++#endif
++
++#if REQUIRE_THE_BUSY_WAIT_FOR_IMPLEMENTATION
+ static int
+ busy_wait_for (trylock_func_t trylock, void *lock,
+ 	       const struct timespec *abstime)
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
