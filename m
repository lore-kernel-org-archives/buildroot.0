Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEDFC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8A3C70B83;
	Fri, 28 Feb 2025 17:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZQuSWQOdAkD; Fri, 28 Feb 2025 17:13:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6B3570B84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6B3570B84;
	Fri, 28 Feb 2025 17:13:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A34768
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E19042E17
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id goStiNqX0oGv for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B98342EA9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B98342EA9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 971CE85FAE; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 18:44:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2852a26899e8fbd5da3ea1a1e7fc5bf46b68db99
X-Git-Newrev: 80d26f091fdf2ab6bda956d91dc93a6c63d83797
X-Patchwork-Hint: ignore
Message-Id: <20250228163032.971CE85FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/check-package: support
 finding files from patches
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=80d26f091fdf2ab6bda956d91dc93a6c63d83797
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For the `b4` tool to support check-package, check-package must support
reading patch files from stdin.

It would be complicated to make check-package actually run checks on
patch files. So instead we search the patch files to figure out what
files are modified in the repo, then run check-package on the modified
files directly.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
[Arnout: rename variable "files" to "files_to_check"]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/check-package | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index 6a5e89daa3..a5ecc2eed8 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -10,6 +10,7 @@
 
 import argparse
 import inspect
+import fileinput
 import magic
 import os
 import re
@@ -91,6 +92,9 @@ def parse_args():
                         "functions that would be called for each file (debug)")
     parser.add_argument("--failed-only", action="store_true", help="print only"
                         " the name of the functions that failed (debug)")
+    parser.add_argument("--patch", "-p", action="store_true",
+                        help="The 'files' are patch files to be sent to the"
+                        " Buildroot mailing list")
 
     parser.add_argument("--test-suite", action="store_true", help="Run the"
                         " test-suite")
@@ -294,6 +298,30 @@ def check_file_using_lib(fname):
     return nwarnings, nlines
 
 
+def patch_modified_files(patches):
+    """
+    Find files modified in a patch file
+
+    :param patches: Patch files to read, as a list of paths or '-' for stdin
+    :returns: List of modified filenames
+    """
+
+    files = []
+    with fileinput.input(files=patches) as fp:
+        # Search for unified-diff to-file lines
+        for line in fp:
+            if line.startswith('+++'):
+                line = line.removeprefix('+++').strip()
+
+                # Remove the prefix git adds to filenames
+                if line.startswith('b/'):
+                    line = line.removeprefix('b/')
+
+                files.append(line)
+    files.sort()
+    return files
+
+
 def __main__():
     global flags
     flags = parse_args()
@@ -301,14 +329,17 @@ def __main__():
     if flags.test_suite:
         return checkpackagelib.base.run_test_suite()
 
+    if flags.patch:
+        files_to_check = patch_modified_files(flags.files)
+    else:
+        files_to_check = flags.files
+
     if flags.intree_only:
         # change all paths received to be relative to the base dir
         base_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
-        files_to_check = [os.path.relpath(os.path.abspath(f), base_dir) for f in flags.files]
+        files_to_check = [os.path.relpath(os.path.abspath(f), base_dir) for f in files_to_check]
         # move current dir so the script find the files
         os.chdir(base_dir)
-    else:
-        files_to_check = flags.files
 
     if len(files_to_check) == 0:
         print("No files to check style")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
