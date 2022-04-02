Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BD5C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 14:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A243418AE;
	Sat,  2 Apr 2022 14:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdnjQwy3st4h; Sat,  2 Apr 2022 14:42:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B682418A9;
	Sat,  2 Apr 2022 14:42:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D4181BF867
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 14:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27B10418A9
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 14:42:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rcovWYCE5zQU for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 14:42:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DAA94189B
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 14:42:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6B53685CC6; Sat,  2 Apr 2022 14:32:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 2 Apr 2022 16:34:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2120113026cde26f5c9979e9e4aaf82a654d7aca
X-Git-Newrev: cd8a576c6d3fa65001a5d72ef9c0fae55a297c6c
X-Patchwork-Hint: ignore
Message-Id: <20220402143246.6B53685CC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: allow disabling
 CPE matching
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd8a576c6d3fa65001a5d72ef9c0fae55a297c6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is useful when debugging/developing the pkg-stats script.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/pkg-stats | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 8cc64a54d1..ef9482ed95 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1125,7 +1125,7 @@ def parse_args():
     parser.add_argument('--nvd-path', dest='nvd_path',
                         help='Path to the local NVD database', type=resolvepath)
     parser.add_argument('--disable', type=list_str,
-                        help='Features to disable, comma-separated (cve, upstream, url)',
+                        help='Features to disable, comma-separated (cve, upstream, url, cpe)',
                         default=[])
     args = parser.parse_args()
     if not args.html and not args.json:
@@ -1184,6 +1184,8 @@ def __main__():
     if "cve" not in args.disable and args.nvd_path:
         print("Checking packages CVEs")
         check_package_cves(args.nvd_path, packages)
+    if "cpe" not in args.disable and args.nvd_path:
+        print("Checking packages CPEs")
         check_package_cpes(args.nvd_path, packages)
     print("Calculate stats")
     stats = calculate_stats(packages)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
