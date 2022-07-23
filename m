Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF51C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 14:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B258184BA3;
	Sat, 23 Jul 2022 14:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B258184BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1KEpXR5mLTVY; Sat, 23 Jul 2022 14:34:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74717848A3;
	Sat, 23 Jul 2022 14:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74717848A3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 319521BF314
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AA2A818C9
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AA2A818C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQZ40i7tgNjX for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 14:33:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11B758138B
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11B758138B
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0D101844C9; Sat, 23 Jul 2022 14:19:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 16:32:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7082b0585d5a231a062087d3e44007742b9165d4
X-Git-Newrev: 9bb647297a6c48a7a79c20f4403be0dbea811a6c
X-Patchwork-Hint: ignore
Message-Id: <20220723141950.0D101844C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests: add get-developers
 tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=9bb647297a6c48a7a79c20f4403be0dbea811a6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a runtime test in order to detect undesired changes in behavior of
the get-developers script.

The test uses a .patch file generated against the buildroot tree as a
fixture to check how get-developers operates when called to check it.
The test also overrides the DEVELOPERS file in order to be fully
reproducible and a -d option is added to get-developers in order to
allow this. Since get-developers only looks to already committed
files to compare against patch files, the fixture uses a package that
is very unlikely to be removed from buildroot tree: binutils.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[Thomas: extracted from a larger patch from Ricardo, submitted at
https://patchwork.ozlabs.org/project/buildroot/patch/20220528014832.289907-1-ricardo.martincoski@gmail.com/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/utils/test_get_developers.py | 104 +++++++++++++++++++++
 .../0001-package-binutils-change-.mk.patch         |  23 +++++
 2 files changed, 127 insertions(+)

diff --git a/support/testing/tests/utils/test_get_developers.py b/support/testing/tests/utils/test_get_developers.py
new file mode 100644
index 0000000000..e4420bc6dc
--- /dev/null
+++ b/support/testing/tests/utils/test_get_developers.py
@@ -0,0 +1,104 @@
+"""Test cases for utils/get-developers.
+
+It does not inherit from infra.basetest.BRTest and therefore does not generate
+a logfile. Only when the tests fail there will be output to the console.
+
+The file syntax is already tested by the GitLab-CI job check-DEVELOPERS.
+"""
+import os
+import subprocess
+import tempfile
+import unittest
+
+import infra
+
+
+def call_script(args, env, cwd):
+    """Call a script and return stdout and stderr as lists and the exit code."""
+    proc = subprocess.Popen(args, cwd=cwd, stdout=subprocess.PIPE,
+                            stderr=subprocess.PIPE, env=env,
+                            universal_newlines=True)
+    out, err = proc.communicate()
+    return out.splitlines(), err.splitlines(), proc.returncode
+
+
+def call_get_developers(cmd, args, env, cwd, developers_content):
+    """Call get-developers overrinding the default DEVELOPERS file."""
+    with tempfile.NamedTemporaryFile(buffering=0) as developers_file:
+        developers_file.write(developers_content)
+        return call_script([cmd, "-d", developers_file.name] + args, env, cwd)
+
+
+class TestGetDevelopers(unittest.TestCase):
+    """Test the various ways the script can be called in a simple top to bottom sequence."""
+
+    WITH_EMPTY_PATH = {}
+    WITH_UTILS_IN_PATH = {"PATH": infra.basepath("utils") + ":" + os.environ["PATH"]}
+
+    def test_run(self):
+        topdir = infra.basepath()
+
+        # no args, with syntax error in the file
+        developers = b'text3\n'
+        out, err, rc = call_get_developers("./utils/get-developers", [], self.WITH_EMPTY_PATH, topdir, developers)
+        self.assertIn("No action specified", out)
+        self.assertEqual(rc, 0)
+        self.assertEqual(len(err), 0)
+
+        # -v generating error, called from the main dir
+        developers = b'text1\n'
+        out, err, rc = call_get_developers("./utils/get-developers", ["-v"], self.WITH_EMPTY_PATH, topdir, developers)
+        self.assertIn("Syntax error in DEVELOPERS file, line 0: 'text1'", err)
+        self.assertEqual(rc, 1)
+        self.assertEqual(len(out), 0)
+
+        # -v generating error, called from path
+        developers = b'text2\n'
+        out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
+        self.assertIn("Syntax error in DEVELOPERS file, line 0: 'text2'", err)
+        self.assertEqual(rc, 1)
+        self.assertEqual(len(out), 0)
+
+        # -c generating warning and printing lots of files with no developer
+        developers = b'N:\tAuthor <email>\n' \
+                     b'F:\tpath/that/does/not/exists/1\n' \
+                     b'F:\tpath/that/does/not/exists/2\n'
+        out, err, rc = call_get_developers("./utils/get-developers", ["-c"], self.WITH_EMPTY_PATH, topdir, developers)
+        self.assertIn("WARNING: 'path/that/does/not/exists/1' doesn't match any file", err)
+        self.assertIn("WARNING: 'path/that/does/not/exists/2' doesn't match any file", err)
+        self.assertEqual(rc, 0)
+        self.assertGreater(len(out), 1000)
+
+        # -p lists more than one developer
+        developers = b'N:\tdev1\n' \
+                     b'F:\ttoolchain/\n' \
+                     b'\n' \
+                     b'N:\tdev2\n' \
+                     b'F:\ttoolchain/\n'
+        out, err, rc = call_get_developers("./utils/get-developers", ["-p", "toolchain"], self.WITH_EMPTY_PATH, topdir, developers)
+        self.assertIn("dev1", out)
+        self.assertIn("dev2", out)
+        self.assertEqual(rc, 0)
+        self.assertEqual(len(err), 0)
+
+        # no args, with syntax error in the file
+        developers = b'text3\n'
+        out, err, rc = call_get_developers("./utils/get-developers", [], self.WITH_EMPTY_PATH, topdir, developers)
+        self.assertIn("No action specified", out)
+        self.assertEqual(rc, 0)
+        self.assertEqual(len(err), 0)
+
+        # patchfile from topdir and from elsewhere
+        abs_path = infra.filepath("tests/utils/test_get_developers/")
+        rel_file = "0001-package-binutils-change-.mk.patch"
+        abs_file = os.path.join(abs_path, rel_file)
+        developers = b'N:\tdev1\n' \
+                     b'F:\tpackage/binutils/\n'
+        out, err, rc = call_get_developers("./utils/get-developers", [abs_file], self.WITH_EMPTY_PATH, topdir, developers)
+        self.assertIn('git send-email --to buildroot@buildroot.org --cc "dev1"', out)
+        self.assertEqual(rc, 0)
+        self.assertEqual(len(err), 0)
+        out, err, rc = call_get_developers("get-developers", [rel_file], self.WITH_UTILS_IN_PATH, abs_path, developers)
+        self.assertIn('git send-email --to buildroot@buildroot.org --cc "dev1"', out)
+        self.assertEqual(rc, 0)
+        self.assertEqual(len(err), 0)
diff --git a/support/testing/tests/utils/test_get_developers/0001-package-binutils-change-.mk.patch b/support/testing/tests/utils/test_get_developers/0001-package-binutils-change-.mk.patch
new file mode 100644
index 0000000000..46ebeaa8f1
--- /dev/null
+++ b/support/testing/tests/utils/test_get_developers/0001-package-binutils-change-.mk.patch
@@ -0,0 +1,23 @@
+From f213fd29c1015a3afee9a3fde0dd7ce6c6325802 Mon Sep 17 00:00:00 2001
+From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
+Date: Fri, 27 May 2022 20:15:00 -0300
+Subject: [PATCH 1/1] package/binutils: change .mk
+
+Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
+---
+ package/binutils/binutils.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
+index 8c4a1371ca..3f143d9d76 100644
+--- a/package/binutils/binutils.mk
++++ b/package/binutils/binutils.mk
+@@ -1,6 +1,6 @@
+ ################################################################################
+ #
+-# binutils
++# Binutils
+ #
+ ################################################################################
+--
+2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
