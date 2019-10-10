From: Mao Han <han_mao@c-sky.com>
Date: Thu, 10 Oct 2019 09:41:24 +0800
Subject: [Buildroot] qemu_riscv64_virt can't boot up with large cpio
 initial RAM filesystem
In-Reply-To: <ca65a9ed-0a19-e494-a1ca-166297a53445@mind.be>
References: <2019100915460909560126@c-sky.com>
 <ca65a9ed-0a19-e494-a1ca-166297a53445@mind.be>
Message-ID: <20191010014123.GA8416@vmh-VirtualBox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 10, 2019 at 12:59:32AM +0200, Arnout Vandecappelle wrote:
> 
> 
> On 09/10/2019 09:46, han_mao at c-sky.com wrote:
> > Hi,
> > I've got some troble when I tried to use init ram fs on riscv64 virt.
> > The default ext2 fs works fine. If I use cpio and init ram fs to
> > replace that. The kernel can boot up with small ram fs, but
> > a big ram fs(>100M) doesn't work.
> 
>  I believe default memory size is 128MB, so a large cpio image will overflow the
> memory.
> 
>  Use the -m option to increase qemu's memory size.
> 
>  Regards,
>  Arnout
>

I've already set memory size to 1G with command:
LD_LIBRARY_PATH=../host/lib ../host/bin/qemu-system-riscv64 -M virt -m 1024 -kernel fw_jump.elf -device loader,file=Image,addr=0x80200000 -append "rootwait root=/dev/ram0" -nographic
The kernel didn't get into segmentation fault/bus error.
I'v also dump some part of the Image with gdb and saw no
corruption. The root cause seems is not the memorysize.

Thanks,
Mao Han 
-------------- next part --------------
LD_LIBRARY_PATH=../host/lib ../host/bin/qemu-system-riscv64 -M virt -m 1024 -kernel fw_jump.elf -device loader,file=Image,addr=0x80200000 -append "rootwait root=/dev/ram0" -nographic 

OpenSBI v0.3 (Oct  9 2019 15:09:29)
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name          : QEMU Virt Machine
Platform HART Features : RV64ACDFIMSU
Platform Max HARTs     : 8
Current Hart           : 0
Firmware Base          : 0x80000000
Firmware Size          : 96 KB
Runtime SBI Version    : 0.1

