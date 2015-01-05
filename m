From: Lou Crittenden <loucrittenden63@gmail.com>
Date: Mon, 5 Jan 2015 15:46:40 -0600
Subject: [Buildroot] Fwd:  [PATCH v3] linux: add fbtft kernel extension
In-Reply-To: <trinity-6944499d-15ee-454d-9b65-a8c69cd62ac2-1420465542272@3capp-gmx-bs26>
References: <trinity-6944499d-15ee-454d-9b65-a8c69cd62ac2-1420465542272@3capp-gmx-bs26>
Message-ID: <CAFGceHHj0_M-mML36sfwjy8=1-2bGYgZZfrM0B8-PgOrw-Tn2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>Hello 'thebestofall007',

>first: please use e-mail with a real name, its much nicer to answer
>to real persons ;-)

>second: please keep  buildroot at busybox.net on CC, others will be interested
>in the answers too (or will answer with useful hints)...

Sorry about that. Is this better? I hope so. If not, please let me know. I
forwarded the message to buildroot at busybox.net and changed my "send as"
info to my real name (I also use this account on youtube)

Those commands you posted are working fabulously and am building the setup
as I type. Does this build all the modules, or just for the adafruit model
you have in the pics?






---------- Forwarded message ----------
From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, Jan 5, 2015 at 7:45 AM
Subject: Re: [Buildroot] [PATCH v3] linux: add fbtft kernel extension
To: "thebestofall007 ." <loucrittenden63@gmail.com>
Cc: buildroot at busybox.net


Hello 'thebestofall007',

first: please use e-mail with a real name, its much nicer to answer
to real persons ;-)

second: please keep  buildroot at busybox.net on CC, others will be interested
in the answers too (or will answer with useful hints)...

and last some real answers ;-)

On Mon, Jan 05, 2015 at 01:48:32AM -0600, thebestofall007 . wrote:
> I found the patch and am in the process of applying it to buildroot. I
> added the path to the patch on my system to the BR2_LINUX_KERNEL_PATCH
> field in the make xconfig/menuconfig setup (is that how you applied the
> patch and got it to work?). Furthermore, fergie4000 was able to apply the
> patch to the build and got the modules to build against buildroot, as per
> here: https://github.com/notro/fbtft/issues/209#issuecomment-68645175. I'm
> scratching my head to figure out the steps to reproduce fergie's
successful
> build for my application, but I figure once I do, I bet it will be super
> easy.
>

The following sequence of commands should work:

- prepare buildroot (or use your already downloaded version):
        $ mkdir tmp
        $ cd tmp/
        $ wget
http://buildroot.uclibc.org/downloads/buildroot-2014.11.tar.bz2
        $ tar -xvjf buildroot-2014.11.tar.bz2

- download my latest patch from patchwork:
        $ wget -O v3-linux-add-fbtft-kernel-extension.patch
https://patchwork.ozlabs.org/patch/425126/mbox/

- patch the buildroot package:
        $ cd buildroot-2014.11/
        $ patch -p 1 < ../v3-linux-add-fbtft-kernel-extension.patch
        $ cd ..

- start a fresch build
        $ mkdir build_rpi_001
        $ cd build_rpi_001/
        $ make O=$PWD -C ../buildroot-2014.11 raspberrypi_defconfig

- and go to buildroot menuconfig, enable Kernel --> Linux Kernel Extensions
--> fbtft patch
        $ make menuconfig
        $ make

- the linux source under
build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3 will be with fbtft
support,
so enable it in the linux config as described in the fbtft help text (see
v3-linux-add-fbtft-kernel-extension.patch):
        $ make linux-menuconfig

- rebuild linux kernel and the new modules
        $ make

...install it to sd card as described in
buildroot-2014.11/board/raspberrypi/readme.txt and test it...

Hope the description is helpful enough?

> Nice pictures, btw.

...thanks...

Regards,
Peter

