Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750EFC531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E85F81EC3;
	Fri, 23 Aug 2024 17:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xPHELgNTJBS3; Fri, 23 Aug 2024 17:57:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35D1B81EA9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35D1B81EA9;
	Fri, 23 Aug 2024 17:57:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80F221BF3F3
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F01181EA9
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id La9zM4hjcvnt for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:57:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB72681EA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB72681EA3
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB72681EA3
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:57:19 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DC32AB00571;
 Fri, 23 Aug 2024 19:57:14 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 19:57:07 +0200
Message-ID: <20240823175707.449840-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724435836;
 bh=GrSsLZgTqnBRP8qGSwF8RdhOWtM/V3OkTQHNmYRfdMQ=;
 h=From:To:Cc:Subject:Date:From;
 b=iAfMa0VHLFpv1WIiEWAg13LzVIy4lVkNWD1eYiudpgeJuc5N1zM8Dr5771DbkHbGI
 TlXfIuotTBGsYwu4tUkJhWvHI9tQLaMk9+jlyr+dLjnpV6CH+ZNAzkduqs5ZtpIW2s
 bCgV37hdE1d1CSGu/mwMKAbAe+jaiCKXb8LqDJ0gHFp+a1FzwwmG7vL1LRf0mhXgfq
 8XB9Vtsd5hjhOHfbRFp0Fy6u27sAGxPrSVvjictK+0l6gIhpnqEuULQBHzaHYrqoq4
 SbYj+gJv1zAUjfttds195rEWKCuEgpCf/sLFTEn/+j0dny/wu+KPpCIhIfwr1gv/GK
 DkAXFJq9oG//Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iAfMa0VH
Subject: [Buildroot] [PATCH 1/1] support/testing: add exfatprogs runtime test
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
https://gitlab.com/jolivain/buildroot/-/jobs/7654411597
---
 DEVELOPERS                                    |  2 +
 .../testing/tests/package/test_exfatprogs.py  | 99 +++++++++++++++++++
 .../test_exfatprogs/linux-exfat.fragment      |  1 +
 3 files changed, 102 insertions(+)
 create mode 100644 support/testing/tests/package/test_exfatprogs.py
 create mode 100644 support/testing/tests/package/test_exfatprogs/linux-exfat.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 426590d5c5..ea7a7f0bf0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1855,6 +1855,8 @@ F:	support/testing/tests/package/test_dos2unix.py
 F:	support/testing/tests/package/test_ed.py
 F:	support/testing/tests/package/test_ethtool.py
 F:	support/testing/tests/package/test_ethtool/
+F:	support/testing/tests/package/test_exfatprogs.py
+F:	support/testing/tests/package/test_exfatprogs/
 F:	support/testing/tests/package/test_file.py
 F:	support/testing/tests/package/test_file/
 F:	support/testing/tests/package/test_fluidsynth.py
diff --git a/support/testing/tests/package/test_exfatprogs.py b/support/testing/tests/package/test_exfatprogs.py
new file mode 100644
index 0000000000..1b0b117b00
--- /dev/null
+++ b/support/testing/tests/package/test_exfatprogs.py
@@ -0,0 +1,99 @@
+import os
+import subprocess
+
+import infra.basetest
+
+
+class TestExfatProgs(infra.basetest.BRTest):
+    # This test needs a Kernel with exfat support.
+    kern_frag = \
+        infra.filepath("tests/package/test_exfatprogs/linux-exfat.fragment")
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
+        BR2_PACKAGE_EXFATPROGS=y
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
+        # Variables for this test.
+        dev = "/dev/vda"
+        label = "BR_TEST"
+        mnt_pt = "/tmp/exfat"
+        data_file = f"{mnt_pt}/data.bin"
+
+        # We create the exfat filesystem on our device.
+        self.assertRunOk(f"mkfs.exfat {dev}")
+
+        # We set a label on this filesystem.
+        self.assertRunOk(f"exfatlabel {dev} '{label}'")
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
+        self.assertRunOk(f"fsck.exfat -v {dev}")
+
+        # We query the label and check it is the one we set at the
+        # beginning.
+        out, ret = self.emulator.run(f"exfatlabel {dev}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[1], f"label: {label}")
+
+        # We remount our filesystem.
+        self.assertRunOk(f"mount {dev} {mnt_pt}")
+
+        # We should recompute the same sha256 hash as before, on the
+        # first data file we created at the beginning.
+        out, ret = self.emulator.run(hash_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], data_sha256)
diff --git a/support/testing/tests/package/test_exfatprogs/linux-exfat.fragment b/support/testing/tests/package/test_exfatprogs/linux-exfat.fragment
new file mode 100644
index 0000000000..e0332e3d37
--- /dev/null
+++ b/support/testing/tests/package/test_exfatprogs/linux-exfat.fragment
@@ -0,0 +1 @@
+CONFIG_EXFAT_FS=y
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
