From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Aug 2016 16:15:10 +0200
Subject: [Buildroot] [PATCH/next] gcc: fix gcc version dependencies for
 the PowerPC64/musl exclusion
In-Reply-To: <1471701919-30534-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471701919-30534-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160820141510.GB5784@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-20 16:05 +0200, Thomas Petazzoni spake thusly:
> In commit
> 5ab751ca44e9da6f406876ff582b3a813056b0d4 ("toolchain-buildroot: allow to
> build ppc64(le) musl toolchains"), support for building a musl toolchain
> for ppc64(le) was added. Since this support only works with gcc 6, some
> additional dependencies have been added to the older gcc versions so
> that they cannot be selected on ppc64(le)/musl.
> 
> Unfortunately, the expression of the dependency was wrong, and leads to
> those older gcc versions being non-selectable if you're not using
> musl. Indeed, the dependencies look like this:
> 
>   depends on !BR2_powerpc64 && !BR2_powerpc64le && BR2_TOOLCHAIN_USES_MUSL
> 
> So as soon as you're not using musl, BR2_TOOLCHAIN_USES_MUSL is false,
> so the entire condition is false, and the gcc version is not available.
> 
> Due to this, only gcc 6.x can be selected currently with uclibc or
> glibc, which is clearly not the intended behavior.
> 
> This commit reworks those dependencies to:
> 
>   depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
> 
> which more clearly expresses what we want:
> 
>  "We don't want to (have a toolchain that uses musl and (be building
>   either for PPC64 or PPC64le))"

Alternatively, you could have done (which is exactly the same, if you
use the De Morgan's law):

    depends on !BR2_powerpc64 && !BR2_powerpc64le || !BR2_TOOLCHAIN_USES_MUSL

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gcc/Config.in.host | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 4d02931..37728e0 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -31,7 +31,7 @@ choice
>  		# Unsupported for MIPS R6
>  		depends on !BR2_mips_32r6 && !BR2_mips_64r6
>  		# musl ppc64 unsupported
> -		depends on !BR2_powerpc64 && !BR2_powerpc64le && BR2_TOOLCHAIN_USES_MUSL
> +		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
>  		select BR2_GCC_NEEDS_MPC
>  		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
>  
> @@ -49,7 +49,7 @@ choice
>  		# Unsupported for MIPS R6
>  		depends on !BR2_mips_32r6 && !BR2_mips_64r6
>  		# musl ppc64 unsupported
> -		depends on !BR2_powerpc64 && !BR2_powerpc64le && BR2_TOOLCHAIN_USES_MUSL
> +		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
>  		select BR2_GCC_NEEDS_MPC
>  		select BR2_GCC_SUPPORTS_GRAPHITE
>  		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> @@ -71,7 +71,7 @@ choice
>  		# Unsupported for MIPS R6
>  		depends on !BR2_mips_32r6 && !BR2_mips_64r6
>  		# musl ppc64 unsupported
> -		depends on !BR2_powerpc64 && !BR2_powerpc64le && BR2_TOOLCHAIN_USES_MUSL
> +		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
>  		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
>  		select BR2_GCC_NEEDS_MPC
>  		select BR2_GCC_SUPPORTS_GRAPHITE
> @@ -82,7 +82,7 @@ choice
>  		# Broken or unsupported architectures
>  		depends on !BR2_arc && !BR2_bfin
>  		# musl ppc64 unsupported
> -		depends on !BR2_powerpc64 && !BR2_powerpc64le && BR2_TOOLCHAIN_USES_MUSL
> +		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
>  		select BR2_GCC_NEEDS_MPC
>  		select BR2_GCC_SUPPORTS_GRAPHITE
>  		select BR2_TOOLCHAIN_GCC_AT_LEAST_5
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
