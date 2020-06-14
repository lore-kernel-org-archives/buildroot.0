From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 11:44:19 +0200
Subject: [Buildroot] [PATCH v1 1/3] package/iwd: needs dbus (runtime)
In-Reply-To: <20200612232433.18442-1-ps.report@gmx.net>
References: <20200612232433.18442-1-ps.report@gmx.net>
Message-ID: <20200614094419.GI2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-06-13 01:24 +0200, Peter Seiderer spake thusly:
> Fixes (on startup):
> 
>   $ usr/libexec/iwd
>   Wireless daemon version 1.7
>   Failed to initialize D-Bus
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, after fixing two minor nits:
  - move MMU dependency first
  - split long line in comment dependencies

Thanks.

Regards,
Yann E. MORIN.

> ---
> Note:
>  - for an alternative iwd without dbus demand take a lookt at
>    https://github.com/dylanaraps/eiwd
> ---
>  package/iwd/Config.in | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/iwd/Config.in b/package/iwd/Config.in
> index eff24a8599..4501017630 100644
> --- a/package/iwd/Config.in
> +++ b/package/iwd/Config.in
> @@ -1,16 +1,20 @@
>  config BR2_PACKAGE_IWD
>  	bool "iwd"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
> +	depends on BR2_USE_MMU # dbus
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
>  	depends on !BR2_STATIC_LIBS # ell
>  	depends on BR2_USE_WCHAR # ell
> +	select BR2_PACKAGE_DBUS # runtime
>  	select BR2_PACKAGE_ELL
>  	help
>  	  iNet Wireless daemon (iwd)
>  
>  	  https://iwd.wiki.kernel.org/
>  
> -comment "iwd needs a toolchain w/ dynamic library, wchar, headers >= 4.12"
> +comment "iwd needs a toolchain w/ threads, dynamic library, wchar, headers >= 4.12"
> +	depends on BR2_USE_MMU # dbus
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
> -	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
>  		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
> -- 
> 2.26.2
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
