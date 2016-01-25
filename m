From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 25 Jan 2016 23:16:35 +0100
Subject: [Buildroot] [PATCH 2/8] lttng-babeltrace: make available for
 all C libraries
In-Reply-To: <1453148701-10036-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453148701-10036-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56A69EC3.6000608@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 18/01/2016 21:24, Thomas Petazzoni a ?crit :
> Due to posix_fallocate() being unavailable in uClibc 0.9.33, libunwind
> was marked as available only for uClibc snapshot in glibc. However:
> 
>  - lttng-babeltrace builds fine with musl
>  - lttng-babeltrace builds fine with uClibc-ng
>  - we're going to get rid of uClibc 0.9.33 support
>  - the only toolchain left with an old uClibc version is the Blackfin
>    Analog Devices toolchain, and lttng-babeltrace cannot be enabled on
>    non-MMU platforms
> 
> Conclusion: we can enable lttng-babeltrace on all C libraries, and no
> longer require any condition. This commit adjusts the libunwind

s/libunwind/lttng-babeltrace/

> package accordingly.

Build tested on x86_64 musl toolchain.
Build tested on powerpc uClibc-ng toolchain.

Tested-by: Romain Naour <romain.naour@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/lttng-babeltrace/Config.in | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
> index 633ea3d..d362779 100644
> --- a/package/lttng-babeltrace/Config.in
> +++ b/package/lttng-babeltrace/Config.in
> @@ -7,7 +7,6 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
>  	depends on BR2_USE_WCHAR # libglib2, util-linux
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
>  	depends on BR2_USE_MMU # libglib2
> -	depends on BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC # posix_fallocate
>  	help
>  	  The Babeltrace project provides trace read and write
>  	  libraries, as well as a trace converter application. Plugins
> @@ -28,7 +27,6 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
>  
>  	  http://www.efficios.com/babeltrace
>  
> -comment "lttng-babeltrace needs a uclibc snapshot or (e)glib toolchain w/ wchar, threads"
> +comment "lttng-babeltrace needs a toolchain w/ wchar, threads"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC)
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> 
