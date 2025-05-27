Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F3AC5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 17:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A50C80B42;
	Wed,  4 Jun 2025 17:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jItsGfWesP10; Wed,  4 Jun 2025 17:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB80383F57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB80383F57;
	Wed,  4 Jun 2025 17:20:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3841A1A4
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F06680DDF
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EIxox9fZp_Wn for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 17:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5138C80B43
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5138C80B43
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:20:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C3E6878DD; Wed,  4 Jun 2025 17:20:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:24:35 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 89c82ec8e820eed9e8e9fb7448b4dc99e10ed5db
X-Git-Newrev: af6298b6d965805003052979efe0983394a8471a
X-Patchwork-Hint: ignore
Message-Id: <20250604172010.4C3E6878DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/flex: fix GCC
 15.x build issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=af6298b6d965805003052979efe0983394a8471a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes:
https://autobuild.buildroot.net/results/924b1015d4b81385409ef00f1a14be3ca1959c8e/

As part of building flex for the target a few files are built for the host,
including a rpl_malloc() implementation containing a malloc() forward
declaration without any function parameters.

GCC 15 defaults to -std=gnu23, which handles function declarations without
parameters differently from earlier C standards leading to compilation
errors:

../lib/malloc.c:6:12: warning: conflicting types for built-in function 'malloc'; expected 'void *(long unsigned int)' [-Wbuiltin-declaration-mismatch]
    6 |      void *malloc ();
      |            ^~~~~~
../lib/malloc.c:5:1: note: 'malloc' is declared in header '<stdlib.h>'
    4 |      #include <sys/types.h>
  +++ |+#include <stdlib.h>
    5 |
../lib/malloc.c: In function 'rpl_malloc':
../lib/malloc.c:16:15: error: too many arguments to function 'malloc'; expected 0, have 1

https://gcc.gnu.org/gcc-15/porting_to.html#c23-fn-decls-without-parameters

Add a patch submitted upstream to correct the prototype.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7b98e2ce2c54c228c13d5ac50168fc4fa66fc15e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0004-Match-malloc-signature-to-its-use.patch   | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/flex/0004-Match-malloc-signature-to-its-use.patch b/package/flex/0004-Match-malloc-signature-to-its-use.patch
new file mode 100644
index 0000000000..ac57e3b4c8
--- /dev/null
+++ b/package/flex/0004-Match-malloc-signature-to-its-use.patch
@@ -0,0 +1,27 @@
+From 4b142954b54a57a9b0af0a9661056a9c39a8fa95 Mon Sep 17 00:00:00 2001
+From: Richard Barnes <rbarnes@umn.edu>
+Date: Wed, 2 Oct 2024 10:35:09 -0700
+Subject: [PATCH] Match `malloc` signature to its use
+
+Upstream: https://github.com/westes/flex/pull/674
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ lib/malloc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/malloc.c b/lib/malloc.c
+index 75e8ef9..701b9b3 100755
+--- a/lib/malloc.c
++++ b/lib/malloc.c
+@@ -3,7 +3,7 @@
+      
+      #include <sys/types.h>
+      
+-     void *malloc ();
++     void *malloc (size_t n);
+      
+      /* Allocate an N-byte block of memory from the heap.
+         If N is zero, allocate a 1-byte block.  */
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
