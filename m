Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6024CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 05:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0073040491;
	Tue, 31 May 2022 05:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2-B5FW8nM2oO; Tue, 31 May 2022 05:50:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C090F40232;
	Tue, 31 May 2022 05:50:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 726BA1BF375
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 05:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E56161110
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 05:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com header.b="QOmG3dzc";
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.b="Jse0s5PH"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HS6B4nnRqsTu for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 05:49:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA33960BF0
 for <buildroot@buildroot.org>; Tue, 31 May 2022 05:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653976176; x=1685512176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=URR34Sq/O0xxE8zczvD+eCxT+51wqpd+mif22AgPEPM=;
 b=QOmG3dzcrGQ9kokWBfgXzec+tKFFZUfDgeHtO7Vllv+NBEn/oHDyfwU4
 4gE1I7Ig11clxEDMY2vYFI8ig8T8xoz716FY6SIIPybTwiVZLEcoFHK+Z
 kHFephJlcly2Qg25aWqmk7hi6rokfvJIlDP8GWAr20KK5l2Vrt0RwftL8
 HxTFlWTlH/IPXDd30sPQpTrOdiEeXfAEmlwodkpGbb4izBRbLf2kvFt9t
 YaxaOWIaDFDVN917x/4xMpW9Md8nDI8w4v4TwqbUHnOCJJk1G4ffM1vgq
 sIPBeeUfkyYX6apWcbbk/uTpOZqS8BLI0oge7wN5ManPKYzdnxTgskyw4 A==;
X-IronPort-AV: E=Sophos;i="5.91,264,1647273600"; d="scan'208";a="306095088"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2022 13:49:36 +0800
IronPort-SDR: IZDvO06lk0imWwP1kcal0RyE+rUpLgsqFCRORxCE/q2bbvc2Fq9JIe0dh+4SskdP+lXFGwJSIg
 3Gpks+VaEZiez1O7yAMPIFZv65T2REaYe/syUf0k4wZiYLPelzX2bfOBtNCs9ntUMdOv+Pv2xn
 tIEg3ysjrN5iiDH0Uvm0me/e3tzDaRnq9TpTmvfPFbXOxGVOXhJduaIDEzU2pr5dFvtVzrn9mo
 vDn0yppdwsxyKhZj7K0HuxwE5OALQGyNv/QCzASdcmyZNVNALW7L3gaS8YHvvy/9mdXTx92jqd
 o6MJajnvwsGV+8Ilb3Z/F5qe
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2022 22:13:22 -0700
IronPort-SDR: Gd+KRwhhqUKex3xm1wcHVN7cyUJPTLflyjuWEgPh8jquojlQrgsjSaZI6BEdvPf4Ldfuos/Fqg
 yOUWUxEeJ4rbyG5rShSgVZxKX06cGhk+VKLRjhmejwJATui7Mts1NVJvewRAGhLgO4aOrYu2r/
 E9WkBz/pOk8fonWIWUGzFhkY56GXzvRCYI9AY3xnJmsbI816wNw+STlYO7getjeC/Ry4cMNlb+
 miErPGb+qyUQ+7Jnwi6+3B6diBu/DS5AS4IjMGSGwE4sxmJXFMaxGgcaSbfvLGuXCII9BhTbFl
 azE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2022 22:49:37 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LC1Z82pMqz1SHwl
 for <buildroot@buildroot.org>; Mon, 30 May 2022 22:49:36 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653976174; x=1656568175; bh=URR34Sq/O0xxE8zczv
 D+eCxT+51wqpd+mif22AgPEPM=; b=Jse0s5PH+4XlNICKnaytZKMNyZB2EMpp7/
 gT1HXqSlyXvU3gE9/DghioWg9J7Uzq+IvsyXeUqxNEK0Kxjyy05W4M+yON/tRm1Z
 Abvh6yqaDq+NsM26cnKcQrsx/+emKJ5opPRE9/yreuOLpKvH6eqf1Kq9jePnfqLf
 9cUm0yfh1rVYy2TdakCeskq1j1LLBSa5Zx5kjZvIC4Ye9sJe8ZPkARmwP0ZI7hQx
 ki0R+3BNQ4OKvq11PSHxim+dIKrpHGFatJKDkST4C70qKjB6jM+He50xd4jOrMRS
 P268WGKbIUsdF7pE1m6jOOftH/aL9d+mBWryTJGa7n8gHRuP4BVA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id S1vsTR1kmIBt for <buildroot@buildroot.org>;
 Mon, 30 May 2022 22:49:34 -0700 (PDT)
