From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Apr 2021 09:46:31 +0200
Subject: [Buildroot] [PATCH 0/4] Support for the Beagle-V platform
Message-ID: <20210429074636.724046-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The beta version of the Beagle-V RISC-V 64-bit platform has been
showing up at the front door of a few lucky people around the world in
the past days.

As I happen to be one of those lucky people, the obvious first thing
to do was to get a Buildroot defconfig for this platform, and so 48
hours after receiving the board, this is what this patch series does.

This patch series is also available at:

  https://github.com/tpetazzoni/buildroot/commits/beaglev

The first 3 patches are preparation patches for OpenSBI:

 - Add support for version configuration, very much like we have for
   the Linux kernel or U-Boot. Indeed, OpenSBI has platform-specific
   code, so it is very likely that people will need to use a
   non-upstream version.

 - Add support for using U-Boot as an OpenSBI payload, as an
   alternative to Linux.

 - Add support for enabling/disabling the installation of different
   OpenSBI image types, as the Beagle-V configuration doesn't build
   the fw_jump and fw_dynamic images.

The final patch obviously adds the Beagle-V defconfig and related
files themselves. A slight annoyance is that the bootloader
pre-flashed on the board doesn't work as-is, just due to an incorrect
fdt_addr_r environment variable value. So reflashing the bootloader
with what has been built by Buildroot is necessary (but is trivial to
do using Xmodem).

And to conclude, the complete boot log:

bootloader version:210209-4547a8d
ddr 0x00000000, 1M test
ddr 0x00100000, 2M test
DDR clk 2133M,Version: 210302-5aea32f
0 crc flash: 06a62dd7, crc ddr: 06a62dd7
crc check PASSED

bootloader.

OpenSBI v0.9
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name             : StarFive VIC7100
Platform Features         : timer,mfdeleg
Platform HART Count       : 2
Firmware Base             : 0x80000000
Firmware Size             : 92 KB
Runtime SBI Version       : 0.3

Domain0 Name              : root
Domain0 Boot HART         : 1
Domain0 HARTs             : 0*,1*
Domain0 Region00          : 0x0000000080000000-0x000000008001ffff ()
Domain0 Region01          : 0x0000000000000000-0x0000007fffffffff (R,W,X)
Domain0 Next Address      : 0x0000000080200000
Domain0 Next Arg1         : 0x0000000088000000
Domain0 Next Mode         : S-mode
Domain0 SysReset          : yes

Boot HART ID              : 1
Boot HART Domain          : root
Boot HART ISA             : rv64imafdcsux
Boot HART Features        : scounteren,mcounteren
Boot HART PMP Count       : 16
Boot HART PMP Granularity : 4096
Boot HART PMP Address Bits: 36
Boot HART MHPM Count      : 0
Boot HART MHPM Count      : 0
Boot HART MIDELEG         : 0x0000000000000222
Boot HART MEDELEG         : 0x000000000000b109


U-Boot 2021.04 (Apr 29 2021 - 00:09:33 +0200)

CPU:   rv64imafdc
DRAM:  8 GiB
MMC:   sdio0 at 10000000: 0, sdio1 at 10010000: 1
Net:   dwmac.10020000
Autoboot in 2 seconds
MMC CD is 0x0, force to True.
MMC CD is 0x0, force to True.
switch to partitions #0, OK
mmc0 is current device
Scanning mmc 0:1...
Found /boot/extlinux/extlinux.conf
Retrieving file: /boot/extlinux/extlinux.conf
184 bytes read in 11 ms (15.6 KiB/s)
1:	linux
Retrieving file: /boot/Image
13403136 bytes read in 1488 ms (8.6 MiB/s)
append: console=ttyS0,115200 earlyprintk root=PARTUUID=0fef845a-c6e1-45bc-82f7-002fa720f958 rootwait
Retrieving file: /boot/starfive_vic7100_beagle_v.dtb
24782 bytes read in 12 ms (2 MiB/s)
Moving Image from 0x84000000 to 0x80200000, end=80f1b000
## Flattened Device Tree blob at 90000000
   Booting using the fdt blob at 0x90000000
   Using Device Tree in place at 0000000090000000, end 00000000900090cd

Starting kernel ...

