From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 7 Jan 2021 16:11:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/genimage : fix dependency to
 host-mtools mcopy is used by genimage when creating fat parts
In-Reply-To: <20210107110634.65195-1-fabien.lehoussel@medianesysteme.com>
References: <20210107110634.65195-1-fabien.lehoussel@medianesysteme.com>
Message-ID: <20210107151126.GK1485369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabien, All,

On 2021-01-07 12:06 +0100, Fabien Lehoussel spake thusly:
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@medianesysteme.com>
> ---
>  package/genimage/Config.in.host | 1 +
>  package/genimage/genimage.mk    | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/genimage/Config.in.host b/package/genimage/Config.in.host
> index cf831a143c..8db7eed8e4 100644
> --- a/package/genimage/Config.in.host
> +++ b/package/genimage/Config.in.host
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_HOST_GENIMAGE
>  	bool "host genimage"
> +	select BR2_PACKAGE_HOST_MTOOLS
>  	help
>  	  genimage is a tool to generate multiple filesystem and flash
>  	  images from a given root filesystem tree. genimage is
> diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
> index dde8f8b9e0..1fa93e0854 100644
> --- a/package/genimage/genimage.mk
> +++ b/package/genimage/genimage.mk
> @@ -7,7 +7,7 @@
>  GENIMAGE_VERSION = 13
>  GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
>  GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
> -HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
> +HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse host-mtools

Not all genimage configurations require creating a vfat partition.

For example, we do have a few such configurations in Buildroot:

    $ grep -c vfat $(find board/ -name '*genimage*') |grep -E ':0$' |wc -l
    27

    $ cat board/amarula/vyasa/genimage.cfg
    image sdcard.img {
        hdimage {
        }

        partition u-boot-tpl-spl-dtb {
            in-partition-table = "no"
            image = "u-boot-tpl-spl-dtb.img"
            offset = 32K
        }

        partition u-boot-dtb {
            in-partition-table = "no"
            image = "u-boot-dtb.img"
            offset = 8M
            size = 30M # falcon mode: args @ 16M args, uImage @ 17M
        }

        partition rootfs {
            partition-type = 0x83
            image = "rootfs.ext4"
        }
    }

It is your respnsibility to enable whatever filesystem image generators
you need for your system.

Regards,
Yann E. MORIN.

>  GENIMAGE_LICENSE = GPL-2.0
>  GENIMAGE_LICENSE_FILES = COPYING
>  
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
