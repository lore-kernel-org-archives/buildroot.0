Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E37C47077
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 18:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 775BB605C9;
	Tue, 16 Jan 2024 18:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 775BB605C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wjVUjcgAr6Ts; Tue, 16 Jan 2024 18:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A96C2605E3;
	Tue, 16 Jan 2024 18:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A96C2605E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D3251BF473
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 18:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6538241C10
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 18:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6538241C10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4lhH1uYqXIC5 for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 18:35:23 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EC8941C0F
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 18:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EC8941C0F
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AFAA313F8C2;
 Tue, 16 Jan 2024 19:35:18 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 16 Jan 2024 19:35:12 +0100
Message-ID: <20240116183512.320951-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705430120;
 bh=eM5Bqw4KymRzTnGgs67aJ4Rm+oVDJCsS0nVROsgU5tw=;
 h=From:To:Cc:Subject:Date:From;
 b=WXvZ9zk++Dmq44GTXeBzp6n6odELegYDNWt9lHwPrHmJLD8KMkAvfNFhbTluQgDq3
 lO00Uebf8PsWjDfraiFD4SKBeKGplzr6bLQBUuNbtS73o4ph/HsGSo4jtuPuMDIHmX
 uPufBlzXICGp387JyLZy8YOqXquhW7Xj0dp3/Z81Jy1+ZaiQYIrKsC+P4xjxXVGej3
 1gScqhGYeDmrtgQq1xDr6WutR1IAWtEF4Xj7PLqmEPBnGlCJe4Z9lGOyMoUb0gCTC1
 H3qxGwnuVk5EtgfxVfGIbYKKpQmkw4ep30PTY48Kg6rJjZ8Lx2UHKLUzrqVgpaqkWu
 yYeNLX2hmomWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WXvZ9zk+
Subject: [Buildroot] [PATCH 1/1] support/testing: add sed runtime test
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested on branch master at commit e07402a with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_sed
    ...
    OK
---
 DEVELOPERS                                |   1 +
 support/testing/tests/package/test_sed.py | 118 ++++++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 support/testing/tests/package/test_sed.py

diff --git a/DEVELOPERS b/DEVELOPERS
index f5b04937b6..24a80b7b36 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1811,6 +1811,7 @@ F:	support/testing/tests/package/test_python_spake2.py
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
