Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B346C433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 14:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 129C160F61;
	Sat,  2 Apr 2022 14:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BL3VSpyoMKvc; Sat,  2 Apr 2022 14:42:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E92C60E8B;
	Sat,  2 Apr 2022 14:42:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A4371BF968
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 14:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EFB9418AA
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 14:42:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hG78FJtI7RXS for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 14:42:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 352E8418A9
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 14:42:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 776A085AB3; Sat,  2 Apr 2022 14:32:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 2 Apr 2022 16:34:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd8a576c6d3fa65001a5d72ef9c0fae55a297c6c
X-Git-Newrev: 1adcf5659804c17859b2799c0c3edb6b6ce68eb5
X-Patchwork-Hint: ignore
Message-Id: <20220402143246.776A085AB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: allow disabling
 package warnings retrieval
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

commit: https://git.buildroot.net/buildroot/commit/?id=1adcf5659804c17859b2799c0c3edb6b6ce68eb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is useful when debugging/developing the pkg-stats script.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
