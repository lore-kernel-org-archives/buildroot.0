From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 11:56:11 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/webkitgtk: allow building
 with the musl libc
In-Reply-To: <20210518190515.357554-3-aperez@igalia.com>
References: <20210518190515.357554-1-aperez@igalia.com>
 <20210518190515.357554-3-aperez@igalia.com>
Message-ID: <20210519095611.GP2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adrian, All,

On 2021-05-18 22:05 +0300, Adrian Perez de Castro spake thusly:
> WebKitGTK 2.32.1 includes support for building with the musl libc,
> therefore arrange dependencies to allow selecting the package when
> a musl system is built. This is done by making the dependencies be
> more granular, basically following what the wpewebkit package does.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/webkitgtk/Config.in | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
> index 4ea931fde1..18b254dca5 100644
> --- a/package/webkitgtk/Config.in
> +++ b/package/webkitgtk/Config.in
> @@ -12,20 +12,23 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
>  
> -comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 7, host gcc >= 4.9"
> +comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 7, host gcc >= 4.9"
>  	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
> +	depends on !BR2_BINFMT_FLAT
>  	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_USES_GLIBC || \
> +		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \

But that also allows uclibc now... Is that intended? If so, this should
also be mentioned in the commit log

>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
>  		!BR2_HOST_GCC_AT_LEAST_4_9
> -	depends on BR2_USE_MMU

How does that fit with allowing musl?

Regards,
Yann E. MORIN.

>  config BR2_PACKAGE_WEBKITGTK
>  	bool "webkitgtk"
> +	depends on !BR2_STATIC_LIBS # wayland
> +	depends on !BR2_BINFMT_FLAT # icu
>  	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
> -	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_USE_WCHAR # icu, libsoup
>  	depends on BR2_PACKAGE_LIBGTK3
>  	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
>  	select BR2_PACKAGE_CAIRO
> -- 
> 2.31.1
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
