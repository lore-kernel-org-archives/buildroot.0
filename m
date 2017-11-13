From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 13 Nov 2017 22:47:13 +0300
Subject: [Buildroot] [PATCH/next 1/5] armada-firmware: new package
In-Reply-To: <20171113073023.h6was3yb6up7wna3@sapphire.tkos.co.il>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-2-geomatsi@gmail.com>
 <20171113073023.h6was3yb6up7wna3@sapphire.tkos.co.il>
Message-ID: <20171113194713.ufc4ouzubwfmks4n@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Thanks a lot for your thorough review !

> > new file mode 100644
> > index 0000000000..530b5622c8
> > --- /dev/null
> > +++ b/boot/armada-firmware/Config.in
> > @@ -0,0 +1,19 @@
> > +config BR2_TARGET_ARMADA_FIRMWARE
> > +	bool "armada-firmware"
> > +	depends on BR2_aarch64
> > +	help
> > +	  Marvell Armada SCP BL2 firmware images.
> > +
> > +if BR2_TARGET_ARMADA_FIRMWARE
> > +
> > +config BR2_TARGET_ARMADA_FIRMWARE_IMAGE
> > +	string "Armada SCP BL2 image name"
> > +	help
> > +	  Armada SCP BL2 firmware image name.
> 
> This symbol is not used here, which is quite unusual. Instead, you set this 
> symbol in the defconfig, and use it in the ATF package. But since we'll use 
> only one of the 7k/8k images (right?), I suggest to add a 7k/8k choice, and 
> make BR2_TARGET_ARMADA_FIRMWARE_IMAGE a blink symbol that is set (default) 
> according to the choice.
> 
> Something like (abbreviated; untested):
> 
> choice
>     prompt "Armada platform"
> 
> config BR2_PACKAGE_ARMADA_8040
>     bool "8040"
> 
> config BR2_PACKAGE_ARMADA_7040
>     bool "7040"
> 
> endchoice
> 
> config BR2_TARGET_ARMADA_FIRMWARE_IMAGE
>     string
>     default "mrvl_scp_bl2_8040.img" if BR2_PACKAGE_ARMADA_8040
>     default "mrvl_scp_bl2_7040.img" if BR2_PACKAGE_ARMADA_7040

Well, I used string field to specify firmware name because earlier versions
of Armada firmware may have different names. For instance, branch 17.08
contains single firmware blob RTOSDemo-cm3.bin. So if we specify branch of
Armada firmware repository, we have to specify firmware blob name as well.

On the other hand, as you mentioned in subsequent comment, having a
configurable version for this firmware is not a good idea. So if we
set it to the static version (now the latest is 17.10), then we can use
suggested 'choice' menu. Moreover, as you mentioned, it is not really
needed for upstream BSP. I will check if it is needed for Marvell BSP.
If not, then it should be safe to drop this package altogether.

> > new file mode 100644
> > index 0000000000..d75dc7cb6c
> > --- /dev/null
> > +++ b/boot/armada-firmware/armada-firmware.mk
> > @@ -0,0 +1,18 @@
> > +################################################################################
> > +#
> > +# Marvell Armada SCP BL2 firmware images
> > +#
> > +################################################################################
> > +
> > +ARMADA_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARMADA_FIRMWARE_VERSION))
> 
> Having a configurable version is an exception of very few packages (linux, 
> uboot, ATF). Other packages should set to a static version string or a commit 
> id when there is no official version release.

Ok, will do.

> > +ARMADA_FIRMWARE_SITE = $(call github,MarvellEmbeddedProcessors,binaries-marvell,$(ARMADA_FIRMWARE_VERSION))
> > +ARMADA_FIRMWARE_LICENSE = Proprietary
> 
> These binaries come with no license, so you should also add 
> ARMADA_FIRMWARE_REDISTRIBUTE = NO.

Ok, will do.

Regards,
Sergey
