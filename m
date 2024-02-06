Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A109C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 21:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E44C60B79;
	Tue,  6 Feb 2024 21:07:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8F2R8tLjssfm; Tue,  6 Feb 2024 21:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9B4160FD6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9B4160FD6;
	Tue,  6 Feb 2024 21:07:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 431131BF400
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 21:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FA064206A
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 21:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gEBzzvQ9m06g for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 21:07:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6465142064
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6465142064
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 21:07:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FE5D873E3; Tue,  6 Feb 2024 21:07:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 21:54:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9dad5e7d7f7bc03e648621b9be6974e7ae39a467
X-Git-Newrev: 6338bdfc1c772956de13d2ff7c6abaa23740325d
X-Patchwork-Hint: ignore
Message-Id: <20240206210737.4FE5D873E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add mdadm runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=6338bdfc1c772956de13d2ff7c6abaa23740325d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |   2 +
 support/testing/tests/package/test_mdadm.py        | 138 +++++++++++++++++++++
 .../tests/package/test_mdadm/linux-mdadm.fragment  |   3 +
 3 files changed, 143 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d0ab37f5c2..ac65cbb450 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1805,6 +1805,8 @@ F:	support/testing/tests/package/test_lzip.py
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
