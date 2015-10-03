From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Oct 2015 21:50:40 +0100
Subject: [Buildroot] [PATCH v2 3/4] libnfs: Without native RPC use
 libtirpc
In-Reply-To: <1443901828-11390-3-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443901828-11390-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1443901828-11390-3-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <56103FA0.7050409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-10-15 20:50, Maxime Hadjinlian wrote:
> Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
> v1 -> v2:
> 	- Don't depends on blackfin toolchain (is removed by previous
> 	  patch)
> ---
>  package/libnfs/Config.in | 7 ++++---
>  package/libnfs/libnfs.mk | 4 ++++
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnfs/Config.in b/package/libnfs/Config.in
> index 6642fe4..2a1ef03 100644
> --- a/package/libnfs/Config.in
> +++ b/package/libnfs/Config.in
> @@ -1,10 +1,11 @@
>  config BR2_PACKAGE_LIBNFS
>  	bool "libnfs"
> -	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
> +	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  nfs userspace implementation.
>  
>  	  http://github.com/sahlberg/libnfs
>  
> -comment "libnfs needs a toolchain w/ RPC"
> -	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +comment "libnfs needs a toolchain w/ threads"
> +	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
> diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
> index 0c8c4f5..fb95e21 100644
> --- a/package/libnfs/libnfs.mk
> +++ b/package/libnfs/libnfs.mk
> @@ -13,4 +13,8 @@ LIBNFS_LICENSE = LGPLv2.1+
>  LIBNFS_LICENSE_FILES = LICENCE-LGPL-2.1.txt
>  LIBNFS_DEPENDENCIES = host-pkgconf
>  
> +ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
> +LIBNFS_DEPENDENCIES += libtirpc
> +endif
> +
>  $(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
