From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 14 Feb 2020 13:04:13 +0530
Subject: [Buildroot] [PATCH 1/4] boot/arm-trusted-firmware: Disable bin
 copy for rk3399
In-Reply-To: <20200214082625.4d114bc9@windsurf>
References: <1581573151-18943-1-git-send-email-sunil@amarulasolutions.com>
 <1581573151-18943-2-git-send-email-sunil@amarulasolutions.com>
 <20200213072350.vwly4eganmeq57mu@bars>
 <CAMty3ZC-c0aazuTtKXF8U8B3w=_e8BeicG-hN=jLDCrqUxenFQ@mail.gmail.com>
 <20200214052043.6ab9688f@windsurf>
 <CAMty3ZA3F6td2xwAqVLZvF5ZK+_G3kj-U89yccJCEEyM3tMzcQ@mail.gmail.com>
 <20200214082625.4d114bc9@windsurf>
Message-ID: <CAMty3ZCnPiQ_geiAYU1QVxh_Ac-0=zW=9AG5pE0ndaz7apGbeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 14, 2020 at 12:56 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Fri, 14 Feb 2020 12:25:37 +0530
> Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> > > Sergey is right here: I don't think we want to encode platform-specific
> > > stuff like this in Kconfig files.
> > >
> > > What is the problem if you leave this to the default of *.bin ?
> >
> > Is looking for *.bin in build/rk3399/release/*.bin but v2.2 is not
> > creating any bin since rk3399 (or rockchip) doesn't need bins.
> >
> > .mk file change:
> >
> > define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
> >         $(foreach f,$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES)), \
> >                 cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/$(f) $(BINARIES_DIR)/
> >         )
> >
> > Build log:
> >
> > >>> arm-trusted-firmware v2.2 Installing to images directory
> > cp -dpf /mnt/out/build/arm-trusted-firmware-v2.2/build/rk3399/release/*.bin
> > /mnt/out/images/
> > cp: cannot stat
> > '/mnt/out/build/arm-trusted-firmware-v2.2/build/rk3399/release/*.bin':
> > No such file or directory
> > package/pkg-generic.mk:339: recipe for target
> > '/mnt/out/build/arm-trusted-firmware-v2.2/.stamp_images_installed'
> > failed
> > make[1]: *** [/mnt/out/build/arm-trusted-firmware-v2.2/.stamp_images_installed]
> > Error 1
> > Makefile:23: recipe for target '_all' failed
> > make: *** [_all] Error 2
>
> What is your image name then? You don't install any image?

As I said, the image that required for rk3399 is elf  it is bl31.elf.

We have enabled BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF in defconfig on
this series. elf copy is already supported in buildroot on this commit
cab8bd3b46badb11e734e64747aee848c2b4282d

Jagan.
