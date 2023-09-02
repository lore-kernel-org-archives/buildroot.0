Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8D1C83F2C
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 15:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EBD440471;
	Sat,  2 Sep 2023 15:48:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EBD440471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvBwLcTZJgvh; Sat,  2 Sep 2023 15:48:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCB5A40490;
	Sat,  2 Sep 2023 15:48:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCB5A40490
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18C691BF401
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4C0841621
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4C0841621
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C0M7PICz4gkm for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 15:48:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB07941608
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 15:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB07941608
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A612B868AE; Sat,  2 Sep 2023 15:48:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 17:47:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 464ff28b7a7afc73b51aa9324b24a5aca5bf2ade
X-Git-Newrev: 2be2ccb4873f3e63626c40519ed69ac2e5d456b3
X-Patchwork-Hint: ignore
Message-Id: <20230902154849.A612B868AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/check-package: cleanup
 line reading
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

commit: https://git.buildroot.net/buildroot/commit/?id=2be2ccb4873f3e63626c40519ed69ac2e5d456b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Cleanup the implementation for reading lines by having files processed
in context managers and utilizing the iterable file object for line
reading (instead of needing to call `readlines()`).

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/check-package | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index 3de3a72e0c..105902303e 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -233,16 +233,18 @@ def check_file_using_lib(fname):
         nwarnings += warn
 
     lastline = ""
-    for lineno, text in enumerate(open(fname, "r", errors="surrogateescape").readlines()):
-        nlines += 1
-        for name, cf in objects:
-            if cf.disable.search(lastline):
-                continue
-            warn, fail = print_warnings(cf.check_line(lineno + 1, text), name in xfail)
-            if fail > 0:
-                failed.add(name)
-            nwarnings += warn
-        lastline = text
+    with open(fname, "r", errors="surrogateescape") as f:
+        for lineno, text in enumerate(f):
+            nlines += 1
+            for name, cf in objects:
+                if cf.disable.search(lastline):
+                    continue
+                line_sts = cf.check_line(lineno + 1, text)
+                warn, fail = print_warnings(line_sts, name in xfail)
+                if fail > 0:
+                    failed.add(name)
+                nwarnings += warn
+            lastline = text
 
     for name, cf in objects:
         warn, fail = print_warnings(cf.after(), name in xfail)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
