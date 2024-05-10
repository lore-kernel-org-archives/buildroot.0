Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD226C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 12:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BAD342A7A;
	Fri, 10 May 2024 12:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzcqLDMkjHuz; Fri, 10 May 2024 12:04:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF1964056F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF1964056F;
	Fri, 10 May 2024 12:04:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AEF71BF3DC
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 12:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 668FE8425B
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 12:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSAvUVI6K6YG for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 12:04:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3214984235
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3214984235
 for <buildroot@buildroot.org>; Fri, 10 May 2024 12:04:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2126E86E9E; Fri, 10 May 2024 12:04:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 14:03:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91848e73ae6f5ad6ca0568f8e7309247379e51f1
X-Git-Newrev: 92ae6d75c164e2665d6410de2b1d14babfc0eec6
X-Patchwork-Hint: ignore
Message-Id: <20240510120423.2126E86E9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add gnuplot runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=92ae6d75c164e2665d6410de2b1d14babfc0eec6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_gnuplot.py      | 73 ++++++++++++++++++++++
 .../rootfs-overlay/root/gnuplot-test.plot          |  4 ++
 3 files changed, 79 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 61bededd7d..11b413e95a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1815,6 +1815,8 @@ F:	support/testing/tests/package/test_ghostscript/
 F:	support/testing/tests/package/test_glslsandbox_player.py
 F:	support/testing/tests/package/test_glslsandbox_player/
 F:	support/testing/tests/package/test_gnupg2.py
+F:	support/testing/tests/package/test_gnuplot.py
+F:	support/testing/tests/package/test_gnuplot/
 F:	support/testing/tests/package/test_gnuradio.py
 F:	support/testing/tests/package/test_gnuradio/
 F:	support/testing/tests/package/test_gzip.py
diff --git a/support/testing/tests/package/test_gnuplot.py b/support/testing/tests/package/test_gnuplot.py
new file mode 100644
index 0000000000..a225540537
--- /dev/null
+++ b/support/testing/tests/package/test_gnuplot.py
@@ -0,0 +1,73 @@
+import os
+
+import infra.basetest
+
+
+class TestGnuplot(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_gnuplot/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_GNUPLOT=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def gen_gnuplot_cmd(self, gpcmd):
+        return f"gnuplot -e '{gpcmd}'"
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # We check the program can run.
+        self.assertRunOk("gnuplot --version")
+
+        # When the locale is C, Gnuplot print the warning:
+        # "line 0: warning: iconv failed to convert degree sign"
+        # We set the locale to avoid this warning.
+        self.assertRunOk('export LC_ALL="en_US.UTF-8"')
+
+        # We check Gnuplot can print a string.
+        string = "Hello Buildroot !"
+        cmd = self.gen_gnuplot_cmd(f'print "{string}"')
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], string)
+
+        # We check Gnuplot can do a simple arithmetic operation.
+        op1 = 123
+        op2 = 456
+        expected_result = op1 * op2
+        cmd = self.gen_gnuplot_cmd(f"print {op1} * {op2}")
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(int(out[0]), expected_result)
+
+        # We check Gnuplot can return a specific exit code.
+        exit_code = 123
+        cmd = self.gen_gnuplot_cmd(f"exit status {exit_code}")
+        _, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, exit_code)
+
+        # We render a simple plot on the terminal.
+        gpcmd = "set term dumb; set grid; plot [-5:5] x**2;"
+        cmd = self.gen_gnuplot_cmd(gpcmd)
+        self.assertRunOk(cmd)
+
+        # We check a Gnuplot script executes correctly.
+        cmd = "gnuplot /root/gnuplot-test.plot"
+        self.assertRunOk(cmd)
+
+        # Our Gnuplot script is supposed to have generated a text
+        # output of the plot. We check this file contains the plot
+        # title set in the script.
+        exp_str = "Buildroot Test Plot"
+        cmd = f"grep -Fo '{exp_str}' /root/gnuplot-test.txt"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], exp_str)
diff --git a/support/testing/tests/package/test_gnuplot/rootfs-overlay/root/gnuplot-test.plot b/support/testing/tests/package/test_gnuplot/rootfs-overlay/root/gnuplot-test.plot
new file mode 100644
index 0000000000..04046be04b
--- /dev/null
+++ b/support/testing/tests/package/test_gnuplot/rootfs-overlay/root/gnuplot-test.plot
@@ -0,0 +1,4 @@
+set term dumb
+set output "gnuplot-test.txt"
+set title "Buildroot Test Plot"
+plot sin(x)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
