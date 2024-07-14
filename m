Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D58CC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 09:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE33881407;
	Sun, 14 Jul 2024 09:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2VWRYXij7gyN; Sun, 14 Jul 2024 09:08:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D82CA813B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D82CA813B0;
	Sun, 14 Jul 2024 09:08:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 855951BF23C
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8FA881374
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7bv15_iLePh4 for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4E1E81375
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4E1E81375
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F08786735; Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 10:09:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a79adca86fc1ecad30cd9dcf1b513fb30a8eaeac
X-Git-Newrev: fc2dedcfc649014702577ab89f550a37766bacf2
X-Patchwork-Hint: ignore
Message-Id: <20240714090820.9F08786735@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: add option to run the
 test-suite
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fc2dedcfc649014702577ab89f550a37766bacf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, how to run the check-package test-suite is thoroughly under-
documented. There is one hint in the commit log for commit fc254881e6df
(utils/checkpackagelib: add unit tests), and another in commit
242e9d72e7d2 (utils/docker-run: new script); the former is hard to find,
and the latter is about an unrelated script, so harder yet to find...

Add a new option to check-package, that will make it run its test-suite.
Since pytest is only needed for the test-suite, only import it in that
case.

pytest will be default create a cache of the tests (not sure what it is
about, though), so instruct it not to (esp. since the tree can be
read-only).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
[Arnout: move the code into checkpackagelib.base]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/check-package              | 6 ++++++
 utils/checkpackagelib/base.py    | 9 +++++++++
 utils/checkpackagelib/readme.txt | 1 +
 3 files changed, 16 insertions(+)

diff --git a/utils/check-package b/utils/check-package
index 3741a2ccdc..872e66c126 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -85,6 +85,9 @@ def parse_args():
     parser.add_argument("--failed-only", action="store_true", help="print only"
                         " the name of the functions that failed (debug)")
 
+    parser.add_argument("--test-suite", action="store_true", help="Run the"
+                        " test-suite")
+
     flags = parser.parse_args()
 
     flags.ignore_list = get_ignored_parsers_per_file(flags.intree_only, flags.ignore_filename)
@@ -288,6 +291,9 @@ def __main__():
     global flags
     flags = parse_args()
 
+    if flags.test_suite:
+        return checkpackagelib.base.run_test_suite()
+
     if flags.intree_only:
         # change all paths received to be relative to the base dir
         base_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
diff --git a/utils/checkpackagelib/base.py b/utils/checkpackagelib/base.py
index f666e4110b..0ab6eba9f6 100644
--- a/utils/checkpackagelib/base.py
+++ b/utils/checkpackagelib/base.py
@@ -1,5 +1,6 @@
 # See utils/checkpackagelib/readme.txt before editing this file.
 import re
+import os
 
 
 class _CheckFunction(object):
@@ -27,3 +28,11 @@ class _Tool(object):
 
     def hint(self):
         return ""
+
+
+def run_test_suite():
+    import pytest
+    return pytest.main(
+        # Disable writing/loading a cache with: -p no:cacheprovider
+        ["-v", "-p", "no:cacheprovider", os.path.dirname(__file__)]
+    )
diff --git a/utils/checkpackagelib/readme.txt b/utils/checkpackagelib/readme.txt
index 3bfe289607..b3e8c67100 100644
--- a/utils/checkpackagelib/readme.txt
+++ b/utils/checkpackagelib/readme.txt
@@ -23,6 +23,7 @@ How the scripts are structured:
 - lib_type.py contains check functions specific to files of this type.
 
 Some hints when changing this code:
+- test your changes: utils/check-package --test-suite
 - prefer O(n) algorithms, where n is the total number of lines in the files
   processed.
 - when there is no other reason for ordering, use alphabetical order (e.g. keep
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
