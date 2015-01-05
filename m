From: Lou Crittenden <loucrittenden63@gmail.com>
Date: Mon, 5 Jan 2015 17:03:22 -0600
Subject: [Buildroot] Fwd:  [PATCH v3] linux: add fbtft kernel extension
In-Reply-To: <trinity-9aa0a0aa-dd80-4a62-a8bb-a195c3837d2c-1420497256500@3capp-gmx-bs51>
References: <trinity-9aa0a0aa-dd80-4a62-a8bb-a195c3837d2c-1420497256500@3capp-gmx-bs51>
Message-ID: <CAFGceHG3iJt2L1746hoM-O-hB_++n9Zh3g4hOWjqbkSyo49jSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, I'm using a waveshare32b. I bought it from here:
http://www.ebay.com/itm/331320440420

I didn't know this was an ili9340 device. I've tried looking up the
controller type, but it's been difficult, as they are a little sketchy. I
was able to enable this screen in raspbmc through the use of the "flexfb"
driver, as the factory raspbian image also uses this driver. The
touchscreen controller is an ads7846.

On Mon, Jan 5, 2015 at 4:34 PM, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Lou,
>
> On Mon, Jan 05, 2015 at 03:46:40PM -0600, Lou Crittenden wrote:
> > >Hello 'thebestofall007',
> >
> > >first: please use e-mail with a real name, its much nicer to answer
> > >to real persons ;-)
> >
> > >second: please keep  buildroot at busybox.net on CC, others will be
> interested
> > >in the answers too (or will answer with useful hints)...
> >
> > Sorry about that. Is this better? I hope so. If not, please let me know.
> I
> > forwarded the message to buildroot at busybox.net and changed my "send as"
> > info to my real name (I also use this account on youtube)
> >
>
> Much better now... ;-)
>
> > Those commands you posted are working fabulously and am building the
> setup
> > as I type. Does this build all the modules, or just for the adafruit
> model
> > you have in the pics?
> >
>
> With the given patch NO modules are automatically selected, you have to
> seclect what
> your need in the '$ make linux-menuconfig' step, see the fbtft help text:
>
> +       help
> +         Linux Framebuffer drivers for small TFT LCD display modules,
> +         e.g. Adafruit PiTFT displays for Raspberry Pi.
> +
> +         To enable fbtft, e.g. for Adafruit 2.8 PiTFT, enable the
> +         following kernel configuarations:
> +         - CONFIG_SPI: Device Drivers ---> SPI support
> +         - CONFIG_SPI_BCM2708: Device Drivers ---> SPI support
> +                                  ---> BCM2708 SPI controller driver
> +         - CONFIG_GPIOLIB: Device Drivers ---> GPIO Support
> +         - CONFIG_FB: Device Drives ---> Graphics support
> +                         ---> Support for frame buffer devices
> +         - CONFIG_FB_TFT: Device Drivers --->
> +                            Support for small TFT LCD display modules
> +         - CONFIG_FB_TFT_ILI9341: Device Drivers --->
> +                            Support for small TFT LCD display modules --->
> +                              FB driver for the ILI9341 LCD Controller
> +         or another FB_TFT submodule corresponding to your display.
>
> You mentioned somewhere you use a waveshare32b module? For this you need
> to enable
> submodule fb_ili9340 via CONFIG_FB_TFT_ILI9340 (translation from given
> module name
> to submodule is done in the file fbtft_device.c)...
>
> Regards,
> Peter
>
>
> >
> >
> >
> >
> >
> > ---------- Forwarded message ----------
> > From: Peter Seiderer <ps.report@gmx.net>
> > Date: Mon, Jan 5, 2015 at 7:45 AM
> > Subject: Re: [Buildroot] [PATCH v3] linux: add fbtft kernel extension
> > To: "thebestofall007 ." <loucrittenden63@gmail.com>
> > Cc: buildroot at busybox.net
> >
> >
> > Hello 'thebestofall007',
> >
> > first: please use e-mail with a real name, its much nicer to answer
> > to real persons ;-)
> >
> > second: please keep  buildroot at busybox.net on CC, others will be
> interested
> > in the answers too (or will answer with useful hints)...
> >
> > and last some real answers ;-)
> >
> > On Mon, Jan 05, 2015 at 01:48:32AM -0600, thebestofall007 . wrote:
> > > I found the patch and am in the process of applying it to buildroot. I
> > > added the path to the patch on my system to the BR2_LINUX_KERNEL_PATCH
> > > field in the make xconfig/menuconfig setup (is that how you applied the
> > > patch and got it to work?). Furthermore, fergie4000 was able to apply
> the
> > > patch to the build and got the modules to build against buildroot, as
> per
> > > here: https://github.com/notro/fbtft/issues/209#issuecomment-68645175.
> I'm
> > > scratching my head to figure out the steps to reproduce fergie's
> > successful
> > > build for my application, but I figure once I do, I bet it will be
> super
> > > easy.
> > >
> >
> > The following sequence of commands should work:
> >
> > - prepare buildroot (or use your already downloaded version):
> >         $ mkdir tmp
> >         $ cd tmp/
> >         $ wget
> > http://buildroot.uclibc.org/downloads/buildroot-2014.11.tar.bz2
> >         $ tar -xvjf buildroot-2014.11.tar.bz2
> >
> > - download my latest patch from patchwork:
> >         $ wget -O v3-linux-add-fbtft-kernel-extension.patch
> > https://patchwork.ozlabs.org/patch/425126/mbox/
> >
> > - patch the buildroot package:
> >         $ cd buildroot-2014.11/
> >         $ patch -p 1 < ../v3-linux-add-fbtft-kernel-extension.patch
> >         $ cd ..
> >
> > - start a fresch build
> >         $ mkdir build_rpi_001
> >         $ cd build_rpi_001/
> >         $ make O=$PWD -C ../buildroot-2014.11 raspberrypi_defconfig
> >
> > - and go to buildroot menuconfig, enable Kernel --> Linux Kernel
> Extensions
> > --> fbtft patch
> >         $ make menuconfig
> >         $ make
> >
> > - the linux source under
> > build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3 will be with fbtft
> > support,
> > so enable it in the linux config as described in the fbtft help text (see
> > v3-linux-add-fbtft-kernel-extension.patch):
> >         $ make linux-menuconfig
> >
> > - rebuild linux kernel and the new modules
> >         $ make
> >
> >
> > ...install it to sd card as described in
> > buildroot-2014.11/board/raspberrypi/readme.txt and test it...
> >
> > Hope the description is helpful enough?
> >
> > > Nice pictures, btw.
> >
> > ...thanks...
> >
> > Regards,
> > Peter
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150105/da12e3e5/attachment-0001.html>
