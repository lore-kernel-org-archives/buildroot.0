Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0280DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 01:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 678EA40ABD;
	Sat, 28 May 2022 01:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G2OXA8RasX8A; Sat, 28 May 2022 01:49:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2C6340A83;
	Sat, 28 May 2022 01:49:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB99E1BF32E
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 01:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9DED60F4A
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 01:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id smIqWbh4pjDA for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 01:49:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7E0560F49
 for <buildroot@buildroot.org>; Sat, 28 May 2022 01:49:07 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id i66so7645896oia.11
 for <buildroot@buildroot.org>; Fri, 27 May 2022 18:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TFAtZ0CWZjU4rO3CDke+NYrxk3XdhmpMGS9AHdLbYCc=;
 b=OPcL5LAMfQPYx/MUk4Nz4qMN95g3/xGEmEJnXYGLXnc6499Yz6yBQVGpYbSvCd39nP
 BxeePIpxIKsEXAEZR7AHlZfpaR0jnf5IZE/xi1x9bdi7Bx4xQKgZIPpI9GXOrQus4Wyj
 Ii9xZ0DylFqCVTfjSGr2N3/eIyqBcQx6FpwiPvsPmyEMQF/SxuzF7/cryBrpPU8Pn2os
 zRXbC1Y0/XCSxWzEJbZEYMllWGCuP6iuBKgMVgo8ecl6L1Jzd6xOHS+ZTZzVYGXtBiCu
 d+oggnBZgB+7sA1yaGt+C8sxEu3Z0YH1vumTzjQCzfu5pVIrXZKpy8iPmEOt3c0g9ecZ
 sr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TFAtZ0CWZjU4rO3CDke+NYrxk3XdhmpMGS9AHdLbYCc=;
 b=dz+wH790angexA6qQNWrH+KVhmJm73/X34okRR5YzZuKbxcC4dGuxCX2nHHhydIiNm
 LHFPXrT/8tSPZZ+3DqusdAiN+PVl8AhqjHzzRobP1IO7TZbjDm/+og6I4SmJ1zW8qzN6
 JD52+S/KLdIk35LB35tNaX0MEONIE0yPDMTpHtSEWvrMUVaz3alTHltJ68oEDT8gfUFN
 nHXiqstXfglZPbmG+/XabJ5g5L5TWQhfY1pE/jSmGmOBsWalsrdX3N9+aGoJsE3ACP5A
 UgIez0Mhla3gbiI9Tbk0G88k0J6U8JNiOiuWUEXXTb78sFUptLjwbjxKkwzgTN/hTwkW
 mcTA==
X-Gm-Message-State: AOAM5319hN3uzsIq/6uJzXBS/hjCbSMcxWcQRdbpBBUjKDgggd7F9Kld
 KZEZd9DTeV2JPuxOIQUdGEUgL8e+J5I=
X-Google-Smtp-Source: ABdhPJzGixOOF8ktQBtcrla16LympfbYk3PleDiTjVbZQUqNb3TUcskkFQbIgDHWthPGXvnHI6BA2g==
X-Received: by 2002:a05:6808:f8f:b0:32b:ce48:bb20 with SMTP id
 o15-20020a0568080f8f00b0032bce48bb20mr3377954oiw.15.1653702546641; 
 Fri, 27 May 2022 18:49:06 -0700 (PDT)
Received: from localhost.localdomain ([179.232.85.243])
 by smtp.gmail.com with ESMTPSA id
 b30-20020a9d60de000000b006060322125dsm2554367otk.45.2022.05.27.18.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 18:49:06 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 22:48:32 -0300
Message-Id: <20220528014832.289907-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [master, next,
 lts] utils/get-developer: fix DEVELOPERS syntax check on GitLab CI
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "45aabcddc5 utils/get-developers: really make it callable from
elsewhere than the toplevel directory" ended up making check-DEVELOPERS
in GitLab-CI to always get a false PASS result, since the job was
trusting that calling get-developers with no arguments would parse
DEVELOPERS file and generate error or warning messages.

There is need to revert that change, we only need to recover the syntax
check coverage it had before the change.

Make the option -c from get-developers to generate a non-zero return
code when there is parsing errors or warnings.
Adapt the manual accordingly and use the -c argument in the
check-DEVELOPERS job.

