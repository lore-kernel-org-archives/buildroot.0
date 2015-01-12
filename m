From: Lou Crittenden <loucrittenden63@gmail.com>
Date: Sun, 11 Jan 2015 22:55:25 -0600
Subject: [Buildroot] Fwd: Fwd: Fwd: Fwd: [PATCH v3] linux: add fbtft
 kernel extension
In-Reply-To: <trinity-1ce487a2-4744-40b5-881f-77436e223543-1421020939196@3capp-gmx-bs65>
References: <trinity-1ce487a2-4744-40b5-881f-77436e223543-1421020939196@3capp-gmx-bs65>
Message-ID: <CAFGceHHN+TNZZVisChr2vSmfJNihcEnWSTxEuF1bit3pDDBEvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good news! The screen works, however the orientation is portrait instead of
landscape and I'd like it to be landscape. Also, how do I make this driver
load on boot so I do not have to keep loading "insmod
/lib/modules/3.12.28/kernel/
drivers/video/fbtft/fbtft_device.ko name=waveshare32b" every time, so I can
have this screen be the default? I also want to load the ads7846
touchscreen driver as well for touchscreen.

Again, thanks a bunch.

On Sun, Jan 11, 2015 at 6:02 PM, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Lou,
>
> On Sun, Jan 11, 2015 at 03:23:09PM -0600, Lou Crittenden wrote:
> > >Please do the following:
> > >$ cd  build_rpi_001
> > >$ grep -E "^CONFIG_SPI|^CONFIG_GPIO|^
> > >CONFIG_FB" build/linux-c256eb9968c8997dce47350d2075e4>2f1b3991d3/.config
> >
> > >Please send your output...
> > The output of the command is located in the attachment named "output of
> > grep -E "^CONFIG_SPi"
> >
>
> CONFIG_SPI=y
> CONFIG_SPI_MASTER=y
> CONFIG_SPI_BCM2708=m
> CONFIG_SPI_SPIDEV=y
> CONFIG_GPIO_DEVRES=y
> CONFIG_GPIOLIB=y
> CONFIG_GPIO_SYSFS=y
> CONFIG_FB=y
> CONFIG_FB_CFB_FILLRECT=y
> CONFIG_FB_CFB_COPYAREA=y
> CONFIG_FB_CFB_IMAGEBLIT=y
> CONFIG_FB_SYS_FILLRECT=y
> CONFIG_FB_SYS_COPYAREA=y
> CONFIG_FB_SYS_IMAGEBLIT=y
> CONFIG_FB_SYS_FOPS=y
> CONFIG_FB_DEFERRED_IO=y
> CONFIG_FB_BACKLIGHT=y
> CONFIG_FB_BCM2708=y
> CONFIG_FB_TFT=y
> CONFIG_FB_TFT_ILI9340=m
> CONFIG_FB_FLEX=m
> CONFIG_FB_TFT_FBTFT_DEVICE=y
>
> Looks good until 'CONFIG_FB_TFT_FBTFT_DEVICE=y', please change to
> 'CONFIG_FB_TFT_FBTFT_DEVICE=m'
> (best done with make linux-menuconfig from buildroot, will trigger the
> right rebuild on
> next make command).
>
> The problem is with 'y' fbtft_device is bulltin and configuration hase to
> be done via kernel
> commandline. If compiled as module fbtft_device.ko configuration can be
> done at module loading
> time...
>
> > the output of the command "find target/lib/modules" is located in the
> > attachment "output_of_find"
> >
>
> Looks good, beside the misssing fbtft_device.ko (see above)...
>
> > the output of the following commands are in the named attachments:
> > lsmod: lsmod
> >
> > cat /proc/cmdline: no output. Also checked that directory, and it didn't
> > contain anything.
> >
> > cat /etc/modules-load.d/fbtft.conf: fbtft.conf
> >
>
> Looks good...
>
> > cat /etc/modprobe.d/00-fbtft.conf: 00-fbtft.conf
>
> Looks good...
>
> >
> > find /lib/modules: findlibmodules
> >
>
> Looks good, beside the misssing fbtft_device.ko (see above)...
>
> > insmod fbtft_device name=waveshare32b: I get "insmod: ERROR: could not
> load
> > module fbtft_device: no such file or directory"
>
> Sorry, shoold have been:
>
> $ insmod /lib/modules/3.12.28/kernel/drivers/video/fbtft/fbtft_device.ko
> name=waveshare32b
>
> And should work when fbtft_device.ko module is build and copied to
> target....
>
> >
> > dmesg: dmesg
> >
>
> [    0.000000] Kernel command line: dma.dmachans=0x7f35
> bcm2708_fb.fbwidth=720 bcm2708_fb.fbheight=480
> +bcm2708.boardrev=0x10 bcm2708.serial=0xd81a36af
> smsc95xx.macaddr=B8:27:EB:1A:36:AF bcm2708.disk_led_gpio=47
> +bcm2708.disk_led_active_low=0 sdhci-bcm2708.emmc_clock_freq=250000000
> vc_mem.mem_base=0x1ec00000
> +vc_mem.mem_size=0x20000000  dwc_otg.fiq_fix_enable=1
> sdhci-bcm2708.sync_after_dma=0 dwc_otg.lpm_enable=0
> +console=tty1 root=/dev/mmcblk0p2 rootwait
>
> The following is missing 'fbcon=map:10 fbcon=font:VGA8x8', needed for
> automatic console output on the
> new display (after fbtft_device.ko is laoded successul), add to
> cmdline.txt if you want this feature...
>
> > ls -l /dev/fb*: dev_fb*
>
> O.k., no fbtft_device.ko loaded, no second /dev/fb1 device entry....
>
> Hope for more success after fbtft_device modules is enabled ;-)
>
> Regards,
> Peter
>
> >
> > ---------- Forwarded message ----------
> > From: Peter Seiderer <ps.report@gmx.net>
> > Date: Sun, Jan 11, 2015 at 8:04 AM
> > Subject: Re: Fwd: Fwd: Fwd: [Buildroot] [PATCH v3] linux: add fbtft
> kernel
> > extension
> > To: Lou Crittenden <loucrittenden63@gmail.com>
> > Cc: buildroot at busybox.net
> >
> >
> > Hello Lou,
> >
> > On Sat, Jan 10, 2015 at 08:00:15PM -0600, Lou Crittenden wrote:
> > > Thanks for this info. I have some questions to ask:
> > >
> > > I saw that you have updated your patch. What did you do to it?
> > >
> >
> > The downloaded patch via the described command:
> >
> >  $ wget -O v3-linux-add-fbtft-kernel-extension.patch
> > https://patchwork.ozlabs.org/patch/425126/mbox/
> >
> > was already my latest patch (Thomas did some changes on the committed
> > patch, but
> > introduced a bug, see [1][2]), but the downloaded one is good ;-).
> >
> > > Did you have to manually create the /etc/modules-load.d and
> > /etc/modprobe.d
> > > folders and the text files you named in your setup? Mine didn't have
> > those.
> > > I manually made the directories and text files as laid out but the
> device
> > > still didn't work.
> >
> > Yes you have to create this two files with the described content (thats
> why
> > I
> > wrote 'add', otherwiese it would be 'change' ;-) ).
> >
> > But I do this advice 'blindly' because I own a different display
> device...
> >
> > >
> > > How did you build the fbtft drivers in your menuconfig: as add-on
> modules
> > > (with the option asterisked) or built-in (with the option checkmarked)?
> > >
> >
> > I did enable the 'linux-menuconfig' SPI configs with 'y'/'*' (built in)
> > and the FB_TFT ones with 'm'/'M' (modules)...
> >
> > Please do the following:
> > $ cd  build_rpi_001
> > $ grep -E "^CONFIG_SPI|^CONFIG_GPIO|^CONFIG_FB"
> > build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3/.config
> >
> > Output should be like the following:
> > CONFIG_SPI=y
> > CONFIG_SPI_MASTER=y
> > CONFIG_SPI_BCM2708=y
> > CONFIG_GPIO_DEVRES=y
> > CONFIG_GPIOLIB=y
> > CONFIG_FB=y
> > CONFIG_FB_CFB_FILLRECT=y
> > CONFIG_FB_CFB_COPYAREA=y
> > CONFIG_FB_CFB_IMAGEBLIT=y
> > CONFIG_FB_SYS_FILLRECT=y
> > CONFIG_FB_SYS_COPYAREA=y
> > CONFIG_FB_SYS_IMAGEBLIT=y
> > CONFIG_FB_SYS_FOPS=y
> > CONFIG_FB_DEFERRED_IO=y
> > CONFIG_FB_BACKLIGHT=y
> > CONFIG_FB_BCM2708=y
> > CONFIG_FB_TFT=y
> > CONFIG_FB_TFT_ILI9340=m
> > CONFIG_FB_TFT_FBTFT_DEVICE=m
> >
> > Please send your output...
> >
> > > I couldn't find a "waveshare32b" model in any driver list, so I'm using
> > the
> > > "flexfb" module that my factory image uses. Still no go.
> >
> > There is now waveshare32b module, only the fbtft_device module (a helper
> > module for
> > the various displays). If you load btft_device by hand,e.g.:
> >
> > $ insmod fbtft_device name=waveshare32b
> >
> > you give your display type via the module parameter 'name=waveshare32b'
> >
> > >
> > > What I've done thus far:
> > > I used lsmod on the flexfb.ko, and while the command goes through fine
> > > without error, but nothing happens with the display (what am I missing
> > > parameters wise?). I then ran dd if=/dev/urandom of=/dev/fb1. Nothing.
> >
> > flexfb is the 'old' universal module, you have to give a lot of
> parameters
> > for your device, the way via fbtft_device is a shortcut/helper for this
> > (and added recently to fbtft for your device [3]), see file
> >
> build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3/drivers/video/fbtft/fbtft_device.c:
> >
> > 1012         }, {
> > 1013                 .name = "waveshare32b",
> > 1014                 .spi = &(struct spi_board_info) {
> > 1015                         .modalias = "fb_ili9340",
> > 1016                         .max_speed_hz = 48000000,
> > 1017                         .mode = SPI_MODE_0,
> > 1018                         .platform_data = &(struct
> fbtft_platform_data)
> > {
> > 1019                                 .display = {
> > 1020                                         .buswidth = 8,
> > 1021                                         .backlight = 1,
> > 1022                                         .init_sequence =
> > waveshare32b_init_sequence,
> > 1023                                 },
> > 1024                                 .bgr = true,
> > 1025                                 .gpios = (const struct fbtft_gpio
> []) {
> > 1026                                         { "reset", 27 },
> > 1027                                         { "dc", 22 },
> > 1028                                         {},
> > 1029                                 },
> > 1030                         }
> > 1031                 }
> > 1032         }, {
> >
> > >
> > > I ran insmod
> /lib/modules/3.12.28/kernel/drivers/video/fbtft/ili9340.ko.
> > It
> > > complains "cannot load module: no such file or directory" even if I
> use an
> > > absolute path where "ili9340.ko" is located.
> > >
> >
> > The module should be named 'fb_ili9340.ko'
> >
> > >
> > > I have my buildroot .config file in the attachments if you wish to
> take a
> > > look at my setup to compare and maybe edit/reupload.
> > >
> >
> > The buildroot .config is o.k., both options are enabled:
> > BR2_LINUX_KERNEL_EXT_FBTFT=y
> > BR2_PACKAGE_FBTFT=y
> >
> > One more try for remote debugging, please send the output of the
> > following commands from your buildroot build directory:
> >
> > $ cd build_rpi_001
> > $ grep -E "^CONFIG_SPI|^CONFIG_GPIO|^CONFIG_FB"
> > build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3/.config
> > $ find target/lib/modules
> >
> > And the output from the following commands from your Raspberry Pi device:
> >
> > $ lsmod
> > $ cat /proc/cmdline
> > $ cat /etc/modules-load.d/fbtft.conf
> > $ cat /etc/modprobe.d/00-fbtft.conf
> > $ find /lib/modules
> > $ insmod fbtft_device name=waveshare32b
> > $ dmesg
> > $ ls -l /dev/fb*
> >
> > Regards,
> > Peter
> >
> > [1]
> http://lists.busybox.net/pipermail/buildroot/2015-January/117057.html
> > [2]
> http://lists.busybox.net/pipermail/buildroot/2015-January/117062.html
> > [3]
> >
> https://github.com/notro/fbtft/commit/e67014490a9df34b9a4bf04e49c50254aebc10a8
> >
> >
> > > ---------- Forwarded message ----------
> > > From: Peter Seiderer <ps.report@gmx.net>
> > > Date: Wed, Jan 7, 2015 at 8:12 AM
> > > Subject: Aw: Fwd: Fwd: [Buildroot] [PATCH v3] linux: add fbtft kernel
> > > extension
> > > To: Lou Crittenden <loucrittenden63@gmail.com>
> > > Cc: buildroot at busybox.net
> > >
> > >
> > > Hello Lou,
> > >
> > > > Gesendet: Mittwoch, 07. Januar 2015 um 14:06 Uhr
> > > > Von: "Lou Crittenden" <loucrittenden63@gmail.com>
> > > > An: buildroot at busybox.net, "Peter Seiderer" <ps.report@gmx.net>
> > > > Betreff: Fwd: Fwd: [Buildroot] [PATCH v3] linux: add fbtft kernel
> > > extension
> > > >
> > > > Alright, I have the buildroot built and a resultant bootable system,
> but
> > > the screen doesn't initialize. Did you have to
> > > > create an /etc/modules file and the corresponding /etc/init.d script
> to
> > > load the modules/drivers at boot or something?
> > > >
> > >
> > > Sorry, forgot to mention this part in my 'instruction' e-mail (but a
> > > description was already included in [1]).
> > >
> > > For your case the following configuration changes should be needed:
> > >
> > > On the sd-card boot partition:
> > > - cmdline.txt: add 'fbcon=map:10 fbcon=font:VGA8x8'
> > >
> > > On the sd-card root partition:
> > > - add /etc/modules-load.d/fbtft.conf with 'fbtft_device'
> > > - add /etc/modprobe.d/00-fbtft.conf with 'options fbtft_device
> > > name=waveshare32b'
> > >
> > > If this works for you its fine, if not try to load the fbtft_device
> module
> > > via
> > > insmod and play with the module parameters....and take a look at the
> > > dmesg commnd output....on success a second frame buffer device /dev/fb1
> > > should
> > > be available (/dev/fb0 is the hdmi output)...
> > >
> > > $ dd if=/dev/urandom of=/dev/fb1
> > >
> > > should fill your waveshare device with random snow...
> > >
> > > Or take a look at [2] and [3], seems similare displays...
> > >
> > > Regards,
> > > Peter
> > >
> > >
> > > [1]
> http://lists.busybox.net/pipermail/buildroot/2014-December/116096.html
> > > [2] https://github.com/notro/rpi-firmware/issues/6
> > > [3]https://github.com/notro/fbtft/issues/215
> > >
> > > >
> > > > ---------- Forwarded message ----------
> > > > From: Lou Crittenden <loucrittenden63@gmail.com>
> > > > Date: Mon, Jan 5, 2015 at 5:03 PM
> > > > Subject: Re: Fwd: [Buildroot] [PATCH v3] linux: add fbtft kernel
> > extension
> > > > To: Peter Seiderer <ps.report at gmx.net[ps.report@gmx.net]>,
> > > buildroot at busybox.net[buildroot at busybox.net]
> > > >
> > > >
> > > > Yes, I'm using a waveshare32b. I bought it from here:
> > >
> http://www.ebay.com/itm/331320440420[http://www.ebay.com/itm/331320440420]
> > > >
> > > > I didn't know this was an ili9340 device. I've tried looking up the
> > > controller type, but it's been difficult, as they are a
> > > > little sketchy. I was able to enable this screen in raspbmc through
> the
> > > use of the "flexfb" driver, as the factory raspbian
> > > > image also uses this driver. The touchscreen controller is an
> ads7846.
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150111/599114ff/attachment.html>
