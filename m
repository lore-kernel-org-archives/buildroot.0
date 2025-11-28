Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51836D116E2
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 17:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12BA040488;
	Fri, 28 Nov 2025 17:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FxjM2aj8zxl9; Fri, 28 Nov 2025 17:41:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E0244034D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E0244034D;
	Fri, 28 Nov 2025 17:41:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A366E708
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A90540334
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RVyRu8zuHISI for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 17:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD71F4032D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD71F4032D
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:41:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA1758603C; Fri, 28 Nov 2025 17:41:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Nov 2025 18:40:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be8dd9d0d26fa287768c82dbff6241b0c7e1e7c7
X-Git-Newrev: 97ce96f8ce959b20094617f08bdbbf60105d8229
X-Patchwork-Hint: ignore
Message-Id: <20251128174128.AA1758603C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lmbench: fix build with newer gcc
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

commit: https://git.buildroot.net/buildroot/commit/?id=97ce96f8ce959b20094617f08bdbbf60105d8229
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/189/189219853fbe1b7daf0aaad29279858c6e60507b/

Sent patch to active fork:
https://sourceforge.net/p/lmbench/patches/3/#4472

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0009-src-bench.h-include-string.h.patch        | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/lmbench/0009-src-bench.h-include-string.h.patch b/package/lmbench/0009-src-bench.h-include-string.h.patch
new file mode 100644
index 0000000000..0c82a58b59
--- /dev/null
+++ b/package/lmbench/0009-src-bench.h-include-string.h.patch
@@ -0,0 +1,36 @@
+From 30a95099f4711d7c5a59526a84e2c73701af3c3c Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 25 Nov 2025 22:57:21 +0100
+Subject: [PATCH] src/bench.h: include string.h
+
+Fixes build error with newer gcc, detected by buildroot autobuilders:
+https://autobuild.buildroot.net/results/189/189219853fbe1b7daf0aaad29279858c6e60507b//build-end.log
+
+lib_unix.c: In function 'unix_server':
+lib_unix.c:29:9: error: implicit declaration of function 'strcpy' [-Wimplicit-function-declaration]
+   29 |         strcpy(s.sun_path, path);
+      |         ^~~~~~
+lib_unix.c:10:1: note: include '<string.h>' or provide a declaration of 'strcpy'
+
+Upstream: https://github.com/intel/lmbench/pull/41
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/bench.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/bench.h b/src/bench.h
+index 3b25a47..f0fd6b7 100644
+--- a/src/bench.h
++++ b/src/bench.h
+@@ -27,6 +27,7 @@ typedef unsigned char bool_t;
+ #ifndef WIN32
+ #include        <strings.h>
+ #endif
++#include        <string.h>
+ #include        <sys/types.h>
+ #ifndef WIN32
+ #include        <sys/mman.h>
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
