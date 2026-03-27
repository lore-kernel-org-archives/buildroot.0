Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1CB10ED650
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 09:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F096416B2;
	Fri, 27 Mar 2026 09:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PR4gSCdjknea; Fri, 27 Mar 2026 09:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F306416A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605569;
	bh=IArF7xf1ZTNK8MyAbYxBKsJC+fEYQm7jg+BJguG/PO8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sj8qnhmqCq9Fb6stF+4ub61ZiUs5DCYr7t+VOskaSaYrXjEqeK+cx1ZnqqlfdO+sI
	 sU+wxrMAQDXLsLNH7vGyg6LCSNWDkzwVDT2J7WOgr6PwZmRHsL4mqu2BiGXCJ39Xfy
	 anAm3S4XQBSV8OlwMh5b5u8M0U0NXvAw9QnD3Z88HtAC5ZY3n+oULbGtQx483iZuDc
	 OsVETD3gGomK8IMNFZvHyj1qTh3Zx7kEfCu+EtRKjikJBTnCsh9Gb0a1ocr+MKgVDP
	 zOUxthFUzFCgzoqws0XjgmWyZZBGhtsgFFLnoqHwucGrZoa+37SN7p3nQNDZPylwKg
	 1dgt31x4FRmOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F306416A4;
	Fri, 27 Mar 2026 09:59:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E40B1D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6481283D62
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpDYRBRBhBnG for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DA3283D53
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DA3283D53
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FCF17FB6C; Fri, 27 Mar 2026 09:59:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 10:57:21 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c04ad0721369d920ea4a00849dfd2640c9a96ca3
X-Git-Newrev: f6e1de6dfc43eb5c093233fc9d491a8751aafd74
X-Patchwork-Hint: ignore
Message-Id: <20260327095916.7FCF17FB6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/zfs: add patch to
 fix build with uclibc >= 1.0.57
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f6e1de6dfc43eb5c093233fc9d491a8751aafd74
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

uclibc 1.0.57 added a statx() syscall wrapper in upstream commit [1].

zfs fail to build with uclibc 1.0.57 (not yet in Buildroot), because:
1. uclibc <fcntl.h> internally includes <sys/stat.h>, and
2. a zfs test redefines a statx() wrapper with a slightly different
   prototype.

In that case, zfs fails to compile with error:

    tests/zfs-tests/cmd/statx.c:58:1: error: conflicting types for 'statx'; have 'int(int,  const char *, int,  unsigned int,  void *)'

Issue has been reported upstream at [2].

This commit adds a package patch to fix that issue.

[1] https://github.com/wbx-github/uclibc-ng/commit/d3a819aff25af436e22abd5ba01ff2cfc0631b32
[2] https://github.com/openzfs/zfs/pull/18316

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b6884913ae5e342e6ab3c8926447bde158e62de9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...s-tests-cmd-statx.c-avoid-statx-conflicts.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/zfs/0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch b/package/zfs/0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch
new file mode 100644
index 0000000000..98f905aa48
--- /dev/null
+++ b/package/zfs/0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch
@@ -0,0 +1,49 @@
+From d363aafe0a773cd55890a385694cf05cb6225c5a Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Sun, 15 Mar 2026 13:18:07 +0100
+Subject: [PATCH] tests/zfs-tests/cmd/statx.c: avoid statx() conflicts
+
+With some libc, such as uclibc >= 1.0.57, the libc defines the statx()
+function, while also internally including <sys/stat.h> (from <fcntl.h>
+from example), which results to a compilation error due to conflicting
+types.
+
+This commit fixes the issue by only defining the statx() prototype only
+if the libc was detected not to have a working statx() wrapper, and
+explicitly include the <sys/stat.h> otherwise.
+
+Upstream: Discussed in: https://github.com/openzfs/zfs/pull/18316#issuecomment-4062904581
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ tests/zfs-tests/cmd/statx.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/tests/zfs-tests/cmd/statx.c b/tests/zfs-tests/cmd/statx.c
+index 1acc7e58c..c292fdbdf 100644
+--- a/tests/zfs-tests/cmd/statx.c
++++ b/tests/zfs-tests/cmd/statx.c
+@@ -34,6 +34,9 @@
+  * statx() may be available in the kernel, but not in the libc, so we build
+  * our own wrapper if we can't link one.
+  */
++#ifdef HAVE_STATX
++#include <sys/stat.h>
++#endif
+ 
+ #ifndef __NR_statx
+ #if defined(__x86_64__)
+@@ -54,9 +57,11 @@
+ #endif /* __NR_statx */
+ 
+ 
++#ifndef HAVE_STATX
+ int
+ statx(int, const char *, int, unsigned int, void *)
+     __attribute__((weak));
++#endif
+ 
+ static inline int
+ _statx(int fd, const char *path, int flags, unsigned int mask, void *stx)
+-- 
+2.53.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
