Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AE7C74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 08:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B9FF416D8;
	Fri, 17 Mar 2023 08:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B9FF416D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6sXYFH24qAFS; Fri, 17 Mar 2023 08:36:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62092416CE;
	Fri, 17 Mar 2023 08:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62092416CE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 022B41BF97F
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D00888213E
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D00888213E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lIO0YtE6vDrs for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 08:36:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 005FC82139
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 08:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 005FC82139
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE9E2874D1; Fri, 17 Mar 2023 08:36:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 09:27:11 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 5d4b9bcf08cea85460fdc839a9786e3693f1def7
X-Git-Newrev: 770c8f80adc3aa45c42a30c4bd3cdf79d05ec212
X-Patchwork-Hint: ignore
Message-Id: <20230317083632.DE9E2874D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/s6-linux-utils:
 fix build with glibc < 2.25
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

commit: https://git.buildroot.net/buildroot/commit/?id=770c8f80adc3aa45c42a30c4bd3cdf79d05ec212
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fix the following build failure with glibc < 2.25 raised since bump to
version 2.6.0.0 in commit 5aac1d0105a73133fd886acc6c5195ca28f7e17f and
https://github.com/skarnet/s6-linux-utils/commit/ad5973028c42d947440cdae5e4f106152c3dda28:

src/minutils/rngseed.c:15:24: fatal error: sys/random.h: No such file or directory
 #include <sys/random.h>
                        ^

Fixes:
 - http://autobuild.buildroot.org/results/214bcecfc389cb412b68627c831300478d614a3a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 863811974e04b3332c4959c07a20e3e97050835c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...inux-utils-rngseed.c-fix-build-with-glibc.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/s6-linux-utils/0001-src-s6-linux-utils-rngseed.c-fix-build-with-glibc.patch b/package/s6-linux-utils/0001-src-s6-linux-utils-rngseed.c-fix-build-with-glibc.patch
new file mode 100644
index 0000000000..2df8a99700
--- /dev/null
+++ b/package/s6-linux-utils/0001-src-s6-linux-utils-rngseed.c-fix-build-with-glibc.patch
@@ -0,0 +1,39 @@
+From 3ab8bdc1c657f91a2a96f4e6db308d17098de0c4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 23 Feb 2023 12:09:11 +0100
+Subject: [PATCH] src/s6-linux-utils/rngseed.c: fix build with glibc <
+
+getrandom and sys/random.h are only available since glibc 2.25 resulting
+in the following build failure since version 2.6.0.0 and
+https://github.com/skarnet/s6-linux-utils/commit/ad5973028c42d947440cdae5e4f106152c3dda28:
+
+src/minutils/rngseed.c:15:24: fatal error: sys/random.h: No such file or directory
+ #include <sys/random.h>
+                        ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/214bcecfc389cb412b68627c831300478d614a3a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/skarnet/s6-linux-utils/pull/2]
+---
+ src/s6-linux-utils/rngseed.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/minutils/rngseed.c b/src/minutils/rngseed.c
+index 2b1772c..223f50a 100644
+--- a/src/minutils/rngseed.c
++++ b/src/minutils/rngseed.c
+@@ -12,7 +12,9 @@
+ #include <unistd.h>
+ #include <sys/stat.h>
+ #include <sys/ioctl.h>
++#ifdef SKALIBS_HASGETRANDOM
+ #include <sys/random.h>
++#endif
+ #include <linux/random.h>
+ 
+ #include <skalibs/types.h>
+-- 
+2.39.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
