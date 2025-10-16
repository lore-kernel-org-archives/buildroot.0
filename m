Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7CFCCD199
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 19:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93B14403EF;
	Thu, 16 Oct 2025 19:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cAAxU9ODVgek; Thu, 16 Oct 2025 19:37:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BA0A4038C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BA0A4038C;
	Thu, 16 Oct 2025 19:37:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31E66EC
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 19:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 186F8402EC
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 19:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNqfaOZix8fG for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 19:37:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 844C340243
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 844C340243
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 19:37:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6132E872EF; Thu, 16 Oct 2025 19:37:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 16 Oct 2025 21:04:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c2a0a44f00e2ab9b41a2bc3bf019e17ef37c471
X-Git-Newrev: 24ff258905df70d82689213829fb233f1eea797e
X-Patchwork-Hint: ignore
Message-Id: <20251016193725.6132E872EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_xen: add networking
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
Content-Type: multipart/mixed; boundary="===============2151161440550019961=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2151161440550019961==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=24ff258905df70d82689213829fb233f1eea797e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enhance the Xen python tests to exercise networking:

- Add the networking support we need to the Linux kernel configurations.
- Add a virtual network interface to the Xen dom1 configurations.
- Update the test in the following way:
  * Start the emulator with restricted networking.
  * Create a network bridge in dom0.
  * Check that networking is functional in both domains by ping'ing the
    gateway.
  (Refer also to the diagram in the python script.)
- While at it, bump Linux kernel to 6.17.1 and U-Boot to 2025.07.
  We also need to adjust the DTB address in the Arm 32b U-Boot script to
  accommodate the new U-Boot version, which does not have enough free space
  around the control DTB anymore.
  We disable IPv6 in both kernel configurations to make the 32b test pass
  on gitlab CI.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_xen.py          | 48 +++++++++++++++++++++-
 .../tests/package/test_xen/aarch64/linux.config    | 44 +++-----------------
 .../test_xen/aarch64/overlay/etc/xen/dom1.cfg      |  1 +
 .../testing/tests/package/test_xen/arm/boot.cmd    |  4 +-
 .../tests/package/test_xen/arm/linux.config        |  6 ++-
 .../package/test_xen/arm/overlay/etc/xen/dom1.cfg  |  1 +
 6 files changed, 60 insertions(+), 44 deletions(-)

diff --git a/support/testing/tests/package/test_xen.py b/support/testing/tests/package/test_xen.py
index 881327b9b9..511363be40 100644
--- a/support/testing/tests/package/test_xen.py
+++ b/support/testing/tests/package/test_xen.py
@@ -14,9 +14,10 @@ class TestXenBase(infra.basetest.BRTest):
         BR2_ROOTFS_POST_BUILD_SCRIPT="support/testing/tests/package/test_xen/common/post-build.sh"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.17.1"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_BRIDGE_UTILS=y
         BR2_PACKAGE_XEN=y
         BR2_PACKAGE_XEN_HYPERVISOR=y
         BR2_PACKAGE_XEN_TOOLS=y
@@ -25,7 +26,7 @@ class TestXenBase(infra.basetest.BRTest):
         BR2_TARGET_UBOOT=y
         BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
         BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
         BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
         BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
         BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -47,6 +48,20 @@ class TestXenBase(infra.basetest.BRTest):
     def run_xen_test(self, arch: str, options: list[str]) -> None:
         """This functions tests Xen for multiple architectures.
         The arch and options parameters are passed to the emulator.
+
+        Here is the network setup we use in the test:
+
+                    :         dom0        :   dom1   :
+                    :                     :          :
+                    :        br0          :          :
+                    :      10.0.2.x       :          :
+             gw     :         |           :          :
+          10.0.2.2 -:- eth0 --+-- vif1.0 -:-- eth0   :
+                    :                     : 10.0.2.y :
+
+        The VMs get their IP addresses with DHCP.
+        We create a bridge in dom0, which allows dom1 to reach the gateway.
+        vif1.0 is added to the bridge automatically when dom1 is created.
         """
 
         # Boot the emulator.
@@ -65,6 +80,20 @@ class TestXenBase(infra.basetest.BRTest):
         # Check that we have one VM running.
         self.assertNumVM(1)
 
+        # Create a network bridge.
+        self.assertRunOk("brctl addbr br0")
+        self.assertRunOk("brctl addif br0 eth0")
+        self.assertRunOk("brctl show")
+
+        # Bring up the network in the dom0.
+        self.assertRunOk("ifconfig eth0 up")
+        self.assertRunOk("ifconfig br0 up")
+        self.assertRunOk("udhcpc -i br0")
+        self.assertRunOk("ifconfig -a")
+
+        # Verify that we can ping the gateway.
+        self.assertRunOk("ping -c 3 -A 10.0.2.2")
+
         # Create dom1 with console attached and login.
         self.emulator.qemu.sendline("xl create -c /etc/xen/dom1.cfg")
         self.emulator.login()
@@ -73,6 +102,14 @@ class TestXenBase(infra.basetest.BRTest):
         uuid = self.get_dom_uuid()
         self.assertNotEqual(uuid, dom0_uuid, "Unexpected dom0 UUID")
 
