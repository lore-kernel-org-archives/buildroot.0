Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C8DCD6E53
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3065561737;
	Sat, 30 May 2026 20:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZ8u-dAGl6JB; Sat, 30 May 2026 20:04:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54F996F5AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780171448;
	bh=cwx7z49AfZ1tVcBP7FmtZHZdqXaKzmPyYku3tvYxna4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X16hY6lKxKOYzbuP+YOPz9UBbOVtdj1VufjrL1oBviuLQ6yPPRrFRRBpDwKD7j0xB
	 aqcY/Q1/FvmDyEZZEoXw88kGXqfc/bO4N/T8m1mnV43Qi53L5S9HFYKLuhlX3yB6AZ
	 QxLfj68ycZKX/K1tMKii3m0A5pJ50OYdCvuaPqAQ+3GkCWqdWf3fVFDT7sGZCl9/jh
	 JHY0qOM+Hct8BdHizyzlsaS0iJr4gjoD0e90RHl/01n/+0c9uUgA2O+FyebhomZ5+u
	 hFH3gTRr1++zmS19Q/+1SOoX1FNuuujtXD0jNyaZLB5gg3gJ847nT9rxqGkOBU+m9l
	 WwvJZSrkZK00g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54F996F5AE;
	Sat, 30 May 2026 20:04:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10AEFF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01DBF426A6
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_2_u9n2BOKq for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:04:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CD164010F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CD164010F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:04:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0112F87551; Sat, 30 May 2026 20:03:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 21:58:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fca527be89945d5b77bc489ef4b4d25e99a7c848
X-Git-Newrev: 28e52cde511f03317507835a33b3bd8362d08f5d
X-Patchwork-Hint: ignore
Message-Id: <20260530200352.0112F87551@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lrzsz: fix build with gcc >= 14.x
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/28e52cde511f03317507835a33b3bd8362d08f5d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
https://autobuild.buildroot.net/results/2e3/2e33c61e1c9bee099f973c1e43b696c63e5eed4b/

Building lrzsz with this defconfig works:

BR2_GCC_VERSION_13_X=y
BR2_PACKAGE_LRZSZ=y

and gets broken when switched to gcc 14:

BR2_PACKAGE_LRZSZ=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .../lrzsz/0007-configure-fix-for-gcc-14.x.patch    | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/lrzsz/0007-configure-fix-for-gcc-14.x.patch b/package/lrzsz/0007-configure-fix-for-gcc-14.x.patch
new file mode 100644
index 0000000000..160cf73d62
--- /dev/null
+++ b/package/lrzsz/0007-configure-fix-for-gcc-14.x.patch
@@ -0,0 +1,55 @@
+From 791b757537d48a9e6beec4a1551d277b79b95f37 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 2 Mar 2026 20:09:25 +0100
+Subject: [PATCH] configure: fix for gcc >= 14.x
+
+The pre-generated configure script has a check that doesn't work with
+GCC >= 14.x:
+
+configure:1932: checking for ANSI C header files
+configure:1945: /home/bernd/buildroot/output/per-package/lrzsz/host/bin/i586-buildroot-linux-gnu-cpp -D_LARGEFILE_SOURCE -D_LARGEFILE64_S
+OURCE -D_FILE_OFFSET_BITS=64 conftest.c >/dev/null 2>conftest.out
+configure:2012: /home/bernd/buildroot/output/per-package/lrzsz/host/bin/i586-buildroot-linux-gnu-gcc -o conftest -D_LARGEFILE_SOURCE -D_L
+ARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0 -D_FORTIFY_SOURCE=1 -std=gnu17 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BIT
+S=64  conftest.c  1>&5
+configure: In function 'main':
+configure:2007:67: error: implicit declaration of function 'exit' [-Wimplicit-function-declaration]
+ 2007 | if (XOR (islower (i), ISLOWER (i)) || toupper (i) != TOUPPER (i)) exit(2);
+      |                                                                   ^~~~
+configure:2003:1: note: include '<stdlib.h>' or provide a declaration of 'exit'
+ 2002 | #include <ctype.h>
+  +++ |+#include <stdlib.h>
+
+Doing AUTORECONF = YES doesn't work as the configure.in is very old, so
+let's fix the configure script directly.
+
+Upstream: N/A, patching generated file
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure b/configure
+index 16a259a..8601361 100755
+--- a/configure
++++ b/configure
+@@ -1572,6 +1572,7 @@ else
+ #line 1573 "configure"
+ #include "confdefs.h"
+ #include <ctype.h>
++#include <stdlib.h>
+ #define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
+ #define TOUPPER(c) (ISLOWER(c) ? 'A' + ((c) - 'a') : (c))
+ #define XOR(e, f) (((e) && !(f)) || (!(e) && (f)))
+@@ -2000,6 +2001,7 @@ else
+ #line 2001 "configure"
+ #include "confdefs.h"
+ #include <ctype.h>
++#include <stdlib.h>
+ #define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
+ #define TOUPPER(c) (ISLOWER(c) ? 'A' + ((c) - 'a') : (c))
+ #define XOR(e, f) (((e) && !(f)) || (!(e) && (f)))
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