[    0.000000] Linux version 5.10.6 (thomas at build1) (riscv64-buildroot-linux-uclibc-gcc.br_real (Buildroot 2021.02-881-g5fc534e0e7) 9.3.0, GNU ld (GNU Binutils) 2.35.2) #2 SMP Thu Apr 29 08:46:03 CEST 2021
[    0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
[    0.000000] efi: UEFI not found.
[    0.000000] Initial ramdisk at: 0x(____ptrval____) (99614720 bytes)
[    0.000000] OF: reserved mem: node linux,cma compatible matching fail
[    0.000000] Reserved memory: created DMA memory pool at 0x00000000f9000000, size 16 MiB
[    0.000000] OF: reserved mem: initialized node framebuffer at f9000000, compatible id shared-dma-pool
[    0.000000] Reserved memory: created DMA memory pool at 0x00000000fb000000, size 32 MiB
[    0.000000] OF: reserved mem: initialized node framebuffer at fb000000, compatible id shared-dma-pool
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080200000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000027fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080200000-0x00000000f8ffffff]
[    0.000000]   node   0: [mem 0x00000000fa000000-0x00000000faffffff]
[    0.000000]   node   0: [mem 0x00000000fd000000-0x000000027fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080200000-0x000000027fffffff]
[    0.000000] software IO TLB: mapped [mem 0x00000000c5000000-0x00000000c9000000] (64MB)
[    0.000000] SBI specification v0.3 detected
[    0.000000] SBI implementation ID=0x1 Version=0x9
[    0.000000] SBI v0.2 TIME extension detected
[    0.000000] SBI v0.2 IPI extension detected
[    0.000000] SBI v0.2 RFENCE extension detected
[    0.000000] SBI v0.2 HSM extension detected
[    0.000000] riscv: ISA extensions acdfim
[    0.000000] riscv: ELF capabilities acdfim
[    0.000000] percpu: Embedded 17 pages/cpu s30952 r8192 d30488 u69632
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 2055687
[    0.000000] Kernel command line: console=ttyS0,115200 earlyprintk root=PARTUUID=0fef845a-c6e1-45bc-82f7-002fa720f958 rootwait
[    0.000000] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.000000] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 7312628K/8337408K available (4498K kernel code, 4429K rwdata, 2048K rodata, 222K init, 327K bss, 1024780K reserved, 0K cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]       fixmap : 0xffffffcefee00000 - 0xffffffceff000000   (2048 kB)
[    0.000000]       pci io : 0xffffffceff000000 - 0xffffffcf00000000   (  16 MB)
[    0.000000]      vmemmap : 0xffffffcf00000000 - 0xffffffcfffffffff   (4095 MB)
[    0.000000]      vmalloc : 0xffffffd000000000 - 0xffffffdfffffffff   (65535 MB)
[    0.000000]       lowmem : 0xffffffe000000000 - 0xffffffe1ffe00000   (8190 MB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU debug extended QS entry/exit.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] riscv-intc: 64 local interrupts mapped
[    0.000000] plic: disable L2 cache irq 128 in plic
[    0.000000] plic: disable L2 cache irq 131 in plic
[    0.000000] plic: disable L2 cache irq 129 in plic
[    0.000000] plic: disable L2 cache irq 130 in plic
[    0.000000] plic: disable L2 cache irq 128 in plic
[    0.000000] plic: disable L2 cache irq 131 in plic
[    0.000000] plic: disable L2 cache irq 129 in plic
[    0.000000] plic: disable L2 cache irq 130 in plic
[    0.000000] plic: plic at c000000: mapped 127 interrupts with 2 handlers for 4 contexts.
[    0.000000] random: get_random_bytes called from start_kernel+0x57c/0x6fa with crng_init=0
[    0.000000] riscv_timer_init_dt: Registering clocksource cpuid [0] hartid [1]
[    0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x171024e6b, max_idle_ns: 440795202301 ns
[    0.000008] sched_clock: 64 bits at 6MHz, resolution 160ns, wraps every 4398046511040ns
[    0.000317] Console: colour dummy device 80x25
[    0.000418] Calibrating delay loop (skipped), value calculated using timer frequency.. 12.50 BogoMIPS (lpj=62500)
[    0.000443] pid_max: default: 32768 minimum: 301
[    0.001254] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.001830] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.006048] rcu: Hierarchical SRCU implementation.
[    0.006698] EFI services will not be available.
[    0.007619] smp: Bringing up secondary CPUs ...
[    0.009401] smp: Brought up 1 node, 2 CPUs
[    0.012989] devtmpfs: initialized
[    0.019938] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.019990] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.021313] NET: Registered protocol family 16
[    0.036584] OF: /soc/i2c at 118b0000: could not find phandle
[    0.036738] OF: /soc/i2c at 118c0000: could not find phandle
[    0.036841] OF: /soc/i2c at 12450000: could not find phandle
[    0.040668] OF: /soc/i2c at 118b0000: could not find phandle
[    0.040954] OF: /soc/i2c at 118c0000: could not find phandle
[    0.041240] OF: /soc/i2c at 12450000: could not find phandle
[    0.052805] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.056547] starfive_gpio 11910000.gpio: SiFive GPIO chip registered 64 GPIOs
[    0.057534] SCSI subsystem initialized
[    0.058264] OF: /soc/i2c at 118b0000: could not find phandle
[    0.058305] i2c_designware 118b0000.i2c: Using 'clocks' : 49500000 / 1000
[    0.058349] i2c_designware 118b0000.i2c: Using 'clocks' : 49500000 / 1000
[    0.058368] i2c_designware 118b0000.i2c: Using 'clocks' : 49500000 / 1000
[    0.058539] i2c_designware 118b0000.i2c: running with gpio recovery mode! scl,sda
[    0.059537] OF: /soc/i2c at 118c0000: could not find phandle
[    0.059580] i2c_designware 118c0000.i2c: Using 'clocks' : 49500000 / 1000
[    0.059622] i2c_designware 118c0000.i2c: Using 'clocks' : 49500000 / 1000
[    0.059641] i2c_designware 118c0000.i2c: Using 'clocks' : 49500000 / 1000
[    0.059853] i2c_designware 118c0000.i2c: running with gpio recovery mode! scl,sda
[    0.060534] OF: /soc/i2c at 12450000: could not find phandle
[    0.060580] i2c_designware 12450000.i2c: Using 'clocks' : 50000000 / 1000
[    0.060620] i2c_designware 12450000.i2c: Using 'clocks' : 50000000 / 1000
[    0.060638] i2c_designware 12450000.i2c: Using 'clocks' : 50000000 / 1000
[    0.060800] i2c_designware 12450000.i2c: running with gpio recovery mode! scl,sda
[    0.062763] clocksource: Switched to clocksource riscv_clocksource
[    0.083426] NET: Registered protocol family 2
[    0.084662] tcp_listen_portaddr_hash hash table entries: 4096 (order: 5, 163840 bytes, linear)
[    0.085495] TCP established hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.088190] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
[    0.098334] TCP: Hash tables configured (established 65536 bind 65536)
[    0.099164] UDP hash table entries: 4096 (order: 6, 393216 bytes, linear)
[    0.101065] UDP-Lite hash table entries: 4096 (order: 6, 393216 bytes, linear)
[    0.103406] NET: Registered protocol family 1
[    0.105381] RPC: Registered named UNIX socket transport module.
[    0.105407] RPC: Registered udp transport module.
[    0.105416] RPC: Registered tcp transport module.
[    0.105425] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.105820] Unpacking initramfs...
[    0.105863] Initramfs unpacking failed: invalid magic at start of compressed archive
[    0.543904] Freeing initrd memory: 97280K
[    0.545701] workingset: timestamp_bits=62 max_order=21 bucket_order=0
[    0.558816] NFS: Registering the id_resolver key type
[    0.558880] Key type id_resolver registered
[    0.558892] Key type id_legacy registered
[    0.559107] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.559183] ntfs: driver 2.1.32 [Flags: R/W].
[    0.560727] NET: Registered protocol family 38
[    0.560832] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
[    0.560848] io scheduler mq-deadline registered
[    0.560858] io scheduler kyber registered
[    0.571447] dw_axi_dmac_platform 100b0000.sgdma2p: DesignWare AXI DMA Controller, 4 channels
[    0.573770] dw_axi_dmac_platform 10500000.sgdma1p: DesignWare AXI DMA Controller, 16 channels
[    0.574591] L2CACHE: No. of Banks in the cache: 2
[    0.574614] L2CACHE: No. of ways per bank: 16
[    0.574622] L2CACHE: Sets per bank: 1024
[    0.574629] L2CACHE: Bytes per cache block: 64
[    0.574638] L2CACHE: Index of the largest way enabled: 0
[    0.708451] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.711619] printk: console [ttyS0] disabled
[    0.711756] 12440000.serial: ttyS0 at MMIO 0x12440000 (irq = 6, base_baud = 6250000) is a 16550A
[    1.531545] printk: console [ttyS0] enabled
[    1.538091] dw-apb-uart 11870000.hs_serial: detected caps 00000000 should be 00000100
[    1.546044] 11870000.hs_serial: ttyS1 at MMIO 0x11870000 (irq = 7, base_baud = 4640625) is a 16550
[    1.558915] vic-rng 118d0000.trng: Initialized
[    1.588146] loop: module loaded
[    1.593099] libphy: Fixed MDIO Bus: probed
[    1.598553] stmmaceth 10020000.gmac: IRQ eth_lpi not found
[    1.604297] stmmaceth 10020000.gmac: force_sf_dma_mode is ignored if force_thresh_dma_mode is set.
[    1.613390] stmmaceth 10020000.gmac: PTP uses main clock
[    1.618702] stmmaceth 10020000.gmac: no reset control found
[    1.624989] stmmaceth 10020000.gmac: User ID: 0x59, Synopsys ID: 0x37
[    1.631430] stmmaceth 10020000.gmac: 	DWMAC1000
[    1.636042] stmmaceth 10020000.gmac: DMA HW capability register supported
[    1.642865] stmmaceth 10020000.gmac: RX Checksum Offload Engine supported
[    1.649631] stmmaceth 10020000.gmac: COE Type 2
[    1.654184] stmmaceth 10020000.gmac: Wake-Up On Lan supported
[    1.659914] stmmaceth 10020000.gmac: Enhanced/Alternate descriptors
[    1.666189] stmmaceth 10020000.gmac: Enabled extended descriptors
[    1.672263] stmmaceth 10020000.gmac: Ring mode enabled
[    1.677415] stmmaceth 10020000.gmac: Enable RX Mitigation via HW Watchdog Timer
[    1.684761] stmmaceth 10020000.gmac: device MAC address 2c:f7:f1:1b:e3:4d
[    1.701766] libphy: stmmac: probed
[    1.705249] mdio_bus stmmac-0:07: attached PHY driver [unbound] (mii_bus:phy_addr=stmmac-0:07, irq=POLL)
[    1.717842] sdhci: Secure Digital Host Controller Interface driver
[    1.724091] sdhci: Copyright(c) Pierre Ossman
[    1.728509] Synopsys Designware Multimedia Card Interface Driver
[    1.734928] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.735451] dw_mmc 10000000.sdio0: IDMAC supports 32-bit address mode.
[    1.742472] NET: Registered protocol family 10
[    1.747382] dw_mmc 10000000.sdio0: Using internal DMA controller.
[    1.757755] dw_mmc 10000000.sdio0: Version ID is 290a
[    1.762995] dw_mmc 10000000.sdio0: DW MMC controller at irq 30,32 bit host data width,32 deep fifo
[    1.772087] mmc_host mmc0: card is polling.
[    1.773896] Segment Routing with IPv6
[    1.777086] dw_mmc 10010000.sdio1: IDMAC supports 32-bit address mode.
[    1.780076] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    1.786550] dw_mmc 10010000.sdio1: Using internal DMA controller.
[    1.793685] NET: Registered protocol family 17
[    1.798601] dw_mmc 10010000.sdio1: Version ID is 290a
[    1.803441] 9pnet: Installing 9P2000 support
[    1.808084] dw_mmc 10010000.sdio1: DW MMC controller at irq 31,32 bit host data width,32 deep fifo
[    1.812396] Key type dns_resolver registered
[    1.821368] mmc_host mmc1: card is non-removable.
[    1.825859] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
[    1.844465] dw-apb-uart 12440000.serial: forbid DMA for kernel console
[    1.992817] mmc_host mmc0: Bus speed (slot 0) = 100000000Hz (slot req 400000Hz, actual 400000HZ div = 125)
[    2.042794] mmc_host mmc1: Bus speed (slot 0) = 100000000Hz (slot req 400000Hz, actual 400000HZ div = 125)
[    2.245826] mmc0: Problem switching card into high-speed mode!
[    2.251679] mmc_host mmc0: Bus speed (slot 0) = 100000000Hz (slot req 10000000Hz, actual 10000000HZ div = 5)
[    2.261748] mmc0: new SDHC card at address 0001
[    2.270089] mmcblk0: mmc0:0001 SD16G 14.6 GiB 
[    2.294140] mmc1: queuing unknown CIS tuple 0x80 (2 bytes)
[    2.301344] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
[    2.308765] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
[    2.314886] GPT:Primary header thinks Alt. header is not at the end of the disk.
[    2.322271] GPT:122951 != 30547967
[    2.325741] GPT:Alternate GPT header not at the end of the disk.
[    2.331733] GPT:122951 != 30547967
[    2.335168] GPT: Use GNU Parted to correct GPT errors.
[    2.340460]  mmcblk0: p1
[    2.347067] mmc1: queuing unknown CIS tuple 0x80 (7 bytes)
[    2.355911] mmc1: queuing unknown CIS tuple 0x81 (9 bytes)
[    2.365061] EXT4-fs (mmcblk0p1): INFO: recovery required on readonly filesystem
[    2.372368] EXT4-fs (mmcblk0p1): write access will be enabled during recovery
[    2.389610] random: fast init done
[    2.441308] mmc_host mmc1: Bus speed (slot 0) = 100000000Hz (slot req 10000000Hz, actual 10000000HZ div = 5)
[    2.461770] mmc1: new high speed SDIO card@address 0001
[    2.613428] EXT4-fs (mmcblk0p1): recovery complete
[    2.627976] EXT4-fs (mmcblk0p1): mounted filesystem with ordered data mode. Opts: (null)
[    2.636240] VFS: Mounted root (ext4 filesystem) readonly on device 179:1.
[    2.644948] devtmpfs: mounted
[    2.648879] Freeing unused kernel memory: 220K
[    2.653805] Run /sbin/init as init process
[    2.928090] EXT4-fs (mmcblk0p1): re-mounted. Opts: (null)
Starting syslogd: OK
Starting klogd: OK
Running sysctl: OK
Initializing random number generator: OK
Saving random seed: [    3.150191] random: dd: uninitialized urandom read (512 bytes read)
OK
Starting network: OK

