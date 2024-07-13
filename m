Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7713FC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 17:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE1BE607A1;
	Sat, 13 Jul 2024 17:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Sb7gXYx8Unx; Sat, 13 Jul 2024 17:32:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 612B660759
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 612B660759;
	Sat, 13 Jul 2024 17:32:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E3F51BF403
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 17:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 567D9401B2
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 17:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yf8pIj0oPUd3 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 17:32:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4C01401AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4C01401AD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4C01401AD
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 17:32:02 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DB5FCB00576;
 Sat, 13 Jul 2024 19:31:58 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 19:31:49 +0200
Message-ID: <20240713173149.346681-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720891920;
 bh=2cA1KskdvBvgMlQhEI9j4ZEspf0YtNAFJGGFhs1nRUM=;
 h=From:To:Cc:Subject:Date:From;
 b=JmlpzFfqHecbWXE5LTcYIsTayQiCQFO3bSdjrU0uHIbzkgwCI9ME+kP0dNdjZENHz
 DUmt+HUTEP9EPigeEVRTRV/kltmFxxVFQp4RV/B9S0ZPcm/nwmkduh+YcLn2QHP2KB
 H3L8Adl70mG5/TG7nKK3HhAFYeJeSWKp1o8ckUrNRoAGxqYtg8gm4CBheZL7ULreF4
 KeNrv7bfaFtG3xvHZp8mfiQVxyI1lgqXE/bIOTAqauY9N1iGY0PSqFtFJeFx5dywUr
 K+MnUCNXO4Bqbvze++3/aEObHiA0lQgye8nAE1JLXMckgis+Qp+hMu9PGDdjyrdwi/
 ZZ45Jokbop2VA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JmlpzFfq
Subject: [Buildroot] [PATCH 1/1] support/testing: new btrfs-progs runtime
 test
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
 DEVELOPERS                                    |   2 +
 .../testing/tests/package/test_btrfs_progs.py | 127 ++++++++++++++++++
 .../test_btrfs_progs/linux-btrfs.fragment     |   1 +
 3 files changed, 130 insertions(+)
 create mode 100644 support/testing/tests/package/test_btrfs_progs.py
 create mode 100644 support/testing/tests/package/test_btrfs_progs/linux-btrfs.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index fe3247273e..c62ba1c8db 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1816,6 +1816,8 @@ F:	support/testing/tests/package/test_bcc.py
 F:	support/testing/tests/package/test_bcc/
 F:	support/testing/tests/package/test_bitcoin.py
 F:	support/testing/tests/package/test_brotli.py
+F:	support/testing/tests/package/test_btrfs_progs.py
+F:	support/testing/tests/package/test_btrfs_progs/
 F:	support/testing/tests/package/test_bzip2.py
 F:	support/testing/tests/package/test_compressor_base.py
 F:	support/testing/tests/package/test_coremark.py
