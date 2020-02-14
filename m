From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 14 Feb 2020 12:25:37 +0530
Subject: [Buildroot] [PATCH 1/4] boot/arm-trusted-firmware: Disable bin
 copy for rk3399
In-Reply-To: <20200214052043.6ab9688f@windsurf>
References: <1581573151-18943-1-git-send-email-sunil@amarulasolutions.com>
 <1581573151-18943-2-git-send-email-sunil@amarulasolutions.com>
 <20200213072350.vwly4eganmeq57mu@bars>
 <CAMty3ZC-c0aazuTtKXF8U8B3w=_e8BeicG-hN=jLDCrqUxenFQ@mail.gmail.com>
 <20200214052043.6ab9688f@windsurf>
Message-ID: <CAMty3ZA3F6td2xwAqVLZvF5ZK+_G3kj-U89yccJCEEyM3tMzcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 14, 2020 at 9:50 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Thu, 13 Feb 2020 13:36:53 +0530
> Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> > > >  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES
> > > >       string "Binary boot images"
> > > > -     default "*.bin"
> > > > +     default "*.bin" if BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM!=rk3399
> > > >       help
> > > >         Names of generated image files that are installed in the
> > > >         output images/ directory.
> > >
> > > IIUC, it should be customized in your board defconfig.
> >
> > Not sure of it. Technically this is how rockchip SoC behaves wrt ATF
> > build. If we mark BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="" to all
> > supporting boards of  rockchip start with rk3399, rk3288 etc.. it
> > ended up huge and meaningless change, IMHO.
>
> Sergey is right here: I don't think we want to encode platform-specific
> stuff like this in Kconfig files.
>
> What is the problem if you leave this to the default of *.bin ?

Is looking for *.bin in build/rk3399/release/*.bin but v2.2 is not
creating any bin since rk3399 (or rockchip) doesn't need bins.

.mk file change:

define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
        $(foreach f,$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES)), \
                cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/$(f) $(BINARIES_DIR)/
        )

Build log:

>>> arm-trusted-firmware v2.2 Installing to images directory
cp -dpf /mnt/out/build/arm-trusted-firmware-v2.2/build/rk3399/release/*.bin
/mnt/out/images/
cp: cannot stat
'/mnt/out/build/arm-trusted-firmware-v2.2/build/rk3399/release/*.bin':
No such file or directory
package/pkg-generic.mk:339: recipe for target
'/mnt/out/build/arm-trusted-firmware-v2.2/.stamp_images_installed'
failed
make[1]: *** [/mnt/out/build/arm-trusted-firmware-v2.2/.stamp_images_installed]
Error 1
Makefile:23: recipe for target '_all' failed
make: *** [_all] Error 2

So, we have tried 3 set of changes

1. Kconfig (like in this patch)
2. *.mk check for rk3399, and v2.2 to not to execute above foreach loop
3. defined BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="" board defconfig

Out of the above 3 possibilities, option 1) seem meaningful for me.
Let us know your comments?

Jagan.
