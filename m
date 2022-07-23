Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3313BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDA4484BA3;
	Sat, 23 Jul 2022 17:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDA4484BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pLpTUIxbk9Ls; Sat, 23 Jul 2022 17:05:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90D9484BFB;
	Sat, 23 Jul 2022 17:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90D9484BFB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46C081BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 217A84055E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 217A84055E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p8Q3is6hBVMx for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:04:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 068FA404DF
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 068FA404DF
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BA89B847EE; Sat, 23 Jul 2022 16:51:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 19:04:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13bb4199386ddfc8a6aa5946e4aeabe6ef311b6b
X-Git-Newrev: 7dcd979098739b568ba2624099d09baa22505248
X-Patchwork-Hint: ignore
Message-Id: <20220723165112.BA89B847EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/boot: new test cases
 for Grub
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

commit: https://git.buildroot.net/buildroot/commit/?id=7dcd979098739b568ba2624099d09baa22505248
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds four test cases for Grub:

 - Grub i386 legacy BIOS
 - Grub i386 UEFI
 - Grub x86-64 UEFI
 - Grub AArch64 UEFI

There is some overlap with the ISO9660 filesystem test cases, some of
which use Grub, but we found it relevant to have separate test cases
for Grub, which were useful to test Grub in non-ISO9660 situations.

The Grub ARM UEFI case is not tested, as it requires Grub to be
chain-loaded by U-Boot. Implementing this test case is left as an
exercise for the reader.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr:
  - use EDK2 to build the OVMF blurbs from source, instead of the
    binary blobs
  - add host-dosfstools
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |   2 +
 support/testing/tests/boot/test_grub.py            | 156 +++++++++++++++++++++
 .../tests/boot/test_grub/genimage-aarch64-efi.cfg  |  32 +++++
 .../tests/boot/test_grub/grub-aarch64-efi.cfg      |   6 +
 .../tests/boot/test_grub/linux-aarch64-efi.config  |   1 +
 support/testing/tests/boot/test_grub/post-build.sh |   7 +
 .../tests/boot/test_grub/post-image-aarch64-efi.sh |   8 ++
 7 files changed, 212 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b61074670a..28d85d7370 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2871,6 +2871,8 @@ F:	package/squashfs/
 F:	package/tinifier/
 F:	package/wayland/
 F:	package/weston/
+F:	support/testing/tests/boot/test_grub.py
+F:	support/testing/tests/boot/test_grub/
 F:	support/testing/tests/boot/test_syslinux.py
 F:	support/testing/tests/package/sample_python_augeas.py
 F:	support/testing/tests/package/sample_python_flask.py
diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
new file mode 100644
index 0000000000..2c393f730e
--- /dev/null
+++ b/support/testing/tests/boot/test_grub.py
@@ -0,0 +1,156 @@
+import os
+
+import infra.basetest
+
+
+class TestGrubi386BIOS(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_x86_core2=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE=y
+        BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
+        BR2_LINUX_KERNEL_INSTALL_TARGET=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_GRUB2=y
+        BR2_TARGET_GRUB2_I386_PC=y
+        BR2_TARGET_GRUB2_INSTALL_TOOLS=y
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
+
+    def test_run(self):
+        hda = os.path.join(self.builddir, "images", "disk.img")
+        self.emulator.boot(arch="i386", options=["-hda", hda])
+        self.emulator.login()
+
+
+class TestGrubi386EFI(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_x86_core2=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE=y
+        BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
+        BR2_LINUX_KERNEL_INSTALL_TARGET=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_EFIVAR=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_EDK2=y
+        BR2_TARGET_GRUB2=y
+        BR2_TARGET_GRUB2_I386_EFI=y
+        BR2_TARGET_GRUB2_INSTALL_TOOLS=y
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        BR2_PACKAGE_HOST_MTOOLS=y
+        BR2_PACKAGE_HOST_DOSFSTOOLS=y
+        """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
+
+    def test_run(self):
+        hda = os.path.join(self.builddir, "images", "disk.img")
+        bios = os.path.join(self.builddir, "images", "OVMF.fd")
+        self.emulator.boot(arch="i386", options=["-bios", bios, "-hda", hda])
+        self.emulator.login()
+
+        cmd = "modprobe efivarfs"
+        self.assertRunOk(cmd)
+
+        cmd = "mount -t efivarfs none /sys/firmware/efi/efivars"
+        self.assertRunOk(cmd)
+
+        cmd = "efivar -l"
+        self.assertRunOk(cmd)
+
+
+class TestGrubX8664EFI(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_x86_64=y
+        BR2_x86_corei7=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE=y
+        BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
+        BR2_LINUX_KERNEL_INSTALL_TARGET=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_EFIVAR=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_EDK2=y
+        BR2_TARGET_GRUB2=y
+        BR2_TARGET_GRUB2_X86_64_EFI=y
+        BR2_TARGET_GRUB2_INSTALL_TOOLS=y
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        BR2_PACKAGE_HOST_MTOOLS=y
+        BR2_PACKAGE_HOST_DOSFSTOOLS=y
+        """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
+
+    def test_run(self):
+        hda = os.path.join(self.builddir, "images", "disk.img")
+        bios = os.path.join(self.builddir, "images", "OVMF.fd")
+        self.emulator.boot(arch="x86_64", options=["-bios", bios, "-hda", hda])
+        self.emulator.login()
+
+        cmd = "modprobe efivarfs"
+        self.assertRunOk(cmd)
+
+        cmd = "mount -t efivarfs none /sys/firmware/efi/efivars"
+        self.assertRunOk(cmd)
+
+        cmd = "efivar -l"
+        self.assertRunOk(cmd)
+
+
+class TestGrubAArch64EFI(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="{post_image}"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{linux_fragment}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_EFIVAR=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_EDK2=y
+        BR2_TARGET_GRUB2=y
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        BR2_PACKAGE_HOST_MTOOLS=y
+        BR2_PACKAGE_HOST_DOSFSTOOLS=y
+        """.format(post_image=infra.filepath("tests/boot/test_grub/post-image-aarch64-efi.sh"),
+                   linux_fragment=infra.filepath("tests/boot/test_grub/linux-aarch64-efi.config"))
+
+    def test_run(self):
+        hda = os.path.join(self.builddir, "images", "disk.img")
+        bios = os.path.join(self.builddir, "images", "QEMU_EFI.fd")
+        self.emulator.boot(arch="aarch64", options=["-M", "virt", "-cpu", "cortex-a53", "-bios", bios, "-hda", hda])
+        self.emulator.login()
+
+        cmd = "modprobe efivarfs"
+        self.assertRunOk(cmd)
+
+        cmd = "mount -t efivarfs none /sys/firmware/efi/efivars"
+        self.assertRunOk(cmd)
+
+        cmd = "efivar -l"
+        self.assertRunOk(cmd)
diff --git a/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg b/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg
new file mode 100644
index 0000000000..11615c885a
--- /dev/null
+++ b/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg
@@ -0,0 +1,32 @@
+image efi-part.vfat {
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+
+		file Image {
+			image = "Image"
+		}
+	}
+
+	size = 16352K # 16MB - 32KB
+}
+
+image disk.img {
+	hdimage {
+		partition-table-type = "gpt"
+	}
+
+	partition boot {
+		image = "efi-part.vfat"
+		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		offset = 32K
+		bootable = true
+	}
+
+	partition root {
+		partition-type-uuid = 44479540-f297-41b2-9af7-d131d5f0458a
+		partition-uuid = UUID_TMP
+		image = "rootfs.ext2"
+	}
+}
diff --git a/support/testing/tests/boot/test_grub/grub-aarch64-efi.cfg b/support/testing/tests/boot/test_grub/grub-aarch64-efi.cfg
new file mode 100644
index 0000000000..d40af0df24
--- /dev/null
+++ b/support/testing/tests/boot/test_grub/grub-aarch64-efi.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+ linux /Image root=PARTUUID=UUID_TMP rootwait console=ttyAMA0
+}
diff --git a/support/testing/tests/boot/test_grub/linux-aarch64-efi.config b/support/testing/tests/boot/test_grub/linux-aarch64-efi.config
new file mode 100644
index 0000000000..839566bae0
--- /dev/null
+++ b/support/testing/tests/boot/test_grub/linux-aarch64-efi.config
@@ -0,0 +1 @@
+CONFIG_ACPI=y
diff --git a/support/testing/tests/boot/test_grub/post-build.sh b/support/testing/tests/boot/test_grub/post-build.sh
new file mode 100755
index 0000000000..8d6f0318de
--- /dev/null
+++ b/support/testing/tests/boot/test_grub/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+if [ -d "$BINARIES_DIR/efi-part/" ]; then
+    sed -i 's%tty1%ttyS0,115200%' "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
+else
+    sed -i 's%tty1%ttyS0,115200%' "$TARGET_DIR/boot/grub/grub.cfg"
+fi
diff --git a/support/testing/tests/boot/test_grub/post-image-aarch64-efi.sh b/support/testing/tests/boot/test_grub/post-image-aarch64-efi.sh
new file mode 100755
index 0000000000..2db516ef2d
--- /dev/null
+++ b/support/testing/tests/boot/test_grub/post-image-aarch64-efi.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+set -e
+
+UUID=$(dumpe2fs "$BINARIES_DIR/rootfs.ext2" 2>/dev/null | sed -n 's/^Filesystem UUID: *\(.*\)/\1/p')
+sed "s/UUID_TMP/$UUID/g" support/testing/tests/boot/test_grub/grub-aarch64-efi.cfg > "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
+sed "s/UUID_TMP/$UUID/g" support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg > "$BINARIES_DIR/genimage-aarch64-efi.cfg"
+support/scripts/genimage.sh -c "$BINARIES_DIR/genimage-aarch64-efi.cfg"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
