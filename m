From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 5 Dec 2016 22:50:54 +0100
Subject: [Buildroot] how to activate usb keyboard?
In-Reply-To: <CAKuBZxtTd6Ew_c_q9zcteRuioJpAvhcpb8GsBV=w9C=zkb-vvA@mail.gmail.com>
References: <CAKuBZxtBUYYF2FzaFu+WQ4c=7rtixDsRb1n=NcpeMne8o+UvNQ@mail.gmail.com>
 <20161202212550.2dda6f27@gmx.net>
 <CAKuBZxum0H3oJcND9rnz_hP5A-voxZRpVzgZX-ZL0pyDQ-rmZg@mail.gmail.com>
 <20161203212413.43d8dc45@gmx.net>
 <CAKuBZxtTd6Ew_c_q9zcteRuioJpAvhcpb8GsBV=w9C=zkb-vvA@mail.gmail.com>
Message-ID: <20161205225054.7980f6c1@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Azik,

please keep the buildroot mailing list on CC...

On Sun, 4 Dec 2016 08:38:44 +0300, Azik Aziz <azizazik@gmail.com> wrote:

> Hello Friend!
> 
> It's nice to know that there is on earth sympathetic people!
> 
> Yes, I have compiled the project himself.
> 
> I used here is defchonfig brummbeere / raspi / buildroot-config /
> brummbeere-raspi-systemd.konfig
> 
> Now I think again try to clear and rebuild the project, could I have
> forgotten something.
> 
> I used the RCA Display,
> 
> ? in the future I'll look on the HDMI display
> 
> In this project, the author includes support for HDMI, I try to change
> ?onfig.txt
> 
> Once this work has done, I'll write
> 
> I'll send you the output of the console operating system is loaded
> with http://putty.org.ru/.
> 
> On the results of the work done, I'll write to you
> 

Many Thanks for the information. I did find some time to take a closer look at
the Brummbeere build system. It seems to invert/abuse the buildroot logic.
Instead of making Brummbeere a proper buildroot package it invents a
custom build logic around it resulting in a fancy mix of:

- Raspbian original SD card partitions (and rpi-firmaware files, e.g. bootcode.bin,
  fixup.dat, start.elf)
- a fixed (but old 3.18.x) buildroot compiled kernel
- a buildroot up to date root file system (git latest)
- undetermined precompiled (and checked into brummbeere git) brummbeere executable

