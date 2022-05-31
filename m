Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBCBC433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 05:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DEFA840B4;
	Tue, 31 May 2022 05:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AuivbvuXzmH5; Tue, 31 May 2022 05:50:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57EC8840A2;
	Tue, 31 May 2022 05:50:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C93B1BF375
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 05:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B04560B9D
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 05:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com header.b="WlKwpuio";
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.b="BA+7R+/H"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gpvhm1n0UkRb for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 05:49:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5D3E60F84
 for <buildroot@buildroot.org>; Tue, 31 May 2022 05:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653976180; x=1685512180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vwiz4DZIPHAVgao2kncJplSbpomlnzP4/0gCAzlrvPM=;
 b=WlKwpuiooiosgZuxEYUBlF5Aw3+Ru6MUaobJJNbfZqHtr9bpxJLRkSxF
 Rgz/6cu5xXYnq3NvVegpwUJQM2ebynco0TKB6JWF6RAsGzdzTxaaCunkj
 51gEppkgr3YxPY+CxPeF1dOvPVxfTbldEYOhHNb03RegFhz/wwCDZf9Ye
 2iHrs7CszLz32Zd1KRm927aiPNJknYbRziaM3/11ld1LAsCM5z0mio7Tw
 wnfvWqlfx5He8z/RoLlR2tYEgKm837zY8dw10i+NZW/eXkDqAvXP+EDoo
 M8whw2D8VpQAeC9I9D9+2lwhZLqvi5z2r7ULhJxs1tfVTvNeGLSGtKPEA A==;
X-IronPort-AV: E=Sophos;i="5.91,264,1647273600"; d="scan'208";a="306095094"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2022 13:49:40 +0800
IronPort-SDR: N2G7dpDXKBVjH1cLQ5l8h+WTJSjupT38m/zOpNdwVxiZrFNeMQOdT+4mJ79yHTyp/Hzoy+HuuG
 gjEcnx6Gz8/C5LGaCZdxVyM2HOIq3Lm+rlbtiCGvlM7EBmUR9J/no0yOuPG2ZRbuEGIz+jHNc/
 wFwat/xjsoASM9HfOULZEGTqmtpS1BakpnAkW6kmlFFV0pFXELM8OAnWpZIWayLN4QiPhIulin
 xWd610d6pL2Z88/1oYR2sOW3dDLL4QZ9vTKXaYSYIqmdXc2efULs2dAhOBNaZbPG12jhRVmSRd
 M6N1irA5++d49DoCDzsYHn1F
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2022 22:13:26 -0700
IronPort-SDR: sx2a4BkXLci4s4/eMTDYd7QuS+t4pVX9b/Zan761U9WDRMD/li/77n+OL+8SYxoAIB0lgYbHNt
 gwSqfbty4CR6PnNbkpiB96SJEkU+eUAqvQEALC8MJNF9Iu5n1kQtrqP/HV84P+mMUcb+6ZYUP8
 Lp0Ve+4X8fDLEz47caM2FMAsq5OlJbbjoam9srCrGwTsRXYhRlOif9jLVpiyfbkObh/zpDeTkL
 upv5FgvdYw+FnHF35A9Lr7kWofnkpLvHl8E3L9u981pVW3anP4KfobBEWKqOH38W1d1duzfr2i
 C7M=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2022 22:49:41 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LC1ZD2ZP0z1Rvlc
 for <buildroot@buildroot.org>; Mon, 30 May 2022 22:49:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653976179; x=1656568180; bh=Vwiz4DZIPHAVgao2kn
 cJplSbpomlnzP4/0gCAzlrvPM=; b=BA+7R+/Hkxsfbs2UKuR++lgTxS/10WoSgE
 ZBi3NZlVR/f/Hwt+q04ItD/Gq2KJoIJoxDXT4xjvvoNVJto/kFCCKBoQmIxNYx2Q
 c4Fc+9SDnENxsJxE21VWfPXBVpNCb23m/qMQo6UUb5OSUY+AXK6uoqpYceCcfA9H
 cE0SuVc657jetf6vh/sBSoMfeoSkiK3M9JKcp84pOYCpYaU9+Q0WIA+dELsHWD6z
 txPgv6iuW28MpO1504d7EAHik61W5O++VIU/iYkbnXS0KgOL7whGbUXjv30LOb2G
 fo97FJ1Q6GUAmTzbdq8Q6RxuCiXOkNl1lNvaOiSOrlAss1Bt0j5Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id WeSnGACZQlq6 for <buildroot@buildroot.org>;
 Mon, 30 May 2022 22:49:39 -0700 (PDT)
