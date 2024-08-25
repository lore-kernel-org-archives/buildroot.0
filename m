Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DE5C5320E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 11:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E1FF40118;
	Sun, 25 Aug 2024 11:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2FXmvjkZrIz; Sun, 25 Aug 2024 11:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02A15401FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02A15401FE;
	Sun, 25 Aug 2024 11:52:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5D7C1BF33C
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 11:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4367401FE
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 11:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6rEfzQnFj-M for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 11:52:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 44AB040118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44AB040118
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44AB040118
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 11:52:53 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 57FB6B0055E;
 Sun, 25 Aug 2024 13:52:47 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Aug 2024 13:52:39 +0200
Message-ID: <20240825115239.158016-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724586770;
 bh=+b+MQZal3sprvN17MTWUtCRPgaWd5IpNMFYXjBZNH/Q=;
 h=From:To:Cc:Subject:Date:From;
 b=f9cY4Gg1ZfghpHS3pn5VsI6jYWWjSUHgwidCC5iqJWfjwcmPGFP9TaiZtv2LwR727
 iKqHarb3jRuCrN1KPP5CN+iYmj+czCWBmhxCOmRRQX3WnmVRT30LNMOenUxIgagBgB
 3cikQO3XWBf6UVoHEvckFbCuQRQBRMgAub+Y+DMTNtqTotuYAOBvuAMGyPUy3aUx+c
 L3dTEpkVFUjIDR2rbQ/kFu1hdhT/TdDCn7LuZDGeyyIYgC6pvwx2ueu8DanR2r/knw
 CUu9IIjrkzwV9x/Ymx7e5WA0ehK6E4s5n5o5uZkujIWBDghn8ha8aRNfMTJJ8PB6YA
 hMM0jlOWCR52w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=f9cY4Gg1
Subject: [Buildroot] [PATCH 1/1] support/testing: add parted runtime test
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
 DEVELOPERS                                   |   1 +
 support/testing/tests/package/test_parted.py | 107 +++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 support/testing/tests/package/test_parted.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 426590d5c5..208edc724c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1933,6 +1933,7 @@ F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_openblas.py
+F:	support/testing/tests/package/test_parted.py
 F:	support/testing/tests/package/test_pciutils.py
 F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_pigz.py
diff --git a/support/testing/tests/package/test_parted.py b/support/testing/tests/package/test_parted.py
new file mode 100644
index 0000000000..ca585b7e02
--- /dev/null
+++ b/support/testing/tests/package/test_parted.py
@@ -0,0 +1,107 @@
+import os
+import subprocess
+
+import infra.basetest
+
+
+class TestParted(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_E2FSPROGS=y
+        BR2_PACKAGE_PARTED=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
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
+        # Run the emulator with a drive.
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=[
+                                "-initrd", cpio_file,
+                                "-drive", f"file={disk_file},format=raw"])
+        self.emulator.login()
+
+        # We check the program can run.
+        self.assertRunOk("parted --version")
+
+        dev = "/dev/sda"
+        parted = f"parted {dev}"
+
+        # We print the partition list of our drive. Since the drive is
+        # supposed to be blank, it should not have a partition table.
+        part_list_cmd = f"{parted} print list"
+        out, ret = self.emulator.run(part_list_cmd, timeout=10)
+        self.assertEqual(ret, 0)
+        self.assertIn("Partition Table: unknown", out)
+
+        # We create a GPT partition table.
+        mklabel_cmd = f"{parted} mklabel gpt"
+        self.assertRunOk(mklabel_cmd, timeout=10)
+
+        # We print again the partition list. We should now see our
+        # partition table.
+        out, ret = self.emulator.run(part_list_cmd, timeout=10)
+        self.assertEqual(ret, 0)
+        self.assertIn("Partition Table: gpt", out)
+
+        # We create 3 partitions on our drive.
+        partitions = [
+            "MyPart1 ext2 1MiB 25%",
+            "MyPart2 ext4 25% 50%",
+            "MyPart3 ext4 50% 100%"
+        ]
+        for part in partitions:
+            mkpart_cmd = f"{parted} mkpart {part}"
+            self.assertRunOk(mkpart_cmd, timeout=10)
+
+        # We print again the list of partitions, this time in machine
+        # parseable format. We check we have our 3 partitions.
+        cmd = f"parted -m {dev} print list"
+        out, ret = self.emulator.run(cmd, timeout=10)
+        self.assertEqual(ret, 0)
+        for part in range(1, 4):
+            self.assertTrue(out[1+part].startswith(f"{part}:"))
+            self.assertTrue(out[1+part].endswith(f":MyPart{part}:;"))
+
+        # We format our partitions.
+        self.assertRunOk(f"mkfs.ext2 {dev}1", timeout=10)
+        self.assertRunOk(f"mkfs.ext4 {dev}2", timeout=10)
+        self.assertRunOk(f"mkfs.ext4 {dev}3", timeout=10)
+
+        # We create a random data file in the temporary directory. It
+        # will be the reference source file that will be copied later
+        # on each of our filesystems.
+        data_file = "data.bin"
+        cmd = f"dd if=/dev/urandom of=/tmp/{data_file} bs=1M count=10"
+        self.assertRunOk(cmd)
+
+        # We compute the sha256 hash and save it for later.
+        hash_cmd = f"sha256sum {data_file}"
+        out, ret = self.emulator.run(f"( cd /tmp && {hash_cmd} )")
+        self.assertEqual(ret, 0)
+        data_sha256 = out[0]
+
+        # For each partition, we create a mount point directory, mount
+        # the filesystem, copy the reference data file in it, sync the
+        # filesystem, and compute the sha256 hash of the file. This
+        # sequence will exercise a bit the partitions and filesystems
+        # in read/write operations.
+        for part in range(1, 4):
+            self.assertRunOk(f"mkdir -p /tmp/MyPart{part}")
+            self.assertRunOk(f"mount {dev}{part} /tmp/MyPart{part}")
+            self.assertRunOk(f"cp /tmp/{data_file} /tmp/MyPart{part}/")
+            self.assertRunOk("sync")
+            out, ret = self.emulator.run(f"( cd /tmp/MyPart{part} && {hash_cmd} )")
+            self.assertEqual(ret, 0)
+            self.assertEqual(out[0], data_sha256)
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
