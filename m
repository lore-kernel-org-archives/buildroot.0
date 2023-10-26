Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211D8C25B6B
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 11:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC69E4176E;
	Thu, 26 Oct 2023 11:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC69E4176E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TxVHjirT0yJ5; Thu, 26 Oct 2023 11:26:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93AEA41738;
	Thu, 26 Oct 2023 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93AEA41738
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B11E51BF59D
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 11:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99B348169B
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 11:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99B348169B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mBVkeI-gQBG3 for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 11:25:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FE0E81501
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 11:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FE0E81501
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 023F885F09; Thu, 26 Oct 2023 11:25:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 13:13:33 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 7616363468bcc88147f89f161eb2f4db58ce2081
X-Git-Newrev: 78ea668c6ff8f1afaecec006c9f4c92a0844a1f1
X-Patchwork-Hint: ignore
Message-Id: <20231026112539.023F885F09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/casync: fix build
 with gcc >= 13
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=78ea668c6ff8f1afaecec006c9f4c92a0844a1f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
(cherry picked from commit 39e092a06ed79a98e3842f9d897c089a132eaa58)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
