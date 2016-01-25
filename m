From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Jan 2016 22:45:29 +0100
Subject: [Buildroot] [PATCH 10/21] libtorrent: use the proper
 BR2_TOOLCHAIN_HAS_SYNC_x symbols
In-Reply-To: <1453676887-31236-11-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-11-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160125214529.GK3386@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-25 00:07 +0100, Thomas Petazzoni spake thusly:
> libtorrent uses 1 bytes and 4 bytes __sync built-ins, so let's use the
> appropriate BR2_TOOLCHAIN_HAS_SYNC_x symbols instead of
> BR2_ARCH_HAS_ATOMICS. The rtorrent package, which is a reverse
> dependency of libtorrent, gets fixed as well.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libtorrent/Config.in | 4 ++--
>  package/rtorrent/Config.in   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
> index 17a1f23..4787f9c 100644
> --- a/package/libtorrent/Config.in
> +++ b/package/libtorrent/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBTORRENT
>  	bool "libtorrent"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on BR2_ARCH_HAS_ATOMICS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4

The original build failure that prompted adding the atomics dependency
only reported errors about the __sunc_*_4() functions, but libtorrent
has been bumped sinc ethen.

I was not able to easily reproduce a failure so far, but I will try with
an arc toolchain (which is lacking __sync_*_1() functions...

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_ZLIB
>  	help
>  	  BitTorrent library written in C++ for *nix
> @@ -10,5 +10,5 @@ config BR2_PACKAGE_LIBTORRENT
>  	  https://github.com/rakshasa/libtorrent
>  
>  comment "libtorrent needs a toolchain w/ C++, threads"
> -	depends on BR2_ARCH_HAS_ATOMICS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
> index 0583152..190e50f 100644
> --- a/package/rtorrent/Config.in
> +++ b/package/rtorrent/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_RTORRENT
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # fork()
> -	depends on BR2_ARCH_HAS_ATOMICS # libtorrent
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4
>  	select BR2_PACKAGE_LIBCURL
>  	select BR2_PACKAGE_LIBTORRENT
>  	select BR2_PACKAGE_NCURSES
> @@ -16,5 +16,5 @@ config BR2_PACKAGE_RTORRENT
>  
>  comment "rtorrent needs a toolchain w/ C++, threads, wchar"
>  	depends on BR2_USE_MMU
> -	depends on BR2_ARCH_HAS_ATOMICS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
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
