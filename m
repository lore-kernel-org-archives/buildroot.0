From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 9 Mar 2015 13:17:33 +0200
Subject: [Buildroot] [PATCH 1/1 v2] eudev: fix dependency on kernel
 headers version
In-Reply-To: <1425899411-30086-1-git-send-email-swexru@gmail.com>
References: <1425899411-30086-1-git-send-email-swexru@gmail.com>
Message-ID: <20150309111733.GH2518@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

On Mon, Mar 09, 2015 at 02:10:11PM +0300, Alexey Mednyy wrote:
> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index 2221966..eb266a1 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -10,6 +10,7 @@ EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
>  EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
>  EUDEV_LICENSE_FILES = COPYING
>  EUDEV_INSTALL_STAGING = YES
> +EUDEV_AUTORECONF = YES

Please add a comment here saying that we are patching configure.ac.

>  # mq_getattr is in librt
>  EUDEV_CONF_ENV += LIBS=-lrt
> diff --git a/system/Config.in b/system/Config.in
> index 4d1c3d2..9e2b13f 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -128,13 +128,12 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
>  	depends on BR2_USE_WCHAR
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_USE_MMU # eudev
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
> +#	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9

Please remove this line.

>  	select BR2_PACKAGE_EUDEV
>  
> -comment "eudev needs a toolchain w/ largefile, wchar, dynamic library, headers >= 3.9"
> +comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
> -		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
> +	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
