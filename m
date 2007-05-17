From: Fernando Rodriguez <fernando@elec.gla.ac.uk>
Date: Thu, 17 May 2007 15:22:27 +0100
Subject: [Buildroot] sendto: Invalid argument
Message-ID: <464C6523.6030001@elec.gla.ac.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(Apologies for crossposting)

I am using a fresh compile of uclibc (compiled from buildroot using svn
for at91 ARM architecture).  Regardless of whether I use the dailiy
snapshot of uclibc or version 0.9.29 I get this behaviour in the target:

# ping 127.0.0.1
PING 127.0.0.1 (127.0.0.1): 56 data bytes
ping: sendto: Invalid argument



This is not specific to ping.  If I do:

# udhcpc eth0
udhcpc (v1.5.0) started
eth0: Link now 100-FullDuplex
Sending discover...
udhcpc: sendto: Invalid argument
Sending discover...
udhcpc: sendto: Invalid argument


I get the same result.  Please note that the loopback interface is
properly set, and that I can actually manually setup eth0 and ping the
interface from the outside with no problems.

Also, note that the loopback interface is properly (or am I missing
something?) setup:

# ifconfig
lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
127.0.0.0       *               255.0.0.0       U     0      0        0 lo
#



I would appreciate any help.  As additional information, here is a copy
of my boot messages:

