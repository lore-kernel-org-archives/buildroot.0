From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Oct 2012 17:40:30 +0100
Subject: [Buildroot] Add basic support for the AArch64 architecture
Message-ID: <1351442438-20639-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of patches adds basic AArch64 (the new ARM 64 bits
architecture) support in Buildroot:

 (1) Add the new architecture

 (2) Add a AArch64 external toolchain provided by Linaro

 (3) Ensure that only external toolchain can be used for AArch64 (we
     don't have internal or Crosstool-NG backend support for this
     architecture at the moment)

 (4) Add a fix for Busybox needed to get it to build with recent C
     library versions.

 (5) Add the AArch64 handling to KERNEL_ARCH

 (6) Add a new bootloader for the AArch64 ARM simulator.

 (7) Add a default configuration to generate a Buildroot system for
     the AArch64 ARM simulator.

And the system runs fine:

===============================================================================
Initializing cgroup subsys cpu
Linux version 3.7.0-rc2 (thomas at skate) (gcc version 4.7.3 20121001 (prerelease) [gcc-linaro/4.7 revision 115029] (crosstool-NG linaro-1.13.1+bzr2506 - ARM aarch64 via Linaro) ) #1 SMP Sun Oct 28 17:27:07 CET 2012
CPU: AArch64 Processor [410fd000] revision 0
Machine: V2P-AARCH64
PERCPU: Embedded 10 pages/cpu @ffffffc03ffa9000 s10624 r8192 d22144 u40960
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 926720
Kernel command line: root=/dev/vda consolelog=9 console=ttyAMA0 rw
PID hash table entries: 4096 (order: 3, 32768 bytes)
Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
software IO TLB [mem 0xb8000000-0xbbffffff] (64MB) mapped at [ffffffc038000000-ffffffc03bffffff]
Memory: 2048MB 2048MB = 4096MB total
Memory: 4059616k/4059616k available, 134688k reserved
Virtual kernel memory layout:
    vmalloc : 0xffffff8000000000 - 0xffffffbbffff0000   (245759 MB)
    vmemmap : 0xffffffbc01c00000 - 0xffffffbc1f800000   (   476 MB)
    modules : 0xffffffbffc000000 - 0xffffffc000000000   (    64 MB)
    memory  : 0xffffffc000000000 - 0xffffffc880000000   ( 34816 MB)
      .init : 0xffffffc0004c0000 - 0xffffffc0004e8980   (   163 kB)
      .text : 0xffffffc000080000 - 0xffffffc0004c0000   (  4352 kB)
      .data : 0xffffffc0004ea000 - 0xffffffc00051c620   (   202 kB)
SLUB: Genslabs=11, HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
Hierarchical RCU implementation.
NR_IRQS:64 nr_irqs:64 0
Architected local timer running at 100.00MHz.
arch_timer: found timer irq 30
Console: colour dummy device 80x25
Calibrating delay loop (skipped), value calculated using timer frequency.. 200.00 BogoMIPS (lpj=1000000)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 256
hw perfevents: enabled with arm/armv8-pmuv3 PMU driver, 9 counters available
CPU1: failed to boot: -38
CPU2: failed to boot: -38
CPU3: failed to boot: -38
Brought up 1 CPUs
SMP: Total of 1 processors activated (200.00 BogoMIPS).
devtmpfs: initialized
atomic64 test passed
NET: Registered protocol family 16
vdso: 2 pages (1 code, 1 data) at base ffffffc00051e000
hw-breakpoint: found 16 breakpoint and 16 watchpoint registers.
Serial: AMBA PL011 UART driver
1c090000.uart: ttyAMA0 at MMIO 0x1c090000 (irq = 37) is a PL011 rev1
console [ttyAMA0] enabled
1c0a0000.uart: ttyAMA1 at MMIO 0x1c0a0000 (irq = 38) is a PL011 rev1
1c0b0000.uart: ttyAMA2 at MMIO 0x1c0b0000 (irq = 39) is a PL011 rev1
1c0c0000.uart: ttyAMA3 at MMIO 0x1c0c0000 (irq = 40) is a PL011 rev1
bio: create slab <bio-0> at 0
SCSI subsystem initialized
Switching to clocksource arch_sys_counter
NET: Registered protocol family 2
TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
TCP: Hash tables configured (established 262144 bind 65536)
TCP: reno registered
UDP hash table entries: 2048 (order: 4, 65536 bytes)
UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
fuse init (API version 7.20)
msgmni has been set to 7928
io scheduler noop registered
io scheduler cfq registered (default)
 vda: unknown partition table
smc91x: IOADDR ffffff800001a000 doesn't match configuration (300).
smc91x.c: v1.1, sep 22 2004 by Nicolas Pitre <nico@fluxnic.net>
eth0: SMC91C11xFD (rev 1) at ffffff800001a000 IRQ 47 [nowait]
eth0: Ethernet addr: 00:02:f7:ef:5f:8a
mousedev: PS/2 mouse device common for all mice
TCP: cubic registered
NET: Registered protocol family 17
EXT2-fs (vda): warning: mounting unchecked fs, running e2fsck is recommended
VFS: Mounted root (ext2 filesystem) on device 254:0.
Freeing init memory: 160K
Starting logging: OK
Initializing random number generator... done.
Starting network...

Welcome to Buildroot
buildroot login: root
# hostname
buildroot
# cat /proc/cpuinfo
Processor       : AArch64 Processor rev 0 (aarch64)
processor       : 0
BogoMIPS        : 200.00

Features        : fp asimd
CPU implementer : 0x41
CPU architecture: AArch64
CPU variant     : 0x0
CPU part        : 0xd00
CPU revision    : 0

Hardware        : V2P-AARCH64
# uname -a
Linux buildroot 3.7.0-rc2 #1 SMP Sun Oct 28 17:27:07 CET 2012 aarch64 GNU/Linux
===============================================================================

Best regards,

Thomas
