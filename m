Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F29AD3ABF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 20:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4288606E6;
	Mon, 11 Nov 2024 20:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtzY8oFUDllc; Mon, 11 Nov 2024 20:15:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D64AC606FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D64AC606FF;
	Mon, 11 Nov 2024 20:15:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7201C6C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F10C401A2
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IsH-_WTkGWIl for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 20:15:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24C8640124
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24C8640124
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:15:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F5B9860D6; Mon, 11 Nov 2024 20:15:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 21:15:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48490cf7b13a9f0e942adb7bb4691a9459137db6
X-Git-Newrev: fca1933e19c2707be6c7bcd9e27618bbf1ffc9af
X-Patchwork-Hint: ignore
Message-Id: <20241111201555.0F5B9860D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/boot/test_grub.py:
 new test for RISCV64 EFI
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fca1933e19c2707be6c7bcd9e27618bbf1ffc9af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit f439b47ed "boot/grub2: add RISC-V 64bit EFI support" [1]
introduced the grub2 RISC-V UEFI support.

At that time, it was not possible to have a runtime test for this.
qemu-system-riscv64 is not in the Buildroot Docker reference image,
and the base distribution (Debian 11) does not provide a
sufficiently recent version. A qemu-system-riscv64 >= 8.0.0 is needed.

Commit 0d4177598 "support/testing/infra/emulator.py: add build host
dir to qemu search path" [2] added the capability to use the
Buildroot host-qemu package inside runtime test.

With this support, it is now possible to add a runtime test for a
grub2 UEFI boot on RISC-V 64bit.

Also, due to an upstream edk2 git submodule issue, this commit
includes a workaround to use https://sources.buildroot.net for this
test. See [3].

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/f439b47ed6e987306c7de6d9c3be11de04935377
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/0d4177598ce7e73f2b97ac58c21fb177343643e3
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/47fc9e5509837260310cd7e41335fade29b587b1

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/boot/test_grub.py | 72 +++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index c6e86f7b71..5cbc7fd22b 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -238,3 +238,75 @@ class TestGrubAArch64EFI(infra.basetest.BRTest):
 
         cmd = "efivar -l"
         self.assertRunOk(cmd)
+
+
+class TestGrubRiscV64EFI(infra.basetest.BRTest):
+    scripts = [
+        "board/qemu/post-image.sh",
+        "board/qemu/riscv64-virt-efi/assemble-flash-images",
+        "support/scripts/genimage.sh"
+    ]
+    post_image_script = " ".join(scripts)
+    config = \
+        f"""
+        BR2_riscv=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="{post_image_script}"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/riscv64-virt-efi/genimage.cfg"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.59"
+        BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+        BR2_PACKAGE_EFIVAR=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_EDK2=y
+        BR2_TARGET_GRUB2=y
+        BR2_TARGET_GRUB2_RISCV64_EFI=y
+        BR2_PACKAGE_HOST_DOSFSTOOLS=y
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        BR2_PACKAGE_HOST_MTOOLS=y
+        BR2_PACKAGE_HOST_QEMU=y
+        BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
+        """
+
+    def __init__(self, names):
+        """Setup common test variables."""
+        super(TestGrubRiscV64EFI, self).__init__(names)
+        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
+           anymore due to a missing git submodule as reported by [1].
+
+           Usually Buildroot fall-back using https://sources.buildroot.net
+           thanks to BR2_BACKUP_SITE where a backup of the generated archive
+           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
+           value while generating the .config used by TestGrubAArch64EFI.
+
+           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
+           to continue testing EDK2 package using the usual backup site.
+
+           To be removed with the next EDK2 version bump using this commit
+           [2].
+
+           [1] https://github.com/tianocore/edk2/issues/6398
+           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
+        """
+        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
+
+    def test_run(self):
+        disk = os.path.join(self.builddir, "images", "disk.img")
+        flash0 = os.path.join(self.builddir, "images", "RISCV_VIRT_CODE.fd")
+        flash1 = os.path.join(self.builddir, "images", "RISCV_VIRT_VARS.fd")
+        qemu_opts = [
+            "-M", "virt,pflash0=pflash0,pflash1=pflash1,acpi=off",
+            "-blockdev", f"node-name=pflash0,driver=file,read-only=on,filename={flash0}",
+            "-blockdev", f"node-name=pflash1,driver=file,filename={flash1}",
+            "-drive", f"file={disk},format=raw,if=virtio"
+        ]
+        self.emulator.boot(arch="riscv64", options=qemu_opts)
+        self.emulator.login()
+
+        cmd = "mount -t efivarfs none /sys/firmware/efi/efivars"
+        self.assertRunOk(cmd)
+
+        cmd = "efivar -l"
+        self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
