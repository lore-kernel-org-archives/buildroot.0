From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Jun 2014 20:04:04 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx: bump to version 5_01_01_01
In-Reply-To: <1401812044-11578-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1401812044-11578-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <20140604180404.GE3325@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hadrien, All,

On 2014-06-03 18:14 +0200, Hadrien Boutteville spake thusly:
> Note that SDK 5_01_01_01 only support EABIhf.

Then maybe we should fallback to the 5.01.00.01 version for non-EABIhf
builds?

If we want to still support that, of course, but I guess we should.
There are still binary-only, legacy code that is using the softfp ABI,
so I suggest we should stick to supporting it for a while.

Regards,
Yann E. MORIN.

> Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
> ---
>  package/ti-gfx/Config.in | 7 ++++---
>  package/ti-gfx/ti-gfx.mk | 8 +-------
>  2 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
> index 4ee8622..bd6189e 100644
> --- a/package/ti-gfx/Config.in
> +++ b/package/ti-gfx/Config.in
> @@ -4,7 +4,8 @@ config BR2_PACKAGE_TI_GFX
>  	select BR2_PACKAGE_HAS_LIBGLES
>  	select BR2_PACKAGE_HAS_POWERVR
>  	select BR2_PACKAGE_FBSET if !BR2_PACKAGE_BUSYBOX # Runtime dependency only
> -	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
> +	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm && \
> +		BR2_ARM_EABIHF
>  	help
>  	  Graphics libraries for TI boards.
>  
> @@ -70,6 +71,6 @@ endchoice
>  
>  endif
>  
> -comment "ti-gfx needs an (e)glibc toolchain and a Linux kernel to be built"
> +comment "ti-gfx needs an (e)glibc and EABIhf toolchain and a Linux kernel to be built"
>  	depends on BR2_arm
> -	depends on !(BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC)
> +	depends on !(BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_ARM_EABIHF)
> diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
> index 324e19c..8235917 100644
> --- a/package/ti-gfx/ti-gfx.mk
> +++ b/package/ti-gfx/ti-gfx.mk
> @@ -4,15 +4,9 @@
>  #
>  ################################################################################
>  
> -TI_GFX_VERSION = 5_01_00_01
> +TI_GFX_VERSION = 5_01_01_01
>  TI_GFX_SO_VERSION = 1.10.2359475
> -
> -ifeq ($(BR2_ARM_EABIHF),y)
>  TI_GFX_SOURCE = Graphics_SDK_setuplinux_hardfp_$(TI_GFX_VERSION).bin
> -else
> -TI_GFX_SOURCE = Graphics_SDK_setuplinux_softfp_$(TI_GFX_VERSION).bin
> -endif
> -
>  TI_GFX_SITE = http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/$(TI_GFX_VERSION)/exports/
>  TI_GFX_LICENSE = Technology / Software Publicly Available
>  TI_GFX_LICENSE_FILES = TSPA.txt
> -- 
> 2.0.0
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
