Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D406C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:26:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F13760FC2
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F13760FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3154980E17;
	Tue, 26 Oct 2021 07:26:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kkwbBCB9wjfc; Tue, 26 Oct 2021 07:26:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E927581028;
	Tue, 26 Oct 2021 07:26:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4009E1BF30B
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AE1780DF7
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:24:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QBDjjOKSll3T for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 07:24:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C23380DD3
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 07:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635233091; x=1666769091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hjMbqdwhgwl5WIzFb/frbt1DEhSFGH2v9gGh5YDOsQM=;
 b=hBqbxG3SO7wHaiah5OhgoER/AQPhxg7RCFYiI1qLZ8q92IMcOSB5kZkA
 5hGQCNK60BPdqwEGKOrZwuDA6JUc29k5c53Vm6Pn0y++t6BOWRlQQTkZY
 H6ojLrzDcGlM50nZXca2Y+HJEVaJQhlFVvQA/SdjzvHhFTDKVVKz4/iQ5
 w9rbRSuPMw2nS38JMFUFzv70J9UXUfjKlZgjEsf8GfcYHqqyLhaprHnT3
 GxzCzhoNcG5MTFpsdMW+jWFcd5yJfIFxEmJSjW+sSvL/09OYG8c3m31iz
 OHGTTbbr5CCVxw+UkRYIFAbX0DZ8FOBkdnNpEtqAIlTM8LINpp/z+1amN A==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="188623084"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 15:17:38 +0800
IronPort-SDR: KQPAwrywQUycGg7dICL9jtnMbe2jD2z8uK+BY0Q5TJ8KjlAvHCxASjjMNZz/FeBDNKgZVY/cSo
 SAKinz/HbNmgTVnKMqL8TJV1Ueam0zEXijolj8QLU3WPcHLaFYWHTRS+t2fXyJS8flCT4og6UT
 6cougjfuSDVFyzc9fMkikL2+a5KQoIleZ1SPvzVpcg2+K7c5Dq1T9LoUhEn+6xYbQ8lg7flRyz
 /JyIgFq8upxuXJMGwDekFaXxksnAR0OxFMNckV/TpwLPXQB7QfL8Q219EjPxdJCUHzugT0B+po
 wENXsoh5fRhmSO/QD06hjTiK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 23:51:37 -0700
IronPort-SDR: ewXln+Wb7EhjwFBZb0ZZuC6gX1QPjnNwNakYEQ9VUc5+NZd7kDuZ9l3ye+cVIN7it4nlo1K1sq
 0Z9uBHv1g2LatLA08XyZOlbVjuEckl47gInutGRiLCSPVUNa07rjbfQ6PUiR5Z+Oso3JIGUxZm
 ForLnYbkAlgNZ8ZweO7zf2sPoDvC24TUbTzYNBk2TrqOkYOWXLY4MSq0+XaLngyOJH7zJIuoRP
 ffT79WvlIva0ydHP1NPiJZi3ZfHs76mBoAhvXrl8tLtxm2Rnh5GAQmLt/2k6CKppAxkxAK/IW2
 IFU=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Oct 2021 00:17:40 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Oct 2021 16:17:28 +0900
Message-Id: <20211026071728.954356-11-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026071728.954356-1-damien.lemoal@wdc.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 10/10] board: Document Canaan K210 based
 boards support
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
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a generic board/canaan/k210-common/README.md file documenting how to
generate and install buildroot images for boards based on the dual-core
RV64 Canaan K210 SoC. A simple README.md file pointing to this generic
documentation is also added under each K210 SoC board directory.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 board/canaan/k210-common/README.md | 318 +++++++++++++++++++++++++++++
 board/canaan/kd233/README.md       |   4 +
 board/sipeed/maix-bit/README.md    |   4 +
 board/sipeed/maix-dock/README.md   |   4 +
 board/sipeed/maix-go/README.md     |   4 +
 board/sipeed/maixduino/README.md   |   4 +
 6 files changed, 338 insertions(+)
 create mode 100644 board/canaan/k210-common/README.md
 create mode 100644 board/canaan/kd233/README.md
 create mode 100644 board/sipeed/maix-bit/README.md
 create mode 100644 board/sipeed/maix-dock/README.md
 create mode 100644 board/sipeed/maix-go/README.md
 create mode 100644 board/sipeed/maixduino/README.md

