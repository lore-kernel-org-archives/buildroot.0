Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F8DC3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 20:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98FB982C4D;
	Wed, 10 Jul 2024 20:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3XtCZSwhqV1; Wed, 10 Jul 2024 20:27:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE0B582C89
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE0B582C89;
	Wed, 10 Jul 2024 20:27:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 56A641BF599
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 438094148E
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mIrAvpMFD89 for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 20:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F0A9413EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F0A9413EC
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 20:27:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2762E8467F; Wed, 10 Jul 2024 20:27:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 22:20:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e2c2810dc25de0cdc2126851061f9feabe66930
X-Git-Newrev: 3b9d62dac564b6d1bfa5ba5e0dd72e731fd95d55
X-Patchwork-Hint: ignore
Message-Id: <20240710202727.2762E8467F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/syslinux: fix building with GCC 14.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6538787896618596228=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6538787896618596228==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3b9d62dac564b6d1bfa5ba5e0dd72e731fd95d55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing stdio.h include. Without this includes, the build fails
with the following error under GCC 14.x:

../../../com32/lib/syslinux/debug.c: In function ‘syslinux_debug’:
../../../com32/lib/syslinux/debug.c:91:5: error: implicit declaration of function ‘printf’ [-Wimplicit-function-declaration]
   91 |     printf("Dynamic debug unavailable\n");

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/syslinux/0020-pull-in-stdio-h-for-gcc14.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/boot/syslinux/0020-pull-in-stdio-h-for-gcc14.patch b/boot/syslinux/0020-pull-in-stdio-h-for-gcc14.patch
new file mode 100644
index 0000000000..09a0074b31
--- /dev/null
+++ b/boot/syslinux/0020-pull-in-stdio-h-for-gcc14.patch
@@ -0,0 +1,34 @@
+From dfa2705100a893bc017d23406daa9a383fbc3c95 Mon Sep 17 00:00:00 2001
+From: Lance Fredrickson <lancethepants@gmail.com>
+Date: Wed, 5 Jun 2024 14:31:38 -0600
+Subject: [PATCH] com32/lib/syslinux/debug.c: add missing stdio.h include.
+
+Fix building syslinux with GCC 14.x
+
+Add missing stdio.h include. Without it results in the following error under GCC 14.x
+
+../../../com32/lib/syslinux/debug.c: In function ‘syslinux_debug’:
+../../../com32/lib/syslinux/debug.c:91:5: error: implicit declaration of function ‘printf’ [-Wimplicit-function-declaration]
+   91 |     printf("Dynamic debug unavailable\n");
+
+Upstream: dead (last release in 2014)
+Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
+---
+ com32/lib/syslinux/debug.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/com32/lib/syslinux/debug.c b/com32/lib/syslinux/debug.c
+index d9ab863f..e8f53d57 100644
+--- a/com32/lib/syslinux/debug.c
++++ b/com32/lib/syslinux/debug.c
+@@ -1,6 +1,7 @@
+ #include <linux/list.h>
+ #include <string.h>
+ #include <stdbool.h>
++#include <stdio.h>
+ 
+ #ifdef DYNAMIC_DEBUG
+ 
+-- 
+2.39.2
+

--===============6538787896618596228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6538787896618596228==--
