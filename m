From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 10:10:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/mpv: needs gcc >= 4.9
In-Reply-To: <20210117083718.1081482-1-bernd.kuhls@t-online.de>
References: <20210117083718.1081482-1-bernd.kuhls@t-online.de>
Message-ID: <20210117091023.GY2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-01-17 09:37 +0100, Bernd Kuhls spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/e41/e41f0a779d46565d448a1d20cf5e17060d9a70b8/
> 
> Quoted from build/config.log
> err: ../test.c:1:23: fatal error: stdatomic.h: No such file or directory
> 
> This header was added with gcc-4.9:
> https://gcc.gnu.org/gcc-4.9/changes.html
> "ISO C11 atomics (the _Atomic type specifier and qualifier and the
>  <stdatomic.h> header) are now supported."
> 
> According to
> https://github.com/mpv-player/mpv/commit/06718da79c79a98d5524f42d034b0d406b14e04c
> "In theory, a user can still use --disable-stdatomic to enable the
>  emulation code, but that's sort of hidden. Actual support will be
>  removed after the next release or so."
> 
> Although adding --disable-stdatomic could fix the current issue we
> require gcc >= 4.9 now to follow the recommendation from upstream.

Thanks for explaining this; I fully agree with your conclusion.

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mpv/Config.in   | 6 +++---
>  package/tovid/Config.in | 8 ++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/mpv/Config.in b/package/mpv/Config.in
> index fd3a3f787d..812491e3a9 100644
> --- a/package/mpv/Config.in
> +++ b/package/mpv/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_MPV
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libass
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
>  	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>  	select BR2_PACKAGE_FFMPEG
> @@ -26,10 +26,10 @@ config BR2_PACKAGE_MPV
>  
>  	  https://mpv.io/
>  
> -comment "mpv needs a toolchain w/ C++, threads, gcc >= 4.8"
> +comment "mpv needs a toolchain w/ C++, threads, gcc >= 4.9"
>  	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
>  		!BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> diff --git a/package/tovid/Config.in b/package/tovid/Config.in
> index a0a6af712f..f972e18852 100644
> --- a/package/tovid/Config.in
> +++ b/package/tovid/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_TOVID
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
>  	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # mpv
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # mpv
>  	depends on BR2_TOOLCHAIN_HAS_ATOMIC # mpv
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mpv
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC # mpv
> @@ -29,13 +29,13 @@ config BR2_PACKAGE_TOVID
>  
>  	  http://tovid.wikia.com/wiki/Installing_tovid
>  
> -comment "tovid needs a toolchain w/ threads, C++, wchar, gcc >= 4.8"
> +comment "tovid needs a toolchain w/ threads, C++, wchar, gcc >= 4.9"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
>  		|| !BR2_INSTALL_LIBSTDCPP \
>  		|| !BR2_USE_WCHAR
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
> @@ -46,5 +46,5 @@ comment "tovid depends on python or python3"
>  	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
> -- 
> 2.29.2
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