diff --git a/board/canaan/k210-common/README.md b/board/canaan/k210-common/README.md
new file mode 100644
index 0000000000..b9a4eca3b0
--- /dev/null
+++ b/board/canaan/k210-common/README.md
@@ -0,0 +1,318 @@
+# Canaan Kendryte K210 SoC Based Board Support
+
+Buildroot provides support for Canaan RISC-V Kendryte K210 SoC based boards.
+Configurations for different K210 Soc board variants are available. The boards
+supported are as follows.
+
+* From Sipeed: MAIX Bit, MAIX Dock (Dan Dock), MAIX Go and MAIXDUINO boards.
+
+* From Canaan: KD233 development board.
+
+For each board, two configurations are provided:
+
+* Configuration to build a bootable kernel image with built-in initramfs root
+file system (SD card is not used)
+
+* Configuration to build a bootable kernel image with the root file system
+on the board SD card.
+
+In all cases, the build process generates a bootable kernel image that can be
+directly flashed to the board boot flash. A boot loader (e.g. U-Boot) and
+OpenSBI are not necessary.
+
+## Bootable Kernel Image With A Built-In Initramfs Root File System
+
+The following table lists the default configuration provided for each board
+supported.
+
+| Board vendor and model | configuration name          |
+| ---------------------- | --------------------------- |
+| Canaan KD233           | canaan_kd233_defconfig      |
+| Sipeed MAIX bit        | sipeed_maix_bit_defconfig   |
+| Sipeed MAIX Go         | sipeed_maix_go_defconfig    |
+| Sipeed MAIX dock       | sipeed_maix_dock_defconfig  |
+| Sipeed MAIXDUINO       | sipeed_maixduino_defconfig  |
+
+The build procedure is similar for all boards. The steps to create the kernel
+bootable image are as follows:
+
+```
+$ make <config name>
+$ make
+```
+
+The build process will generate the bootable binary image file
+*output/images/loader.bin*. This image file must be written to the board boot
+flash using the
+[Sipeed kflash python utility](https://github.com/sipeed/kflash.py).
+
+```
+$ sudo python3 kflash.py -p /dev/ttyUSB0 -b 1500000 -t output/images/loader.bin
+```
+
+The above command will open a terminal console and reboot the board once the
+image is written. The output will be similar to the following (example obtained
+with the Sipeed MAIX Bit board).
+
+```
+[INFO] COM Port Selected Manually:  /dev/ttyUSB0
+[INFO] Default baudrate is 115200 , later it may be changed to the value you set.
+[INFO] Trying to Enter the ISP Mode...
+._
+[INFO] Automatically detected goE/kd233
+
+[INFO] Greeting Message Detected, Start Downloading ISP
+Downloading ISP: |=================================================================| 100.0% 10kiB/s
+[INFO] Booting From 0x80000000
+[INFO] Wait For 0.1 second for ISP to Boot
+[INFO] Boot to Flashmode Successfully
+[INFO] Selected Baudrate:  1500000
+[INFO] Baudrate changed, greeting with ISP again ...
+[INFO] Boot to Flashmode Successfully
+[INFO] Selected Flash:  On-Board
+[INFO] Initialization flash Successfully
+Programming BIN: |=================================================================| 100.0% 50kiB/s
+[INFO] Rebooting...
+--- forcing DTR inactive
+--- forcing RTS inactive
+--- Miniterm on /dev/ttyUSB0  115200,8,N,1 ---
+--- Quit: Ctrl+] | Menu: Ctrl+T | Help: Ctrl+T followed by Ctrl+H ---
+[    0.000000] Linux version 5.13.0 (xxx@yyy.com) (riscv64-buildroot-linux-uclibc-gcc.br_real (Buildroot 2021.05-rc3-447-g26fab79296-dirty) 11.1.0, GNU ld (GNU Binutils) 2.32) #2 SMP Fri Jul 9 10:59:05 JST 2021
+[    0.000000] Machine model: SiPeed MAIX BiT
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
+[    0.000000] percpu: max_distance=0x18000 too large for vmalloc space 0x0
+[    0.000000] percpu: Embedded 12 pages/cpu s19360 r0 d29792 u49152
+[    0.000000] Built 1 zonelists, mobility grouping off.  Total pages: 2020
+[    0.000000] Kernel command line: earlycon console=ttySIF0
+[    0.000000] Dentry cache hash table entries: 1024 (order: 1, 8192 bytes, linear)
+[    0.000000] Inode-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
+[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
+[    0.000000] Memory: 6052K/8192K available (950K kernel code, 140K rwdata, 200K rodata, 480K init, 66K bss, 2140K reserved, 0K cma-reserved)
+[    0.000000] rcu: Hierarchical RCU implementation.
+[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
+[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
+[    0.000000] riscv-intc: 64 local interrupts mapped
+[    0.000000] plic: interrupt-controller@c000000: mapped 65 interrupts with 2 handlers for 2 contexts.
+[    0.000000] k210-clk: clock-controller: CPU running at 390 MHz
+[    0.000000] clint: timer@2000000: timer running at 7800000 Hz
+[    0.000000] clocksource: clint_clocksource: mask: 0xffffffffffffffff max_cycles: 0x3990be68b, max_idle_ns: 881590404272 ns
+[    0.000002] sched_clock: 64 bits at 7MHz, resolution 128ns, wraps every 4398046511054ns
+[    0.008183] Calibrating delay loop (skipped), value calculated using timer frequency.. 15.60 BogoMIPS (lpj=31200)
+[    0.018250] pid_max: default: 4096 minimum: 301
+[    0.022865] Mount-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
+[    0.029971] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
+[    0.040316] rcu: Hierarchical SRCU implementation.
+[    0.045151] smp: Bringing up secondary CPUs ...
+[    0.050271] smp: Brought up 1 node, 2 CPUs
+[    0.054355] devtmpfs: initialized
+[    0.071852] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
+[    0.080926] pinctrl core: initialized pinctrl subsystem
+[    0.117980] clocksource: Switched to clocksource clint_clocksource
+[    0.130392] workingset: timestamp_bits=62 max_order=11 bucket_order=0
+[    0.162498] k210-fpioa 502b0000.pinmux: K210 FPIOA pin controller
+[    0.175231] k210-sysctl 50440000.syscon: K210 system controller
+[    0.182048] k210-rst 50440000.syscon:reset-controller: K210 reset controller
+[    0.189335] 38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1, base_baud = 115200) is a SiFive UART v0
+[    0.198258] printk: console [ttySIF0] enabled
+[    0.198258] printk: console [ttySIF0] enabled
+[    0.206899] printk: bootconsole [sifive0] disabled
+[    0.206899] printk: bootconsole [sifive0] disabled
+[    0.218821] cacheinfo: Unable to detect cache hierarchy for CPU 0
+[    0.236193] i2c /dev entries driver
+[    0.240804] random: get_random_bytes called from 0x000000008000586e with crng_init=0
+[    0.253005] Freeing unused kernel memory: 476K
+[    0.256754] This architecture does not have kernel memory protection.
+[    0.263177] Run /init as init process
+          __  _
+         / / (_) ____   _   _ __  __
+        / /  | ||  _ \ | | | |\ \/ /
+       / /___| || | | || |_| | >  <
+      /_____/|_||_| |_| \____|/_/\_\
+        RISC-V Kendryte K210 NOMMU
+
+
+BusyBox v1.33.1 (2021-07-09 10:58:24 JST) hush - the humble shell
+Enter 'help' for a list of built-in commands.
+
+/ #
+```
+
+To open a console without re-flashing the board, *miniterm.py* can be used.
+```
+sudo miniterm.py --raw --eol=LF /dev/ttyUSB0 115200
+```
+
+The options *--raw --eol=LF* are added here to avoid a double carriage return
+each time a command is entered.
+
+## Bootable Kernel Image With the Root File System On SD Card
+
+The following table lists the default configurations provided for the supported
+boards.
+
+| Board vendor and model | configuration name                 |
+| ---------------------- | ---------------------------------- |
+| Canaan KD233           | canaan_kd233_sdcard_defconfig      |
+| Sipeed MAIX bit        | sipeed_maix_bit_sdcard_defconfig   |
+| Sipeed MAIX Go         | sipeed_maix_go_sdcard_defconfig    |
+| Sipeed MAIX dock       | sipeed_maix_dock_sdcard_defconfig  |
+| Sipeed MAIXDUINO       | sipeed_maixduino_sdcard_defconfig  |
+
+The build procedure is similar to the built-in initramfs case.
+
+```
+$ make <config name>
+$ make
+```
+
+The build process will generate two files under the *output/images* directory.
+
+* *loader.bin*: This bootable kernel image file.
+
+* *rootfs.ext2*: ext2 (rev1) SD card image.
+
+Before flashing the kernel bootable image, the SD card must be prepared.
+
+```
+$ sudo dd if=output/images/rootfs.ext2 of=/dev/sdX1 bs=1M
+$ sync
+$ eject /dev/sdX
+```
+
+Where */dev/sdX* is the device file name of the SD card. The SD card must have
+at least one partition of at least 60 MB. Once completed, the SD card can be
+inserted into the board and the kernel bootable image file written to the board
+boot flash, using
+[Sipeed kflash python utility](https://github.com/sipeed/kflash.py).
+
+```
+$ sudo python3 kflash.py -p /dev/ttyUSB0 -b 1500000 -t output/image/loader.bin
+```
+
+The above command will open a terminal console and reboot the board once the
+image is written. The output will be similar to the following (example obtained
+with the Sipeed MAIX Bit board).
+
+```
+[INFO] COM Port Selected Manually:  /dev/ttyUSB0 
+[INFO] Default baudrate is 115200 , later it may be changed to the value you set. 
+[INFO] Trying to Enter the ISP Mode... 
+._
+[INFO] Automatically detected goE/kd233 
+
+[INFO] Greeting Message Detected, Start Downloading ISP 
+Downloading ISP: |=================================================================| 100.0% 10kiB/s
+[INFO] Booting From 0x80000000 
+[INFO] Wait For 0.1 second for ISP to Boot 
+[INFO] Boot to Flashmode Successfully 
+[INFO] Selected Baudrate:  1500000 
+[INFO] Baudrate changed, greeting with ISP again ...  
+[INFO] Boot to Flashmode Successfully 
+[INFO] Selected Flash:  On-Board 
+[INFO] Initialization flash Successfully 
+Programming BIN: |=================================================================| 100.0% 50kiB/s
+[INFO] Rebooting... 
+--- forcing DTR inactive
+--- forcing RTS inactive
+--- Miniterm on /dev/ttyUSB0  115200,8,N,1 ---
+--- Quit: Ctrl+] | Menu: Ctrl+T | Help: Ctrl+T followed by Ctrl+H ---
+[    0.000000] Linux version 5.13.0 (damien@twashi.fujisawa.hgst.com) (riscv64-buildroot-linux-uclibc-gcc.br_real (Buildroot 2021.05-rc3-447-g26fab79296-dirty) 11.1.0, GNU ld (GNU Binutils) 2.32) #1 SMP Fri Jul 9 14:50:18 JST 2021
+[    0.000000] Machine model: SiPeed MAIX BiT
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
+[    0.000000] percpu: max_distance=0x18000 too large for vmalloc space 0x0
+[    0.000000] percpu: Embedded 12 pages/cpu s19488 r0 d29664 u49152
+[    0.000000] Built 1 zonelists, mobility grouping off.  Total pages: 2020
+[    0.000000] Kernel command line: earlycon console=ttySIF0 rootdelay=2 root=/dev/mmcblk0p1 ro
+[    0.000000] Dentry cache hash table entries: 1024 (order: 1, 8192 bytes, linear)
+[    0.000000] Inode-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
+[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
+[    0.000000] Memory: 6184K/8192K available (1149K kernel code, 151K rwdata, 232K rodata, 105K init, 69K bss, 2008K reserved, 0K cma-reserved)
+[    0.000000] rcu: Hierarchical RCU implementation.
+[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
+[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
+[    0.000000] riscv-intc: 64 local interrupts mapped
+[    0.000000] plic: interrupt-controller@c000000: mapped 65 interrupts with 2 handlers for 2 contexts.
+[    0.000000] k210-clk: clock-controller: CPU running at 390 MHz
+[    0.000000] clint: timer@2000000: timer running at 7800000 Hz
+[    0.000000] clocksource: clint_clocksource: mask: 0xffffffffffffffff max_cycles: 0x3990be68b, max_idle_ns: 881590404272 ns
+[    0.000001] sched_clock: 64 bits at 7MHz, resolution 128ns, wraps every 4398046511054ns
+[    0.008179] Calibrating delay loop (skipped), value calculated using timer frequency.. 15.60 BogoMIPS (lpj=31200)
+[    0.018252] pid_max: default: 4096 minimum: 301
+[    0.022859] Mount-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
+[    0.029972] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
+[    0.040382] rcu: Hierarchical SRCU implementation.
+[    0.045234] smp: Bringing up secondary CPUs ...
+[    0.050345] smp: Brought up 1 node, 2 CPUs
+[    0.054419] devtmpfs: initialized
+[    0.071317] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
+[    0.080392] pinctrl core: initialized pinctrl subsystem
+[    0.119377] clocksource: Switched to clocksource clint_clocksource
+[    0.131238] workingset: timestamp_bits=62 max_order=11 bucket_order=0
+[    0.159389] k210-fpioa 502b0000.pinmux: K210 FPIOA pin controller
+[    0.171494] k210-sysctl 50440000.syscon: K210 system controller
+[    0.178193] k210-rst 50440000.syscon:reset-controller: K210 reset controller
+[    0.186800] 38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1, base_baud = 115200) is a SiFive UART v0
+[    0.195764] printk: console [ttySIF0] enabled
+[    0.195764] printk: console [ttySIF0] enabled
+[    0.204377] printk: bootconsole [sifive0] disabled
+[    0.204377] printk: bootconsole [sifive0] disabled
+[    0.216056] cacheinfo: Unable to detect cache hierarchy for CPU 0
+[    0.232882] i2c /dev entries driver
+[    0.263551] mmc_spi spi2.0: SD/MMC host mmc0, no WP, no poweroff, cd polling
+[    0.271167] random: get_random_bytes called from 0x0000000080005d60 with crng_init=0
+[    0.289511] Waiting 2 sec before mounting root device...
+[    0.312217] mmc0: host does not support reading read-only switch, assuming write-enable
+[    0.319565] mmc0: new SDHC card on SPI
+[    0.326205] mmcblk0: mmc0:0000 SA16G 14.5 GiB 
+[    0.333339] random: fast init done
+[    0.337935]  mmcblk0: p1 p2
+[    2.311900] VFS: Mounted root (ext2 filesystem) readonly on device 179:1.
+[    2.321555] devtmpfs: mounted
+[    2.324099] Freeing unused kernel memory: 100K
+[    2.328227] This architecture does not have kernel memory protection.
+[    2.334652] Run /sbin/init as init process
+[    2.491565] random: crng init done
+          __  _
+         / / (_) ____   _   _ __  __
+        / /  | ||  _ \ | | | |\ \/ /
+       / /___| || | | || |_| | >  < 
+      /_____/|_||_| |_| \____|/_/\_\
+        RISC-V Kendryte K210 NOMMU
+
+
+BusyBox v1.33.1 (2021-07-09 10:58:24 JST) hush - the humble shell
+Enter 'help' for a list of built-in commands.
+
+/ # 
+```
+
+Of note is that the kernel command line arguments, specified in the kernel
+*nommu_k210_sdcard* default configuration, mount the SD card as read-only to
+avoid corruptions of the ext2 root file system. This is recommended as this
+board does not isupport clean shutdown or halt.
+
+Similarly to the initramfs build case, a console can be open without
+re-flashing the board using *miniterm.py*.
+```
+sudo miniterm.py --raw --eol=LF /dev/ttyUSB0 115200
+```
diff --git a/board/canaan/kd233/README.md b/board/canaan/kd233/README.md
new file mode 100644
index 0000000000..e622d121c2
--- /dev/null
+++ b/board/canaan/kd233/README.md
@@ -0,0 +1,4 @@
+# Canaan KD233 Board
+
+See the common documentation for
+[Canaan K210 SoC based boards](../k210-common/README.md).
diff --git a/board/sipeed/maix-bit/README.md b/board/sipeed/maix-bit/README.md
new file mode 100644
index 0000000000..c9132bcc76
--- /dev/null
+++ b/board/sipeed/maix-bit/README.md
@@ -0,0 +1,4 @@
+# Sipeed MAIX-Bit Board
+
+See the common documentation for
+[Canaan K210 SoC based boards](../../canaan/k210-common/README.md).
diff --git a/board/sipeed/maix-dock/README.md b/board/sipeed/maix-dock/README.md
new file mode 100644
index 0000000000..fec6fb9939
--- /dev/null
+++ b/board/sipeed/maix-dock/README.md
@@ -0,0 +1,4 @@
+# Sipeed MAIX-Dock Board
+
+See the common documentation for
+[Canaan K210 SoC based boards](../../canaan/k210-common/README.md).
diff --git a/board/sipeed/maix-go/README.md b/board/sipeed/maix-go/README.md
new file mode 100644
index 0000000000..1f14f65410
--- /dev/null
+++ b/board/sipeed/maix-go/README.md
@@ -0,0 +1,4 @@
+# Sipeed MAIX-Go Board
+
+See the common documentation for
+[Canaan K210 SoC based boards](../../canaan/k210-common/README.md).
diff --git a/board/sipeed/maixduino/README.md b/board/sipeed/maixduino/README.md
new file mode 100644
index 0000000000..daf0f763c9
--- /dev/null
+++ b/board/sipeed/maixduino/README.md
@@ -0,0 +1,4 @@
+# Sipeed MAIXDUINO Board
+
+See the common documentation for
+[Canaan K210 SoC based boards](../../canaan/k210-common/README.md).
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
