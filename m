From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Aug 2016 22:11:55 +0200
Subject: [Buildroot] [PATCH] libunwind: fix architecture dependencies
In-Reply-To: <1470559598-21216-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470559598-21216-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160807201155.GF5855@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-07 10:46 +0200, Thomas Petazzoni spake thusly:
> Due to a misplaced parenthesis, the libunwind dependency were
> incorrect. Indeed, they were of the form:
> 
>  default y if LIBC_TYPE && (arm dependency) || (list of other architectures)
> 
> Which meant that that the LIBC_TYPE dependency was not taken into
> account for the "other architectures". This commit changes that to:
> 
>  default y if LIBC_TYPE && ((arm dependency) || list of other architectures)
> 
> Without this fix, libunwind can be selected for example on
> PowerPC/uClibc configurations, while only PowerPC/glibc should be
> allowed. This fixes:
> 
>   http://autobuild.buildroot.net/results/96c53ff240dcd68fcc9e3d32c4026c9886edcbe7/
> 
> Similarly, it also fixes cases where SuperH/uClibc was allowed, while
> only SuperH/glibc should be allowed. This fixes:
> 
>   http://autobuild.buildroot.net/results/95a6cca21aea9914ba8bb3f571760fc054c53ecd/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libunwind/Config.in | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
> index a70d9e8..04ab5a5 100644
> --- a/package/libunwind/Config.in
> +++ b/package/libunwind/Config.in
> @@ -10,16 +10,16 @@
>  config BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
>  	bool
>  	default y if BR2_TOOLCHAIN_USES_GLIBC && \
> -		((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
> -		(BR2_mips || BR2_mipsel || BR2_mips64 || \
> +		(((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
> +		 BR2_mips || BR2_mipsel || BR2_mips64 || \
>  		 BR2_mips64el || BR2_powerpc || BR2_sh || BR2_sh64 || BR2_i386 || BR2_x86_64)
>  	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
> -		((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
> -		(BR2_i386 || BR2_mips || BR2_mipsel || \
> +		(((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
> +		 BR2_i386 || BR2_mips || BR2_mipsel || \
>  		 BR2_mips64 || BR2_mips64el || BR2_x86_64)
>  	default y if BR2_TOOLCHAIN_USES_MUSL && \
> -		((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
> -		(BR2_i386 || BR2_x86_64)
> +		(((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
> +		 BR2_i386 || BR2_x86_64)
>  
>  config BR2_PACKAGE_LIBUNWIND
>  	bool "libunwind"
> -- 
> 2.7.4
> 
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