Maybe this mix is the reason for the kernel panic shown in the other e-mail by you:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] 
Initializing cgroup subsys cpuacct
[    0.000000] Linux version 3.18.11 (root at nz-desktop) (gcc version 5.4.0 (Buildroot 2016.11-rc2-00018-gd149dae) ) #1 PREEMPT Sat Nov 19 19:31:12 MSK 2016
[    0.000000] CPU: ARMv6-compatible processor [410fb767] revision 7 (ARMv7), cr=00c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
[    0.000000] Machine model: Raspberry Pi Model B Rev 2
[    0.000000] cma: Reserved 8 MiB at 0x0b400000
[    0.000000] Memory policy: Data cache writeback
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 48768
[    0.000000] Kernel command line: dma.dmachans=0x7f35 bcm2708_fb.fbwidth=656 bcm2708_fb.fbheight=416 bcm2708.boardrev=0x4 bcm2708.serial=0xe67e6d4c smsc95xx.macaddr=B8:27:EB:7E:6D:4C bcm2708_fb.fbswap=1 bcm2708.uart_clock=48000000 vc_mem.mem_base=0xec00000 vc_mem.mem_size=0x10000000  root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200
[    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Memory: 177348K/196608K available (5891K kernel code, 348K rwdata, 1868K rodata, 332K init, 733K bss, 19260K reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xffe00000   (2048 kB)
[    0.000000]     vmalloc : 0xcc800000 - 0xff000000   ( 808 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xcc000000   ( 192 MB)
[    0.000000]     modules : 0xbf000000 - 0xc0000000   (  16 MB)
[    0.000000]       .text : 0xc0008000 - 0xc079c070   (7761 kB)
[    0.000000]       .init : 0xc079d000 - 0xc07f0000   ( 332 kB)
[    0.000000]       .data : 0xc07f0000 - 0xc0847074   ( 349 kB)
[    0.000000]        .bss : 0xc0847074 - 0xc08fe71c   ( 734 kB)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000] NR_IRQS:522
[    0.000028] sched_clock: 32 bits at 1000kHz, resolution 1000ns, wraps every 2147483648000ns
[    0.000082] Switching to timer-based delay loop, resolution 1000ns
[    0.000365] Console: colour dummy device 80x30
[    0.001391] console [tty1] enabled
[    0.001439] Calibrating delay loop (skipped), value calculated using timer frequency.. 2.00 BogoMIPS (lpj=10000)
[    0.001516] pid_max: default: 32768 minimum: 301
[    0.001889] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.001952] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.002933] Initializing cgroup subsys memory
[    0.003024] Initializing cgroup subsys devices
[    0.003082] Initializing cgroup subsys freezer
[    0.003135] Initializing cgroup subsys net_cls
[    0.003184] Initializing cgroup subsys blkio
[    0.003305] CPU: Testing write buffer coherency: ok
[    0.003424] ftrace: allocating 19153 entries in 57 pages
[    0.107426] Setting up static identity map for 0x555c30 - 0x555c68
[    0.110202] devtmpfs: initialized
[    0.128280] VFP support v0.3: implementor 41 architecture 1 part 20 variant b rev 5
[    0.131382] pinctrl core: initialized pinctrl subsystem
[    0.136592] NET: Registered protocol family 16
[    0.142320] DMA: preallocated 4096 KiB pool for atomic coherent allocations
[    0.143627] bcm2708.uart_clock = 48000000
[    0.144483] irq: no irq domain found for /soc/interrupt-controller at 7e00b200 !
[    0.144909] irq: no irq domain found for /soc/interrupt-controller at 7e00b200 !
[    0.145472] irq: no irq domain found for /soc/interrupt-controller at 7e00b200 !
[    0.145711] irq: no irq domain found for /soc/interrupt-controller at 7e00b200 !
[    0.146006] irq: no irq domain found for /soc/interrupt-controller at 7e00b200 !
[    0.146355] irq: no irq domain found for /soc/interrupt-controller at 7e00b200 !
[    0.147201] irq: no irq domain found for /soc/interrupt-controller at 7e00b200 !
[    0.147625] irq: no irq domain found for /soc/interrupt-controller at 7e00b200 !
[    0.150576] No ATAGs?
[    0.150637] hw-breakpoint: found 6 breakpoint and 1 watchpoint registers.
[    0.150696] hw-breakpoint: maximum watchpoint size is 4 bytes.
[    0.150756] mailbox: Broadcom VideoCore Mailbox driver
[    0.150952] bcm2708_vcio: mailbox at f200b880
[    0.151417] bcm_power: Broadcom power driver
[    0.151474] bcm_power_open() -> 0
[    0.151504] bcm_power_request(0, 8)
[    0.177232] bcm_mailbox_read -> 00000080, 0
[    0.177278] bcm_power_request -> 0

[    0.177486] Serial: AMBA PL011 UART driver
[    0.177768] 20201000.uart: ttyAMA0 at MMIO 0x20201000 (irq = 0, base_baud = 0) is a PL011 rev2
[    0.608002] console [ttyAMA0] enabled

