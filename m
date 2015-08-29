From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Aug 2015 13:59:35 +0200
Subject: [Buildroot] [PATCH 1/1] Fix Image name not configurable (issue
 #28).
In-Reply-To: <1440845031-3965-2-git-send-email-mc5686@mclink.it>
References: <1440842823-1283-1-git-send-email-mc5686@mclink.it>
 <1440845031-3965-1-git-send-email-mc5686@mclink.it>
 <1440845031-3965-2-git-send-email-mc5686@mclink.it>
Message-ID: <20150829115935.GC4857@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mauro, All,

On 2015-08-29 12:43 +0200, Mauro Condarelli spake thusly:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  ...age-name-not-appearing-in-make-menuconfig.patch | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 boot/at91bootstrap3/0001-fix-Image-name-not-appearing-in-make-menuconfig.patch
> 
> diff --git a/boot/at91bootstrap3/0001-fix-Image-name-not-appearing-in-make-menuconfig.patch b/boot/at91bootstrap3/0001-fix-Image-name-not-appearing-in-make-menuconfig.patch
> new file mode 100644
> index 0000000..cf72b16
> --- /dev/null
> +++ b/boot/at91bootstrap3/0001-fix-Image-name-not-appearing-in-make-menuconfig.patch
> @@ -0,0 +1,27 @@
> +From d2a65fce095242f28f263bbaba373516b6b4db43 Mon Sep 17 00:00:00 2001
> +From: Mauro Condarelli <mc5686@mclink.it>
> +Date: Sat, 29 Aug 2015 11:49:26 +0200
> +Subject: [PATCH] trivial patch to fix Image name not appearing in 'make
> + manuconfig' (fixes issue #28).
> +
> +Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> +---
> + Config.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Config.in b/Config.in
> +index 432df26..714b05d 100644
> +--- a/Config.in
> ++++ b/Config.in
> +@@ -81,7 +81,7 @@ source "Config.in.u-boot"
> + source "Config.in.app-image"
> + 
> + config CONFIG_IMAGE_NAME
> +-	string
> ++	string "Image name"
> + 	default "Image" if CONFIG_LINUX_IMAGE
> + 	default "u-boot.bin" if CONFIG_LOAD_UBOOT
> + 	default "softpack.bin" if CONFIG_LOAD_64KB || CONFIG_LOAD_4MB || CONFIG_LOAD_1MB

As discussed on IRC, this is probably the wrong solution.

A better (and probably more easily upstreamable) solution would be to
add a choice for the user to select the type of the image, like so:

In Config.in.kernel:

    choice
        bool "Image format"

    config CONFIG_LINUX_UIMAGE
        bool "uImage"

    config COMFIG_LINUX_ZIMAGE
        bool "zImage"

    endchoice


In Config.in:

    config CONFIG_IMAGE_NAME
        string
        default "Image" if CONFIG_LINUX_UIMAGE
        default "zImage" if CONFIG_LINUX_ZIMAGE
        [...]


Note that CONFIG_LINUX_UIMAGE comes first in the choice, so that a
defconfig keeps the existing behaviour of using uImage. You may also
want to add support for other image names, YMMV...

I'm marking this patch as rejected in Patchwork.

Regards,
Yann E. MORIN.

> +-- 
> +2.1.4
> +
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
