Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38780D32D9F
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 12:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 055D56078B;
	Tue, 12 Nov 2024 12:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wv7g25Uuxt9; Tue, 12 Nov 2024 12:34:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0A8E607A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0A8E607A8;
	Tue, 12 Nov 2024 12:34:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63129DB1
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 12:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A225404DD
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 12:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-dFhSF602BF for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 12:34:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B86D4064E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B86D4064E
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 12:34:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 008638615B; Tue, 12 Nov 2024 12:34:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Nov 2024 13:34:01 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 312984bdbd044549cc36504e01ba3b60c94ed6f1
X-Git-Newrev: 0b32232cdeee7883a930e6f676fbc2d5a31d0cfe
X-Patchwork-Hint: ignore
Message-Id: <20241112123444.008638615B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] support/testing: add
 unbound runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b32232cdeee7883a930e6f676fbc2d5a31d0cfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 04c91340ffefbfd7d4293e6e0b5e40a0e10c48b8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_unbound.py      | 79 ++++++++++++++++++++++
 .../rootfs-overlay/etc/unbound/unbound.conf        | 17 +++++
 3 files changed, 98 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 45ecd60011..d6a50192f5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1959,6 +1959,8 @@ F:	support/testing/tests/package/test_tesseract_ocr.py
 F:	support/testing/tests/package/test_thttpd.py
 F:	support/testing/tests/package/test_trace_cmd.py
 F:	support/testing/tests/package/test_trace_cmd/
+F:	support/testing/tests/package/test_unbound.py
+F:	support/testing/tests/package/test_unbound/
 F:	support/testing/tests/package/test_usbutils.py
 F:	support/testing/tests/package/test_usbutils/
 F:	support/testing/tests/package/test_vorbis_tools.py
diff --git a/support/testing/tests/package/test_unbound.py b/support/testing/tests/package/test_unbound.py
new file mode 100644
index 0000000000..c92719badc
--- /dev/null
+++ b/support/testing/tests/package/test_unbound.py
@@ -0,0 +1,79 @@
+import os
+
+import infra.basetest
+
+
+class TestUnbound(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_unbound/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_UNBOUND=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check the program can execute.
+        self.assertRunOk("unbound -V")
+
+        # Verify that the configuration checker validates our file.
+        self.assertRunOk("unbound-checkconf")
+
+        # Our test configuration enabled the unbound remote
+        # control. The unbound server is supposed to be started by the
+        # sysv initscript. We should see the already running server.
+        out, ret = self.emulator.run("unbound-control status")
+        self.assertEqual(ret, 0)
+        self.assertRegex("\n".join(out), r"unbound \(pid \d+\) is running")
+
+        # We check the "unbound-host" program is working with a simple
+        # query. Note: this local query succeed even if the unbound
+        # server is not running. We are only testing this program
+        # here. The server side will be tested with the BusyBox
+        # "nslookup" applet.
+        out, ret = self.emulator.run("unbound-host -t A localhost.")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "localhost. has address 127.0.0.1")
+
+        # We test few other "unbound-control" commands.
+        self.assertRunOk("unbound-control stats")
+        self.assertRunOk("unbound-control list_local_zones")
+
+        # We check we see our test IPv4 address record.
+        cmd = "nslookup -type=A somehost.buildroot.test."
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertIn("Address: 10.20.30.40", out)
+
+        # We also check we see our reverse record.
+        cmd = "nslookup 10.20.30.40"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        expected = "40.30.20.10.in-addr.arpa\tname = somehost.buildroot.test"
+        self.assertIn(expected, out)
+
+        # We check we see our test text record.
+        cmd = "nslookup -type=TXT sometext.buildroot.test."
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        expected = "sometext.buildroot.test\ttext = \"Hello Buildroot TXT\""
+        self.assertIn(expected, out)
+
+        # We add a new record with unbound-control.
+        record_data = "someotherhost.buildroot.test. IN A 10.99.99.99"
+        cmd = f"unbound-control local_data \"{record_data}\""
+        self.assertRunOk(cmd)
+
+        # We check we see our new IPv4 address record.
+        cmd = "nslookup -type=A someotherhost.buildroot.test."
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertIn("Address: 10.99.99.99", out)
diff --git a/support/testing/tests/package/test_unbound/rootfs-overlay/etc/unbound/unbound.conf b/support/testing/tests/package/test_unbound/rootfs-overlay/etc/unbound/unbound.conf
new file mode 100644
index 0000000000..4f8202d127
--- /dev/null
+++ b/support/testing/tests/package/test_unbound/rootfs-overlay/etc/unbound/unbound.conf
@@ -0,0 +1,17 @@
+#
+# Unbound configuration file for Buildroot runtime test.
+#
+
+server:
+	do-ip6: no
+	local-zone: "test." nodefault
+	local-zone: "10.in-addr.arpa." nodefault
+	private-domain: "buildroot.test"
+	local-zone: "buildroot.test" static
+	local-data: "somehost.buildroot.test. IN A 10.20.30.40"
+	local-data: 'sometext.buildroot.test. TXT "Hello Buildroot TXT"'
+	local-data-ptr: "10.20.30.40 somehost.buildroot.test"
+
+remote-control:
+	control-enable: yes
+	control-use-cert: no
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