PMP0: 0x0000000080000000-0x000000008001ffff (A)
PMP1: 0x0000000000000000-0xffffffffffffffff (A,R,W,X)
[    0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
[    0.000000] Linux version 5.1.12 (root at vmh-VirtualBox) (gcc version 8.3.0 (Buildroot 2019.08-git-g4bc68b3-dirty)) #9 SMP Thu Oct 10 09:14:54 CST 2019
[    0.000000] initrd not found or empty - disabling initrd
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080200000-0x00000000bfffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080200000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080200000-0x00000000bfffffff]
[    0.000000] software IO TLB: mapped [mem 0xbb1fc000-0xbf1fc000] (64MB)
[    0.000000] elf_hwcap is 0x112d
[    0.000000] percpu: Embedded 17 pages/cpu s31000 r8192 d30440 u69632
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 258055
[    0.000000] Kernel command line: rootwait root=/dev/ram0
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)
[    0.000000] Sorting __ex_table...
[    0.000000] Memory: 952484K/1046528K available (5748K kernel code, 356K rwdata, 1828K rodata, 3898K init, 309K bss, 94044K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=1.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
[    0.000000] NR_IRQS: 0, nr_irqs: 0, preallocated irqs: 0
[    0.000000] plic: mapped 10 interrupts with 1 handlers for 2 contexts.
[    0.000000] riscv_timer_init_dt: Registering clocksource cpuid [0] hartid [0]
[    0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x24e6a1710, max_idle_ns: 440795202120 ns
[    0.000144] sched_clock: 64 bits at 10MHz, resolution 100ns, wraps every 4398046511100ns
[    0.008328] Console: colour dummy device 80x25
[    0.009780] printk: console [tty0] enabled
[    0.011079] Calibrating delay loop (skipped), value calculated using timer frequency.. 20.00 BogoMIPS (lpj=40000)
[    0.011290] pid_max: default: 32768 minimum: 301
[    0.013313] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
[    0.013415] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes)
[    0.024850] *** VALIDATE proc ***
[    0.028173] *** VALIDATE cgroup1 ***
[    0.028329] *** VALIDATE cgroup2 ***
[    0.046703] rcu: Hierarchical SRCU implementation.
[    0.054145] smp: Bringing up secondary CPUs ...
[    0.054279] smp: Brought up 1 node, 1 CPU
[    0.084655] devtmpfs: initialized
[    0.091660] random: get_random_u32 called from bucket_table_alloc+0x74/0x17e with crng_init=0
[    0.094741] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.094984] futex hash table entries: 256 (order: 2, 16384 bytes)
[    0.097885] NET: Registered protocol family 16
[    0.100744] DMA: preallocated 256 KiB pool for atomic allocations
[    0.144678] vgaarb: loaded
[    0.145809] SCSI subsystem initialized
[    0.148671] usbcore: registered new interface driver usbfs
[    0.149052] usbcore: registered new interface driver hub
[    0.149371] usbcore: registered new device driver usb
[    0.158318] clocksource: Switched to clocksource riscv_clocksource
[    0.187730] NET: Registered protocol family 2
[    0.193631] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, 8192 bytes)
[    0.193884] TCP established hash table entries: 8192 (order: 4, 65536 bytes)
[    0.194172] TCP bind hash table entries: 8192 (order: 5, 131072 bytes)
[    0.194822] TCP: Hash tables configured (established 8192 bind 8192)
[    0.196607] UDP hash table entries: 512 (order: 2, 16384 bytes)
[    0.196897] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
[    0.198666] NET: Registered protocol family 1
[    0.203797] RPC: Registered named UNIX socket transport module.
[    0.203896] RPC: Registered udp transport module.
[    0.203966] RPC: Registered tcp transport module.
[    0.204045] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.602355] workingset: timestamp_bits=62 max_order=18 bucket_order=0
[    0.621598] NFS: Registering the id_resolver key type
[    0.622489] Key type id_resolver registered
[    0.622766] Key type id_legacy registered
[    0.622960] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.771145] NET: Registered protocol family 38
[    0.771607] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
[    0.771785] io scheduler mq-deadline registered
[    0.771933] io scheduler kyber registered
[    0.939617] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.948760] 10000000.uart: ttyS0@MMIO 0x10000000 (irq = 10, base_baud = 230400) is a 16550A
[    0.983856] printk: console [ttyS0] enabled
[    0.986423] [drm] radeon kernel modesetting enabled.
[    1.004257] loop: module loaded
[    1.006835] libphy: Fixed MDIO Bus: probed
[    1.008199] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    1.008703] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    1.009796] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.010625] ehci-pci: EHCI PCI platform driver
[    1.011225] ehci-platform: EHCI generic platform driver
[    1.011885] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.012375] ohci-pci: OHCI PCI platform driver
[    1.012949] ohci-platform: OHCI generic platform driver
[    1.014339] usbcore: registered new interface driver uas
[    1.014983] usbcore: registered new interface driver usb-storage
[    1.016531] mousedev: PS/2 mouse device common for all mice
[    1.018467] usbcore: registered new interface driver usbhid
[    1.018910] usbhid: USB HID core driver
[    1.023007] NET: Registered protocol family 10
[    1.031619] Segment Routing with IPv6
[    1.032574] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    1.036357] NET: Registered protocol family 17
[    1.038036] Key type dns_resolver registered
[    1.106155] Freeing unused kernel memory: 3896K
[    1.106603] This architecture does not have kernel memory protection.
[    1.107444] Run /init as init process
mount: mounting debugfs on /sys/kernel/debug failed: No such file or directory
Starting syslogd: OK
Starting klogd: OK
Starting mdev... OK
Initializing random number generator... [    5.192033] random: dd: uninitialized urandom read (512 bytes read)
done.
Starting network: OK

Welcome to Buildroot
buildroot login: root
# free
              total        used        free      shared  buff/cache   available
Mem:         956380       15872      929624          32       10884      927464
Swap:             0           0           0
-------------- next part --------------
LD_LIBRARY_PATH=../host/lib ../host/bin/qemu-system-riscv64 -M virt -m 1024 -kernel fw_jump.elf -device loader,file=Image,addr=0x80200000 -append "rootwait root=/dev/ram0" -nographic 

OpenSBI v0.3 (Oct  9 2019 15:09:29)
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name          : QEMU Virt Machine
Platform HART Features : RV64ACDFIMSU
Platform Max HARTs     : 8
Current Hart           : 0
Firmware Base          : 0x80000000
Firmware Size          : 96 KB
Runtime SBI Version    : 0.1

PMP0: 0x0000000080000000-0x000000008001ffff (A)
PMP1: 0x0000000000000000-0xffffffffffffffff (A,R,W,X)
QEMU 3.1.0 monitor - type 'help' for more information
(qemu) q


ls -lt
total 612364
-rw-r--r-- 1 root root  71070520 10? 10 09:25 rootfs.tar.gz
-rw-r--r-- 1 root root 205998080 10? 10 09:25 rootfs.tar
-rw-r--r-- 1 root root  80056892 10? 10 09:24 Image
-rw-r--r-- 1 root root  71387525 10? 10 09:23 rootfs.cpio.gz
-rw-r--r-- 1 root root 197128192 10? 10 09:23 rootfs.cpio
-rw-r--r-- 1 root root    203592 10?  9 15:09 fw_jump.elf
-rw-r--r-- 1 root root     28904 10?  9 15:09 fw_jump.bin
-rw-r--r-- 1 root root      3688 10?  9 15:09 readme.txt
drwxr-xr-x 2 root root      4096 10?  9 15:09 hw
