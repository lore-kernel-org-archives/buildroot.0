From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Dec 2017 07:08:31 +0100
Subject: [Buildroot] [PATCH] board: add support for ARC HS Development
 Kit (HSDK)
In-Reply-To: <1513188243.3598.20.camel@synopsys.com>
References: <20171207170628.2806-1-didin@synopsys.com>
 <20171213083421.327551f7@windsurf.png.is.keysight.com>
 <1513188243.3598.20.camel@synopsys.com>
Message-ID: <20171214070831.4339bc22@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Dec 2017 18:04:04 +0000, Alexey Brodkin wrote:

> > Nice. Do you send free boards ? :-)  
> 
> If you guys are interested I'll try to make sure you'll get one.
> Seriously. But it won't happen before later next year anyways :)

OK, let's see when the boards are available. I'm not sure I would spend
enough time playing with the board to justify having one.

> There's one caveat though.
> On that board we use SD-card as a storage for uImage, rootfs and among other things
> U-Boot environment. But compared to some ARM boards we keep it on the first FAT partiotion,
> not just put as a raw blob on SD-card before filesystem starts.
> 
> This is perfectly possible with up-to-date U-Boot - everything is already thee, just
> say that environment will be on FAT partition like that:
> ----------------------------->8----------------------  
> CONFIG_ENV_IS_IN_FAT=y                                                                                                                            
> CONFIG_ENV_FAT_INTERFACE="mmc"                                                                                                                    
> CONFIG_ENV_FAT_DEVICE_AND_PART="0:1"
> ----------------------------->8----------------------  
> 
> And by default U-Boot will look for a file with name "uboot.env", see
> http://git.denx.de/?p=u-boot.git;a=blob;f=env/Kconfig#l394
> 
> But in Buildroot for some reason "uboot-env.bin" is generated.

"some reason" = back then, there was no support in U-Boot for reading
the environment from a file, or at least we didn't know about this.

> So what we may do here:
>  1) We may switch to "uboot-env.bin" in our U-Boot.
>  2) We may keep using post build script... or
>  3) We may switch to more common U-Boot-wise "uboot.env" with:
> ----------------------------->8----------------------  
> diff --git a/board/altera/socrates_cyclone5/genimage.cfg b/board/altera/socrates_cyclone5/genimage.cfg
> index 63fef8ba4764..04d30490cb4d 100644
> --- a/board/altera/socrates_cyclone5/genimage.cfg
> +++ b/board/altera/socrates_cyclone5/genimage.cfg
> @@ -35,7 +35,7 @@ image sdcard.img {
>  
>         partition uboot-env {
>                 in-partition-table = "no"
> -               image = "uboot-env.bin"
> +               image = "uboot.env"
>                 offset = 17408 # 512 * 34 -> just after gpt
>         }
>  
> diff --git a/board/altera/socrates_cyclone5/readme.txt b/board/altera/socrates_cyclone5/readme.txt
> index 4e78feef11a5..2e34c3d31f85 100644
> --- a/board/altera/socrates_cyclone5/readme.txt
> +++ b/board/altera/socrates_cyclone5/readme.txt
> @@ -30,7 +30,7 @@ Following files will be generated in output/images
>  ??? u-boot-spl.bin.crc
>  ??? u-boot.bin
>  ??? u-boot.img
> -??? uboot-env.bin
> +??? uboot.env
>  ??? uboot.img
>  ??? zImage
>  
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 2ae38e95d5af..d6fd3672aee0 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -378,7 +378,7 @@ menuconfig BR2_TARGET_UBOOT_ENVIMAGE
>           Generate a valid binary environment image from a text file
>           describing the key=value pairs of the environment.
>  
> -         The environment image will be called uboot-env.bin.
> +         The environment image will be called uboot.env.
>  
>  if BR2_TARGET_UBOOT_ENVIMAGE
>  
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 14a8cc949a33..aaecf4d466cf 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -246,7 +246,7 @@ define UBOOT_INSTALL_IMAGES_CMDS
>                         $(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
>                         $(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
>                         $(if $(filter BIG,$(BR2_ENDIAN)),-b) \
> -                       -o $(BINARIES_DIR)/uboot-env.bin -)
> +                       -o $(BINARIES_DIR)/uboot.env -)
>         $(if $(BR2_TARGET_UBOOT_BOOT_SCRIPT),
>                 $(HOST_DIR)/bin/mkimage -C none -A $(MKIMAGE_ARCH) -T script \
>                         -d $(call qstrip,$(BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE)) \
> ----------------------------->8----------------------  
> 
> What do you think?

I think option (3) is the best. But it has a drawback: it breaks
backward compatibility for existing users that rely on the file being
named uboot-env.bin. So instead, you could add a new U-Boot option that
allows to customize the name of the generated image. By default it
would be uboot-env.bin to keep backward compatibility, but it could be
set to a different value in your defconfig.

Or we decide to break the backward compatibility :)
 
> > This should instead use the generic support/scripts/genimage.sh
> >   
> > > +tar czf output/images/sdcard.img.tar.gz --directory="./output/images"  sdcard.img  
> > 
> > And this is not needed.  
> 
> Well IMHO compression of the image makes sense because that way we may generate images
> with larger FAT-partition without bumping size of the output image.
> 
> See we always allocate a bit more space for FAT partition (or it is applicable to any not-last
> partiotion - not sure about that) compared to what we need just to make sure it's enough space for our
> stuff. Moreover I'd like to have some more space so I may for example put 2 uImages side by side
> and switch between them later on and do it all without re-formatting of the SD-card.
> 
> And given how large SD-cards these days are I'm fine with allocating even 100Mb for first FAT partiotion.
> Now if we don't compress sdcard.img it will be of size 100+ Mb. But if we gzip it then we only have size
> of real payload, i.e. ~6-7 Mb while keeping a lot of flexibility for image user.
> 
> Not to mention a case of sharing built images.
> 
> That said I'd rather prefer to either compress images by default (does it really hurt?)
> or at least have it as an option.

I'm not sure we want to solve this in your specific post-image script,
it's a more generic problem. Though I agree we don't have a good way of
solving it right now.

Also, creating a tarball for just one file is a bit weird, you could
just gzip sdcard.img to produce sdcard.img.gz.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
