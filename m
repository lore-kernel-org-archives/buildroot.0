From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Wed, 26 Sep 2018 22:23:56 +0200
Subject: [Buildroot] [PATCH 2/2] nilfs-utils: drop NPTL dependency
In-Reply-To: <20180926182045.28484-2-fontaine.fabrice@gmail.com>
References: <20180926182045.28484-1-fontaine.fabrice@gmail.com>
 <20180926182045.28484-2-fontaine.fabrice@gmail.com>
Message-ID: <20180926202356.GC27972@airbook.echont.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On wo, 26 sep 2018 20:20:45 +0200, Fabrice Fontaine wrote:
> The latest uClibc-ng version (1.0.30) provides clock_nanosleep() even
> for non NPTL configurations.

Do you mean that buildroot must only be built with uClibc-ng > 1.0.30?

> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/nilfs-utils/Config.in | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/nilfs-utils/Config.in b/package/nilfs-utils/Config.in
> index e245dc4656..7b239b1af5 100644
> --- a/package/nilfs-utils/Config.in
> +++ b/package/nilfs-utils/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_NILFS_UTILS
>  	bool "nilfs-utils"
>  	depends on BR2_USE_MMU # util-linux libmount, libblkid
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # sem_open()
> -	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()

I think you break other configurations here.
Did you try testbuilds with this change?

I remember a strong debate some time ago where the final outcome was
that this constructs is put on several places, and that it would be
better to introduce something like BR2_TOOLCHAIN_HAS_CLOCK_NANOSLEEP
or something alike instead. This would really solve the issue.

>  	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>  	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
> @@ -12,7 +11,6 @@ config BR2_PACKAGE_NILFS_UTILS
>  
>  	  https://github.com/nilfs-dev/nilfs-utils
>  
> -comment "nilfs-utils needs a toolchain w/ threads, NPTL"
> +comment "nilfs-utils needs a toolchain w/ threads"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

Kurt
