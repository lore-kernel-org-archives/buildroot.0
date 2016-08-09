From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Aug 2016 21:51:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsidplay2: broken with gcc6
In-Reply-To: <1470771855-12987-1-git-send-email-bernd.kuhls@t-online.de>
References: <1470771855-12987-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160809195122.GE5779@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2016-08-09 21:44 +0200, Bernd Kuhls spake thusly:
> Also propagate reverse dependency to kodi-audiodecoder-sidplay.
> 
> Fixes
> http://autobuild.buildroot.net/results/4f5/4f57a7a37da0ce6d14a368272d982b4874a54927/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-audiodecoder-sidplay/Config.in | 1 +
>  package/libsidplay2/Config.in               | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/kodi-audiodecoder-sidplay/Config.in b/package/kodi-audiodecoder-sidplay/Config.in
> index ae99afa..db47a9c 100644
> --- a/package/kodi-audiodecoder-sidplay/Config.in
> +++ b/package/kodi-audiodecoder-sidplay/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_KODI_AUDIODECODER_SIDPLAY
>  	bool "kodi-audiodecoder-sidplay"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_6 # libsidplay2
>  	select BR2_PACKAGE_KODI_PLATFORM
>  	select BR2_PACKAGE_LIBSIDPLAY2
>  	help

You need to add a comment there:

    comment "kodi-audiodecoder-sidplay needs a toolchain w/ gcc < 6"
        depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_6

> diff --git a/package/libsidplay2/Config.in b/package/libsidplay2/Config.in
> index 5698367..34fa7f7 100644
> --- a/package/libsidplay2/Config.in
> +++ b/package/libsidplay2/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_LIBSIDPLAY2
>  	bool "libsidplay2"
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_6
>  	help
>  	  Sidplay 2 is the second in the Sidplay series originally developed by
>  	  Michael Schwendt. This version is written by Simon White and is cycle
> @@ -10,4 +11,5 @@ config BR2_PACKAGE_LIBSIDPLAY2
>  	  http://sourceforge.net/projects/sidplay2
>  
>  comment "libsidplay2 needs a toolchain w/ C++"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_6
>  	depends on !BR2_INSTALL_LIBSTDCPP

I guess this dependency should have been:

    comment "libsidplay2 needs a toolchain w/ gcc <6, C++"
        depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_6 \
                || !BR2_INSTALL_LIBSTDCPP

Becasue this is not an architecture feature: the user can actually
change something (i.i. either the gcc version or choose another
toolchain).

Regards,
Yann E. MORIN.

> -- 
> 2.8.1
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
