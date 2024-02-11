Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9BBC4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 10:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B88560782;
	Sun, 11 Feb 2024 10:12:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7R56td-naJ3m; Sun, 11 Feb 2024 10:12:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2E6360653
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2E6360653;
	Sun, 11 Feb 2024 10:12:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9355C1BF36E
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 10:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80297407B0
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 10:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YNBeu94UEV51 for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 10:12:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0586C407AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0586C407AF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0586C407AF
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 10:12:22 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0754413F88D;
 Sun, 11 Feb 2024 11:12:18 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 11:12:12 +0100
Message-ID: <20240211101212.171127-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707646340;
 bh=p1eSF8ERSJkWW1kUHnNzWHPcime7Sh5dimKT6+xD3nU=;
 h=From:To:Cc:Subject:Date:From;
 b=RL2w0VohHT0794GlaLnFDPFPwKq4lrVv8ow+jwSvtgmFljV/jjxSCuAmvnd64jtm+
 iYwHewnsZ8TwYEbQbEsvl6YqiIXYXKjuphKqq4JBflOPDR7dQcTBTwqx00V+E3K55g
 LnXsK5DaZkTM6LFwBw9m11yX8JenZJ7t3qXffMfd1hss7vyc5i/B3un0bpFs4IXcNQ
 eWLkfqrlPgkSPdhhRap/ZWGq3t5Tf5TCI92yclpm2N9YQwdeIP3yFWs0nT5oZzKxld
 Qh6bCneGV5pREgsCQo55QTCpsXu7caqGosrlO/o3p9QeiAVgj0WewNAGZG6VXOhXUT
 J4RtEEUdyAZNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RL2w0Voh
Subject: [Buildroot] [PATCH 1/1] support/testing: add jailhouse runtime test
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
 DEVELOPERS                                    |   1 +
 .../testing/tests/package/test_jailhouse.py   | 103 ++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 support/testing/tests/package/test_jailhouse.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c6c84b05b..1826fd59c6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1792,6 +1792,7 @@ F:	support/testing/tests/package/test_gzip.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_iperf3.py
+F:	support/testing/tests/package/test_jailhouse.py
 F:	support/testing/tests/package/test_jq.py
 F:	support/testing/tests/package/test_jq/
 F:	support/testing/tests/package/test_kexec.py
diff --git a/support/testing/tests/package/test_jailhouse.py b/support/testing/tests/package/test_jailhouse.py
new file mode 100644
index 0000000000..4634fc4de2
--- /dev/null
+++ b/support/testing/tests/package/test_jailhouse.py
@@ -0,0 +1,103 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestJailhouse(infra.basetest.BRTest):
+    # This test uses a specific configuration, mainly for matching the
+    # requirements of the Jailhouse Qemu inmate demo. We also use the
+    # Linux kernel from Siemens, which includes patches for
+    # Jailhouse. Finally, we use the kernel config from
+    # board/qemu/aarch64-virt rather than the Kernel defconfig, for
+    # faster build (as it enable less components, but includes
+    # everything needed for this test).
+    kernel_ver = "eb6927f7eea77f823b96c0c22ad9d4a2d7ffdfce"
+    kernel_url = \
+        f"$(call github,siemens,linux,{kernel_ver})/linux-{kernel_ver}.tar.gz"
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+        BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="{kernel_url}"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_JAILHOUSE=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "Image")
+        # Qemu option and Kernel args are taken from Jailhouse demo. See:
+        # https://github.com/siemens/jailhouse/blob/master/README.md
+        # We also add oops=panic to improve the test coverage.
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyAMA0 mem=768M oops=panic"],
+                           options=["-M", "virt,gic-version=3,virtualization=on,its=off",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "1G",
+                                    "-smp", "16",
+                                    "-drive", f"file={drive},if=none,format=raw,id=hd0",
+                                    "-device", "virtio-blk-device,drive=hd0"])
+        self.emulator.login()
+
+        # Check the program can execute.
+        self.assertRunOk("jailhouse --version")
+
+        # Load the kernel module.
+        self.assertRunOk("modprobe jailhouse")
+
+        # Check the device is present.
+        self.assertRunOk("ls -al /dev/jailhouse")
+
+        # Load the cell config this this qemu test.
+        self.assertRunOk("jailhouse enable /etc/jailhouse/qemu-arm64.cell")
+
+        # Dump the jailhouse console, and check we see its
+        # initialization string.
+        out, ret = self.emulator.run("jailhouse console")
+        self.assertEqual(ret, 0)
+        self.assertIn("Initializing Jailhouse hypervisor", "\n".join(out))
+
+        # Create the cell.
+        cell_cfg = "/etc/jailhouse/qemu-arm64-inmate-demo.cell"
+        cmd = f"jailhouse cell create {cell_cfg}"
+        self.assertRunOk(cmd)
+
+        # Load the demo image.
+        cell_name = "inmate-demo"
+        img = "/usr/libexec/jailhouse/demos/gic-demo.bin"
+        cmd = f"jailhouse cell load {cell_name} {img}"
+        self.assertRunOk(cmd)
+
+        # List Jailhouse cells and check we see the one we loaded.
+        out, ret = self.emulator.run("jailhouse cell list")
+        self.assertEqual(ret, 0)
+        self.assertIn(cell_name, "\n".join(out))
+
+        # We should also see our cell in sysfs.
+        cmd = "cat /sys/devices/jailhouse/cells/1/name"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], cell_name)
+
+        # Start the cell.
+        self.assertRunOk(f"jailhouse cell start {cell_name}")
+
+        # Let the demo cell run for few seconds...
+        time.sleep(3)
+
+        # Stop and unload the cell.
+        self.assertRunOk(f"jailhouse cell shutdown {cell_name}")
+        self.assertRunOk(f"jailhouse cell destroy {cell_name}")
+
+        # Stop and unload jailhouse.
+        self.assertRunOk("jailhouse disable")
+        self.assertRunOk("modprobe -r jailhouse")
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
