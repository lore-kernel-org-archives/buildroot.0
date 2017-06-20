From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 20 Jun 2017 21:19:45 +0200
Subject: [Buildroot] [PATCH 1/1] rpi0w: added support for Raspberry Pi
 Zero W
In-Reply-To: <CANv+TVOBnCqF6wdPxuiCVoRx85U3HTuzbT3h1qJKgVY2s52=xA@mail.gmail.com>
References: <1497815044-11215-1-git-send-email-yves.deweerdt.linux@gmail.com>
 <20170619222753.7655732a@windsurf.home>
 <20170619225436.58ce3391@gmx.net>
 <CANv+TVOBnCqF6wdPxuiCVoRx85U3HTuzbT3h1qJKgVY2s52=xA@mail.gmail.com>
Message-ID: <20170620211945.1033a656@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yves, Thomas,

On Tue, 20 Jun 2017 09:39:11 +0000, Yves Deweerdt <yves.deweerdt.linux@gmail.com> wrote:

> Hello Peter, Thomas,
> 
> 
> On Mon, Jun 19, 2017 at 10:54 PM Peter Seiderer <ps.report@gmx.net> wrote:
> 
> > Hello Thomas, Yves,
> >
> > On Mon, 19 Jun 2017 22:27:53 +0200, Thomas Petazzoni <
> > thomas.petazzoni at free-electrons.com> wrote:
> >
> > > Hello,
> > >
> > > On Sun, 18 Jun 2017 21:44:04 +0200, Yves Deweerdt wrote:
> > > > added a new config file for the Raspberry Pi Zero W
> > > > - added new folder for raspberrypi0w
> > > > - included the overlays in the genimage config
> > > > - add pi3-miniuart-bt overlay to the config
> > > > - add enable_uart to the config
> > > >
> > > > Signed-off-by: Yves Deweerdt <yves.deweerdt.linux@gmail.com>
> > >
> > > I am a bit confused: what do you need in this defconfig, that the
> > > existing raspberrypi0_defconfig doesn't provide?
> > >
> >
> The raspberrypi0_defconfig was not working for me because:
> - it does not install the overlay files on the vfat partition
> - it does not add the pi3-miniuart-bt overlay in the configuration
> - it does not put enable_uart=1 in the configuration
> 
> > Your proposed defconfig is using the exact same kernel version and list
> > > of Device Trees. The only differences are:
> > >
> > > +BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS=y
> > >
> > > and:
> > >
> > > +BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
> > >
> >
> > And the additional genimage line:
> >
> > +      "rpi-firmware/overlays",
> >
> > And the 'enable_uart=1' in the config.txt (Is this really needed? For the
> > Pi3 the
> > overlay solution is enough).
> >
> 
> I've tried running rpi0w without the enable_uart=1 and then I don't have
> serial, with the enable_uart=1 the console is working fine.
>  I didn't try running on rpi3 though.
> For rpi3, is it correct that it seems that when running in 64bit mode you
> should add enable_uart=1 and for 32 bit mode you don't need to add it?

Never tried the 64bit mode (yet), any reference for this?

If I remember right enable_uart and pi3-miniuart-bt overlay are
orthogonal approaches to (re-)enable the serial console? If
the overlay does not work for pi0w maybe the enable_uart=1 is
enough (care to test it?)...

Did you test it with the defconfig otherwise unchanged or with
additional changes (maybe systemd)?

Some information about it can be found at [4]...

Regards,
Peter

[4] https://www.raspberrypi.org/documentation/configuration/uart.md

> 
> See [1], [2] and [3] for the old suggestion/discussion...
> >
> > > Is this the motivation for this separate defconfig? Could the existing
> > > raspberrypi0_defconfig be extended to also work for your use case,
> > > while keeping compatibility for the RPi Zero ?
> >
> 
> We could also add the device tree overlays in the raspberrypi0 config by
> default, then there is only one difference left between rpi0 and rpi0w:
> that is that for rpi0w you need this:enable_uart=1,
> dtoverlay=pi3-miniuart-bt in the configuration.
> 
> >
> > > If not, we should remove the RPi Zero W support from
> > > raspberrypi0_defconfig, because otherwise things are pretty confusing.
> > >
> >
> right, if we choose to make a seperate rpi0w defconfig, reference to 0w
> needs to be removed from rpi0 defconfig.
> 
> 
> > Regards,
> > Peter
> >
> > [1] http://lists.busybox.net/pipermail/buildroot/2017-March/187206.html
> > [2] http://lists.busybox.net/pipermail/buildroot/2017-March/187377.html
> > [3] http://lists.busybox.net/pipermail/buildroot/2017-March/187403.html
> >
> > > Thanks!
> > >
> > > Thomas
> >
> > Kind regards,
> 
> Yves
