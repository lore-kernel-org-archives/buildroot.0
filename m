Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E770FC47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 16:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C05840323;
	Sun, 21 Jan 2024 16:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C05840323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64bwReHwtsRa; Sun, 21 Jan 2024 16:01:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 439664057C;
	Sun, 21 Jan 2024 16:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 439664057C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF8261BF577
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 16:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8DE741498
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 16:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8DE741498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qxtr5GRjrgjH for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 16:01:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BACBB410E3
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 16:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BACBB410E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7495863DE; Sun, 21 Jan 2024 16:01:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 16:52:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c1cac10d8935f66260b8beeea776d3d49633ca4
X-Git-Newrev: 4316a4c08110da89966952bea3a37881178e296f
X-Patchwork-Hint: ignore
Message-Id: <20240121160102.A7495863DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add sed runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=4316a4c08110da89966952bea3a37881178e296f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                |   1 +
 support/testing/tests/package/test_sed.py | 118 ++++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9d2b9a11ea..9528837dd0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1818,6 +1818,7 @@ F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_screen.py
+F:	support/testing/tests/package/test_sed.py
 F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_tcl.py
 F:	support/testing/tests/package/test_tcl/
diff --git a/support/testing/tests/package/test_sed.py b/support/testing/tests/package/test_sed.py
new file mode 100644
index 0000000000..0a0fdb890a
--- /dev/null
+++ b/support/testing/tests/package/test_sed.py
@@ -0,0 +1,118 @@
+import os
+
+import infra.basetest
+
+
+class TestSed(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_SED=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def check_gnu_sed(self):
+        in_file = "testfile.txt"
+
+        # We create a test file for this test.
+        self.assertRunOk(f"echo 'This is a test' > {in_file}")
+
+        # Check we have the GNU sed by testing a GNU extension likely
+        # not present in other implementation. See:
+        # https://www.gnu.org/software/sed/manual/sed.html#Extended-Commands
+        # Note: we cannot search for "GNU sed" in sed --version,
+        # because busybox sed --version outputs: "This is not GNU sed
+        # version 4.0". The 'F' and 'Q' sed commands are known to be
+        # unimplemented in BusyBox 1.36.1.
+        expected_code = 123
+        sed_script = f"F;Q {expected_code}"
+        cmd = f"sed '{sed_script}' {in_file}"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, expected_code)
+        self.assertEqual(output, [in_file])
+
+    def check_sed_substitute(self):
+        testfile_num = 5
+
+        # We create few different test files for this test.
+        cmd = f'for i in $(seq {testfile_num}) ; do '
+        cmd += 'echo "=== $i Hello ===" > file$i.txt ; '
+        cmd += 'done'
+        self.assertRunOk(cmd)
+
+        # We reformat file content, in-place.
+        sed_script = "s/^=== \\([0-9]*\\) \\(Hello\\) ===$/\\2 \\1/"
+        cmd = f"sed -i '{sed_script}' file[0-9]*.txt"
+        self.assertRunOk(cmd)
+
+        # We substitute numbers with the string "Buildroot". We use an
+        # extended regular expression (with the '+'), so we test with
+        # the '-r' option.
+        sed_script = "s/[0-9]+/Buildroot/g"
+        cmd = f"sed -r -i '{sed_script}' file[0-9]*.txt"
+        self.assertRunOk(cmd)
+
+        # Our previous text manipulations are expected to end up with
+        # the "Hello Buildroot" string in all files.
+        cmd = "cat file[0-9]*.txt"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output, ["Hello Buildroot"] * testfile_num)
+
+    def check_sed_line_count(self):
+        # We use the '=' command to count lines.
+        line_count = 1234
+        cmd = f"seq {line_count} | sed -n '$='"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(int(output[0]), line_count)
+
+    def check_sed_line_address(self):
+        input_file = "strings.txt"
+        expected_file = "expected.txt"
+
+        # We create simple data for this test.
+        strings = ["one", "two", "three", "four", "five"]
+        content = '\\n'.join(strings)
+        cmd = f"echo -e \"{content}\" > {input_file}"
+        self.assertRunOk(cmd)
+
+        # The manipulation in this tests are expected to extract the
+        # first and last of the input. We create the expected data for
+        # comparison.
+        expected_output = [strings[0], strings[-1]]
+        content = '\\n'.join(expected_output)
+        cmd = f"echo -e \"{content}\" > {expected_file}"
+        self.assertRunOk(cmd)
+
+        # We remove lines between strings "two" and "four" included.
+        cmd = f"sed '/two/,/four/d' {input_file} > output1.txt"
+        self.assertRunOk(cmd)
+
+        # We check output is the same as the expected data.
+        cmd = f"cmp {expected_file} output1.txt"
+        self.assertRunOk(cmd)
+
+        # We redo the same manipulation using line number addresses.
+        cmd = f"sed -n '1p;5p' {input_file} > output2.txt"
+        self.assertRunOk(cmd)
+
+        # We check again output is correct.
+        cmd = f"cmp {expected_file} output2.txt"
+        self.assertRunOk(cmd)
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check the program can execute
+        self.assertRunOk("sed --version")
+
+        self.check_gnu_sed()
+        self.check_sed_substitute()
+        self.check_sed_line_count()
+        self.check_sed_line_address()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