[    0.681365] SCSI subsystem initialized
[    0.685518] usbcore: registered new interface driver 
usbfs
[    0.691327] usbcore: registered new interface driver hub
[    0.696841] usbcore: registered new device driver usb
[    0.703938] Switched to clocksource stc
[    0.736689] FS-Cache: Loaded
[    0.740019] CacheFiles: Loaded
[    0.759705] NET: Registered protocol family 2
[    0.765643] TCP established hash table entries: 2048 (order: 1, 8192 bytes)
[    0.772714] TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
[    0.779385] TCP: Hash tables configured (established 2048 bind 2048)
[    0.785920] TCP: reno registered
[    0.789197] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.795139] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.801827] NET: Registered protocol family 1
[    0.806901] RPC: Registered named UNIX socket transport module.
[    0.812881] RPC: Registered udp transport module.
[    0.817733] RPC: Registered tcp transport module.
[    0.822474] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.830038] hw perfevents: enabled with armv6_1176 PMU driver, 3 counters available
[    0.838261] bcm2708_dma: DMA manager at f2007000
[    0.843120] vc-mem: phys_addr:0x00000000 mem_base=0x0ec00000 mem_size:0x10000000(256 MiB)
[    0.852919] futex hash table entries: 256 (order: -1, 3072 bytes)
[    0.859450] audit: initializing netlink subsys (disabled)
[    0.865048] audit: type=2000 audit(0.630:1): initialized
[    0.885766] VFS: Disk quotas dquot_6.5.2
[    0.890140] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    0.899567] FS-Cache: Netfs 'nfs' registered for caching
[    0.906595] NFS: Registering the id_resolver key type
[    0.911774] Key type id_resolver registered
[    0.916134] Key type id_legacy registered
[    0.921478] msgmni has been set to 362
[    0.927917] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
[    0.935941] io scheduler noop registered
[    0.939929] io scheduler deadline registered
[    0.944810] io scheduler cfq registered (default)
[    0.950050] irq: no irq domain found for /soc/interrupt-controller at 7e00b200 !
[    0.959455] BCM2708FB: allocated DMA memory 4b800000
[    0.964762] BCM2708FB: allocated DMA channel 0 @ f2007000
[    0.975406] Console: switching to colour frame buffer device 82x26
[    0.987318] bcm2708-dmaengine bcm2708-dmaengine: Load BCM2835 DMA engine driver
[    0.996936] of_dma_request_slave_channel: dma-names property of node '/soc/uart at 7e201000' missing or empty
[    1.010052] uart-pl011 20201000.uart: no DMA platform data
[    1.018064] vc-cma: Videocore CMA driver
[    1.023757] vc-cma: vc_cma_base      = 0x00000000
[    1.030278] vc-cma: vc_cma_size      = 0x00000000 (0 MiB)
[    1.037437] vc-cma: vc_cma_initial   = 0x00000000 (0 MiB)
[    1.057456] brd: module loaded
[    1.069340] loop: module loaded
[    1.074711] vchiq: vchiq_init_state: slot_zero = 0xcb400000, is_master = 0
[    1.084554] Loading iSCSI transport class v2.0-870.
[    1.092691] usbcore: 
registered new interface driver smsc95xx
[    1.100498] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)

[    1.308284] Core Release: 2.80a
[    1.313118] Setting d
efault values for core params
[    1.319684] Finished setting default values for core params

[    1.527102] Using Buffer DMA mode
[    1.532059] Periodic Transfer
 Interrupt Enhancement - disabled
