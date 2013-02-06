From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Feb 2013 16:46:54 +0100
Subject: [Buildroot] [PATCH] add Gnublin board support
In-Reply-To: <1360154267-18767-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1360154267-18767-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20130206164654.3952c004@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zoltan Gyarmati,

On Wed,  6 Feb 2013 13:37:47 +0100, Zoltan Gyarmati wrote:
> 
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
>  board/gnublin/README                |   41 +
>  board/gnublin/gnublin_kernel_config | 1836 +++++++++++++++++++++++++++++++++++

The kernel configuration file should preferably be a minimal
configuration file, generated using linux-savedefconfig.

>  configs/gnublin_defconfig           | 1253 ++++++++++++++++++++++++

Ditto here, minimal Buildroot config file preferred. Generated using
make savedefconfig.

> +++ b/board/gnublin/README
> @@ -0,0 +1,41 @@
> +This the Buildroot support for the Gnublin board 
> +(see here: http://en.gnublin.org/) and to the Elektor Linux board
> +(http://www.elektor.com/news/elektor-presents-embedded-linux-made-easy.2147294.lynkx)
> +Unfortunately currently the AD and the pwm modules are not supported, i'm about to
> +add also those drivers as well to the current kernel later.

[...]

Could you wrap those lines to ~80 columns maximum? Good text editors
should have a way of doing that automatically for you.

> +Base kernel version: 3.7.0 (available here: https://gitorious.org/linux-3-7-gnublin/linux-3-7-gnublin/commits/gnublin-support)
> +U-boot version: 2009.11 (available here: https://gitorious.org/u-boot-gnublin-support/u-boot-gnublin-support)
> +
> +Steps to create a bootable SD card:
> +
> +#config buildroot with the gnublin_defconfig:

I believe it is a bit strange to have those comments starting with "#"
because "#" is also usually the root prompt. What about something like:

 1. Configure buildroot with the gnublin_defconfig

 $ make gnublin_defconfig

And ditto for the next steps?

> +
> +$ make gnublin_defconfig
> +
> +#tweak the config for your needs:
> +
> +$ make menuconfig
> +
> +#and build:
> +
> +$ make
> +
> +#Create 2 partitions on your SD card, one with type of BootIt (fdisk ID: df), the size should
> +#be around 1M, and another partition with  all of the left space on the card, and 
> +#with the type of normal DOS partition.
> +
> +#from the output/images directory dump the u-boot image to the BootIt partition:
> +
> +$ dd if=output/images/u-boot.bin of=/dev/sdc2  
> +#                                      ^^^^  modify it accordingly

Are you sure U-Boot goes on the second partition? My understanding of
your text is that the first partition is the small one with a special
type (I assume for the bootloader), and the second, big partition, is
for the root filesystem.

> +#and the dump the root fs image as well:
> +$ dd if=output/images/rootfs.ext2 of=/dev/sdc1
> +#                                      ^^^^  modify it accordingly

Instead of "^^^^ modify it accordingly", just mention it on a different
line, like "Of course, /dev/sdc1 should be adjusted depending on which
device corresponds to the SD card on your system", or something like
that.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
