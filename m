Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F927C636D3
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 21:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3786E60BFD;
	Mon,  6 Feb 2023 21:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3786E60BFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dMGX9UzRsSw0; Mon,  6 Feb 2023 21:08:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AEA660BFE;
	Mon,  6 Feb 2023 21:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AEA660BFE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 830B41BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CBB360BFE
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CBB360BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k6mxYa-UYoPi for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 21:08:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83A1C60BFD
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 21:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83A1C60BFD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71BC983CFF; Mon,  6 Feb 2023 21:08:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 18:54:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d631615eb1b833977003039626a0194589334f45
X-Git-Newrev: dd28acc1e8085c15d12e233090550580dafe1f96
X-Patchwork-Hint: ignore
Message-Id: <20230206210854.71BC983CFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: add target to update
 .checkpackageignore
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd28acc1e8085c15d12e233090550580dafe1f96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a developer fixes an ignored warning from check-package, he/she
needs to update .checkpackageignore
By running './utils/docker-run make check-package' the developer
receives a warning about this.
Make that change easier to make, by adding a helper target on Makefile.

Add an option --failed-only to check-package that generates output in
the format:
<filename> <check_function> [<check_function> ...]
This is the very same format used by check-package ignore file.

Add the phony target .checkpackageignore

So one can update the ignore file using:
$ ./utils/docker-run make .checkpackageignore

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile            |  5 +++++
 utils/check-package | 13 ++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f39af5eae9..817cfed13c 100644
--- a/Makefile
+++ b/Makefile
@@ -1261,6 +1261,11 @@ check-package:
 		-a -not -name '*.orig' -a -not -name '*.rej' \
 		-exec ./utils/check-package --exclude=Sob {} +
 
+.PHONY: .checkpackageignore
+.checkpackageignore:
+	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
+		-exec ./utils/check-package --exclude=Sob --failed-only {} > .checkpackageignore +
+
 include docs/manual/manual.mk
 -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(sort $(wildcard $(dir)/docs/*/*.mk)))
 
diff --git a/utils/check-package b/utils/check-package
index f08e76b374..848311bac8 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -63,11 +63,17 @@ def parse_args():
                         help="do not run the specified functions (debug)")
     parser.add_argument("--dry-run", action="store_true", help="print the "
                         "functions that would be called for each file (debug)")
+    parser.add_argument("--failed-only", action="store_true", help="print only"
+                        " the name of the functions that failed (debug)")
 
     flags = parser.parse_args()
 
     flags.ignore_list = get_ignored_parsers_per_file(flags.intree_only, flags.ignore_filename)
 
+    if flags.failed_only:
+        flags.dry_run = False
+        flags.verbose = -1
+
     return flags
 
 
@@ -221,6 +227,11 @@ def check_file_using_lib(fname):
                   .format(fname, should_fail, flags.ignore_filename))
             nwarnings += 1
 
+    if flags.failed_only:
+        if len(failed) > 0:
+            f = " ".join(sorted(failed))
+            print("{} {}".format(fname, f))
+
     return nwarnings, nlines
 
 
@@ -259,7 +270,7 @@ def __main__():
         print("{} lines processed".format(total_lines), file=sys.stderr)
         print("{} warnings generated".format(total_warnings), file=sys.stderr)
 
-    if total_warnings > 0:
+    if total_warnings > 0 and not flags.failed_only:
         sys.exit(1)
 
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
