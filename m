From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Nov 2020 21:16:40 +0100
Subject: [Buildroot] [PATCH] external-toolchain: Detect linux/version.h
 via cross compiler
In-Reply-To: <20201023093641.619746-1-raj.khem@gmail.com>
References: <20201023093641.619746-1-raj.khem@gmail.com>
Message-ID: <20201103201640.GI2887157@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Khem, All,

On 2020-10-23 02:36 -0700, Khem Raj spake thusly:
> Using linux/version.h is assumed to be hardcoded inside sysroot but this
> does not consider the case where toolchains might be built with
> --with-native-system-header-dir which means the header directories will
> not be under <sysroot>/usr/include but customized, archlinux, debian
> built cross toolchains use these install settings ( due to multiarch )
> they have the headers installed like /usr/aarch64-linux-gnu/include and
> not /usr/aarch64-linux-gnu/usr/include
> 
> This patch adds logic to use cross compiler to compute the path to
> linux/version.h on the fly, it means we do not really need to assume the
> install structure
> 
> Fixes built when using external toolchains provided by archlinux e.g.

So, to summarise our previous discussion on IRC the other day:

  - Buildroot does not officially support distributions' cross
    toolchains, as they may contain extra libraries that are not
    accoutned for by Buildroot,

  - those toolchains are also not always relocatable, even if some
    might be.

Also, Thomas since replied with further questionning, so we really need
a bit more details in there, and how you manage to make it work.

Regards,
Yann E. MORIN.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/check-kernel-headers.sh           | 15 ++++++++++++++-
>  toolchain/helpers.mk                              |  2 +-
>  .../toolchain-external/pkg-toolchain-external.mk  |  3 ++-
>  3 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
> index 4e6dce5487..5cedb9a082 100755
> --- a/support/scripts/check-kernel-headers.sh
> +++ b/support/scripts/check-kernel-headers.sh
> @@ -21,6 +21,9 @@ SYSROOT="${2}"
>  HDR_VER="${3}.0.0"
>  CHECK="${4}"  # 'strict' or 'loose'
>  
> +# cross compiler passed in case of external toolchains
> +CROSS_CC="${5}"
> +
>  HDR_M="${HDR_VER%%.*}"
>  HDR_V="${HDR_VER#*.}"
>  HDR_m="${HDR_V%%.*}"
> @@ -36,11 +39,21 @@ trap 'rm -f "${EXEC}"' EXIT
>  
>  EXEC="$(mktemp -p "${BUILDDIR}" -t .check-headers.XXXXXX)"
>  
> +if [ -n "${CROSS_CC}" ]; then
> +  MAKE_VER_H=$(${CROSS_CC} -M -xc - <<_EOF_
> +#include <linux/version.h>
> +_EOF_
> +  )
> +  VER_H=`echo $MAKE_VER_H | awk 'END {print $NF}'`
> +else
> +  VER_H="${SYSROOT}/usr/include/linux/version.h"
> +fi
> +
>  # We do not want to account for the patch-level, since headers are
>  # not supposed to change for different patchlevels, so we mask it out.
>  # This only applies to kernels >= 3.0, but those are the only one
>  # we actually care about; we treat all 2.6.x kernels equally.
> -${HOSTCC} -imacros "${SYSROOT}/usr/include/linux/version.h" \
> +${HOSTCC} -imacros "${VER_H}" \
>            -x c -o "${EXEC}" - <<_EOF_
>  #include <stdio.h>
>  #include <stdlib.h>
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 17bc159f3e..51d840b176 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -166,7 +166,7 @@ copy_toolchain_sysroot = \
>  #
>  check_kernel_headers_version = \
>  	if ! support/scripts/check-kernel-headers.sh $(1) $(2) $(3) \
> -		$(if $(BR2_TOOLCHAIN_HEADERS_LATEST),$(4),strict); \
> +		$(if $(BR2_TOOLCHAIN_HEADERS_LATEST),$(4),strict) $(5); \
>  	then \
>  		exit 1; \
>  	fi
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 6d91cb5d1e..93f725dada 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -549,7 +549,8 @@ define $(2)_CONFIGURE_CMDS
>  		$$(BUILD_DIR),\
>  		$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC)),\
>  		$$(call qstrip,$$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)),\
> -		$$(if $$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM),loose,strict)); \
> +		$$(if $$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM),loose,strict),\
> +		$$(TOOLCHAIN_EXTERNAL_CC)); \
>  	$$(call check_gcc_version,$$(TOOLCHAIN_EXTERNAL_CC),\
>  		$$(call qstrip,$$(BR2_TOOLCHAIN_GCC_AT_LEAST))); \
>  	if test "$$(BR2_arm)" = "y" ; then \
> -- 
> 2.29.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
