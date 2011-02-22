From: =?UTF-8?Q?Zden=C4=9Bk_Materna?= <zdenek.materna@gmail.com>
Date: Tue, 22 Feb 2011 09:06:34 +0100
Subject: [Buildroot] No response after "Freeing init memory"
In-Reply-To: <AANLkTikh9tw-PuERGodGqC+aVS0dfkiyR11RGghcx=E2@mail.gmail.com>
References: <AANLkTimNjQwt1HtqQLCcnsVWtSp7=3Mb2M_00EMsdOzS@mail.gmail.com>
	<AANLkTikh9tw-PuERGodGqC+aVS0dfkiyR11RGghcx=E2@mail.gmail.com>
Message-ID: <AANLkTi=pxm_KCKqhFr0c7kMs_DU6m1wE49V5K6ShE=WQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

Marek: I added user_debug=31 to kernel command line, but I think it doesn't
show any problem. Not very long so I copy it directly into e-mail.

Charles: generic console support is set to ttyS0 and correct speed (115200).
I have default inittab. I'm not very experienced in configuring inittab, but
at first look there is nothing weird.

Daniel: line ::respawn:-/bin/sh was added to /etc/inittab and it's same -
after Freeing ... is only silence.

Buildroot and kernel configs are here:
http://sestka.zlutaponorka.com/zd/configs.zip.

Best regards,
Zdenek Materna

-------------- inittab ---------------------------------------------------

# /etc/inittab
#
# This inittab is a basic inittab sample for sysvinit, which mimics
# Buildroot's default inittab for Busybox.
id:1:initdefault:

proc::sysinit:/bin/mount -t proc proc /proc
rwmo::sysinit:/bin/mount -o remount,rw /
dpts::sysinit:/bin/mkdir -p /dev/pts
moun::sysinit:/bin/mount -a
host::sysinit:/bin/hostname -F /etc/hostname
init::sysinit:/etc/init.d/rcS

1:1:respawn:/sbin/getty 115200 tty1 # default was 38400
2:1:respawn:/sbin/getty 115200 tty2

ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL

# Logging junk
mess::sysinit:/bin/touch /var/log/messages
sysl:1:respawn:/sbin/syslogd -n -m 0
klog:1:respawn:/sbin/klogd -n

# Stuff to do for the 3-finger salute
rebo::ctrlaltdel:/sbin/reboot

# Stuff to do before rebooting
sklo:6:wait:/usr/bin/killall klogd
ssys:6:wait:/usr/bin/killall syslogd
umou:6:wait:/bin/umount -a -r
swap:6:wait:/sbin/swapoff -a

-------------- kernel log
---------------------------------------------------

 U-Boot>

printenv

ethaddr=3a:1f:34:08:54:54

bootdelay=3

baudrate=115200

#

bootcmd=cp.b 0xD004000

0 0x22200000 0x00192DA4; bootm 0x22200000

stdin=serial

stdout=serial

stderr=serial

ethact=macb0

bootargs=mem=64M console=ttyS0,115200 rootfstype=nfs root=/dev/nfs rw
nfsroot=192.168.1.37:/home/zdenal/nfsroot,v3,proto=tcp user_debug=31 ip=dhcp
init=/linuxrc

bootargs=mem=64M console=ttyS0,115200 rootfstype=nfs root=/dev/nfs rw
nfsroot=192.168.1.37:/home/zdenal/nfsroot,v3,proto=tcp user_debug=31 ip=dhcp
init=/linuxrc

Environment size: 496/16892 bytes

U-Boot>

boot

## Booting kernel from Legacy Image at 22200000 ...

Image Name:

Linux-2.6.33.7.2-rt30

Image Type: ARM Linux Kernel Image (uncompressed)

Data Size: 1650020 Bytes = 1.6 MB

Load Address: 20008000

Entry Point: 20008000

Verifying Checksum ...

OK

Loading Kernel Image ...

OK

OK

Starting kernel ...

Uncompressing Linux...

done, booting the kernel.

Linux version 2.6.33.7.2-rt30 (zdenal at Dell) (gcc version 4.5.2 (Buil

droot 2011.02-rc1-00010-ga1c787e) ) #5 PREEMPT RT Mon Feb 21 20:48:00 CET
2011

CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177

CPU: VIVT data cache, VIVT instruction cache

Machine: Olimex SAM9-L9260

