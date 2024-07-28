Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3CFC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 07:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 474FE605C1;
	Sun, 28 Jul 2024 07:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_n5NqpBt4Yi; Sun, 28 Jul 2024 07:28:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F5C1605C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F5C1605C7;
	Sun, 28 Jul 2024 07:28:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BE7D1BF32E
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 07:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58DEB404E3
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 07:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9nbXtJKxBrQ for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 07:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE5CF404DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE5CF404DC
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 07:28:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 585F187420; Sun, 28 Jul 2024 07:28:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 09:23:11 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 189d9d965c1b86b4e3f6403657133db8a24c3e18
X-Git-Newrev: f5b363058bafce761daf36139b2fcd30b2ae4c92
X-Patchwork-Hint: ignore
Message-Id: <20240728072816.585F187420@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add kmod
 runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5b363058bafce761daf36139b2fcd30b2ae4c92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 48790b43296f45aa7f9f8c6701e94fe86269c241)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_kmod.py         | 97 ++++++++++++++++++++++
 .../package/test_kmod/linux-virtio-net.fragment    |  1 +
 3 files changed, 100 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index af1749b23b..7c4a5f4501 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1805,6 +1805,8 @@ F:	support/testing/tests/package/test_jq.py
 F:	support/testing/tests/package/test_jq/
 F:	support/testing/tests/package/test_kexec.py
 F:	support/testing/tests/package/test_kexec/
+F:	support/testing/tests/package/test_kmod.py
+F:	support/testing/tests/package/test_kmod/
 F:	support/testing/tests/package/test_kmscube.py
 F:	support/testing/tests/package/test_kmscube/
 F:	support/testing/tests/package/test_less.py
diff --git a/support/testing/tests/package/test_kmod.py b/support/testing/tests/package/test_kmod.py
new file mode 100644
index 0000000000..1d9ea535fc
--- /dev/null
+++ b/support/testing/tests/package/test_kmod.py
@@ -0,0 +1,97 @@
+import os
+
+import infra.basetest
+
+
+class TestKmod(infra.basetest.BRTest):
+    # This test uses the "virtio_net" driver compiled as a module. We
+    # need to recompile a Kernel for that.
+    kernel_fragment = \
+        infra.filepath("tests/package/test_kmod/linux-virtio-net.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.35"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_KMOD=y
+        BR2_PACKAGE_KMOD_TOOLS=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "256M",
+                                    "-drive", f"file={drive},if=virtio,format=raw"])
+        self.emulator.login()
+
+        # We check the kmod program can run. Busybox does not have a
+        # kmod applet, so there is no possible confusion.
+        self.assertRunOk("kmod --version")
+
+        # We check the "modprobe" is the one from kmod, rather than
+        # the Busybox applet version.
+        out, ret = self.emulator.run("modprobe --version")
+        self.assertEqual(ret, 0)
+        self.assertTrue(out[0].startswith("kmod version"))
+
+        # List modules with "kmod list", the virtio-net module should
+        # NOT be loaded yet.
+        out, ret = self.emulator.run("kmod list")
+        self.assertEqual(ret, 0)
+        self.assertNotIn("virtio_net", "\n".join(out))
+
+        # Get module info with modinfo.
+        out, ret = self.emulator.run("modinfo virtio-net")
+        self.assertEqual(ret, 0)
+        lsmod_out = "\n".join(out)
+        self.assertRegex(lsmod_out, r'name: *virtio_net')
+        self.assertRegex(lsmod_out, r'description: *Virtio network driver')
+
+        # With this test configuration, we are not supposed to have an
+        # eth0 Ethernet interface yet. Attempting to show info on this
+        # interface is expected to fail .
+        _, ret = self.emulator.run("ip link show dev eth0")
+        self.assertNotEqual(ret, 0)
+
+        # We try to load the module.
+        self.assertRunOk("modprobe virtio-net")
+
+        # We should now see the module in the list. This time, we use
+        # the "lsmod" command.
+        out, ret = self.emulator.run("lsmod")
+        self.assertEqual(ret, 0)
+        self.assertIn("virtio_net", "\n".join(out))
+
+        # The eth0 interface is supposed to be available, after the
+        # module loading. We configure the emulator user network to
+        # test the driver networking functionality. See:
+        # https://wiki.qemu.org/Documentation/Networking
+        self.assertRunOk("ip addr add dev eth0 10.0.2.15/24")
+        self.assertRunOk("ip link set dev eth0 up")
+
+        # We check we can ping the emulator.
+        ping_cmd = "ping -i 0.3 -c 2 10.0.2.2"
+        self.assertRunOk(ping_cmd)
+
+        # We check we can unload the driver.
+        self.assertRunOk("modprobe -r virtio-net")
+
+        # Now the driver is unloaded, we should no longer be able to
+        # ping the emulator.
+        _, ret = self.emulator.run(ping_cmd)
+        self.assertNotEqual(ret, 0)
diff --git a/support/testing/tests/package/test_kmod/linux-virtio-net.fragment b/support/testing/tests/package/test_kmod/linux-virtio-net.fragment
new file mode 100644
index 0000000000..170da19d65
--- /dev/null
+++ b/support/testing/tests/package/test_kmod/linux-virtio-net.fragment
@@ -0,0 +1 @@
+CONFIG_VIRTIO_NET=m
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
