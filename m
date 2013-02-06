From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 06 Feb 2013 18:31:24 +0100
Subject: [Buildroot] [PATCH] add Gnublin board support
In-Reply-To: <1360154267-18767-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1360154267-18767-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <5112936C.20509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Zoltan,

  A few comments in addition to Thomas's.

On 06/02/13 13:37, Zoltan Gyarmati wrote:
>
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
>   board/gnublin/README                |   41 +
>   board/gnublin/gnublin_kernel_config | 1836 +++++++++++++++++++++++++++++++++++

  The kernel config is typically called "linux-<version>.config".  In 
your case, the version is gnublin_support_v1 which is a bit unfortunate, 
so perhaps 3.7 is better.

  (It would be nice if the gnublin kernel tree would tag with e.g. 
v3.7-gnublin-1 instead.)

  It would also be nice if the gnublin kernel tree would contain a 
defconfig for the board, then there's no need to include a custom linux 
config in buildroot.

  It would also be nice if it would follow the stable kernel (currently 
3.7.6 I think).

>   configs/gnublin_defconfig           | 1253 ++++++++++++++++++++++++
>   3 files changed, 3130 insertions(+)
>   create mode 100644 board/gnublin/README
>   create mode 100644 board/gnublin/gnublin_kernel_config
>   create mode 100644 configs/gnublin_defconfig
>
> diff --git a/board/gnublin/README b/board/gnublin/README
> new file mode 100644
> index 0000000..a4fdeb1
> --- /dev/null
> +++ b/board/gnublin/README
> @@ -0,0 +1,41 @@
> +This the Buildroot support for the Gnublin board
> +(see here: http://en.gnublin.org/) and to the Elektor Linux board
> +(http://www.elektor.com/news/elektor-presents-embedded-linux-made-easy.2147294.lynkx)
> +Unfortunately currently the AD and the pwm modules are not supported, i'm about to
> +add also those drivers as well to the current kernel later.

  Would be nice to mention the SoC used.

> +
> +Base kernel version: 3.7.0 (available here: https://gitorious.org/linux-3-7-gnublin/linux-3-7-gnublin/commits/gnublin-support)

  I guess that should be 3.7 (there is no 3.7.0 tag or tarball).

> +U-boot version: 2009.11 (available here: https://gitorious.org/u-boot-gnublin-support/u-boot-gnublin-support)
> +
> +Steps to create a bootable SD card:
> +
> +#config buildroot with the gnublin_defconfig:
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

  Tip: if you're not using conversions, cat is generally much more 
efficient than dd:

cat output/images/u-boot.bin > /dev/sdc2


  Regards,
  Arnout

> +
> +#and the dump the root fs image as well:
> +$ dd if=output/images/rootfs.ext2 of=/dev/sdc1
> +#                                      ^^^^  modify it accordingly
> +#Insert the SD card into the board's slot, and your board should boot up with your newly created system
> +Any feedback/report is welcome on the mr.zoltan.gyarmati[at]gmail.com


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
