Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75950F53D96
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 20:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7978410BB;
	Mon, 16 Mar 2026 20:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6s2THZsFDnLR; Mon, 16 Mar 2026 20:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11C10410AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773694758;
	bh=sAJdH3yoKZXdV/hY57u1qXLiPHzBC8avnkunNOYnlKk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XxLD+dm/UB8DEyPEPUkJNzWZK6qG3em/xwRVMLsCpDKgjpDn89u1807WIgvbtG0tD
	 LkBi2NRIfOAAepjoxBrfGA1vVDt/pY3uHSmi97vVPrDoGV3XA9/EnKZXWHt0NUAOjn
	 D/x68ZhKrAoWRbICMNK6276iOaaiD2o2fQ6W7hEbi7bXfa84M1eelYcFPbX0RyuaAx
	 /IjN2ZaoQHdCH2bYH51Jg185fH7lwpWBaXuWqv3rJkYTZX4atwuBCcW2V2A2bFMLTn
	 51iDW08/1OrDzR8wiGSuczL/oSvRQA5ilE4Xt6jlwvU3JUgoNA+QhFPiHDulIESVtI
	 aXoHdFSw7oqVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11C10410AE;
	Mon, 16 Mar 2026 20:59:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C95063BE
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 20:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAE0340949
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 20:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4g-65hVqJoYE for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 20:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE34640173
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE34640173
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 20:59:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FE9586BB6; Mon, 16 Mar 2026 20:59:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Mar 2026 21:58:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe49bf9451b512b3c2d6c441b16ec0a87ea54959
X-Git-Newrev: b6884913ae5e342e6ab3c8926447bde158e62de9
X-Patchwork-Hint: ignore
Message-Id: <20260316205916.1FE9586BB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: add patch to fix build with
 uclibc >= 1.0.57
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b6884913ae5e342e6ab3c8926447bde158e62de9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
