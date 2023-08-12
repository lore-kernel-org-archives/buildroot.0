Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ADEEE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B40F240B61;
	Mon, 21 Aug 2023 20:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B40F240B61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZRLb8R96uSd; Mon, 21 Aug 2023 20:17:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F87441494;
	Mon, 21 Aug 2023 20:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F87441494
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E8AF1BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B20E0409E3
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B20E0409E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IljIHCQkYvz4 for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 293B9410C7
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 293B9410C7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 226E086024; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 14:33:56 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1c5560cdece81eb02c56ad2841103cd3515db7d0
X-Git-Newrev: 29834d8a12d984e8efe05398c5aaa6a61f7880e0
X-Patchwork-Hint: ignore
Message-Id: <20230821200126.226E086024@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/conmon: fix compile
 when using a static build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=29834d8a12d984e8efe05398c5aaa6a61f7880e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is a new Buildroot package and this is the first build error
the autobuild servers found. It is not part of any Buildroot release
so no need to backport.

Patch removes dlfcn.h, because it is unused.

Fixes:
 - http://autobuild.buildroot.net/results/db3/db301e9f556592828800fa663f2549f430adb58f

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-remove-unused-dlfcn.h-header-file.patch   | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/conmon/0001-remove-unused-dlfcn.h-header-file.patch b/package/conmon/0001-remove-unused-dlfcn.h-header-file.patch
new file mode 100644
index 0000000000..14f817942e
--- /dev/null
+++ b/package/conmon/0001-remove-unused-dlfcn.h-header-file.patch
@@ -0,0 +1,26 @@
+From e28634a0e847a14c58482f962bc9b1d69937387f Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sat, 12 Aug 2023 12:53:37 +0200
+Subject: [PATCH] remove unused dlfcn.h header file
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://github.com/containers/conmon/issues/443
+---
+ src/seccomp_notify.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/seccomp_notify.c b/src/seccomp_notify.c
+index 8d34d9d..2a8371d 100644
+--- a/src/seccomp_notify.c
++++ b/src/seccomp_notify.c
+@@ -7,7 +7,6 @@
+ 
+ #include <errno.h>
+ #include <sys/ioctl.h>
+-#include <dlfcn.h>
+ #include <sys/wait.h>
+ #include <sys/mount.h>
+ #include <signal.h>
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
