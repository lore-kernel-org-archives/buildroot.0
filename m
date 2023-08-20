Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EDBEE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 14:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB4BD820ED;
	Sun, 20 Aug 2023 14:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB4BD820ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id it_5ng9Jet-I; Sun, 20 Aug 2023 14:25:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6B7A820DC;
	Sun, 20 Aug 2023 14:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6B7A820DC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8614E1BF363
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EBCE414C3
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EBCE414C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BzfUyqr8mRno for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 14:25:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9DDA410A5
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 14:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9DDA410A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1C4785E31; Sun, 20 Aug 2023 14:25:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 16:25:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ba399a3ddfc3129c5334c558b52665053a932cb
X-Git-Newrev: f4da6c3ebed8ff13f6298cc7363e551a6ca0911d
X-Patchwork-Hint: ignore
Message-Id: <20230820142551.D1C4785E31@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_nftables.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=f4da6c3ebed8ff13f6298cc7363e551a6ca0911d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This runtime test was suggested in discussion [1]. It should detect
potential runtime failures such as the one fixed in commit eb74998125
"package/nftables: fix the build of the pyhon bindings".

We need a special kernel, because not all nftables-related options are
enabled in the pre-built one.

[1] https://lists.buildroot.org/pipermail/buildroot/2023-August/672864.html

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |   2 +
 support/testing/tests/package/test_nftables.py     | 109 +++++++++++++++++++++
 .../test_nftables/rootfs-overlay/root/nft.py       |  22 +++++
 3 files changed, 133 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6ffa3ee693..9b500f3701 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1776,6 +1776,8 @@ F:	support/testing/tests/package/test_lz4.py
 F:	support/testing/tests/package/test_lzop.py
 F:	support/testing/tests/package/test_mtools.py
 F:	support/testing/tests/package/test_ncdu.py
+F:	support/testing/tests/package/test_nftables.py
+F:	support/testing/tests/package/test_nftables/
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
diff --git a/support/testing/tests/package/test_nftables.py b/support/testing/tests/package/test_nftables.py
new file mode 100644
index 0000000000..142e7d0352
--- /dev/null
+++ b/support/testing/tests/package/test_nftables.py
@@ -0,0 +1,109 @@
+import os
+
+import infra.basetest
+
+
+class TestNftables(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.46"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_NFTABLES=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+                infra.filepath("tests/package/test_nftables/rootfs-overlay"))
+
+    def nftables_test(self, prog="nft"):
+        # Table/Chain names for the test
+        nft_table = "br_ip_table"
+        nft_chain = "br_ip_chain_in"
+
+        # We flush all nftables rules, to start from a known state.
+        self.assertRunOk(f"{prog} flush ruleset")
+
+        # We create an ip table.
+        self.assertRunOk(f"{prog} add table ip {nft_table}")
+
+        # We should be able to list this table.
+        list_cmd = f"{prog} list tables ip"
+        output, exit_code = self.emulator.run(list_cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertIn(nft_table, output[0])
+
+        # We create an ip input chain in our table.
+        cmd = f"{prog} add chain ip"
+        cmd += f" {nft_table} {nft_chain}"
+        cmd += " { type filter hook input priority 0 \\; }"
+        self.assertRunOk(cmd)
+
+        # We list our chain.
+        cmd = f"{prog} list chain ip {nft_table} {nft_chain}"
+        self.assertRunOk(cmd)
+
+        # We add a filter rule to drop pings (icmp echo-requests) to
+        # the 127.0.0.2 destination.
+        cmd = f"{prog} add rule ip {nft_table} {nft_chain}"
+        cmd += " ip daddr 127.0.0.2 icmp type echo-request drop"
+        self.assertRunOk(cmd)
+
+        # We list our rule.
+        self.assertRunOk(f"{prog} list ruleset ip")
+
+        # A ping to 127.0.0.1 is expected to work, because it's not
+        # matching our rule. We expect 3 replies (-c), with 0.5s
+        # internal (-i), and set a maximum timeout of 2s.
+        ping_cmd_prefix = "ping -c 3 -i 0.5 -W 2 "
+        self.assertRunOk(ping_cmd_prefix + "127.0.0.1")
+
+        # A ping to 127.0.0.2 is expected to fail, because our rule is
+        # supposed to drop it.
+        ping_test_cmd = ping_cmd_prefix + "127.0.0.2"
+        _, exit_code = self.emulator.run(ping_test_cmd)
+        self.assertNotEqual(exit_code, 0)
+
+        # We completely delete the table. This should also delete the
+        # chain and the rule.
+        self.assertRunOk(f"{prog} delete table ip {nft_table}")
+
+        # We should no longer see the table in the list.
+        output, exit_code = self.emulator.run(list_cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertNotIn(nft_table, "\n".join(output))
+
+        # Since we deleted the rule, the ping test command which was
+        # supposed to fail earlier is now supposed to succeed.
+        self.assertRunOk(ping_test_cmd)
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "256M",
+                                    "-initrd", img])
+        self.emulator.login()
+
+        # We check the program can execute.
+        self.assertRunOk("nft --version")
+
+        # We run the nftables test sequence using the default "nft"
+        # user space configuration tool.
+        self.nftables_test()
+
+        # We run again the same test sequence using our simple nft
+        # python implementation, to check the language bindings.
+        self.nftables_test(prog="/root/nft.py")
diff --git a/support/testing/tests/package/test_nftables/rootfs-overlay/root/nft.py b/support/testing/tests/package/test_nftables/rootfs-overlay/root/nft.py
new file mode 100755
index 0000000000..89de8e25d1
--- /dev/null
+++ b/support/testing/tests/package/test_nftables/rootfs-overlay/root/nft.py
@@ -0,0 +1,22 @@
+#! /usr/bin/env python3
+#
+# This is a simple reimplementation of the "nft" user-space tool in
+# Python, in order to test language bindings. It does not support any
+# command line argument supported by the nftables "nft" tool, but
+# supports all nftables commands used in the Buildroot runtime test.
+
+import sys
+
+import nftables
+
+
+nft = nftables.nftables.Nftables()
+cmd = " ".join(sys.argv[1:])
+ret_code, output, error = nft.cmd(cmd)
+
+if len(output) > 0:
+    print(output.strip())
+if len(error) > 0:
+    print(error.strip())
+
+sys.exit(ret_code)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