+        # Bring up the network in the dom1.
+        self.assertRunOk("ifconfig eth0 up")
+        self.assertRunOk("udhcpc -i eth0")
+        self.assertRunOk("ifconfig -a")
+
+        # Verify that we can ping the gateway.
+        self.assertRunOk("ping -c 3 -A 10.0.2.2")
+
         # Detach from dom1's console with CTRL-].
         # dom1 is still running in the background after that.
         self.emulator.qemu.send(chr(0x1d))
@@ -88,6 +125,9 @@ class TestXenBase(infra.basetest.BRTest):
         # Check that we have two VMs running.
         self.assertNumVM(2)
 
+        # Print the bridge setup for debugging.
+        self.assertRunOk("brctl show")
+
 
 class TestXenAarch64(TestXenBase):
     # Test Xen on 64b Arm.
@@ -117,8 +157,10 @@ class TestXenAarch64(TestXenBase):
             "-bios", uboot_bin,
             "-cpu", "cortex-a53",
             "-device", "virtio-blk-device,drive=hd0",
+            "-device", "virtio-net-device,netdev=eth0",
             "-drive", f"file={disk_img},if=none,format=raw,id=hd0",
             "-m", "1G",
+            "-netdev", "user,id=eth0,restrict=yes",
             "-machine", "virt,gic-version=3,virtualization=on,acpi=off",
             "-smp", "2"
         ]
@@ -158,9 +200,11 @@ class TestXenArmv7(TestXenBase):
             "-bios", uboot_bin,
             "-cpu", "cortex-a15",
             "-device", "virtio-blk-device,drive=hd0",
+            "-device", "virtio-net-device,netdev=eth0",
             "-drive", f"file={disk_img},if=none,format=raw,id=hd0",
             "-m", "1G",
             "-machine", "virt,virtualization=on,acpi=off",
+            "-netdev", "user,id=eth0,restrict=yes",
             "-smp", "2"
         ]
 
diff --git a/support/testing/tests/package/test_xen/aarch64/linux.config b/support/testing/tests/package/test_xen/aarch64/linux.config
index 4afab3c171..1c6b6d7a6c 100644
--- a/support/testing/tests/package/test_xen/aarch64/linux.config
+++ b/support/testing/tests/package/test_xen/aarch64/linux.config
@@ -44,7 +44,6 @@ CONFIG_ARCH_VEXPRESS=y
 CONFIG_SCHED_MC=y
 CONFIG_XEN=y
 # CONFIG_ARM64_HW_AFDBM is not set
-# CONFIG_ARM64_PAN is not set
 # CONFIG_ARM64_USE_LSE_ATOMICS is not set
 # CONFIG_ARM64_RAS_EXTN is not set
 # CONFIG_ARM64_CNP is not set
@@ -60,7 +59,6 @@ CONFIG_RANDOMIZE_BASE=y
 CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
 CONFIG_CPU_IDLE=y
 CONFIG_ARM_PSCI_CPUIDLE=y
-CONFIG_JUMP_LABEL=y
 CONFIG_COMPAT_32BIT_TIME=y
 # CONFIG_GCC_PLUGINS is not set
 CONFIG_MODULES=y
@@ -72,8 +70,11 @@ CONFIG_IOSCHED_BFQ=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_KSM=y
 CONFIG_NET=y
+CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
+# CONFIG_IPV6 is not set
+CONFIG_BRIDGE=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y
@@ -84,6 +85,9 @@ CONFIG_SCSI=y
 # CONFIG_SCSI_PROC_FS is not set
 CONFIG_BLK_DEV_SD=y
 CONFIG_SCSI_SAS_LIBSAS=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_XEN_NETDEV_BACKEND=y
 CONFIG_INPUT_FF_MEMLESS=y
 CONFIG_INPUT_MATRIXKMAP=y
 CONFIG_INPUT_EVDEV=y
@@ -149,43 +153,8 @@ CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y
 CONFIG_SECURITYFS=y
 # CONFIG_INTEGRITY is not set
-CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_RSA=y
-CONFIG_CRYPTO_DH=m
-CONFIG_CRYPTO_ECDH=m
-CONFIG_CRYPTO_CURVE25519=m
-CONFIG_CRYPTO_DES=m
-CONFIG_CRYPTO_CCM=m
-CONFIG_CRYPTO_GCM=m
-CONFIG_CRYPTO_ECHAINIV=y
-CONFIG_CRYPTO_BLAKE2B=m
-CONFIG_CRYPTO_CMAC=m
-CONFIG_CRYPTO_MICHAEL_MIC=m
-CONFIG_CRYPTO_SHA256=y
-CONFIG_CRYPTO_XXHASH=m
-CONFIG_CRYPTO_DEFLATE=m
-CONFIG_CRYPTO_LZO=y
-CONFIG_CRYPTO_ZSTD=m
-CONFIG_CRYPTO_ANSI_CPRNG=y
-CONFIG_CRYPTO_CHACHA20_NEON=m
-CONFIG_CRYPTO_GHASH_ARM64_CE=y
-CONFIG_CRYPTO_SHA1_ARM64_CE=y
-CONFIG_CRYPTO_SHA2_ARM64_CE=y
-CONFIG_CRYPTO_SHA512_ARM64_CE=m
-CONFIG_CRYPTO_SHA3_ARM64=m
-CONFIG_CRYPTO_SM3_ARM64_CE=m
-CONFIG_CRYPTO_AES_ARM64_BS=m
-CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
-CONFIG_CRYPTO_CRCT10DIF_ARM64_CE=m
-CONFIG_CRYPTO_DEV_CCREE=m
-CONFIG_CRYPTO_DEV_AMLOGIC_GXL=m
 CONFIG_PACKING=y
 CONFIG_INDIRECT_PIO=y
