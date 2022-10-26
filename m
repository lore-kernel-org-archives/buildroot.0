Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3C4C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 11:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E637F404C2;
	Wed, 26 Oct 2022 11:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E637F404C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cOqhRdHALYXU; Wed, 26 Oct 2022 11:58:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA2AA40482;
	Wed, 26 Oct 2022 11:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA2AA40482
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 922BF1BF59A
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 11:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BE4A80DCF
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 11:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BE4A80DCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZAiAmyk8aiv for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 11:58:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E27680C53
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 11:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E27680C53
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7AC268710A; Wed, 26 Oct 2022 11:58:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 13:57:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a7f501bf3e31ca47e57143770684ce234d705a7
X-Git-Newrev: d69752c7582a0b1dd14d05f46fa7a22b2bcfb530
X-Patchwork-Hint: ignore
Message-Id: <20221026115810.7AC268710A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/file: fix uclibc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=d69752c7582a0b1dd14d05f46fa7a22b2bcfb530
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following uclibc build failure raised since bump to version 5.43
in commit f17b56f1aa43361eff4a81538a61e34c509ebb70 and
https://github.com/file/file/commit/c80065fe6900be5e794941e29b32440e9969b1c3:

file.c: In function 'fname_print':
file.c:605:10: error: macro "putc" requires 2 arguments, but only 1 given
  605 |    putc(c);
      |          ^

Fixes:
 - http://autobuild.buildroot.org/results/7ff1dd9f79408d2e6286c005302b6f3c505ab259

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...src-file.c-fix-build-without-wide-support.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/file/0001-src-file.c-fix-build-without-wide-support.patch b/package/file/0001-src-file.c-fix-build-without-wide-support.patch
new file mode 100644
index 0000000000..29be9fa2cd
--- /dev/null
+++ b/package/file/0001-src-file.c-fix-build-without-wide-support.patch
@@ -0,0 +1,39 @@
+From f2ab09d0e1388657f6b7e62bacc383ebea91f5b9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 26 Oct 2022 00:23:32 +0200
+Subject: [PATCH] src/file.c: fix build without wide support
+
+Fix the following build failure without wide support (e.g. on uclibc)
+raised since version 5.43 and
+https://github.com/file/file/commit/c80065fe6900be5e794941e29b32440e9969b1c3:
+
+file.c: In function 'fname_print':
+file.c:605:10: error: macro "putc" requires 2 arguments, but only 1 given
+  605 |    putc(c);
+      |          ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7ff1dd9f79408d2e6286c005302b6f3c505ab259
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://bugs.astron.com/view.php?id=398]
+---
+ src/file.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/file.c b/src/file.c
+index f5f46524..1c23defc 100644
+--- a/src/file.c
++++ b/src/file.c
+@@ -615,7 +615,7 @@ fname_print(const char *inname)
+ 	for (i = 0; i < n; i++) {
+ 		unsigned char c = CAST(unsigned char, inname[i]);
+ 		if (isprint(c)) {
+-			putc(c);
++			putc(c, stdout);
+ 			continue;
+ 		}
+ 		file_octal(c);
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