[    1.539605] Multiprocessor Interrupt Enhancement - disabled
[    1.546892] OTG VER PARAM: 0, OTG VER FLAG: 0
[    1.552861] Dedicated Tx FIFOs mode
[    1.558367] WARN::dwc_otg_hcd_init:1047: FIQ DMA bounce buffers: virt = 0xcb814000 dma = 0x4b814000 len=9024
[    1.571540] FIQ FSM acceleration enabled for :
[    1.571540] Non-periodic Split Transactions
[    1.571540] Periodic Split Transactions
[    1.571540] High-Speed Isochronous Endpoints
[    1.594713] WARN::hcd_init_fiq:412: FIQ on core 0 at 0xc03ff440
[    1.602322] WARN::hcd_init_fiq:413: FIQ ASM at 0xc03ff718 length 36
[    1.610273] WARN::hcd_init_fiq:438: MPHI regs_base at 0xcc806000
[    1.617991] dwc_otg bcm2708_usb: DWC OTG Controller
[    1.624597] dwc_otg bcm2708_usb: new USB bus registered, assigned bus number 1
[    1.633553] dwc_otg bcm2708_usb: irq 32, io mem 0x00000000
[    1.640755] Init: Port Power? op_state=1
[    1.646329] Init: Power Port (0)
[    1.651482] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    1.659996] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.668895] usb usb1: Product: DWC OTG Controller
[    1.675243] usb usb1: Manufacturer: Linux 3.18.11 dwc_otg_hcd
[    1.682600] usb usb1: SerialNumber: bcm2708_usb
[    1.689746] hub 1-0:1.0: USB hub found
[    1.695350] hub 1-0:1.0: 1 port detected
[    1.702055] usbcore: registered new interface driver usb-storage
[    1.710261] mousedev: PS/2 mouse device common for all mice
[    1.718355] bcm2835-cpufreq: min=700000 max=700000
[    1.725213] sdhci: Secure Digital Host Controller Interface driver
[    1.733012] sdhci: Copyright(c) Pierre Ossman
[    1.739387] DMA channels allocated for the MMC driver
[    1.784021] Load BCM2835 MMC driver
[    1.791093] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.803778] ledtrig-cpu: registered to indicate activity on CPUs
[    1.814152] hidraw: raw HID events driver (C) Jiri Kosina
[    1.825845] usbcore: registered new interface driver usbhid
[    1.835251] usbhid: USB HID core driver
[    1.843309] TCP: cubic registered
[    1.849552] Initializing XFRM netlink socket
[    1.857721] NET: Registered protocol family 17
[    1.864246] Key type dns_resolver registered
[    1.871684] registered taskstats version 1
[    1.877774] vc-sm: Videocore shared memory driver
[    1.884254] [vc_sm_connected_init]: start
[    1.891149] [vc_sm_connected_init]: end - returning 0
[    1.898259] Indeed it is in host mode hprt0 = 00021501
[    1.910551] mmc0: host does not support reading read-only switch, assuming write-enable
[    1.923209] Waiting for root device /dev/mmcblk0p2...
[    1.9
46276] mmc0: new high speed SDHC card at address 0007
[    1.964082] mmcblk0: mmc0:0007 SD32G 28.9 GiB 
[    1.975401]  mmcblk0: p1 p2
[    2.055804] EXT4-fs (mmcblk0p2): couldn't mount as ext3 due to feature incompatibilities
[    2.068990] EXT4-fs (mmcblk0p2): couldn't mount as ext2 due to feature incompatibilities
[    2.108124] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mode. Opts: (null)
[    2.119984] VFS: Mounted root (ext4 filesystem) readonly on device 179:2.
[    2.128978] usb 1-1: new high-speed USB device number 2 using dwc_otg
[    2.138143] Indeed it is in host mode hprt0 = 00001101
[    2.147602] devtmpfs: mounted
[    2.153573] Freeing unused kernel memory: 332K (c079d000 - c07f0000)
FATAL: kernel too[    2.364506] usb 1-1: New USB device found, idVendor=0424, idProduct=9512
[    2.373383] u
sb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.383840] hub 1-1:1.0: USB hub found
[    2.389967] hub 1-1:1.0: 3 ports detected

[    2.674135] usb 1-1.1: new high-speed USB device number 3 using dwc_otg

[    2.794457] usb 1-1.1: New USB device found, idVendor=0424, idProduct=ec00

[    2.803386] usb 1-1.1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.815862] smsc95xx v1.0.4
[    2.878737] smsc95xx 1-1.1:1.0 eth0: register 'smsc95xx' at usb-bcm2708_usb-1.1, smsc95xx USB 2.0 Ethernet, b8:27:eb:7e:6d:4c

[    2.974139] usb 1-1.2: new low-speed USB device number 4 using dwc_otg

[    3.112246] usb 1-1.2: New USB device found, idVendor=040b, idProduct
=2000
[    3.121273] usb 1-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    3.130616] usb 1-1.2: Product: USB Keyboard
[    3.136822] usb 1-1.2: Manufacturer: Generic
[    3.159590] input: Generic USB Keyboard as /devices/platform/bcm2708_usb/usb1/1-1/1-1.2/1-1.2:1.0/0003:040B:2000.0001/input/input0
[    3.175768] hid-generic 0003:040B:2000.0001: input,hidraw0: USB HID v1.10 Keyboard [Generic USB Keyboard] on usb-bcm2708_usb-1.2/input0
[    3.219705] input: Generic USB Keyboard as /devices/platform/bcm2708_usb/usb1/1-1/1-1.2/1-1.2:1.1/0003:040B:2000.0002/input/input1
[    3.236356] hid-generic 0003:040B:2000.0002: input,hidraw1: USB HID v1.10 Mouse [Generic USB Keyboard] on usb-bcm2708_usb-1.2/input1

[   16.583052] random: nonblocking pool is initialized

[   32.214191] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00

