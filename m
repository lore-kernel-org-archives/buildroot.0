From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 19 Apr 2010 14:44:30 +0000 (UTC)
Subject: [Buildroot] Still can't build working rootfs with crosstool-NG
	toolchain
Message-ID: <hqhq8e$uau$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've spend the past week trying to use crosstool-NG instead of
buildroot to build a toolchain.  I had been using external buildroot
toolchains for the past couple months with no problems. But, that is
unsupported by buildroot, and I'm giving up fighting that battle.

With crosstool-NG I can build a toolchain fine, and I can use it to
build kernels and root filesystems, but when I use a root filesystem
built with the crosstool-NG toolchain, I get a kernel panic
immediately folloing the mounting of the root filesystem.

A rootfs built by the buildroot toolchain works fine.

It's the same gcc and uClibc versions in both cases and the same
buildroot/rootfs settings.

It doesn't seem to matter which toolchain I use to build the kernel, I
get the same results with both kernels. I'm using an Atmel
AT91SAM9G20EK development board, gcc 4.4.3, uClibc 0.9.30.2.

Below the log of a failed startupt.  The log of a successful startup
using a buildroot-toolchain rootfs is identical except for two things:

  1) The successfull rootfs is 20K larger, so a few of the lines with
     memory size diagnostics are different.

  2) Instead of a kernel panic, I get welcome message and login
     prompt when using the buildroot toolchain.

Any ideas on why a rootfs built using a crosstool-ng toolchain
wouldn't work?   In general how does one troubleshoot kernel panics
like this?

Differences I can see in the toolchain configurations:

 * ct-NG uses cloog/ppl, buildroot doesn't

 * ct-NG enables __cxa_atexit, buildroot doesn't.

 * ct-NG enables c99, buildroot doesn't.

 * ct-NG enables long-long, buildroot doesn't.

 * ct-NG uses --enable-threads=posix, buildroot is just --enable-threads 

 * buildroot specifies armv5te/arm9tdmi, ct-NG doesn't

 * buildroot specifies abi=apcs-gnu, ct-NG doesn't


My ct-NG config is based on one of the "working samples" provided with
ct-NG.
  
All ideas/suggestions welcome...
  

------------------------------------------------------------------------  
RomBOOT


U-Boot 1.3.4 (Jan  6 2010 - 15:52:13)

DRAM:  64 MB
NAND:  256 MiB
DataFlash:AT45DB642
Nb pages:   8192
Page Size:   1056
Size= 8650752 bytes
Logical address: 0xD0000000
Area 0:	D0000000 to D00041FF (RO) Bootstrap
Area 1:	D0004200 to D00083FF      Environment
Area 2:	D0008400 to D0041FFF (RO) U-Boot
Area 3:	D0042000 to D0251FFF      Kernel
Area 4:	D0252000 to D083FFFF      FS
In:    serial
Out:   serial
Err:   serial
Net:   macb0
macb0: Starting autonegotiation...
macb0: Autonegotiation complete
macb0: link up, 100Mbps full-duplex (lpa: 0xc5e1)
Hit any key to stop autoboot:  3  2  1  0 
macb0: link up, 100Mbps full-duplex (lpa: 0xc5e1)
Using macb0 device
TFTP from server 10.0.0.1; our IP address is 10.0.0.98
Filename 'rootfs'.
Load address: 0x22800000
Loading: *#########################################################
done
Bytes transferred = 822110 (c8b5e hex)
macb0: link up, 100Mbps full-duplex (lpa: 0xc5e1)
Using macb0 device
TFTP from server 10.0.0.1; our IP address is 10.0.0.98
Filename 'uImage'.
Load address: 0x22200000
Loading: *#################################################################
	 ################################################
done
Bytes transferred = 1647948 (19254c hex)
## Booting kernel from Legacy Image at 22200000 ...
   Image Name:   Linux-2.6.30
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1647884 Bytes =  1.6 MB
   Load Address: 20008000
   Entry Point:  20008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux.......................................................................................................... done, booting the kernel.
