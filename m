From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 16:07:23 +0100
Subject: [Buildroot] [PATCH] loosen threads dependency for nftables
In-Reply-To: <20150118142320.GR27361@marmot>
References: <20150118142320.GR27361@marmot>
Message-ID: <20150118150723.GJ4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander, All,

On 2015-01-18 14:23 +0000, Alexander Clouter spake thusly:
> nftables works fine without threads, only the XML parsing support requires
> -lpthreads so move the depends into BR2_PACKAGE_LIBNFTNL_XML.
> 
> Signed-off-by: Alexander Clouter <alex+buildroot@digriz.org.uk>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> --
> package/libnftnl/Config.in |   10 ++++++----
> package/nftables/Config.in |    6 ++----
> 2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/libnftnl/Config.in b/package/libnftnl/Config.in
> index ffd9d5b..af0bb4a 100644
> --- a/package/libnftnl/Config.in
> +++ b/package/libnftnl/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBNFTNL
> 	bool "libnftnl"
> 	depends on BR2_INET_IPV6
> 	depends on BR2_LARGEFILE
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> 	# bad headers, no sa_family_t in linux/socket.h
> 	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
> 	select BR2_PACKAGE_LIBMNL
> @@ -25,12 +24,15 @@ config BR2_PACKAGE_LIBNFTNL_JSON
> 
> config BR2_PACKAGE_LIBNFTNL_XML
> 	bool "enable XML support"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> 	select BR2_PACKAGE_MXML
> 	help
> 	  Enable XML parsing support
> 
> +comment "libnftnl XML parsing support needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
> endif
> 
> -comment "libnftnl needs a toolchain w/ threads, IPv6, largefile"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || \
> -		!BR2_LARGEFILE
> +comment "libnftnl needs a toolchain w/ IPv6, largefile"
> +	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE
> diff --git a/package/nftables/Config.in b/package/nftables/Config.in
> index 1e0798e..b7af244 100644
> --- a/package/nftables/Config.in
> +++ b/package/nftables/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_NFTABLES
> 	depends on BR2_INET_IPV6
> 	depends on BR2_LARGEFILE
> 	depends on BR2_USE_WCHAR
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
> 	select BR2_PACKAGE_GMP
> 	select BR2_PACKAGE_LIBMNL
> @@ -18,7 +17,6 @@ config BR2_PACKAGE_NFTABLES
> 
> 	  http://www.netfilter.org/projects/nftables/index.html
> 
> -comment "nftables needs a toolchain w/ IPv6, largefile, threads, wchar, headers >= 3.4"
> +comment "nftables needs a toolchain w/ IPv6, largefile, wchar, headers >= 3.4"
> 	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || \
> -		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
> -		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
> +		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
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
