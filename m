Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A326DC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 13:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B5934028C;
	Thu, 15 Aug 2024 13:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hv426VMogUXB; Thu, 15 Aug 2024 13:57:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCFBA40268
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCFBA40268;
	Thu, 15 Aug 2024 13:57:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B1191BF2A2
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 13:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04F6540268
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 13:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBrxdW0V81ae for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 13:57:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2EA0840248
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EA0840248
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EA0840248
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 13:57:09 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A2EE6B0053D;
 Thu, 15 Aug 2024 15:57:05 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 15:56:49 +0200
Message-ID: <20240815135649.462812-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723730226;
 bh=bSJQ86xki9Pex6bztMSynPDmxq0j5UJNKp0a1ZjCi/Y=;
 h=From:To:Cc:Subject:Date:From;
 b=UfzSB7hXI6HObhhIW6Ahym6w8eYOV7+yJ3lijp4MZdEEo9qwwbwik3ZgD7K8tR2P4
 3KdfwTeqTjkeLnY3kUEsga5XWABR4gNwNKO9/BWqSod/6J1EfOrpsY7XOQmohaEYSI
 I/X8HvcXexbIdtkQUiSsxPZc4ZI3sO4suQzdJQSpAJsG7gKUwkR7R7jHapLDNxouli
 itiTE3hH8Hif5VSmQgNkgzErdJqPhUYbnl+sclUMyHPaoDBSXbq7Pl01CKqE1jKD4X
 c0wtzOqyhwZjHosEFF143qeTzFiMcOsHgMRI+LAhgMcXem9KjAaVUY4tRBMf7cLmZZ
 QIlB3MWkogfyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UfzSB7hX
Subject: [Buildroot] [PATCH 1/1] support/testing: add unbound runtime test
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
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/7592103034
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_unbound.py | 79 +++++++++++++++++++
 .../rootfs-overlay/etc/unbound/unbound.conf   | 17 ++++
 3 files changed, 98 insertions(+)
 create mode 100644 support/testing/tests/package/test_unbound.py
 create mode 100644 support/testing/tests/package/test_unbound/rootfs-overlay/etc/unbound/unbound.conf

diff --git a/DEVELOPERS b/DEVELOPERS
index d7d0af3543..f4cf7a27b0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1967,6 +1967,8 @@ F:	support/testing/tests/package/test_tesseract_ocr.py
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
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
