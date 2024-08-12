Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDADC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 07:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 251A781168;
	Mon, 12 Aug 2024 07:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNSB1IDoeHMy; Mon, 12 Aug 2024 07:32:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C2F78114F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C2F78114F;
	Mon, 12 Aug 2024 07:32:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F4C41BF484
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 07:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 460BC4022E
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 07:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeWZgDvTHSqC for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 07:32:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D763D400EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D763D400EA
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 07:32:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFE8385167; Mon, 12 Aug 2024 07:32:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 09:31:33 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 5396f35da3430b0d135d14647a235bfd6508ca52
X-Git-Newrev: 560fb72ff4909670e5ff6987e9b8c6e618e310f3
X-Patchwork-Hint: ignore
Message-Id: <20240812073245.BFE8385167@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] support/testing: new
 xfsprogs runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=560fb72ff4909670e5ff6987e9b8c6e618e310f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 1fb08cdc85fab4ba1460cd15e0829494afc0fdf2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |   2 +
 support/testing/tests/package/test_xfsprogs.py     | 112 +++++++++++++++++++++
 .../tests/package/test_xfsprogs/linux-xfs.fragment |   1 +
 3 files changed, 115 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2536f2eac2..7e06a1acfa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1917,6 +1917,8 @@ F:	support/testing/tests/package/test_usbutils/
 F:	support/testing/tests/package/test_weston.py
 F:	support/testing/tests/package/test_weston/
 F:	support/testing/tests/package/test_wine.py
+F:	support/testing/tests/package/test_xfsprogs.py
+F:	support/testing/tests/package/test_xfsprogs/
 F:	support/testing/tests/package/test_xz.py
 F:	support/testing/tests/package/test_z3.py
 F:	support/testing/tests/package/test_z3/
diff --git a/support/testing/tests/package/test_xfsprogs.py b/support/testing/tests/package/test_xfsprogs.py
new file mode 100644
index 0000000000..a3a4bd27d8
--- /dev/null
+++ b/support/testing/tests/package/test_xfsprogs.py
@@ -0,0 +1,112 @@
+import os
+import subprocess
+
+import infra.basetest
+
+
+class TestXfsProgs(infra.basetest.BRTest):
+    # This test needs a Kernel with XFS support.
+    kern_frag = \
+        infra.filepath("tests/package/test_xfsprogs/linux-xfs.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.37"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_XFSPROGS=y
+        BR2_PACKAGE_OPENSSL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        # Prepare the disk image. XFS requires at least 300MB of
+        # storage to work.
+        disk_file = os.path.join(self.builddir, "images", "disk.img")
+        self.emulator.logfile.write(f"Creating disk image: {disk_file}")
+        self.emulator.logfile.flush()
+        subprocess.check_call(
+            ["dd", "if=/dev/zero", f"of={disk_file}", "bs=1M", "count=512"],
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
+        self.assertRunOk("mkfs.xfs -V")
+
+        # Variables for this test.
+        dev = "/dev/vda"
+        label = "BR_TEST"
+        mnt_pt = "/tmp/xfs"
+        data_file = f"{mnt_pt}/data.bin"
+
+        # We create the XFS filesystem on our device.
+        self.assertRunOk(f"mkfs.xfs {dev}")
+
+        # We set a label on this filesystem.
+        self.assertRunOk(f"xfs_admin -L '{label}' {dev}")
+
+        # We create a mount point.
+        self.assertRunOk(f"mkdir -p {mnt_pt}")
+
+        # We mount the XFS filesystem.
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
+        # We query the fragmentation level. Since it's a new
+        # filesystem, we don't expect any filesystem
+        # fragmentation. This invocation is just to test the "xfs_db"
+        # program can run and read the filesystem.
+        self.assertRunOk(f"xfs_db -c frag -r {dev}")
+
+        # We run a repair (this tool is the equivalent of
+        # "fsck"). Again, since we cleanly unmounted the filesystem,
+        # we are not expecting any repair. This is just to test the
+        # program works correctly.
+        self.assertRunOk(f"xfs_repair {dev}")
+
+        # We query the label and check it is the one we set at the
+        # beginning.
+        out, ret = self.emulator.run(f"xfs_admin -l {dev}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], f"label = \"{label}\"")
+
+        # We remount our filesystem.
+        self.assertRunOk(f"mount {dev} {mnt_pt}")
+
+        # We should recompute the same sha256 hash as before.
+        out, ret = self.emulator.run(hash_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], data_sha256)
diff --git a/support/testing/tests/package/test_xfsprogs/linux-xfs.fragment b/support/testing/tests/package/test_xfsprogs/linux-xfs.fragment
new file mode 100644
index 0000000000..32f7f6d872
--- /dev/null
+++ b/support/testing/tests/package/test_xfsprogs/linux-xfs.fragment
@@ -0,0 +1 @@
+CONFIG_XFS_FS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