In the same commit, add a runtime test in order to detect undesired
changes in behavior of the get-developers script.
The test uses a .patch file generated against the buildroot tree as a
fixture to check how get-developers operates when called to check it.
The test also overrides the DEVELOPERS file in order to be fully
reproducible and a -d option is added to get-developers in order to
allow this.
Since get-developers only looks to already committed files to compare
against patch files, the fixture uses a package that is very unlikely to
be removed from buildroot tree: binutils.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Backport to: 2022.02.x

NOTE 1: the DEVELOPERS file has currently NO syntax issue, but it lost
        syntax coverage in the GitLab CI.

NOTE 2: This patch fix applies (cleanly) to master, next and 2022.02.x
        branches.

NOTE 3: This patch could be broken in 3:
        1) change -c behavior, the manual, and the command job
           check-DEVELOPERS runs
        2) add -d to override the DEVELOPERS file used, in order to
           test get-developers without altering the DEVELOPERS file
           committed
        3) add the runtime test (to check get-developers behavior) and
           its fixture (a .patch file against buildroot tree)
        But they all are highly coupled (any change on 1 or 2 changes 3)
        so I decided to send in a single patch.
        I can resend in more than one if you ask.

See the runs in the GitLab CI:

current master + break DEVELOPERS syntax:
- check-DEVELOPERS incorrectly 'passed' [1]

current master + break DEVELOPERS syntax + this patch:
- check-DEVELOPERS correctly 'failed' [2]

current master + break get-developers behaviour + this patch:
- check-* correctly 'passed' [3]
- tests.utils correctly 'failed' [4]

2022.02.x + this patch:
- check-* correctly 'passed' [5]
- tests.utils 'passed' [6]

master + this patch:
- check-* correctly 'passed' [7]
- tests.utils correctly 'passed' [8]

next + this patch:
- check-* correctly 'passed' [9]
- tests.utils correctly 'passed' [10]

[1] https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/550133099
[2] https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/550140172
[3] https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/550142118
[4] https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/550142351
[5] https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/550132233
[6] https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/550131741
[7] https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/550132378
[8] https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/550132762
[9] https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/550132817
[10] https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/550132878

Regards,
---
 docs/manual/developers.txt                    |   7 +-
 support/misc/gitlab-ci.yml.in                 |   5 +-
 support/scripts/pkg-stats                     |   2 +-
 .../0001-package-binutils-change-.mk.patch    |  23 ++++
 .../tests/utils/test_get_developers.py        | 104 ++++++++++++++++++
 utils/get-developers                          |   8 +-
 utils/getdeveloperlib.py                      |  16 ++-
 7 files changed, 150 insertions(+), 15 deletions(-)
 create mode 100644 support/testing/tests/utils/br2-external/outgoing/0001-package-binutils-change-.mk.patch
 create mode 100644 support/testing/tests/utils/test_get_developers.py

diff --git a/docs/manual/developers.txt b/docs/manual/developers.txt
index 7058d57b20..f775a5c9a4 100644
--- a/docs/manual/developers.txt
+++ b/docs/manual/developers.txt
@@ -43,7 +43,6 @@ the +DEVELOPERS+ file for various tasks:
 - When using the +-c+ command line option, +get-developers+ will look
   at all files under version control in the Buildroot repository, and
   list the ones that are not handled by any developer. The purpose of
-  this option is to help completing the +DEVELOPERS+ file.
-
-- When using without any arguments, it validates the integrity of the
-  DEVELOPERS file and will note WARNINGS for items that don't match.
+  this option is to help completing the +DEVELOPERS+ file. It also
+  validates the integrity of the DEVELOPERS file and will note WARNINGS
+  for items that don't match.
diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 47e72c3213..c8639e0faf 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -3,11 +3,8 @@
         - python3 -m pytest -v utils/checkpackagelib/
 
 .check-DEVELOPERS_base:
-    # get-developers should print just "No action specified"; if it prints
-    # anything else, it's a parse error.
-    # The initial ! is removed by YAML so we need to quote it.
     script:
-        - "! utils/get-developers | grep -v 'No action specified'"
+        - utils/get-developers -c >/dev/null
 
 .check-flake8_base:
     script:
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index f67be0063f..de7db8f698 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1188,7 +1188,7 @@ def __main__():
     print("Build package list ...")
     packages = get_pkglist(args.npackages, package_list)
     print("Getting developers ...")
-    developers = parse_developers()
+    developers, _, _ = parse_developers()
     print("Build defconfig list ...")
     defconfigs = get_defconfig_list()
     for d in defconfigs:
