Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582B6EB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 13:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE96B41D73;
	Wed, 14 Jun 2023 13:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE96B41D73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7PlLEXepFTk5; Wed, 14 Jun 2023 13:34:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9A4941DE4;
	Wed, 14 Jun 2023 13:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9A4941DE4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC9B21BF2BA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F14341DC7
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F14341DC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 96iXAN5mEKB9 for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 13:34:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83C9841C3A
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 13:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83C9841C3A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70DED8368C; Wed, 14 Jun 2023 13:34:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 15:32:35 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: e9a74dd240741ae61a2c0ad6e6e71230caa53400
X-Git-Newrev: fcb704ecfc1d42a7382bd5cedb1a2b03e23569fe
X-Patchwork-Hint: ignore
Message-Id: <20230614133442.70DED8368C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/vdr: fix musl
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=fcb704ecfc1d42a7382bd5cedb1a2b03e23569fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes:
http://autobuild.buildroot.net/results/bdacedd845a2bf4db9826f0d3868f6b48d456d2a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 579f5a9782ee8694f4939c6a4f3efe51b476b487)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vdr/0005-Fix-musl-build.patch | 37 +++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/vdr/0005-Fix-musl-build.patch b/package/vdr/0005-Fix-musl-build.patch
new file mode 100644
index 0000000000..390e78eab5
--- /dev/null
+++ b/package/vdr/0005-Fix-musl-build.patch
@@ -0,0 +1,37 @@
+From 075472ec580e03cc89971f0c118cb363776a304d Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Tue, 16 May 2023 20:22:12 +0200
+Subject: [PATCH] Fix musl build
+
+malloc_trim is a GNU extension and therefore not present in non-glibc C
+libraries such as musl. Wrapping this in an ifdef fixes musl builds.
+
+Upstream: https://www.linuxtv.org/pipermail/vdr/2023-May/029742.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ vdr.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/vdr.c b/vdr.c
+index 0f426e61..bc4902de 100644
+--- a/vdr.c
++++ b/vdr.c
+@@ -1588,12 +1588,14 @@ int main(int argc, char *argv[])
+               cSchedules::Cleanup();
+               // Plugins housekeeping:
+               PluginManager.Housekeeping();
++#if defined(__GLIBC__)
+               // Memory cleanup:
+               static time_t LastMemoryCleanup = 0;
+               if ((Now - LastMemoryCleanup) > MEMCLEANUPDELTA) {
+                  malloc_trim(0);
+                  LastMemoryCleanup = Now;
+                  }
++#endif
+               }
+            }
+ 
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
