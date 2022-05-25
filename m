Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD08AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 13:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E44841C27;
	Wed, 25 May 2022 13:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GYfn2qzIA0rW; Wed, 25 May 2022 13:36:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 361B241C12;
	Wed, 25 May 2022 13:36:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1A431BF31F
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CAC86130A
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vxi4rtW-2svb for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 13:34:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B43AC612F5
 for <buildroot@buildroot.org>; Wed, 25 May 2022 13:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653485681; x=1685021681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GUOYQGZsO6KuiDXBz121GyuxryM23jVgpkpeMEx43Ts=;
 b=Z2sEk2+FgCJ06QqoYlRDMq7wlR3HnxqV7Ifw97BbAQbsLP/5RhKVMk6H
 3z/+wER0kdVsmEeexXleWaOEtqu8uNKytZUWgNw6KjMnOpvU/OOEqfi8M
 5ufNJuhUYJEtBIj2njWYySBEvz8l1FwehHWji91byKgHNLD2gnKoe9Y8n
 8rnzFjLhhIFjKIIDH3xlT8mZsJ7wkefxPvKDlafen55RdajsxTufUwWwk
 2Qvor/Rrj0AIgGkcU8RJvZPyW99aDn/4LoBXGO+Wa0F3LbYVvUmTnYWp8
 dcJwuYSB3TikbjsewrvBDTX2Yvc0t5FHxwuRIEw/obTU5z8mgYVQIeNY+ A==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305635098"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 21:27:35 +0800
IronPort-SDR: HZoe6qbwfYbMS6SWc+P8SxS4lWsCgyhjy+1mNMrFJ6sbihjO6xDnKA5eoKEYzcTOU2PQwEkZFs
 wF/L6N89djCkhfmgq0AgbmjwO6l9SEt1Ec6/U3SzfDTe73KsnD3aCNjCNhzx7mCg9TiiAmmyWc
 +uDC8UMjxXoFzLGevhfdBke8K/JAD0lOzbFqq/cL/JtzQVAN+0YeTdVZeCEmecbqM+uaz9wX2I
 mCYbKei61XP1BJ3Ly1WjLDjq5QlE1p6+dENicO8Ydy1F1ai7K03r4fjFMv3qbDyORmOSlqljtm
 qcLQO6voUrYmk/r/FgXETZd+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 05:51:31 -0700
IronPort-SDR: 65QbAK+HMKvfVdEHJd1GlB799dS7FvAuRMPcz3oPzLYyQla+HkFi+zZ0aBtp9ibnVYaxVxGGDM
 ydFOLmGFadZfCxtAdXKHT5wd5fAnjb4w5D8RMtJdO3JBJJ2Y2CyvIP/XUv1XdG3ldsYrA7rn2G
 6zCK0dDg5YRoOwPQ4Q8XSJDRGZpzFP4Mj5yE/AZcwu50T5dX9mBOFq9R9eyqkCCT2WgkCFe2GP
 7HnBX0xqrz2omZCiC0X7bBxJioQTfhbzc7UIWxs0uJi9e9nBwS2dmQRg7dUiTAHmaKYZscXL7U
 6tQ=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.54])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 May 2022 06:27:35 -0700
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 May 2022 22:27:22 +0900
Message-Id: <20220525132729.2349105-5-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525132729.2349105-1-damien.lemoal@wdc.com>
References: <20220525132729.2349105-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 04/11]
 configs/qemu_riscv64_nommu_virt_defconfig: new defconfig
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
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <damien.lemoal@wdc.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Niklas Cassel <niklas.cassel@wdc.com>

Add RISC-V 64-bit nommu defconfig for QEMU virt machine with MMU
disabled.

Unlike qemu_riscv64_virt, qemu_riscv64_nommu_virt does not use OpenSBI,
since the kernel is running in machine mode (M-mode).

After the build is complete, you can start QEMU using the launcher
script:
$ output/images/start-qemu.sh

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 board/qemu/riscv64-virt/readme.txt        |  2 ++
 configs/qemu_riscv64_nommu_virt_defconfig | 38 +++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 configs/qemu_riscv64_nommu_virt_defconfig

diff --git a/board/qemu/riscv64-virt/readme.txt b/board/qemu/riscv64-virt/readme.txt
index 747a9ea674..9e4cfc8c55 100644
--- a/board/qemu/riscv64-virt/readme.txt
+++ b/board/qemu/riscv64-virt/readme.txt
@@ -2,4 +2,6 @@ Run Linux in emulation with:
 
   qemu-system-riscv64 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv64_virt_defconfig
 
+  qemu-system-riscv64 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -nographic -cpu rv64,mmu=off # qemu_riscv64_nommu_virt_defconfig
+
 The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
new file mode 100644
index 0000000000..46bd21f1da
--- /dev/null
+++ b/configs/qemu_riscv64_nommu_virt_defconfig
@@ -0,0 +1,38 @@
+# Architecture
+BR2_riscv=y
+BR2_RISCV_64=y
+
+# Toolchain
+BR2_PACKAGE_HOST_ELF2FLT=y
+# BR2_USE_MMU is not set
+
+# Busybox with hush
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+
+# System
+BR2_TARGET_GENERIC_GETTY=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
+# Use Linux 5.16 headers until 5.17 headers are available
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_PATCH="board/riscv/nommu/kernel_patches"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17"
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_virt"
+BR2_LINUX_KERNEL_IMAGE=y
+
+# Disable network scripts
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
