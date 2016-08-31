From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2016 21:35:10 +0200
Subject: [Buildroot] build 2015.11 - sbin/init: error while loading
 shared libraries: libtirpc.so.1
In-Reply-To: <CALD51P_B9Ng0RN6f_bhqsHuJONucUE462dE14es5uM0K4P0F0w@mail.gmail.com>
References: <CALD51P81wh8mSgypNtVqZ+EpEtVdTAxsM27tO_njwjtJDap7nw@mail.gmail.com>
 <87vayhz7rc.fsf@dell.be.48ers.dk>
 <CALD51P_B9Ng0RN6f_bhqsHuJONucUE462dE14es5uM0K4P0F0w@mail.gmail.com>
Message-ID: <20160831213510.4ded8c47@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Aug 2016 08:44:27 -0500, Lijun QIN wrote:

> lrwxrwxrwx 1 root root     18 Aug 30 23:21 libtirpc.so -> libtirpc.so.1.0.10
> lrwxrwxrwx 1 root root     18 Aug 30 23:21 libtirpc.so.1 ->
> libtirpc.so.1.0.10
> -rwxr-xr-x 1 root root 101548 Aug 31 01:41 libtirpc.so.1.0.10

This looks good.

> /opt/arm_gcc_49_hf/gcc49/bin/arm-linux-gnueabihf-readelf -d sbin/init |
> grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libtirpc.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.6]

This looks good too.

I tested the following defconfig with the official Buildroot:

BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_LIBTIRPC=y

Which builds a Busybox linked against libtirpc:

$ ./output/host/usr/bin/arm-linux-gnueabihf-readelf -d output/target/sbin/init | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libtirpc.so.3]
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]

And it boots just fine:

Booting Linux on physical CPU 0x0
Initializing cgroup subsys cpuset
Linux version 4.2.0 (thomas at skate) (gcc version 4.8.3 20140320 (prerelease) (Sourcery CodeBench Lite 2014.05-29) ) #1 SMP Sat Oct 10 20:03:26 CEST 2015
CPU: ARMv7 Processor [410fc090] revision 0 (ARMv7), cr=10c5387d
CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
Machine model: V2P-CA9
Memory policy: Data cache writeback
On node 0 totalpages: 32768
free_area_init_node: node 0, pgdat 80694400, node_mem_map 87efb000
  Normal zone: 256 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 32768 pages, LIFO batch:7
CPU: All CPU(s) started in SVC mode.
PERCPU: Embedded 11 pages/cpu @87ec2000 s13952 r8192 d22912 u45056
pcpu-alloc: s13952 r8192 d22912 u45056 alloc=11*4096
pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
Kernel command line: ip=172.20.0.2 root=/dev/nfs nfsroot=172.20.0.1:/home/thomas/projets/br/root/ user_debug=31 console=ttyAMA0 loglevel=8 user_debug=31 rw
log_buf_len individual max cpu contribution: 4096 bytes
log_buf_len total cpu_extra contributions: 12288 bytes
log_buf_len min size: 16384 bytes
log_buf_len: 32768 bytes
early log buf free: 14844(90%)
PID hash table entries: 512 (order: -1, 2048 bytes)
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 122736K/131072K available (4879K kernel code, 155K rwdata, 1400K rodata, 268K init, 152K bss, 8336K reserved, 0K cma-reserved)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
    vmalloc : 0x88800000 - 0xff000000   (1896 MB)
    lowmem  : 0x80000000 - 0x88000000   ( 128 MB)
    modules : 0x7f000000 - 0x80000000   (  16 MB)
      .text : 0x80008000 - 0x8062a160   (6281 kB)
      .init : 0x8062b000 - 0x8066e000   ( 268 kB)
      .data : 0x8066e000 - 0x80694f00   ( 156 kB)
       .bss : 0x80697000 - 0x806bd2f8   ( 153 kB)
SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
Hierarchical RCU implementation.
	Additional per-CPU info printed with stalls.
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
sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 89478484971ns
clocksource: arm,sp804: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275 ns
Console: colour dummy device 80x30
Calibrating delay loop... 697.95 BogoMIPS (lpj=3489792)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
Setting up static identity map for 0x60008280 - 0x600082d8
Brought up 1 CPUs
SMP: Total of 1 processors activated (697.95 BogoMIPS).
CPU: All CPU(s) started in SVC mode.
devtmpfs: initialized
VFP support v0.3: implementor 41 architecture 3 part 30 variant 9 rev 0
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations
cpuidle: using governor ladder
cpuidle: using governor menu
of_amba_device_create(): amba_device_add() failed (-19) for /memory-controller at 100e0000
of_amba_device_create(): amba_device_add() failed (-19) for /memory-controller at 100e1000
of_amba_device_create(): amba_device_add() failed (-19) for /watchdog at 100e5000
of_amba_device_create(): amba_device_add() failed (-19) for /smb/motherboard/iofpga at 7,00000000/sysctl at 01000
of_amba_device_create(): amba_device_add() failed (-19) for /smb/motherboard/iofpga at 7,00000000/wdt at 0f000
hw-breakpoint: debug architecture 0x4 unsupported.
Serial: AMBA PL011 UART driver
10009000.uart: ttyAMA0 at MMIO 0x10009000 (irq = 38, base_baud = 0) is a PL011 rev1
console [ttyAMA0] enabled
1000a000.uart: ttyAMA1 at MMIO 0x1000a000 (irq = 39, base_baud = 0) is a PL011 rev1
1000b000.uart: ttyAMA2 at MMIO 0x1000b000 (irq = 40, base_baud = 0) is a PL011 rev1
1000c000.uart: ttyAMA3 at MMIO 0x1000c000 (irq = 41, base_baud = 0) is a PL011 rev1
SCSI subsystem initialized
libata version 3.00 loaded.
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
Advanced Linux Sound Architecture Driver Initialized.
clocksource: Switched to clocksource arm,sp804
NET: Registered protocol family 2
TCP established hash table entries: 1024 (order: 0, 4096 bytes)
TCP bind hash table entries: 1024 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
UDP hash table entries: 256 (order: 1, 8192 bytes)
UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
hw perfevents: enabled with armv7_cortex_a9 PMU driver, 1 counters available
futex hash table entries: 1024 (order: 4, 65536 bytes)
squashfs: version 4.0 (2009/01/31) Phillip Lougher
jffs2: version 2.2. (NAND) ? 2001-2006 Red Hat, Inc.
9p: Installing v9fs 9p2000 file system support
io scheduler noop registered (default)
clcd-pl11x 10020000.clcd: PL111 rev2 at 0x10020000
clcd-pl11x 10020000.clcd: /clcd at 10020000 hardware, 1024x768 at 59 display
Console: switching to colour frame buffer device 128x48
clcd-pl11x 1001f000.clcd: PL111 rev2 at 0x1001f000
clcd-pl11x 1001f000.clcd: /smb/motherboard/iofpga at 7,00000000/clcd at 1f000 hardware, 640x480 at 59 display
40000000.flash: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID 0x000000 Chip ID 0x000000
Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
erase region 0: offset=0x0,size=0x80000,blocks=128
40000000.flash: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID 0x000000 Chip ID 0x000000
Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
erase region 0: offset=0x0,size=0x80000,blocks=128
Concatenating MTD devices:
(0): "40000000.flash"
(1): "40000000.flash"
into device "40000000.flash"
libphy: smsc911x-mdio: probed
smsc911x 4e000000.ethernet eth0: attached PHY driver [Generic PHY] (mii_bus:phy_addr=4e000000.etherne:01, irq=-1)
smsc911x 4e000000.ethernet eth0: MAC Address: 52:54:00:12:34:56
isp1760 4f000000.usb: bus width: 32, oc: digital
isp1760 4f000000.usb: NXP ISP1760 USB Host Controller
isp1760 4f000000.usb: new USB bus registered, assigned bus number 1
isp1760 4f000000.usb: Scratch test failed.
isp1760 4f000000.usb: can't setup: -19
isp1760 4f000000.usb: USB bus 1 deregistered
usbcore: registered new interface driver usb-storage
mousedev: PS/2 mouse device common for all mice
rtc-pl031 10017000.rtc: rtc core: registered pl031 as rtc0
mmci-pl18x 10005000.mmci: Got CD GPIO
mmci-pl18x 10005000.mmci: Got WP GPIO
mmci-pl18x 10005000.mmci: No vqmmc regulator found
mmci-pl18x 10005000.mmci: mmc0: PL181 manf 41 rev0 at 0x10005000 irq 34,35 (pio)
ledtrig-cpu: registered to indicate activity on CPUs
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
aaci-pl041 10004000.aaci: ARM AC'97 Interface PL041 rev0 at 0x10004000, irq 33
aaci-pl041 10004000.aaci: FIFO 512 entries
oprofile: using arm/armv7-ca9
NET: Registered protocol family 17
9pnet: Installing 9P2000 support
Registering SWP/SWPB emulation handler
rtc-pl031 10017000.rtc: setting system clock to 2016-08-31 19:33:09 UTC (1472671989)
smsc911x 4e000000.ethernet eth0: SMSC911x/921x identified at 0x88a80000, IRQ: 31
input: AT Raw Set 2 keyboard as /devices/platform/smb/smb:motherboard/smb:motherboard:iofpga at 7,00000000/10006000.kmi/serio0/input/input0
input: ImExPS/2 Generic Explorer Mouse as /devices/platform/smb/smb:motherboard/smb:motherboard:iofpga at 7,00000000/10007000.kmi/serio1/input/input2
IP-Config: Guessing netmask 255.255.0.0
IP-Config: Complete:
     device=eth0, hwaddr=52:54:00:12:34:56, ipaddr=172.20.0.2, mask=255.255.0.0, gw=255.255.255.255
     host=172.20.0.2, domain=, nis-domain=(none)
     bootserver=255.255.255.255, rootserver=172.20.0.1, rootpath=
ALSA device list:
  #0: ARM AC'97 Interface PL041 rev0 at 0x10004000, irq 33
VFS: Mounted root (nfs filesystem) on device 0:13.
devtmpfs: mounted
Freeing unused kernel memory: 268K (8062b000 - 8066e000)
Starting logging: OK
Initializing random number generator... random: dd urandom read with 18 bits of entropy available
done.
Starting network: ip: RTNETLINK answers: File exists
FAIL

Welcome to Buildroot
buildroot login: root
# 

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