Received: from twashi.fujisawa.hgst.com (unknown [10.225.163.61])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LC1Z56RNLz1Rvlc;
 Mon, 30 May 2022 22:49:33 -0700 (PDT)
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 May 2022 14:49:23 +0900
Message-Id: <20220531054926.373713-5-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531054926.373713-1-damien.lemoal@opensource.wdc.com>
References: <20220531054926.373713-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 4/7] board: Add Sipeed MAIXDUINO board support
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

Add two buildroot configuration files to build a minimal Linux
environment for the Sipeed MAIXDUINO board. The configurations are:
* sipeed_maixduino_defconfig: Build a bootable kernel image with an
  embedded initramfs root file system. The image built can be flashed to
  the board as is and does not require a boot loader. This configuration
  uses the tiny busybox configuration defined in
  board/canaan/k210-soc/busybox-tiny.config.
* sipeed_maixduino_sdcard_defconfig: Build a kernel image with a root
  file system on the SD card and using U-Boot as the boot loader. This
  uses the default busybox minimal configuration.

Both configurations also enable the kflash and pyserial-miniterm host
tools for flashing image files to the board and opening a terminal
console.

The readme.txt file documents how to build and boot the Sipeed MAIXDUINO
board with these configurations.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 DEVELOPERS                                |   2 +
 board/sipeed/maixduino/linux-cpio.config  |   2 +
 board/sipeed/maixduino/readme.txt         | 292 ++++++++++++++++++++++
 configs/sipeed_maixduino_defconfig        |  39 +++
 configs/sipeed_maixduino_sdcard_defconfig |  57 +++++
 5 files changed, 392 insertions(+)
 create mode 100644 board/sipeed/maixduino/linux-cpio.config
 create mode 100644 board/sipeed/maixduino/readme.txt
 create mode 100644 configs/sipeed_maixduino_defconfig
 create mode 100644 configs/sipeed_maixduino_sdcard_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 3a5671e45b..802e5cdbcb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -636,6 +636,8 @@ F:	board/canaan/
 F:	board/sipeed/
 F:	configs/sipeed_maix_bit_defconfig
 F:	configs/sipeed_maix_bit_sdcard_defconfig
+F:	configs/sipeed_maixduino_defconfig
+F:	configs/sipeed_maixduino_sdcard_defconfig
 
 N:	Daniel Nicoletti <dantti12@gmail.com>
 F:	package/cutelyst/
