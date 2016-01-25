From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 26 Jan 2016 00:06:14 +0100
Subject: [Buildroot] [PATCH 5/8] samba4: remove dependency on specific C
 libraries
In-Reply-To: <1453148701-10036-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453148701-10036-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56A6AA66.1060504@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Le 18/01/2016 21:24, Thomas Petazzoni a ?crit :
> samba4 relies on the $ORIGIN feature of the dynamic linker, which used
> to not be implemented in old uClibc versions. However:
> 
>  - this feature is supported by glibc
>  - this feature is supported by uClibc-ng, which is the only uClibc
>    version we are going to support
>  - this feature is supported by musl
> 
> Consequently, we can completely remove the dependency of samba4 on
> certain C libraries. This means that samba4 can now be built against
> the musl C library.

I'm not able to select samba4 with a musl toolchain.
Samba4 needs BR2_TOOLCHAIN_HAS_NATIVE_RPC which is not selected/detected with
internal/external toolchains.

So, no samba4 with musl for the moment ;-)

Best regards,
Romain

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/samba4/Config.in | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/package/samba4/Config.in b/package/samba4/Config.in
> index 1411b08..c53adba 100644
> --- a/package/samba4/Config.in
> +++ b/package/samba4/Config.in
> @@ -1,6 +1,5 @@
> -comment "samba4 needs an (e)glibc or uClibc-ng toolchain w/ RPC, wchar, dynamic library, threads"
> -	depends on (!BR2_TOOLCHAIN_USES_GLIBC && !BR2_UCLIBC_VERSION_NG) \
> -		|| !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_NATIVE_RPC \
> +comment "samba4 needs a toolchain w/ RPC, wchar, dynamic library, threads"
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_NATIVE_RPC \
>  		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU
>  
> @@ -12,8 +11,6 @@ config BR2_PACKAGE_SAMBA4
>  	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # python -> libffi
>  	depends on !BR2_STATIC_LIBS # python
> -	# needs $ORIGIN support
> -	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_UCLIBC_VERSION_NG
>  	depends on !BR2_nios2 # binary too large, relocations don't fit
>  	select BR2_PACKAGE_E2FSPROGS
>  	select BR2_PACKAGE_POPT
> 
