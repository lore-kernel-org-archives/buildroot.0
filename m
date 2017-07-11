From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Jul 2017 22:42:04 +0200
Subject: [Buildroot] [PATCH 2/3] fs/squashfs: align size to 1MiB
In-Reply-To: <87pod6rak1.fsf@dell.be.48ers.dk>
References: <cover.1499703968.git.yann.morin.1998@free.fr>
 <03816ee56333f1eddb6ca8a048aea947fc027963.1499703968.git.yann.morin.1998@free.fr>
 <20170710232439.7dba43f1@windsurf.lan>
 <20170710213516.GB22898@scaer> <87pod6rak1.fsf@dell.be.48ers.dk>
Message-ID: <20170711204204.GA2991@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-07-11 22:19 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Thomas, All,
>  > On 2017-07-10 23:24 +0200, Thomas Petazzoni spake thusly:
>  >> On Mon, 10 Jul 2017 18:26:19 +0200, Yann E. MORIN wrote:
>  >> > The Linux kernel will refuse to mount a squashfs image/partition that is
>  >> > not padded to a 1MiB boundary.
>  >> 
>  >> Besides experimental evidence, do you have a pointer to a place in the
>  >> Linux kernel documentation / code that confirms this statement ?
>  >> 
>  >> If you don't, that's fine, but if you have such a reference, it would
>  >> be useful to add it to the commit log.
> 
>  > Sorry, I have no such reference. As you say, it is experimental
>  > evidence... Which turns out to be wrong.
> 
>  > Now I tried to round it to 128KiB (the block size), but it was no good.
> 
>  > Then I tried to round it to 256KiB (just for fun). And it works.
> 
> Yes, I also find this quite odd. I haven't personally used squashfs
> forin years, but have never run into such issues.

Well, I also did not remeber such an issue either, but ot urns out that
the squashfs images that are generated with mksquashfs are not bootable
in a (recent-ish) kernel if their size is not a multiple of at least
256KiB...

Steps to reproduce:
  - start with qemu_arm_vexpress_defconfig,
  - change the toolchain to external (for speed)
  - change the fs ro squashfs
  - build
  - boot

Expected results:
  - it boots to a login prompt

Actual result:
  - the kernel panics beacuse it can't mount the root filesystem


---8<---
$ qemu-system-arm -M vexpress-a9 -smp 1 -m 256 -kernel output/images/zImage -dtb output/images/vexpress-v2p-ca9.dtb -drive file=output/images/rootfs.squashfs,if=sd,format=raw -append "console=ttyAMA0,115200 root=/dev/mmcblk0" -serial stdio -net nic,model=lan9118 -net user
pulseaudio: set_sink_input_volume() failed
pulseaudio: Reason: Invalid argument
pulseaudio: set_sink_input_mute() failed
pulseaudio: Reason: Invalid argument
Booting Linux on physical CPU 0x0
Linux version 4.11.3 (ymorin@scaer) (gcc version 6.3.1 20170109 (Linaro GCC 6.3-2017.02) ) #1 SMP Tue Jul 11 22:37:48 CEST 2017
CPU: ARMv7 Processor [410fc090] revision 0 (ARMv7), cr=10c5387d
CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
OF: fdt: Machine model: V2P-CA9
Memory policy: Data cache writeback
CPU: All CPU(s) started in SVC mode.
percpu: Embedded 15 pages/cpu @8fdb2000 s31628 r8192 d21620 u61440
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 65024
Kernel command line: console=ttyAMA0,115200 root=/dev/mmcblk0
log_buf_len individual max cpu contribution: 4096 bytes
log_buf_len total cpu_extra contributions: 12288 bytes
log_buf_len min size: 16384 bytes
log_buf_len: 32768 bytes
early log buf free: 15000(91%)
PID hash table entries: 1024 (order: 0, 4096 bytes)
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 250964K/262144K available (5120K kernel code, 171K rwdata, 1216K rodata, 1024K init, 158K bss, 11180K reserved, 0K cma-reserved)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
    vmalloc : 0x90800000 - 0xff800000   (1776 MB)
    lowmem  : 0x80000000 - 0x90000000   ( 256 MB)
    modules : 0x7f000000 - 0x80000000   (  16 MB)
      .text : 0x80008000 - 0x80600000   (6112 kB)
      .init : 0x80800000 - 0x80900000   (1024 kB)
      .data : 0x80900000 - 0x8092af00   ( 172 kB)
       .bss : 0x8092c000 - 0x80953b34   ( 159 kB)
SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
Hierarchical RCU implementation.
        RCU debugfs-based tracing is enabled.
        Build-time adjustment of leaf fanout to 32.
        RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=4.
RCU: Adjusting geometry for rcu_fanout_leaf=32, nr_cpu_ids=4
NR_IRQS:16 nr_irqs:16 16
GIC CPU mask not found - kernel will fail to boot.
GIC CPU mask not found - kernel will fail to boot.
L2C: platform modifies aux control register: 0x02020000 -> 0x02420000
L2C: DT/platform modifies aux control register: 0x02020000 -> 0x02420000
L2C-310 enabling early BRESP for Cortex-A9
L2C-310 full line of zeros enabled for Cortex-A9
L2C-310 dynamic clock gating disabled, standby mode disabled
L2C-310 cache controller enabled, 8 ways, 128 kB
L2C-310: CACHE_ID 0x410000c8, AUX_CTRL 0x46420001
smp_twd: clock not found -2
sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 89478484971ns
clocksource: arm,sp804: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275 ns
Failed to initialize '/smb at 04000000/motherboard/iofpga at 7,00000000/timer at 12000': -22
Console: colour dummy device 80x30
Calibrating local timer... 96.19MHz.
Calibrating delay loop... 766.77 BogoMIPS (lpj=3833856)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
Setting up static identity map for 0x60100000 - 0x60100058
smp: Bringing up secondary CPUs ...
smp: Brought up 1 node, 1 CPU
SMP: Total of 1 processors activated (766.77 BogoMIPS).
CPU: All CPU(s) started in SVC mode.
devtmpfs: initialized
VFP support v0.3: implementor 41 architecture 3 part 30 variant 9 rev 0
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
futex hash table entries: 1024 (order: 4, 65536 bytes)
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations
cpuidle: using governor ladder
hw-breakpoint: debug architecture 0x4 unsupported.
Serial: AMBA PL011 UART driver
OF: amba_device_add() failed (-19) for /memory-controller at 100e0000
OF: amba_device_add() failed (-19) for /memory-controller at 100e1000
OF: amba_device_add() failed (-19) for /watchdog at 100e5000
irq: type mismatch, failed to map hwirq-75 for /interrupt-controller at 1e001000!
10009000.uart: ttyAMA0 at MMIO 0x10009000 (irq = 38, base_baud = 0) is a PL011 rev1
console [ttyAMA0] enabled
1000a000.uart: ttyAMA1 at MMIO 0x1000a000 (irq = 39, base_baud = 0) is a PL011 rev1
1000b000.uart: ttyAMA2 at MMIO 0x1000b000 (irq = 40, base_baud = 0) is a PL011 rev1
1000c000.uart: ttyAMA3 at MMIO 0x1000c000 (irq = 41, base_baud = 0) is a PL011 rev1
OF: amba_device_add() failed (-19) for /smb at 04000000/motherboard/iofpga at 7,00000000/wdt at 0f000
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
Advanced Linux Sound Architecture Driver Initialized.
clocksource: Switched to clocksource arm,sp804
NET: Registered protocol family 2
TCP established hash table entries: 2048 (order: 1, 8192 bytes)
TCP bind hash table entries: 2048 (order: 2, 16384 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
UDP hash table entries: 256 (order: 1, 8192 bytes)
UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
hw perfevents: enabled with armv7_cortex_a9 PMU driver, 1 counters available
workingset: timestamp_bits=30 max_order=16 bucket_order=0
squashfs: version 4.0 (2009/01/31) Phillip Lougher
jffs2: version 2.2. (NAND) ? 2001-2006 Red Hat, Inc.
9p: Installing v9fs 9p2000 file system support
io scheduler noop registered (default)
io scheduler mq-deadline registered
clcd-pl11x 10020000.clcd: PL111 designer 41 rev2 at 0x10020000
clcd-pl11x 10020000.clcd: /clcd at 10020000 hardware, 1024x768 at 59 display
Console: switching to colour frame buffer device 128x48
clcd-pl11x 1001f000.clcd: PL111 designer 41 rev2 at 0x1001f000
clcd-pl11x 1001f000.clcd: /smb at 04000000/motherboard/iofpga at 7,00000000/clcd at 1f000 hardware, 640x480 at 59 display
40000000.flash: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID 0x000000 Chip ID 0x000000
Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
40000000.flash: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID 0x000000 Chip ID 0x000000
Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
Concatenating MTD devices:
(0): "40000000.flash"
(1): "40000000.flash"
into device "40000000.flash"
libphy: Fixed MDIO Bus: probed
libphy: smsc911x-mdio: probed
smsc911x 4e000000.ethernet eth0: MAC Address: 52:54:00:12:34:56
isp1760 4f000000.usb: bus width: 32, oc: digital
isp1760 4f000000.usb: NXP ISP1760 USB Host Controller
isp1760 4f000000.usb: new USB bus registered, assigned bus number 1
isp1760 4f000000.usb: Scratch test failed.
isp1760 4f000000.usb: can't setup: -19
isp1760 4f000000.usb: USB bus 1 deregistered
usbcore: registered new interface driver usb-storage
rtc-pl031 10017000.rtc: rtc core: registered pl031 as rtc0
mmci-pl18x 10005000.mmci: Got CD GPIO
mmci-pl18x 10005000.mmci: Got WP GPIO
mmci-pl18x 10005000.mmci: mmc0: PL181 manf 41 rev0 at 0x10005000 irq 34,35 (pio)
mmc0: new SD card at address 4567
input: AT Raw Set 2 keyboard as /devices/platform/smb at 04000000/smb at 04000000:motherboard/smb at 04000000:motherboard:iofpga at 7,00000000/10006000.kmi/serio0/input/input0
ledtrig-cpu: registered to indicate activity on CPUs
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
mmcblk0: mmc0:4567 QEMU! 2.25 MiB
aaci-pl041 10004000.aaci: ARM AC'97 Interface PL041 rev0 at 0x10004000, irq 33
aaci-pl041 10004000.aaci: FIFO 512 entries
oprofile: using arm/armv7-ca9
NET: Registered protocol family 17
9pnet: Installing 9P2000 support
Registering SWP/SWPB emulation handler
rtc-pl031 10017000.rtc: setting system clock to 2017-07-11 20:39:12 UTC (1499805552)
ALSA device list:
  #0: ARM AC'97 Interface PL041 rev0 at 0x10004000, irq 33
input: ImExPS/2 Generic Explorer Mouse as /devices/platform/smb at 04000000/smb at 04000000:motherboard/smb at 04000000:motherboard:iofpga at 7,00000000/10007000.kmi/serio1/input/input2
random: fast init done
List of all partitions:
1f00          131072 mtdblock0
 (driver?)
1f01           32768 mtdblock1
 (driver?)
b300            2304 mmcblk0
 driver: mmcblk
No filesystem could mount root, tried:
 ext3
 ext4
 ext2
 cramfs
 squashfs
 vfat

Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(179,0)
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.11.3 #1
Hardware name: ARM-Versatile Express
[<8010e70c>] (unwind_backtrace) from [<8010b0c0>] (show_stack+0x10/0x14)
[<8010b0c0>] (show_stack) from [<80362324>] (dump_stack+0x84/0x98)
[<80362324>] (dump_stack) from [<801aaf78>] (panic+0xdc/0x248)
[<801aaf78>] (panic) from [<80801320>] (mount_block_root+0x23c/0x288)
[<80801320>] (mount_block_root) from [<8080148c>] (mount_root+0x120/0x128)
[<8080148c>] (mount_root) from [<808015e4>] (prepare_namespace+0x150/0x194)
[<808015e4>] (prepare_namespace) from [<80800ebc>] (kernel_init_freeable+0x258/0x268)
[<80800ebc>] (kernel_init_freeable) from [<805ec9e0>] (kernel_init+0x8/0x108)
[<805ec9e0>] (kernel_init) from [<80107638>] (ret_from_fork+0x14/0x3c)
---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(179,0)
---8<---

Now, truncate the file:

    $ truncate -s %256k ../O/images/rootfs.squashfs

and boot again, you get a nice login prompt... ;-)


Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
