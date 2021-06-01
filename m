From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Jun 2021 22:39:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/directfb: disable on riscv32
In-Reply-To: <20210527205415.480887-1-fontaine.fabrice@gmail.com>
References: <20210527205415.480887-1-fontaine.fabrice@gmail.com>
Message-ID: <04be2355-aec8-670d-91e6-5f25c09a29fd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/05/2021 22:54, Fabrice Fontaine wrote:
> directfb unconditionally uses __NR_futex which will raise the following
> build failure on riscv32:
> 
> system.c:242:21: error: '__NR_futex' undeclared (first use in this function)
>   242 |      ret = syscall( __NR_futex, uaddr, op, val, timeout, uaddr2, val3 );

 This could probably be fixed by using __NR_futex64, but directfb is pretty dead
anyway.


 Applied to master, thanks.

 Regards,
 Arnout


>       |                     ^~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c0f4168575fa85af933539441eea95a3b10dac91
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/directfb/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/directfb/Config.in b/package/directfb/Config.in
> index 20481f56da..f4d6b8cbd1 100644
> --- a/package/directfb/Config.in
> +++ b/package/directfb/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_DIRECTFB
>  	bool "directfb"
> +	depends on !BR2_RISCV_32
>  	depends on !BR2_STATIC_LIBS # static link issues
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_INSTALL_LIBSTDCPP
> @@ -161,6 +162,7 @@ config BR2_PACKAGE_DIRECTFB_TESTS
>  endif # BR2_PACKAGE_DIRECTFB
>  
>  comment "directfb needs a glibc or uClibc toolchain w/ C++, NPTL, gcc >= 4.5, dynamic library"
> +	depends on !BR2_RISCV_32
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || BR2_TOOLCHAIN_USES_MUSL || \
> 
