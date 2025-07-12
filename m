Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4493BC83F1D
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 21:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF4108204E;
	Sat, 12 Jul 2025 21:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HOOLsZU-Ju4P; Sat, 12 Jul 2025 21:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FFD18203E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FFD18203E;
	Sat, 12 Jul 2025 21:35:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F632106
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 21:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0178B4078A
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 21:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G7A854cew2Gx for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 21:35:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 465214077B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 465214077B
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 21:35:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31B5B8641D; Sat, 12 Jul 2025 21:35:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Jul 2025 23:31:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d31694a8ef2d1d07de07081a46481f489a2f725b
X-Git-Newrev: cd6f2b465bcc15f9f9ec338133b029094417c114
X-Patchwork-Hint: ignore
Message-Id: <20250712213545.31B5B8641D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libargtable2: fix build error with
 gcc-14
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd6f2b465bcc15f9f9ec338133b029094417c114
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following build error is happening on the autobuilder:

```
arg_int.c:60:12: error: implicit declaration of function 'isspace' [-Wimplicit-function-declaration]
   60 |     while (isspace(*ptr))
      |            ^~~~~~~
arg_int.c:33:1: note: include '<ctype.h>' or provide a declaration of 'isspace'
   32 | #include <limits.h>
  +++ |+#include <ctype.h>
   33 |
arg_int.c:89:8: error: implicit declaration of function 'toupper' [-Wimplicit-function-declaration]
   89 |    if (toupper(*ptr++)!=toupper(X))
      |        ^~~~~~~
arg_int.c:89:8: note: include '<ctype.h>' or provide a declaration of 'toupper'
```

Both `isspace` and `toupper` are declared in the `ctype.h` header.
This build error started to happen with gcc-14.
The `ctype.h` include was added in a later upstream commit.
This patch adds that upstream commit and strip everything else to only
patch that include.

Fixes: https://autobuild.buildroot.org/results/d38/d38e3e12f52c3fde08ab446ca14a1a7bd65c9469//
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: add comment about gcc-14]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libargtable2/0001-apply-uint-patch.patch | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/libargtable2/0001-apply-uint-patch.patch b/package/libargtable2/0001-apply-uint-patch.patch
new file mode 100644
index 0000000000..fed0307852
--- /dev/null
+++ b/package/libargtable2/0001-apply-uint-patch.patch
@@ -0,0 +1,25 @@
+From 3fe1ce4d7aa7c4fc16471a9ab023ecf6628c2f11 Mon Sep 17 00:00:00 2001
+From: Chris McClelland <prophet3636@gmail.com>
+Date: Thu, 12 Nov 2020 14:18:27 +0000
+Subject: [PATCH] Apply uint patch
+
+Upstream: https://github.com/makestuff/libargtable2/commit/3fe1ce4d7aa7c4fc16471a9ab023ecf6628c2f11
+[thomas: strip to only have the include]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/arg_int.c     |  2 ++
+ 1 files changed, 2 insertions(+)
+
+diff --git a/src/arg_int.c b/src/arg_int.c
+index 29c20e5..c51706a 100644
+--- a/src/arg_int.c
++++ b/src/arg_int.c
+@@ -24,6 +24,8 @@ USA.
+ #include "config.h"
+ #endif
+ 
++#include <ctype.h>
++
+ /* #ifdef HAVE_STDLIB_H */
+ #include <stdlib.h>
+ /* #endif */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
