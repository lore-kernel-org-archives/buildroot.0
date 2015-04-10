From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 10 Apr 2015 15:48:42 +0900
Subject: [Buildroot] No login prompt visible after "random: dd urandom
 read with 0 bits of entropy available"
In-Reply-To: <CAK7LNASG0FPWGCGMkwEL4DUAJuSjKGyBWumtZ4jrOBhbhQiwFw@mail.gmail.com>
References: <CAK7LNASG0FPWGCGMkwEL4DUAJuSjKGyBWumtZ4jrOBhbhQiwFw@mail.gmail.com>
Message-ID: <CAK7LNAT7NBxZX-T3Td1Er19j9wfhrNmk45LrovcT4WvyHLiHgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I retract this question.

The IRQ number of UART was wrong.
(I had added the IRQ number by offset 32 by mistake.
I thought UART was working correctly because I could see kernel log,
but it wasn't.)

With the fixed IRQ number, at last, I succeeded in booting the kernel.

I am very sorry for the noise.


Masahiro Yamada




2015-04-09 18:35 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Dear Thomas Petazzoni (and experts),
>
> I am trying to port Linux (4.0-rc7) to my new ARM SoC
> along with initramdisk created by Buildroot.
>
> I have been struggling to solve my problem for about two weeks.
> I do not know if my current problem comes from the Kernel,
> initramdisk, or other areas.
> I know I am bothering you, but could you give me some of your time?
>
> I found a Linux porting guideline written by you:
> http://free-electrons.com/pub/conferences/2013/elc/arm-soc-checklist/arm-soc-checklist.pdf
>
> Thanks for providing the amazing slides!
>
> As you suggested in the slide,
> I want to start with a minimal set of features with Timer, IRQ and Serial.
>
> I guess timer, irq, and UART are working on my board,
> but the kernel fails to boot. (Precisely, no login prompt is displayed.)
>
> My SoC is based on Cortex-A9 (uniprocessor implementation).
> A 16550-compatible UART is avaialable on my board
> and GIC, Global timer drivers are already in the Kernel,
> so I believe booting the kernel should not be too difficult.
>
>
> I wrote a very simple device tree like this:
>
> ---------------8<---------------------
> /dts-v1/;
> /include/ "skeleton.dtsi"
>
> / {
>         compatible = "socionext,ph1-ld4";
>
>         memory {
>                 device_type = "memory";
>                 reg = <0x80000000 0x20000000>;
>         };
>
>         chosen {
>                 bootargs = "console=ttyS0,115200";
>         };
>
>         aliases {
>                 serial0 = &uart0;
>         };
>
>         cpus {
>                 #size-cells = <0>;
>                 #address-cells = <1>;
>
>                 cpu at 0 {
>                         device_type = "cpu";
>                         compatible = "arm,cortex-a9";
>                         reg = <0>;
>                 };
>         };
>
>         clocks {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
>                 arm_timer_clk: arm_timer_clk {
>                         #clock-cells = <0>;
>                         compatible = "fixed-clock";
>                         clock-frequency = <50000000>;
>                 };
>         };
>
>         soc: soc {
>                 compatible = "simple-bus";
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>                 interrupt-parent = <&intc>;
>                 ranges;
>
>
>                 uart0: uart at 03fb0000 {
>                         compatible = "ns16550";
>                         reg = <0x03fb0000 0x100>;
>                         clock-frequency = <12288000>;
>                         interrupts = <0 81 4>;
>                         reg-shift = <1>;
>                         fifo-size = <16>;
>                 };
>
>                 intc: interrupt-controller at 60001000 {
>                         compatible = "arm,cortex-a9-gic";
>                         #interrupt-cells = <3>;
>                         #address-cells = <1>;
>                         interrupt-controller;
>                         reg = <0x60001000 0x1000>,
>                               <0x60000100 0x100>;
>                 };
>
>                 global_timer: timer at 60000200 {
>                         compatible = "arm,cortex-a9-global-timer";
>                         reg = <0x60000200 0x20>;
>                         interrupts = <1 11 0x104>;
>                         interrupt-parent = <&intc>;
>                         clocks = <&arm_timer_clk>;
>                 };
>
>         };
> };
> ---------------->8--------------------
>
>
>
> The kernel configuration is based on multi_v7_defconfig.
>
> The difference against it is just one line; I just added
> "CONFIG_ARCH_UNIPHIER=y" for my SoC.
>
>
> I built the initramdisk with Buildroot:
>
> The buildroot defconfig is like this:
> ---------------8<---------------------
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_GIT=y
> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="/home/yamada/workspace/zynq-pf/linux-unph"
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="uniphier-master"
> BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
> BR2_LINUX_KERNEL_ZIMAGE=y
> BR2_LINUX_KERNEL_DTS_SUPPORT=y
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="uniphier-ph1-ld4-ref"
> BR2_TARGET_ROOTFS_CPIO=y
> BR2_TARGET_ROOTFS_CPIO_GZIP=y
> BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
> BR2_TARGET_UBOOT=y
> BR2_TARGET_UBOOT_BOARDNAME="ph1_ld4"
> BR2_TARGET_UBOOT_CUSTOM_GIT=y
> BR2_TARGET_UBOOT_CUSTOM_REPO_URL="/home/yamada/workspace/zynq-pf/u-boot-unph"
> BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="uniphier-master"
> BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-dtb.img"
> BR2_TARGET_UBOOT_SPL=y
> ---------------->8--------------------
>
>
>
>
> I passed the kernel image, the device tree blob, and initramdisk from U-Boot.
>
>
> The kernel log is displayed like follows:
>
> ---------------8<---------------------
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 4.0.0-rc7 (yamada at beagle) (gcc version
> 4.8.4 (Buildroot 2015.05-git-00947-g419dfed-dirty) ) #1 SMP Thu Apr 9
> 17:51:38 JST 2015
> [    0.000000] CPU: ARMv7 Processor [413fc090] revision 0 (ARMv7), cr=10c5387d
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
> instruction cache
> [    0.000000] Machine model: socionext,ph1-ld4
> [    0.000000] cma: Reserved 64 MiB at 0x9c000000
> [    0.000000] Memory policy: Data cache writeback
> [    0.000000] CPU: All CPU(s) started in SVC mode.
> [    0.000000] PERCPU: Embedded 11 pages/cpu @dbbc9000 s12480 r8192
> d24384 u45056
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
> Total pages: 130048
> [    0.000000] Kernel command line: console=ttyS0,115200
> [    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)
> [    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
> [    0.000000] Memory: 439004K/524288K available (7922K kernel code,
> 960K rwdata, 3476K rodata, 812K init, 316K bss, 19748K reserved,
> 65536K cma-reserved, 0K highmem)
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> [    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
> [    0.000000]     vmalloc : 0xe0800000 - 0xff000000   ( 488 MB)
> [    0.000000]     lowmem  : 0xc0000000 - 0xe0000000   ( 512 MB)
> [    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
> [    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
> [    0.000000]       .text : 0xc0208000 - 0xc0d2ab58   (11403 kB)
> [    0.000000]       .init : 0xc0d2b000 - 0xc0df6000   ( 812 kB)
> [    0.000000]       .data : 0xc0df6000 - 0xc0ee60a0   ( 961 kB)
> [    0.000000]        .bss : 0xc0ee60a0 - 0xc0f35158   ( 317 kB)
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> [    0.000000] Hierarchical RCU implementation.
> [    0.000000]         Additional per-CPU info printed with stalls.
> [    0.000000]         RCU restricting CPUs from NR_CPUS=16 to nr_cpu_ids=1.
> [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
> [    0.000000] NR_IRQS:16 nr_irqs:16 16
> [    0.000000] GIC CPU mask not found - kernel will fail to boot.
> [    0.000000] GIC CPU mask not found - kernel will fail to boot.
> [    0.000023] sched_clock: 64 bits at 50MHz, resolution 20ns, wraps
> every 2748779069440ns
> [    0.000280] Console: colour dummy device 80x30
> [    0.000327] Calibrating delay loop... 1590.88 BogoMIPS (lpj=3977216)
> [    0.045071] pid_max: default: 32768 minimum: 301
> [    0.045288] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.045311] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.046442] CPU: Testing write buffer coherency: ok
> [    0.046890] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
> [    0.047021] Setting up static identity map for 0x80981fa0 - 0x80982038
> [    0.049167] Brought up 1 CPUs
> [    0.049194] SMP: Total of 1 processors activated (1590.88 BogoMIPS).
> [    0.049205] CPU: All CPU(s) started in SVC mode.
> [    0.050195] devtmpfs: initialized
> [    0.051031] VFP support v0.3: implementor 41 architecture 3 part 30
> variant 9 rev 4
> [    0.061607] pinctrl core: initialized pinctrl subsystem
> [    0.064291] NET: Registered protocol family 16
> [    0.067507] DMA: preallocated 256 KiB pool for atomic coherent allocations
> [    0.070073] cpuidle: using governor ladder
> [    0.070204] cpuidle: using governor menu
> [    0.071959] No ATAGs?
> [    0.072010] hw-breakpoint: found 5 (+1 reserved) breakpoint and 1
> watchpoint registers.
> [    0.072027] hw-breakpoint: maximum watchpoint size is 4 bytes.
> [    0.073727] Serial: AMBA PL011 UART driver
> [    0.089345] vgaarb: loaded
> [    0.090512] SCSI subsystem initialized
> [    0.091516] usbcore: registered new interface driver usbfs
> [    0.091635] usbcore: registered new interface driver hub
> [    0.091785] usbcore: registered new device driver usb
> [    0.092842] media: Linux media interface: v0.10
> [    0.092968] Linux video capture interface: v2.00
> [    0.093066] pps_core: LinuxPPS API ver. 1 registered
> [    0.093080] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
> Rodolfo Giometti <giometti@linux.it>
> [    0.093131] PTP clock support registered
> [    0.093412] EDAC MC: Ver: 3.0.0
> [    0.094927] Advanced Linux Sound Architecture Driver Initialized.
> [    0.096686] Switched to clocksource arm_global_timer
> [    0.119523] NET: Registered protocol family 2
> [    0.120529] TCP established hash table entries: 4096 (order: 2, 16384 bytes)
> [    0.120599] TCP bind hash table entries: 4096 (order: 3, 32768 bytes)
> [    0.120669] TCP: Hash tables configured (established 4096 bind 4096)
> [    0.120786] TCP: reno registered
> [    0.120816] UDP hash table entries: 256 (order: 1, 8192 bytes)
> [    0.120869] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
> [    0.121219] NET: Registered protocol family 1
> [    0.122072] RPC: Registered named UNIX socket transport module.
> [    0.122098] RPC: Registered udp transport module.
> [    0.122108] RPC: Registered tcp transport module.
> [    0.122115] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    0.122881] Unpacking initramfs...
> [    0.351517] Freeing initrd memory: 1532K (cfe81000 - d0000000)
> [    0.353637] futex hash table entries: 256 (order: 2, 16384 bytes)
> [    0.366277] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [    0.367890] NFS: Registering the id_resolver key type
> [    0.367966] Key type id_resolver registered
> [    0.367983] Key type id_legacy registered
> [    0.368126] ntfs: driver 2.1.31 [Flags: R/O].
> [    0.370870] Block layer SCSI generic (bsg) driver version 0.4
> loaded (major 248)
> [    0.370921] io scheduler noop registered
> [    0.370947] io scheduler deadline registered
> [    0.371240] io scheduler cfq registered (default)
> [    0.516978] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> [    0.519995] SuperH (H)SCI(F) driver initialized
> [    0.520748] msm_serial: driver initialized
> [    0.521879] console [ttyS0] disabled
> [    0.521981] 3fb0000.uart: ttyS0 at MMIO 0x3fb0000 (irq = 17,
> base_baud = 768000) is a 16550
> [    1.101140] console [ttyS0] enabled
> [    1.105730] STMicroelectronics ASC driver initialized
> [    1.112872] [drm] Initialized drm 1.1.0 20060810
> [    1.128321] loop: module loaded
> [    1.139187] CAN device driver interface
> [    1.144370] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.2.15-k
> [    1.151859] igb: Copyright (c) 2007-2014 Intel Corporation.
> [    1.159656] pegasus: v0.9.3 (2013/04/25), Pegasus/Pegasus II USB
> Ethernet driver
> [    1.167641] usbcore: registered new interface driver pegasus
> [    1.173788] usbcore: registered new interface driver asix
> [    1.179652] usbcore: registered new interface driver ax88179_178a
> [    1.186256] usbcore: registered new interface driver cdc_ether
> [    1.192622] usbcore: registered new interface driver smsc75xx
> [    1.198870] usbcore: registered new interface driver smsc95xx
> [    1.205087] usbcore: registered new interface driver net1080
> [    1.211213] usbcore: registered new interface driver cdc_subset
> [    1.217607] usbcore: registered new interface driver zaurus
> [    1.223697] usbcore: registered new interface driver cdc_ncm
> [    1.231029] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    1.237999] ehci-pci: EHCI PCI platform driver
> [    1.242891] ehci-platform: EHCI generic platform driver
> [    1.248680] ehci-omap: OMAP-EHCI Host Controller driver
> [    1.254441] ehci-orion: EHCI orion driver
> [    1.258920] SPEAr-ehci: EHCI SPEAr driver
> [    1.263405] ehci-st: EHCI STMicroelectronics driver
> [    1.268794] ehci-exynos: EHCI EXYNOS driver
> [    1.273490] tegra-ehci: Tegra EHCI driver
> [    1.277988] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> [    1.284605] ohci-pci: OHCI PCI platform driver
> [    1.289485] ohci-platform: OHCI generic platform driver
> [    1.295255] ohci-omap3: OHCI OMAP3 driver
> [    1.299737] SPEAr-ohci: OHCI SPEAr driver
> [    1.304218] ohci-st: OHCI STMicroelectronics driver
> [    1.309734] usbcore: registered new interface driver usb-storage
> [    1.318730] mousedev: PS/2 mouse device common for all mice
> [    1.329613] i2c /dev entries driver
> [    1.335565] usbcore: registered new interface driver uvcvideo
> [    1.341722] USB Video Class driver (1.1.1)
> [    1.346053] gspca_main: v2.14.0 registered
> [    1.355689] Driver 'mmcblk' needs updating - please use bus_type methods
> [    1.362992] sdhci: Secure Digital Host Controller Interface driver
> [    1.369561] sdhci: Copyright(c) Pierre Ossman
> [    1.375384] Synopsys Designware Multimedia Card Interface Driver
> [    1.383061] sdhci-pltfm: SDHCI platform and OF driver helper
> [    1.390737] ledtrig-cpu: registered to indicate activity on CPUs
> [    1.397595] usbcore: registered new interface driver usbhid
> [    1.403534] usbhid: USB HID core driver
> [    1.412862] usbcore: registered new interface driver snd-usb-audio
> [    1.423771] TCP: cubic registered
> [    1.427393] NET: Registered protocol family 17
> [    1.432163] can: controller area network core (rev 20120528 abi 9)
> [    1.438842] NET: Registered protocol family 29
> [    1.443606] can: raw protocol (rev 20120528)
> [    1.448166] can: broadcast manager protocol (rev 20120528 t)
> [    1.454192] can: netlink gateway (rev 20130117) max_hops=1
> [    1.460709] Key type dns_resolver registered
> [    1.465434] ThumbEE CPU extension supported.
> [    1.470026] Registering SWP/SWPB emulation handler
> [    1.479705] drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
> [    1.487177] ALSA device list:
> [    1.490312]   No soundcards found.
> [    1.496444] Freeing unused kernel memory: 812K (c0d2b000 - c0df6000)
> [    1.684454] random: dd urandom read with 0 bits of entropy available
> ---------------->8--------------------------------------
>
>
> I think the kernel is still running.
> (I confirmed it by putting printk("foo\n") into the cpu_idle_loop() function.
> The message "foo" waw displayed on the console periodically.)
>
>
> I suspect my situation is different from what is written in
> "Frequently Asked Questions & Troubleshooting",
> because I cannot see such messages from /etc/inittab as
>    Initializing random number generator... done.
>    Starting network...
>
>
>
> My new SoC file is almost empty:
>
> ---------------8<---------------------
> #include <asm/mach/arch.h>
>
> static const char * const uniphier_board_dt_compat[] = {
>         "socionext,ph1-ld4",
>         "socionext,ph1-pro4",
>         NULL,
> };
>
> DT_MACHINE_START(UNIPHIER, "Socionext UniPhier")
>         .dt_compat      = uniphier_board_dt_compat,
> MACHINE_END
> ---------------->8--------------------------------------
>
>
>
> What is the cause of this problem?
> What should I do to figure out it?
> Any hint is really appreciated.
>
>
> Best Regards
> Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
