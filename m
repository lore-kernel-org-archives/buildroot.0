Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A085C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BA6784FDF;
	Fri, 28 Feb 2025 16:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RPmiasLtLiQ4; Fri, 28 Feb 2025 16:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC0AA84FE0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC0AA84FE0;
	Fri, 28 Feb 2025 16:58:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BC6A94F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DAA64257D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfv5Zjg7e6VT for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B7C742DC0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B7C742DC0
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 545098118C; Fri, 28 Feb 2025 16:30:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 14 Jan 2025 20:54:24 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fb032bd34acf57f86f62bd474cbabd4e1e750e67
X-Git-Newrev: 055f82ebbd07b582c992eed30ef5191f18873ba4
X-Patchwork-Hint: ignore
Message-Id: <20250228163009.545098118C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: new xen
 runtime test
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6013762031731114433=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6013762031731114433==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=055f82ebbd07b582c992eed30ef5191f18873ba4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
[Julien: switch to human readable genimage.cfg partition uuid]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |   2 +
 support/testing/tests/package/test_xen.py          |  65 +++++++
 .../testing/tests/package/test_xen/genimage.cfg    |  35 ++++
 .../testing/tests/package/test_xen/linux.config    | 204 +++++++++++++++++++++
 .../testing/tests/package/test_xen/post-image.sh   |   7 +
 support/testing/tests/package/test_xen/xen.cfg     |   2 +
 6 files changed, 315 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 16b72eee08..47644c8d5c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3294,6 +3294,8 @@ F:	package/pixz/
 F:	package/zerofree/
 F:	support/testing/tests/package/test_msr_tools*
 F:	support/testing/tests/package/test_pixz.py
+F:	support/testing/tests/package/test_xen.py
+F:	support/testing/tests/package/test_xen/
 F:	support/testing/tests/package/test_zerofree.py
 
 N:	Vinicius Tinti <viniciustinti@gmail.com>
