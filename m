Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384F5C2BD09
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 20:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F34E405E3;
	Sat,  6 Jul 2024 20:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQ8tolxRDLRY; Sat,  6 Jul 2024 20:15:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3456A405EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3456A405EF;
	Sat,  6 Jul 2024 20:15:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83CD21BF27C
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 20:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7117881E2F
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 20:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C60W1ONr--p2 for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 20:15:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 63A5381E2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63A5381E2D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63A5381E2D
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 20:15:56 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BB49BB0053E;
 Sat,  6 Jul 2024 22:15:52 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  6 Jul 2024 22:15:48 +0200
Message-ID: <20240706201548.183638-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720296954;
 bh=bB+m2s9lSehlV45sCnIM3AKt6ddo1axiYTgMbTmC//M=;
 h=From:To:Cc:Subject:Date:From;
 b=YxobjkIspG2krESKdF5PN5Iaw3KZgvDr00OtUjumJu5ujUeFUHJ5h7FUs8Tk4W8yb
 YA7E0D7D0+lRchvnfITOLfpyIuL/QjFIOcdnd0ZOWzLjix8wKV9q9tRjB7PSjyV4lD
 DZtqqhyyxibQ0Yvd9mc+eHa8RuV3b9mEjFskEcTrj/qAJg1yONKkOWlUnn+6g6ta8h
 2vTzB70b4dVKp5l5v3ximRRrzyyFljGztsjPrf3cSxGjeUX9KtEf3cwU3Ca2BQMssv
 JfUwJc1SVGfZFA8J0LI0Tu3qV+Sk5IfMG1AKflcmHdmqvJCczxOdGnS/wO77XPfdqs
 +Rg+uqRfemzBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YxobjkIs
Subject: [Buildroot] [PATCH 1/1] support/testing: new xfsprogs runtime test
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
Patch tested on branch master at commit 3ebc7c6 with commands:

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_xfsprogs
    ...
    OK
---
 DEVELOPERS                                    |   2 +
 .../testing/tests/package/test_xfsprogs.py    | 112 ++++++++++++++++++
 .../package/test_xfsprogs/linux-xfs.fragment  |   1 +
 3 files changed, 115 insertions(+)
 create mode 100644 support/testing/tests/package/test_xfsprogs.py
 create mode 100644 support/testing/tests/package/test_xfsprogs/linux-xfs.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 90d1a111ab4..d2c39d69e3b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1913,6 +1913,8 @@ F:	support/testing/tests/package/test_usbutils/
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
index 00000000000..a3a4bd27d83
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
index 00000000000..32f7f6d8720
--- /dev/null
+++ b/support/testing/tests/package/test_xfsprogs/linux-xfs.fragment
@@ -0,0 +1 @@
+CONFIG_XFS_FS=y
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