Linux version 2.6.14-uc0 (Alan at buffy) (gcc version 3.3.2) #4 Thu May 17
12:19:44 BST 2007
CPU: ARM920Tid(wb) [41129200] revision 0 (ARMv4T)
Machine: Artila Matrix500V2
Memory policy: ECC disabled, Data cache writeback
Clocks: CPU 179 MHz, master 59 MHz, main 18.432 MHz
On node 0 totalpages: 8192
  DMA zone: 8192 pages, LIFO batch:3
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
CPU0: D VIVT write-back cache
CPU0: I cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
CPU0: D cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
Built 1 zonelists
Kernel command line: mem=32M console=ttyS0,115200
initrd=0x20800000,8192000 ramdisk_size=15360 root=/dev/ram0 rw
mtdparts=phys_mapped_flash:128k(loader)ro,128k(env)ro,1408k(linux)ro,2560k(ramdisk)ro,-(userdisk)
AT91: 128 gpio irqs in 4 banks
PID hash table entries: 256 (order: 8, 4096 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 32MB = 32MB total
Memory: 21436KB available (2269K code, 536K data, 104K init)
Calibrating delay loop... 89.70 BogoMIPS (lpj=448512)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
checking if image is initramfs...it isn't (no cpio magic); looks like an
initrd
Freeing initrd memory: 8000K
NET: Registered protocol family 16
Generic PHY: Registered new driver
SCSI subsystem initialized
usbcore: registered new driver usbfs
usbcore: registered new driver hub
NetWinder Floating Point Emulator V0.97 (extended precision)
JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
Initializing Cryptographic API
Matrix500 RTC driver.
Matrix500 GPIO Driver Loaded.
AT91 SPI driver loaded
AT91 Watchdog Timer enabled (5 seconds)
ttyS0 at MMIO 0xfefff200 (irq = 1) is a AT91_SERIAL
ttyS1 at MMIO 0xfefc0000 (irq = 6) is a AT91_SERIAL
ttyS2 at MMIO 0xfefc4000 (irq = 7) is a AT91_SERIAL
ttyS3 at MMIO 0xfefc8000 (irq = 8) is a AT91_SERIAL
ttyS4 at MMIO 0xfefcc000 (irq = 9) is a AT91_SERIAL
io scheduler noop registered
io scheduler anticipatory registered
RAMDISK driver initialized: 16 RAM disks of 15360K size 1024 blocksize
Davicom DM9161E: Registered new driver
Davicom DM9131: Registered new driver
PPP generic driver version 2.4.2
PPP BSD Compression module registered
NET: Registered protocol family 24
eth0: Link now 100-FullDuplex
eth0: AT91 ethernet at 0xfefbc000 int=24 100-FullDuplex (00:13:48:00:15:c7)
eth0: Davicom 9161AE PHY (Copper)
physmap flash device: 1000000 at 10000000
phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit bank
Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
0: offset=0x0,size=0x20000,blocks=127
1: offset=0xfe0000,size=0x8000,blocks=4
5 cmdlinepart partitions found on MTD device phys_mapped_flash
Creating 5 MTD partitions on "phys_mapped_flash":
0x00000000-0x00020000 : "loader"
0x00020000-0x00040000 : "env"
0x00040000-0x001a0000 : "linux"
0x001a0000-0x00420000 : "ramdisk"
0x00420000-0x01000000 : "userdisk"
block2mtd: version $Revision: 1.28 $
at91rm9200-ohci at91rm9200-ohci: starting AT91RM9200 OHCI USB Controller
at91rm9200-ohci at91rm9200-ohci: AT91RM9200 OHCI
at91rm9200-ohci at91rm9200-ohci: new USB bus registered, assigned bus
number 1
at91rm9200-ohci at91rm9200-ohci: irq 23, io mem 0x00300000
at91rm9200-ohci at91rm9200-ohci: resetting from state 'reset', control = 0x0
at91rm9200-ohci at91rm9200-ohci: OHCI controller state
at91rm9200-ohci at91rm9200-ohci: OHCI 1.0, NO legacy support registers
at91rm9200-ohci at91rm9200-ohci: control 0x083 HCFS=operational CBSR=3
at91rm9200-ohci at91rm9200-ohci: cmdstatus 0x00000 SOC=0
at91rm9200-ohci at91rm9200-ohci: intrstatus 0x00000044 RHSC SF
at91rm9200-ohci at91rm9200-ohci: intrenable 0x8000001a MIE UE RD WDH
at91rm9200-ohci at91rm9200-ohci: fminterval a7782edf
at91rm9200-ohci at91rm9200-ohci: hcca frame #0005
at91rm9200-ohci at91rm9200-ohci: roothub.a 02000202 POTPGT=2 NPS NDP=2(2)
at91rm9200-ohci at91rm9200-ohci: roothub.b 00000000 PPCM=0000 DR=0000
at91rm9200-ohci at91rm9200-ohci: roothub.status 00008000 DRWE
at91rm9200-ohci at91rm9200-ohci: roothub.portstatus [0] 0x00000100 PPS
at91rm9200-ohci at91rm9200-ohci: roothub.portstatus [1] 0x00000100 PPS
at91rm9200-ohci at91rm9200-ohci: created debug files
usb usb1: default language 0x0409
usb usb1: new device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: AT91RM9200 OHCI
usb usb1: Manufacturer: Linux 2.6.14-uc0 ohci_hcd
usb usb1: SerialNumber: at91rm9200
usb usb1: hotplug
usb usb1: adding 1-0:1.0 (config #1, interface 0)
usb 1-0:1.0: hotplug
hub 1-0:1.0: usb_probe_interface
hub 1-0:1.0: usb_probe_interface - got id
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
hub 1-0:1.0: standalone hub
hub 1-0:1.0: no power switching (usb 1.0)
hub 1-0:1.0: global over-current protection
hub 1-0:1.0: power on to power good time: 4ms
hub 1-0:1.0: local power source is good
hub 1-0:1.0: no over-current condition exists
hub 1-0:1.0: state 5 ports 2 chg 0000 evt 0000
usbcore: registered new driver cdc_acm
drivers/usb/class/cdc-acm.c: v0.23:USB Abstract Control Model driver for
USB modems and ISDN adapters
Initializing USB Mass Storage driver...
usbcore: registered new driver usb-storage
USB Mass Storage support registered.
usbcore: registered new driver rtusb
usbcore: registered new driver usbserial
drivers/usb/serial/usb-serial.c: USB Serial support registered for Generic
usbcore: registered new driver usbserial_generic
drivers/usb/serial/usb-serial.c: USB Serial Driver core v2.0
drivers/usb/serial/usb-serial.c: USB Serial support registered for PL-2303
usbcore: registered new driver pl2303
drivers/usb/serial/pl2303.c: Prolific PL2303 USB to serial adaptor
driver v0.12
udc: at91_udc version 8 March 2005
mice: PS/2 mouse device common for all mice
i2c /dev entries driver
Found AT91 i2c
RTC found.
EEPROM found.
AT91RM9200 MCI initialized
NET: Registered protocol family 2
IP route cache hash table entries: 512 (order: -1, 2048 bytes)
TCP established hash table entries: 2048 (order: 1, 8192 bytes)
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
TCP reno registered
ip_conntrack version 2.3 (256 buckets, 2048 max) - 220 bytes per conntrack
ctnetlink v0.90: registering with nfnetlink.
ip_tables: (C) 2000-2002 Netfilter core team
arp_tables: (C) 2002 David S. Miller
TCP bic registered
Netfilter messages via NETLINK v0.30.
NET: Registered protocol family 1
NET: Registered protocol family 17
NET: Registered protocol family 15
RAMDISK: Compressed image found at block 0
VFS: Mounted root (ext2 filesystem).
Freeing init memory: 104K
eth0: Link now 100-FullDuplex
#

As further information, I did an strace to ping 127.0.0.1, below is what
I got.

I am particularly interested in the line (alhtough this might not be the
cause for the error)

SYS_290(0x4, 0xbeedeb74, 0x40, 0, 0xb1a60) = -1 EINVAL (Invalid argument)

Maybe this is a kernel issue.  I am running:

# uname -a
Linux uclibc 2.6.14-uc0 #4 Thu May 17 12:19:44 BST 2007 armv4tl unknown


However, note that I have selected to compile against my kernel source
header files and it makes no difference.


Strace output:

execve("/bin/ping", ["ping", "127.0.0.1"], [/* 15 vars */]) = 0
mmap2(NULL, 20, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0x400
05000
stat("/etc/ld.so.cache", {st_mode=S_IFREG|0644, st_size=862, ...}) = 0
open("/etc/ld.so.cache", O_RDONLY)      = 4
mmap2(NULL, 862, PROT_READ, MAP_SHARED, 4, 0) = 0x40006000
close(4)                                = 0
open("/lib/libcrypt.so.0", O_RDONLY)    = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=12892, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x4
0007000
read(4, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\240\4\0\000"...,
4096) =
4096
mmap2(NULL, 118784, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x4000e000
mmap2(0x4000e000, 9168, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 4,
0) = 0x4
000e000
mmap2(0x40018000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 4,
0x2) =
0x40018000
mmap2(0x40019000, 70864, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYM
OUS, -1, 0) = 0x40019000
close(4)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libm.so.0", O_RDONLY)        = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=45812, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x4
0007000
read(4, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\320\22\0"...,
4096) = 40
96
mmap2(NULL, 81920, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4002b000
mmap2(0x4002b000, 42036, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 4,
0) = 0x
4002b000
mmap2(0x4003d000, 4100, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 4,
0xa) =
0x4003d000
close(4)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=30252, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x4
0007000
read(4, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0X\25\0\000"...,
4096) = 4
096
mmap2(NULL, 65536, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4003f000
mmap2(0x4003f000, 28792, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 4,
0) = 0x
4003f000
mmap2(0x4004e000, 540, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 4,
0x7) = 0
x4004e000
close(4)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=305744, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x4
0007000
read(4, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0 \253\0\000"...,
4096) =
4096
mmap2(NULL, 356352, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x4004f000
mmap2(0x4004f000, 301804, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 4,
0) = 0
x4004f000
mmap2(0x400a0000, 5172, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 4,
0x49) =
0x400a0000
mmap2(0x400a2000, 16020, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYM
OUS, -1, 0) = 0x400a2000
close(4)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=305744, ...}) = 0
close(4)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=305744, ...}) = 0
close(4)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=305744, ...}) = 0
close(4)                                = 0
munmap(0x40006000, 862)                 = 0
stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755, st_size=21096, ...}) = 0
mprotect(0x40018000, 4096, PROT_READ)   = 0
mprotect(0x4003d000, 4096, PROT_READ)   = 0
mprotect(0x400a0000, 4096, PROT_READ)   = 0
mprotect(0x4000c000, 4096, PROT_READ)   = 0
ioctl(0, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon echo
...}) =
0
ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon echo
...}) =
0
getuid32()                              = 0
getgid32()                              = 0
getpid()                                = 762
brk(0)                                  = 0xb4000
brk(0xb5000)                            = 0xb5000
write(1, "PING 127.0.0.1 (127.0.0.1): 56 d"..., 42) = 42
brk(0xb6000)                            = 0xb6000
open("/etc/protocols", O_RDONLY)        = 4
ioctl(4, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbeedeabc) = -1 ENOTTY
(Inappropriate
ioctl for device)
brk(0xb7000)                            = 0xb7000
read(4, "# /etc/protocols:\n# $Id: protoco"..., 4096) = 1191
close(4)                                = 0
SYS_281(0x2, 0x3, 0x1, 0, 0xb4040)      = 4
getuid32()                              = 0
setuid32(0)                             = 0
SYS_294(0x4, 0x1, 0x6, 0x990fc, 0x4)    = 0
SYS_294(0x4, 0x1, 0x8, 0xbeedece4, 0x4) = 0
rt_sigaction(SIGINT, {0x54160, [INT], SA_RESTART|0x4000000}, {SIG_DFL},
8) = 0
gettimeofday({72, 408666}, NULL)        = 0
SYS_290(0x4, 0xbeedeb74, 0x40, 0, 0xb1a60) = -1 EINVAL (Invalid argument)
write(2, "ping", 4)                     = 4
write(2, ": ", 2)                       = 2
write(2, "sendto", 6)                   = 6
write(2, ": ", 2)                       = 2
write(2, "Invalid argument", 16)        = 16
write(2, "\n", 1)                       = 1
exit(1)                                 = ?


Thanks :-)

Fernando Rodriguez
