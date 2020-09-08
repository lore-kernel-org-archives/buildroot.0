From: Damien Le Moal <damien.lemoal@wdc.com>
Date: Tue,  8 Sep 2020 14:16:19 +0900
Subject: [Buildroot] [PATCH 0/5] Add support for Kendryte K210 RISC-V boards
Message-ID: <20200908051624.425573-1-damien.lemoal@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(resending as my first drop was rejected due to lack of subscription to
the mailining list. My apologies for the noise)

This patch series adds support for building bootable images for RISC-V
boards based on the Kendryte K210 SoC which is supported by the Linux
kernel since version 5.8.0. This SoC has no MMU supported by Linux and
requires uClibc flatbin binaries as gcc does not yet support FDPIC
executables for RISC-V.

The first four patches adjust buildroot configuration to allow building
uClibc static no-MMU libraries for RISC-V. The last and fifth patch adds
buildroot defconfig for the Kendryte K210 as well as uClibc and busybox
configuration.

Building is as simple as:
make kendryte_k210_defconfig
make

Which generate the output/image/loader.bin bootable image.

The result using a SiPeed Dan Dock board is:

[    0.000000] Linux version 5.8.0 (damien at localhost.localdomain) (riscv64-buildroot-linux-uclibc-gcc.br_real (Buildroot 2020.08-301-g80b623ab02) 9.3.0, GNU ld (GNU Binutils) 2.32) #5 SMP Tue Sep 8 13:24:36 JST 2020
[    0.000000] earlycon: sifive0 at MMIO 0x0000000038000000 (options '')
[    0.000000] printk: bootconsole [sifive0] enabled
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080000000-0x00000000807fffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000807fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000807fffff]
[    0.000000] riscv: ISA extensions acdfim
[    0.000000] riscv: ELF capabilities acdfim
[    0.000000] percpu: max_distance=0x18000 too large for vmalloc space 0x0
[    0.000000] percpu: Embedded 12 pages/cpu s18336 r0 d30816 u49152
[    0.000000] Built 1 zonelists, mobility grouping off.  Total pages: 2020
[    0.000000] Kernel command line: earlycon console=ttySIF0
[    0.000000] Dentry cache hash table entries: 1024 (order: 1, 8192 bytes, linear)
[    0.000000] Inode-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 6328K/8192K available (939K kernel code, 127K rwdata, 169K rodata, 281K init, 97K bss, 1864K reserved, 0K cma-reserved)
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] riscv-intc: 64 local interrupts mapped
[    0.000000] plic: interrupt-controller at c000000: mapped 65 interrupts with 2 handlers for 4 contexts.
[    0.000000] riscv_timer_init_dt: Registering clocksource cpuid [0] hartid [0]
[    0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x3990be68b, max_idle_ns: 881590404272 ns
[    0.000014] sched_clock: 64 bits at 7MHz, resolution 128ns, wraps every 4398046511054ns
[    0.008243] Console: colour dummy device 80x25
[    0.012482] Calibrating delay loop (skipped), value calculated using timer frequency.. 15.60 BogoMIPS (lpj=31200)
[    0.022681] pid_max: default: 4096 minimum: 301
[    0.027301] Mount-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.034417] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.044877] rcu: Hierarchical SRCU implementation.
[    0.049777] smp: Bringing up secondary CPUs ...
[    0.055061] smp: Brought up 1 node, 2 CPUs
[    0.059461] devtmpfs: initialized
[    0.065630] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.074654] futex hash table entries: 16 (order: -2, 1024 bytes, linear)
[    0.084164] Kendryte K210 SoC sysctl
[    0.097676] clocksource: Switched to clocksource riscv_clocksource
[    0.234143] workingset: timestamp_bits=62 max_order=11 bucket_order=0
[    0.241568] 38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1, base_baud = 0) is a SiFive UART v0
[    0.250052] printk: console [ttySIF0] enabled
[    0.250052] printk: console [ttySIF0] enabled
[    0.258687] printk: bootconsole [sifive0] disabled
[    0.258687] printk: bootconsole [sifive0] disabled
[    0.271261] random: get_random_bytes called from 0x000000008004c75c with crng_init=0
[    0.279763] Freeing unused kernel memory: 280K
[    0.283478] This architecture does not have kernel memory protection.
[    0.289922] Run /init as init process

-----------------------------
| Kendryte K210 NOMMU Linux |
-----------------------------


BusyBox v1.32.0 (2020-09-08 12:18:21 JST) hush - the humble shell
Enter 'help' for a list of built-in commands.

/ # cat /proc/cpuinfo
processor	: 0
hart		: 0
isa		: rv64imafdc
uarch		: kendryte,k210

processor	: 1
hart		: 1
isa		: rv64imafdc
uarch		: kendryte,k210

/ #

These patches are also available at
git at github.com:damien-lemoal/buildroot.git
(https://github.com/damien-lemoal/buildroot)


Christoph Hellwig (2):
  package/elf2flt: add RISC-V support
  package make: build nommu builds as linux

Damien Le Moal (3):
  toolchain/buildroot: allow uclibc-ng for riscv
  arch/config: Make RISC-V MMU optional
  Add support for Kendryte K210 based RISC-V boards

 arch/Config.in                                |    2 +-
 board/kendryte/k210/busybox.config            | 1181 +++++++++++++++++
 board/kendryte/k210/device_table_dev.txt      |   17 +
 board/kendryte/k210/fakeroot.sh               |    8 +
 ...evert-Fix-static-linking-with-GCC-10.patch |   43 +
 ...0002-fix-static-builds-with-gcc-10.x.patch |   25 +
 ...-utils-getconf-Fix-compilation-error.patch |  103 ++
 .../0004-librt-avoid-compilation-error.patch  |   42 +
 board/kendryte/k210/rootfs_overlay/init       |   11 +
 board/kendryte/k210/uClibc-ng.config          |  209 +++
 configs/kendryte_k210_defconfig               |   36 +
 package/Makefile.in                           |    2 +-
 .../0002-elf2flt-add-riscv-support.patch      |  302 +++++
 package/elf2flt/Config.in.host                |    2 +-
 package/uclibc/Config.in                      |    2 +
 toolchain/toolchain-buildroot/Config.in       |    4 +-
 16 files changed, 1985 insertions(+), 4 deletions(-)
 create mode 100644 board/kendryte/k210/busybox.config
 create mode 100644 board/kendryte/k210/device_table_dev.txt
 create mode 100755 board/kendryte/k210/fakeroot.sh
 create mode 100644 board/kendryte/k210/patches/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch
 create mode 100644 board/kendryte/k210/patches/uclibc/0002-fix-static-builds-with-gcc-10.x.patch
 create mode 100644 board/kendryte/k210/patches/uclibc/0003-utils-getconf-Fix-compilation-error.patch
 create mode 100644 board/kendryte/k210/patches/uclibc/0004-librt-avoid-compilation-error.patch
 create mode 100755 board/kendryte/k210/rootfs_overlay/init
 create mode 100644 board/kendryte/k210/uClibc-ng.config
 create mode 100644 configs/kendryte_k210_defconfig
 create mode 100644 package/elf2flt/0002-elf2flt-add-riscv-support.patch

-- 
2.26.2
