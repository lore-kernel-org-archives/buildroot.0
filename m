Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084DEC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 12:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF8F660FD3;
	Mon,  4 Apr 2022 12:42:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id noD83eUShSjt; Mon,  4 Apr 2022 12:42:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E19E360FC7;
	Mon,  4 Apr 2022 12:42:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7751BF3D1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56FDE60FBA
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:41:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IJtlCzA92lx2 for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 12:41:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBFF760B73
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 12:41:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BACB0861AF; Mon,  4 Apr 2022 12:32:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 14:38:39 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6a826c6d2370da1ce45d0d72f0351c7e73e63110
X-Git-Newrev: 8f53218b70d87ca76a4f5c1beb3f8c412469f66d
X-Patchwork-Hint: ignore
Message-Id: <20220404123210.BACB0861AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 support/scripts/pkg-stats: allow disabling CPE matching
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f53218b70d87ca76a4f5c1beb3f8c412469f66d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This is useful when debugging/developing the pkg-stats script.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cd8a576c6d3fa65001a5d72ef9c0fae55a297c6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