Received: from twashi.fujisawa.hgst.com (unknown [10.225.163.61])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LC1ZB370Vz1SVp2;
 Mon, 30 May 2022 22:49:38 -0700 (PDT)
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 May 2022 14:49:26 +0900
Message-Id: <20220531054926.373713-8-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531054926.373713-1-damien.lemoal@opensource.wdc.com>
References: <20220531054926.373713-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 7/7] board: Add Canaan KD233 board support
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
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a buildroot configuration file to build a minimal Linux environment
for the Sipeed MAIX Bit board.

The configuration file is canaan_kd233_defconfig. It builds a bootable
kernel image with an embedded initramfs root file system. The image
built can be flashed to the board as is and does not require a boot
loader. This configuration uses the tiny busybox configuration defined
in board/canaan/k210-soc/busybox-tiny.config.

U-Boot currently does not support this board, making it impossible to
boot the kernel after loading it from the SD card. However, the SD card
is usable from Linux once booted using the canaan_kd233_defconfig
configuration.

The configuration also enable the kflash and pyserial-miniterm host
tools for flashing image files to the board and opening a terminal
console.

The readme.txt file documents how to build and boot the Canaan KD233
board with this configuration.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 DEVELOPERS                           |   1 +
 board/canaan/kd233/linux-cpio.config |   2 +
 board/canaan/kd233/readme.txt        | 149 +++++++++++++++++++++++++++
 configs/canaan_kd233_defconfig       |  39 +++++++
 4 files changed, 191 insertions(+)
 create mode 100644 board/canaan/kd233/linux-cpio.config
 create mode 100644 board/canaan/kd233/readme.txt
 create mode 100644 configs/canaan_kd233_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 0116ab0815..b459d2ef52 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -633,6 +633,7 @@ F:	package/log4cpp/
 N:	Damien Le Moal <damien.lemoal@wdc.com>
 F:	package/python-kflash/
 F:	board/canaan/
+F:	configs/canaan_kd233_defconfig
 F:	board/sipeed/
 F:	configs/sipeed_maix_bit_defconfig
 F:	configs/sipeed_maix_bit_sdcard_defconfig
