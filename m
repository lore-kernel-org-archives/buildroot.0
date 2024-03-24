Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C77CC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 18:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBF1E81ABB;
	Sun, 24 Mar 2024 18:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-SLgVOMb7TO; Sun, 24 Mar 2024 18:30:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD52781357
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD52781357;
	Sun, 24 Mar 2024 18:30:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 34C5A1BF364
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 18:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 206BD40596
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 18:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKpok-uRtsZy for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 18:30:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C0D2840592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0D2840592
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0D2840592
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 18:30:53 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B43D2B00583;
 Sun, 24 Mar 2024 19:30:48 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 19:30:38 +0100
Message-ID: <20240324183038.157041-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711305050;
 bh=UHHltX4PpFi9ClY5wzXOCfqyexsxwexwzXEcn2b/v8s=;
 h=From:To:Cc:Subject:Date:From;
 b=DtzurgLK65EVaJGdBQWVjl12npJU1jNpwBaCTBKGElRMbLSilhFMvofsOL72slTCz
 /M8tQHRYDOfeADjDxqVxb+TjIIM88SisDPr5nWF/KFPHdzo98EeIjWQiuuLoQBQlve
 Rx43oWbbVP00GNJvE+SWPHylFCD90P1d+dEXIxYH5WN8eP7dxJZkbVsMEOsPUZ8L5x
 wTni+YZE7a3tYn6U7gq5V1mUtbYPU58A/txi0y/J3k4/rR2Vf/mU2YpQJjHSqAFBhk
 mlLP/hJPCzmKUUqsyYcIhoVq6+F6y0DJUnuHEipSqCzgYuN6cH3oSIk/fu1gxhqlmq
 1SkCWcTBv6Z5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DtzurgLK
Subject: [Buildroot] [PATCH 1/1] support/testing: add gnuplot runtime test
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
 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_gnuplot.py | 73 +++++++++++++++++++
 .../rootfs-overlay/root/gnuplot-test.plot     |  4 +
 3 files changed, 79 insertions(+)
 create mode 100644 support/testing/tests/package/test_gnuplot.py
 create mode 100644 support/testing/tests/package/test_gnuplot/rootfs-overlay/root/gnuplot-test.plot

diff --git a/DEVELOPERS b/DEVELOPERS
index cb2132e67ae..42f6a5e802d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1792,6 +1792,8 @@ F:	support/testing/tests/package/test_ghostscript/
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
index 00000000000..a2255405373
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
index 00000000000..04046be04b3
--- /dev/null
+++ b/support/testing/tests/package/test_gnuplot/rootfs-overlay/root/gnuplot-test.plot
@@ -0,0 +1,4 @@
+set term dumb
+set output "gnuplot-test.txt"
+set title "Buildroot Test Plot"
+plot sin(x)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
