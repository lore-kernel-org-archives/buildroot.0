Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23D1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A44960AD8;
	Sun, 24 Jul 2022 05:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A44960AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Da_FMCHmGWqk; Sun, 24 Jul 2022 05:53:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8B7661038;
	Sun, 24 Jul 2022 05:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8B7661038
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BBDB71BF59B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 957CE400EC
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 957CE400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qcl2jK2p-3LD for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:51:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8721B400AC
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8721B400AC
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:51:00 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-10d9213b77aso11049914fac.5
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=hwDC39PoV8N9BYiahT3VW5vpzcbtO3kF0KSJUZKu5ZI=;
 b=qCse7ttbOdygJG28ozzBWN8autO1tFoAR77tBLyLFUl75F4ksS7+CwrFnx6AECRa/R
 vCAxlNV60Fvip78Dgkwwr3LovjhPLxVzNAlLIFe1DjqIEW1rMb0uo3bvomRh4j/Ini+b
 TN5V0rhw/h6HYoT/NXRuRyu/y8SXSX4WmiR5Tr6LFhURP4s72k7IIo+QAC+T//JHr8ah
 /8qCgy8Ahw3hC/fLUHI0xbTFwzrulfbC19LnWgqSCyWIRQ5SpslppH+9gH/AYoQbSAxP
 3RIIi07lCP+iryX4CAWL88AuHMcIYXJdRDTDoNJu9PAJ14dNA25W9jMYT7tp39qX16nV
 h7BQ==
X-Gm-Message-State: AJIora/SWGxDT8fjDARzQUG6V62C9EoXwPdkbbixhZ9+JuUROcHKH2dT
 XGrZd++tshuZK+ddTxK4hr6Zxx4esZI=
X-Google-Smtp-Source: AGRyM1s3CY/pDhfWQJ8D7aHYiKOlYVkFkY/vC8Osv2e80PbUEexzh5roY7qKB9+9R1BW1i/uG/Z/sQ==
X-Received: by 2002:a05:6870:831d:b0:10d:a96f:8bc with SMTP id
 p29-20020a056870831d00b0010da96f08bcmr6406754oae.143.1658641859569; 
 Sat, 23 Jul 2022 22:50:59 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056870818d00b000f5d8d031b6sm4236969oae.49.2022.07.23.22.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 22:50:58 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:49:10 -0300
Message-Id: <20220724054912.2354219-15-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=hwDC39PoV8N9BYiahT3VW5vpzcbtO3kF0KSJUZKu5ZI=;
 b=HGxt9iAqAdKNCwbjK8UvTp/LHFcJC63KT2Cm6jsj/VCWoYMam/XHn3oGhcvcf40Jmp
 au3yjvBggAoVLl9Ngb5InyYU4fo5ckpqHcTZdljcD+bMV3q33GmDalXCyxOF4rlinnCA
 Rs/K7PdOGMzq0eUG/NEnrjuxvbg3SZg67CJgor/Q4LaOQQ15tZv6Dq7rfHizD1Mr/+66
 wQ5oFEetPeZWaoCjpfU29FyVS3gqjyAlR+CbZQGUHtdDBHBGOagn/CQhhJ3x6hrrVD4M
 I2CQijq65DnXBUi4WrdCty47YmCYPMZ9hd5Hm3fcgf7ICBMWbPInG6yc01k1dOYOaT0a
 Yhow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HGxt9iAq
Subject: [Buildroot] [PATCH 14/16] Makefile: merge check-flake8 into
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

Since 'make check-package' always run using the docker image, there is
no dependency added to the host machine.

Remove check-flake8 from the makefile and also from the GitLab CI
because the exact same checks become part of check-package.

Suggested-by:: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 Makefile                                      | 11 ++------
 support/misc/gitlab-ci.yml.in                 |  4 ---
 support/scripts/generate-gitlab-ci-yml        |  2 +-
 .../tests/utils/br2-external/utils/x-python   |  2 ++
 .../testing/tests/utils/test_check_package.py | 17 +++++++++++
 utils/check-package                           |  3 ++
 utils/checkpackagelib/lib_python.py           |  1 +
 utils/checkpackagelib/test_tool.py            | 28 +++++++++++++++++++
 utils/checkpackagelib/tool.py                 | 15 ++++++++++
 9 files changed, 69 insertions(+), 14 deletions(-)
 create mode 100644 support/testing/tests/utils/br2-external/utils/x-python
 create mode 100644 utils/checkpackagelib/lib_python.py

diff --git a/Makefile b/Makefile
index f42dc3151d..7c7b67a616 100644
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
@@ -1240,19 +1240,12 @@ print-version:
 check_inside_docker := $(shell if [ "`groups`" = 'br-user' ]; then echo y; else echo n; fi)
 
 # List of target that need to run inside docker image to ensure reproducible results
-inside_docker_targets := check-package check-flake8
+inside_docker_targets := check-package
 
 ifeq ($(check_inside_docker),n)
 $(inside_docker_targets):
 	$(Q)utils/docker-run $(MAKE) V=$(V) $@
 else
-check-flake8:
-	$(Q)git ls-tree -r --name-only HEAD \
-	| xargs file \
-	| grep 'Python script' \
-	| cut -d':' -f1 \
-	| xargs -- python3 -m flake8 --statistics
-
 check-package:
 	$(Q)./utils/check-package `git ls-tree -r --name-only HEAD`
 endif
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
index 601d899d3d..beebef0ddb 100755
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
