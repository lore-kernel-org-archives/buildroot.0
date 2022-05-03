Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC01C433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1754040B37;
	Tue,  3 May 2022 20:34:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Js9-PsKt9C4e; Tue,  3 May 2022 20:34:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B6A740B42;
	Tue,  3 May 2022 20:34:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4240F1BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3006A40ABF
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mpo95IKoozyS for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:34:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7263E40528
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:34:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 171778555E; Tue,  3 May 2022 20:23:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 May 2022 22:32:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4077fc834cb9e7aa1b9442c43b03a0f23067961
X-Git-Newrev: 593e8cb71f8f2ac69889424bbef5ab09c0dbb06e
X-Patchwork-Hint: ignore
Message-Id: <20220503202359.171778555E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: refactor test cases
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
Content-Type: multipart/mixed; boundary="===============1165828372831689129=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1165828372831689129==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=593e8cb71f8f2ac69889424bbef5ab09c0dbb06e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add TestZfsBase that contains the common parts of the test.

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/test_zfs.py | 62 +++++--------------------------
 1 file changed, 10 insertions(+), 52 deletions(-)

diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
index 706934ca65..1cc030e78c 100644
--- a/support/testing/tests/package/test_zfs.py
+++ b/support/testing/tests/package/test_zfs.py
@@ -3,13 +3,12 @@ import os
 import infra.basetest
 
 
-class TestZfsGlibc(infra.basetest.BRTest):
+class TestZfsBase(infra.basetest.BRTest):
     config = \
         """
         BR2_x86_64=y
         BR2_x86_corei7=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE=y
         BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
@@ -60,58 +59,17 @@ class TestZfsGlibc(infra.basetest.BRTest):
             self.assertRunOk(cmd)
 
 
-class TestZfsUclibc(infra.basetest.BRTest):
-    config = \
+class TestZfsGlibc(TestZfsBase):
+    config = TestZfsBase.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE=y
+        """
+
+
+class TestZfsUclibc(TestZfsBase):
+    config = TestZfsBase.config + \
         """
-        BR2_x86_64=y
-        BR2_x86_corei7=y
-        BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE=y
-        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.35"
-        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
-        BR2_PACKAGE_ZFS=y
-        BR2_PACKAGE_PYTHON3=y
-        BR2_PACKAGE_PYTHON_CFFI=y
-        BR2_PACKAGE_PYTHON_SETUPTOOLS=y
-        BR2_PACKAGE_ZLIB_NG=y
-        BR2_PACKAGE_LIBRESSL=y
-        BR2_TARGET_ROOTFS_CPIO=y
-        # BR2_TARGET_ROOTFS_TAR is not set
         """
 
-    def test_run(self):
-        kernel = os.path.join(self.builddir, "images", "bzImage")
-        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(
-            arch="x86_64",
-            kernel=kernel,
-            kernel_cmdline=["console=ttyS0"],
-            options=["-cpu", "Nehalem", "-m", "320", "-initrd", cpio_file],
-        )
-        self.emulator.login()
 
-        cmds = [
-            # Init
-            "modprobe zfs",
-            "mount -o remount,size=132M /tmp",
-            "fallocate -l 64M /tmp/container1.raw",
-            "fallocate -l 64M /tmp/container2.raw",
-            "zpool create -m /pool pool raidz /tmp/container1.raw /tmp/container2.raw",
-            "dd if=/dev/urandom bs=1M count=8 of=/pool/urandom",
-            "sha256sum /pool/urandom > /tmp/urandom.sha256",
-            # Check ZFS
-            "zpool export pool",
-            "zpool import pool -d /tmp/container1.raw -d /tmp/container2.raw",
-            "dd conv=notrunc bs=1M count=32 seek=16 if=/dev/urandom of=/tmp/container1.raw",
-            "zpool scrub -w pool",
-            "sha256sum -c /tmp/urandom.sha256",
-            "zpool status -v",
-            # Check PyZFS
-            "arc_summary",
-        ]
-        for cmd in cmds:
-            self.assertRunOk(cmd)

--===============1165828372831689129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1165828372831689129==--