diff --git a/support/testing/tests/package/test_btrfs_progs.py b/support/testing/tests/package/test_btrfs_progs.py
new file mode 100644
index 0000000000..a53efa9438
--- /dev/null
+++ b/support/testing/tests/package/test_btrfs_progs.py
@@ -0,0 +1,127 @@
+import os
+import subprocess
+
+import infra.basetest
+
+
+class TestBtrfsProgs(infra.basetest.BRTest):
+    # This test needs a Kernel with btrfs support.
+    kern_frag = \
+        infra.filepath("tests/package/test_btrfs_progs/linux-btrfs.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.39"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_BTRFS_PROGS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        # Prepare the disk image.
+        disk_file = os.path.join(self.builddir, "images", "disk.img")
+        self.emulator.logfile.write(f"Creating disk image: {disk_file}")
+        self.emulator.logfile.flush()
+        subprocess.check_call(
+            ["dd", "if=/dev/zero", f"of={disk_file}", "bs=1M", "count=256"],
+            stdout=self.emulator.logfile,
+            stderr=self.emulator.logfile)
+
+        # Run the emulator with a blank drive.
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        bootargs = ["console=ttyAMA0"]
+        qemu_opts = ["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                     "-initrd", img,
+                     "-drive", f"file={disk_file},if=virtio,format=raw"]
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=bootargs,
+                           options=qemu_opts)
+        self.emulator.login()
+
+        # Check a program can run and show its version.
+        self.assertRunOk("btrfs --version")
+
+        # Variables for this test.
+        dev = "/dev/vda"
+        label = "BR_TEST"
+        mnt_pt = "/tmp/btrfs"
+        data_file = f"{mnt_pt}/data.bin"
+        txt = "Hello Buildroot!"
+        subvol = f"{mnt_pt}/my-subvolume"
+        snapshot = f"{mnt_pt}/my-snapshot"
+
+        # We create the btrfs filesystem on our device.
+        self.assertRunOk(f"mkfs.btrfs {dev}", timeout=10)
+
+        # We set a label on this filesystem.
+        self.assertRunOk(f"btrfs filesystem label {dev} '{label}'")
+
+        # We create a mount point and mount this filesystem.
+        self.assertRunOk(f"mkdir -p {mnt_pt}")
+        self.assertRunOk(f"mount {dev} {mnt_pt}")
+
+        # We create a file with random data, to use this new
+        # filesystem a bit.
+        self.assertRunOk(f"dd if=/dev/urandom of={data_file} bs=1M count=10")
+
+        # We compute the sha256 hash and save it for later.
+        hash_cmd = f"sha256sum {data_file}"
+        out, ret = self.emulator.run(hash_cmd)
+        self.assertEqual(ret, 0)
+        data_sha256 = out[0]
+
+        # We unmount the filesystem.
+        self.assertRunOk(f"umount {mnt_pt}")
+
+        # We run a filesystem check (this tool is the equivalent of
+        # "fsck"). Since we cleanly unmounted the filesystem,
+        # we are not expecting any repair. This is just to test the
+        # program works correctly.
+        self.assertRunOk(f"btrfs check {dev}")
+
+        # We query the label and check it is the one we set at the
+        # beginning.
+        out, ret = self.emulator.run(f"btrfs filesystem label {dev}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], label)
+
+        # We remount our filesystem.
+        self.assertRunOk(f"mount {dev} {mnt_pt}")
+
+        # We perform a scrub in foreground.
+        self.assertRunOk(f"btrfs scrub start -B {mnt_pt}")
+
+        # We show device usage and statistics.
+        self.assertRunOk(f"btrfs device usage {mnt_pt}")
+        self.assertRunOk(f"btrfs device stats {mnt_pt}")
+
+        # We create a btrfs subvolume and create a file in it.
+        self.assertRunOk(f"btrfs subvolume create {subvol}")
+        self.assertRunOk(f"echo '{txt}' > {subvol}/file.txt")
+
+        # We create a read-only snapshot of this subvolume and we
+        # delete our file previously created.
+        self.assertRunOk(f"btrfs subvolume snapshot -r {subvol} {snapshot}")
+        self.assertRunOk(f"rm -f {subvol}/file.txt")
+
+        # We should still see our file in our snapshot.
+        out, ret = self.emulator.run(f"cat {snapshot}/file.txt")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], txt)
+
+        # We should recompute the same sha256 hash as before, on the
+        # first data file we created at the beginning.
+        out, ret = self.emulator.run(hash_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], data_sha256)
diff --git a/support/testing/tests/package/test_btrfs_progs/linux-btrfs.fragment b/support/testing/tests/package/test_btrfs_progs/linux-btrfs.fragment
new file mode 100644
index 0000000000..605c1837e1
--- /dev/null
+++ b/support/testing/tests/package/test_btrfs_progs/linux-btrfs.fragment
@@ -0,0 +1 @@
+CONFIG_BTRFS_FS=y
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