-CONFIG_CRC_CCITT=m
-CONFIG_CRC_ITU_T=y
-CONFIG_CRC7=y
-CONFIG_LIBCRC32C=m
-CONFIG_CRC8=m
 CONFIG_DMA_RESTRICTED_POOL=y
 CONFIG_IRQ_POLL=y
 CONFIG_PRINTK_TIME=y
@@ -194,7 +163,6 @@ CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_FTRACE is not set
 CONFIG_CORESIGHT=m
 CONFIG_CORESIGHT_LINK_AND_SINK_TMC=m
diff --git a/support/testing/tests/package/test_xen/aarch64/overlay/etc/xen/dom1.cfg b/support/testing/tests/package/test_xen/aarch64/overlay/etc/xen/dom1.cfg
index 869c12beb8..651b8de919 100644
--- a/support/testing/tests/package/test_xen/aarch64/overlay/etc/xen/dom1.cfg
+++ b/support/testing/tests/package/test_xen/aarch64/overlay/etc/xen/dom1.cfg
@@ -3,3 +3,4 @@ kernel="/mnt/Image"
 ramdisk="/mnt/rootfs.cpio"
 memory=256
 cmdline="console=hvc0"
+vif=['bridge=br0']
diff --git a/support/testing/tests/package/test_xen/arm/boot.cmd b/support/testing/tests/package/test_xen/arm/boot.cmd
index 698e055e56..859dc661c8 100644
--- a/support/testing/tests/package/test_xen/arm/boot.cmd
+++ b/support/testing/tests/package/test_xen/arm/boot.cmd
@@ -1,4 +1,4 @@
-fdt addr ${fdtcontroladdr}
+fdt addr ${fdt_addr}
 fdt resize
 
 fdt set /chosen \#address-cells <1>
@@ -20,4 +20,4 @@ load ${devtype} ${devnum} ${loadaddr} xen
 fdt set /chosen xen,dom0-bootargs "console=hvc0"
 fdt set /chosen xen,xen-bootargs "dom0_mem=256M loglvl=all guest_loglvl=all"
 fdt print /chosen
-bootz ${loadaddr} - ${fdtcontroladdr}
+bootz ${loadaddr} - ${fdt_addr}
diff --git a/support/testing/tests/package/test_xen/arm/linux.config b/support/testing/tests/package/test_xen/arm/linux.config
index aedd9bf0a2..0a58785f73 100644
--- a/support/testing/tests/package/test_xen/arm/linux.config
+++ b/support/testing/tests/package/test_xen/arm/linux.config
@@ -23,6 +23,7 @@ CONFIG_VFP=y
 CONFIG_NEON=y
 CONFIG_KERNEL_MODE_NEON=y
 # CONFIG_SUSPEND is not set
+# CONFIG_GCC_PLUGINS is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
@@ -38,6 +39,8 @@ CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_IP_PNP_RARP=y
+# CONFIG_IPV6 is not set
+CONFIG_BRIDGE=y
 CONFIG_QRTR=m
 CONFIG_PAGE_POOL_STATS=y
 CONFIG_DEVTMPFS=y
@@ -69,6 +72,7 @@ CONFIG_DWMAC_DWC_QOS_ETH=y
 CONFIG_MDIO_BITBANG=y
 CONFIG_MDIO_MSCC_MIIM=m
 # CONFIG_WLAN is not set
+CONFIG_XEN_NETDEV_BACKEND=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_GPIO_DECODER=m
@@ -153,11 +157,9 @@ CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
-CONFIG_CRC_CCITT=m
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_FTRACE is not set
diff --git a/support/testing/tests/package/test_xen/arm/overlay/etc/xen/dom1.cfg b/support/testing/tests/package/test_xen/arm/overlay/etc/xen/dom1.cfg
index 0a4ae24a16..3c75a0cfb7 100644
--- a/support/testing/tests/package/test_xen/arm/overlay/etc/xen/dom1.cfg
+++ b/support/testing/tests/package/test_xen/arm/overlay/etc/xen/dom1.cfg
@@ -3,3 +3,4 @@ kernel="/mnt/zImage"
 ramdisk="/mnt/rootfs.cpio"
 memory=256
 cmdline="console=hvc0"
+vif=['bridge=br0']

--===============2151161440550019961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2151161440550019961==--
