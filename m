Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171BCC4332F
	for <buildroot@archiver.kernel.org>; Sat, 17 Dec 2022 05:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B62FE60BF2;
	Sat, 17 Dec 2022 05:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B62FE60BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsmQzyPYH9Gz; Sat, 17 Dec 2022 05:14:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86E7960C20;
	Sat, 17 Dec 2022 05:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86E7960C20
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 071BB1BF38B
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 05:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D606D821C2
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 05:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D606D821C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g75D_-STz6Pm for <buildroot@lists.busybox.net>;
 Sat, 17 Dec 2022 05:13:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A475B81F47
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A475B81F47
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 05:13:44 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id c7so4371964qtw.8
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 21:13:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/UD1aSJSxcQ86HMxvWL+GvyefsodrAXVylhuyBsczVI=;
 b=Fo0nONSuju9NekVVYRpY76wByn8F8QnKUVa24aXNVWH0+Y5jHL/lcPPZkXwZhNiebX
 6TWrL4SmBHDG3Sa5O0S9qVO6+rWKNWCcNBZ0B3IER4wK8h08yyhp4IM/fC4gwdLOgR5t
 9pRkN5esvLQMxF8QxCGYEETBuRWcnbEmJ8lqQUY4Pxv5s97EjM/NUpb17yGevlAHsYs1
 1fqjzlO/6VBPX2RgtdExwyHRjGGUdXH7+EelQAScHheFC/YGPilhbdTXjxPTwmjyplf0
 IzSzTF63UNd43hjtshhOrwr8wX7jJ3hVBgK5tq+KFa+ub4eCwQVLos+Wmtwepwr/Bypl
 KFrw==
X-Gm-Message-State: ANoB5pkNg+lKtL1QP9xOtgjGYoOJBBTURtJpVFLdhiuumbi9UiK8csRf
 Yz/Ai4H2eS2yLIcUvyefAxXEN/0tatQ=
