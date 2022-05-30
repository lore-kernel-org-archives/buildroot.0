Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA1EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 03:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F62E60EC8;
	Mon, 30 May 2022 03:40:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UKKxGv_2nKEr; Mon, 30 May 2022 03:40:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AF5960E1A;
	Mon, 30 May 2022 03:40:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0065E1BF834
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 03:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2A1D40C01
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 03:38:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com header.b="b0G3HVzg";
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.b="UHjO+PjH"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7B8-kSro9yOm for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 03:38:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74B514000B
 for <buildroot@buildroot.org>; Mon, 30 May 2022 03:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653881935; x=1685417935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+FwsYbYaA3j3oYnHP7KoAtEjWEC5XpTydTRJ1QKqLsA=;
 b=b0G3HVzgJFjqVh196Jm40Pp39CPwaJCQ/D8y11lTLnRmy1Wv8nzG4NFt
 29TY2jUKZdt96Rnxsy7yUPEVgfmFC0WjZhCqIJDM7vXSsfVrlez8NVQr7
 o0eL6BibIFAPfg4JbBVTGoQ5/qjPoU6qhxFhDvTL4rEkf24OMxT5TM2mA
 9zapOw2g+2Ef/Wn6AFKVOuKlUfVQPtbb/ZJxsPyU45KNbneAkJG2HPYrC
 t5psvtMlIrdOL9OiwAgGrYEqMnzOpNDZ8RgaDVDyzYpYPEWzDi9XaUhZh
 Lk1+Z+09ywTh1EQ6v3L7yBBOY5KlL9WOmaPNP6r4zGlsWwwC3cGOdSusd g==;
X-IronPort-AV: E=Sophos;i="5.91,261,1647273600"; d="scan'208";a="313781131"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 May 2022 11:38:55 +0800
IronPort-SDR: i3BAU4FUbPdR2E2OvMweU9luPyFXSm+XmqOnRxp/G6qls8+1N+StsFDA/peQU+43+MMQde8A8I
 t8AM2/p6FxwkWCKux8QBmDfpX7nUGlPewoBa0syfRmqM4JZ59ZiTwsOOzU2a59jhvq/GUMLadw
 rcJf3Kk7A54RW+J/efdPHHoVQNbjvkpN2hbX51pzjB1v17Yt2ZAiE+pbIcbrhvw+PaY/fvBimk
 h4xGk9F36qWZyQJHen+dO2rwGR2dTT6CbZMHYOQvavgpuKP35wnRGo5O11hVXequmTa/fImqSA
 +jXJG2IitBxywR9zYebcUuRQ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 May 2022 19:58:20 -0700
IronPort-SDR: kIIRzllSLMCgA0qfkccuaVY43Mr3NVM4+YBq73Oovx2n+1e4BDozoaXFINdcqpZVh972zO0oz/
 u5hFCuqsYm7YwOFzfR1yEODrImm8b+x62X1iRinzWksNP/YliqKTuiqShCIPG793pttdsMxYrw
 y5FxIy3IBlTBcLzUYvrME+VQtHtq9RsNhLgToGwyO5xH7CBZs5GsIbQUKMGKHA//OeehNV2xaQ
 Z95Mgm49AfFcAavqw9bLCFXcvMjs6nQs8lzmMs9VPEoNaGISlE0Uw9Svuo5mOudnv1PilTTIVj
 Ios=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 May 2022 20:38:55 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LBLjp5L79z1Rwrw
 for <buildroot@buildroot.org>; Sun, 29 May 2022 20:38:54 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653881932; x=1656473933; bh=+FwsYbYaA3j3oYnHP7
 KoAtEjWEC5XpTydTRJ1QKqLsA=; b=UHjO+PjHo7lf6NmptuiOFmE8EDDV8sSEk/
 74Tohk2unPF/JGZqLGLiveCzMQSkgPCOoA5P8SXHbvdKIGn79EEtKzHfFpzZfqoz
 /PR9NB/ZgUaVfFlQLNRaUppDN94ZCbtQgTzivwJYkPYjGzcV/cZh3fqOETv5ZGrF
 jUs1rcljm6eKetgzFy69cAYgr9Oez3OCqtiSWRsLDC5OGiqYlNm12VAZe24Ov54p
 O1sMsWX0OVUpjni2bjmQhAi3y3h2j8B73MlF+QBab9VqhfnQqYwer/vbpd8YN16l
 3QLFrbTv3uJysH2M62BZYisZJORKlqgEZb5cW/G7ZJvjZv3k8eHw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id NCpQAkJvZEY5 for <buildroot@buildroot.org>;
 Sun, 29 May 2022 20:38:52 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com
 [10.149.53.254])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LBLjl3NtDz1SVp3;
 Sun, 29 May 2022 20:38:51 -0700 (PDT)
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 May 2022 12:38:34 +0900
Message-Id: <20220530033836.474926-10-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
References: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 09/11] board: Add Sipeed MAIX-Dock board
 support
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add two buildroot configuration files to build a minimal Linux
environment for the Sipeed MAIX-Dock board. The configurations are:
* sipeed_maix_dock_defconfig: Build a bootable kernel image with an
  embedded initramfs root file system. The image built can be flashed to
  the board as is and does not require a boot loader. This configuration
  uses the tiny busybox configuration defined in
  board/canaan/k210-soc/busybox-tiny.config.
