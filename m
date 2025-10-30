Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC34CCF9FC
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 188FA840F1;
	Thu, 30 Oct 2025 08:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id topZ6QVBeITb; Thu, 30 Oct 2025 08:11:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F770840D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F770840D4;
	Thu, 30 Oct 2025 08:11:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC7E62A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 275D261360
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1-ewZalSSR7 for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:10:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8E4E6139E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8E4E6139E
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6FCC86065; Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 08:56:32 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 50bd2c21ab05fbb8110cc71b805191ca511f8ff7
X-Git-Newrev: 4e58d730da819c74bb00720cc14ea5c3e0442efa
X-Patchwork-Hint: ignore
Message-Id: <20251030081040.A6FCC86065@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libsolv: add
 upstream patch to fix musl build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4e58d730da819c74bb00720cc14ea5c3e0442efa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

After the introduction of qsort_r in musl, building libsolv with musl fails with
unmatched qsort_r function signature. The commit adds the recently upstreamed
patch to fix it.

Original PR: https://github.com/openSUSE/libsolv/pull/600

Fixes: http://autobuild.buildroot.org/results/ab06e97bef898b2c53b906afb2a4b8ee6841bacb

Signed-off-by: Gong Zhile <gongzl.oerv@isrc.iscas.ac.cn>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 172846b226b8cb068a49a2b57a05883f92428c17)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...qsort_r-preprocessor-for-musl-and-FreeBSD.patch | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/package/libsolv/0001-Fix-qsort_r-preprocessor-for-musl-and-FreeBSD.patch b/package/libsolv/0001-Fix-qsort_r-preprocessor-for-musl-and-FreeBSD.patch
new file mode 100644
index 0000000000..04a4312db4
--- /dev/null
+++ b/package/libsolv/0001-Fix-qsort_r-preprocessor-for-musl-and-FreeBSD.patch
@@ -0,0 +1,83 @@
+From 2d0718a4f2001c857d9af24398c68d676a98a3ca Mon Sep 17 00:00:00 2001
+From: Gong Zhile <gongzl.oerv@isrc.iscas.ac.cn>
+Date: Wed, 22 Oct 2025 18:14:30 +0800
+Subject: [PATCH] Fix qsort_r preprocessor for musl and FreeBSD
+
+The original mentioned qsort_r signature difference now only exists in DragonFly
+BSD & MacOS. However, the preprocessor also broke the compliation on musl+linux
+and FreeBSD, leading the compilation error on buildroot.
+
+musl: https://git.musl-libc.org/cgit/musl/commit/?id=b76f37fd5625d038141b52184956fb4b7838e9a5
+freebsd, dragonfly, macos: QSORT(3)
+
+FreeBSD and musl use the same GNU-like signature.
+
+Upstream: https://github.com/openSUSE/libsolv/commit/2d0718a4f2001c857d9af24398c68d676a98a3ca
+
+Signed-off-by: Gong Zhile <gongzl.oerv@isrc.iscas.ac.cn>
+[Bernd: added Upstream: tag]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/util.c | 35 +++++++++++++++++++----------------
+ 1 file changed, 19 insertions(+), 16 deletions(-)
+
+diff --git a/src/util.c b/src/util.c
+index 72426e09..a60ed3da 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -154,26 +154,14 @@ solv_setcloexec(int fd, int state)
+   #endif
+ }
+ 
+-/* bsd's qsort_r has different arguments, so we define our
++#if defined(HAVE_QSORT_R) || defined(HAVE___QSORT_R)
++#if (defined(__APPLE__) || defined(__DragonFly__)) && defined(HAVE_QSORT_R)
++
++/* MacOS and DragonFly have qsort_r with different arguments, so we define our
+    own version in case we need to do some clever mapping
+ 
+    see also: http://sources.redhat.com/ml/libc-alpha/2008-12/msg00003.html
+  */
+-#if (defined(__GLIBC__) || defined(__NEWLIB__)) && (defined(HAVE_QSORT_R) || defined(HAVE___QSORT_R))
+-
+-void
+-solv_sort(void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *, void *), void *compard)
+-{
+-# if defined(HAVE_QSORT_R)
+-  qsort_r(base, nmemb, size, compar, compard);
+-# else
+-  /* backported for SLE10-SP2 */
+-  __qsort_r(base, nmemb, size, compar, compard);
+-# endif
+-
+-}
+-
+-#elif defined(HAVE_QSORT_R) /* not glibc, but has qsort_r() */
+ 
+ struct solv_sort_data {
+   int (*compar)(const void *, const void *, void *);
+@@ -196,6 +184,21 @@ solv_sort(void *base, size_t nmemb, size_t size, int (*compar)(const void *, con
+   qsort_r(base, nmemb, size, &d, solv_sort_helper);
+ }
+ 
++#else
++
++void
++solv_sort(void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *, void *), void *compard)
++{
++# if defined(HAVE_QSORT_R)
++  qsort_r(base, nmemb, size, compar, compard);
++# else
++  /* backported for SLE10-SP2 */
++  __qsort_r(base, nmemb, size, compar, compard);
++# endif
++
++}
++
++#endif
+ #else /* not glibc and no qsort_r() */
+ /* use own version of qsort if none available */
+ #include "qsort_r.c"
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
