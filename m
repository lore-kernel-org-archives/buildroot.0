Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657AFC54731
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F034B40633;
	Tue, 27 Aug 2024 16:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N7gFnt5r6iOp; Tue, 27 Aug 2024 16:42:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E2F940611
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E2F940611;
	Tue, 27 Aug 2024 16:42:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF8FA1BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8F3E40570
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4i0f-1jSf7pG for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:42:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F0DB404F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F0DB404F5
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:42:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5881E7FCD5; Tue, 27 Aug 2024 16:42:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Aug 2024 18:42:40 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ff07d22a8f5a2d3c2b2ce8edf23deba626263d3c
X-Git-Newrev: c84b89fd0e32b7a23def6f1f7014e4dcd19be5c0
X-Patchwork-Hint: ignore
Message-Id: <20240827164251.5881E7FCD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: add
 dosfstools runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=c84b89fd0e32b7a23def6f1f7014e4dcd19be5c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |   2 +
 support/testing/tests/package/test_dosfstools.py   | 106 +++++++++++++++++++++
 .../package/test_dosfstools/linux-vfat.fragment    |   3 +
 3 files changed, 111 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a4482e5eeb..570f4ff115 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1865,6 +1865,8 @@ F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dmidecode.py
 F:	support/testing/tests/package/test_dos2unix.py
+F:	support/testing/tests/package/test_dosfstools.py
+F:	support/testing/tests/package/test_dosfstools/
 F:	support/testing/tests/package/test_ed.py
 F:	support/testing/tests/package/test_ethtool.py
 F:	support/testing/tests/package/test_ethtool/
diff --git a/support/testing/tests/package/test_dosfstools.py b/support/testing/tests/package/test_dosfstools.py
new file mode 100644
index 0000000000..f32ff81c01
--- /dev/null
+++ b/support/testing/tests/package/test_dosfstools.py
@@ -0,0 +1,106 @@
+import os
+import subprocess
+
+import infra.basetest
+
+
+class TestDosFsTools(infra.basetest.BRTest):
+    # This test needs a Kernel with vfat and NLS support. The vfat
+    # filesystem also needs character set conversion libraries, since
+    # its default encoding is CP850.
+    kern_frag = \
+        infra.filepath("tests/package/test_dosfstools/linux-vfat.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.47"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_DOSFSTOOLS=y
+        BR2_PACKAGE_DOSFSTOOLS_FATLABEL=y
+        BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT=y
+        BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
+        BR2_SYSTEM_ENABLE_NLS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY=y
+        """
+
+    def test_run(self):
+        # Prepare the disk image.
+        disk_file = os.path.join(self.builddir, "images", "disk.img")
+        self.emulator.logfile.write(f"Creating disk image: {disk_file}\n")
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
+        # Variables for this test.
+        dev = "/dev/vda"
+        label = "BR_TEST"
+        mnt_pt = "/tmp/vfat"
+        data_file = f"{mnt_pt}/data.bin"
+
+        # We create the vfat filesystem on our device.
+        self.assertRunOk(f"mkfs.vfat {dev}")
+
+        # We set a label on this filesystem.
+        self.assertRunOk(f"fatlabel {dev} '{label}'")
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
+        # We run a filesystem check. Since we cleanly unmounted the
+        # filesystem, we are not expecting any repair. This is just to
+        # test the program works correctly.
+        self.assertRunOk(f"fsck.vfat -v {dev}")
+
+        # We query the label and check it is the one we set at the
+        # beginning.
+        out, ret = self.emulator.run(f"fatlabel {dev}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], label)
+
+        # We remount our filesystem.
+        self.assertRunOk(f"mount {dev} {mnt_pt}")
+
+        # We should recompute the same sha256 hash as before, on the
+        # first data file we created at the beginning.
+        out, ret = self.emulator.run(hash_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], data_sha256)
diff --git a/support/testing/tests/package/test_dosfstools/linux-vfat.fragment b/support/testing/tests/package/test_dosfstools/linux-vfat.fragment
new file mode 100644
index 0000000000..eb4d2e6044
--- /dev/null
+++ b/support/testing/tests/package/test_dosfstools/linux-vfat.fragment
@@ -0,0 +1,3 @@
+CONFIG_VFAT_FS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
