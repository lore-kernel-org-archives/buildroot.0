Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05610C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B8134EDEF;
	Tue, 21 Feb 2023 00:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B8134EDEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q_nHqTkig81u; Tue, 21 Feb 2023 00:18:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4106B4F1EC;
	Tue, 21 Feb 2023 00:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4106B4F1EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85B1F1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48A75417C8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48A75417C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jFVC8MKyxtc3 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63D9B417A0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63D9B417A0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60DB381979; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 18:54:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ddf4586b00a97c41c4ad4d50da4282c62940c05b
X-Git-Newrev: d631615eb1b833977003039626a0194589334f45
X-Patchwork-Hint: ignore
Message-Id: <20230220205250.60DB381979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: test
 check-package ignore list
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

commit: https://git.buildroot.net/buildroot/commit/?id=d631615eb1b833977003039626a0194589334f45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Extend test_check_package to also check the ignore list functionality.
Check:
- the entries in the ignore list use relative path;
- an entry in the ignore list actually ignores the warning;
- an outdated entry in the ignore list generates a warning by its own,
  preventing the ignoring list to grow indefinitely.

For this to work, add 3 test fixtures, listing entries for an
pre-existing file in the br2-external used in the test.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../tests/utils/br2-external/.checkpackageignore   |  1 +
 .../utils/br2-external/package/.checkpackageignore |  1 +
 .../package/.checkpackageignore_outdated           |  1 +
 support/testing/tests/utils/test_check_package.py  | 31 ++++++++++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/support/testing/tests/utils/br2-external/.checkpackageignore b/support/testing/tests/utils/br2-external/.checkpackageignore
new file mode 100644
index 0000000000..efb7680173
--- /dev/null
+++ b/support/testing/tests/utils/br2-external/.checkpackageignore
@@ -0,0 +1 @@
+package/external/external.mk PackageHeader
diff --git a/support/testing/tests/utils/br2-external/package/.checkpackageignore b/support/testing/tests/utils/br2-external/package/.checkpackageignore
new file mode 100644
index 0000000000..5f4a5e1187
--- /dev/null
+++ b/support/testing/tests/utils/br2-external/package/.checkpackageignore
@@ -0,0 +1 @@
+external/external.mk PackageHeader
diff --git a/support/testing/tests/utils/br2-external/package/.checkpackageignore_outdated b/support/testing/tests/utils/br2-external/package/.checkpackageignore_outdated
new file mode 100644
index 0000000000..1df59f3bed
--- /dev/null
+++ b/support/testing/tests/utils/br2-external/package/.checkpackageignore_outdated
@@ -0,0 +1 @@
+external/external.mk Indent NewlineAtEof PackageHeader
diff --git a/support/testing/tests/utils/test_check_package.py b/support/testing/tests/utils/test_check_package.py
index c70ba02324..ce1998753c 100644
--- a/support/testing/tests/utils/test_check_package.py
+++ b/support/testing/tests/utils/test_check_package.py
@@ -75,6 +75,12 @@ class TestCheckPackage(unittest.TestCase):
         generated = int(stderr[1].split()[0])
         self.assertGreater(generated, 0)
 
+    def assert_no_warnings_generated_for_file(self, stderr):
+        """Infer from check-package stderr if no warning was generated and fail otherwise."""
+        self.assertIn("warnings generated", stderr[1], stderr)
+        generated = int(stderr[1].split()[0])
+        self.assertEqual(generated, 0)
+
     def test_run(self):
         """Test the various ways the script can be called in a simple top to
         bottom sequence."""
@@ -201,3 +207,28 @@ class TestCheckPackage(unittest.TestCase):
         self.assert_file_was_processed(m)
         self.assert_warnings_generated_for_file(m)
         self.assertIn("{}:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)".format(abs_file), w)
+
+        # br2-external with ignore list
+        topdir_path = infra.filepath("tests/utils/br2-external")
+        topdir_file = os.path.join(topdir_path, "package/external/external.mk")
+        subdir_path = infra.filepath("tests/utils/br2-external/package")
+        subdir_file = os.path.join(subdir_path, "external/external.mk")
+
+        w, m = call_script(["check-package", "--ignore-list=.checkpackageignore", "-b", topdir_file],
+                           self.WITH_UTILS_IN_PATH, topdir_path)
+        self.assert_file_was_processed(m)
+        self.assert_no_warnings_generated_for_file(m)
+
+        w, m = call_script(["check-package", "--ignore-list=.checkpackageignore", "-b", subdir_file],
+                           self.WITH_UTILS_IN_PATH, subdir_path)
+        self.assert_file_was_processed(m)
+        self.assert_no_warnings_generated_for_file(m)
+
+        w, m = call_script(["check-package", "--ignore-list=.checkpackageignore_outdated", "-b", subdir_file],
+                           self.WITH_UTILS_IN_PATH, subdir_path)
+        self.assert_file_was_processed(m)
+        self.assert_warnings_generated_for_file(m)
+        self.assertIn("{}:0: Indent was expected to fail, did you fixed the file and forgot to update .checkpackageignore_outdated?"
+                      .format(subdir_file), w)
+        self.assertIn("{}:0: NewlineAtEof was expected to fail, did you fixed the file and forgot to update .checkpackageignore_outdated?"
+                      .format(subdir_file), w)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
