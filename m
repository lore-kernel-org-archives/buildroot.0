From: Mike Sander <msander@ripnet.com>
Date: Fri, 20 Jun 2008 22:28:57 -0400
Subject: [Buildroot] can t find root fs kernel panic
In-Reply-To: <485BC6AC.1090301@acsatlanta.com>
References: <mailman.1147.1213963958.1345.buildroot@uclibc.org>
	<485BC6AC.1090301@acsatlanta.com>
Message-ID: <485C6769.30502@ripnet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joseph G. Boike wrote:
> I'm hoping someone can help me with this.
> I'm using this morning buildroot (How do I determine the rev #?)
> Built for an Atmel at91sam9260 processor and eval board.
> I've tried using the ext2, ext2.gz and jffs root filesystems with the 
> same results.
> Below is an abridged capture from the kernel during boot.
> I've tried google, but everything I saw was related to the bootloader 
> pointing to the wrong disk.
> My u-boot invocation is:
> bootp 21500000 linux.gz; bootp 20410000 rootfs.ext2.gz; bootm 21500000
> Is the Kernel command line correct?
> (I've tried 2 different boards, so I don't think it's h/w.)
>
> Regards,
> Joe
>
> Starting kernel ...
>
> Uncompressing 
> Linux....................................................................................................
> Linux version 2.6.24.4 (JoeB at elab14_linux.localdomain) (gcc version 
> 4.2.1) #2 Fri Jun 20 10:07:40 EDT 2008
> CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
> Machine: Atmel AT91SAM9260-EK
> Memory policy: ECC disabled, Data cache writeback
> Clocks: CPU 199 MHz, master 99 MHz, main 18.432 MHz
> CPU0: D VIVT write-back cache
> CPU0: I cache: 8192 bytes, associativity 4, 32 byte lines, 64 sets
> CPU0: D cache: 8192 bytes, associativity 4, 32 byte lines, 64 sets
> Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256
> Kernel command line: mem=64M console=ttyS0,115200 
> initrd=0x20410000,3145728 root=/dev/ram0 rw
>
> Memory: 64MB = 64MB total
> Memory: 58056KB available (3352K code, 238K data, 140K init)
>
> checking if image is initramfs...it isn't (bad gzip magic numbers); 
> looks like an initrd
> Freeing initrd memory: 3072K
> NetWinder Floating Point Emulator V0.97 (double precision)
> DLM (built Jun 20 2008 09:40:47) installed
> JFS: nTxBlock = 478, nTxLock = 3824
>
> RAMDISK driver initialized: 16 RAM disks of 15360K size 1024 blocksize
>
> RAMDISK: Couldn't find valid RAM disk image starting at 0.
> List of all partitions:
> No filesystem could mount root, tried:  ext2 cramfs msdos vfat jfs
> Kernel panic - not syncing: VFS: Unable to mount root fs on 
> unknown-block(1,0)
>
>   

Joseph,

I have just grabbed todays snapshot & built for an at91sam9260ek [you're 
not specific on the exact board you are using].   Using all the default 
I can boot and mount ext2 (i'm sure others will work).   the ext2 is a 
good one to start with as the kernel has support for this in the default 
configuration.

I'm using u-boot.  I put the ext2 image 
(binaries/uclibc/rootfs.arm-20080620.ext2) at 0x21100000.   I put the 
uImage at 0x21400000.   I used the default kernel command line set up 
for this target (which has initrd at 21100000).  Its the same as yours, 
but slightly different address for the initrd.     Are you loading the 
correct file system image?  Are you putting at the correct address 
corresponding to the kernel command line (either default or supplied by 
you)?

Here is my u-boot stuff & boot log.  Maybe this might help

U-Boot>   tftp 21100000 rootfs.arm-20080620.ext2
TFTP from server 192.168.1.2; our IP address is 192.168.1.3
Filename 'rootfs.arm-20080620.ext2'.
Load address: 0x21100000
Loading: #################################################################
       #################################################################
       #################################################################
       ####T #############################################################
       #################################################################
       #################################################################
       #################################################################
       #################################################################
       #################################################################
       #################################################################
       #################################################################
       #################################################################
       #######
done
Bytes transferred = 4026368 (3d7000 hex)
U-Boot> tftp 21400000 uImage.buildroot-20080620
TFTP from server 192.168.1.2; our IP address is 192.168.1.3
Filename 'uImage.buildroot-20080620'.
Load address: 0x21400000
Loading: #################################################################
       #################################################################
       #################################################################
       ######
done
Bytes transferred = 1025408 (fa580 hex)
U-Boot> bootm
## Booting image at 21400000 ...
 Image Name:   Linux-2.6.22.1
 Image Type:   ARM Linux Kernel Image (uncompressed)
 Data Size:    1025344 Bytes = 1001.3 kB
 Load Address: 20008000
 Entry Point:  20008000
 Verifying Checksum ... OK
OK

Starting kernel ...

Uncompressing 
Linux.................................................................... 
done, booting the kernel.
Linux version 2.6.22.1 (mike at himalia) (gcc version 4.2.4) #1 Fri Jun 20 
16:53:37 EDT 2008
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
Machine: Atmel AT91SAM9260-EK
Memory policy: ECC disabled, Data cache writeback
Clocks: CPU 198 MHz, master 99 MHz, main 18.432 MHz
CPU0: D VIVT write-back cache
CPU0: I cache: 8192 bytes, associativity 4, 32 byte lines, 64 sets
CPU0: D cache: 8192 bytes, associativity 4, 32 byte lines, 64 sets
Built 1 zonelists.  Total pages: 16256
Kernel command line: mem=64M console=ttyS0,115200 
initrd=0x21100000,3145728 root=/dev/ram0 rw
AT91: 96 gpio irqs in 3 banks
PID hash table entries: 256 (order: 8, 1024 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 64MB = 64MB total
Memory: 59648KB available (1856K code, 188K data, 100K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
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
checking if image is initramfs...it isn't (bad gzip magic numbers); 
looks like an initrd
Freeing initrd memory: 3072K
NetWinder Floating Point Emulator V0.97 (double precision)
io scheduler noop registered
io scheduler anticipatory registered (default)
atmel_usart.0: ttyS0 at MMIO 0xfefff200 (irq = 1) is a ATMEL_SERIAL
atmel_usart.1: ttyS1 at MMIO 0xfffb0000 (irq = 6) is a ATMEL_SERIAL
atmel_usart.2: ttyS2 at MMIO 0xfffb4000 (irq = 7) is a ATMEL_SERIAL
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
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
udc: at91_udc version 3 May 2006
mice: PS/2 mouse device common for all mice
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
RAMDISK: ext2 filesystem found at block 0
RAMDISK: Loading 3932KiB [1 disk] into ram disk... done.
VFS: Mounted root (ext2 filesystem).
Freeing init memory: 100K
Initializing random number generator... done.
Starting network...
ip: RTNETLINK answers: File exists



Welcome to the Erik's uClibc development environment.
uclibc login: root

Mike

> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> Scanned with Copfilter Version 0.84beta3a (P3Scan 2.2.1)
> AntiSpam:  SpamAssassin 3.2.3
> by Markus Madlener @ http://www.copfilter.org
>
>   
