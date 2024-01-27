Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EBFC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 22:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77A328169A;
	Sat, 27 Jan 2024 22:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77A328169A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LOch2A9L-ItC; Sat, 27 Jan 2024 22:38:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A55908146E;
	Sat, 27 Jan 2024 22:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A55908146E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7CEFF1BF5A5
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 22:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EC2E6079D
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 22:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EC2E6079D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pBEcrOU6bvaz for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 22:38:51 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B5C960745
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 22:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B5C960745
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DF15F13F86E;
 Sat, 27 Jan 2024 23:38:46 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 23:38:38 +0100
Message-ID: <20240127223838.274418-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706395128;
 bh=9iACmzucW94NgLsjoeA1Nr/2B0zP590q455UfJ4l8TI=;
 h=From:To:Cc:Subject:Date:From;
 b=gVwrIfyTBslXU2S9sTozOyrFqWH4arkvzTSkVjeBCKhjTiFSJRStfWJxFJvyGpCDV
 sBMlekf6wu7szRHuLC2cT0Umk4VDv5gUn3MeJoVz+6KEKj8pCcHH5UPbSt6G031E9f
 RbRUGKubi9HqMdkxjqalUjRBbw8YvOi21y7KEOegKOkwvDymvaI5G7FDxi01ICDNaq
 vZqyD1NgztG/YCs4fDR/8HhoUiHD3nUv8oEuOCSzoCZb1bRz+d+b9CNdy+Hh4QQh7o
 CFXhgv9tXIESL0X4GFMRB0Aj0/wMMhfrvAP4bo073F72+775royaJD8w54KWaBgVEU
 jJztCxwgHE1eA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gVwrIfyT
Subject: [Buildroot] [PATCH 1/1] support/testing: add mdadm runtime test
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
 support/testing/tests/package/test_mdadm.py   | 138 ++++++++++++++++++
 .../package/test_mdadm/linux-mdadm.fragment   |   3 +
 3 files changed, 143 insertions(+)
 create mode 100644 support/testing/tests/package/test_mdadm.py
 create mode 100644 support/testing/tests/package/test_mdadm/linux-mdadm.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 9528837dd0..6e4195c8d4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1791,6 +1791,8 @@ F:	support/testing/tests/package/test_lzip.py
 F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_lz4.py
 F:	support/testing/tests/package/test_lzop.py
+F:	support/testing/tests/package/test_mdadm.py
+F:	support/testing/tests/package/test_mdadm/
 F:	support/testing/tests/package/test_micropython.py
 F:	support/testing/tests/package/test_micropython/
 F:	support/testing/tests/package/test_mtools.py
