From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Jan 2020 21:41:11 +0100
Subject: [Buildroot] [PATCHv2] toolchain/external: allow custom
 toolchains to use newer headers
In-Reply-To: <20200106201012.11214-1-yann.morin.1998@free.fr>
References: <20200106201012.11214-1-yann.morin.1998@free.fr>
Message-ID: <20200106204111.GG2721@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2020-01-06 21:10 +0100, Yann E. MORIN spake thusly:
> From: Vincent Fazio <vfazio@xes-inc.com>
> 
> When Buildroot is released, it knows up to a certain kernel header
> version, and no later. However, it is possible that an external
> toolchain will be used, that uses headers newer than the latest
> version Buildroot knows about.
> 
> This may also happen when testing a development, rc-class kernel
> version.
> 
> In the current state, Buildroot would refuse to use such toolchains,
> because the test is for strict equality.
> 
> We'd like to make that situation possible, but we also want the user
> not to be lenient at the same time, and select the right headers
> version when it is known.
> 
> So, we add a new Kconfig blind option that the latest kernel headers
> version selects. This options is then used to decide whether we do a
> strict or loose check of the kernel headers.

As Vincent noticed (on IRC), this is missing the case for internal
toolchain with headers-same-as=kernel with kernels more recent than
what Buildroot knows about.

I'll send a fixed up version soonish.

Regards,
Yann E. MORIN.

> Suggested-by: Aaron Sierra <asierra@xes-inc.com>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> [yann.morin.1998 at free.fr: only do a loose check for the latest version]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> ---
> Changes v1 -> v2:  (Yann)
>   - make it loose only for the latest version
> ---
>  package/linux-headers/linux-headers.mk        |  3 +-
>  support/scripts/check-kernel-headers.sh       | 31 ++++++++++++++++---
>  toolchain/helpers.mk                          |  3 +-
>  .../pkg-toolchain-external.mk                 |  3 +-
>  .../Config.in.options                         | 15 +++++++++
>  5 files changed, 48 insertions(+), 7 deletions(-)
> 
> diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
> index 676c8c44ea..ee1a6c27d7 100644
> --- a/package/linux-headers/linux-headers.mk
> +++ b/package/linux-headers/linux-headers.mk
> @@ -135,7 +135,8 @@ define LINUX_HEADERS_CHECK_VERSION
>  	$(call check_kernel_headers_version,\
>  		$(BUILD_DIR),\
>  		$(STAGING_DIR),\
> -		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)))
> +		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)),
> +		strict)
>  endef
>  LINUX_HEADERS_POST_INSTALL_STAGING_HOOKS += LINUX_HEADERS_CHECK_VERSION
>  endif
> diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
> index 9d23c00feb..aafa7785c1 100755
> --- a/support/scripts/check-kernel-headers.sh
> +++ b/support/scripts/check-kernel-headers.sh
> @@ -1,9 +1,29 @@
>  #!/bin/sh
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
> +#
> +# That last conditions allows a user to provide a pre-built external
> +# toolchain that uses kernel headers more recent than what Buildroot
> +# knew when it was released.
> +
>  BUILDDIR="${1}"
>  SYSROOT="${2}"
>  # Make sure we have enough version components
>  HDR_VER="${3}.0.0"
> +CHECK="${4}"  # 'strict' or 'loose'
>  
>  HDR_M="${HDR_VER%%.*}"
>  HDR_V="${HDR_VER#*.}"
> @@ -32,16 +52,19 @@ ${HOSTCC} -imacros "${SYSROOT}/usr/include/linux/version.h" \
>  int main(int argc __attribute__((unused)),
>           char** argv __attribute__((unused)))
>  {
> -    if((LINUX_VERSION_CODE & ~0xFF)
> -        != KERNEL_VERSION(${HDR_M},${HDR_m},0))
> +    int ret = 0;
> +    int l = LINUX_VERSION_CODE & ~0xFF;
> +    int h = KERNEL_VERSION(${HDR_M},${HDR_m},0);
> +
> +    if(l != h)
>      {
>          printf("Incorrect selection of kernel headers: ");
>          printf("expected %d.%d.x, got %d.%d.x\n", ${HDR_M}, ${HDR_m},
>                 ((LINUX_VERSION_CODE>>16) & 0xFF),
>                 ((LINUX_VERSION_CODE>>8) & 0xFF));
> -        return 1;
> +        ret = ((l >= h ) && ("${CHECK}"[0] == 'l')) ? 0 : 1;
>      }
> -    return 0;
> +    return ret;
>  }
>  _EOF_
>  
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 996cc70d44..9a1f0495a5 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -161,9 +161,10 @@ copy_toolchain_sysroot = \
>  # $1: build directory
>  # $2: sysroot directory
>  # $3: kernel version string, in the form: X.Y
> +# $4: test to do, 'strict' or 'loose'
>  #
>  check_kernel_headers_version = \
> -	if ! support/scripts/check-kernel-headers.sh $(1) $(2) $(3); then \
> +	if ! support/scripts/check-kernel-headers.sh $(1) $(2) $(3) $(4); then \
>  		exit 1; \
>  	fi
>  
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 1c43409514..0f1a7a5cd3 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -542,7 +542,8 @@ define $(2)_CONFIGURE_CMDS
>  	$$(call check_kernel_headers_version,\
>  		$$(BUILD_DIR)\
>  		$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC)),\
> -		$$(call qstrip,$$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
> +		$$(call qstrip,$$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)),
> +		$(if $(BR2_TOOLCHAIN_EXTERNAL_HEADERS_LATEST),loose,strict)); \
>  	$$(call check_gcc_version,$$(TOOLCHAIN_EXTERNAL_CC),\
>  		$$(call qstrip,$$(BR2_TOOLCHAIN_GCC_AT_LEAST))); \
>  	if test "$$(BR2_arm)" = "y" ; then \
> diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> index 665765a104..ed0a1b4421 100644
> --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> @@ -92,6 +92,13 @@ config BR2_TOOLCHAIN_EXTERNAL_GCC_OLD
>  
>  endchoice
>  
> +# This should be selected by a single version, below, to indicate that
> +# Buildroot does not know of mor erecent headers than the ones selected.
> +# This allows using toolchains with headers more recent than Buildroot
> +# knows about, while still enforcing strict check for older headers.
> +config BR2_TOOLCHAIN_EXTERNAL_HEADERS_LATEST
> +	bool
> +
>  choice
>  	bool "External toolchain kernel headers series"
>  	default BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
> @@ -109,9 +116,17 @@ choice
>  	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
>  	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
>  
> +	  If your toolchain uses headers newer than the latest version
> +	  in the choice, then select the latest version.
> +
> +# Note: when adding a new version here, be sure to move the
> +# 'select BR2_TOOLCHAIN_EXTERNAL_HEADERS_LATEST' from the
> +# current "latest version" to that new "latest version".
> +
>  config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4
>  	bool "5.4.x"
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	select BR2_TOOLCHAIN_EXTERNAL_HEADERS_LATEST
>  
>  config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3
>  	bool "5.3.x"
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
