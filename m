From: Vincent Fazio <vfazio@xes-inc.com>
Date: Wed, 15 Jan 2020 12:44:23 -0600
Subject: [Buildroot] [PATCHv5] toolchain: allow using custom headers
 newer than latest known ones
In-Reply-To: <20200115182907.7104-1-yann.morin.1998@free.fr>
References: <20200115182907.7104-1-yann.morin.1998@free.fr>
Message-ID: <af743cd9-930a-ccd2-d513-3f9caff44220@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested-by: Vincent Fazio <vfazio@xes-inc.com>

On 1/15/20 12:29 PM, Yann E. MORIN wrote:
> From: Vincent Fazio <vfazio@xes-inc.com>
>
> When Buildroot is released, it knows up to a certain kernel header
> version, and no later. However, it is possible that an external
> toolchain will be used, that uses headers newer than the latest version
> Buildroot knows about.
>
> This may also happen when testing a development, an rc-class, or a newly
> released kernel, either in an external toolchain, or with an internal
> toolchain with custom headers (same-as-kernel, custom version, custom
> git, custom tarball).
>
> In the current state, Buildroot would refuse to use such toolchains,
> because the test is for strict equality.
>
> We'd like to make that situation possible, but we also want the user not
> to be lenient at the same time, and select the right headers version
> when it is known.
>
> So, we add a new Kconfig blind option that the latest kernel headers
> version selects. This options is then used to decide whether we do a
> strict or loose check of the kernel headers.
>
> Suggested-by: Aaron Sierra <asierra@xes-inc.com>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> [yann.morin.1998 at free.fr:
>    - only do a loose check for the latest version
>    - expand commit log
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>
> ---
> Changes v4 -> v5: (Yann)
>    - include string.h for strcmp()  (Vincent)
>
> Changes v3 -> v4: (Yann)
>    - fix commit title: it's not just about external toolchains  (Thomas)
>    - fix C-code coding style  (Thomas)
>    - add 'or later' to the prompts  (Thomas)
>
> Changes v2 -> v3:  (Yann)
>    - also handle the internal toolchain for custom headers
>      (noticed by Vincent)
>
> Changes v1 -> v2:  (Yann)
>    - make it loose only for the latest version
> ---
>   package/linux-headers/Config.in.host          |  5 +++-
>   package/linux-headers/linux-headers.mk        |  5 +++-
>   support/scripts/check-kernel-headers.sh       | 28 ++++++++++++++++---
>   toolchain/Config.in                           |  8 ++++++
>   toolchain/helpers.mk                          |  6 +++-
>   .../pkg-toolchain-external.mk                 |  3 +-
>   .../Config.in.options                         |  5 +++-
>   7 files changed, 51 insertions(+), 9 deletions(-)
>
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 6b6fe028c5..905497f496 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -118,8 +118,11 @@ choice
>   	  This is used to hide/show some packages that have strict
>   	  requirements on the version of kernel headers.
>   
> +	  If your kernel headers are more recent than the latest version
> +	  in the choice, then select the latest version.
> +
>   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4
> -	bool "5.4.x"
> +	bool "5.4.x or later"
>   	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>   
>   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3
> diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
> index 676c8c44ea..d653c951fd 100644
> --- a/package/linux-headers/linux-headers.mk
> +++ b/package/linux-headers/linux-headers.mk
> @@ -131,11 +131,14 @@ define LINUX_HEADERS_INSTALL_STAGING_CMDS
>   endef
>   
>   ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR2_KERNEL_HEADERS_AS_KERNEL)$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL)$(BR2_KERNEL_HEADERS_CUSTOM_GIT),y)
> +# In this case, we must always do a 'loose' test, because they are all
> +# custom versions which may be later than what we know right now.
>   define LINUX_HEADERS_CHECK_VERSION
>   	$(call check_kernel_headers_version,\
>   		$(BUILD_DIR),\
>   		$(STAGING_DIR),\
> -		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)))
> +		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)),\
> +		loose)
>   endef
>   LINUX_HEADERS_POST_INSTALL_STAGING_HOOKS += LINUX_HEADERS_CHECK_VERSION
>   endif
> diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
> index 9d23c00feb..d1864cb05e 100755
> --- a/support/scripts/check-kernel-headers.sh
> +++ b/support/scripts/check-kernel-headers.sh
> @@ -1,9 +1,25 @@
>   #!/bin/sh
>   
> +# This script (and the embedded C code) will check that the actual
> +# headers version match the user told us they were:
> +#
> +# - if both versions are the same, all is well.
> +#
> +# - if the actual headers are older than the user told us, this is
> +#   an error.
> +#
> +# - if the actual headers are more recent than the user told us, and
> +#   we are doing a strict check, then this is an error.
> +#
> +# - if the actual headers are more recent than the user told us, and
> +#   we are doing a loose check, then a warning is printed, but this is
> +#   not an error.
> +
>   BUILDDIR="${1}"
>   SYSROOT="${2}"
>   # Make sure we have enough version components
>   HDR_VER="${3}.0.0"
> +CHECK="${4}"  # 'strict' or 'loose'
>   
>   HDR_M="${HDR_VER%%.*}"
>   HDR_V="${HDR_VER#*.}"
> @@ -28,20 +44,24 @@ ${HOSTCC} -imacros "${SYSROOT}/usr/include/linux/version.h" \
>             -x c -o "${EXEC}" - <<_EOF_
>   #include <stdio.h>
>   #include <stdlib.h>
> +#include <string.h>
>   
>   int main(int argc __attribute__((unused)),
>            char** argv __attribute__((unused)))
>   {
> -    if((LINUX_VERSION_CODE & ~0xFF)
> -        != KERNEL_VERSION(${HDR_M},${HDR_m},0))
> +    int ret = 0;
> +    int l = LINUX_VERSION_CODE & ~0xFF;
> +    int h = KERNEL_VERSION(${HDR_M},${HDR_m},0);
> +
> +    if(l != h)
>       {
>           printf("Incorrect selection of kernel headers: ");
>           printf("expected %d.%d.x, got %d.%d.x\n", ${HDR_M}, ${HDR_m},
>                  ((LINUX_VERSION_CODE>>16) & 0xFF),
>                  ((LINUX_VERSION_CODE>>8) & 0xFF));
> -        return 1;
> +        ret = ((l >= h) && !strcmp("${CHECK}", "loose")) ? 0 : 1;
>       }
> -    return 0;
> +    return ret;
>   }
>   _EOF_
>   
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 858121d2c5..973c03254f 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -457,6 +457,14 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
>   config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>   	bool
>   	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
> +	select BR2_TOOLCHAIN_HEADERS_LATEST
> +
> +# This should be selected by the latest version, above, to indicate that
> +# Buildroot does not know of more recent headers than the ones selected.
> +# This allows using toolchains with headers more recent than Buildroot
> +# knows about, while still enforcing strict check for older headers.
> +config BR2_TOOLCHAIN_HEADERS_LATEST
> +	bool
>   
>   # This order guarantees that the highest version is set, as kconfig
>   # stops affecting a value on the first matching default.
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 996cc70d44..2c2a987c3e 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -161,9 +161,13 @@ copy_toolchain_sysroot = \
>   # $1: build directory
>   # $2: sysroot directory
>   # $3: kernel version string, in the form: X.Y
> +# $4: test to do for the latest kernel version, 'strict' or 'loose'
> +#     always 'strict' if this is not the latest version.
>   #
>   check_kernel_headers_version = \
> -	if ! support/scripts/check-kernel-headers.sh $(1) $(2) $(3); then \
> +	if ! support/scripts/check-kernel-headers.sh $(1) $(2) $(3) \
> +		$(if $(BR2_TOOLCHAIN_HEADERS_LATEST),$(4),strict); \
> +	then \
>   		exit 1; \
>   	fi
>   
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 1c43409514..b01082aadd 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -542,7 +542,8 @@ define $(2)_CONFIGURE_CMDS
>   	$$(call check_kernel_headers_version,\
>   		$$(BUILD_DIR)\
>   		$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC)),\
> -		$$(call qstrip,$$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
> +		$$(call qstrip,$$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)),\
> +		$$(if $$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM),loose,strict)); \
>   	$$(call check_gcc_version,$$(TOOLCHAIN_EXTERNAL_CC),\
>   		$$(call qstrip,$$(BR2_TOOLCHAIN_GCC_AT_LEAST))); \
>   	if test "$$(BR2_arm)" = "y" ; then \
> diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> index 665765a104..81ace76493 100644
> --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> @@ -109,8 +109,11 @@ choice
>   	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
>   	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
>   
> +	  If your toolchain uses headers newer than the latest version
> +	  in the choice, then select the latest version.
> +
>   config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4
> -	bool "5.4.x"
> +	bool "5.4.x or later"
>   	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>   
>   config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3

-- 
Vincent Fazio
Embedded Software Engineer - Linux
Extreme Engineering Solutions, Inc
http://www.xes-inc.com
