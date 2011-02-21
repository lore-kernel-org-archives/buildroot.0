From: Charles Krinke <charles.krinke@gmail.com>
Date: Mon, 21 Feb 2011 14:29:35 -0800
Subject: [Buildroot] booting JFFS2 or UBIFS created with buildroot
In-Reply-To: <20110221230954.4b39da54@surf>
References: <AANLkTimrjTXp24EtKa1zPrf1j6-s-p1twWYA832PAGun@mail.gmail.com>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1F5E11D6@EXV1.corp.adtran.com>
	<AANLkTimY2pEGmkM+ZvyXSKUuaWHae=B-cQA3iC3xi_2A@mail.gmail.com>
	<20110221230954.4b39da54@surf>
Message-ID: <AANLkTik=ec9qxhe9Cwv-ZHMoLAD5Wup6=WuCUbMgkXm0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas:

First of all, I appreciate greatly the time you are taking to discuss this
issue. Thank you very much.

My flash layout is:

0xFE340000 to top of flash rootfs.jffs2 programmed here
0xFE120000 uImage here
0xFE080000 deviceTree here (1 sector)
0xFE000000 u-boot here

Now with that said, here are my recipes assuming I counted the number of
128k sectors properly for the offset to get to JFFS2 in the bootargs line.

uImage
=>protect off all
=>erase 0xFE120000 0xFE33FFFF
=>tftp 0x8000000 192.168.1.67:/tftpboot/u-Image-br0220 (built in buildroot
yesterday with all defaults)
=>cp.b 0x800000 0xFE120000 <sizeInHex>

rootfs.jffs2
=>protect off all
=>erase 0xFE340000 0xFEFFFFFF
=>tftp 0x8000000 192.168.1.67:/tftpboot/rootfs.jffs2-br0220 (built in
buildroot yesterday with all defaults)
=>cp.b 0x800000 0xFE340000 <sizeInHex>

DeviceTree previously built in OpenEmbedded and it works so I did not update
it this weekend

U-boot: Built a new u-boot.bin just now from buildroot-2010.11 with all
defaults and using the board name "MPC3232ERDB". Flashing it onto the board
with:
=>protect off all
=>erase 0xFE000000 0xFE03FFFF (two 128K sectors at the bottom of flash for
u-boot.bin)
=>tftp 0x8000000 192.168.1.67:/tftpboot/u-boot.bin-br0221 (built just now in
buildroot)
=>cp.b 0x800000 0xFE000000 0x37834   (downloaded u-boot.bin size of 227,830d
bytes)
=> reset
=>setenv ipaddr (and serverip, netmask)
=>setenv bootcmd bootm 0xFE120000 - 0xFE080000
=>setenv bootargs root=/dev/mtdblock2 rootfstype=jffs2
mtdparts=nor:1152k(U-Boot),2176k(kernel),-(JFFS2) rw console=ttyS0,115200
=>saveenv

Here is the boot of the kernel from the serial port

## Booting kernel from Legacy Image at fe120000 ...
   Image Name:   Linux-2.6.36.1
   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
   Data Size:    2018472 Bytes = 1.9 MiB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
## Flattened Device Tree blob at fe080000
   Booting using the fdt blob at 0xfe080000
   Uncompressing Kernel Image ... OK
   Loading Device Tree to 007fa000, end 007fffff ... OK
Using MPC832x RDB machine description
Linux version 2.6.36.1 (ckrinke at Yin) (gcc version 4.3.5 (Buildroot 2010.11)
) #1 Thu Feb 17 19:04:48 PST 2011
bootconsole [udbg0] enabled
setup_arch: bootmem
mpc832x_rdb_setup_arch()
arch: exit
Zone PFN ranges:
  DMA      0x00000000 -> 0x00004000
  Normal   empty
Movable zone start PFN for each node
early_node_map[1] active PFN ranges
    0: 0x00000000 -> 0x00004000
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256
Kernel command line: root=/dev/mtdblock2 rootfstype=jffs2
mtdparts=nor:1152k(U-Boot),2176k(kernel),-(JFFS2) rw console=ttyS0,115200
PID hash table entries: 256 (order: -2, 1024 bytes)
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 60704k/65536k available (3984k kernel code, 4832k reserved, 140k
data, 98k bss, 184k init)
Kernel virtual memory layout:
  * 0xfffdf000..0xfffff000  : fixmap
  * 0xfdef9000..0xfe000000  : early ioremap
  * 0xc5000000..0xfdef9000  : vmalloc & ioremap
Hierarchical RCU implementation.
        RCU-based detection of stalled CPUs is disabled.
        Verbose stalled-CPUs detection is disabled.
NR_IRQS:512 nr_irqs:512
IPIC (128 IRQ sources) at c5000700
clocksource: timebase mult[7800001] shift[22] registered
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
NET: Registered protocol family 16

PCI: Probing PCI hardware
bio: create slab <bio-0> at 0
vgaarb: loaded
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
Switching to clocksource timebase
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 2048 (order: 2, 16384 bytes)
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
TCP reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
msgmni has been set to 118
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
serial8250.0: ttyS0 at MMIO 0xe0004500 (irq = 16) is a 16550A
console [ttyS0] enabled, bootconsole disabled
console [ttyS0] enabled, bootconsole disabled
serial8250.0: ttyS1 at MMIO 0xe0004600 (irq = 17) is a 16550A
brd: module loaded
loop: module loaded
Fixed MDIO Bus: probed
ucc_geth: QE UCC Gigabit Ethernet Controller
ucc_geth: UCC2 at 0xe0103000 (irq = 23)
ucc_geth: UCC3 at 0xe0102200 (irq = 34)
Freescale PowerQUICC MII Bus: probed
usbmon: debugfs is not available
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
i2c /dev entries driver
of:mpc-i2c e0003000.i2c: timeout 1000000 us
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
TCP cubic registered
NET: Registered protocol family 17
NET: Registered protocol family 15
Registering the dns_resolver key type
drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
Root-NFS: No NFS server available, giving up.
VFS: Unable to mount root fs via NFS, trying floppy.
VFS: Cannot open root device "mtdblock2" or unknown-block(2,0)
Please append a correct "root=" boot option; here are the available
partitions:
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(2,0)
Call Trace:
[c3823ed0] [c0008270] show_stack+0x48/0x168 (unreliable)
[c3823f10] [c03049c0] panic+0xa4/0x1e4
[c3823f60] [c03b6de4] mount_block_root+0x198/0x240
[c3823fb0] [c03b70e0] prepare_namespace+0x13c/0x1d0
[c3823fd0] [c03b6258] kernel_init+0x138/0x174
[c3823ff0] [c000f21c] kernel_thread+0x4c/0x68
Rebooting in 180 seconds..

Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110221/b81b21ec/attachment.html>
