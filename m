From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 24 Aug 2009 20:53:25 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901C55101@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com><20090819214237.534c433f@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com><20090819233037.1d8e5a5d@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA4AD@mi8nycmail19.Mi8.com><20090820143514.7c5e56a2@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA58B@mi8nycmail19.Mi8.com><BD79186B4FD85F4B8E60E381CAEE190901BEA5DB@mi8nycmail19.Mi8.com><BD79186B4FD85F4B8E60E381CAEE190901BEA675@mi8nycmail19.Mi8.com><20090821114447.188fc839@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA738@mi8nycmail19.Mi8.com><20090822011906.2dd045fc@surf><BD79186B4FD85F4B8E60E381CAEE19091E7909@mi8nycmail19.Mi8.com><20090822105505.27ace9b6@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA86D@mi8nycmail19.Mi8.com><20090823081702.445b1b5a@surf><BD79186B4FD85F4B8E60E381CAEE190901C550E7@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C55101@mi8nycmail19.Mi8.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901C551E6@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, 

Well, I have verified that the 2.6.30.5 kernel compiled with the
CodeSourcery toolchain is not the issue.

I finally found an old rootfs on my system that was originally
built for kernel 2.6.20.4 with the oabi toolchain provided by
Cirrus Logic.  That rootfs starts fine until the init process
tries to load a kernel module then it of course dies.  But the
other init shells start fine and busybox works on those terminals:
  tty1 - on-board LCD controller + USB keyboard
  tty2 - on-board LCD controller + USB keyboard
  ttyAM0 - UART0 serial port

My boot terminal is actually ttyAM2, that's the one that locks up.
Here's part of the boot messages.

Linux version 2.6.30.5 (bigguiness at etch) (gcc version 4.3.3 (Sourcery G++ Lite 2009q1-203) ) #13 PREEMPT Mon Aug 24 09:42:11 MST 2009
CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=c0007177
CPU: VIVT data cache, VIVT instruction cache
Machine: Vision Engraving Systems EP9307 SoM
Memory policy: ECC disabled, Data cache writeback
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16192
Kernel command line: root=/dev/ram console=ttyAM2 video=ep93xx-fb:640x480-16 at 60
...
Console: switching to colour frame buffer device 80x30
graphics fb0: registered. Mode = 640x480-16
Serial: AMBA driver
apb:uart1: ttyAM0 at MMIO 0x808c0000 (irq = 52) is a AMBA
apb:uart2: ttyAM1 at MMIO 0x808d0000 (irq = 54) is a AMBA
apb:uart3: ttyAM2 at MMIO 0x808e0000 (irq = 55) is a AMBA
console [ttyAM2] enabled
...
RAMDISK: gzip image found at block 0
usb 1-1: configuration #1 chosen from 1 choice
VFS: Mounted root (ext2 filesystem) on device 1:0.
Freeing init memory: 120K
input: HID 04d9:1203 as /devices/platform/ep93xx-ohci/usb1/1-1/1-1:1.0/input/input2
generic-usb 0003:04D9:1203.0001: input: USB HID v1.11 Keyboard [HID 04d9:1203] on usb-ep93xx-1/input0
input: HID 04d9:1203 as /devices/platform/ep93xx-ohci/usb1/1-1/1-1:1.1/input/input3
generic-usb 0003:04D9:1203.0002: input: USB HID v1.11 Device [HID 04d9:1203] on usb-ep93xx-1/input1
run_init_process: /sbin/init
lirc_edb9307A: version magic '2.6.20.4 preempt mod_unload ARMv4 ' should be '2.6.30.5 preempt mod_unload ARMv4 '

I have been messing around with ext-tool.mk and package/Makefile.in
trying to figure out what is missing/needed to get the external
multilib toolchain to work correctly.  Unfortunately I think I'm
way over my head.

Have you had any other ideas on this?

Thanks for all your help,
Hartley
