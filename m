Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6634D6EBF1
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 09:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E2ED84149;
	Fri, 29 Nov 2024 09:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYGi6kG0qmxc; Fri, 29 Nov 2024 09:48:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B7BC8413E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B7BC8413E;
	Fri, 29 Nov 2024 09:48:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AE1A712
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 09:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1905C407E8
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 09:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSxqshVgo4mq for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 09:48:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D81C340800
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D81C340800
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D81C340800
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 09:48:16 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 78DD8440F82;
 Fri, 29 Nov 2024 11:44:22 +0200 (IST)
To: buildroot@buildroot.org
Date: Fri, 29 Nov 2024 11:48:06 +0200
Message-ID: <aa990b09bff81339550d51568972acee3f46bcf4.1732873686.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1732873462;
 bh=wa0l7BAc0+48PxeYniruOuph8vHPkpLw5FY9oX9x+XQ=;
 h=From:To:Cc:Subject:Date:From;
 b=JrKVwNcSOplJvGHFES8XqD79XQPKWpxizweWoQ37rQZXuAyzHRO61c/YLxbfC6PFP
 Iz4Cq3y/qBw7NWMEpjacWgBiT8n2f6IaEetEMmLXAe+DZJl1+KUWLVmqxWHAp/bT5S
 J8I4vdmhP3wRHhQZ8RWyfHN0KO5l65eXb4utRT1EuN8v7FwDFCT2BXBmAjq9xBOg63
 SnBOM3SWqWw0dzPeSrQipeZLUTHzTqEwJ9xtD9M8Nd3k4EotOWW2vo8JA6tLlRWCcP
 ZOaV0SD+mDIjUfPix6753d4lKpnthiGssRBuSFUHrT7XzF7JCerZkq9cgVfXnHPBGY
 0RUrW783XqZXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=JrKVwNcS
Subject: [Buildroot] [PATCH] package/sexpect: fix build with GCC 14 and
 uClibc
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GCC 14 makes implicit declaration an error by default, which breaks
build with uClibc when _GNU_SOURCE is not defined. Add a patch adding
_GNU_SOURCE for uClibc build.

Fixes:
https://autobuild.buildroot.org/results/2c284d800e59e41669a5da85ca23e2923eea7997/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...1-Unconditionally-define-_GNU_SOURCE.patch | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 package/sexpect/0001-Unconditionally-define-_GNU_SOURCE.patch

diff --git a/package/sexpect/0001-Unconditionally-define-_GNU_SOURCE.patch b/package/sexpect/0001-Unconditionally-define-_GNU_SOURCE.patch
new file mode 100644
index 000000000000..bb8b60f0c0d9
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
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
