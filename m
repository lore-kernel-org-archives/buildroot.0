From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Tue, 8 Jun 2021 17:39:47 +0200
Subject: [Buildroot] BL2: Failed to load image (-80)
Message-ID: <CAOiXNkDSm5hf=WH5ECrVN_DkYk4KCwG46_0L6iWbpbXAW4wRig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Folks,

I am currently trying to add support for L-876e.A1 STM32MP1 board from Phytec.

https://www.phytec.de/en/produkte/single-board-computer/phyboard-sargas-stm32mp1/
https://www.phytec.de/cdocuments/?doc=d4PmEQ

My approach is to transfer parts (patches&Co.) from the provided Yocto
BSP and package them as required by Buildroot.

I reach the point where the boot process completes successfully and I
can log in to the shell. However, it works only once after flashing
the SD card. All the subsequent boots yield the error:
BL2: Failed to load image (-80)
and the boot process stopped there.

Below is the console output of the successful very first boot followed
by reboot command with subsequent error output from the bootloader.
Now I am stuck and would appreciate if some experienced Buildrooters
can provide hints as to what might be wrong.

What looks suspect for me in the logs are two things:

1. The message "Saving Environment to MMC... Writing to redundant MMC(0)... OK"
I am wondering where exactly this information is saved and whether it
can corrupt one of the partitions with bootlader which in turns can
cause the boot process to stop?

2. Following kernel messages:
[    3.562201] GPT:Primary header thinks Alt. header is not at the end
of the disk.
[    3.568237] GPT:527019 != 62333951
[    3.571559] GPT:Alternate GPT header not at the end of the disk.
[    3.577611] GPT:527019 != 62333951
[    3.580982] GPT: Use GNU Parted to correct GPT error
I do not know what might be the reason for this since the partitioning
of the SD card is done exactly the same way as by stm32mp157c-dk2
board.

But maybe there are other possible reasons. I would be thankful for
any hints on how I can find the reasons for this one-time-only boot
problem. Of course, when it works I will contribute it back to
Buildroot.

Regards,
Andrey.

NOTICE:  CPU: STM32MP157CAC Rev.B
NOTICE:  Model: PHYTEC phyCORE-STM32MP1-3 SOM
INFO:    Reset reason (0x15):
INFO:      Power-on Reset (rst_por)
INFO:    PMIC version = 0x21
INFO:    Using SDMMC
INFO:      Instance 1
INFO:    Boot used partition fsbl1
NOTICE:  BL2: v2.2-r2.1(debug):
NOTICE:  BL2: Built : 16:30:25, Jun  2 2021
INFO:    Using crypto library 'stm32_crypto_lib'
INFO:    BL2: Doing platform setup
INFO:    RAM: DDR3-1066/888 bin G 2x4Gb 533MHz v1.45
INFO:    Memory size = 0x40000000 (1024 MB)
INFO:    BL2 runs SP_MIN setup
INFO:    BL2: Loading image id 4
INFO:    Loading image id=4 at address 0x2ffeb000
INFO:    Image id=4 loaded: 0x2ffeb000 - 0x2ffff000
INFO:    BL2: Loading image id 5
INFO:    Loading image id=5 at address 0xc0100000
INFO:    STM32 Image size : 895882
INFO:    Image id=5 loaded: 0xc0100000 - 0xc01dab8a
WARNING: Skip signature check (header option)
NOTICE:  ROTPK is not deployed on platform. Skipping ROTPK verification.
NOTICE:  BL2: Booting BL32
INFO:    Entry point address = 0x2ffeb000
INFO:    SPSR = 0x1d3
NOTICE:  SP_MIN: v2.2-r2.1(debug):
NOTICE:  SP_MIN: Built : 16:30:25, Jun  2 2021
INFO:    ARM GICv2 driver initialized
INFO:    Set calibration timer to 60 sec
INFO:    stm32mp IWDG1 (12): Secure
INFO:    SP_MIN: Initializing runtime services
INFO:    SP_MIN: Preparing exit to normal world


