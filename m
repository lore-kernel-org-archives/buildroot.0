Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931E3C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A67C40872;
	Sun,  9 Jan 2022 20:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AuNctiCkymyI; Sun,  9 Jan 2022 20:02:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E159401E9;
	Sun,  9 Jan 2022 20:02:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E4211BF20D
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C7B060B97
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lzma3Uh2Yrso for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:02:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8332360B59
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:02:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5354B82DD8; Sun,  9 Jan 2022 19:56:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 21:00:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efa07944c59acd312d392d4e39f8470b38735282
X-Git-Newrev: 02e679d8bf8acae9e110820858d1f242ff971af8
X-Patchwork-Hint: ignore
Message-Id: <20220109195612.5354B82DD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix flake8
 errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=02e679d8bf8acae9e110820858d1f242ff971af8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

support/scripts/pkg-stats:1171:8: E713 test for membership should be 'not in'
support/scripts/pkg-stats:1175:8: E713 test for membership should be 'not in'
support/scripts/pkg-stats:1179:8: E713 test for membership should be 'not in'
3     E713 test for membership should be 'not in'

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1955772278

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/pkg-stats | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 7e20ccc0da..abd36a3dd5 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1168,15 +1168,15 @@ def __main__():
         pkg.set_url()
         pkg.set_ignored_cves()
         pkg.set_developers(developers)
-    if not "url" in args.disable:
+    if "url" not in args.disable:
         print("Checking URL status")
         loop = asyncio.get_event_loop()
         loop.run_until_complete(check_package_urls(packages))
-    if not "upstream" in args.disable:
+    if "upstream" not in args.disable:
         print("Getting latest versions ...")
         loop = asyncio.get_event_loop()
         loop.run_until_complete(check_package_latest_version(packages))
-    if not "cve" in args.disable and args.nvd_path:
+    if "cve" not in args.disable and args.nvd_path:
         print("Checking packages CVEs")
         check_package_cves(args.nvd_path, packages)
         check_package_cpes(args.nvd_path, packages)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
