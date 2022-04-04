Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA15C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 12:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C9BE60FA5;
	Mon,  4 Apr 2022 12:41:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4_x_25JFvStj; Mon,  4 Apr 2022 12:41:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DB5960FDE;
	Mon,  4 Apr 2022 12:41:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4B951BF9AD
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93F0482948
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:40:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6lZAkMte5Ms1 for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 12:40:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E605782909
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 12:40:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E34CC8619D; Mon,  4 Apr 2022 12:31:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 14:39:23 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: da78e1e1e6b42772e4a5e9e09db2c15110e64400
X-Git-Newrev: 05e714b0e496c5e2519def8fd239e970bd0479dd
X-Patchwork-Hint: ignore
Message-Id: <20220404123124.E34CC8619D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=05e714b0e496c5e2519def8fd239e970bd0479dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This is useful when debugging/developing the pkg-stats script.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cd8a576c6d3fa65001a5d72ef9c0fae55a297c6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 2a3d8a78a8..d9ecb45c3f 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1087,7 +1087,7 @@ def parse_args():
     parser.add_argument('--nvd-path', dest='nvd_path',
                         help='Path to the local NVD database', type=resolvepath)
     parser.add_argument('--disable', type=list_str,
-                        help='Features to disable, comma-separated (cve, upstream, url)',
+                        help='Features to disable, comma-separated (cve, upstream, url, cpe)',
                         default=[])
     args = parser.parse_args()
     if not args.html and not args.json:
@@ -1146,6 +1146,8 @@ def __main__():
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
