Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA200C83030
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 20:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 892D46141A;
	Mon, 30 Jun 2025 20:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpWV7TsG_s9c; Mon, 30 Jun 2025 20:34:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2AA66141E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2AA66141E;
	Mon, 30 Jun 2025 20:34:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AFADDF
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 20:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0BD781222
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 20:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ra7jE49rb6UJ for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 20:34:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A1B48107F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A1B48107F
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 20:34:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2158C84E3A; Mon, 30 Jun 2025 20:34:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Jun 2025 22:20:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c1fa0bce14b2a75e7ede0d6bf6be52d7807684e
X-Git-Newrev: 901b9e19ed3741d0cc379ff8f145b2294a3bd09b
X-Patchwork-Hint: ignore
Message-Id: <20250630203433.2158C84E3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvmtool: fix build failure w/ musl
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
Content-Type: multipart/mixed; boundary="===============6344997827548054815=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6344997827548054815==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=901b9e19ed3741d0cc379ff8f145b2294a3bd09b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following error occurs on the autobuilder for builds with musl
libc.

```
  CC       util/bitmap.o
In file included from include/linux/bitmap.h:7,
                 from util/bitmap.c:9:
include/linux/bitops.h:4:10: fatal error: bits/wordsize.h: No such file or directory
    4 | #include <bits/wordsize.h>
      |          ^~~~~~~~~~~~~~~~~
```

The error occurs because bits/wordsize.h is specific to glibc.

This patch applies an upstream fix that replaces the use of __WORDSIZE
with an internal macro, making the code portable across different libc.

Fixes: https://autobuild.buildroot.org/results/30d/30d6e407e6a0fc7d85062c2d56008755c70ca733/build-end.log
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...rdsize-h-inclusion-for-musl-compatibility.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/kvmtool/0001-remove-wordsize-h-inclusion-for-musl-compatibility.patch b/package/kvmtool/0001-remove-wordsize-h-inclusion-for-musl-compatibility.patch
new file mode 100644
index 0000000000..3128a23689
--- /dev/null
+++ b/package/kvmtool/0001-remove-wordsize-h-inclusion-for-musl-compatibility.patch
@@ -0,0 +1,52 @@
+From 0592f8f829c843ff5cb2d108c309e32f4f6f5379 Mon Sep 17 00:00:00 2001
+From: Andre Przywara <andre.przywara@arm.com>
+Date: Thu, 1 Aug 2024 12:10:54 +0100
+Subject: remove wordsize.h inclusion (for musl compatibility)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The wordsize.h header file and the __WORDSIZE definition do not seem
+to be universal, the musl libc for instance has the definition in a
+different header file. This breaks compilation of kvmtool against musl.
+
+The two leading underscores suggest a compiler-internal symbol anyway, so
+let's just remove that particular macro usage entirely, and replace it
+with the number we really want: the size of a "long" type.
+
+Reported-by: J. Neuschäfer <j.neuschaefer@gmx.net>
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
+Link: https://lore.kernel.org/r/20240801111054.818765-1-andre.przywara@arm.com
+Signed-off-by: Will Deacon <will@kernel.org>
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/commit/?id=0592f8f829c843ff5cb2d108c309e32f4f6f5379
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ include/linux/bitops.h | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/include/linux/bitops.h b/include/linux/bitops.h
+index ae33922f..ee8fd560 100644
+--- a/include/linux/bitops.h
++++ b/include/linux/bitops.h
+@@ -1,15 +1,13 @@
+ #ifndef _KVM_LINUX_BITOPS_H_
+ #define _KVM_LINUX_BITOPS_H_
+ 
+-#include <bits/wordsize.h>
+-
+ #include <linux/kernel.h>
+ #include <linux/compiler.h>
+ #include <asm/hweight.h>
+ 
+-#define BITS_PER_LONG __WORDSIZE
+ #define BITS_PER_BYTE           8
+-#define BITS_TO_LONGS(nr)       DIV_ROUND_UP(nr, BITS_PER_BYTE * sizeof(long))
++#define BITS_PER_LONG           (BITS_PER_BYTE * sizeof(long))
++#define BITS_TO_LONGS(nr)       DIV_ROUND_UP(nr, BITS_PER_LONG)
+ 
+ #define BIT_WORD(nr)		((nr) / BITS_PER_LONG)
+ 
+-- 
+cgit 1.2.3-korg
+

--===============6344997827548054815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6344997827548054815==--