[   32.214191] 
[   32.229389] CPU: 0 PID: 1 Comm: init Not tainted 3.18.11 #1
[   32.237042] [<c0016270>] (unwind_backtrace) from [<c0012e40>] (show_stack+0x20/0x24)
[   32.248780] [<c0012e40>] (show_stack) from [<c054ea6c>] (dump_stack+0x20/0x28)
[   32.258096] [<c054ea6c>] (dump_stack) from [<c054d7f8>] (panic+0xa4/0x218)
[   32.267034] [<c054d7f8>] (panic) from [<c00267c4>] (do_exit+0xa1c/0xa54)
[   32.275815] [<c00267c4>] (do_exit) from [<c0026894>] (do_group_exit+0x4c/0xe8)
[   32.285127] [<c0026894>] (do_group_exit) from [<c0026950>] (__wake_up_parent+0x0/0x30)
[   32.297155] [<c0026950>] (__wake_up_parent) from [<c000e960>] (ret_fast_syscall+0x0/0x48)
[   32.309455] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00
[   32.309455] 


If I find some time I can provide a preliminary patch providing a brummbeere buildroot
patch avoiding the origina brummbeere build system...

Regards,
Peter


> With good wishes, Azik!
> 
> 
> 2016-12-03 23:24 GMT+03:00, Peter Seiderer <ps.report@gmx.net>:
> > Hello Azik,
> >
> > please keep the buildroot mailing list on CC...
> >
> > On Sat, 3 Dec 2016 11:32:54 +0300, Azik Aziz <azizazik@gmail.com> wrote:
> >
> >> Hello Friend!
> >>
> >> I am using this assembly here https://github.com/pbouda/brummbeere
> >>
> >> I'm here this board
> >> https://cdn.sparkfun.com//assets/parts/7/4/9/7/11546-01.jpg
> >>
> >> This assembly is tuned to the operating system quick boot
> >>
> >
> > Nice and interesting project....but will decrease your chance to get help
> > because
> > it is not a original (and up to date) buildroot release...
> >
> > But never less maybe I can give you some help ;-)
> >
> > Did you compile the compile brummbeere yourself? Using which defconfig?
> >
> > Did your mean the console on the attached LCD Display or console on the HDMI
> > port?
> >
> > I observed (with another project but similar LCD) the the HDMI console stops
> > working
> > when the LCD kernel support module is loaded (no more output on HDMI
> > console) but
> > everything worked well without the LCD kernel module...
> >
> > In my case (blind) login via the USB keyboard worked, easy to test:
> > - login (blind) as root
> > - type 'reboot' and press enter and wait for reboot (or first login
> > otherwise
> >   (vial network or serial console or on the LCD if possible and start 'tail
> > -f /var/log/messages')
> >
> > Regards,
> > Peter
> >
> >> 2016-12-02 23:25 GMT+03:00, Peter Seiderer <ps.report@gmx.net>:
> >> > Hello Azik,
> >> >
> >> > On Fri, 2 Dec 2016 08:38:34 +0300, Azik Aziz <azizazik@gmail.com>
> >> > wrote:
> >> >
> >> >> Hi!
> >> >>
> >> >> There is a ready assembled, the image buildroot rpi.
> >> >>
> >> >> I can not enter a command through a usb keypad (I can not type the
> >> >> command).
> >> >>
> >> >> Can not write command and the console (I can not type the command).
> >> >>
> >> >> linux terminal is operating normally
> >> >>
> >> >> I can see through the system load monitor rca
> >> >>
> >> >> I can see the way the system load through the console putty
> >> >>
> >> >> On keyboard working ctrl-alt-del for reset only
> >> >>
> >> >> how to enter the command on console?
> >> >>
> >> >> how to activate usb keyboard?
> >> >
> >> > Mhhh, should work out of the box, but there were some problems
> >> > regarding
> >> > console working with RPi's in the past...
> >> >
> >> > Which RPi board? A/B/B+ Rpi3 etc? Which buildroot version? Which
> >> > defconfig used?
> >> >
> >> > Regards,
> >> > Peter
> >> >
> >> >
> >> >> _______________________________________________
> >> >> buildroot mailing list
> >> >> buildroot at busybox.net
> >> >> http://lists.busybox.net/mailman/listinfo/buildroot
> >> >
> >> >
> >
> >
