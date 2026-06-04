Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5495CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA6E680B1C;
	Fri,  5 Jun 2026 12:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5P3wcYJl87ZK; Fri,  5 Jun 2026 12:41:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8C7780B50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663266;
	bh=UHL+7g+e3TEEv2HMyt2guTaaaEZZAYPD0QZVALhkUls=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WusTjjqJ/j2+iSLNOOkk++CwH5+YE/iQAxbJ4DpnFZa/S8ELxePIZilqzSfGDNBBZ
	 fjbY4Tk/FQz8HGVh7vRo3Np0xwSc1aJMbzvRqClWyCfFGB6QqbVn2YmKRw1sPJE6ef
	 e+Xcu1YF9njvOTLsVZr2SMfcvOkXkLNsTERt7am3KTfKPWL/IVQHFJ9bMRTWdQYpF+
	 QWxQjdILDUwgTMme/exFzQvltzOPUb0ktZSGhijhfmWyEDIojuulXbW/tMVnK6YyPj
	 pR7CAznoMIfigqRxkNZvtMc/gTRNVyFe1n4uU4gPi5ri4Uq+6KXYMnwT8dyrmfat3u
	 FaEZdnKxh3nbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8C7780B50;
	Fri,  5 Jun 2026 12:41:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16A1E388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0A3B81FE9
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tRIZyBQ22Pk for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B0DF82034
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B0DF82034
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34C8887B3C; Fri,  5 Jun 2026 12:38:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:17:27 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: c304683bf9716c3390650d976df010d379cf7144
X-Git-Newrev: e3ccc1eaed1ae789727ddd1dd776c875422de34b
X-Patchwork-Hint: ignore
Message-Id: <20260605123839.34C8887B3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/lrzsz: fix build
 with gcc >= 14.x
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e3ccc1eaed1ae789727ddd1dd776c875422de34b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes:
https://autobuild.buildroot.net/results/2e3/2e33c61e1c9bee099f973c1e43b696c63e5eed4b/

Building lrzsz with this defconfig works:

BR2_GCC_VERSION_13_X=y
BR2_PACKAGE_LRZSZ=y

and gets broken when switched to gcc 14:

BR2_PACKAGE_LRZSZ=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 28e52cde511f03317507835a33b3bd8362d08f5d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
