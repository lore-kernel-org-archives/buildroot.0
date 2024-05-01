Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E39C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D58828149B;
	Wed,  1 May 2024 19:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fY1Ryzbd9y3s; Wed,  1 May 2024 19:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 830CF81A92
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 830CF81A92;
	Wed,  1 May 2024 19:24:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F36801BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED4B74031D
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Og3bS2uvYNvn for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:24:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3D6C40132
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3D6C40132
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:24:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE7C1863F8; Wed,  1 May 2024 19:24:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 20:49:28 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a2ade71578a978926bb47985594cc2d2ce5432f2
X-Git-Newrev: bcafe4be058074848d661f5a38d6a2b4a3ad73d2
X-Patchwork-Hint: ignore
Message-Id: <20240501192441.EE7C1863F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add lvm2
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

commit: https://git.buildroot.net/buildroot/commit/?id=bcafe4be058074848d661f5a38d6a2b4a3ad73d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 79f7d71640061f65aedfa4f8845a6757e8b0f3fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |   2 +
 support/testing/tests/package/test_lvm2.py         | 163 +++++++++++++++++++++
 .../tests/package/test_lvm2/linux-lvm2.fragment    |   2 +
 3 files changed, 167 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a38b681a8a..8ccf6ff46c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1805,6 +1805,8 @@ F:	support/testing/tests/package/test_libgpgme.py
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lrzip.py
 F:	support/testing/tests/package/test_ltrace.py
+F:	support/testing/tests/package/test_lvm2.py
+F:	support/testing/tests/package/test_lvm2/
 F:	support/testing/tests/package/test_lzip.py
 F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_lz4.py
diff --git a/support/testing/tests/package/test_lvm2.py b/support/testing/tests/package/test_lvm2.py
new file mode 100644
index 0000000000..bdbae7a4ec
--- /dev/null
+++ b/support/testing/tests/package/test_lvm2.py
@@ -0,0 +1,163 @@
+import os
+import subprocess
+
+import infra.basetest
+
+
+class TestLvm2(infra.basetest.BRTest):
+    # This test creates a lvm2 volume. A specific Kernel need to be
+    # built with a config fragment enabling this support. This test
+    # also uses resize2fs from e2fsprogs.
+    kernel_fragment = \
+        infra.filepath("tests/package/test_lvm2/linux-lvm2.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.77"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_E2FSPROGS=y
+        BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y
+        BR2_PACKAGE_LVM2=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def get_free_disk_space(self, path):
+        out, ret = self.emulator.run(f"df -k {path}")
+        self.assertEqual(ret, 0)
+        return int(out[1].split()[3])
+
+    def test_run(self):
+        # Test configuration:
+        storage_devs = ["/dev/vda", "/dev/vdb", "/dev/vdc"]
+        storage_size = 16                       # Mega Bytes
+        lvm_vg = "br_vg"                        # Volume Group name
+        lvm_lv = "br_lv"                        # Logical Volume name
+        lv_dev = f"/dev/{lvm_vg}/{lvm_lv}"      # Logical Volume dev name
+        mnt_pt = "/mnt/lvm2-storage"
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
+        self.assertRunOk("lvm version")
+
+        # We did not created any Physical Volume yet. We should NOT
+        # see any of our storage devices in a pvscan.
+        out, ret = self.emulator.run("pvscan")
+        self.assertEqual(ret, 0)
+        for dev in storage_devs:
+            self.assertNotIn(dev, "\n".join(out))
+
+        # We initialize our Physical Volumes (PVs).
+        pv_devs = " ".join(storage_devs)
+        self.assertRunOk(f"pvcreate {pv_devs}")
+
+        # We run few diagnostic commands related to PVs.
+        self.assertRunOk(f"pvck {pv_devs}")
+        self.assertRunOk(f"pvdisplay {pv_devs}")
+        self.assertRunOk("pvs")
+
+        # Now we initialized the PVs, we should see them in a pvscan.
+        out, ret = self.emulator.run("pvscan")
+        self.assertEqual(ret, 0)
+        for dev in storage_devs:
+            self.assertIn(dev, "\n".join(out))
+
+        # We create a Volume Group (VG) including two of our three
+        # PVs.
+        cmd = f"vgcreate {lvm_vg} {storage_devs[0]} {storage_devs[1]}"
+        self.assertRunOk(cmd)
+
+        # We run few diagnostic commands related to VGs.
+        self.assertRunOk(f"vgck {lvm_vg}")
+        self.assertRunOk(f"vgdisplay {lvm_vg}")
+        self.assertRunOk("vgscan")
+        self.assertRunOk("vgs")
+
+        # We create a Logical Volume (LV) in our VG.
+        self.assertRunOk(f"lvcreate -l 100%FREE -n {lvm_lv} {lvm_vg}")
+
+        # We check LVM created the LV device.
+        self.assertRunOk(f"ls -al {lv_dev}")
+
+        # We run few diagnostic commands related to LVs.
+        self.assertRunOk("lvscan")
+        self.assertRunOk("lvs")
+
+        # We create a ext4 filesystem on our LV.
+        self.assertRunOk(f"mkfs.ext4 {lv_dev}")
+
+        # We create a mount point directory and mount the device.
+        self.assertRunOk(f"mkdir -p {mnt_pt}")
+        self.assertRunOk(f"mount {lv_dev} {mnt_pt}")
+
+        # We create a data file in our new filesystem. Note: this file
+        # is slightly larger than a single PV. This data file should
+        # span over the two PVs in the VG.
+        data_size = storage_size + 4
+        cmd = f"dd if=/dev/urandom of={data_file} bs=1M count={data_size}"
+        self.assertRunOk(cmd)
+
+        # We compute the hash of our data, and save it for later.
+        hash_cmd = f"sha256sum {data_file}"
+        out, ret = self.emulator.run(hash_cmd)
+        self.assertEqual(ret, 0)
+        data_sha256 = out[0]
+
+        # We compute the free space of the mount point.
+        fs_free_space = self.get_free_disk_space(mnt_pt)
+
+        # We extend of VG with our third PV.
+        self.assertRunOk(f"vgextend {lvm_vg} {storage_devs[2]}")
+
+        # We grow the LV to use all the space of the VG.
+        self.assertRunOk(f"lvresize -l +100%FREE {lvm_vg}/{lvm_lv}")
+
+        # We resize the filesystem to use all the LV space.
+        self.assertRunOk(f"resize2fs {lv_dev}")
+
+        # Now we grew the LV and resized the filesystem, we recompute
+        # the free space and check we have more.
+        fs2_free_space = self.get_free_disk_space(mnt_pt)
+        self.assertGreater(fs2_free_space, fs_free_space)
+
+        # With all those on-the-fly operations on the mounted
+        # filesystem, the data file should be intact. We should
+        # recompute the same data checksum as before.
+        out, ret = self.emulator.run(hash_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], data_sha256)
+
+        # Finally, we unmount the filesystem. It should not contain
+        # any error.
+        self.assertRunOk(f"umount {mnt_pt}")
+        self.assertRunOk(f"e2fsck -f -n {lv_dev}")
diff --git a/support/testing/tests/package/test_lvm2/linux-lvm2.fragment b/support/testing/tests/package/test_lvm2/linux-lvm2.fragment
new file mode 100644
index 0000000000..0fade167a3
--- /dev/null
+++ b/support/testing/tests/package/test_lvm2/linux-lvm2.fragment
@@ -0,0 +1,2 @@
+CONFIG_MD=y
+CONFIG_BLK_DEV_DM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
