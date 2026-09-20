Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E89C982CC
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 10:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C91C60622;
	Sun, 20 Sep 2026 10:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWi9n7YP8JH7; Sun, 20 Sep 2026 10:14:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AB54B60641
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789899281;
	b=rvT8xyEIlFmG3kTCzaUE0A11gsgTzllx/X8QWJRP2lrlSPKcvrENba6ORXqTs86Bukzb
	 aArwolCosE82YD/cPxnZ85f/gpR0elG/0QypH7LJepBs4OgT4Q/XNJ44xy0rBbcbuBp29
	 0O9LHZHumnwAHs9g9I5b2cPTvbMFITQMwSmWCPV9PhtXdaoPOlVL3c2vAQutohFcp34kC
	 DX4gUZI6J08aNwOUSJVaC81I+daM+IztJyl6ImSbUuJ3smeH/1ZIR2VNblKruhJbN7HiU
	 TNTIlOJkJX6YHeK32mrzOMrq2spSC0YWn6KTTGx2FijmqCuGQ4xILV/f4hpYopCXmxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789899281;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=q/b/hmqf0XDGFXMrsXf2IIcCUHkunQLyYhdDs8e48P0=;
	b=PQPbs20BFw0AyBqKfxzBrvzIrqRnDoCzqJvQ6X772yxugfcJ8ijeDQxbHJMnCpzSYP5N
	 qqu7QbYDanO4IOghgj5Tdvoejr4DOD5TVHTxD2ipbd4HQhbTnZ1aggOUyLlV11zaTGKFe
	 RPBxxFP+YBr+EpDzC+kjtBJH6l/7v348TXFfuantIDu4W5su5NQ7MjMr44sARPhuk5wO+
	 SCE36mV2qmrhnDOv3NzATOo19/Ix7wsHv88MoLPuSw7TL3j01SsKFWz0aISZU4J9Z4TGu
	 p74h8brTgHyfEm+ElXJ6YwmYSSHxn8wwAahJOFeMiZ2A5jxhrMz2UmZlzK4CNmbUDkw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789899281;
	bh=q/b/hmqf0XDGFXMrsXf2IIcCUHkunQLyYhdDs8e48P0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Dj8pYlvmW5Gl8wQc19BP5V8kKX/hlELeFogc1fi6fc5obhfytaC3bsQgyTBaXHlor
	 WWqFbTo4INMgG0TyEiSzXFaB1UVUzO5zxjRgqsbnP7U5n0bv/esfvX5tT5cI+8nkwI
	 mgPjHl/mJDVYv15fXxmYzgBpm8rFYgRwe9WcTmr2RLsO8JTA2CSJS8OJR+pQJF65Ij
	 N41opgLSfkG97VN3PjRcqSCYHbjgWpJMp2f0SLPvOAYwG0vIFcqfU0nkkUhJz+ToAb
	 zwYrGyWPIfYmGSSi3AP9Mj2m1C+A1I0Y9UdwmiY/XK26Qwt9/78xHbuYepS1lsBYx1
	 mAAzFVuEcBaGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB54B60641;
	Sun, 20 Sep 2026 10:14:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 50444371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B1DE60622
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a04wiP5-KSfA for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 10:14:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1FC9F60611
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789899276;
 b=Q5+yQJBQKmkJivkUqO4LXZNtIQK85dq3rnIGCV/8sLySACO89OQnw/0TY3r4/yki/rj9
 jt9U1vKO8H/5hrRO8H9f3JptF5hx1c4n+8xdc7PmS3cnZ6h45Pk3sMa/PeaRylH2kmnEq
 XM9O+/H0H8yT8olE3I6HnhUd8AGaf5laDyawNKUfn1ybSjZ5Zr0IETDcKdj65V4TcMFlB
 rm3/jJuLDysAf+JccFM3R0SUycdY+HKBLDtB1EDrVBw7bKCehj30qIORSEohBP/vm+Jy2
 OUHJY5+CwWdS3S4lzaBGyC3K+kNgy9GEUTG0kYLCFImNc5WWdeKZ0+026N1tExnQefw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789899276;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YGom+Va20bb4r96CP3flY9n/KBsYXL8gzJ39j64EfOA=;
 b=Esw2jqwKM/f7czA1/LRUE0CE+PaR1FquU/DVjXrsR5p1+CGTgeBsdC6O4qUVzLZSjbr5
 SeOqyhG9tZduedWW7SL7TgsRDS9TDp6R0TIgRj1/8+I787dhRfRPloBEdz7ebRXrsm4Hx
 nQ6cTboL5qcO/uMQNogof4x/GKG9G9vQZpZzCIQNdcfF0CHoAQWhFHr2tBEHAIRmb4VPT
 +TGrTp/xaW95uYNQRMSPBDNf+sWpkaxOyATnNH2V7azV7nycPXOcaq2oVmsELg7LeoK5X
 6R4kjyu1e3/c5MJ2LMbZXsXwjx8L96z7mSl0u9XYSy2h2uVkDuOdLqYJDOvS4qemofg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FC9F60611
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:14:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF2EA8DB1F; Sun, 20 Sep 2026 10:13:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 12:12:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 036f8558c4608ca2055ba56b74e7c2c416ea7c9a
X-Git-Newrev: 06322989a250877ee0f148b6189c1b2bc259d1ba
X-Patchwork-Hint: ignore
Message-Id: <20260920101327.BF2EA8DB1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/fs/test_squashfs.py:
 add test with dm-verity
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/06322989a250877ee0f148b6189c1b2bc259d1ba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This test uses the option added in the previous commits to build a
disk image with squashfs root and matching verity tree, and boots from
it. Building a kernel is necessary to get the required device-mapper
and squashfs support.

