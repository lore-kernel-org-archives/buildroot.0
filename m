Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7742BC77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 20:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFC2960A7F;
	Sun,  9 Apr 2023 20:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFC2960A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UbXBpK5VaQjp; Sun,  9 Apr 2023 20:59:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3E4D60BF0;
	Sun,  9 Apr 2023 20:59:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3E4D60BF0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87C1B1BF2A9
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 20:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F5FE81E82
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 20:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F5FE81E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zcNfG7qOt-70 for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 20:59:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21DD681E6F
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 20:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21DD681E6F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DE5483C0A; Sun,  9 Apr 2023 20:59:19 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Apr 2023 22:33:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60fdaf56fed83614ecdeab5e49de8087b78219cd
X-Git-Newrev: 9df6503ed047acb37dae66fab2a1208f2b5ecb5e
X-Patchwork-Hint: ignore
Message-Id: <20230409205919.0DE5483C0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: merge check-flake8 into
 check-package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9df6503ed047acb37dae66fab2a1208f2b5ecb5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Teach check-package to detect python files by type and check them using
flake8.
Do not use subprocess to call 'python3 -m flake8' in order to avoid too
many spawned shells, which in its turn would slow down the check for
multiple files. (make check-package takes twice the time using a shell
for each flake8 call, when compared of importing the main application)

Expand the runtime test and the unit tests for check-package.

Remove check-flake8 from the makefile and also from the GitLab CI
because the exact same checks become part of check-package.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[Arnout: add a comment to x-python to explain its purpose]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile                                           |  9 +------
 support/misc/gitlab-ci.yml.in                      |  4 ----
 support/scripts/generate-gitlab-ci-yml             |  2 +-
 .../tests/utils/br2-external/utils/x-python        |  3 +++
 support/testing/tests/utils/test_check_package.py  | 17 +++++++++++++
 utils/check-package                                |  3 +++
 utils/checkpackagelib/lib_python.py                |  1 +
 utils/checkpackagelib/test_tool.py                 | 28 ++++++++++++++++++++++
 utils/checkpackagelib/tool.py                      | 15 ++++++++++++
 9 files changed, 69 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index 3498f7226b..95959daab2 100644
--- a/Makefile
+++ b/Makefile
@@ -123,7 +123,7 @@ endif
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig alldefconfig syncconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	print-version olddefconfig distclean manual manual-% check-package check-flake8
+	print-version olddefconfig distclean manual manual-% check-package
 
 # Some global targets do not trigger a build, but are used to collect
 # metadata, or do various checks. When such targets are triggered,
@@ -1249,13 +1249,6 @@ release:
 print-version:
 	@echo $(BR2_VERSION_FULL)
 
-check-flake8:
-	$(Q)git ls-tree -r --name-only HEAD \
-	| xargs file \
-	| grep 'Python script' \
-	| cut -d':' -f1 \
-	| xargs -- python3 -m flake8 --statistics
-
 check-package:
 	$(Q)./utils/check-package `git ls-tree -r --name-only HEAD` \
 		--ignore-list=$(TOPDIR)/.checkpackageignore
diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 38aca31fb5..cbb6e555ce 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -13,10 +13,6 @@ before_script:
     script:
         - utils/get-developers -v
 
