From: bruce bushby <bruce.bushby@gmail.com>
Date: Fri, 18 Feb 2011 18:21:22 +0000
Subject: [Buildroot] Kernel refuses to boot
Message-ID: <AANLkTinMo+hCnOUmVdKb+pB_G1rX8zLzGhm5y+8VY-1P@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I'm very new to embedded linux and buildroot....although already addicted.

I've spent the past month trying to boot a kernel on one of Telit's modules
(GE863-PRO) and am sad to say I have progressed no further then the first
two hours :) so I must be missing some fundamental key...hence this email.

I have tried various kernel configurations via buildroot, I have also
downloaded pre-compiled kernels from the linux4sam site....think I also
tried a few others which were aimed at "at91sam9260" and they all do exactly
same thing......after uncompressing the kernel they print garbage....and
after a while return to the uboot prompt.

Any hints or pointers would be appreciated. I understand this is perhaps not
the right forum for such a discussion.

I noticed that when I use the vendors "build framework" ...the kernel
".config" boot cmd is different to  my "buildroot" kernel .config:

My "buildroot" /opt/buildroot/output/build/linux-2.6.33.7/.config
contains:
CONFIG_CMDLINE="console=ttyS0,115200 mem=8M rootfstype=jffs2
root=/dev/mtdblock1 rw
mtdparts=spi0.1-AT45DB321x:1221k(ARMboot)ro,- at 1221k(root)"

But the vendors kernel .config has:
CONFIG_CMDLINE="console=ttyS0,115200 mem=64M ver=4384k icofat=257k
rootfstype=jffs2 root=/dev/mtdblock1 rw
mtdparts=at91_nand:7936k(ARMboot)ro,- at 7936k(root)

The module has 64MB RAM and 128MB flash


Because I can't see an error message due to the garbage...I have no idea
whats going wrong....do I need learn about jtag?


Any tips...pointers or even key words I can search for would be appreciated.
The vendors kernel does have custom code and drivers....but I would expect
at least a couple of "kernel version" lines before it starts bombing....I
always get garbage :(  Any help would be much appreciate........feel free to
ssh in and see the garbage first hand :)


This is what I get with every iteration of kernel...with or without the "RT"
patch:

U-Boot> boot
phy_id 22 found at 1
macb0: link up, 100Mbps full-duplex (lpa: 0xcde1)
Using macb0 device
TFTP from server 192.100.1.106; our IP address is 192.100.1.102
Filename 'uImage'.
Load address: 0x20200000
Loading: #################################################################
#################################################################
#################################################################
########################
done
Bytes transferred = 1120756 (1119f4 hex)
## Booting image at 20200000 ...
Image Name: Linux-2.6.33.7.2-rt30
Image Type: ARM Linux Kernel Image (uncompressed)
Data Size: 1120692 Bytes = 1.1 MB
Load Address: 20008000
Entry Point: 20008000
Verifying Checksum ... OK
Loading Kernel Image ... OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
???





It's supposed to look something like this:




U-Boot> boot
phy_id 22 found at 1
macb0: link up, 100Mbps full-duplex (lpa: 0xcde1)
Using macb0 device
TFTP from server 192.100.1.106; our IP address is 192.100.1.102
Filename 'uImage'.
Load address: 0x20200000
Loading: #################################################################
         #################################################################
         #################################################################
         ############################################################
done
Bytes transferred = 1302236 (13dedc hex)
## Booting image at 20200000 ...
   Image Name:   Linux-2.6.24-rc5-akerue
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1302172 Bytes =  1.2 MB
   Load Address: 20008000
   Entry Point:  20008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK

Starting kernel ...