diff --git a/board/canaan/kd233/linux-cpio.config b/board/canaan/kd233/linux-cpio.config
new file mode 100644
index 0000000000..d5b107124a
--- /dev/null
+++ b/board/canaan/kd233/linux-cpio.config
@@ -0,0 +1,2 @@
+CONFIG_SOC_CANAAN_K210_DTB_BUILTIN=y
+CONFIG_SOC_CANAAN_K210_DTB_SOURCE="canaan_kd233"
diff --git a/board/canaan/kd233/readme.txt b/board/canaan/kd233/readme.txt
new file mode 100644
index 0000000000..47b78fa2d7
--- /dev/null
+++ b/board/canaan/kd233/readme.txt
@@ -0,0 +1,149 @@
+Canaan KD233 Board
+==================
+
+The Canaan KD233 is a dual-core RISC-V 64-bits board based on the Canaan
+Kendryte K210 SoC.
+
+Prerequisite
+------------
+
+In order to use the kflash utility to program this board, the user must have
+access to the board USB serial device file. The simplest way to do this is to
+add your user to the same group as this device file. Assume the device file is
+/dev/ttyUSB0, first identify the device group name. In most cases, it is
+either "dialout" or "uucp". Also verify that read-write access is enabled for
+the group:
+
+```
+$ ls -l /dev/ttyUSB0
+crw-rw---- 1 root dialout 188, 0 May 26 13:48 /dev/ttyUSB0
+```
+
+Then add yourself to that group (dialout in this example):
+
+```
+$ sudo usermod -a -G dialout $(whoami)
+```
+
+To enable the above, it is sometimes necessary to logout and login again.
+
+Buildroot Configuration
+-----------------------
+
+Unlike other K210 based boards (Sipeed boards), U-Boot does not work on the
+KD233 board due to the different wiring for the SD-Card mmc controller. As such,
+the KD233 board can only be used by directly booting into Linux Kernel.
+
+buildroot can be configured to do so using the canaan_kd233_defconfig
+configuration file. This configuration allows building a bootable kernel image
+with a built-in initramfs root file system (the board SD card is not used). The
+built kernel image can be flashed directly to the board ROM for direct booting.
+No boot loader is required.
+
+Once booted, the on-board SD card can be used by Linux.
+
+The configuration file will also compile and install the kflash and
+pyserial-miniterm host utilities to program bootable image files to the board
+and open a serial terminal console.
+
+Direct Linux Kernel Boot
+-------------------------
+
+Using the canaan_kd233_defconfig configuration, the bootable kernel binary image
+is built as follows.
+
+```
+$ make canaan_kd233_defconfig
+$ make
+```
+
+The bootable binary image is the output/images/loader.bin file. This image file
+can be written to the board boot flash using the kflash utility.
+
+```
+$ output/host/bin/kflash -b 1500000 -p /dev/ttyUSB0 -t output/images/loader.bin
+```
+
+Once the kernel image file is fully programmed, a terminal console is open and
+the board can be rebooted by pressing the reset button on the board (if it does
+not reboot automatically).
+
+The output will be similar to the following.
+
+```
+[    0.000000] Linux version 5.17.0 (foo@bar.com) (riscv64-buildroot-linux-uclibc-gcc.br_real (Buildroot 2022.02-560-g6a2b542a09-dirty) 10.3.0, GNU ld (GNU Binutils) 2.32) #2 SMP Thu Apr 21 16:40:44 JST 2022
+[    0.000000] Machine model: Kendryte KD233
+[    0.000000] earlycon: sifive0 at MMIO 0x0000000038000000 (options '115200n8')
+[    0.000000] printk: bootconsole [sifive0] enabled
+[    0.000000] Zone ranges:
+[    0.000000]   DMA32    [mem 0x0000000080000000-0x00000000807fffff]
+[    0.000000]   Normal   empty
+[    0.000000] Movable zone start for each node
+[    0.000000] Early memory node ranges
+[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000807fffff]
+[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000807fffff]
+[    0.000000] riscv: ISA extensions acdfim
+[    0.000000] riscv: ELF capabilities acdfim
+[    0.000000] percpu: max_distance=0x16000 too large for vmalloc space 0x0
+[    0.000000] percpu: Embedded 11 pages/cpu s15264 r0 d29792 u45056
+[    0.000000] percpu: wasting 10 pages per chunk
+[    0.000000] Built 1 zonelists, mobility grouping off.  Total pages: 2020
+[    0.000000] Kernel command line: earlycon console=ttySIF0
+[    0.000000] Dentry cache hash table entries: 1024 (order: 1, 8192 bytes, linear)
+[    0.000000] Inode-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
+[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
+[    0.000000] Memory: 5984K/8192K available (964K kernel code, 137K rwdata, 205K rodata, 546K init, 66K bss, 2208K reserved, 0K cma-reserved)
+[    0.000000] rcu: Hierarchical RCU implementation.
+[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
+[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
+[    0.000000] riscv-intc: 64 local interrupts mapped
+[    0.000000] plic: interrupt-controller@c000000: mapped 65 interrupts with 2 handlers for 4 contexts.
+[    0.000000] k210-clk: clock-controller: CPU running at 390 MHz
+[    0.000000] clint: timer@2000000: timer running at 7800000 Hz
+[    0.000000] clocksource: clint_clocksource: mask: 0xffffffffffffffff max_cycles: 0x3990be68b, max_idle_ns: 881590404272 ns
+[    0.000001] sched_clock: 64 bits at 7MHz, resolution 128ns, wraps every 4398046511054ns
+[    0.008178] Calibrating delay loop (skipped), value calculated using timer frequency.. 15.60 BogoMIPS (lpj=31200)
+[    0.018251] pid_max: default: 4096 minimum: 301
+[    0.022861] Mount-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
+[    0.029971] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
+[    0.040234] rcu: Hierarchical SRCU implementation.
+[    0.045110] smp: Bringing up secondary CPUs ...
+[    0.050211] smp: Brought up 1 node, 2 CPUs
+[    0.054340] devtmpfs: initialized
+[    0.070401] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
+[    0.079473] pinctrl core: initialized pinctrl subsystem
+[    0.117795] clocksource: Switched to clocksource clint_clocksource
+[    0.130245] workingset: timestamp_bits=62 max_order=11 bucket_order=0
+[    0.176925] k210-sysctl 50440000.syscon: K210 system controller
+[    0.192947] k210-rst 50440000.syscon:reset-controller: K210 reset controller
+[    0.200870] cacheinfo: Unable to detect cache hierarchy for CPU 0
+[    0.210947] i2c_dev: i2c /dev entries driver
+[    0.220535] k210-fpioa 502b0000.pinmux: K210 FPIOA pin controller
+[    0.232253] 38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1, base_baud = 115200) is a SiFive UART v0
+[    0.241202] printk: console [ttySIF0] enabled
+[    0.241202] printk: console [ttySIF0] enabled
+[    0.249818] printk: bootconsole [sifive0] disabled
+[    0.249818] printk: bootconsole [sifive0] disabled
+[    0.261664] panel@0 enforce active low on chipselect handle
+[    0.275950] Freeing unused kernel image (initmem) memory: 540K
+[    0.281098] This architecture does not have kernel memory protection.
+[    0.287520] Run /init as init process
+          __  _
+         / / (_) ____   _   _ __  __
+        / /  | ||  _ \ | | | |\ \/ /
+       / /___| || | | || |_| | >  <
+      /_____/|_||_| |_| \____|/_/\_\
+    64-bits RISC-V Kendryte K210 NOMMU
+
+/ #
+```
+
+To open a terminal console without re-flashing the board, the pyserial-miniterm
+host tool can be used.
+
+```
+$ output/host/bin/pyserial-miniterm --raw --eol=LF /dev/ttyUSB0 115200
+```
+
+The options "--raw" and "--eol=LF" are added here to avoid a double carriage
+return each time a command is entered.
diff --git a/configs/canaan_kd233_defconfig b/configs/canaan_kd233_defconfig
new file mode 100644
index 0000000000..85b7b14fbd
--- /dev/null
+++ b/configs/canaan_kd233_defconfig
@@ -0,0 +1,39 @@
+# Architecture
+BR2_riscv=y
+BR2_RISCV_64=y
+BR2_riscv_custom=y
+BR2_RISCV_ISA_CUSTOM_RVM=y
+BR2_RISCV_ISA_CUSTOM_RVA=y
+BR2_RISCV_ISA_CUSTOM_RVF=y
+BR2_RISCV_ISA_CUSTOM_RVD=y
+BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_RISCV_ABI_LP64D=y
+
+# Patches
+BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
+
+# Binary format
+# BR2_USE_MMU is not set
+BR2_BINFMT_FLAT=y
+BR2_BINFMT_FLAT_ONE=y
+# BR2_TARGET_ENABLE_ROOT_LOGIN is not set
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/kd233/linux-cpio.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+
+# Packages
+BR2_PACKAGE_HOST_PYTHON_KFLASH=y
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+
+# Filesystem
+BR2_INIT_NONE=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