U-Boot 2020.01-stm32mp-r2.1 (Jun 02 2021 - 16:30:51 +0200)

CPU: STM32MP157CAC Rev.B
Model: Phytec GmbH phycore-stm32mp1-3 Dev Board
Board: stm32mp1 in trusted mode (phycore-stm32mp1-3)
DRAM:  1 GiB
Clocks:
- MPU : 650 MHz
- MCU : 208.878 MHz
- AXI : 266.500 MHz
- PER : 24 MHz
- DDR : 533 MHz
WDT:   Started with servicing (32s timeout)
NAND:  0 MiB
MMC:   STM32 SD/MMC: 0, STM32 SD/MMC: 1
Loading Environment from MMC... *** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   eth0: ethernet at 5800a000
Hit any key to stop autoboot:  1 0
Boot over mmc0!
Saving Environment to MMC... Writing to redundant MMC(0)... OK
switch to partitions #0, OK
mmc0 is current device
Scanning mmc 0:4...
Found /boot/extlinux/extlinux.conf
Retrieving file: /boot/extlinux/extlinux.conf
262 bytes read in 26 ms (9.8 KiB/s)
1:    phyboard-sargas-l-877e
Retrieving file: /boot/uImage
7424424 bytes read in 1747 ms (4.1 MiB/s)
append: root=/dev/mmcblk0p4 rootwait rw console=ttySTM0,115200
Retrieving file: /boot/phycore-stm32mp1-3.dtb
63698 bytes read in 41 ms (1.5 MiB/s)
## Booting kernel from Legacy Image at c2000000 ...
   Image Name:   Linux-5.4.56
   Created:      2021-06-07  10:27:15 UTC
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    7424360 Bytes = 7.1 MiB
   Load Address: c2000040
   Entry Point:  c2000040
   Verifying Checksum ... OK
