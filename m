From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Jan 2021 22:42:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/mpd: depends on gcc and host
 gcc >= 7
In-Reply-To: <20210114171102.5797-1-fontaine.fabrice@gmail.com>
References: <20210114171102.5797-1-fontaine.fabrice@gmail.com>
Message-ID: <20210114214207.GD2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-14 18:11 +0100, Fabrice Fontaine spake thusly:
> mpd uses string_view since version 0.22 and
> https://github.com/MusicPlayerDaemon/MPD/commit/fa45a8adfa44f6bc815ae7428770112c15c76d73
> 
> string_view is a C++17 feature:
> https://github.com/MusicPlayerDaemon/MPD/commit/e0e5ed62ee98a0e21bc928f432a0051854193cd2
> 
> So add a dependency on host gcc >= 7
> 
> Moreover, C++17 is also mandatory on the target side since
> https://github.com/MusicPlayerDaemon/MPD/commit/8f981845dc7376824d94fd24924788c582942929
> so also bump the gcc dependency
> 
> Finally, drop BR2_TOOLCHAIN_HAS_GCC_BUG_64735 which is not needed as it
> will always be true with gcc >= 7
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e42a1d0cd808585a755754f839fe7d2080547191
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mpd/Config.in | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index e6db1fa268..de97bbab60 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
[--SNIP--]
> @@ -419,10 +419,9 @@ config BR2_PACKAGE_MPD_ID3TAG
>  
>  endif
>  
> -comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 6"
> +comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 7, host gcc >= 7"
>  	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> -		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_6

This hunk does not apply, because it is missing the MMU dependency we
have in master (since 2013)...

Are you sure this was based on master and not on local changes?

Regards,
Yann E. MORIN.

> -comment "mpd needs a toolchain not affected by GCC bug 64735"
> -	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> +		!BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> +		!BR2_HOST_GCC_AT_LEAST_7
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
