Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236C1C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 09:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8C5161036;
	Sat, 17 Sep 2022 09:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8C5161036
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DG4Yu0bhjSr0; Sat, 17 Sep 2022 09:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2B7260AD6;
	Sat, 17 Sep 2022 09:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2B7260AD6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D798E1BF82D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3FCF60AD6
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3FCF60AD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yxeQMrYcGJD4 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 09:08:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDC7E60A77
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 09:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDC7E60A77
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BB770840E6; Sat, 17 Sep 2022 09:08:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 11:07:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8ff431322f4614ebddeb8b15dd57d530510f268
X-Git-Newrev: 000546fd7cdcb2cc2be2d574e5c2d51caddaf834
X-Patchwork-Hint: ignore
Message-Id: <20220917090822.BB770840E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gensio: fix musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=000546fd7cdcb2cc2be2d574e5c2d51caddaf834
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following musl build failure raised since bump to version 2.5.2
in commit 5bb747f0b783a0d3f1712350ca3277263045b299:

gensiotool.c:47:10: fatal error: sys/unistd.h: No such file or directory
   47 | #include <sys/unistd.h>
      |          ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/99a60831da94f94fdf798c1c30cc09f0e51416c7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-tools-gensiot-Fix-build-with-musl.patch   | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch b/package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch
new file mode 100644
index 0000000000..7cda950c9e
--- /dev/null
+++ b/package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch
@@ -0,0 +1,29 @@
+From 64f8f754447572a6b7bed4038a9a29a12b448479 Mon Sep 17 00:00:00 2001
+From: Jan Luebbe <jlu@pengutronix.de>
+Date: Thu, 25 Aug 2022 12:19:16 +0200
+Subject: [PATCH] tools:gensiot: Fix build with musl
+
+According to POSIX getpid() is available in unistd.h, not sys/unistd.h.
+
+Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
+
+[Retrieved from:
+https://github.com/cminyard/gensio/commit/64f8f754447572a6b7bed4038a9a29a12b448479]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tools/gensiotool.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/gensiotool.c b/tools/gensiotool.c
+index cac531bb..ab0bb958 100644
+--- a/tools/gensiotool.c
++++ b/tools/gensiotool.c
+@@ -44,7 +44,7 @@
+ #include <signal.h>
+ #include <errno.h>
+ #include <sys/types.h>
+-#include <sys/unistd.h>
++#include <unistd.h>
+ #include <syslog.h>
+ #endif
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
