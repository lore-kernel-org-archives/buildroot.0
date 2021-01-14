From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Jan 2021 22:49:54 +0100
Subject: [Buildroot] [PATCH] uboot: fix binman with a new dependency
In-Reply-To: <20210112091806.906954-1-francois.perrad@gadz.org>
References: <20210112091806.906954-1-francois.perrad@gadz.org>
Message-ID: <20210114214954.GF2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2021-01-12 10:18 +0100, Francois Perrad spake thusly:
> since 2021.01, tools/binman is broken.
> tools/binman/control.py imports pkg_resources
> the module pkg_resources is supplied by setuptools,
> so this new dependency is required.
> 
> binman is used only for building SPL
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Cross-referencing the actual bump-patch:

    boot/uboot: bump to version 2021.01
    https://patchwork.ozlabs.org/project/buildroot/patch/20210111213312.6375-1-michael at walle.cc/

Could you guys work on a single patch doing the bump with associated
fixes if need be, please?

Regards,
Yann E. MORIN.

> ---
>  boot/uboot/uboot.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index d2b4e8dc6..a3d949a55 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -167,8 +167,14 @@ endif
>  
>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON2),y)
>  UBOOT_DEPENDENCIES += host-python
> +ifeq ($(BR2_TARGET_UBOOT_SPL),y)
> +UBOOT_DEPENDENCIES += host-python-setuptools
> +endif
>  else ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
>  UBOOT_DEPENDENCIES += host-python3
> +ifeq ($(BR2_TARGET_UBOOT_SPL),y)
> +UBOOT_DEPENDENCIES += host-python3-setuptools
> +endif
>  endif
>  
>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
> -- 
> 2.27.0
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
