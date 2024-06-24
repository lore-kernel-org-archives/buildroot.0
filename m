Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B142C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 22:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 816EF4089D;
	Mon, 24 Jun 2024 22:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GDejZuft5bBk; Mon, 24 Jun 2024 22:50:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 063084056A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 063084056A;
	Mon, 24 Jun 2024 22:50:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 57FFC1BF267
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 22:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44C894056A
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 22:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHDuVK8lbmAW for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 22:50:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 43A9C4054C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43A9C4054C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43A9C4054C
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 22:50:10 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 55239B0055A;
 Tue, 25 Jun 2024 00:50:06 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jun 2024 00:49:58 +0200
Message-ID: <20240624224958.309140-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719269407;
 bh=0gbDnSUlAa2vegwHDkNmEaMQobO7gMfl2IImQ3Aw4Wg=;
 h=From:To:Cc:Subject:Date:From;
 b=YAlXyObPztCa54ucS2BOr3jnNH7MrLwwKqJOpPNHtueRF5OBsRWAKcuh65ZaIMgw5
 MiPSaJzVeO/hurzJ4neaaBjUu049fQQwc55sOz6hlDQTSiLbpHtMj427DzYgAmw7ic
 I/ANNW76uY0GV8KaQYQ7ui7ohhevxteNXbotnxDf2c800Q3zqk7PHJZy60kp6qSEVQ
 PgN7DPE2O6K7FSlKBtRxxcteAWr1wQGzU33QCqAiFuanzDfI23Oz26U8P7M0PBDvN3
 eF6QbF96AceeddmoE5TI0+be/HLczfhK9mwuiSa9/tIJs1erYrVyrGutk8M72jSsJD
 7/T5Ly6VOSm9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YAlXyObP
Subject: [Buildroot] [PATCH 1/1] support/testing: add kmod runtime test
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
 support/testing/tests/package/test_kmod.py    | 97 +++++++++++++++++++
 .../test_kmod/linux-virtio-net.fragment       |  1 +
 3 files changed, 100 insertions(+)
 create mode 100644 support/testing/tests/package/test_kmod.py
 create mode 100644 support/testing/tests/package/test_kmod/linux-virtio-net.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 8a5cceba78e..4a05f68897e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1839,6 +1839,8 @@ F:	support/testing/tests/package/test_jq.py
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
index 00000000000..1d9ea535fc8
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
index 00000000000..170da19d65d
--- /dev/null
+++ b/support/testing/tests/package/test_kmod/linux-virtio-net.fragment
@@ -0,0 +1 @@
+CONFIG_VIRTIO_NET=m
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
