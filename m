Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B24C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 13:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCB718438E;
	Sat, 11 May 2024 13:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMNOksA5SrTg; Sat, 11 May 2024 13:42:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C167984390
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C167984390;
	Sat, 11 May 2024 13:42:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D4BC1BF334
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 13:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A44760850
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 13:42:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3gn25d73Tg0 for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 13:42:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ECD1C6081C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECD1C6081C
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECD1C6081C
 for <buildroot@buildroot.org>; Sat, 11 May 2024 13:42:00 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 33FD2352111B; Sat, 11 May 2024 15:41:59 +0200 (CEST)
Date: Sat, 11 May 2024 15:41:59 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zj91p/Bv/ZtCtvO6@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715434919; bh=FttjwTJtZdcnNab8IrUDoFMAjGbLJJT1P7KC+GRjQtk=;
 h=Date:From:To:Cc:Subject:From;
 b=Ob+ZzfWqOatwSK/Aey75yA32oo+fxZ1DZIaUbEcJxujaIxhirCnpIdHFPCABvR0sz
 vvOsHij8f+bq3P01agWtQQE0SWNA7yCX0AURpRK/PjjgahKwuk6moC8mGeqeKA4crf
 lhEpuXlW5YCNV2POAaWHG3XBFiImCJNhp5YedDadpydg94hPrvtWf/+pF5KiBfIGGN
 TeVbof1UzzZVa2R/zkdyjJd2HNyNJ3A6eAriPWAW3XzaqhA0AgpCQYty5Nkfgl/hbj
 GOqb1VwojzBfuPipgdbbsu/VChyt9C0x8gBQHeYTtJ1lDbubKJNw+IB95Cwy/i1Mop
 xT3ESlpwLytpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Ob+ZzfWq
Subject: [Buildroot] [PATCH] configs/qemu_riscv64_nomu_virt_defconfig:
 enable networking
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable networking for better user experience.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 board/qemu/riscv64-virt/linux-nommu.config | 22 ++++++++++++++++++++++
 board/qemu/riscv64-virt/readme.txt         |  2 +-
 configs/qemu_riscv64_nommu_virt_defconfig  |  7 +++----
 3 files changed, 26 insertions(+), 5 deletions(-)
 create mode 100644 board/qemu/riscv64-virt/linux-nommu.config

diff --git a/board/qemu/riscv64-virt/linux-nommu.config b/board/qemu/riscv64-virt/linux-nommu.config
new file mode 100644
index 0000000000..9adf494260
--- /dev/null
+++ b/board/qemu/riscv64-virt/linux-nommu.config
@@ -0,0 +1,22 @@
+CONFIG_ARCH_RV64I=y
+CONFIG_64BIT=y
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_MMU is not set
+CONFIG_SOC_VIRT=y
+CONFIG_NONPORTABLE=y
+CONFIG_BINFMT_FLAT=y
+CONFIG_SLOB=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_EXT2_FS=y
+CONFIG_PRINTK_TIME=y
diff --git a/board/qemu/riscv64-virt/readme.txt b/board/qemu/riscv64-virt/readme.txt
index 9e4cfc8c55..f1c7bf41b5 100644
--- a/board/qemu/riscv64-virt/readme.txt
+++ b/board/qemu/riscv64-virt/readme.txt
@@ -2,6 +2,6 @@ Run Linux in emulation with:
 
   qemu-system-riscv64 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv64_virt_defconfig
 
-  qemu-system-riscv64 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -nographic -cpu rv64,mmu=off # qemu_riscv64_nommu_virt_defconfig
+  qemu-system-riscv64 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -nographic -cpu rv64,mmu=off -netdev user,id=net0 -device virtio-net-device,netdev=net0 # qemu_riscv64_nommu_virt_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
index 34dd1c88ba..f6f1fa1c5b 100644
--- a/configs/qemu_riscv64_nommu_virt_defconfig
+++ b/configs/qemu_riscv64_nommu_virt_defconfig
@@ -7,6 +7,7 @@ BR2_RISCV_64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System
+BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY=y
 
 # Filesystem
@@ -20,12 +21,10 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
-BR2_LINUX_KERNEL_DEFCONFIG="nommu_virt"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv64-virt/linux-nommu.config"
 BR2_LINUX_KERNEL_IMAGE=y
 
-# Disable network scripts
-# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
-
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