diff --git a/support/testing/tests/utils/br2-external/outgoing/0001-package-binutils-change-.mk.patch b/support/testing/tests/utils/br2-external/outgoing/0001-package-binutils-change-.mk.patch
new file mode 100644
index 0000000000..46ebeaa8f1
--- /dev/null
+++ b/support/testing/tests/utils/br2-external/outgoing/0001-package-binutils-change-.mk.patch
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
diff --git a/support/testing/tests/utils/test_get_developers.py b/support/testing/tests/utils/test_get_developers.py
new file mode 100644
index 0000000000..a7b18277f5
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
+        # -c generating error, called from the main dir
+        developers = b'text1\n'
+        out, err, rc = call_get_developers("./utils/get-developers", ["-c"], self.WITH_EMPTY_PATH, topdir, developers)
+        self.assertIn("Syntax error in DEVELOPERS file, line 0: 'text1'", err)
+        self.assertEqual(rc, 1)
+        self.assertEqual(len(out), 0)
+
+        # -c generating error, called from path
+        developers = b'text2\n'
+        out, err, rc = call_get_developers("get-developers", ["-c"], self.WITH_UTILS_IN_PATH, topdir, developers)
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
+        self.assertEqual(rc, 3)
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
+        abs_path = infra.filepath("tests/utils/br2-external/outgoing/")
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
diff --git a/utils/get-developers b/utils/get-developers
index 22accaf181..dc13311b0a 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -19,6 +19,8 @@ def parse_args():
                         const=True, help='list files not handled by any developer')
     parser.add_argument('-e', dest='email', action='store_const',
                         const=True, help='only list affected developer email addresses')
+    parser.add_argument('-d', dest='filename', action='store', default=None,
+                        help='override the default DEVELOPERS file (for debug)')
     return parser.parse_args()
 
 
@@ -44,7 +46,7 @@ def __main__():
         print("No action specified")
         return
 
-    devs = getdeveloperlib.parse_developers()
+    devs, nwarnings, nerrors = getdeveloperlib.parse_developers(args.filename)
     if devs is None:
         sys.exit(1)
 
@@ -53,6 +55,10 @@ def __main__():
         files = getdeveloperlib.check_developers(devs)
         for f in files:
             print(f)
+        if nerrors > 0:
+            sys.exit(2)
+        if nwarnings > 0:
+            sys.exit(3)
 
     # Handle the architecture action
     if args.architecture is not None:
diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index c05e1f888b..a69417bb02 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -225,13 +225,16 @@ def parse_developer_runtime_tests(fnames):
     return runtimes
 
 
-def parse_developers():
-    """Parse the DEVELOPERS file and return a list of Developer objects."""
+def parse_developers(filename=None):
+    """Parse the DEVELOPERS file and return a list of Developer objects and the number of errors and warnings found while
+    parsing."""
     developers = []
     linen = 0
+    nwarnings = 0
+    nerrors = 0
     global unittests
     unittests = list_unittests()
-    developers_fname = os.path.join(brpath, 'DEVELOPERS')
+    developers_fname = filename or os.path.join(brpath, 'DEVELOPERS')
     with open(developers_fname, mode='r', encoding='utf_8') as f:
         files = []
         name = None
@@ -241,6 +244,7 @@ def parse_developers():
                 continue
             elif line.startswith("N:"):
                 if name is not None or len(files) != 0:
+                    nerrors += 1
                     print("Syntax error in DEVELOPERS file, line %d" % linen,
                           file=sys.stderr)
                 name = line[2:].strip()
@@ -248,6 +252,7 @@ def parse_developers():
                 fname = line[2:].strip()
                 dev_files = glob.glob(os.path.join(brpath, fname))
                 if len(dev_files) == 0:
+                    nwarnings += 1
                     print("WARNING: '%s' doesn't match any file" % fname,
                           file=sys.stderr)
                 for f in dev_files:
@@ -263,14 +268,15 @@ def parse_developers():
                 files = []
                 name = None
             else:
+                nerrors += 1
                 print("Syntax error in DEVELOPERS file, line %d: '%s'" % (linen, line),
                       file=sys.stderr)
-                return None
+                return None, nwarnings, nerrors
             linen += 1
     # handle last developer
     if name is not None:
         developers.append(Developer(name, files))
-    return developers
+    return developers, nwarnings, nerrors
 
 
 def check_developers(developers, basepath=None):
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