>
> On Sat, Jan 3, 2015 at 2:01 PM, Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Tested with RaspberryPi B+ and PiTFT Mini Kit - 320x240 2.8" TFT
> > (see [1] and [2]) and the following target configuration changes:
> > - cmdline.txt: add 'fbcon=map:10 fbcon=font:VGA8x8'
> > - add /etc/modules-load.d/fbtft.conf with 'fbtft_device'
> > - add /etc/modprobe.d/00-fbtft.conf with 'options fbtft_device
> > name=adafruit28 rotate=90 gpios=dc:25'
> >
> > [1]
> >
http://h65951.serverkompetenz.net/PeterSeiderer/upload/PiTFT_2_8_ct/Image9893.jpg
> > [2]
> >
http://h65951.serverkompetenz.net/PeterSeiderer/upload/PiTFT_2_8_ct/Image9897.jpg
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Changes v1 -> v2:
> >   - added missing linux/linux-ext-fbtft.mk file
> >
> > Changes v2 -> v3:
> >   - removed automatic kernel configurations changes
> >   - added kernel configuration hint to linux/Config.ext.in help text
> >   - added second installation directory for linux >= 3.15
> > ---
> >  linux/Config.ext.in      | 25 +++++++++++++++++++++++++
> >  linux/linux-ext-fbtft.mk | 41 +++++++++++++++++++++++++++++++++++++++++
> >  package/Config.in        |  1 +
> >  package/fbtft/Config.in  | 13 +++++++++++++
> >  package/fbtft/fbtft.mk   | 11 +++++++++++
> >  5 files changed, 91 insertions(+)
> >  create mode 100644 linux/linux-ext-fbtft.mk
> >  create mode 100644 package/fbtft/Config.in
> >  create mode 100644 package/fbtft/fbtft.mk
> >
> > diff --git a/linux/Config.ext.in b/linux/Config.ext.in
> > index 40c4684..c31628a 100644
> > --- a/linux/Config.ext.in
> > +++ b/linux/Config.ext.in
> > @@ -42,4 +42,29 @@ config BR2_LINUX_KERNEL_EXT_RTAI_PATCH
> >         help
> >           Optionally, explicitly specify the RTAI patch to use.
> >
> > +# fbtft
> > +config BR2_LINUX_KERNEL_EXT_FBTFT
> > +       bool "fbtft patch"
> > +       select BR2_PACKAGE_FBTFT
> > +       help
> > +         Linux Framebuffer drivers for small TFT LCD display modules,
> > +         e.g. Adafruit PiTFT displays for Raspberry Pi.
> > +
> > +         To enable fbtft, e.g. for Adafruit 2.8 PiTFT, enable the
> > +         following kernel configuarations:
> > +         - CONFIG_SPI: Device Drivers ---> SPI support
> > +         - CONFIG_SPI_BCM2708: Device Drivers ---> SPI support
> > +                                  ---> BCM2708 SPI controller driver
> > +         - CONFIG_GPIOLIB: Device Drivers ---> GPIO Support
> > +         - CONFIG_FB: Device Drives ---> Graphics support
> > +                         ---> Support for frame buffer devices
> > +         - CONFIG_FB_TFT: Device Drivers --->
> > +                            Support for small TFT LCD display modules
> > +         - CONFIG_FB_TFT_ILI9341: Device Drivers --->
> > +                            Support for small TFT LCD display modules
--->
> > +                              FB driver for the ILI9341 LCD Controller
> > +         or another FB_TFT submodule corresponding to your display.
> > +
> > +         https://github.com/notro/fbtft
> > +
> >  endmenu
> > diff --git a/linux/linux-ext-fbtft.mk b/linux/linux-ext-fbtft.mk
> > new file mode 100644
> > index 0000000..d555a3f
> > --- /dev/null
> > +++ b/linux/linux-ext-fbtft.mk
> > @@ -0,0 +1,41 @@
> >
> >
+################################################################################
> > +# Linux fbtft extensions
> > +#
> > +# Patch the linux kernel with fbtft extension
> >
> >
+################################################################################
> > +
> > +ifeq ($(BR2_LINUX_KERNEL_EXT_FBTFT),y)
> > +# Add dependency to fbtft package (download helper for the fbtft
source)
> > +LINUX_DEPENDENCIES += fbtft
> > +
> > +define FBTFT_PREPARE_KERNEL
> > +       # for linux >= 3.15 install to drivers/video/fbdev/fbtft
> > +       # for linux < 3.15 install to drivers/video/fbtft
> > +       if [ -e $(LINUX_DIR)/drivers/video/fbdev ]; then \
> > +               mkdir $(LINUX_DIR)/drivers/video/fbdev/fbtft; \
> > +               $(INSTALL) $(FBTFT_DIR)/*.h \
> > +                       $(FBTFT_DIR)/*.c \
> > +                       $(FBTFT_DIR)/Makefile \
> > +                       $(FBTFT_DIR)/Kconfig \
> > +                       $(FBTFT_DIR)/README \
> > +                       $(LINUX_DIR)/drivers/video/fbdev/fbtft; \
> > +               echo 'source "drivers/video/fbdev/fbtft/Kconfig"' \
> > +                       >> $(LINUX_DIR)/drivers/video/fbdev/Kconfig; \
> > +               echo 'obj-y += fbtft/' >>
> > $(LINUX_DIR)/drivers/video/fbdev/Makefile; \
> > +       else \
> > +               mkdir $(LINUX_DIR)/drivers/video/fbtft; \
> > +               $(INSTALL) $(FBTFT_DIR)/*.h \
> > +                       $(FBTFT_DIR)/*.c \
> > +                       $(FBTFT_DIR)/Makefile \
> > +                       $(FBTFT_DIR)/Kconfig \
> > +                       $(FBTFT_DIR)/README \
> > +                       $(LINUX_DIR)/drivers/video/fbtft; \
> > +               echo 'source "drivers/video/fbtft/Kconfig"' \
> > +                       >> $(LINUX_DIR)/drivers/video/Kconfig; \
> > +               echo 'obj-y += fbtft/' >>
> > $(LINUX_DIR)/drivers/video/Makefile; \
> > +       fi
> > +endef
> > +
> > +LINUX_PRE_PATCH_HOOKS += FBTFT_PREPARE_KERNEL
> > +
> > +endif #BR2_LINUX_KERNEL_EXT_FBTFT
> > diff --git a/package/Config.in b/package/Config.in
> > index 3b37bb2..c658a28 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -311,6 +311,7 @@ endif
> >         source "package/evemu/Config.in"
> >         source "package/evtest/Config.in"
> >         source "package/fan-ctrl/Config.in"
> > +       source "package/fbtft/Config.in"
> >         source "package/fconfig/Config.in"
> >         source "package/fis/Config.in"
> >         source "package/flashrom/Config.in"
> > diff --git a/package/fbtft/Config.in b/package/fbtft/Config.in
> > new file mode 100644
> > index 0000000..eceea85
> > --- /dev/null
> > +++ b/package/fbtft/Config.in
> > @@ -0,0 +1,13 @@
> > +config BR2_PACKAGE_FBTFT
> > +       bool "fbtft"
> > +       depends on BR2_LINUX_KERNEL
> > +       help
> > +         Linux Framebuffer drivers for small TFT LCD display modules,
> > +         e.g. Adafruit PiTFT displays for Raspberry Pi.
> > +
> > +         This is only the download helper for the kernel patch.
> > +
> > +         https://github.com/notro/fbtft
> > +
> > +comment "fbtft needs a Linux kernel to be built"
> > +       depends on !BR2_LINUX_KERNEL
> > diff --git a/package/fbtft/fbtft.mk b/package/fbtft/fbtft.mk
> > new file mode 100644
> > index 0000000..9f46bdb
> > --- /dev/null
> > +++ b/package/fbtft/fbtft.mk
> > @@ -0,0 +1,11 @@
> >
> >
+################################################################################
> > +#
> > +# fbtft
> > +#
> >
> >
+################################################################################
> > +
> > +FBTFT_VERSION = 274035404701245e7491c0c6471c5b72ade4d491
> > +FBTFT_SITE = $(call github,notro,fbtft,$(FBTFT_VERSION))
> > +FBTFT_LICENSE = GPLv2+
> > +
> > +$(eval $(generic-package))
> > --
> > 2.1.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150105/90bc0744/attachment.html>
