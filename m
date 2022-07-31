Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D58C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 19:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02F02408F9;
	Sun, 31 Jul 2022 19:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02F02408F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MzXIY0M1VjLJ; Sun, 31 Jul 2022 19:38:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 604C5408C2;
	Sun, 31 Jul 2022 19:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 604C5408C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58C4A1BF2EB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CCF182977
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CCF182977
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mWJdS8CNSUer for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 19:36:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34EE782AA9
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34EE782AA9
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 19:36:18 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id x125so9256102vsb.13
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 12:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Se4ocmEe4ySsG2VWAYXrwvfNpsKgNUy0sOJGODmzrxU=;
 b=YlO6/v8yA2FSMgdW/ah62ScC/tuqtpVG5rhChuAyFhrV3O67MoMYSURnPWeIgezxkh
 Oua2gnI+BSHp0tGS2gjoXVuqRALy+5iMjuzcpHePDBwKNYj9udQFEwoiAwUtSfwnlv7t
 ic1Rbq4Us0udvAlG5NYC8Sz2DKP91UIqLYkNUGdXDDhPYBgVFkhts60cpkmZvefXIMPj
 zYqvoqiOrC0TELOdBvhImhQ/U5wK8DzINiunXGZvV7KKidaXr2GbWvzpWV0alw2rWvyf
 nHhA2qn3FKHutRrxWtiqmIsA8jclE2eoD/C1paT9XnLoMpTuTlOTQzJ7hLwjUP+OmEdU
 RvTQ==
X-Gm-Message-State: AJIora+5wpcQtAwvxvBwEWJWBOmZChGqS0C/pAodW0x+Uz4DFgN+PfZS
 Ji4A1JF6kkskkSyzna+CdnfYU3ywecQ=
X-Google-Smtp-Source: AGRyM1txToOtB5lLnBG+4OT0iZqWclKKAZV661ANzZ63+fsor9j1V12s2hXnXUqiaXKBZbAFbxE/5g==
X-Received: by 2002:a05:6102:c90:b0:35a:8647:154f with SMTP id
 f16-20020a0561020c9000b0035a8647154fmr4659476vst.71.1659296177821; 
 Sun, 31 Jul 2022 12:36:17 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056102074500b0037ddf9489f2sm1418667vsg.13.2022.07.31.12.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 12:36:16 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 16:35:18 -0300
Message-Id: <20220731193521.1217825-12-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Se4ocmEe4ySsG2VWAYXrwvfNpsKgNUy0sOJGODmzrxU=;
 b=JLCYypjaqCvu8kIA7i3KCBK9hrW+odaCTY7cHa0thKrxxFkDwonlUl5KcITgcq4B/V
 JKTuZ2kmDEnznfyoQECASf4f5nOBJ7G7CiAN9gKyQDgXweCLRo7oSalD4ea/Yi+42Oie
 a2zMnEamD+ntZr0zZ+UUCurxgXFfIjs5cM1YMhQuTsTDp4pRkaBCTTlu3xIOmuwtY89j
 2/N46ewJRVIDnsjfsupB4hUi4eYgZuAJlgNz2GltqtlJb/GI/X/CH0hcF3LZXjT/zZC0
 m2O7CWEUIi5uBsN0u41pybl9QVsKpQZnBDjEahMtVdMSM18AfxkLBIqK5cSHXnXZ1iIB
 eVMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JLCYypja
Subject: [Buildroot] [PATCH v2 11/14] Makefile: merge check-flake8 into
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Changes v1 -> v2:
  - minor update only commit message (do not mention docker image)

Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile                                      |  9 +-----
 support/misc/gitlab-ci.yml.in                 |  4 ---
 support/scripts/generate-gitlab-ci-yml        |  2 +-
 .../tests/utils/br2-external/utils/x-python   |  2 ++
 .../testing/tests/utils/test_check_package.py | 17 +++++++++++
 utils/check-package                           |  3 ++
 utils/checkpackagelib/lib_python.py           |  1 +
 utils/checkpackagelib/test_tool.py            | 28 +++++++++++++++++++
 utils/checkpackagelib/tool.py                 | 15 ++++++++++
 9 files changed, 68 insertions(+), 13 deletions(-)
 create mode 100644 support/testing/tests/utils/br2-external/utils/x-python
 create mode 100644 utils/checkpackagelib/lib_python.py

diff --git a/Makefile b/Makefile
index c5dee409f1..30a4eed31b 100644
--- a/Makefile
+++ b/Makefile
@@ -125,7 +125,7 @@ endif
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig alldefconfig syncconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	print-version olddefconfig distclean manual manual-% check-package check-flake8
+	print-version olddefconfig distclean manual manual-% check-package
 
 # Some global targets do not trigger a build, but are used to collect
 # metadata, or do various checks. When such targets are triggered,
@@ -1233,13 +1233,6 @@ release:
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
 	$(Q)./utils/check-package `git ls-tree -r --name-only HEAD`
 
diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 3ac988a519..2fde904006 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -6,10 +6,6 @@
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
index aa43aac019..536ae0f042 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -26,7 +26,7 @@ gen_tests() {
     local do_basics do_defconfigs do_runtime do_testpkg
     local defconfigs_ext cfg tst
 
-    basics=( check-package DEVELOPERS flake8 package )
+    basics=( check-package DEVELOPERS package )
 
     defconfigs=( $(cd configs; LC_ALL=C ls -1 *_defconfig) )
 
diff --git a/support/testing/tests/utils/br2-external/utils/x-python b/support/testing/tests/utils/br2-external/utils/x-python
new file mode 100644
index 0000000000..63f77b6be1
--- /dev/null
+++ b/support/testing/tests/utils/br2-external/utils/x-python
@@ -0,0 +1,2 @@
+#!/usr/bin/env python3
+
diff --git a/support/testing/tests/utils/test_check_package.py b/support/testing/tests/utils/test_check_package.py
index aeda0857e3..e655bff1ec 100644
--- a/support/testing/tests/utils/test_check_package.py
+++ b/support/testing/tests/utils/test_check_package.py
@@ -249,3 +249,20 @@ class TestCheckPackage(unittest.TestCase):
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
index 423b53ffb8..3507709707 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -14,6 +14,7 @@ import checkpackagelib.lib_config
 import checkpackagelib.lib_hash
 import checkpackagelib.lib_mk
 import checkpackagelib.lib_patch
+import checkpackagelib.lib_python
 import checkpackagelib.lib_shellscript
 import checkpackagelib.lib_sysv
 
@@ -94,6 +95,8 @@ def get_lib_from_filetype(fname):
     filetype = magic.from_file(fname, mime=True)
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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
