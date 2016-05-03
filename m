From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 3 May 2016 21:02:00 +0200
Subject: [Buildroot] [PATCH v2] raspberrypi3: fix serial console (load
 pi3-miniuart-bt overlay)
In-Reply-To: <CAFGQKxeRKWNCOH2YV0FYA17tdfyeemv3Xau2Bkrzmrxh5Rm-4g@mail.gmail.com>
References: <1462220744-6368-1-git-send-email-ps.report@gmx.net>
 <CALtfCQZowiGZUJ0HV4oTyRMfMY02TherviK_ZE6D4wgfUcQ3gg@mail.gmail.com>
 <871t5jr7e6.fsf@dell.be.48ers.dk>
 <CAFGQKxeRKWNCOH2YV0FYA17tdfyeemv3Xau2Bkrzmrxh5Rm-4g@mail.gmail.com>
Message-ID: <20160503210200.12d685a7@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Martin,

On Tue, 3 May 2016 11:23:50 +0100, Martin Bark <martin@barkynet.com> wrote:

> All,
> 
> On 3 May 2016 at 07:18, Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:
> >
> >  > Hi Peter Seiderer,
> >  > What's the difference between enabling pi3-miniuart-bt instead of
> >  > pi3-disable-bt?
> >
> >  > With pi3-disable-bt enables it works fine the serial console on (14 [TxD] &
> >  > 15 [RxD] pins).
> >
> > From the names I would guess it is the difference between completely
> > disabling access to the bluetooth module and providing access to it
> > though the secondary (mini) uart.
> >
> > The miniuart has some limitations, but I guess basic bluetooth stuff
> > should work with it.
> 
> I've got a bit lost in the rpi3 serial console issues but as i
> understand the current situation all you need to do is set
> enable_uart=1 in config.txt.  See
> https://github.com/raspberrypi/firmware/issues/553#issuecomment-199486644.
> I've not tested this.
> 
> I think you also need to change cmdline.txt to use console=serial0 as
> the pi3-miniuart-bt will replace it with the correct serial device
> (ttyAMA0 or ttyS0) depending if it's enabled or not.  See the comments
> in https://github.com/raspberrypi/linux/blob/rpi-4.1.y/arch/arm/boot/dts/overlays/pi3-miniuart-bt-overlay.dts.
> 

This works too, not sure whats the better solution, explicit via device tree overlay
or some firmware magic....

- pi3-miniuart-bt 'dmesg | grep tty':
[    0.000000] Kernel command line: 8250.nr_uarts=1 dma.dmachans=0x7f35 bcm2708_fb.fbwidth=1920 bcm2708_fb.fbheight=1200 bcm2709.boardrev=0xa02082 bcm2709.serial=0xa60340 smsc95xx.macaddr=B8:27:EB:A6:03:40 bcm2708_fb.fbswap=1 bcm2709.uart_clock=48000000 vc_mem.mem_base=0x3dc00000 vc_mem.mem_size=0x3f000000  root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200
[    0.001320] console [tty1] enabled
[    0.318181] 3f215040.uart: ttyS0 at MMIO 0x3f215040 (irq = 59, base_baud = 50000000) is a 16550
[    2.008162] 3f201000.uart: ttyAMA0 at MMIO 0x3f201000 (irq = 87, base_baud = 0) is a PL011 rev2
[    3.296233] console [ttyAMA0] enabled

- enable-uart=1, serial0 dmesg | grep tty':
[    0.000000] Kernel command line: 8250.nr_uarts=1 dma.dmachans=0x7f35 bcm2708_fb.fbwidth=1920 bcm2708_fb.fbheight=1200 bcm2709.boardrev=0xa02082 bcm2709.serial=0xa60340 smsc95xx.macaddr=B8:27:EB:A6:03:40 bcm2708_fb.fbswap=1 bcm2709.uart_clock=48000000 vc_mem.mem_base=0x3dc00000 vc_mem.mem_size=0x3f000000  root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyS0,115200
[    0.001318] console [tty1] enabled
[    0.318270] console [ttyS0] disabled
[    0.318389] 3f215040.uart: ttyS0 at MMIO 0x3f215040 (irq = 59, base_baud = 31250000) is a 16550
[    1.042714] console [ttyS0] enabled
[    3.020277] 3f201000.uart: ttyAMA0 at MMIO 0x3f201000 (irq = 87, base_baud = 0) is a PL011 rev2

Regards,
Peter


> Thanks
> 
> Martin
> 
> >
> > --
> > Venlig hilsen,
> > Peter Korsgaard
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