diff --git a/support/testing/tests/package/test_xen.py b/support/testing/tests/package/test_xen.py
new file mode 100644
index 0000000000..875ba19e70
--- /dev/null
+++ b/support/testing/tests/package/test_xen.py
@@ -0,0 +1,65 @@
+import os
+import infra.basetest
+
+
+class TestXen(infra.basetest.BRTest):
+    # We have a custom kernel config to reduce build time.
+    # Our genimage.cfg is inspired from qemu_aarch64_ebbr_defconfig as we boot
+    # Xen with UEFI.
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="support/testing/tests/package/test_xen/post-image.sh support/scripts/genimage.sh"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="-c support/testing/tests/package/test_xen/genimage.cfg"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="support/testing/tests/package/test_xen/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_XEN=y
+        BR2_PACKAGE_XEN_HYPERVISOR=y
+        BR2_PACKAGE_XEN_TOOLS=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_UBOOT=y
+        BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+        BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+        BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm64"
+        BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+        BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+        BR2_PACKAGE_HOST_DOSFSTOOLS=y
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        BR2_PACKAGE_HOST_MTOOLS=y
+        """
+
+    def test_run(self):
+        uboot_bin = os.path.join(self.builddir, "images", "u-boot.bin")
+        disk_img = os.path.join(self.builddir, "images", "disk.img")
+
+        qemu_opts = [
+            "-bios", uboot_bin,
+            "-cpu", "cortex-a53",
+            "-device", "virtio-blk-device,drive=hd0",
+            "-drive", f"file={disk_img},if=none,format=raw,id=hd0",
+            "-m", "2G",
+            "-machine", "virt,gic-version=3,virtualization=on,acpi=off",
+            "-smp", "2"
+        ]
+
+        # Boot the emulator:
+        # Qemu Devicetree -> U-Boot -> Xen UEFI -> Linux
+        self.emulator.boot(arch="aarch64",
+                           options=qemu_opts)
+        self.emulator.login()
+
+        # Avoid double-cooking the terminal, otherwise the test infrastructure
+        # would not be able to retrieve e.g. return codes properly.
+        self.assertRunOk("stty raw")
+
+        # Verify that we are indeed running under Xen.
+        self.assertRunOk("xl info")
diff --git a/support/testing/tests/package/test_xen/genimage.cfg b/support/testing/tests/package/test_xen/genimage.cfg
new file mode 100644
index 0000000000..6d8ec8ad8e
--- /dev/null
+++ b/support/testing/tests/package/test_xen/genimage.cfg
@@ -0,0 +1,35 @@
+image efi-part.vfat {
+	vfat {
+		file EFI/BOOT/bootaa64.efi {
+			image = "xen"
+		}
+
+		file EFI/BOOT/bootaa64.cfg {
+			image = "xen.cfg"
+		}
+
+		files = {
+			"Image",
+		}
+	}
+
+	size = 16M
+}
+
+image disk.img {
+	hdimage {
+		partition-table-type = "gpt"
+	}
+
+	partition boot {
+		image = "efi-part.vfat"
+		partition-type-uuid = U
+		offset = 32K
+		bootable = true
+	}
+
+	partition root {
+		partition-type-uuid = root-arm64
+		image = "rootfs.ext2"
+	}
+}
diff --git a/support/testing/tests/package/test_xen/linux.config b/support/testing/tests/package/test_xen/linux.config
new file mode 100644
index 0000000000..e0323d0325
--- /dev/null
+++ b/support/testing/tests/package/test_xen/linux.config
@@ -0,0 +1,204 @@
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_IRQ_TIME_ACCOUNTING=y
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
+# CONFIG_CPU_ISOLATION is not set
+# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
+CONFIG_KALLSYMS_ALL=y
+CONFIG_ARCH_VEXPRESS=y
+# CONFIG_AMPERE_ERRATUM_AC03_CPU_38 is not set
+# CONFIG_ARM64_ERRATUM_832075 is not set
+# CONFIG_ARM64_ERRATUM_1024718 is not set
+# CONFIG_ARM64_ERRATUM_1165522 is not set
+# CONFIG_ARM64_ERRATUM_1319367 is not set
+# CONFIG_ARM64_ERRATUM_1530923 is not set
+# CONFIG_ARM64_ERRATUM_1463225 is not set
+# CONFIG_ARM64_ERRATUM_1508412 is not set
+# CONFIG_ARM64_ERRATUM_2051678 is not set
+# CONFIG_ARM64_ERRATUM_2077057 is not set
+# CONFIG_ARM64_ERRATUM_2658417 is not set
+# CONFIG_ARM64_ERRATUM_2054223 is not set
+# CONFIG_ARM64_ERRATUM_2067961 is not set
+# CONFIG_ARM64_ERRATUM_2645198 is not set
+# CONFIG_ARM64_ERRATUM_2966298 is not set
+# CONFIG_ARM64_ERRATUM_3117295 is not set
+# CONFIG_ARM64_ERRATUM_3194386 is not set
+# CONFIG_CAVIUM_ERRATUM_22375 is not set
+# CONFIG_CAVIUM_ERRATUM_23154 is not set
+# CONFIG_CAVIUM_ERRATUM_27456 is not set
+# CONFIG_CAVIUM_ERRATUM_30115 is not set
+# CONFIG_CAVIUM_TX2_ERRATUM_219 is not set
+# CONFIG_FUJITSU_ERRATUM_010001 is not set
+# CONFIG_HISILICON_ERRATUM_161600802 is not set
+# CONFIG_HISILICON_ERRATUM_162100801 is not set
+# CONFIG_QCOM_FALKOR_ERRATUM_1003 is not set
+# CONFIG_QCOM_FALKOR_ERRATUM_1009 is not set
+# CONFIG_QCOM_QDF2400_ERRATUM_0065 is not set
+# CONFIG_QCOM_FALKOR_ERRATUM_E1041 is not set
+# CONFIG_NVIDIA_CARMEL_CNP_ERRATUM is not set
+# CONFIG_ROCKCHIP_ERRATUM_3588001 is not set
+# CONFIG_SOCIONEXT_SYNQUACER_PREITS is not set
+CONFIG_SCHED_MC=y
+CONFIG_XEN=y
+# CONFIG_ARM64_HW_AFDBM is not set
+# CONFIG_ARM64_PAN is not set
+# CONFIG_ARM64_USE_LSE_ATOMICS is not set
+# CONFIG_ARM64_RAS_EXTN is not set
+# CONFIG_ARM64_CNP is not set
+# CONFIG_ARM64_PTR_AUTH is not set
+# CONFIG_ARM64_AMU_EXTN is not set
+# CONFIG_ARM64_TLB_RANGE is not set
+# CONFIG_ARM64_BTI is not set
+# CONFIG_ARM64_E0PD is not set
+# CONFIG_ARM64_POE is not set
+# CONFIG_ARM64_SVE is not set
+CONFIG_RANDOMIZE_BASE=y
+# CONFIG_SUSPEND is not set
+CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
+CONFIG_CPU_IDLE=y
+CONFIG_ARM_PSCI_CPUIDLE=y
+CONFIG_JUMP_LABEL=y
+CONFIG_COMPAT_32BIT_TIME=y
+# CONFIG_GCC_PLUGINS is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_BLK_DEV_INTEGRITY=y
+CONFIG_IOSCHED_BFQ=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_SWAP is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_KSM=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_FW_LOADER_USER_HELPER=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_RAID_ATTRS=m
+CONFIG_SCSI=y
+# CONFIG_SCSI_PROC_FS is not set
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_SAS_LIBSAS=y
+CONFIG_INPUT_FF_MEMLESS=y
+CONFIG_INPUT_MATRIXKMAP=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_GPIO_POLLED=m
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_INPUT_MISC=y
+# CONFIG_SERIO_SERPORT is not set
+CONFIG_SERIO_AMBAKMI=y
+CONFIG_LEGACY_PTY_COUNT=16
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=8
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_DW=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_SERIAL_DEV_BUS=y
+CONFIG_VIRTIO_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_GPIO_DWAPB=y
+CONFIG_GPIO_MB86S7X=y
+CONFIG_GPIO_PL061=y
+CONFIG_GPIO_SYSCON=y
+CONFIG_GPIO_AGGREGATOR=m
+# CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_ARM_SP805_WATCHDOG=y
+CONFIG_ARM_SBSA_WATCHDOG=y
+CONFIG_ARM_SMC_WATCHDOG=y
+# CONFIG_HID_SUPPORT is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_MMIO=y
+# CONFIG_VHOST_MENU is not set
+CONFIG_XEN_GNTDEV=y
+CONFIG_XEN_GRANT_DEV_ALLOC=y
+# CONFIG_SURFACE_PLATFORMS is not set
+# CONFIG_FSL_ERRATUM_A008585 is not set
+# CONFIG_HISILICON_ERRATUM_161010101 is not set
+# CONFIG_ARM64_ERRATUM_858921 is not set
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_RESET_CONTROLLER=y
+CONFIG_RESET_GPIO=m
+CONFIG_GENERIC_PHY=y
+# CONFIG_ARM_PMU is not set
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_EXT4_FS_SECURITY=y
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+CONFIG_QUOTA=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_CONFIGFS_FS=y
+CONFIG_EFIVAR_FS=y
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_SECURITY=y
+CONFIG_SECURITYFS=y
+# CONFIG_INTEGRITY is not set
+CONFIG_CRYPTO_TEST=m
+CONFIG_CRYPTO_RSA=y
+CONFIG_CRYPTO_DH=m
+CONFIG_CRYPTO_ECDH=m
+CONFIG_CRYPTO_CURVE25519=m
+CONFIG_CRYPTO_DES=m
+CONFIG_CRYPTO_CCM=m
+CONFIG_CRYPTO_GCM=m
+CONFIG_CRYPTO_ECHAINIV=y
+CONFIG_CRYPTO_BLAKE2B=m
+CONFIG_CRYPTO_CMAC=m
+CONFIG_CRYPTO_MICHAEL_MIC=m
+CONFIG_CRYPTO_SHA256=y
+CONFIG_CRYPTO_XXHASH=m
+CONFIG_CRYPTO_DEFLATE=m
+CONFIG_CRYPTO_LZO=y
+CONFIG_CRYPTO_ZSTD=m
+CONFIG_CRYPTO_ANSI_CPRNG=y
+CONFIG_CRYPTO_CHACHA20_NEON=m
+CONFIG_CRYPTO_GHASH_ARM64_CE=y
+CONFIG_CRYPTO_SHA1_ARM64_CE=y
+CONFIG_CRYPTO_SHA2_ARM64_CE=y
+CONFIG_CRYPTO_SHA512_ARM64_CE=m
+CONFIG_CRYPTO_SHA3_ARM64=m
+CONFIG_CRYPTO_SM3_ARM64_CE=m
+CONFIG_CRYPTO_AES_ARM64_BS=m
+CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
+CONFIG_CRYPTO_CRCT10DIF_ARM64_CE=m
+CONFIG_CRYPTO_DEV_CCREE=m
+CONFIG_CRYPTO_DEV_AMLOGIC_GXL=m
+CONFIG_PACKING=y
+CONFIG_INDIRECT_PIO=y
+CONFIG_CRC_CCITT=m
+CONFIG_CRC_ITU_T=y
+CONFIG_CRC7=y
+CONFIG_LIBCRC32C=m
+CONFIG_CRC8=m
+CONFIG_DMA_RESTRICTED_POOL=y
+CONFIG_IRQ_POLL=y
+CONFIG_PRINTK_TIME=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
+CONFIG_DEBUG_INFO_REDUCED=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_FTRACE is not set
+CONFIG_CORESIGHT=m
+CONFIG_CORESIGHT_LINK_AND_SINK_TMC=m
+CONFIG_CORESIGHT_CATU=m
+CONFIG_CORESIGHT_SINK_TPIU=m
+CONFIG_CORESIGHT_SINK_ETBV10=m
+CONFIG_CORESIGHT_STM=m
+CONFIG_CORESIGHT_CPU_DEBUG=m
+CONFIG_CORESIGHT_CTI=m
+CONFIG_MEMTEST=y
diff --git a/support/testing/tests/package/test_xen/post-image.sh b/support/testing/tests/package/test_xen/post-image.sh
new file mode 100755
index 0000000000..d74447ae93
--- /dev/null
+++ b/support/testing/tests/package/test_xen/post-image.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+set -eu
+
+BOARD_DIR=$(dirname "$0")
+
+# Copy xen configuration.
+cp -f "${BOARD_DIR}/xen.cfg" "${BINARIES_DIR}/xen.cfg"
diff --git a/support/testing/tests/package/test_xen/xen.cfg b/support/testing/tests/package/test_xen/xen.cfg
new file mode 100644
index 0000000000..41b3ed3ee5
--- /dev/null
+++ b/support/testing/tests/package/test_xen/xen.cfg
@@ -0,0 +1,2 @@
+options=dom0_mem=128M loglvl=all guest_loglvl=all
+kernel=\Image root=PARTLABEL=root rootwait console=hvc0

--===============6013762031731114433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6013762031731114433==--