The test also serves to demonstrate usage of a verity image, more
complex setup may use an initramfs instead of dm-mod.create.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/fs/test_squashfs.py          | 90 ++++++++++++++++++++++
 .../tests/fs/test_squashfs/genimage-verity.cfg     | 14 ++++
 .../tests/fs/test_squashfs/linux-verity.fragment   |  8 ++
 3 files changed, 112 insertions(+)

diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
index 0ceb4cab58..62ae8d6c7c 100644
--- a/support/testing/tests/fs/test_squashfs.py
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -1,4 +1,5 @@
 import os
+import re
 
 import infra.basetest
 
@@ -55,3 +56,92 @@ class TestSquashfsMaxBlocksize(TestSquashfs):
         # BR2_TARGET_ROOTFS_TAR is not set
         """
     expected_blocksize_in_bytes = 1024*1024
+
+
+class TestSquashfsVerity(infra.basetest.BRTest):
+    kernel_fragment = \
+        infra.filepath("tests/fs/test_squashfs/linux-verity.fragment")
+    genimage_config = \
+        infra.filepath("tests/fs/test_squashfs/genimage-verity.cfg")
+    hash_algo = "sha384"
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.52"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
+        BR2_TARGET_ROOTFS_SQUASHFS_VERITY=y
+        BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS="--hash {hash_algo}"
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="-c {genimage_config}"
+        BR2_PACKAGE_CRYPTSETUP=y
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self) -> None:
+        img = os.path.join(self.builddir, "images", "rootfs.squashfs")
+        hash_img = f"{img}.verity"
+        root_hash_file = f"{hash_img}.root-hash"
+        verify_cmd = [
+            "host/sbin/veritysetup", "verify",
+            "--root-hash-file", root_hash_file, img, hash_img
+        ]
+        infra.run_cmd_on_host(self.builddir, verify_cmd)
+
+        dump_cmd = ["host/sbin/veritysetup", "dump", hash_img]
+        out = infra.run_cmd_on_host(self.builddir, dump_cmd)
+        params = dict()
+        for line in out.splitlines():
+            m = re.match(r"^(.*):\s+(\S+)", line)
+            if m is None:
+                continue
+            params[m.group(1)] = m.group(2)
+
+        data_block_size = int(params["Data block size"])
+        data_blocks = int(params["Data blocks"])
+        sector_size = 512  # default
+        data_sectors = data_blocks * data_block_size // sector_size
+        hash_algorithm = params["Hash algorithm"]
+        hash_start_block = 1  # skip header
+        hash_block_size = int(params["Hash block size"])
+        salt = params["Salt"]
+        with open(root_hash_file) as fh:
+            root_hash = fh.read()
+
+        # check if setting --hash in
+        # BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS worked
+        self.assertEqual(hash_algorithm, self.hash_algo)
+
+        disk_img = os.path.join(self.builddir, "images", "disk.img")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(
+            arch="aarch64",
+            kernel=kern,
+            kernel_cmdline=[
+                "console=ttyAMA0",
+                "root=/dev/dm-0",
+                "rootfstype=squashfs",
+                f'dm-mod.create="verity,,,ro,0 {data_sectors} verity 1 '
+                f'/dev/vda1 /dev/vda2 {data_block_size} {hash_block_size} '
+                f'{data_blocks} {hash_start_block} {hash_algorithm} '
+                f'{root_hash} {salt}"',
+            ],
+            options=[
+                "-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                "-drive", f"file={disk_img},if=virtio,format=raw",
+            ])
+        self.emulator.login()
+
+        self.assertRunOk("mount | grep '/dev/root on / type squashfs'")
+        out, ret = self.emulator.run("dmsetup info verity", 5)
+        self.assertEqual(ret, 0)
+        state = next(filter(lambda s: s.startswith("State:"), out))
+        self.assertRegex(state, r"^State:\s+ACTIVE \(READ-ONLY\)$")
diff --git a/support/testing/tests/fs/test_squashfs/genimage-verity.cfg b/support/testing/tests/fs/test_squashfs/genimage-verity.cfg
new file mode 100644
index 0000000000..13761dca8e
--- /dev/null
+++ b/support/testing/tests/fs/test_squashfs/genimage-verity.cfg
@@ -0,0 +1,14 @@
+image disk.img {
+	hdimage {
+	}
+
+	partition root {
+		partition-type = 0x83
+		image = "rootfs.squashfs"
+	}
+
+	partition verity {
+		partition-type = 0x83
+		image = "rootfs.squashfs.verity"
+	}
+}
diff --git a/support/testing/tests/fs/test_squashfs/linux-verity.fragment b/support/testing/tests/fs/test_squashfs/linux-verity.fragment
new file mode 100644
index 0000000000..a559a51ee2
--- /dev/null
+++ b/support/testing/tests/fs/test_squashfs/linux-verity.fragment
@@ -0,0 +1,8 @@
+CONFIG_MD=y
+CONFIG_BLK_DEV_DM=y
+CONFIG_DM_VERITY=y
+CONFIG_DM_INIT=y
+CONFIG_CRYPTO_SHA512=y
+CONFIG_MISC_FILESYSTEMS=y
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_LZO=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
