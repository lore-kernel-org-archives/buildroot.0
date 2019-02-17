From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 17 Feb 2019 20:18:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: needs NPTL
In-Reply-To: <20190216104202.13511-1-fontaine.fabrice@gmail.com>
References: <20190216104202.13511-1-fontaine.fabrice@gmail.com>
Message-ID: <20139c84b00941198fea0b7391bac4ef6cdc2351.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2019-02-16 at 11:42 +0100, Fabrice Fontaine wrote:
> The software uses pthread_mutexattr_setrobust which isn't available in
> uClibc-ng Linuxthreads support.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/197615ad077b0a719954024c3ba182dac43a0555
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/upmpdcli/Config.in | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
> index 938024e8a2..74eb768830 100644
> --- a/package/upmpdcli/Config.in
> +++ b/package/upmpdcli/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_UPMPDCLI
>  	bool "upmpdcli"
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnpp
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11, libupnpp
>  	select BR2_PACKAGE_JSONCPP
>  	select BR2_PACKAGE_LIBMICROHTTPD
> @@ -15,6 +15,8 @@ config BR2_PACKAGE_UPMPDCLI
>  
>  	  http://www.lesbonscomptes.com/upmpdcli/
>  
> -comment "upmpdcli needs a toolchain w/ C++, threads, gcc >= 4.9"
> +comment "upmpdcli needs a toolchain w/ C++, NPTL, gcc >= 4.9"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +	depends on !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

pthread_mutexattr_setrobust and PTHREAD_MUTEXATTR_FLAG_ROBUST are only
available in NPTL [1]. Therefore:

Acked-by: J?rg Krause <joerg.krause@embedded.rocks>


[1] https://elixir.bootlin.com/uclibc-ng/v1.0.31/ident/PTHREAD_MUTEXATTR_FLAG_ROBUST
