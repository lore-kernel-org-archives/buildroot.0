Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA3DC282EC
	for <buildroot@archiver.kernel.org>; Fri, 14 Mar 2025 18:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76660423C2;
	Fri, 14 Mar 2025 18:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OfMnCUb6jhOi; Fri, 14 Mar 2025 18:06:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DC4A423B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DC4A423B9;
	Fri, 14 Mar 2025 18:06:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39327116
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 18:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27F586129A
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 18:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfcLJdVqT2QJ for <buildroot@buildroot.org>;
 Fri, 14 Mar 2025 18:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32A296082A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32A296082A
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 18:06:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D41487FF7; Fri, 14 Mar 2025 18:06:32 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Mar 2025 19:01:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: befd90b7655804aa30eae494fae6640ff178217c
X-Git-Newrev: 9f60aa973d1fb3905eb3f655b32ec368419e2bf6
X-Patchwork-Hint: ignore
Message-Id: <20250314180632.1D41487FF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rt-tests: fix build with glibc
 2.41+
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f60aa973d1fb3905eb3f655b32ec368419e2bf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since glibc bump to 2.41 in Buildroot commit [1], rt-tests is failing
to build with error:

    In file included from src/lib/rt-utils.c:28:
    src/include/rt-sched.h:45:8: error: redefinition of 'struct sched_attr'
       45 | struct sched_attr {
          |        ^~~~~~~~~~

glibc 2.41 adds sched_*attr, conflicting with rt-sched.h in the rt-tests
package. This commit resolves the conflict by applying a patch from
upstream which excludes the conflicting code when using glibc >= 2.41.

Fixes:
https://autobuild.buildroot.org/results/30308c74291004c328d6c3603ce68d600c5ef281/

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/6ecab31fad12a494ec0d2a3767c736a55c80a769

Signed-off-by: Brandon Lumbra <brandon.lumbra@sense.com>
[Julien:
 - add extra info in commit log
 - add missing Signed-off-by line in commit log
 - add missing Signed-off-by in patch
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../rt-tests/0003-Fix-build-with-glibc-2.41.patch  | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/rt-tests/0003-Fix-build-with-glibc-2.41.patch b/package/rt-tests/0003-Fix-build-with-glibc-2.41.patch
new file mode 100644
index 0000000000..6899b55c99
--- /dev/null
+++ b/package/rt-tests/0003-Fix-build-with-glibc-2.41.patch
@@ -0,0 +1,57 @@
+From 280e198c39d1b17d0491d7c4e7afda97ae6c8e6f Mon Sep 17 00:00:00 2001
+From: Yaakov Selkowitz <yselkowi@redhat.com>
+Date: Wed, 29 Jan 2025 16:46:11 -0500
+Subject: [PATCH] Fix rt-tests build with glibc-2.41
+
+The sched_*attr APIs were added to glibc
+https://sourceware.org/git/?p=glibc.git;a=commit;h=21571ca0d70302909cf72707b2a7736cf12190a0
+
+This fixes the build conflict in rt-tests with glibc-2.4
+
+Signed-off-by: Yaakov Selkowitz <yselkowi@redhat.com>
+Signed-off-by: John Kacur <jkacur@redhat.com>
+Upstream: https://web.git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/commit/?id=d3a23a0cc76789c3083df3bad78982cd49bc4c5e
+Signed-off-by: Brandon Lumbra <brandon.lumbra@sense.com>
+---
+ src/include/rt-sched.h | 2 ++
+ src/lib/rt-sched.c     | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/src/include/rt-sched.h b/src/include/rt-sched.h
+index 80171c76e0ee..dfd7f45f51cc 100644
+--- a/src/include/rt-sched.h
++++ b/src/include/rt-sched.h
+@@ -42,6 +42,7 @@
+ #define __NR_sched_getattr		275
+ #endif
+ 
++#if ! __GLIBC_PREREQ(2, 41)
+ struct sched_attr {
+ 	uint32_t size;
+ 	uint32_t sched_policy;
+@@ -67,5 +68,6 @@ int sched_getattr(pid_t pid,
+ 		  struct sched_attr *attr,
+ 		  unsigned int size,
+ 		  unsigned int flags);
++#endif
+ 
+ #endif /* __RT_SCHED_H__ */
+diff --git a/src/lib/rt-sched.c b/src/lib/rt-sched.c
+index 8023bc70c473..2500abde26e4 100644
+--- a/src/lib/rt-sched.c
++++ b/src/lib/rt-sched.c
+@@ -14,6 +14,7 @@
+ 
+ #include "rt-sched.h"
+ 
++#if ! __GLIBC_PREREQ(2, 41)
+ int sched_setattr(pid_t pid,
+ 		  const struct sched_attr *attr,
+ 		  unsigned int flags)
+@@ -28,3 +29,4 @@ int sched_getattr(pid_t pid,
+ {
+ 	return syscall(__NR_sched_getattr, pid, attr, size, flags);
+ }
++#endif
+-- 
+2.47.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