* sipeed_maix_dock_sdcard_defconfig: Build a kernel image with a root
  file system on the SD card and using U-Boot as the boot loader. This
  uses the default busybox minimal configuration.

Both configurations also enable the kflash and pyserial-miniterm host
tools for flashing image files to the board and opening a terminal
console.

The readme.txt file documents how to build and boot the Sipeed
MAIX-Dock board with these configurations.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 DEVELOPERS                                |   2 +
 board/sipeed/maix-dock/linux-cpio.config  |   2 +
 board/sipeed/maix-dock/readme.txt         | 321 ++++++++++++++++++++++
 configs/sipeed_maix_dock_defconfig        |  38 +++
 configs/sipeed_maix_dock_sdcard_defconfig |  56 ++++
 5 files changed, 419 insertions(+)
 create mode 100644 board/sipeed/maix-dock/linux-cpio.config
 create mode 100644 board/sipeed/maix-dock/readme.txt
 create mode 100644 configs/sipeed_maix_dock_defconfig
 create mode 100644 configs/sipeed_maix_dock_sdcard_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 570aea8c65..493699ce13 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -635,6 +635,8 @@ F:	configs/sipeed_maix_bit_defconfig
 F:	configs/sipeed_maix_bit_sdcard_defconfig
 F:	configs/sipeed_maixduino_defconfig
 F:	configs/sipeed_maixduino_sdcard_defconfig
+F:	configs/sipeed_maix_dock_defconfig
+F:	configs/sipeed_maix_dock_sdcard_defconfig
 
 N:	Daniel Nicoletti <dantti12@gmail.com>
 F:	package/cutelyst/