## Flattened Device Tree blob at c4000000
   Booting using the fdt blob at 0xc4000000
   XIP Kernel Image
   Loading Device Tree to cffed000, end cffff8d1 ... OK

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.4.56 (e320nec001 at ubuntu) (gcc version
10.2.1 20201103 (GNU Toolchain for the A-profile Architecture
10.2-2020.11 (arm-10.16))) #1 SMP PREEMPT Mon Jun 7 12:19:08 CEST 2021
[    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=10c5387d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
instruction cache
[    0.000000] OF: fdt: Machine model: Phytec GmbH phycore-stm32mp1-3 Dev Board
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] Reserved memory: created DMA memory pool at 0x10000000,
size 0 MiB
[    0.000000] OF: reserved mem: initialized node mcuram2 at 0x10000000,
compatible id shared-dma-pool
[    0.000000] Reserved memory: created DMA memory pool at 0x10040000,
size 0 MiB
[    0.000000] OF: reserved mem: initialized node
vdev0vring0 at 10040000, compatible id shared-dma-pool
[    0.000000] Reserved memory: created DMA memory pool at 0x10042000,
size 0 MiB
[    0.000000] OF: reserved mem: initialized node
vdev0vring1 at 10042000, compatible id shared-dma-pool
[    0.000000] Reserved memory: created DMA memory pool at 0x10044000,
size 0 MiB
[    0.000000] OF: reserved mem: initialized node
vdev0buffer at 10044000, compatible id shared-dma-pool
[    0.000000] Reserved memory: created DMA memory pool at 0x30000000,
size 0 MiB
[    0.000000] OF: reserved mem: initialized node mcuram at 0x30000000,
compatible id shared-dma-pool
[    0.000000] Reserved memory: created DMA memory pool at 0x38000000,
size 0 MiB
[    0.000000] OF: reserved mem: initialized node retram at 0x38000000,
compatible id shared-dma-pool
[    0.000000] cma: Reserved 128 MiB at 0xf0000000
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] percpu: Embedded 20 pages/cpu s51020 r8192 d22708 u81920
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 227648
[    0.000000] Kernel command line: root=/dev/mmcblk0p4 rootwait rw
console=ttySTM0,115200
[    0.000000] Dentry cache hash table entries: 131072 (order: 7,
524288 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144
bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 759668K/917504K available (11264K kernel code,
873K rwdata, 3444K rodata, 1024K init, 220K bss, 26764K reserved,
131072K cma-reserved, 0K highmem)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000]     Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
is 10 jiffies.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] random: get_random_bytes called from
start_kernel+0x2ac/0x480 with crng_init=0
[    0.000000] arch_timer: cp15 timer(s) running at 24.00MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
[    0.000009] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps
every 4398046511097ns
[    0.000026] Switching to timer-based delay loop, resolution 41ns
[    0.001397] Console: colour dummy device 80x30
[    0.001449] Calibrating delay loop (skipped), value calculated
using timer frequency.. 48.00 BogoMIPS (lpj=240000)
[    0.001469] pid_max: default: 32768 minimum: 301
[    0.001744] Mount-cache hash table entries: 2048 (order: 1, 8192
bytes, linear)
[    0.001770] Mountpoint-cache hash table entries: 2048 (order: 1,
8192 bytes, linear)
[    0.003095] CPU: Testing write buffer coherency: ok
[    0.003626] /cpus/cpu at 0 missing clock-frequency property
[    0.003659] /cpus/cpu at 1 missing clock-frequency property
[    0.003677] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.059947] Setting up static identity map for 0xc0100000 - 0xc0100060
[    0.079920] rcu: Hierarchical SRCU implementation.
[    0.104361] smp: Bringing up secondary CPUs ...
[    0.180556] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.180779] smp: Brought up 1 node, 2 CPUs
[    0.180804] SMP: Total of 2 processors activated (96.00 BogoMIPS).
[    0.180814] CPU: All CPU(s) started in SVC mode.
[    0.181722] devtmpfs: initialized
[    0.204852] VFP support v0.3: implementor 41 architecture 2 part 30
variant 7 rev 5
[    0.205461] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.205497] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.211860] pinctrl core: initialized pinctrl subsystem
[    0.214047] NET: Registered protocol family 16
[    0.216706] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.219016] cpuidle: using governor menu
[    0.219402] hw-breakpoint: found 5 (+1 reserved) breakpoint and 4
watchpoint registers.
[    0.219419] hw-breakpoint: maximum watchpoint size is 8 bytes.
[    0.219879] Serial: AMBA PL011 UART driver
[    0.222863] stm32-pm-domain pm_domain: domain core-ret-power-domain
registered
[    0.222901] stm32-pm-domain pm_domain: subdomain core-power-domain registered
[    0.222919] stm32-pm-domain pm_domain: domains probed
[    0.272228] SCSI subsystem initialized
[    0.273072] usbcore: registered new interface driver usbfs
[    0.273154] usbcore: registered new interface driver hub
[    0.273297] usbcore: registered new device driver usb
[    0.273702] pps_core: LinuxPPS API ver. 1 registered
[    0.273717] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giometti <giometti@linux.it>
[    0.273749] PTP clock support registered
[    0.274090] EDAC MC: Ver: 3.0.0
[    0.275365] Advanced Linux Sound Architecture Driver Initialized.
[    0.277048] clocksource: Switched to clocksource arch_sys_counter
[    1.116487] thermal_sys: Registered thermal governor 'step_wise'
[    1.117217] NET: Registered protocol family 2
[    1.118298] tcp_listen_portaddr_hash hash table entries: 512
(order: 0, 6144 bytes, linear)
[    1.118351] TCP established hash table entries: 8192 (order: 3,
32768 bytes, linear)
[    1.118462] TCP bind hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    1.118640] TCP: Hash tables configured (established 8192 bind 8192)
[    1.118823] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    1.118892] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, linear)
[    1.119404] NET: Registered protocol family 1
[    1.120387] RPC: Registered named UNIX socket transport module.
[    1.120407] RPC: Registered udp transport module.
[    1.120419] RPC: Registered tcp transport module.
[    1.120429] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.121431] hw perfevents: enabled with armv7_cortex_a7 PMU driver,
5 counters available
[    1.123517] Initialise system trusted keyrings
[    1.123898] workingset: timestamp_bits=14 max_order=18 bucket_order=4
[    1.136662] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    1.148079] NFS: Registering the id_resolver key type
[    1.148136] Key type id_resolver registered
[    1.148148] Key type id_legacy registered
[    1.148377] ntfs: driver 2.1.32 [Flags: R/O].
[    1.148870] jffs2: version 2.2. (NAND) ? 2001-2006 Red Hat, Inc.
[    1.149686] fuse: init (API version 7.31)
[    1.150792] NET: Registered protocol family 38
[    1.150813] Key type asymmetric registered
[    1.150825] Asymmetric key parser 'x509' registered
[    1.150912] bounce: pool size: 64 pages
[    1.150974] Block layer SCSI generic (bsg) driver version 0.4
loaded (major 247)
[    1.150988] io scheduler mq-deadline registered
[    1.151000] io scheduler kyber registered
[    1.162094] STM32 USART driver initialized
[    1.167157] panel-simple panel: panel supply power not found, using
dummy regulator
[    1.183856] brd: module loaded
[    1.198669] loop: module loaded
[    1.204824] libphy: Fixed MDIO Bus: probed
[    1.206766] CAN device driver interface
[    1.209308] pegasus: v0.9.3 (2013/04/25), Pegasus/Pegasus II USB
Ethernet driver
[    1.209401] usbcore: registered new interface driver pegasus
[    1.209482] usbcore: registered new interface driver asix
[    1.209541] usbcore: registered new interface driver ax88179_178a
[    1.209601] usbcore: registered new interface driver cdc_ether
[    1.209694] usbcore: registered new interface driver smsc75xx
[    1.209772] usbcore: registered new interface driver smsc95xx
[    1.209831] usbcore: registered new interface driver net1080
[    1.209889] usbcore: registered new interface driver cdc_subset
[    1.209945] usbcore: registered new interface driver zaurus
[    1.210034] usbcore: registered new interface driver cdc_ncm
[    1.211476] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.211531] ehci-platform: EHCI generic platform driver
[    1.211997] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.212036] ohci-platform: OHCI generic platform driver
[    1.212938] usbcore: registered new interface driver cdc_acm
[    1.212953] cdc_acm: USB Abstract Control Model driver for USB
modems and ISDN adapters
[    1.213060] usbcore: registered new interface driver usb-storage
[    1.218044] i2c /dev entries driver
[    1.222568] stm32-cpufreq stm32-cpufreq: Failed to get chip info: -517
[    1.225854] sdhci: Secure Digital Host Controller Interface driver
[    1.225869] sdhci: Copyright(c) Pierre Ossman
[    1.225879] Synopsys Designware Multimedia Card Interface Driver
[    1.226406] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.227663] ledtrig-cpu: registered to indicate activity on CPUs
[    1.229923] usbcore: registered new interface driver usbhid
[    1.229942] usbhid: USB HID core driver
[    1.230290] arm-smc-mbox mailbox-0: ARM SMC mailbox enabled.
[    1.230425] arm-smc-mbox mailbox-1: ARM SMC mailbox enabled.
[    1.232109] remoteproc remoteproc0: releasing m4
[    1.235263] Unable to get STM32 DDR PMU clock
[    1.240453] drop_monitor: Initializing network drop monitor service
[    1.240810] NET: Registered protocol family 17
[    1.240846] can: controller area network core (rev 20170425 abi 9)
[    1.240977] NET: Registered protocol family 29
[    1.240994] can: raw protocol (rev 20170425)
[    1.241007] can: broadcast manager protocol (rev 20170425 t)
[    1.241026] can: netlink gateway (rev 20190810) max_hops=1
[    1.241871] Key type dns_resolver registered
[    1.241978] ThumbEE CPU extension supported.
[    1.242007] Registering SWP/SWPB emulation handler
[    1.242456] registered taskstats version 1
[    1.242473] Loading compiled-in X.509 certificates
[    1.258866] panel-simple panel: panel supply power not found, using
dummy regulator
[    1.269884] arm-scmi firmware:scmi-0: SCMI Protocol v2.0 'ST:'
Firmware version 0x0
[    1.283774] remoteproc remoteproc0: releasing m4
[    1.284759] Unable to get STM32 DDR PMU clock
[    1.299862] panel-simple panel: panel supply power not found, using
dummy regulator
[    1.315527] stm32-cryp 54001000.cryp: will run requests pump with
realtime priority
[    1.317393] stm32-cryp 54001000.cryp: Initialized
[    1.329763] remoteproc remoteproc0: releasing m4
[    1.330733] Unable to get STM32 DDR PMU clock
[    1.369654] stm32-mdma 58000000.dma: STM32 MDMA driver registered
[    1.374435] stm32-dma 48000000.dma: STM32 DMA driver registered
[    1.376645] stm32-dma 48001000.dma: STM32 DMA driver registered
[    1.382288] panel-simple panel: panel supply power not found, using
dummy regulator
[    1.393322] stm_thermal 50028000.thermal: stm_thermal_probe: Driver
initialized successfully
[    1.403334] random: fast init done
[    1.407824] random: crng init done
[    1.409816] remoteproc remoteproc0: releasing m4
[    1.411086] stm32-ddr-pmu: probed (ID=0x00140061 VER=0x00000010), DDR at 533MHz
[    1.413524] /soc/interrupt-controller at 5000d000: bank0
[    1.413545] /soc/interrupt-controller at 5000d000: bank1
[    1.413557] /soc/interrupt-controller at 5000d000: bank2
[    1.415155] stm32mp157-pinctrl soc:pin-controller at 50002000: GPIOA bank added
[    1.415578] stm32mp157-pinctrl soc:pin-controller at 50002000: GPIOB bank added
[    1.415964] stm32mp157-pinctrl soc:pin-controller at 50002000: GPIOC bank added
[    1.416315] stm32mp157-pinctrl soc:pin-controller at 50002000: GPIOD bank added
[    1.416675] stm32mp157-pinctrl soc:pin-controller at 50002000: GPIOE bank added
[    1.417144] stm32mp157-pinctrl soc:pin-controller at 50002000: GPIOF bank added
[    1.417539] stm32mp157-pinctrl soc:pin-controller at 50002000: GPIOG bank added
[    1.417920] stm32mp157-pinctrl soc:pin-controller at 50002000: GPIOH bank added
[    1.418407] stm32mp157-pinctrl soc:pin-controller at 50002000: GPIOI bank added
[    1.418507] stm32mp157-pinctrl soc:pin-controller at 50002000: Pinctrl
STM32 initialized
[    1.419392] stm32mp157-pinctrl soc:pin-controller-z at 54004000: GPIOZ
bank added
[    1.419424] stm32mp157-pinctrl soc:pin-controller-z at 54004000:
Pinctrl STM32 initialized
[    1.423242] 4000f000.serial: ttySTM1 at MMIO 0x4000f000 (irq = 55,
base_baud = 4000000) is a stm32-usart
[    1.425108] stm32-usart 40010000.serial: interrupt mode for rx (no dma)
[    1.425132] stm32-usart 40010000.serial: interrupt mode for tx (no dma)
[    1.425166] 40010000.serial: ttySTM0 at MMIO 0x40010000 (irq = 56,
base_baud = 4000000) is a stm32-usart
[    2.631429] printk: console [ttySTM0] enabled
[    2.637720] stm32-usart 5c000000.serial: interrupt mode for rx (no dma)
[    2.642893] stm32-usart 5c000000.serial: interrupt mode for tx (no dma)
[    2.649603] 5c000000.serial: ttySTM2 at MMIO 0x5c000000 (irq = 57,
base_baud = 4000000) is a stm32-usart
[    2.663396] panel-simple panel: panel supply power not found, using
dummy regulator
[    2.674287] spi-nor spi0.0: found w25q128jv, expected w25q128
[    2.696939] spi-nor spi0.0: w25q128jv (16384 Kbytes)
[    2.704898] m_can_platform 4400f000.can: m_can device registered
(irq=51, version=32)
[    2.713143] stm32-dwmac 5800a000.ethernet: IRQ eth_lpi not found
[    2.717968] stm32-dwmac 5800a000.ethernet: PTP uses main clock
[    2.723553] stm32-dwmac 5800a000.ethernet: no reset control found
[    2.730320] stm32-dwmac 5800a000.ethernet: User ID: 0x40, Synopsys ID: 0x42
[    2.736635] stm32-dwmac 5800a000.ethernet:     DWMAC4/5
[    2.741685] stm32-dwmac 5800a000.ethernet: DMA HW capability
register supported
[    2.748970] stm32-dwmac 5800a000.ethernet: RX Checksum Offload
Engine supported
[    2.756251] stm32-dwmac 5800a000.ethernet: TX Checksum insertion supported
[    2.763164] stm32-dwmac 5800a000.ethernet: Wake-Up On Lan supported
[    2.769493] stm32-dwmac 5800a000.ethernet: TSO supported
[    2.774739] stm32-dwmac 5800a000.ethernet: Enable RX Mitigation via
HW Watchdog Timer
[    2.782636] stm32-dwmac 5800a000.ethernet: TSO feature enabled
[    2.788756] libphy: stmmac: probed
[    2.799287] stm32_rtc 5c004000.rtc: registered as rtc1
[    2.803408] stm32_rtc 5c004000.rtc: Date/Time must be initialized
[    2.809133] stm32_rtc 5c004000.rtc: registered rev:1.2
[    2.834061] stm32f7-i2c 40012000.i2c: doesn't use DMA
[    2.839235] leds-pca953x 0-0062: setting platform data
[    3.174298] input: EP0700M12 as
/devices/platform/soc/40012000.i2c/i2c-0/0-0038/input/input0
[    3.182251] stm32f7-i2c 40012000.i2c: STM32F7 I2C-0 bus adapter
[    3.207110] stm32f7-i2c 5c002000.i2c: doesn't use DMA
[    3.212736] stpmic1 1-0033: PMIC Chip Version: 0x21
[    3.219416] genirq: irq_chip stm32-exti-h did not update eff.
affinity mask of irq 67
[    3.226990] BUCK1: supplied by vin
[    3.233378] BUCK2: supplied by vin
[    3.238868] BUCK3: supplied by vin
[    3.244685] BUCK4: supplied by vin
[    3.250215] LDO1: supplied by v3v3
[    3.257875] LDO2: supplied by v3v3
[    3.263814] LDO3: supplied by vdd_ddr
[    3.269998] LDO4: supplied by vin
[    3.273025] LDO5: supplied by v3v3
[    3.279309] LDO6: supplied by v3v3
[    3.285218] VREF_DDR: supplied by vin
[    3.290669] BOOST: supplied by vin
[    3.293790] VBUS_OTG: supplied by bst_out
[    3.297959] SW_OUT: supplied by bst_out
[    3.305290] input: pmic_onkey as
/devices/platform/soc/5c002000.i2c/i2c-1/1-0033/5c002000.i2c:stpmic at 33:onkey/input/input1
[    3.316858] at24 1-0050: 4096 byte 24c32 EEPROM, writable, 1 bytes/write
[    3.323223] rtc-rv3028 1-0052: Voltage low, data loss detected.
[    3.330014] rtc-rv3028 1-0052: Voltage low, data is invalid.
[    3.334581] rtc-rv3028 1-0052: registered as rtc0
[    3.339409] stm32f7-i2c 5c002000.i2c: STM32F7 I2C-1 bus adapter
[    3.345860] mmci-pl18x 58005000.sdmmc: Got CD GPIO
[    3.350329] mmci-pl18x 58005000.sdmmc: mmc0: PL180 manf 53 rev2 at
0x58005000 irq 45,0 (pio)
[    3.387155] mmci-pl18x 58007000.sdmmc: mmc1: PL180 manf 53 rev2 at
0x58007000 irq 46,0 (pio)
[    3.422496] stm32-ipcc 4c001000.mailbox: ipcc rev:1.0 enabled, 6
chans, proc 0
[    3.431144] stm32-rproc mlahb:m4 at 10000000: wdg irq registered
[    3.437612] remoteproc remoteproc0: m4 is available
[    3.445131] mmc0: host does not support reading read-only switch,
assuming write-enable
[    3.456917] reg11: supplied by vdd
[    3.463315] mmc0: new high speed SDHC card at address e624
[    3.468010] reg18: supplied by vdd
[    3.471901] stm32-usbphyc 5a006000.usbphyc: registered rev:1.0
[    3.477709] mmcblk0: mmc0:e624 SU32G 29.7 GiB
[    3.487376] panel-simple panel: panel supply power not found, using
dummy regulator
[    3.494598] dwc2 49000000.usb-otg: 49000000.usb-otg supply vusb_d
not found, using dummy regulator
[    3.502834] dwc2 49000000.usb-otg: 49000000.usb-otg supply vusb_a
not found, using dummy regulator
[    3.520398] mmc1: new DDR MMC card at address 0001
[    3.525255] mmcblk1: mmc1:0001 Q2J55L 7.09 GiB
[    3.529192] mmcblk1boot0: mmc1:0001 Q2J55L partition 1 16.0 MiB
[    3.535091] mmcblk1boot1: mmc1:0001 Q2J55L partition 2 16.0 MiB
[    3.540989] mmcblk1rpmb: mmc1:0001 Q2J55L partition 3 4.00 MiB,
chardev (243:0)
[    3.562201] GPT:Primary header thinks Alt. header is not at the end
of the disk.
[    3.568237] GPT:527019 != 62333951
[    3.571559] GPT:Alternate GPT header not at the end of the disk.
[    3.577611] GPT:527019 != 62333951
[    3.580982] GPT: Use GNU Parted to correct GPT errors.
[    3.586214]  mmcblk0: p1 p2 p3 p4
[    3.647171] usb33: supplied by vdd_usb
[    3.649737] dwc2 49000000.usb-otg: EPs: 9, dedicated fifos, 952
entries in SPRAM
[    3.657684] dwc2 49000000.usb-otg: DWC OTG Controller
[    3.661973] dwc2 49000000.usb-otg: new USB bus registered, assigned
bus number 1
[    3.669492] dwc2 49000000.usb-otg: irq 82, io mem 0x49000000
[    3.682167] hub 1-0:1.0: USB hub found
[    3.684524] hub 1-0:1.0: 1 port detected
[    3.698150] ehci-platform 5800d000.usbh-ehci: EHCI Host Controller
[    3.702934] ehci-platform 5800d000.usbh-ehci: new USB bus
registered, assigned bus number 2
[    3.711716] ehci-platform 5800d000.usbh-ehci: irq 60, io mem 0x5800d000
[    3.747120] ehci-platform 5800d000.usbh-ehci: USB 2.0 started, EHCI 1.00
[    3.753683] hub 2-0:1.0: USB hub found
[    3.756186] hub 2-0:1.0: 2 ports detected
[    3.761684] ohci-platform 5800c000.usbh-ohci: Generic Platform OHCI
controller
[    3.767578] ohci-platform 5800c000.usbh-ohci: new USB bus
registered, assigned bus number 3
[    3.776143] ohci-platform 5800c000.usbh-ohci: irq 48, io mem 0x5800c000
[    3.852387] hub 3-0:1.0: USB hub found
[    3.854742] hub 3-0:1.0: 2 ports detected
[    3.865196] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    3.870433] [drm] Driver supports precise vblank timestamp query.
[    3.878286] [drm] Initialized stm 1.0.0 20170330 for
5a001000.display-controller on minor 0
[    3.889667] input: gpio-keys as /devices/platform/gpio-keys/input/input2
[    3.895976] rtc-rv3028 1-0052: Voltage low, data is invalid.
[    3.900804] rtc-rv3028 1-0052: hctosys: unable to read the hardware clock
[    3.908456] ALSA device list:
[    3.910370]   No soundcards found.
[    3.934546] EXT4-fs (mmcblk0p4): mounted filesystem with ordered
data mode. Opts: (null)
[    3.941358] VFS: Mounted root (ext4 filesystem) on device 179:4.
[    3.948536] devtmpfs: mounted
[    3.952310] Freeing unused kernel memory: 1024K
[    3.987465] Run /sbin/init as init process
[    4.529377] EXT4-fs (mmcblk0p4): re-mounted. Opts: (null)
Starting syslogd: OK
Starting klogd: OK
Running sysctl: OK
Saving random seed: OK
Starting rpcbind: [    5.103237] NET: Registered protocol family 10
[    5.207746] Segment Routing with IPv6
OK
Starting network: ifup: ignoring unknown interface eth0
FAIL
Starting dropbear sshd: OK
Starting NFS statd: OK
Starting NFS services: point 1
point 2
point 3
OK
Starting NFS daemon: rpc.nfsd: Unable to access /proc/fs/nfsd errno 2
(No such file or directory).
Please try, as root, 'mount -t nfsd nfsd /proc/fs/nfsd' and then
restart rpc.nfsd to correct the problem
FAIL
Starting NFS mountd: OK