diff --git a/board/sipeed/maixduino/linux-cpio.config b/board/sipeed/maixduino/linux-cpio.config
new file mode 100644
index 0000000000..049a2550c5
--- /dev/null
+++ b/board/sipeed/maixduino/linux-cpio.config
@@ -0,0 +1,2 @@
+CONFIG_SOC_CANAAN_K210_DTB_BUILTIN=y
+CONFIG_SOC_CANAAN_K210_DTB_SOURCE="sipeed_maixduino"
diff --git a/board/sipeed/maixduino/readme.txt b/board/sipeed/maixduino/readme.txt
new file mode 100644
index 0000000000..53a9e5c2ac
--- /dev/null
+++ b/board/sipeed/maixduino/readme.txt
@@ -0,0 +1,292 @@
+Sipeed MAIXDUINO Board
+======================
+
+The Sipeed MAIXDUINO board is a dual-core RISC-V 64-bits board based on the
+Canaan Kendryte K210 SoC. This board has the same form factor as the Arduino
+UNO board.
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
+Two buildroot configurations are provided:
+
+(1) Direct Linux Kernel Boot
+
+This is defined by the sipeed_maixduino_defconfig configuration. This
+configuration allows building a bootable kernel image with a built-in initramfs
+root file system (the board SD card is not used). The built kernel image can be
+flashed directly to the board ROM for direct booting. No boot loader is
+required.
+
+(2) U-Boot SD-Card Boot
+
+The sipeed_maixduino_sdcard_defconfig configuration allows building a kernel
+image with the root file system on the board SD card. U-Boot is used as the
+boot loader.
+
+Note: U-Boot does not natively support the Sipeed MAIXDUINO board. However, the
+board and device tree differences with the Sipeed MAIX-bit board are small
+enough for U-Boot to work.
+
+Both configuration files will also compile and install the kflash and
+pyserial-miniterm host utilities to program bootable image files to the board
+and open a serial terminal console.
+
+Direct Linux Kernel Boot
+------------------------
+
+Using the sipeed_maixduino_defconfig configuration, the bootable kernel binary
+image is built as follows.
+
+```
+$ make sipeed_maixduino_defconfig
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
+[    0.000000] Linux version 5.18.0 (foo@bar.com) (riscv64-buildroot-linux-uclibc-gcc.br_real (Buildroot 2022.02-560-g6a2b542a09-dirty) 10.3.0, GNU ld (GNU Binutils) 2.32) #2 SMP Thu Apr 21 15:16:00 JST 2022
+[    0.000000] Machine model: SiPeed MAIXDUINO
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
+[    0.000000] Memory: 6000K/8192K available (964K kernel code, 137K rwdata, 205K rodata, 530K init, 66K bss, 2192K reserved, 0K cma-reserved)
+[    0.000000] rcu: Hierarchical RCU implementation.
+[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
+[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
+[    0.000000] riscv-intc: 64 local interrupts mapped
+[    0.000000] plic: interrupt-controller@c000000: mapped 65 interrupts with 2 handlers for 4 contexts.
+[    0.000000] k210-clk: clock-controller: CPU running at 390 MHz
+[    0.000000] clint: timer@2000000: timer running at 7800000 Hz
+[    0.000000] clocksource: clint_clocksource: mask: 0xffffffffffffffff max_cycles: 0x3990be68b, max_idle_ns: 881590404272 ns
+[    0.000001] sched_clock: 64 bits at 7MHz, resolution 128ns, wraps every 4398046511054ns
+[    0.008183] Calibrating delay loop (skipped), value calculated using timer frequency.. 15.60 BogoMIPS (lpj=31200)
+[    0.018249] pid_max: default: 4096 minimum: 301
+[    0.022860] Mount-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
+[    0.029971] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
+[    0.040242] rcu: Hierarchical SRCU implementation.
+[    0.045124] smp: Bringing up secondary CPUs ...
+[    0.050217] smp: Brought up 1 node, 2 CPUs
+[    0.054346] devtmpfs: initialized
+[    0.070924] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
+[    0.079996] pinctrl core: initialized pinctrl subsystem
+[    0.119893] clocksource: Switched to clocksource clint_clocksource
+[    0.131992] workingset: timestamp_bits=62 max_order=11 bucket_order=0
+[    0.179099] k210-sysctl 50440000.syscon: K210 system controller
+[    0.194904] k210-rst 50440000.syscon:reset-controller: K210 reset controller
+[    0.203108] cacheinfo: Unable to detect cache hierarchy for CPU 0
+[    0.213867] i2c_dev: i2c /dev entries driver
+[    0.223397] k210-fpioa 502b0000.pinmux: K210 FPIOA pin controller
+[    0.235632] 38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1, base_baud = 115200) is a SiFive UART v0
+[    0.244585] printk: console [ttySIF0] enabled
+[    0.244585] printk: console [ttySIF0] enabled
+[    0.253190] printk: bootconsole [sifive0] disabled
+[    0.253190] printk: bootconsole [sifive0] disabled
+[    0.264820] panel@0 enforce active low on chipselect handle
+[    0.281482] Freeing unused kernel image (initmem) memory: 524K
+[    0.286621] This architecture does not have kernel memory protection.
+[    0.293047] Run /init as init process
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
+
+
+U-Boot SD-Card Boot
+-------------------
+
+The build procedure is similar to the built-in initramfs case.
+
+```
+$ make sipeed_maixduino_sdcard_defconfig
+$ make
+```
+
+The build process will generate two files under the output/images directory.
+
+* sdcard.img: The image file for the SD card filesystem. This image has 2
+  partitions. The first partition is a vfat partition containing the kernel
+  uImage and the board device tree binary. The second partition is the root
+  filesystem with busybox installed. The second partition is formatted using
+  ext2 (rev1).
+
+* uboot.bin: U-Boot bootable binary to load and boot the kernel from the SD
+  card.
+
+The SD card can be prepared by writing the sdcard.img file, as follows.
+
+```
+$ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M
+$ sync
+$ eject /dev/sdX
+```
+
+Where /dev/sdX is the device file name of the SD card. Once completed, the SD
+card can be inserted into the board and the U-Boot binary image written to the
+board boot flash using the kflash utility.
+
+```
+$ output/host/bin/kflash -b 1500000 -p /dev/ttyUSB0 -t output/images/u-boot.bin
+```
+
+The above command will program U-Boot image to the board boot ROM and open a
+terminal console once the u-boot.bin file is fully programmed. Reboot into the
+newly programmed environment by pressing the board reset button.
+
+The output will be similar to the following.
+
+```
+[    0.000000] Linux version 5.18.0 (foo@bar.com) (riscv64-buildroot-linux-uclibc-gcc.br_real (Buildroot 2022.02-560-g6a2b542a09-dirty) 10.3.0, GNU ld (GNU Binutils) 2.32) #1 SMP Thu Apr 21 15:30:18 JST 2022
+[    0.000000] Machine model: SiPeed MAIXDUINO
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
+[    0.000000] percpu: Embedded 11 pages/cpu s15392 r0 d29664 u45056
+[    0.000000] percpu: wasting 10 pages per chunk
+[    0.000000] Built 1 zonelists, mobility grouping off.  Total pages: 2020
+[    0.000000] Kernel command line: earlycon console=ttySIF0 root=/dev/mmcblk0p2 rootwait ro
+[    0.000000] Dentry cache hash table entries: 1024 (order: 1, 8192 bytes, linear)
+[    0.000000] Inode-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
+[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
+[    0.000000] Memory: 6156K/8192K available (1180K kernel code, 151K rwdata, 239K rodata, 102K init, 69K bss, 2036K reserved, 0K cma-reserved)
+[    0.000000] rcu: Hierarchical RCU implementation.
+[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
+[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
+[    0.000000] riscv-intc: 64 local interrupts mapped
+[    0.000000] plic: interrupt-controller@c000000: mapped 65 interrupts with 2 handlers for 4 contexts.
+[    0.000000] k210-clk: clock-controller: CPU running at 390 MHz
+[    0.000000] clint: timer@2000000: timer running at 7800000 Hz
+[    0.000000] clocksource: clint_clocksource: mask: 0xffffffffffffffff max_cycles: 0x3990be68b, max_idle_ns: 881590404272 ns
+[    0.000001] sched_clock: 64 bits at 7MHz, resolution 128ns, wraps every 4398046511054ns
+[    0.008191] Calibrating delay loop (skipped), value calculated using timer frequency.. 15.60 BogoMIPS (lpj=31200)
+[    0.018255] pid_max: default: 4096 minimum: 301
+[    0.022876] Mount-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
+[    0.029982] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
+[    0.040417] rcu: Hierarchical SRCU implementation.
+[    0.045397] smp: Bringing up secondary CPUs ...
+[    0.050513] smp: Brought up 1 node, 2 CPUs
+[    0.054680] devtmpfs: initialized
+[    0.072127] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
+[    0.081205] pinctrl core: initialized pinctrl subsystem
+[    0.125074] clocksource: Switched to clocksource clint_clocksource
+[    0.138311] workingset: timestamp_bits=62 max_order=11 bucket_order=0
+[    0.183471] k210-sysctl 50440000.syscon: K210 system controller
+[    0.199873] k210-rst 50440000.syscon:reset-controller: K210 reset controller
+[    0.208858] cacheinfo: Unable to detect cache hierarchy for CPU 0
+[    0.221586] i2c_dev: i2c /dev entries driver
+[    0.232786] k210-fpioa 502b0000.pinmux: K210 FPIOA pin controller
+[    0.246572] 38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1, base_baud = 115200) is a SiFive UART v0
+[    0.255508] printk: console [ttySIF0] enabled
+[    0.255508] printk: console [ttySIF0] enabled
+[    0.264137] printk: bootconsole [sifive0] disabled
+[    0.264137] printk: bootconsole [sifive0] disabled
+[    0.275560] panel@0 enforce active low on chipselect handle
+[    0.313245] mmc_spi spi3.0: SD/MMC host mmc0, no WP, no poweroff, cd polling
+[    0.322845] Waiting for root device /dev/mmcblk0p2...
+[    0.345869] mmc0: host does not support reading read-only switch, assuming write-enable
+[    0.353221] mmc0: new SDHC card on SPI
+[    0.360233] mmcblk0: mmc0:0000 SA16G 14.5 GiB
+[    0.368350] random: fast init done
+[    0.372926]  mmcblk0: p1 p2
+[    0.391887] random: get_random_bytes called from 0x000000008009b7d2 with crng_init=1
+[    0.400427] VFS: Mounted root (ext2 filesystem) readonly on device 179:2.
+[    0.410128] devtmpfs: mounted
+[    0.412628] Freeing unused kernel image (initmem) memory: 96K
+[    0.418137] This architecture does not have kernel memory protection.
+[    0.424530] Run /sbin/init as init process
+[    0.563384] random: crng init done
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
+Of note is that the kernel mounts the SD card as read-only by default to avoid
+corruptions of the ext2 root file system when the board is powered down. This
+is recommended as this board does not support clean shutdown or halt.
+
+Similarly to the initramfs build case, a console can be open without
+re-flashing the board using the host tool pyserial-miniterm.
+
+```
+$ output/host/bin/pyserial-miniterm --raw --eol=LF /dev/ttyUSB0 115200
+```
diff --git a/configs/sipeed_maixduino_defconfig b/configs/sipeed_maixduino_defconfig
new file mode 100644
index 0000000000..a581ecbea5
--- /dev/null
+++ b/configs/sipeed_maixduino_defconfig
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
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maixduino/linux-cpio.config"
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
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
new file mode 100644
index 0000000000..7e627e5d15
--- /dev/null
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -0,0 +1,57 @@
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
+# System
+# BR2_USE_MMU is not set
+BR2_BINFMT_FLAT=y
+BR2_BINFMT_FLAT_ONE=y
+# BR2_TARGET_ENABLE_ROOT_LOGIN is not set
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/linux-sdcard.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maixduino"
+
+# Packages
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+
+# Filesystem
+BR2_INIT_NONE=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_SIZE=64M
+BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
+
+# Bootloader and related host tools
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/uboot.config"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sipeed_maix_bitm"
+BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_PYTHON_KFLASH=y
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
