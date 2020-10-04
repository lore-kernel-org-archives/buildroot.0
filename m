From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 4 Oct 2020 22:29:35 +0200
Subject: [Buildroot] [PATCH] gcc: disable fortran use of libquadmath
In-Reply-To: <20200911124131.8549-1-matthew.weber@rockwellcollins.com>
References: <20200911124131.8549-1-matthew.weber@rockwellcollins.com>
Message-ID: <14e962ad-c83a-bf54-ba73-f8fad9fba322@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

Le 11/09/2020 ? 14:41, Matt Weber a ?crit?:
> The GCC package has a default conf option of disabling libquadmath and
> the toolchain dependencies selectively enabled it if i386 / x64.
> 
> Fixes:
> https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359622
> 
> This patch fixes a build failure when (GCC + glibc) is being built for
> the IBM Power8 arch and has libgfortran enabled + libquadmath disabled.
> The libgfortran has a code condition for __float128 and includes the
> quadmath headers. The bug occurs because Power8 has emulated
> float128 support. The fix per GCC options is to also set
> --disable-libquadmath-support which disables the
> __float128/libquadmath support in gcc/fortran and in libgfortran [1].
> 
> Another option to fix the build failure was to enable libquadmath for
> IBM Power8 (ISA 2.07), however this would be soft float based as the
> ISA 3.0+ (Power9) first supports native float128 [2][3].

I did a test with toolchain-builder this weekend using Buildroot's master branch
but without your patch (I missed that it was included for toolchain builder
release 2020.08-1). So I had the same issue...

I tried to fix it by enabling libquadmath even if it's a software support:
http://patchwork.ozlabs.org/project/buildroot/patch/20201004142050.2487724-1-romain.naour at gmail.com

But I can't really test the libquadmath solution since I'm only using qemu to do
a boot testing. So your proposal looks safer.

Best regards,
Romain

> 
> [1] https://fortran.gcc.gnu.narkive.com/8uSfoKUS/patch-build-pr-46540-add-disable-libquadmath-disable-libquadmath-support
> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=66382#c7
> [3] https://gcc.gnu.org/onlinedocs/gcc/RS_002f6000-and-PowerPC-Options.html
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/gcc/gcc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index b834269adc..c04d3b4d5c 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -116,7 +116,7 @@ endif
>  ifeq ($(BR2_USE_WCHAR)$(BR2_TOOLCHAIN_HAS_LIBQUADMATH),yy)
>  HOST_GCC_COMMON_CONF_OPTS += --enable-libquadmath
>  else
> -HOST_GCC_COMMON_CONF_OPTS += --disable-libquadmath
> +HOST_GCC_COMMON_CONF_OPTS += --disable-libquadmath --disable-libquadmath-support
>  endif
>  
>  # Disable libsanitizer due to a build issue with gcc 7.5 and glibc 2.31.
> 
