Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2FAC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 19:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9477409ED;
	Mon,  1 Aug 2022 19:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9477409ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KhNCgJ_KQCyG; Mon,  1 Aug 2022 19:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4993F4077D;
	Mon,  1 Aug 2022 19:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4993F4077D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 99DC41BF290
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 19:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81F20400F1
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 19:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81F20400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WqzYR5ETUfnI for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 19:59:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76245400A8
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 19:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76245400A8
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3298C86BEA; Mon,  1 Aug 2022 19:45:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 21:58:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdd6fe927b8f2d99dbd0a5f5c58b92430d20e1be
X-Git-Newrev: 3a520c64f62c666df4058821932321b4d377baa6
X-Patchwork-Hint: ignore
Message-Id: <20220801194506.3298C86BEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add test for ola
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a520c64f62c666df4058821932321b4d377baa6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This test relies on the OLA Dummy plugin presenting a test device
and port.  It starts the daemon, performs few configuration commands,
covers the Python bindings and also test the OLA web interface.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_ola.py          | 95 ++++++++++++++++++++++
 .../usr/bin/sample_ola_rdm_discovery.py            | 24 ++++++
 3 files changed, 121 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 35456d9f94..cb86b7100d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1673,6 +1673,8 @@ F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/test_octave.py
+F:	support/testing/tests/package/test_ola.py
+F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_pyalsa.py
diff --git a/support/testing/tests/package/test_ola.py b/support/testing/tests/package/test_ola.py
new file mode 100644
index 0000000000..017d6f7e3b
--- /dev/null
+++ b/support/testing/tests/package/test_ola.py
@@ -0,0 +1,95 @@
+import os
+
+import infra.basetest
+
+
+class TestOla(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_OLA=y
+        BR2_PACKAGE_OLA_EXAMPLES=y
+        BR2_PACKAGE_OLA_PLUGIN_DUMMY=y
+        BR2_PACKAGE_OLA_PYTHON_BINDINGS=y
+        BR2_PACKAGE_OLA_WEB=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+           # overlay to add a script to test ola python bindings
+           infra.filepath("tests/package/test_ola/rootfs-overlay"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check program executes
+        cmd = "olad --version"
+        self.assertRunOk(cmd)
+
+        # Start the daemon and wait a bit for it to settle
+        cmd = "olad --daemon && sleep 2"
+        self.assertRunOk(cmd)
+
+        # Check dummy plugin is loaded
+        cmd = "ola_plugin_info | grep -Fi dummy"
+        self.assertRunOk(cmd)
+
+        # Check dummy device and port are listed
+        cmd = "ola_dev_info"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("Device 1: Dummy Device", output[0])
+        self.assertIn("port 0, OUT Dummy Port", output[1])
+
+        # Create Universe 0
+        cmd = "ola_patch --device 1 --port 0 --universe 0"
+        self.assertRunOk(cmd)
+
+        # Check Universe 0 is created
+        cmd = "ola_dev_info"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("patched to universe 0", output[1])
+
+        # Discover Dummy device RDM UID
+        cmd = "ola_rdm_discover --universe 0 | head -1"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        rdm_uid = output[0]
+
+        # Get RDM manufacturer_label PID
+        cmd = "ola_rdm_get --universe 0 --uid {} manufacturer_label".format(rdm_uid)
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "Open Lighting Project")
+
+        # Get RDM dmx_start_address PID, checks default value is 1
+        cmd = "ola_rdm_get --universe 0 --uid {} dmx_start_address".format(rdm_uid)
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "DMX Address: 1")
+
+        # Set RDM dmx_start_address PID to 2
+        cmd = "ola_rdm_set --universe 0 --uid {} dmx_start_address 2".format(rdm_uid)
+        self.assertRunOk(cmd)
+
+        # Get the new RDM dmx_start_address PID, checks value is now 2
+        cmd = "ola_rdm_get --universe 0 --uid {} dmx_start_address".format(rdm_uid)
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "DMX Address: 2")
+
+        # Perform a full RDM discovery using python bindings. The test
+        # expect to find the same UID detected with the C client.
+        cmd = "sample_ola_rdm_discovery.py | head -1"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], rdm_uid)
+
+        # Test olad web interface
+        cmd = "wget -q -O - http://127.0.0.1:9090/ola.html | grep -F '<title>OLA Admin</title>'"
+        self.assertRunOk(cmd)
diff --git a/support/testing/tests/package/test_ola/rootfs-overlay/usr/bin/sample_ola_rdm_discovery.py b/support/testing/tests/package/test_ola/rootfs-overlay/usr/bin/sample_ola_rdm_discovery.py
new file mode 100755
index 0000000000..c2aa0733bb
--- /dev/null
+++ b/support/testing/tests/package/test_ola/rootfs-overlay/usr/bin/sample_ola_rdm_discovery.py
@@ -0,0 +1,24 @@
+#! /usr/bin/env python3
+
+import sys
+
+from ola.ClientWrapper import ClientWrapper
+
+
+def show_uids(state, uids):
+    if state.Succeeded():
+        for uid in uids:
+            print(str(uid))
+    else:
+        print('Error: %s' % state.message, file=sys.stderr)
+    wrapper.Stop()
+
+
+wrapper = ClientWrapper()
+client = wrapper.Client()
+universe = 0
+full_discovery = True
+
+client.RunRDMDiscovery(universe, full_discovery, show_uids)
+
+wrapper.Run()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
