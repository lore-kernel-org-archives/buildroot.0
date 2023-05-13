Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913A9C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 10:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36C914191F;
	Sat, 13 May 2023 10:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36C914191F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 167UpMHZhndS; Sat, 13 May 2023 10:10:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07AAD41854;
	Sat, 13 May 2023 10:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07AAD41854
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 44B471BF424
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EF35842F8
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EF35842F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ytnbSJtQuL4y for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 10:10:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3981E842F6
 for <buildroot@buildroot.org>; Sat, 13 May 2023 10:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3981E842F6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 200A38648C; Sat, 13 May 2023 10:10:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 12:08:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ae089e2e93e26cc59b6aaee1760d43ee8e98889
X-Git-Newrev: 5eac4f81eb1cfaf6bd8d07a5d78a48de28ae8e4c
X-Patchwork-Hint: ignore
Message-Id: <20230513101005.200A38648C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: check ignored files
 exist
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

commit: https://git.buildroot.net/buildroot/commit/?id=5eac4f81eb1cfaf6bd8d07a5d78a48de28ae8e4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When an ignored file is removed (e.g. a package patch is no longer
needed after a version bump), the corresponding entry in the ignore list
is no longer needed.

However, we currently only validate that an ignored *test* still fails,
not that a ignore files is now missing.

Add a new test to check-package that does that check, and add a
test-case for that check.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 utils/check-package                      |  4 ++++
 utils/checkpackagelib/lib_ignore.py      | 14 ++++++++++++++
 utils/checkpackagelib/test_lib_ignore.py | 18 ++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/utils/check-package b/utils/check-package
index 83b9750f5a..3de3a72e0c 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -11,6 +11,7 @@ import sys
 import checkpackagelib.base
 import checkpackagelib.lib_config
 import checkpackagelib.lib_hash
+import checkpackagelib.lib_ignore
 import checkpackagelib.lib_mk
 import checkpackagelib.lib_patch
 import checkpackagelib.lib_python
@@ -107,6 +108,7 @@ def get_lib_from_filetype(fname):
 
 CONFIG_IN_FILENAME = re.compile(r"Config\.\S*$")
 DO_CHECK_INTREE = re.compile(r"|".join([
+    r".checkpackageignore",
     r"Config.in",
     r"arch/",
     r"board/",
@@ -146,6 +148,8 @@ def get_lib_from_filename(fname):
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
