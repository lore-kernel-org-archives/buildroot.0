From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 22 Jan 2017 12:53:15 +0100
Subject: [Buildroot] [PATCH 1/1] rng-tools: Fix disabling package on
 non-x86 architectures.
In-Reply-To: <20170111161950.28199-1-nicolas.cavallari@green-communications.fr>
References: <20170111161950.28199-1-nicolas.cavallari@green-communications.fr>
Message-ID: <7ef3c048-373d-6318-bb07-a5c17d0b48dc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nicolas,

Le 11/01/2017 ? 17:19, Nicolas Cavallari a ?crit :
> Commit 2f89476 ("package/libgpg-error: bump to version 1.23") introduced
> a BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS which was added as a dependency
> to all libgpg-error reverse dependencies.
> 
> However, rng-tools only select libgpg-error if BR2_i386 || BR2_x86_64
> (for RDRAND) but the rng-tools dependency was added as
> BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS && (BR2_i386 || BR2_x86_64),
> Therefore limiting rng-tools to the x86 architecture.
> 
> This patch changes it as ..._ARCH_SUPPORT || !(BR2_i386 || BR2_x86_64).

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  package/rng-tools/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
> index 0c538cc292..b00477d336 100644
> --- a/package/rng-tools/Config.in
> +++ b/package/rng-tools/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_RNG_TOOLS
>  	bool "rng-tools"
> -	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS && (BR2_i386 || BR2_x86_64) # libgcrypt
> +	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS || !(BR2_i386 || BR2_x86_64) # libgcrypt
>  	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
>  	# For rdrand ligcrypt is required and it's not obvious to users
>  	select BR2_PACKAGE_LIBGCRYPT if BR2_i386 || BR2_x86_64
> 
