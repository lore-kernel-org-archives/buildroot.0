Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E213C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03A12415A2;
	Tue,  1 Feb 2022 22:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5arRmd1ltUch; Tue,  1 Feb 2022 22:06:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2898E4161B;
	Tue,  1 Feb 2022 22:06:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F6FB1BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E84F841594
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JmD5V8oErqNf for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 373FC415F9
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5C8B882817; Tue,  1 Feb 2022 21:58:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Feb 2022 22:58:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 750aa61300ca6434426916e83cf0ce18f729b668
X-Git-Newrev: 6dac320f73e37b88b8e2b063e41bae53aae466a3
X-Patchwork-Hint: ignore
Message-Id: <20220201215822.5C8B882817@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iproute2: fix musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=6dac320f73e37b88b8e2b063e41bae53aae466a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following musl build failure raised since bump to version 5.16.0
in commit 8f54d6d7859c0eabf303a44b26e6fafb1cb50143:

ax25_ntop.c:5:10: fatal error: netax25/ax25.h: No such file or directory
    5 | #include <netax25/ax25.h>
      |          ^~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/455840288bbe13ed585b0e2dc7b20a294dd1eee1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-lib-fix-ax25-h-include-for-musl.patch     | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch b/package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch
new file mode 100644
index 0000000000..1f8860c5d8
--- /dev/null
+++ b/package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch
@@ -0,0 +1,37 @@
+From 8bced38a941a181f1468fa39541e872e51b6022f Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Thu, 13 Jan 2022 08:14:13 +0000
+Subject: [PATCH] lib: fix ax25.h include for musl
+
+ax25.h isn't guaranteed to be avilable in netax25/*;
+it's dependent on our choice of libc (it's not available
+on musl at least) [0].
+
+Let's use the version from linux-headers.
+
+[0] https://sourceware.org/glibc/wiki/Synchronizing_Headers
+Bug: https://bugs.gentoo.org/831102
+
+Signed-off-by: Sam James <sam@gentoo.org>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+
+[Retrieved from:
+https://github.com/shemminger/iproute2/commit/8bced38a941a181f1468fa39541e872e51b6022f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/ax25_ntop.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/ax25_ntop.c b/lib/ax25_ntop.c
+index cfd0e04b0..3a72a43e9 100644
+--- a/lib/ax25_ntop.c
++++ b/lib/ax25_ntop.c
+@@ -2,7 +2,7 @@
+ 
+ #include <errno.h>
+ #include <sys/socket.h>
+-#include <netax25/ax25.h>
++#include <linux/ax25.h>
+ 
+ #include "utils.h"
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