Memory policy: ECC disabled, Data cache writeback

Clocks: CPU 180 MHz, master 90 MHz, main 18.432 MHz

Built 1 zonelists in Zone order, mobility grouping on. Total pages: 16256

Kernel command line: mem=64M console=ttyS0,115200 rootfstype=nfs
root=/dev/nfs rw nfsroot=192.168.1.37:/home/zdenal/nfsroot,v3,proto=tcp
user_debug=31 ip=dhcp init=/linuxrc

PID hash table entries: 256 (order: -2, 1024 bytes)

Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)

Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)

Memory: 64MB = 64MB total

Memory: 61516KB available (2864K code, 272K data, 120K init, 0K highmem)

Real-Time Preemption Support (C) 2004-2007 Ingo Molnar

Experimental preemptable hierarchical RCU implementation.

RCU-based detection of stalled CPUs is enabled.

NR_IRQS:192

AT91: 96 gpio irqs in 3 banks

Console: colour dummy device 80x30

console [ttyS0] enabled

Calibrating delay loop...

89.70 BogoMIPS (lpj=448512)

Mount-cache hash table entries: 512

CPU: Testing write buffer coherency: ok

NET: Registered protocol family 16

bio: create slab <bio-0> at 0

SCSI subsystem initialized

usbcore: registered new interface driver usbfs

usbcore: registered new interface driver hub

usbcore: registered new device driver usb

Switching to clocksource tcb_clksrc

NET: Registered protocol family 2

IP route cache hash table entries: 1024 (order: 0, 4096 bytes)

TCP established hash table entries: 2048 (order: 2, 16384 bytes)

TCP bind hash table entries: 2048 (order: 3, 57344 bytes)

TCP: Hash tables configured (established 2048 bind 2048)

TCP reno registered

UDP hash table entries: 64 (order: 0, 4096 bytes)

UDP-Lite hash table entries: 64 (order: 0, 4096 bytes)

NET: Registered protocol family 1

RPC: Registered udp transport module.

RPC: Registered tcp transport module.

RPC: Registered tcp NFSv4.1 backchannel transport module.

squashfs: version 4.0 (2009/01/31) Phillip Lougher

JFFS2 version 2.2. (NAND) (SUMMARY) \0xc2\0xa9 2001-2006 Red Hat, Inc.

JFFS2: default compression mode: priority

msgmni has been set to 120

io scheduler noop registered

io scheduler cfq registered (default)

atmel_usart.0: ttyS0 at MMIO 0xfefff200 (irq = 1) is a ATMEL_SE

RIAL

atmel_usart.1: ttyS1 at MMIO 0xfffb0000 (irq = 6) is a ATMEL_SERIAL

atmel_usart.2: ttyS2 at MMIO 0xfffb4000 (irq = 7) is a ATMEL_SERIAL

atmel_usart.3: ttyS3 at MMIO 0xfffb8000 (irq = 8) is a ATMEL_SERIAL

brd: module loaded

NAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsung NAND 512MiB 3,3V
8-bit)

Scanning device for bad blocks

Bad eraseblock 1920 at 0x00000f000000

Creating 2 MTD partitions on "atmel_nand":

0x000000000000-0x000000400000 : "Bootloader Area"

0x000000400000-0x000020000000 : "Root Filesystem"

MACB_mii_bus: probed

eth0: Atmel MACB at 0xfffc4000 irq 21 (3a:1f:34:08:54:54)

eth0: attached PHY driver [Generic PHY] (mii_bus:phy_addr=ffffffff:01,
irq=-1)

usbmon: debugfs is not available

ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver

at91_ohci at9

1_ohci: AT91 OHCI

at91_ohci at91_ohci: new USB bus registered, assigned bus number 1

at91_ohci at91_ohci: irq 20, io mem 0x00500000

hub 1-0:1.0: USB hub found

hub 1-0:1.0: 2 ports detected

Initializing USB Mass Storage driver...

usbcore: registered new interface driver usb-storage

USB Mass Storage support registered.

udc: at91_udc version 3 May 2006

g_ether gadget: using random self ethernet address

g_ether gadget: using random host ethernet address

usb0: MAC a6:82:ea:3c:57:2f

usb0: HOST MAC ce:6e:71:73:43:51

g_ether gadget: Ethernet Gadget, version: Memorial Day 2008

g_ether gadget: g_ether ready

