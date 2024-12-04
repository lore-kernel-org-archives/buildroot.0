Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7A6C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC0866FBFB;
	Fri, 28 Feb 2025 16:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u0wjLJCHPsqy; Fri, 28 Feb 2025 16:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8EE76FC13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8EE76FC13;
	Fri, 28 Feb 2025 16:33:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04CC068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 060A2417FB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QmWNhngsQ4L for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E117141807
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E117141807
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D58608769C; Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Dec 2024 22:29:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7dd56b6cd928ee36c96a697075e3fa47b0c52d5e
X-Git-Newrev: f39d38d77afc38c46043a37da2109a0da8a0d5c5
X-Patchwork-Hint: ignore
Message-Id: <20250228162931.D58608769C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sexpect: fix build
 with GCC 14 and uClibc
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f39d38d77afc38c46043a37da2109a0da8a0d5c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

GCC 14 makes implicit declaration an error by default, which breaks
build with uClibc when _GNU_SOURCE is not defined. Add a patch adding
_GNU_SOURCE for uClibc build.

Fixes:
https://autobuild.buildroot.org/results/2c284d800e59e41669a5da85ca23e2923eea7997/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-Unconditionally-define-_GNU_SOURCE.patch  | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/package/sexpect/0001-Unconditionally-define-_GNU_SOURCE.patch b/package/sexpect/0001-Unconditionally-define-_GNU_SOURCE.patch
new file mode 100644
index 0000000000..bb8b60f0c0
--- /dev/null
+++ b/package/sexpect/0001-Unconditionally-define-_GNU_SOURCE.patch
@@ -0,0 +1,69 @@
+From 7ef4ef027c5064502bba23869aed9d1595a4e301 Mon Sep 17 00:00:00 2001
+Message-ID: <7ef4ef027c5064502bba23869aed9d1595a4e301.1732873390.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 29 Nov 2024 11:36:16 +0200
+Subject: [PATCH] Unconditionally define _GNU_SOURCE
+
+uClibc also uses _GNU_SOURCE to expose glibc compatible API extensions.
+But toolchain built with uClibc don't define __gnu_linux__. This leads
+to implicit declaration warnings at build time. With GCC 14 these
+warnings become errors by default.
+
+For example:
+
+.../sexpect-2.3.14/server.c: In function 'expect_exact':
+.../sexpect-2.3.14/server.c:630:17: error: implicit declaration of function 'strcasestr'; did you mean 'strcasecmp'?
+  [-Wimplicit-function-declaration]
+  630 |         found = strcasestr(g.expbuf, g.conn.pass.pattern);
+      |                 ^~~~~~~~~~
+      |                 strcasecmp
+
+Define _GNU_SOURCE unconditionally to fix the build.
+
+Upstream: https://github.com/clarkwang/sexpect/pull/40
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ main.c   | 2 --
+ pty.c    | 2 --
+ server.c | 2 --
+ 3 files changed, 6 deletions(-)
+
+diff --git a/main.c b/main.c
+index 886050a887c1..2bc7c867e297 100644
+--- a/main.c
++++ b/main.c
+@@ -1,7 +1,5 @@
+ 
+-#if defined(__gnu_linux__) || defined(__CYGWIN__)
+ #define _GNU_SOURCE
+-#endif
+ 
+ #include <fcntl.h>
+ #include <limits.h>
+diff --git a/pty.c b/pty.c
+index bf4f6e99805e..f90325d87c77 100644
+--- a/pty.c
++++ b/pty.c
+@@ -1,7 +1,5 @@
+ 
+-#if defined(__gnu_linux__) || defined(__CYGWIN__)
+ #define _GNU_SOURCE
+-#endif
+ 
+ #include <string.h>
+ #include <stdio.h>
+diff --git a/server.c b/server.c
+index c7e41e0a7dc4..308852f08089 100644
+--- a/server.c
++++ b/server.c
+@@ -1,7 +1,5 @@
+ 
+-#if defined(__gnu_linux__) || defined(__CYGWIN__)
+ #define _GNU_SOURCE
+-#endif
+ 
+ #include <assert.h>
+ #include <fcntl.h>
+-- 
+2.45.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
