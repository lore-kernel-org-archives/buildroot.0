Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33814C433FE
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 16:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6BE94023B;
	Thu, 27 Jan 2022 16:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tx22y_OHZAI0; Thu, 27 Jan 2022 16:55:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5264401D6;
	Thu, 27 Jan 2022 16:55:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9CBCB1C1135
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85FA7403D6
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:54:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqaiL599lXkb for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 16:54:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10D9440360
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 16:54:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D69D3829F9; Thu, 27 Jan 2022 16:47:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 17:48:19 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 67be1ff4f7c6db8091d1b09daa9e6765e6a6f329
X-Git-Newrev: 679d40823bb3fc88e7358e88199b7a7d1e8c7bd8
X-Patchwork-Hint: ignore
Message-Id: <20220127164720.D69D3829F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 support/scripts/pkg-stats: add --disable option
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

commit: https://git.buildroot.net/buildroot/commit/?id=679d40823bb3fc88e7358e88199b7a7d1e8c7bd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

When debugging pkg-stats, it's quite useful to be able to disable some
features that are quite long (checking upstream URL, checking latest
version, checking CVE). This commit adds a --disable option, which can
take a comma-separated list of features to disable, such as:

     ./support/scripts/pkg-stats --disable url,upstream

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b102352b62917b053cae1f5d0591fe6507d81522)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 0ac7466776..2ccb7a8362 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1061,6 +1061,10 @@ def resolvepath(path):
     return os.path.abspath(os.path.expanduser(path))
 
 
+def list_str(values):
+    return values.split(',')
+
+
 def parse_args():
     parser = argparse.ArgumentParser()
     output = parser.add_argument_group('output', 'Output file(s)')
@@ -1077,6 +1081,9 @@ def parse_args():
                           help='List of packages (comma separated)')
     parser.add_argument('--nvd-path', dest='nvd_path',
                         help='Path to the local NVD database', type=resolvepath)
+    parser.add_argument('--disable', type=list_str,
+                        help='Features to disable, comma-separated (cve, upstream, url)',
+                        default=[])
     args = parser.parse_args()
     if not args.html and not args.json:
         parser.error('at least one of --html or --json (or both) is required')
@@ -1123,13 +1130,15 @@ def __main__():
         pkg.set_url()
         pkg.set_ignored_cves()
         pkg.set_developers(developers)
-    print("Checking URL status")
-    loop = asyncio.get_event_loop()
-    loop.run_until_complete(check_package_urls(packages))
-    print("Getting latest versions ...")
-    loop = asyncio.get_event_loop()
-    loop.run_until_complete(check_package_latest_version(packages))
-    if args.nvd_path:
+    if not "url" in args.disable:
+        print("Checking URL status")
+        loop = asyncio.get_event_loop()
+        loop.run_until_complete(check_package_urls(packages))
+    if not "upstream" in args.disable:
+        print("Getting latest versions ...")
+        loop = asyncio.get_event_loop()
+        loop.run_until_complete(check_package_latest_version(packages))
+    if not "cve" in args.disable and args.nvd_path:
         print("Checking packages CVEs")
         check_package_cves(args.nvd_path, packages)
         check_package_cpes(args.nvd_path, packages)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