diff --git a/support/testing/tests/package/test_mdadm.py b/support/testing/tests/package/test_mdadm.py
new file mode 100644
index 0000000000..75385309a6
--- /dev/null
+++ b/support/testing/tests/package/test_mdadm.py
@@ -0,0 +1,138 @@
+import os
+import subprocess
+import time
+
+import infra.basetest
+
+
+class TestMdadm(infra.basetest.BRTest):
+    # This test creates a dm-raid volume with mdadm. A specific Kernel
+    # need to be built with a config fragment enabling this support.
+    kernel_fragment = \
+        infra.filepath("tests/package/test_mdadm/linux-mdadm.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.75"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_E2FSPROGS=y
+        BR2_PACKAGE_MDADM=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        # Test configuration:
+        md_dev = "/dev/md0"
+        storage_devs = ["/dev/vda", "/dev/vdb", "/dev/vdc"]
+        storage_size = 16  # Mega Bytes
+        failing_dev = storage_devs[-1]
+        mnt_pt = "/mnt/raid-storage"
+        data_file = f"{mnt_pt}/data.bin"
+
+        qemu_storage_opts = []
+        for i in range(len(storage_devs)):
+            disk_file = os.path.join(self.builddir, "images", f"disk{i}.img")
+            self.emulator.logfile.write(f"Creating disk image: {disk_file}\n")
+            self.emulator.logfile.flush()
+            subprocess.check_call(
+                ["dd", "if=/dev/zero", f"of={disk_file}",
+                 "bs=1M", f"count={storage_size}"],
+                stdout=self.emulator.logfile,
+                stderr=self.emulator.logfile)
+            opts = ["-drive", f"file={disk_file},if=virtio,format=raw"]
+            qemu_storage_opts += opts
+
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                                    "-initrd", img] + qemu_storage_opts)
+        self.emulator.login()
+
+        # Test the program can execute.
+        self.assertRunOk("mdadm --version")
+
+        # Show the mdstat, to confirm the Kernel has support and the
+        # configuration is empty.
+        cat_mdstat_cmd = "cat /proc/mdstat"
+        self.assertRunOk(cat_mdstat_cmd)
+
+        # We create a raid5 array with the drives.
+        cmd = f"mdadm --create --verbose {md_dev} --level=5 "
+        cmd += f"--raid-devices={len(storage_devs)} "
+        cmd += " ".join(storage_devs)
+        self.assertRunOk(cmd)
+
+        # We show again mdstat, to confirm the array creation. This is
+        # also for debugging.
+        self.assertRunOk(cat_mdstat_cmd)
+
+        # We format the device as ext4 and mount it.
+        self.assertRunOk(f"mkfs.ext4 {md_dev}")
+        self.assertRunOk(f"mkdir -p {mnt_pt}")
+        self.assertRunOk(f"mount {md_dev} {mnt_pt}")
+
+        # We store some random data on this new filesystem. Note: this
+        # file is slightly larger than a single storage drive. This
+        # data file should span over two drives and use the raid5.
+        file_size = storage_size + 4
+        cmd = f"dd if=/dev/urandom of={data_file} bs=1M count={file_size}"
+        self.assertRunOk(cmd)
+
+        # We compute the hash of our data, and save it for later.
+        hash_cmd = f"sha256sum {data_file}"
+        out, ret = self.emulator.run(hash_cmd)
+        self.assertEqual(ret, 0)
+        data_sha256 = out[0]
+
+        # We run few common mdadm commands.
+        self.assertRunOk("mdadm --detail --scan")
+        self.assertRunOk(f"mdadm --query {md_dev}")
+        self.assertRunOk(f"mdadm --detail --test {md_dev}")
+        self.assertRunOk(f"mdadm --action=check {md_dev}")
+        self.assertRunOk(f"mdadm --monitor --oneshot {md_dev}")
+
+        # We mark a device as "failed".
+        self.assertRunOk(f"mdadm {md_dev} --fail {failing_dev}")
+
+        # The monitoring should now report the array as degraded.
+        monitor_cmd = f"mdadm --monitor --oneshot {md_dev}"
+        out, ret = self.emulator.run(monitor_cmd)
+        self.assertEqual(ret, 0)
+        self.assertIn("DegradedArray", "\n".join(out))
+
+        # We remove the failing drive from the array.
+        self.assertRunOk(f"mdadm {md_dev} --remove {failing_dev}")
+
+        # We wipe the failing drive by writing zeroes.
+        cmd = f"dd if=/dev/zero of={failing_dev} bs=1M count={storage_size}"
+        self.assertRunOk(cmd)
+
+        # We add back this blank drive to the array.
+        self.assertRunOk(f"mdadm {md_dev} --add {failing_dev}")
+
+        # We wait few seconds to let the device rebuild.
+        time.sleep(3)
+
+        # The array should no longer be marked as degraded.
+        out, ret = self.emulator.run(monitor_cmd)
+        self.assertEqual(ret, 0)
+        self.assertNotIn("DegradedArray", "\n".join(out))
+
+        # With all those array manipulations, the data file should not
+        # be corrupted. We should be able to recompute the same hash
+        # as before.
+        out, ret = self.emulator.run(hash_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], data_sha256)
diff --git a/support/testing/tests/package/test_mdadm/linux-mdadm.fragment b/support/testing/tests/package/test_mdadm/linux-mdadm.fragment
new file mode 100644
index 0000000000..152192ceb4
--- /dev/null
+++ b/support/testing/tests/package/test_mdadm/linux-mdadm.fragment
@@ -0,0 +1,3 @@
+CONFIG_MD=y
+CONFIG_BLK_DEV_DM=y
+CONFIG_DM_RAID=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
