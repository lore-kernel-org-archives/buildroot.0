From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Jan 2016 22:12:22 +0100
Subject: [Buildroot] [PATCH 09/21] jack2: use the proper
 BR2_TOOLCHAIN_HAS_SYNC_x symbol
In-Reply-To: <1453676887-31236-10-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-10-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160125211222.GJ3386@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-25 00:07 +0100, Thomas Petazzoni spake thusly:
> Move away from BR2_ARCH_HAS_ATOMICS and use BR2_TOOLCHAIN_HAS_SYNC_4
> instead for the jack2 package and its reverse dependency.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

The original build issue that prompted adding the atomics dependency is:
    http://autobuild.buildroot.net/results/c218be876d3abf7a8e212b6d526595bfd835e1c5/

with:
    common/libjackserver.so: undefined reference to `__sync_bool_compare_and_swap_4'

Regards,
Yann E. MORIN.

> ---
>  package/jack2/Config.in | 4 ++--
>  package/mpd/Config.in   | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/jack2/Config.in b/package/jack2/Config.in
> index 350a342..94cb7e0 100644
> --- a/package/jack2/Config.in
> +++ b/package/jack2/Config.in
> @@ -3,8 +3,8 @@ config BR2_PACKAGE_JACK2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_ARCH_HAS_ATOMICS
>  	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	select BR2_PACKAGE_LIBSAMPLERATE
>  	select BR2_PACKAGE_LIBSNDFILE
>  	select BR2_PACKAGE_ALSA_LIB
> @@ -23,6 +23,6 @@ config BR2_PACKAGE_JACK2
>  
>  comment "jack2 needs a toolchain w/ threads, C++, dynamic library"
>  	depends on BR2_USE_MMU
> -	depends on BR2_ARCH_HAS_ATOMICS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
>  		BR2_STATIC_LIBS
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index 618bea9..6480a08 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -230,13 +230,14 @@ config BR2_PACKAGE_MPD_HTTPD_OUTPUT
>  
>  config BR2_PACKAGE_MPD_JACK2
>  	bool "jack2"
> -	depends on BR2_ARCH_HAS_ATOMICS
>  	depends on !BR2_STATIC_LIBS # jack2
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	select BR2_PACKAGE_JACK2
>  	help
>  	  Enable jack output support.
>  
>  comment "jack support needs a toolchain w/ dynamic library"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_STATIC_LIBS
>  
>  config BR2_PACKAGE_MPD_OSS
> -- 
> 2.6.4
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
