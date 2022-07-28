Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB5BC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 20:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E73082F20;
	Thu, 28 Jul 2022 20:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E73082F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZZVc4sZUhPXX; Thu, 28 Jul 2022 20:51:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7027D828DE;
	Thu, 28 Jul 2022 20:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7027D828DE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FDBC1C1190
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18180828DE
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18180828DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tzMFYngl47TH for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:51:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1509E825BF
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1509E825BF
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E76D88661A; Thu, 28 Jul 2022 20:37:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 22:50:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ceb261cb4281e0d76f76724a30bf7e61ef59bef1
X-Git-Newrev: f897a557a615241db83464abac9714b752b79a0c
X-Patchwork-Hint: ignore
Message-Id: <20220728203734.E76D88661A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/earlyoom: fix build with kernel <
 4.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=f897a557a615241db83464abac9714b752b79a0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PR_CAP_AMBIENT is only available since kernel 4.3 and
https://github.com/torvalds/linux/commit/58319057b7847667f0c9585b9de0e8932b0fdb08
resulting in the following build failure since bump to version 1.7 in
commit 07b7f88668b1e51e3d17e14bd8795ef042df144e and
https://github.com/rfjakob/earlyoom/commit/9edc5cfc9ad794ed59baec5e6ee8d1060456a315:

main.c: In function 'main':
main.c:119:11: error: 'PR_CAP_AMBIENT' undeclared (first use in this function)
     prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_CLEAR_ALL, 0, 0, 0);
           ^

Fixes:
 - http://autobuild.buildroot.org/results/5a0ad7e1f6de3c37e40c37d8f583fc699a457753

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-main.c-fix-build-with-kernel-4.3.patch    | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/earlyoom/0001-main.c-fix-build-with-kernel-4.3.patch b/package/earlyoom/0001-main.c-fix-build-with-kernel-4.3.patch
new file mode 100644
index 0000000000..8233800cd6
--- /dev/null
+++ b/package/earlyoom/0001-main.c-fix-build-with-kernel-4.3.patch
@@ -0,0 +1,45 @@
+From 499e81bfcdd9379bf4619a7c3ad85ed7f2b1dca5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 28 Jul 2022 10:05:18 +0200
+Subject: [PATCH] main.c: fix build with kernel < 4.3
+
+PR_CAP_AMBIENT is only available since kernel 4.3 and
+https://github.com/torvalds/linux/commit/58319057b7847667f0c9585b9de0e8932b0fdb08
+resulting in the following build failure since version 1.7 and
+https://github.com/rfjakob/earlyoom/commit/9edc5cfc9ad794ed59baec5e6ee8d1060456a315:
+
+main.c: In function 'main':
+main.c:119:11: error: 'PR_CAP_AMBIENT' undeclared (first use in this function)
+     prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_CLEAR_ALL, 0, 0, 0);
+           ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5a0ad7e1f6de3c37e40c37d8f583fc699a457753
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/rfjakob/earlyoom/pull/276]
+---
+ main.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/main.c b/main.c
+index c068c7c..99ca9e2 100644
+--- a/main.c
++++ b/main.c
+@@ -115,11 +115,13 @@ int main(int argc, char* argv[])
+         fatal(4, "Could not cd to /proc: %s", strerror(errno));
+     }
+ 
++#ifdef PR_CAP_AMBIENT
+     // When systemd starts a daemon with capabilities, it uses ambient
+     // capabilities to do so. If not dropped, the capabilities can spread
+     // to any child process. This is usually not necessary and its a good
+     // idea to drop them if not needed.
+     prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_CLEAR_ALL, 0, 0, 0);
++#endif
+ 
+     meminfo_t m = parse_meminfo();
+ 
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
