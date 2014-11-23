From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Nov 2014 19:18:04 +0100
Subject: [Buildroot] [PATCH 3/5] ushare: do not allow building in static
 lib situations
In-Reply-To: <1416764163-12826-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416764163-12826-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1416764163-12826-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141123181804.GH11143@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-23 18:36 +0100, Thomas Petazzoni spake thusly:
> The ushare configure script is a custom shell script, and it is not
> designed to understand that the library order is important when doing
> static linking.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/32e/32ed2a521043f929cc290145c8a651e69042e104/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, see below...

> ---
>  package/ushare/Config.in | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ushare/Config.in b/package/ushare/Config.in
> index 981f081..7f817d2 100644
> --- a/package/ushare/Config.in
> +++ b/package/ushare/Config.in
> @@ -4,6 +4,10 @@ config BR2_PACKAGE_USHARE
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
>  	select BR2_PACKAGE_LIBUPNP
>  	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
> +	# ushare has a completely custom configure script that does
> +	# broken things with library ordering, which breaks static
> +	# linking.
> +	depends on !BR2_PREFER_STATIC_LIB
>  	help
>  	  uShare is a UPnP (TM) A/V & DLNA Media Server.
>  	  It implements the server component that provides UPnP media devices
> @@ -11,5 +15,5 @@ config BR2_PACKAGE_USHARE
>  
>  	  http://ushare.geexbox.org/
>  
> -comment "ushare needs a toolchain w/ largefile, threads"
> -	depends on !(BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_THREADS)
> +comment "ushare needs a toolchain w/ largefile, threads, dynamic library"
> +	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB

This line is now > 80 chars. Maybe it could be split?

Regards,
Yann E. MORIN.

> -- 
> 2.1.0
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
