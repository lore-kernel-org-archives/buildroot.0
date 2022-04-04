Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA2BC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 12:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DEE84019D;
	Mon,  4 Apr 2022 12:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TFTwDx9yOHFc; Mon,  4 Apr 2022 12:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2439410A2;
	Mon,  4 Apr 2022 12:42:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8517B1BF3D1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E3E3401F2
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lCutPh7VaHtG for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 12:41:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C367D40320
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 12:41:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C258C861B4; Mon,  4 Apr 2022 12:32:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 14:38:44 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8f53218b70d87ca76a4f5c1beb3f8c412469f66d
X-Git-Newrev: 1fe0e5d21d6b3f98aaecf0211c08e4457ed3ccdd
X-Patchwork-Hint: ignore
Message-Id: <20220404123210.C258C861B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 support/scripts/pkg-stats: allow disabling package warnings retrieval
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

commit: https://git.buildroot.net/buildroot/commit/?id=1fe0e5d21d6b3f98aaecf0211c08e4457ed3ccdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This is useful when debugging/developing the pkg-stats script.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1adcf5659804c17859b2799c0c3edb6b6ce68eb5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index ef9482ed95..329b30a5ee 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1125,7 +1125,7 @@ def parse_args():
     parser.add_argument('--nvd-path', dest='nvd_path',
                         help='Path to the local NVD database', type=resolvepath)
     parser.add_argument('--disable', type=list_str,
-                        help='Features to disable, comma-separated (cve, upstream, url, cpe)',
+                        help='Features to disable, comma-separated (cve, upstream, url, cpe, warning)',
                         default=[])
     args = parser.parse_args()
     if not args.html and not args.json:
@@ -1167,7 +1167,8 @@ def __main__():
         pkg.set_license()
         pkg.set_hash_info()
         pkg.set_patch_count()
-        pkg.set_check_package_warnings()
+        if "warnings" not in args.disable:
+            pkg.set_check_package_warnings()
         pkg.set_current_version()
         pkg.set_cpeid()
         pkg.set_url()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
