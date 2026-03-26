Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8951F10ED640
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E91B6131E;
	Fri, 27 Mar 2026 10:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7x8ruMaOMZA; Fri, 27 Mar 2026 10:01:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08D87612E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605710;
	bh=kNtlzgltxJOd5SJ3NzkR4G9AyJnI9Ics7yUjeSkJE64=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k2Lk9rkX/U3d8TsqgKI7GnT/Ru7FymkERQgMGMSKD/UoHDej2WlHT7cDq4BolRA1T
	 OR0ZMYZmHwYABIavfplPstUnFk+kv+KUa4Pi6ri6RgJR7Y06WRlhue3LmeUYztY9Z4
	 MYAAOWvpkSYtf+H+OtuL0ah60vSKhlda7ag/9LCD7I3od52UV0F+kjZYKPIVlvWMdF
	 hEc/MeakZCcvMDTcSeQDdqfiIv3SEI44nRXfo8jYGyk1ovc02FR+ayHEG0z4y9mz/g
	 NH6iIpLCkd3689Zdaj/WF+waKfo5IN3EV8HwKiqoRa+wPWsrSPicA/ZbEOBYpDhD56
	 WnkBNXIYqRZgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08D87612E0;
	Fri, 27 Mar 2026 10:01:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56D05249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48FF183D61
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NiWDRaO6yt42 for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFADA83D5E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFADA83D5E
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D2737FBC6; Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 17:07:37 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: efc22bcd2c18ba00335f7e076434cb34684d28e6
X-Git-Newrev: 75c2df66f664428abb39836fe9b8bf5b9cfcc2a1
X-Patchwork-Hint: ignore
Message-Id: <20260327100141.3D2737FBC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/zfs: add patch to
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/75c2df66f664428abb39836fe9b8bf5b9cfcc2a1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