Linux version 2.6.30 (grante at alpha) (gcc version 4.4.3 (crosstool-NG-1.6.1) ) #5 Fri Apr 16 16:55:29 CDT 2010
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
CPU: VIVT data cache, VIVT instruction cache
Machine: Atmel AT91SAM9G20-EK
Memory policy: ECC disabled, Data cache writeback
Clocks: CPU 396 MHz, master 132 MHz, main 18.432 MHz
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256
Kernel command line: root=/dev/ram0 rw initrd=0x22800000,0xC8B5E
NR_IRQS:192
AT91: 96 gpio irqs in 3 banks
PID hash table entries: 256 (order: 8, 1024 bytes)
Console: colour dummy device 80x30
console [tty0] enabled
console [ttyS0] enabled
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 64MB = 64MB total
Memory: 60680KB available (2992K code, 266K data, 116K init, 0K highmem)
Calibrating delay loop... 197.83 BogoMIPS (lpj=989184)
Security Framework initialized
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
net_namespace: 520 bytes
NET: Registered protocol family 16
bio: create slab <bio-0> at 0
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 2048 (order: 2, 16384 bytes)
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
TCP reno registered
NET: Registered protocol family 1
Trying to unpack rootfs image as initramfs...
rootfs image is not initramfs (no cpio magic); looks like an initrd
Freeing initrd memory: 800K
NetWinder Floating Point Emulator V0.97 (double precision)
DLM (built Apr 16 2010 16:30:14) installed
JFFS2 version 2.2. (NAND) ?? 2001-2006 Red Hat, Inc.
msgmni has been set to 120
alg: No test for cipher_null (cipher_null-generic)
alg: No test for ecb(cipher_null) (ecb-cipher_null)
alg: No test for digest_null (digest_null-generic)
alg: No test for compress_null (compress_null-generic)
alg: No test for stdrng (krng)
io scheduler noop registered
io scheduler anticipatory registered (default)
atmel_usart.0: ttyS0 at MMIO 0xfefff200 (irq = 1) is a ATMEL_SERIAL
atmel_usart.1: ttyS1 at MMIO 0xfffb0000 (irq = 6) is a ATMEL_SERIAL
atmel_usart.2: ttyS2 at MMIO 0xfffb4000 (irq = 7) is a ATMEL_SERIAL
brd: module loaded
loop: module loaded
ssc ssc.0: Atmel SSC device at 0xc4878000 (irq 14)
Driver 'sd' needs updating - please use bus_type methods
MACB_mii_bus: probed
eth0: Atmel MACB at 0xfffc4000 irq 21 (3a:1f:34:08:54:54)
eth0: attached PHY driver [Davicom DM9161A] (mii_bus:phy_addr=ffffffff:00, irq=-1)
NAND device: Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND 256MiB 3,3V 8-bit)
AT91 NAND: 8-bit, Software ECC
Scanning device for bad blocks
Creating 3 MTD partitions on "atmel_nand":
0x000000000000-0x000000400000 : "Bootstrap"
0x000000400000-0x000004000000 : "Partition 1"
0x000004000000-0x000010000000 : "Partition 2"
usbmon: debugfs is not available
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
at91_ohci at91_ohci: AT91 OHCI
at91_ohci at91_ohci: new USB bus registered, assigned bus number 1
at91_ohci at91_ohci: irq 20, io mem 0x00500000
usb usb1: New USB device found, idVendor=1d6b, idProduct=0001
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: AT91 OHCI
usb usb1: Manufacturer: Linux 2.6.30 ohci_hcd
usb usb1: SerialNumber: at91
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
usbcore: registered new interface driver usbserial
USB Serial support registered for generic
usbcore: registered new interface driver usbserial_generic
usbserial: USB Serial Driver core
udc: at91_udc version 3 May 2006
mice: PS/2 mouse device common for all mice
Registered led device: ds5
Registered led device: ds1
TCP cubic registered
NET: Registered protocol family 17
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
SCTP: Hash tables configured (established 2048 bind 4096)
drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
RAMDISK: gzip image found at block 0
VFS: Mounted root (ext2 filesystem) on device 1:0.
Freeing init memory: 116K
Kernel panic - not syncing: Attempted to kill init!
Backtrace: 
[<c00296dc>] (dump_backtrace+0x0/0x114) from [<c02659e4>] (dump_stack+0x18/0x1c)
 r6:c3812c40 r5:0000000b r4:c0338314
[<c02659cc>] (dump_stack+0x0/0x1c) from [<c0265a34>] (panic+0x4c/0x114)
[<c02659e8>] (panic+0x0/0x114) from [<c003f06c>] (do_exit+0x74/0x5cc)
 r3:c03196ac r2:c3817e3c r1:00002710 r0:c02ccc39
[<c003eff8>] (do_exit+0x0/0x5cc) from [<c003f658>] (do_group_exit+0x94/0xc8)
[<c003f5c4>] (do_group_exit+0x0/0xc8) from [<c0048a90>] (get_signal_to_deliver+0x2f4/0x330)
 r4:00106001
[<c004879c>] (get_signal_to_deliver+0x0/0x330) from [<c0027e90>] (do_signal+0x5c/0x4b8)
[<c0027e34>] (do_signal+0x0/0x4b8) from [<c002831c>] (do_notify_resume+0x30/0x34)
[<c00282ec>] (do_notify_resume+0x0/0x34) from [<c0025dcc>] (work_pending+0x1c/0x20)


-- 
Grant Edwards               grant.b.edwards        Yow! This ASEXUAL PIG
                                  at               really BOILS my BLOOD
                              gmail.com            ... He's so ... so
                                                   ... URGENT!!