Uncompressing
Linux......................................................................................
done, booting the kernel.
Linux version 2.6.24-rc5-akerue (root at togni) (gcc version 4.2.4) #38 PREEMPT
RT Tue Mar 24 15:22:54 CET 2009 Telit-B0.01.09
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
Machine: Telit CS1275
Memory policy: ECC disabled, Data cache writeback
Clocks: CPU 200 MHz, master 100 MHz, main 6.000 MHz
Clocks: MCK 100 MHz
CPU0: D VIVT write-back cache
CPU0: I cache: 8192 bytes, associativity 4, 32 byte lines, 64 sets
CPU0: D cache: 8192 bytes, associativity 4, 32 byte lines, 64 sets
Real-Time Preemption Support (C) 2004-2007 Ingo Molnar
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256
Kernel command line: console=ttyS0,115200 mem=64M ver=4384k icofat=257k
rootfstype=jffs2 root=/dev/mtdblock1 rw
mtdparts=at91_nand:7936k(ARMboot)ro,- at 7936k(root)
WARNING: experimental RCU implementation.
AT91: 96 gpio irqs in 3 banks
PID hash table entries: 256 (order: 8, 1024 bytes)
Console: colour dummy device 80x30
console [ttyS0] enabled
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 64MB = 64MB total
Memory: 62116KB available (2388K code, 246K data, 116K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
net_namespace: 76 bytes
NET: Registered protocol family 16
AT91: Power Management (with slow clock mode)
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 2048 (order: 2, 16384 bytes)
TCP bind hash table entries: 2048 (order: 3, 57344 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
TCP reno registered
NetWinder Floating Point Emulator V0.97 (double precision)
krcupreemptd setsched 0
  prio = 98
JFFS2 version 2.2. (NAND) (SUMMARY)  ??? 2001-2006 Red Hat, Inc.
io scheduler noop registered (default)
io scheduler anticipatory registered
atmel_usart.0: ttyS0 at MMIO 0xfefff200 (irq = 1) is a ATMEL_SERIAL
atmel_usart.1: ttyS1 at MMIO 0xfffb0000 (irq = 6) is a ATMEL_SERIAL
atmel_usart.2: ttyS2 at MMIO 0xfffb4000 (irq = 7) is a ATMEL_SERIAL
atmel_usart.3: ttyS3 at MMIO 0xfffb8000 (irq = 8) is a ATMEL_SERIAL
atmel_usart.4: ttyS4 at MMIO 0xfffd0000 (irq = 23) is a ATMEL_SERIAL
atmel_usart.5: ttyS5 at MMIO 0xfffd4000 (irq = 24) is a ATMEL_SERIAL
RAMDISK driver initialized: 1 RAM disks of 8192K size 1024 blocksize
PPP generic driver version 2.4.2
PPP Deflate Compression module registered
NET: Registered protocol family 24
MACB_mii_bus: probed
eth0: Atmel MACB at 0xfffc4000 irq 21 (92:00:01:02:00:00)
eth0: attached PHY driver [Generic PHY] (mii_bus:phy_addr=ffffffff:01,
irq=-1)
Linux video capture interface: v2.00
atmel_spi atmel_spi.0: Atmel SPI Controller at 0xfffc8000 (irq 12)
m25p80 spi0.0: m25p80 (1024 Kbytes)
DEBUG-CMDLINE-PART: parsing <7936k(ARMboot)ro,-@7936k(root)>
DEBUG-CMDLINE-PART: partition 1: name <root>, offset 7c0000, size ffffffff,
mask flags 0
DEBUG-CMDLINE-PART: partition 0: name <ARMboot>, offset ffffffff, size
7c0000, mask flags 400
DEBUG-CMDLINE-PART: mtdid=<at91_nand> num_parts=<2>
m25p80 spi0.2: m25p80 (1024 Kbytes)
m25p80 spi0.3: m25p80 (1024 Kbytes)
atmel_spi atmel_spi.1: Atmel SPI Controller at 0xfffcc000 (irq 13)
usbmon: debugfs is not available
at91_ohci at91_ohci: AT91 OHCI
at91_ohci at91_ohci: new USB bus registered, assigned bus number 1
at91_ohci at91_ohci: irq 20, io mem 0x00500000
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
at91_rtc at91_rtc: rtc core: registered at91_rtc as rtc0
AT91SAM9 Real Time Clock driver.
at91sam9_wdt: invalid timeout (must be between 1 and 16)
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
tc_clksrc: tc0 at 12.500 MHz
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110218/4c9a1da2/attachment-0001.html>
