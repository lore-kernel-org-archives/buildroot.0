From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 12 May 2007 19:23:16 +0200
Subject: [Buildroot] New buildroot-atmel
Message-ID: <4645F804.3000807@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Have updated my buildroot at ftp://at91dist:distrib at 81.80.104.162/ -> AT91_Third_party..-> Linux_Host -> Source
to buildroot-atmel-2007-05-12.tar.bz2.
Also updated my u-boot 1.2.0 and dataflashboot so this needs to be deleted and reloaded from the ftp site.

Some fixes in u-boot:
1) NAND flash is now detected in my U-boot
2) SAM9263EK machine id set correctly.
3) Some cleanup of the "defenv" command
	The follwoing command sequence should boot the linux
	defenv			- generate your customized u-boot environment
	run config		- runs an autoscript wiuth further configuration
	run flash-kernel	- downloads the kernel to dataflash
	run flash-ramdisk	- downloads the ramdisk to dataflash
	run bootcmd		- start linux
4) Kernel space increased from 1.25 MB to 1.5 MB

Fixes in buildroot
1) Support for building 2.6.21.1 with Andrews patches. This is now the default.
2) A script "netcfg.sh" which sets the U-boot default ipaddr/serverip/gatewayip
   for first time u-boot programming (See make_boards.sh)
3) A problem with nm getting linux symbols from the wrong file is fixed.
4) DataflashBoot-1.05 has been modified to avoid recompiling every time.
   A new download is needed.

Big Thanks to everyone pointing out problems.


Following issues remains:
u-boot seems to be recompiled every time make is done in buildroot.

The following issues in the linux boot:


========================
"Ignoring unrecognised tag 0x54410008"
==> Anyone got a clue?

========================
atmel_lcdfb: probe of atmel_lcdfb.0 failed with error -2
==> Driver seems only to support sam9261.

========================
No NAND device found!!!
==> I think this is because I enabled OneNAND support.


========================
usbmon: debugfs is not available
==> Is this an issue?

========================
ads7846 spi0.3: external vREF for ADS7843 not specified
==> ???


========================
ALSA device list:
  No soundcards found.

========================
drivers/rtc/hctosys.c: unable to open rtc device (rtc0)


========================
mount: can't find udev in /etc/fstab
==> This is quite serious.
    I enclose my fstab. Anyone with ideas what to modify


========================
ip: RTNETLINK answers: File exists
==> Is this normal?


Full boot below.





## Booting image at 21000000 ...
   Image Name:   Linux-2.6.21.1
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1418948 Bytes =  1.4 MB
   Load Address: 20008000
   Entry Point:  20008000
   Verifying Checksum ... OK
OK

Starting kernel ...

Uncompressing Linux............................................................................................ done, booting the kernel.
Linux version 2.6.21.1 (ulf at aeglos) (gcc version 4.1.2) #1 Sat May 12 13:38:26 CEST 2007
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
Machine: Atmel AT91SAM9263-EK
Ignoring unrecognised tag 0x54410008
Memory policy: ECC disabled, Data cache writeback
Clocks: CPU 199 MHz, master 99 MHz, main 16.367 MHz
CPU0: D VIVT write-back cache
CPU0: I cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
CPU0: D cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
Built 1 zonelists.  Total pages: 16256
Kernel command line: root=/dev/ram rw initrd=0x2118C000,6000000 ramdisk_size=15360 ip=10.175.196.19:10.175.196.220:10.175.196.1:255.255.255.0 consoleMAT91: 160 gpio irqs in 5 banks
PID hash table entries: 256 (order: 8, 1024 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 64MB = 64MB total
Memory: 56032KB available (2596K code, 251K data, 120K init)
Security Framework v1.0.0 initialized
Capability LSM initialized
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
Generic PHY: Registered new driver
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
checking if image is initramfs...it isn't (bad gzip magic numbers); looks like an initrd
Freeing initrd memory: 5859K
NetWinder Floating Point Emulator V0.97 (double precision)
JFFS2 version 2.2. (NAND) (C) 2001-2006 Red Hat, Inc.
io scheduler noop registered
io scheduler anticipatory registered (default)
atmel_lcdfb: probe of atmel_lcdfb.0 failed with error -2
atmel_usart.0: ttyS0 at MMIO 0xfeffee00 (irq = 1) is a ATMEL_SERIAL
atmel_usart.1: ttyS1 at MMIO 0xfff8c000 (irq = 7) is a ATMEL_SERIAL
RAMDISK driver initialized: 16 RAM disks of 15360K size 1024 blocksize
Davicom DM9161E: Registered new driver
Davicom DM9131: Registered new driver
PPP generic driver version 2.4.2
macb macb: detected PHY at address 0 (ID 0181:b8a0)
eth0: Atmel MACB at 0xfffbc000 irq 21 (04:25:fe:ed:00:18)
NAND device: Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND 256MiB 3,3V 8-bit)
NAND bus width 16 instead 8 bit
No NAND device found!!!
atmel_spi atmel_spi.0: Atmel SPI Controller at 0xfffa4000 (irq 14)
mtd_dataflash spi0.0: AT45DB642x (8448 KBytes)
usbmon: debugfs is not available
at91_ohci at91_ohci: AT91 OHCI
at91_ohci at91_ohci: new USB bus registered, assigned bus number 1
at91_ohci at91_ohci: irq 29, io mem 0x00a00000
usb usb1: Product: AT91 OHCI
usb usb1: Manufacturer: Linux 2.6.21.1 ohci_hcd
usb usb1: SerialNumber: at91
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
usbcore: registered new interface driver usbhid
drivers/usb/input/hid-core.c: v2.6:USB HID core driver
usbcore: registered new interface driver usbserial
drivers/usb/serial/usb-serial.c: USB Serial support registered for generic
usbcore: registered new interface driver usbserial_generic
drivers/usb/serial/usb-serial.c: USB Serial Driver core
udc: at91_udc version 3 May 2006
mice: PS/2 mouse device common for all mice
ads7846 spi0.3: external vREF for ADS7843 not specified
ads7846 spi0.3: touchscreen, irq 31
input: ADS784x Touchscreen as /class/input/input0
i2c /dev entries driver
at91_i2c at91_i2c: AT91 i2c bus driver.
AT91 MMC: 4 wire bus mode not supported by this driver - using 1 wire
Advanced Linux Sound Architecture Driver Version 1.0.14rc3 (Wed Mar 14 07:25:50 2007 UTC).
ASoC version 0.13.0
ALSA device list:
  No soundcards found.
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
eth0: link down
IP-Config: Complete:
      device=eth0, addr=10.175.196.19, mask=255.255.255.0, gw=10.175.196.1,
     host=10.175.196.19, domain=, nis-domain=(none),
     bootserver=10.175.196.220, rootserver=10.175.196.220, rootpath=
RAMDISK: ext2 filesystem found at block 0
RAMDISK: Loading 5704KiB [1 disk] into ram disk... done.
VFS: Mounted root (ext2 filesystem).
Freeing init memory: 120K
mount: can't find udev in /etc/fstab
Initializing random number generator... done.
Starting network...
ip: RTNETLINK answers: File exists
Starting HPA's tftpd: done
eth0: link up, 100Mbps, full-duplex, lpa 0xC5E1



Welcome to the Erik's uClibc development environment.
at91sam9263ek login:

-- 
Best Regards,
Ulf Samuelsson
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: fstab
Url: http://busybox.net/lists/buildroot/attachments/20070512/0cfb9e04/attachment.diff 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ulf.vcf
Type: text/x-vcard
Size: 301 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070512/0cfb9e04/attachment.vcf 
