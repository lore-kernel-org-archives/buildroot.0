From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 10:07:56 +0100
Subject: [Buildroot] [PATCH 3/9] boot/arm-trusted-firmware: Add
 u-boot-dtb.bin support
In-Reply-To: <20191120073754.ror57blke4sx2gup@bars>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-4-jerry.huang@nxp.com>
 <20191120073754.ror57blke4sx2gup@bars>
Message-ID: <20191120100756.0e269e98@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sergey, Hello Jerry,

On Wed, 20 Nov 2019 10:37:54 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> >  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33),y)
> > +ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_BIN),y)
> > +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/u-boot-dtb.bin
> > +else
> >  ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/u-boot.bin
> > +endif
> >  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
> >  endif  
> 
> Hi Jerry, Thomas, and all
> 
> Looks good, but probably we could make it a little bit more future-proof.
> What do you think about using the same pattern-based approach here as
> implemented in commit e4d276c357fdf9f19f99f8 (buildroot next branch)
> for ATF firmware images.
> 
> In brief, to add option BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
> in arm-trusted-firmware Config.in and set its default value to u-boot.bin.
> Then u-boot-dtb.bin value could be specified in the board defconfig.

I was going to say that Jerry's solution looks better, as it's more
automatic for the user.

However, the selection of the U-Boot image format is not a Kconfig
"choice" in boot/uboot/Config.in: one can select multiple images. In
this case, how can ATF know which one to use ? Jerry's proposal is to
assume that if BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y, then you want to use
u-boot-dtb.bin, but if there are multiple U-Boot images enabled, it's
indeed difficult to know which one to chose for ATF.

So, I agree with Sergey: probably the easiest is simply some free-form
string option, with a default to u-boot.bin to preserve backward
compatibility.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
