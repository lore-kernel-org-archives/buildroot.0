From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 6 Nov 2016 23:43:44 +0100
Subject: [Buildroot] [PATCH] package/guile: disable for CS 2014.05 ARM
	toolchain
In-Reply-To: <1478471537-29327-1-git-send-email-romain.naour@gmail.com>
References: <1478471537-29327-1-git-send-email-romain.naour@gmail.com>
Message-ID: <0aee83aa-9473-e4d3-4fa3-7dadf67cf665@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 06/11/2016 ? 23:32, Romain Naour a ?crit :
> With this toolchain, guile tigger an assembler error probably caused by
> the binutils version being used:
> 
> arm-none-linux-gnueabi-ld --version
> GNU ld (Sourcery CodeBench Lite 2014.05-29) 2.24.51.20140217
> 
> arm-none-linux-gnueabi-gcc --version
> arm-none-linux-gnueabi-gcc (Sourcery CodeBench Lite 2014.05-29) 4.8.3 20140320 (prerelease)
> 
> Nowaday, even with a Buildroot internal toolchain using the oldest
> Binutils GCC version (2.25.1 and 4.8.6), guile build fine.
> 
> So, disable guile for the CS 2014.05 ARM toolchain.

I forgot to test with different optimization option...
The assembler message is trigged only when -Os is used.

We may simply force -O2 when this toolchain is used.

Best regards,
Romain

> 
> Fixes:
> http://autobuild.buildroot.net/results/976/976b3477407e64c8c2fc2309ed952d0083903a19
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/guile/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/guile/Config.in b/package/guile/Config.in
> index e0f6571..bfba5e7 100644
> --- a/package/guile/Config.in
> +++ b/package/guile/Config.in
> @@ -1,5 +1,7 @@
>  config BR2_PACKAGE_GUILE
>  	bool "guile"
> +	# Triggers assembler error
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
>  	depends on !BR2_TOOLCHAIN_USES_MUSL # no strtol_l
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # bdwgc
> @@ -17,6 +19,7 @@ config BR2_PACKAGE_GUILE
>  	  http://www.gnu.org/software/guile
>  
>  comment "guile needs a uClibc or glibc toolchain w/ threads, wchar, dynamic library"
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
>  		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
>  
> 