diff --git a/board/sipeed/maix-dock/linux-cpio.config b/board/sipeed/maix-dock/linux-cpio.config
new file mode 100644
index 0000000000..b1ca3166f8
--- /dev/null
+++ b/board/sipeed/maix-dock/linux-cpio.config
@@ -0,0 +1,2 @@
+CONFIG_SOC_CANAAN_K210_DTB_BUILTIN=y
+CONFIG_SOC_CANAAN_K210_DTB_SOURCE="sipeed_maix_dock"
diff --git a/board/sipeed/maix-dock/readme.txt b/board/sipeed/maix-dock/readme.txt
new file mode 100644
index 0000000000..183a4d0421
--- /dev/null
+++ b/board/sipeed/maix-dock/readme.txt
@@ -0,0 +1,321 @@
+Sipeed MAIX-Dock Board
+======================
+
+The Sipeed MAXI-Dock board is a dual-core RISC-V 64-bits board based on the
+Canaan Kendryte K210 SoC.
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
+Two buildroot configuration files are provided:
+
+(1) Direct Linux Kernel Boot
+
+This is defined by the sipeed_maix_dock_defconfig configuration. This
+configuration allows building a bootable kernel image with a built-in initramfs
+root file system (the board SD card is not used). The built kernel image can be
+flashed directly to the board ROM for direct booting. No boot loader is
+required.
+
+(2) U-Boot SD-Card Boot
+
+The sipeed_maix_dock_sdcard_defconfig configuration allows building a kernel
+image with the root file system on the board SD card. U-Boot is used as the
+boot loader.
+
+Note: U-Boot does not natively support the Sipeed MAIX-Dock board. However, the
+board and device tree differences with the Sipeed MAIX-Bit board are small
+enough for U-Boot to work.
+
+Both configuration files will also compile the pyserial-miniterm host tool open
+a serial terminal console for the board.
+
+Direct Linux Kernel Boot
+-------------------------
+
+Using the sipeed_maix_dock_defconfig configuration, the bootable kernel binary
+image is built as follows.
+
+```
+$ make sipeed_maix_dock_defconfig
+$ make
+```
+
+Both configuration files will also compile and install the kflash and
+pyserial-miniterm host utilities to program bootable image files to the board
+and open a serial terminal console.
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
+[    0.000000] Linux version 5.18.0 (foo@bar.com) (riscv64-buildroot-linux-uclibc-gcc.br_real (Buildroot 2022.02-560-g6a2b542a09-dirty) 10.3.0, GNU ld (GNU Binutils) 2.32) #2 SMP Thu Apr 21 15:47:42 JST 2022
+[    0.000000] Machine model: SiPeed MAIX Dock
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
+[    0.000000] Memory: 5980K/8192K available (964K kernel code, 137K rwdata, 205K rodata, 546K init, 66K bss, 2212K reserved, 0K cma-reserved)
+[    0.000000] rcu: Hierarchical RCU implementation.
+[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
+[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
+[    0.000000] riscv-intc: 64 local interrupts mapped
+[    0.000000] plic: interrupt-controller@c000000: mapped 65 interrupts with 2 handlers for 4 contexts.
+[    0.000000] k210-clk: clock-controller: CPU running at 390 MHz
+[    0.000000] clint: timer@2000000: timer running at 7800000 Hz
+[    0.000000] clocksource: clint_clocksource: mask: 0xffffffffffffffff max_cycles: 0x3990be68b, max_idle_ns: 881590404272 ns
+[    0.000001] sched_clock: 64 bits at 7MHz, resolution 128ns, wraps every 4398046511054ns
+[    0.008187] Calibrating delay loop (skipped), value calculated using timer frequency.. 15.60 BogoMIPS (lpj=31200)
+[    0.018250] pid_max: default: 4096 minimum: 301
+[    0.022859] Mount-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
+[    0.029971] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
+[    0.040238] rcu: Hierarchical SRCU implementation.
+[    0.045110] smp: Bringing up secondary CPUs ...
+[    0.050215] smp: Brought up 1 node, 2 CPUs
+[    0.054345] devtmpfs: initialized
+[    0.071112] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
+[    0.080182] pinctrl core: initialized pinctrl subsystem
+[    0.120689] clocksource: Switched to clocksource clint_clocksource
+[    0.133165] workingset: timestamp_bits=62 max_order=11 bucket_order=0
+[    0.181750] k210-sysctl 50440000.syscon: K210 system controller
+[    0.198612] k210-rst 50440000.syscon:reset-controller: K210 reset controller
+[    0.206644] cacheinfo: Unable to detect cache hierarchy for CPU 0
+[    0.216569] i2c_dev: i2c /dev entries driver
+[    0.225905] k210-fpioa 502b0000.pinmux: K210 FPIOA pin controller
+[    0.238866] 38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1, base_baud = 115200) is a SiFive UART v0
+[    0.247778] printk: console [ttySIF0] enabled
+[    0.247778] printk: console [ttySIF0] enabled
+[    0.256459] printk: bootconsole [sifive0] disabled
+[    0.256459] printk: bootconsole [sifive0] disabled
+[    0.268225] panel@0 enforce active low on chipselect handle
+[    0.285238] Freeing unused kernel image (initmem) memory: 540K
+[    0.290372] This architecture does not have kernel memory protection.
+[    0.296807] Run /init as init process
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
+$ make sipeed_maix_dock_sdcard_defconfig
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
+newly programmed environment by pressing the board reset button if it does 
+not reboot automatically.
+
+The output will be similar to the following.
+
+```
+U-Boot 2022.04 (Apr 21 2022 - 15:59:50 +0900)
+
+DRAM:  8 MiB
+Core:  34 devices, 17 uclasses, devicetree: separate
+WDT:   Not starting watchdog@50400000
+MMC:   spi@53000000:slot@0: 0
+Loading Environment from SPIFlash... SF: Detected w25q128fw with page size 256 Bytes, erase size 4 KiB, total 16 MiB
+*** Warning - bad CRC, using default environment
+
+In:    serial@38000000
+Out:   serial@38000000
+Err:   serial@38000000
+Hit any key to stop autoboot:  0
+1717730 bytes read in 957 ms (1.7 MiB/s)
+10382 bytes read in 11 ms (920.9 KiB/s)
+## Booting kernel from Legacy Image at 80060000 ...
+   Image Name:   Linux
+   Image Type:   RISC-V Linux Kernel Image (uncompressed)
+   Data Size:    1717666 Bytes = 1.6 MiB
+   Load Address: 80000000
+   Entry Point:  80000000
+   Verifying Checksum ... OK
+## Flattened Device Tree blob at 80400000
+   Booting using the fdt blob at 0x80400000
+   Loading Kernel Image
+   Loading Device Tree to 00000000803fa000, end 00000000803ff88d ... OK
+
+Starting kernel ...
+
+[    0.000000] Linux version 5.18.0 (foo@bar.com) (riscv64-buildroot-linux-uclibc-gcc.br_real (Buildroot 2022.02-560-g6a2b542a09-dirty) 10.3.0, GNU ld (GNU Binutils) 2.32) #1 SMP Thu Apr 21 16:00:03 JST 2022
+[    0.000000] Machine model: SiPeed MAIX Dock
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
+[    0.008196] Calibrating delay loop (skipped), value calculated using timer frequency.. 15.60 BogoMIPS (lpj=31200)
+[    0.018256] pid_max: default: 4096 minimum: 301
+[    0.022876] Mount-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
+[    0.029980] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
+[    0.040401] rcu: Hierarchical SRCU implementation.
+[    0.045379] smp: Bringing up secondary CPUs ...
+[    0.050494] smp: Brought up 1 node, 2 CPUs
+[    0.054656] devtmpfs: initialized
+[    0.072338] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
+[    0.081415] pinctrl core: initialized pinctrl subsystem
+[    0.123902] clocksource: Switched to clocksource clint_clocksource
+[    0.136898] workingset: timestamp_bits=62 max_order=11 bucket_order=0
+[    0.182570] k210-sysctl 50440000.syscon: K210 system controller
+[    0.198158] k210-rst 50440000.syscon:reset-controller: K210 reset controller
+[    0.207473] cacheinfo: Unable to detect cache hierarchy for CPU 0
+[    0.219724] i2c_dev: i2c /dev entries driver
+[    0.230080] k210-fpioa 502b0000.pinmux: K210 FPIOA pin controller
+[    0.243091] 38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1, base_baud = 115200) is a SiFive UART v0
+[    0.252034] printk: console [ttySIF0] enabled
+[    0.252034] printk: console [ttySIF0] enabled
+[    0.260656] printk: bootconsole [sifive0] disabled
+[    0.260656] printk: bootconsole [sifive0] disabled
+[    0.272546] panel@0 enforce active low on chipselect handle
+[    0.308098] mmc_spi spi3.0: SD/MMC host mmc0, no WP, no poweroff, cd polling
+[    0.320197] Waiting for root device /dev/mmcblk0p2...
+[    0.344667] mmc0: host does not support reading read-only switch, assuming write-enable
+[    0.352020] mmc0: new SDHC card on SPI
+[    0.358566] mmcblk0: mmc0:0000 SA16G 14.5 GiB
+[    0.366866] random: fast init done
+[    0.371439]  mmcblk0: p1 p2
+[    0.391314] random: get_random_bytes called from 0x000000008009b7d2 with crng_init=1
+[    0.400977] VFS: Mounted root (ext2 filesystem) readonly on device 179:2.
+[    0.410966] devtmpfs: mounted
+[    0.413521] Freeing unused kernel image (initmem) memory: 96K
+[    0.418944] This architecture does not have kernel memory protection.
+[    0.425370] Run /sbin/init as init process
+[    0.633502] random: crng init done
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
diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
new file mode 100644
index 0000000000..4be41e80ec
--- /dev/null
+++ b/configs/sipeed_maix_dock_defconfig
@@ -0,0 +1,38 @@
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
+# Binary format
+# BR2_USE_MMU is not set
+BR2_BINFMT_FLAT=y
+BR2_BINFMT_FLAT_ONE=y
+# BR2_TARGET_ENABLE_ROOT_LOGIN is not set
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_PATCH="board/riscv/nommu/kernel_patches"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-dock/linux-cpio.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+
+# Packages
+BR2_PACKAGE_HOST_ELF2FLT=y
+BR2_PACKAGE_HOST_PYTHON_KFLASH=y
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.config"
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+
+# Filesystem
+BR2_INIT_NONE=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
new file mode 100644
index 0000000000..f235c720b3
--- /dev/null
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -0,0 +1,56 @@
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
+# System
+# BR2_USE_MMU is not set
+BR2_BINFMT_FLAT=y
+BR2_BINFMT_FLAT_ONE=y
+# BR2_TARGET_ENABLE_ROOT_LOGIN is not set
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_PATCH="board/riscv/nommu/kernel_patches"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/linux-sdcard.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_dock"
+
+# Packages
+BR2_PACKAGE_HOST_ELF2FLT=y
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
