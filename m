Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9F4C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 21:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFCEB40453;
	Sun, 14 Jul 2024 21:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O6XlHlUCNt9y; Sun, 14 Jul 2024 21:35:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B41A4012B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B41A4012B;
	Sun, 14 Jul 2024 21:35:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CCF31BF3CE
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 21:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 588ED4050B
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 21:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqhnwjaFkoAm for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 21:35:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E5EB4404FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5EB4404FF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5EB4404FF
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 21:35:39 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 34606B0055A;
 Sun, 14 Jul 2024 23:35:35 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 23:35:30 +0200
Message-ID: <20240714213530.497428-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720992936;
 bh=F1Fu4mWr6N1SRDRsfQbVuQOYCh6j/UzSnc6vQGnQ7lA=;
 h=From:To:Cc:Subject:Date:From;
 b=g5GEz25Ib+iYS53fz4nggJO12i1KGaNVtDDkfDZtX1ymqDWw9j3VCOwvBBB3Cy85/
 GfoyZ9r4nkjHEJpgYO7137l6ZE2KgCnDFebbWl9qhs1MkasMxSXWIYRv8syaV9JOk3
 dnh/ZUigapR08qHDy8+9pJiaNgdeaJvwqZbFXwAEUkqzJt5ZtGB8u0yQKnwB8d2ebv
 BzrrFh9GLXvyU4H0INLiXwzP6vYGaaaSfDx9K4J4IvdBloSk1kSU6Mg6zwk/0M/h52
 P2txScisKcpiSdwEfTJZ27Gr/oPQXmjTCa9ax1NllKzNa2yPvfw9D26gRCu48v4f0P
 HskJ6ebGmnfgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g5GEz25I
Subject: [Buildroot] [PATCH 1/1] support/testing: fs: new btrfs runtime test
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
For reference, this test was proposed in:
https://lists.buildroot.org/pipermail/buildroot/2024-July/757853.html
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/fs/test_btrfs.py        | 56 +++++++++++++++++++
 .../tests/fs/test_btrfs/linux-btrfs.fragment  |  1 +
 3 files changed, 59 insertions(+)
 create mode 100644 support/testing/tests/fs/test_btrfs.py
 create mode 100644 support/testing/tests/fs/test_btrfs/linux-btrfs.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 9f67e3b02f..6d989b1e72 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1808,6 +1808,8 @@ F:	package/z3/
 F:	package/zynaddsubfx/
 F:	support/testing/tests/boot/test_optee_os.py
 F:	support/testing/tests/boot/test_optee_os/
+F:	support/testing/tests/fs/test_btrfs.py
+F:	support/testing/tests/fs/test_btrfs/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_hwdata.py
diff --git a/support/testing/tests/fs/test_btrfs.py b/support/testing/tests/fs/test_btrfs.py
new file mode 100644
index 0000000000..90b868a955
--- /dev/null
+++ b/support/testing/tests/fs/test_btrfs.py
@@ -0,0 +1,56 @@
+import os
+
+import infra.basetest
+
+
+class TestBtrfs(infra.basetest.BRTest):
+    kern_frag = \
+        infra.filepath("tests/fs/test_btrfs/linux-btrfs.fragment")
+    btrfs_label = "BR_TEST"
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.39"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_BTRFS_PROGS=y
+        BR2_TARGET_ROOTFS_BTRFS=y
+        BR2_TARGET_ROOTFS_BTRFS_LABEL="{btrfs_label}"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        disk = os.path.join(self.builddir, "images", "rootfs.btrfs")
+        kern = os.path.join(self.builddir, "images", "Image")
+        bootargs = ["root=/dev/vda", "console=ttyAMA0"]
+        qemu_opts = ["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                     "-drive", f"file={disk},if=virtio,format=raw"]
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=bootargs,
+                           options=qemu_opts)
+        self.emulator.login()
+
+        # We check our root filesystem is in btrfs format.
+        cmd = "mount | grep '/dev/root on / type btrfs'"
+        self.assertRunOk(cmd)
+
+        # We show the root filesystem info with btrfs-progs, using the
+        # target btrfs-progs.
+        self.assertRunOk("btrfs filesystem show /")
+
+        # We query the label and check it is the one from the
+        # Buildroot config.
+        out, ret = self.emulator.run("btrfs filesystem label /")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], self.btrfs_label)
+
+        # We try to write data on the root filesystem.
+        self.assertRunOk("echo 'Hello Buildroot' > /root/file.txt")
+        self.assertRunOk("sync")
diff --git a/support/testing/tests/fs/test_btrfs/linux-btrfs.fragment b/support/testing/tests/fs/test_btrfs/linux-btrfs.fragment
new file mode 100644
index 0000000000..605c1837e1
--- /dev/null
+++ b/support/testing/tests/fs/test_btrfs/linux-btrfs.fragment
@@ -0,0 +1 @@
+CONFIG_BTRFS_FS=y
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