Welcome to Buildroot
buildroot login: root
# uname -a
Linux buildroot 5.10.6 #2 SMP Thu Apr 29 08:46:03 CEST 2021 riscv64 GNU/Linux
# cat /proc/cpuinfo 
processor	: 0
hart		: 1
isa		: rv64imafdc
mmu		: sv39
uarch		: starfive,rocket0

processor	: 1
hart		: 0
isa		: rv64imafdc
mmu		: sv39
uarch		: starfive,rocket0

# 

Thomas

Thomas Petazzoni (4):
  boot/opensbi: add support for version configuration
  boot/opensbi: allow using U-Boot as a payload
  boot/opensbi: add options to enable/disable image installation
  configs/beaglev_defconfig: new defconfig

 DEVELOPERS                                    |  2 +
 board/beaglev/extlinux.conf                   |  4 +
 board/beaglev/genimage.cfg                    | 12 +++
 ...s-starfive-vic7100-adjust-fdt_addr_r.patch | 39 +++++++++
 board/beaglev/post-build.sh                   | 17 ++++
 board/beaglev/readme.txt                      | 86 +++++++++++++++++++
 boot/opensbi/Config.in                        | 78 +++++++++++++++++
 boot/opensbi/opensbi.mk                       | 39 +++++++--
 configs/beaglev_defconfig                     | 35 ++++++++
 9 files changed, 307 insertions(+), 5 deletions(-)
 create mode 100644 board/beaglev/extlinux.conf
 create mode 100644 board/beaglev/genimage.cfg
 create mode 100644 board/beaglev/patches/uboot/0001-include-configs-starfive-vic7100-adjust-fdt_addr_r.patch
 create mode 100755 board/beaglev/post-build.sh
 create mode 100644 board/beaglev/readme.txt
 create mode 100644 configs/beaglev_defconfig

-- 
2.30.2
