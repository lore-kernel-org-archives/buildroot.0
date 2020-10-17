From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2020 10:25:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpi-userland: build on arm64
In-Reply-To: <20201017011356.50029-1-aman@tmm1.net>
References: <20201017011356.50029-1-aman@tmm1.net>
Message-ID: <20201017082525.GF3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Aman, All,

Thanks fior this patch. However, I have some comments about it, see
below...

On 2020-10-16 18:13 -0700, Aman Karmani spake thusly:
> Parts of the userland (such as `vcgencmd`) are now usable on aarch64

This has already been proposed a few times already (review all the
messages in those threads):

    http://lists.busybox.net/pipermail/buildroot/2020-August/289559.html
    http://lists.busybox.net/pipermail/buildroot/2020-January/271577.html

There, it was pointed out that the set of libraries instaleld on AArch64
is different from AArch32, and most notably "no libegl, libgles,
libopenmax, libopenvg" are built and installed.

This means that rpi-userland couldn't be an EGL or GLES or OPENMAX
provider when building for AArch64.

Has that situation improved now?

Regards,
Yann E. MORIN.

> Signed-off-by: Aman Karmani <aman@tmm1.net>
> ---
>  package/rpi-userland/Config.in       | 4 ++--
>  package/rpi-userland/rpi-userland.mk | 6 ++++++
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
> index 342faf26e3..81f3588822 100644
> --- a/package/rpi-userland/Config.in
> +++ b/package/rpi-userland/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_RPI_USERLAND
>  	bool "rpi-userland"
> -	depends on BR2_arm
> +	depends on BR2_arm || BR2_aarch64
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS
> @@ -40,6 +40,6 @@ config BR2_PACKAGE_RPI_USERLAND_HELLO
>  endif
>  
>  comment "rpi-userland needs a toolchain w/ C++, threads, dynamic library"
> -	depends on BR2_arm
> +	depends on BR2_arm || BR2_aarch64
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
>  		BR2_STATIC_LIBS
> diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
> index 4cfd5cb832..97270f2eb4 100644
> --- a/package/rpi-userland/rpi-userland.mk
> +++ b/package/rpi-userland/rpi-userland.mk
> @@ -13,6 +13,12 @@ RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr
>  
>  RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
>  
> +ifeq ($(BR2_aarch64),y)
> +
> +RPI_USERLAND_CONF_OPTS += -DARM64=ON
> +
> +endif
> +
>  ifeq ($(BR2_PACKAGE_RPI_USERLAND_HELLO),y)
>  
>  RPI_USERLAND_CONF_OPTS += -DALL_APPS=ON
> -- 
> 2.28.0
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