X-Google-Smtp-Source: AA0mqf6tpnQUCR/gJEE/U4e32s8iOVZQZ0x+16JKZT2oBjvLmu3DpkWzrlgveeGfUeuYbHNig8jXyg==
X-Received: by 2002:a05:622a:40ca:b0:3a6:ee87:20e7 with SMTP id
 ch10-20020a05622a40ca00b003a6ee8720e7mr49261924qtb.68.1671254023262; 
 Fri, 16 Dec 2022 21:13:43 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab
 (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
 by smtp.gmail.com with ESMTPSA id
 q17-20020ac87351000000b003a7fef41526sm2448854qtp.77.2022.12.16.21.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 21:13:42 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Dec 2022 00:13:37 -0500
Message-Id: <20221217051337.3778405-5-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221217051337.3778405-1-Mr.Bossman075@gmail.com>
References: <20221217051337.3778405-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/UD1aSJSxcQ86HMxvWL+GvyefsodrAXVylhuyBsczVI=;
 b=TFbRMNTw79LtMmpOTkJoeSebSWXezJyTT1YJLZZv30f+SCzMSq9heHVZZlGx7jfI5f
 eBhWDdVP8PPoprMvPCgK5zthByeMgZ1x5oodBdpP1uzn22QqWHv+krjXIqX68ed4QIV3
 7o2dXA2/HQ8pwXZqZ4njt2l4X3APT4r3d4UYSbWfbENI7KfJa1NRz4EKtUwhzNWUVKaK
 vME05fWrOjJiFC+TEsOenVhryoDgNiPbHvtYkRJZEu8JpoRq3phPxbhGmhgfouzVl0jX
 H8FtXSZFdsHKvIZp/L8BocBiN4lUkeEN53hXKBnx4Wrj/52v/mxvXqoiNDfSlhur6gkq
 ZBoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TFbRMNTw
Subject: [Buildroot] [PATCH v2 4/4]
 configs/qemu_riscv32_nommu_virt_defconfig: New defconfig
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
Cc: Mark Corbin <mark@dibsco.co.uk>, Jesse Taube <Mr.Bossman075@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Charles Lohr <lohr85@gmail.com>,
 Yimin Gu <ustcymgu@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add RISC-V 32-bit nommu defconfig for QEMU virt machine with MMU
disabled.

Unlike qemu_riscv32_virt, qemu_riscv32_nommu_virt does not use OpenSBI,
since the kernel is running in machine mode (M-mode).

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Cc: Yimin Gu <ustcymgu@gmail.com>
---
 board/qemu/riscv32-virt/nommu/defconfig       | 16 +++++++
 .../riscv32-virt/nommu/patches/linux-headers  |  1 +
 ...nfig-Allow-RV32-to-build-with-no-MMU.patch | 43 +++++++++++++++++++
 ...le-stat64-and-time32-for-RV32-uclibc.patch | 40 +++++++++++++++++
 board/qemu/riscv32-virt/readme.txt            |  6 ++-
 configs/qemu_riscv32_nommu_virt_defconfig     | 31 +++++++++++++
 6 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 board/qemu/riscv32-virt/nommu/defconfig
 create mode 120000 board/qemu/riscv32-virt/nommu/patches/linux-headers
 create mode 100644 board/qemu/riscv32-virt/nommu/patches/linux/6.0/0001-riscv-Kconfig-Allow-RV32-to-build-with-no-MMU.patch
 create mode 100644 board/qemu/riscv32-virt/nommu/patches/linux/6.0/0002-riscv-Enable-stat64-and-time32-for-RV32-uclibc.patch
 create mode 100644 configs/qemu_riscv32_nommu_virt_defconfig

diff --git a/board/qemu/riscv32-virt/nommu/defconfig b/board/qemu/riscv32-virt/nommu/defconfig
new file mode 100644
index 0000000000..460907253a
--- /dev/null
+++ b/board/qemu/riscv32-virt/nommu/defconfig
@@ -0,0 +1,16 @@
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_MMU is not set
+CONFIG_COMPAT_32BIT_TIME=y
+CONFIG_SOC_VIRT=y
+CONFIG_NONPORTABLE=y
+CONFIG_ARCH_RV32I=y
+CONFIG_BINFMT_FLAT=y
+CONFIG_SLOB=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_EXT2_FS=y
+CONFIG_PRINTK_TIME=y
diff --git a/board/qemu/riscv32-virt/nommu/patches/linux-headers b/board/qemu/riscv32-virt/nommu/patches/linux-headers
new file mode 120000
index 0000000000..ce5e2c77b2
--- /dev/null
+++ b/board/qemu/riscv32-virt/nommu/patches/linux-headers
@@ -0,0 +1 @@
+linux/
\ No newline at end of file
diff --git a/board/qemu/riscv32-virt/nommu/patches/linux/6.0/0001-riscv-Kconfig-Allow-RV32-to-build-with-no-MMU.patch b/board/qemu/riscv32-virt/nommu/patches/linux/6.0/0001-riscv-Kconfig-Allow-RV32-to-build-with-no-MMU.patch
new file mode 100644
index 0000000000..af11ddf953
--- /dev/null
+++ b/board/qemu/riscv32-virt/nommu/patches/linux/6.0/0001-riscv-Kconfig-Allow-RV32-to-build-with-no-MMU.patch
@@ -0,0 +1,43 @@
+From 57800c87e422375ec0df4d5ad7f33659f7b60093 Mon Sep 17 00:00:00 2001
+From: Yimin Gu <ustcymgu@gmail.com>
+Date: Sat, 10 Dec 2022 22:27:47 -0500
+Subject: [PATCH] riscv: Kconfig: Allow RV32 to build with no MMU
+
+Some RISC-V 32bit ores do not have an MMU, and the kernel should be
+able to build for them. This patch enables the RV32 to be built with
+no MMU support.
+
+Signed-off-by: Yimin Gu <ustcymgu@gmail.com>
+CC=c: Jesse Taube <Mr.Bossman075@gmail.com>
+Tested-By: Waldemar Brodkorb <wbx@openadk.org>
+Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
+---
+ arch/riscv/Kconfig | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
+index 59d18881f35b..49759dbe6a8f 100644
+--- a/arch/riscv/Kconfig
++++ b/arch/riscv/Kconfig
+@@ -163,8 +163,8 @@ config MMU
+ 
+ config PAGE_OFFSET
+ 	hex
+-	default 0xC0000000 if 32BIT
+-	default 0x80000000 if 64BIT && !MMU
++	default 0xC0000000 if 32BIT && MMU
++	default 0x80000000 if !MMU
+ 	default 0xff60000000000000 if 64BIT
+ 
+ config KASAN_SHADOW_OFFSET
+@@ -262,7 +262,6 @@ config ARCH_RV32I
+ 	select GENERIC_LIB_ASHRDI3
+ 	select GENERIC_LIB_LSHRDI3
+ 	select GENERIC_LIB_UCMPDI2
+-	select MMU
+ 
+ config ARCH_RV64I
+ 	bool "RV64I"
+-- 
+2.38.1
+
diff --git a/board/qemu/riscv32-virt/nommu/patches/linux/6.0/0002-riscv-Enable-stat64-and-time32-for-RV32-uclibc.patch b/board/qemu/riscv32-virt/nommu/patches/linux/6.0/0002-riscv-Enable-stat64-and-time32-for-RV32-uclibc.patch
new file mode 100644
index 0000000000..f654cca7a6
--- /dev/null
+++ b/board/qemu/riscv32-virt/nommu/patches/linux/6.0/0002-riscv-Enable-stat64-and-time32-for-RV32-uclibc.patch
@@ -0,0 +1,40 @@
+From 1d985b3cd0fdb37567b4b8263cae740b49a1f46a Mon Sep 17 00:00:00 2001
+From: Yimin Gu <ustcymgu@gmail.com>
+Date: Sat, 10 Dec 2022 22:31:06 -0500
+Subject: [PATCH] riscv: Enable stat64 and time32 for RV32 uclibc
+
+To comply with current uclibc, macros __ARCH_WANT_STAT64 and
+__ARCH_WANT_TIME32_SYSCALLS are defined. CONFIG_COMPAT_32BIT_TIME also
+has to be turned on.
+
+Tested-By: Waldemar Brodkorb <wbx@openadk.org>
+Signed-off-by: Yimin Gu <ustcymgu@gmail.com>
+Cc: Jesse Taube <Mr.Bossman075@gmail.com>
+Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
+---
+ arch/riscv/include/uapi/asm/unistd.h | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/arch/riscv/include/uapi/asm/unistd.h b/arch/riscv/include/uapi/asm/unistd.h
+index 73d7cdd2ec49..3dc774bc201f 100644
+--- a/arch/riscv/include/uapi/asm/unistd.h
++++ b/arch/riscv/include/uapi/asm/unistd.h
+@@ -15,9 +15,14 @@
+  * along with this program.  If not, see <https://www.gnu.org/licenses/>.
+  */
+ 
+-#if defined(__LP64__) && !defined(__SYSCALL_COMPAT)
++#ifndef __SYSCALL_COMPAT
+ #define __ARCH_WANT_NEW_STAT
+ #define __ARCH_WANT_SET_GET_RLIMIT
++#endif /* __SYSCALL_COMPAT */
++
++#ifndef __LP64__
++#define __ARCH_WANT_STAT64
++#define __ARCH_WANT_TIME32_SYSCALLS
+ #endif /* __LP64__ */
+ 
+ #define __ARCH_WANT_SYS_CLONE3
+-- 
+2.38.1
+
diff --git a/board/qemu/riscv32-virt/readme.txt b/board/qemu/riscv32-virt/readme.txt
index 32b4333512..067bb9f436 100644
--- a/board/qemu/riscv32-virt/readme.txt
+++ b/board/qemu/riscv32-virt/readme.txt
@@ -1,5 +1,9 @@
 Run Linux in emulation with:
 
-  qemu-system-riscv32 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv32_virt_defconfig
+qemu_riscv32_virt_defconfig:
+  qemu-system-riscv32 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
+  
+qemu_riscv32_nommu_virt_defconfig:
+  qemu-system-riscv32 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -nographic -cpu rv32,mmu=off
 
 The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_riscv32_nommu_virt_defconfig b/configs/qemu_riscv32_nommu_virt_defconfig
new file mode 100644
index 0000000000..8bfa1f7435
--- /dev/null
+++ b/configs/qemu_riscv32_nommu_virt_defconfig
@@ -0,0 +1,31 @@
+# Architecture
+BR2_riscv=y
+BR2_RISCV_32=y
+# BR2_RISCV_USE_MMU is not set 
+
+# System
+BR2_TARGET_GENERIC_GETTY=y
+BR2_PTHREADS_NONE=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.0"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv32-virt/nommu/defconfig"
+BR2_LINUX_KERNEL_IMAGE=y
+BR2_GLOBAL_PATCH_DIR="board/qemu/riscv32-virt/nommu/patches"
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
