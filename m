Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A048CC5320E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 17:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38A0880C3F;
	Sun, 25 Aug 2024 17:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iU7z_rvXQunO; Sun, 25 Aug 2024 17:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23D3080BE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23D3080BE7;
	Sun, 25 Aug 2024 17:35:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 281E61BF28D
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 17:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24855605ED
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 17:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fVdsIl89ZZqx for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 17:35:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CAC71605D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAC71605D4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAC71605D4
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 17:35:26 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4C701B0053D;
 Sun, 25 Aug 2024 19:35:22 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Aug 2024 19:35:14 +0200
Message-ID: <20240825173514.1033011-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724607323;
 bh=aH+3oEPRPuEgzx1bt7sxt647axYmZkneQGTCmYjyhTg=;
 h=From:To:Cc:Subject:Date:From;
 b=P+VRlUVYuoTQRztBlpMf98VmSB60B8aSyJ16DF8Diqbtjx85cAkSiymcHFeinod3u
 gJIsDlzoW+mMEFOXsS218J9noM625HO00gax/h4hoLR/rEvymALy0oG7/beEVZqRAz
 OdDtujNdQH6whjcOKv99M21lvLILTgZTV+Ul7ybRJQVkBePBO+3B8G+M5Kp1fqHDAb
 qmX5lSTVWDS5xCOP51CsHdzE5MTWibkf7/JcFveJMe57wRBNZQQjaV7WyrRnWPyzMP
 PmL0I5nb0nEwVIHLx/taW1sFBmauYLhUZnR+BR7zDV5VF5ZVEb46UPjuT4ccIkQhDy
 ZiDj7CFgg0zqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P+VRlUVY
Subject: [Buildroot] [PATCH 1/1] support/testing: add dosfstools runtime test
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
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/7661932432
---
 DEVELOPERS                                    |   2 +
 .../testing/tests/package/test_dosfstools.py  | 106 ++++++++++++++++++
 .../test_dosfstools/linux-vfat.fragment       |   3 +
 3 files changed, 111 insertions(+)
 create mode 100644 support/testing/tests/package/test_dosfstools.py
 create mode 100644 support/testing/tests/package/test_dosfstools/linux-vfat.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 426590d5c5..f81a632bf4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1852,6 +1852,8 @@ F:	support/testing/tests/package/test_ddrescue.py
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
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
