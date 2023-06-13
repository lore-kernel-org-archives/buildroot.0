Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2575C88CB4
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 12:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 932ED4170D;
	Tue, 13 Jun 2023 12:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 932ED4170D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6fFzmRPsIT5h; Tue, 13 Jun 2023 12:42:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5CAA41705;
	Tue, 13 Jun 2023 12:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5CAA41705
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 381931BF352
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 12:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 127BD81F86
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 12:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 127BD81F86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xrmCDeBSop6B for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 12:42:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD79581E4F
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 12:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD79581E4F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBE73828C7; Tue, 13 Jun 2023 12:42:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 14:35:52 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 54b9f2e4a39a8dc89a1a9390a86aa3f8f864a057
X-Git-Newrev: a23eee38f7139559dbf24f6826670b23e3e2e497
X-Patchwork-Hint: ignore
Message-Id: <20230613124201.CBE73828C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] utils/check-package:
 check ignored files exist
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

commit: https://git.buildroot.net/buildroot/commit/?id=a23eee38f7139559dbf24f6826670b23e3e2e497
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

When an ignored file is removed (e.g. a package patch is no longer
needed after a version bump), the corresponding entry in the ignore list
is no longer needed.

However, we currently only validate that an ignored *test* still fails,
not that a ignore files is now missing.

Add a new test to check-package that does that check, and add a
test-case for that check.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
(cherry picked from commit 5eac4f81eb1cfaf6bd8d07a5d78a48de28ae8e4c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/check-package                      |  4 ++++
 utils/checkpackagelib/lib_ignore.py      | 14 ++++++++++++++
 utils/checkpackagelib/test_lib_ignore.py | 18 ++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/utils/check-package b/utils/check-package
index 5974781104..00121b3296 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -11,6 +11,7 @@ import sys
 import checkpackagelib.base
 import checkpackagelib.lib_config
 import checkpackagelib.lib_hash
+import checkpackagelib.lib_ignore
 import checkpackagelib.lib_mk
 import checkpackagelib.lib_patch
 import checkpackagelib.lib_shellscript
@@ -104,6 +105,7 @@ def get_lib_from_filetype(fname):
 
 CONFIG_IN_FILENAME = re.compile(r"Config\.\S*$")
 DO_CHECK_INTREE = re.compile(r"|".join([
+    r".checkpackageignore",
     r"Config.in",
     r"arch/",
     r"boot/",
@@ -136,6 +138,8 @@ def get_lib_from_filename(fname):
         if os.path.basename(fname) == "external.mk" and \
            os.path.exists(fname[:-2] + "desc"):
             return None
+    if fname == ".checkpackageignore":
+        return checkpackagelib.lib_ignore
     if CONFIG_IN_FILENAME.search(fname):
         return checkpackagelib.lib_config
     if fname.endswith(".hash"):
diff --git a/utils/checkpackagelib/lib_ignore.py b/utils/checkpackagelib/lib_ignore.py
new file mode 100644
index 0000000000..f3698fc3b4
--- /dev/null
+++ b/utils/checkpackagelib/lib_ignore.py
@@ -0,0 +1,14 @@
+# See utils/checkpackagelib/readme.txt before editing this file.
+
+import os
+
+from checkpackagelib.base import _CheckFunction
+
+
+class IgnoreMissingFile(_CheckFunction):
+    def check_line(self, lineno, text):
+        fields = text.split()
+        if not os.path.exists(fields[0]):
+            return ["{}:{}: ignored file {} is missing"
+                    .format(self.filename, lineno, fields[0]),
+                    text]
diff --git a/utils/checkpackagelib/test_lib_ignore.py b/utils/checkpackagelib/test_lib_ignore.py
new file mode 100644
index 0000000000..6cd856d669
--- /dev/null
+++ b/utils/checkpackagelib/test_lib_ignore.py
@@ -0,0 +1,18 @@
+import pytest
+import checkpackagelib.test_util as util
+import checkpackagelib.lib_ignore as m
+
+
+IgnoreMissingFile = [
+    ('missing ignored file',
+     '.checkpackageignore',
+     'this-file-does-not-exist SomeTest',
+     [['.checkpackageignore:1: ignored file this-file-does-not-exist is missing',
+       'this-file-does-not-exist SomeTest']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', IgnoreMissingFile)
+def test_IgnoreMissingFile(testname, filename, string, expected):
+    warnings = util.check_file(m.IgnoreMissingFile, filename, string)
+    assert warnings == expected
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
