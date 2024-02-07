Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E3CC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5420A81FD2;
	Wed,  7 Feb 2024 15:36:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0f4jSC1XP-hd; Wed,  7 Feb 2024 15:36:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DB0383B9B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DB0383B9B;
	Wed,  7 Feb 2024 15:36:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C23A01BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCA0E83B9F
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:36:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BYQPjoo6fjqX for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:36:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D585E83B9B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D585E83B9B
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:36:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD600875E6; Wed,  7 Feb 2024 15:36:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 16:36:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3118b7e222e8a56847daa17aae5ea1c2bb083837
X-Git-Newrev: cd56ac9eb63f0acecd78b1983f9d889f21f8fe0e
X-Patchwork-Hint: ignore
Message-Id: <20240207153646.BD600875E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add optee-os runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd56ac9eb63f0acecd78b1983f9d889f21f8fe0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/boot/test_optee_os.py        | 74 ++++++++++++++++++++++
 .../tests/boot/test_optee_os/u-boot.fragment       |  8 +++
 3 files changed, 84 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 43dd5c8cb4..8e65a93122 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1754,6 +1754,8 @@ F:	package/riscv-isa-sim/
 F:	package/tinycompress/
 F:	package/z3/
 F:	package/zynaddsubfx/
+F:	support/testing/tests/boot/test_optee_os.py
+F:	support/testing/tests/boot/test_optee_os/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_hwdata.py
diff --git a/support/testing/tests/boot/test_optee_os.py b/support/testing/tests/boot/test_optee_os.py
new file mode 100644
index 0000000000..5f5cd17464
--- /dev/null
+++ b/support/testing/tests/boot/test_optee_os.py
@@ -0,0 +1,74 @@
+import os
+
+import infra.basetest
+
+
+class TestOptee(infra.basetest.BRTest):
+    # A custom configuration is needed to enable OP-TEE support in the
+    # Kernel. This config is inspired from:
+    # configs/qemu_arm_vexpress_tz_defconfig
+    uboot_fragment = \
+        infra.filepath("tests/boot/test_optee_os/u-boot.fragment")
+    config = \
+        f"""
+        BR2_arm=y
+        BR2_cortex_a15=y
+        BR2_ARM_FPU_VFPV3D16=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/arm-vexpress-tz/post-build.sh"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.73"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
+        BR2_PACKAGE_OPTEE_EXAMPLES=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BL32_RAM_LOCATION=tdram"
+        BR2_TARGET_OPTEE_OS=y
+        BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
+        BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
+        BR2_TARGET_UBOOT=y
+        BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+        BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
+        BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm"
+        BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="{uboot_fragment}"
+        """
+
+    def test_run(self):
+        # There is no Kernel nor rootfs image here. They will be
+        # loaded by TFTP through the emulated network interface in
+        # u-boot.
+        bios = os.path.join(self.builddir, "images", "flash.bin")
+        tftp_dir = os.path.join(self.builddir, "images")
+        self.emulator.boot(arch="arm",
+                           options=["-M", "virt,secure=on",
+                                    "-d", "unimp",
+                                    "-cpu", "cortex-a15",
+                                    "-m", "1024M",
+                                    "-netdev", f"user,id=vmnic,tftp={tftp_dir}",
+                                    "-device", "virtio-net-device,netdev=vmnic",
+                                    "-bios", bios])
+        self.emulator.login()
+
+        # Check the Kernel has OP-TEE messages
+        self.assertRunOk("dmesg | grep -F optee:")
+
+        # Check we have OP-TEE devices
+        self.assertRunOk("ls -al /dev/tee*")
+
+        # Run some OP-TEE examples
+        examples = ["aes", "hello_world", "hotp", "random", "secure_storage"]
+        for ex in examples:
+            self.assertRunOk(f"optee_example_{ex}")
diff --git a/support/testing/tests/boot/test_optee_os/u-boot.fragment b/support/testing/tests/boot/test_optee_os/u-boot.fragment
new file mode 100644
index 0000000000..b9505a1ff8
--- /dev/null
+++ b/support/testing/tests/boot/test_optee_os/u-boot.fragment
@@ -0,0 +1,8 @@
+CONFIG_SYS_TEXT_BASE=0x60000000
+CONFIG_BOOTCOMMAND="setenv ipaddr 10.0.2.15 && setenv serverip 10.0.2.2 && tftp ${kernel_addr_r} zImage && tftp ${ramdisk_addr_r} rootfs.cpio.uboot && setenv bootargs console=ttyAMA0,115200 earlyprintk=serial,ttyAMA0,115200 && bootz ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr}"
+CONFIG_SEMIHOSTING=y
+# Drop flash accesses
+CONFIG_ENV_IS_IN_FLASH=n
+CONFIG_MTD=n
+CONFIG_MTD_NOR_FLASH=n
+CONFIG_ENV_IS_NOWHERE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