-.check-flake8_base:
-    script:
-        - make check-flake8
-
 .check-package_base:
     script:
         - make check-package
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index e2fb2228b3..ea4340f47c 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -26,7 +26,7 @@ gen_tests() {
     local do_basics do_defconfigs do_runtime do_testpkg
     local defconfigs_ext cfg tst
 
-    basics=( check-package check-symbol DEVELOPERS flake8 package symbol )
+    basics=( check-package check-symbol DEVELOPERS package symbol )
 
     defconfigs=( $(cd configs; LC_ALL=C ls -1 *_defconfig) )
 
diff --git a/support/testing/tests/utils/br2-external/utils/x-python b/support/testing/tests/utils/br2-external/utils/x-python
new file mode 100644
index 0000000000..da7c36c7e0
--- /dev/null
+++ b/support/testing/tests/utils/br2-external/utils/x-python
@@ -0,0 +1,3 @@
+#!/usr/bin/env python3
+# Trigger flake8 warning "W391 blank line at end of file"
+
diff --git a/support/testing/tests/utils/test_check_package.py b/support/testing/tests/utils/test_check_package.py
index d2c1556845..87382e07b0 100644
--- a/support/testing/tests/utils/test_check_package.py
+++ b/support/testing/tests/utils/test_check_package.py
@@ -250,3 +250,20 @@ class TestCheckPackage(unittest.TestCase):
         self.assert_file_was_processed(m)
         self.assert_warnings_generated_for_file(m)
         self.assertIn("{}:0: run 'shellcheck' and fix the warnings".format(abs_file), w)
+
+        # python scripts are tested using flake8
+        rel_file = "utils/x-python"
+        abs_path = infra.filepath("tests/utils/br2-external")
+        abs_file = os.path.join(abs_path, rel_file)
+
+        w, m = call_script(["check-package", "-vvv", "-b", rel_file],
+                           self.WITH_UTILS_IN_PATH, abs_path)
+        self.assert_file_was_processed(m)
+        self.assert_warnings_generated_for_file(m)
+        self.assertIn("{}:0: run 'flake8' and fix the warnings".format(rel_file), w)
+
+        w, m = call_script(["check-package", "-b", abs_file],
+                           self.WITH_UTILS_IN_PATH, infra.basepath())
+        self.assert_file_was_processed(m)
+        self.assert_warnings_generated_for_file(m)
+        self.assertIn("{}:0: run 'flake8' and fix the warnings".format(abs_file), w)
diff --git a/utils/check-package b/utils/check-package
index 27070571c9..758d51ba8b 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -14,6 +14,7 @@ import checkpackagelib.lib_config
 import checkpackagelib.lib_hash
 import checkpackagelib.lib_mk
 import checkpackagelib.lib_patch
+import checkpackagelib.lib_python
 import checkpackagelib.lib_shellscript
 import checkpackagelib.lib_sysv
 
@@ -100,6 +101,8 @@ def get_lib_from_filetype(fname):
     filetype = get_filetype(fname)
     if filetype == "text/x-shellscript":
         return checkpackagelib.lib_shellscript
+    if filetype in ["text/x-python", "text/x-script.python"]:
+        return checkpackagelib.lib_python
     return None
 
 
diff --git a/utils/checkpackagelib/lib_python.py b/utils/checkpackagelib/lib_python.py
new file mode 100644
index 0000000000..f8c17ddc10
--- /dev/null
+++ b/utils/checkpackagelib/lib_python.py
@@ -0,0 +1 @@
+from checkpackagelib.tool import Flake8                # noqa: F401
diff --git a/utils/checkpackagelib/test_tool.py b/utils/checkpackagelib/test_tool.py
index a0bf88001d..cfa826f57c 100644
--- a/utils/checkpackagelib/test_tool.py
+++ b/utils/checkpackagelib/test_tool.py
@@ -66,6 +66,34 @@ def test_NotExecutable_hint(testname, hint, filename, permissions, string, expec
     assert warnings == expected
 
 
+Flake8 = [
+    ('empty',
+     'empty.py',
+     '',
+     []),
+    ('W391',
+     'blank-line.py',
+     '\n',
+     ["dir/blank-line.py:0: run 'flake8' and fix the warnings",
+      "dir/blank-line.py:1:1: W391 blank line at end of file"]),
+    ('more than one warning',
+     'file',
+     'import os\n'
+     'import re\n'
+     '\n',
+     ["dir/file:0: run 'flake8' and fix the warnings",
+      "dir/file:1:1: F401 'os' imported but unused\n"
+      "dir/file:2:1: F401 're' imported but unused\n"
+      'dir/file:3:1: W391 blank line at end of file']),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', Flake8)
+def test_Flake8(testname, filename, string, expected):
+    warnings = check_file(m.Flake8, filename, string)
+    assert warnings == expected
+
+
 Shellcheck = [
     ('missing shebang',
      'empty.sh',
diff --git a/utils/checkpackagelib/tool.py b/utils/checkpackagelib/tool.py
index 632aaa9f9e..907ada704f 100644
--- a/utils/checkpackagelib/tool.py
+++ b/utils/checkpackagelib/tool.py
@@ -1,5 +1,7 @@
+import flake8.main.application
 import os
 import subprocess
+import tempfile
 from checkpackagelib.base import _Tool
 
 
@@ -14,6 +16,19 @@ class NotExecutable(_Tool):
             return ["{}:0: This file does not need to be executable{}".format(self.filename, self.hint())]
 
 
+class Flake8(_Tool):
+    def run(self):
+        with tempfile.NamedTemporaryFile() as output:
+            app = flake8.main.application.Application()
+            app.run(['--output-file={}'.format(output.name), self.filename])
+            stdout = output.readlines()
+            processed_output = [str(line.decode().rstrip()) for line in stdout if line]
+            if len(stdout) == 0:
+                return
+            return ["{}:0: run 'flake8' and fix the warnings".format(self.filename),
+                    '\n'.join(processed_output)]
+
+
 class Shellcheck(_Tool):
     def run(self):
         cmd = ['shellcheck', self.filename]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
