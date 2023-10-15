Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93CECDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 19:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9508A414CF;
	Sun, 15 Oct 2023 19:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9508A414CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B401Q0_cQ6Hn; Sun, 15 Oct 2023 19:59:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 354EA414D6;
	Sun, 15 Oct 2023 19:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 354EA414D6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E34C1BF21A
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 19:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03BCA414C6
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 19:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03BCA414C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oi1HSyVVYwS2 for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 19:59:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF623414D5
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 19:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF623414D5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB2BB856F1; Sun, 15 Oct 2023 19:59:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 21:59:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 470f0fb1ec0bd2ba03340f2aea34891ca8d7739d
X-Git-Newrev: 39e092a06ed79a98e3842f9d897c089a132eaa58
X-Patchwork-Hint: ignore
Message-Id: <20231015195913.BB2BB856F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/casync: fix build with gcc >= 13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=39e092a06ed79a98e3842f9d897c089a132eaa58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc >= 13:

In file included from ../src/compressor.c:3:
../src/compressor.h:59:59: error: unknown type name 'size_t'
   59 | int compressor_input(CompressorContext *c, const void *p, size_t sz);
      |                                                           ^~~~~~
../src/compressor.h:19:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
   18 | #include "cacompression.h"
  +++ |+#include <stddef.h>
   19 |

Fixes:
 - http://autobuild.buildroot.org/results/ab08f3b90d253db45643dd058b80ae1dd5f49d0f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...01-src-compressor.h-fix-build-with-gcc-13.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/casync/0001-src-compressor.h-fix-build-with-gcc-13.patch b/package/casync/0001-src-compressor.h-fix-build-with-gcc-13.patch
new file mode 100644
index 0000000000..32af9142a7
--- /dev/null
+++ b/package/casync/0001-src-compressor.h-fix-build-with-gcc-13.patch
@@ -0,0 +1,40 @@
+From 8db993c32f97188bdd6de4b2aa177fc513ee7e9f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 15 Oct 2023 21:22:58 +0200
+Subject: [PATCH] src/compressor.h: fix build with gcc >= 13
+
+Fix the following build failure with gcc >= 13:
+
+In file included from ../src/compressor.c:3:
+../src/compressor.h:59:59: error: unknown type name 'size_t'
+   59 | int compressor_input(CompressorContext *c, const void *p, size_t sz);
+      |                                                           ^~~~~~
+../src/compressor.h:19:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
+   18 | #include "cacompression.h"
+  +++ |+#include <stddef.h>
+   19 |
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ab08f3b90d253db45643dd058b80ae1dd5f49d0f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/systemd/casync/pull/270
+---
+ src/compressor.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/compressor.h b/src/compressor.h
+index 2c9f93b..ae2eb30 100644
+--- a/src/compressor.h
++++ b/src/compressor.h
+@@ -4,6 +4,7 @@
+ #define foocompresshorhfoo
+ 
+ #include <stdbool.h>
++#include <stddef.h>
+ 
+ #if HAVE_LIBLZMA
+ #  include <lzma.h>
+-- 
+2.42.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