Welcome to BYK device

buildroot login: root
Password:
#
#
#
#
# reboot
# Shutting down NFS mountd: OK
Shutting down NFS daemon: FAIL
Shutting down NFS services: point 1
point 2
point 3
OK
Stopping NFS statd: OK
Stopping dropbear sshd: OK
Stopping network: ifdown: interface eth0 not configured
OK
Stopping rpcbind daemon: OK
Saving random seed: OK
Stopping klogd: OK
Stopping syslogd: OK
umount: tmpfs busy - remounted read-only
umount: devtmpfs busy - remounted read-only
[   23.820381] EXT4-fs (mmcblk0p4): re-mounted. Opts: (null)

The system is going down NOW!

Sent SIGTERM to all processes

Sent SIGKILL to a[   25.905252] reboot: Restarting system
INFO:    PSCI Power Domain Map:
INFO:      Domain Node : Level 1, parent_node -1, State ON (0x0)
INFO:      Domain Node : Level 0, parent_node 0, State ON (0x0)
INFO:      CPU Node : MPID 0x0, parent_node 0, State ON (0x0)
INFO:      CPU Node : MPID 0x1, parent_node 0, State ON (0x0)

NOTICE:  CPU: STM32MP157CAC Rev.B
NOTICE:  Model: PHYTEC phyCORE-STM32MP1-3 SOM
INFO:    Reset reason (0x54):
INFO:      System reset generated by MPU (MPSYSRST)
INFO:    PMIC version = 0x21
INFO:    Using SDMMC
INFO:      Instance 1
INFO:    Boot used partition fsbl1
NOTICE:  BL2: v2.2-r2.1(debug):
NOTICE:  BL2: Built : 16:30:25, Jun  2 2021
INFO:    Using crypto library 'stm32_crypto_lib'
INFO:    BL2: Doing platform setup
INFO:    RAM: DDR3-1066/888 bin G 2x4Gb 533MHz v1.45
INFO:    Memory size = 0x40000000 (1024 MB)
INFO:    BL2 runs SP_MIN setup
INFO:    BL2: Loading image id 4
INFO:    Loading image id=4 at address 0x2ffeb000
INFO:    Image id=4 loaded: 0x2ffeb000 - 0x2ffff000
INFO:    BL2: Loading image id 5
INFO:    Loading image id=5 at address 0xc0100000
INFO:    STM32 Image size : 895882
INFO:    Image id=5 loaded: 0xc0100000 - 0xc01dab8a
ERROR:   Checksum: 0x4d6ef54 (awaited: 0x4d2d448)
ERROR:   BL2: Failed to load image (-80)
