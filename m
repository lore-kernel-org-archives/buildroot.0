From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Mar 2014 15:10:48 +0200
Subject: [Buildroot] [[RFC]] toolchain: print actual version of kernel
 headers when checking
In-Reply-To: <1396184370-4204-1-git-send-email-yann.morin.1998@free.fr>
References: <1396184370-4204-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140330131048.GC3152@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

On 2014-03-30 14:59 +0200, Yann E. MORIN spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>

It just occured to me I forgot to explain in the commit log what this
was for. So here are the explanations:

Since we introduced the _AT_LEAST_XXX for the kernel headers, people
using pre-built custom toolchain now have to specify the version of
the kernel headers their custom toolchain uses.

So, when we detect that there is a mismatch between the selection in
the menuconfig, and the actual version of the headers, we currently
only bail out with a terse message "Incorrect selection of kernel
headers".

This could be confusing some, and getting the version of the headers
used by the toolchain is not trivial (well, it's very easy, but not
trivial.)

This patch changes the way we report the error by moving the message
into the test-code, and by printing the expected and actual versions
of the kernel headers.

BUT! To get this pretty error message, we need to run the test-program,
so we can not use the cross-toolchain, we have to use the native one.

BUT! The native one has its own linux/version.h header, so we can not
simply include it.

So, we ask the cross-compiler where its default sysroot is, and use that
to then force-feed the cross linux/version.h to the native toolchain.


This is only an RFC for now, as I am not very happy with how I got the
sysroot of the compiler. If there is a better way, I'm all ears and
eyes.

Regards,
Yann E. MORIN.


> Reported-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/scripts/check-kernel-headers.sh | 39 ++++++++++++++++++++++++++++-----
>  toolchain/helpers.mk                    |  3 +--
>  2 files changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
> index d7fe7d4..2b4ee36 100755
> --- a/support/scripts/check-kernel-headers.sh
> +++ b/support/scripts/check-kernel-headers.sh
> @@ -8,14 +8,43 @@ HDR_M="${HDR_VER%%.*}"
>  HDR_V="${HDR_VER#*.}"
>  HDR_m="${HDR_V%%.*}"
>  
> +EXEC="/tmp/br.check-headers.$(uuidgen)"
> +
> +# By the time we get here, we do not always have the staging-dir
> +# already populated (think external toolchain), so we can not use
> +# it.
> +# So we just ask the cross compiler what its default sysroot is.
> +# For multilib-aware toolchains where we should use a non-default
> +# sysroot, it's not really a problem since the version of the kernel
> +# headers is the same for all sysroots.
> +SYSROOT=$( ${CC} -print-sysroot )
> +
>  # We do not want to account for the patch-level, since headers are
>  # not supposed to change for different patchlevels, so we mask it out.
>  # This only applies to kernels >= 3.0, but those are the only one
>  # we actually care about; we treat all 2.6.x kernels equally.
> +${HOSTCC} -imacros "${SYSROOT}/usr/include/linux/version.h" \
> +          -x c -o "${EXEC}" - <<_EOF_
> +#include <stdio.h>
> +#include <stdlib.h>
>  
> -exec ${CC} -E -x c -o - - >/dev/null 2>&1 <<_EOF_
> -#include <linux/version.h>
> -#if (LINUX_VERSION_CODE & ~0xFF) != KERNEL_VERSION(${HDR_M},${HDR_m},0)
> -#error Incorrect kernel header version.
> -#endif
> +int main( int argc __attribute__((unused)),
> +          char** argv __attribute__((unused)) )
> +{
> +    if(    (LINUX_VERSION_CODE & ~0xFF)
> +        != KERNEL_VERSION(${HDR_M},${HDR_m},0) )
> +    {
> +        printf( "Incorrect selection of kernel headers:\n" );
> +        printf( "Expected %d.%d.x, got %d.%d.x\n", ${HDR_M}, ${HDR_m},
> +                ((LINUX_VERSION_CODE>>16) & 0xFF),
> +                ((LINUX_VERSION_CODE>>8) & 0xFF) );
> +        return 1;
> +    }
> +    return 0;
> +}
>  _EOF_
> +
> +"${EXEC}"
> +ret=${?}
> +rm -f "${EXEC}"
> +exit ${ret}
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 64d5095..6875916 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -171,8 +171,7 @@ copy_toolchain_sysroot = \
>  #
>  check_kernel_headers_version = \
>  	if ! support/scripts/check-kernel-headers.sh $(1) $(2); then \
> -		echo "Incorrect selection of kernel headers"; \
> -	    exit 1; \
> +		exit 1; \
>  	fi
>  
>  #
> -- 
> 1.8.3.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
