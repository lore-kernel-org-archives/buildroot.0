Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC62C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 22:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DB5660B71;
	Wed,  8 Nov 2023 22:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DB5660B71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qXHFcgv3kP3G; Wed,  8 Nov 2023 22:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3B2A60B5D;
	Wed,  8 Nov 2023 22:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3B2A60B5D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 706F01BF40B
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 22:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4970C60B5D
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 22:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4970C60B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8hTM_wORZauc for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 22:05:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7654360B55
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 22:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7654360B55
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 637BB86D76; Wed,  8 Nov 2023 22:05:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 23:05:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3c5320ce28b059ff7913a6468b2133b6cf8f16e
X-Git-Newrev: 4d208906c7a0bc2d621794f4a8bac452acc31d9d
X-Patchwork-Hint: ignore
Message-Id: <20231108220552.637BB86D76@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atop: fix musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d208906c7a0bc2d621794f4a8bac452acc31d9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with musl raised since bump to version
2.9.0 in commit 8c70374c4f0f9f77875eac26a5e51ab662575c1c:

atop.h:157:1: error: unknown type name 'time_t'
  157 | time_t          normalize_epoch(time_t, long);
      | ^~~~~~
atop.h:157:1: note: 'time_t' is defined in header '<time.h>'; did you forget to '#include <time.h>'?
atop.h:157:40: error: expected ')' before 'long'
  157 | time_t          normalize_epoch(time_t, long);
      |                                        ^~~~~
      |                                        )

Fixes:
 - http://autobuild.buildroot.org/results/e7ec8d16f2299320f374a0198c8e9b18a102b037

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/atop/0001-atop.h-include-time.h.patch | 41 +++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/atop/0001-atop.h-include-time.h.patch b/package/atop/0001-atop.h-include-time.h.patch
new file mode 100644
index 0000000000..2b8a390e71
--- /dev/null
+++ b/package/atop/0001-atop.h-include-time.h.patch
@@ -0,0 +1,41 @@
+From 03c5c4dd29bc7590baccb55a36d61e7f4b39c1fe Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 29 Oct 2023 18:56:35 +0100
+Subject: [PATCH] atop.h: include time.h
+
+Include time.h to avoid the following build failure with musl:
+
+atop.h:157:1: error: unknown type name 'time_t'
+  157 | time_t          normalize_epoch(time_t, long);
+      | ^~~~~~
+atop.h:157:1: note: 'time_t' is defined in header '<time.h>'; did you forget to '#include <time.h>'?
+atop.h:157:40: error: expected ')' before 'long'
+  157 | time_t          normalize_epoch(time_t, long);
+      |                                        ^~~~~
+      |                                        )
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e7ec8d16f2299320f374a0198c8e9b18a102b037
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/Atoptool/atop/pull/280
+---
+ atop.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/atop.h b/atop.h
+index 9274fc5..3d5fea4 100644
+--- a/atop.h
++++ b/atop.h
+@@ -24,6 +24,8 @@
+ #ifndef __ATOP__
+ #define __ATOP__
+ 
++#include <time.h>
++
+ #define	EQ		0
+ #define SECONDSINDAY	86400
+ #define RAWNAMESZ	256
+-- 
+2.42.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