rtc-at91sam9 at91_rtt.0: rtc core: registered at91_rtt as rtc0

IRQ 1/rtc0: IRQF_DISABLED is not guaranteed on shared IRQs

rtc-at91sam9 at91_rtt.0: rtc0: SET TIME!

Linux video capture interface: v2.00

usbcore: registered new interface driver uvcvideo

USB Video Class driver (v0.1.0)

AT91SAM9 Watchdog: sorry, watchdog is disabled

at91_wdt: probe of at91_wdt failed with error -5

TCP cubic registered

NET: Registered protocol family 17

rtc-at91sam9 at91_rtt.0: hctosys: unable to read the hardware clock

Sending DHCP requests ., OK

IP-Config: Got DHCP answer from 0.0.0.0, my a

ddress is 192.168.1.35

IP-Config: Complete:

device=eth0, addr=192.168.1.35, mask=255.255.255.0, gw=192.168.1.1,

host=192.168.1.35, domain=zyxel.com, nis-domain=(none),

bootserver=0.0.0.0, rootserver=192.168.1.37, rootpath=

Looking up port of RPC 100003/3 on 192.168.1.37

Looking up port of RPC 100005/3 on 192.168.1.37

VFS: Mounted root (nfs filesystem) on device 0:13.

Freeing init memory: 120K

eth0: link up (100/Full)


Dne 21. ?nora 2011 21:57 Belisko Marek <marek.belisko@gmail.com> napsal(a):

> Hi,
>
> 2011/2/21 Zden?k Materna <zdenek.materna@gmail.com>:
> > Hello,
> >
> > I have problem with init. Kernel boots ok, but after message "Freeing
> init
> > memory: 120K" there is no response (*), but system seems to be up (it
> > responds to ping). I tried to change init=/linuxrc to init=/hello which
> is
> > statically compiled hello world and after that I got kernel panic (**). I
> > double checked all configuration, but I couldn't find nothing weird. I
> have
> > Generic serial port configured and console is also configured in inittab.
> > All is compiled with same toolchain with EABI. Where might be problem?
> > Thanks for any advice.
> >
> > My kernel command line: mem=64M console=ttyS0,115200 root=/dev/nfs rw
> > nfsroot=192.168.1.37:/home/zdenal/nfsroot/,proto=tcp ip=dhcp
> init=/linuxrc.
> Try to add to bootargs also: user_debug=31 to see why it hangs (wrong
> mcu selection ....)
> >
> > Buildroot from git, kernel 2.6.33.7, uClibc 0.9.31, Busybox 1.18.
> >
> > * with init=/linuxrc
> >
> > VFS: Mounted root (nfs filesystem) on device 0:13.
> >
> > Freeing init memory: 120K
> >
> > eth0: link up (100/Full)
> >
> > ** With init=/hello
> >
> > VFS: Mounted root (nfs filesystem) on device 0:13.
> >
> > Freeing init memory: 120K
> >
> > Kernel panic - not syncing: Attempted to kill init!
> >
> > [<c002c934>] (unwi
> >
> > nd_backtrace+0x0/0xd0) from [<c0244c04>] (panic+0x44/0x120)
> >
> > [<c0244c04>] (panic+0x44/0x120) from [<c003e840>] (do_exit+0x68/0x5c8)
> >
> > [<c003e840>] (do_exit+0x68/0x5c8) from [<c003f080>]
> > (do_group_exit+0x90/0xc4)
> >
> > [<c003f080>] (do_group_exit+0x90/0xc4) from [<c0048c54>]
> > (get_signal_to_deliver+0x30c/0x344)
> >
> > [<c0048c54>] (get_signal_to_deliver+0x30c/0x344) from [<c00296ac>]
> > (do_signal+0x78/0x5f0)
> >
> > [<c00296ac>] (do_signal+0x78/0x5f0) from [<c002a110>]
> > (do_notify_resume+0x18/0x4c)
> >
> > [<c002a110>] (do_notify_resume+0x18/0x4c) from [<c0026f68>]
> > (work_pending+0x1c/0x20)
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
>
> thanks,
>
> marek
>
> --
> as simple and primitive as possible
> -------------------------------------------------
> Marek Belisko - OPEN-NANDRA
> Freelance Developer
>
> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
> Tel: +421 915 052 184
> skype: marekwhite
> icq: 290551086
> web: http://open-nandra.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110222/42272dd1/attachment-0001.html>
