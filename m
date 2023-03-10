Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBF9C6FD19
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 20:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0AC341061;
	Fri, 10 Mar 2023 20:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0AC341061
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rlUbBtn3bXnJ; Fri, 10 Mar 2023 20:25:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6541C41C55;
	Fri, 10 Mar 2023 20:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6541C41C55
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFDD41BF390
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 20:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9AC341BFF
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 20:24:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9AC341BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CBUqHQTOuhT8 for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 20:24:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB0A441061
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 20:24:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB0A441061
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96C3586E07; Fri, 10 Mar 2023 20:24:58 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 10 Mar 2023 21:24:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dfc3b05c05c8fa1a86affdd0a42fa4f6a0bf0171
X-Git-Newrev: 863811974e04b3332c4959c07a20e3e97050835c
X-Patchwork-Hint: ignore
Message-Id: <20230310202458.96C3586E07@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/s6-linux-utils: fix build with
 glibc < 2.25
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

commit: https://git.buildroot.net/buildroot/commit/?id=863811974e04b3332c4959c07a20e3e97050835c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
