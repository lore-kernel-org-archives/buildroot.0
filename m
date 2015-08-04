From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Aug 2015 21:49:48 +0200
Subject: [Buildroot] [PATCH 3/9] toolchain-external: add support for gcc
 version dependency
In-Reply-To: <1438711241-31792-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1438711241-31792-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150804194948.GV3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On 2015-08-04 20:00 +0200, Thomas Petazzoni spake thusly:
> This commit wires up the gcc version dependency mechanism in the
> external toolchain backend. To do so, it:
> 
>  * Changes the definition of all pre-defined external toolchain
>    profiles to select the appropriate BR2_TOOLCHAIN_GCC_AT_LEAST_*
>    option.
> 
>  * For custom external toolchains, provides a visible Config.in
>    "choice" to select the gcc version used in the external toolchain.
> 
>  * Adds a new check_gcc_version function, that verifies that the real
>    gcc version found in the external toolchain matches the one
>    declared in the Buildroot configuration.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/helpers.mk                               | 22 +++++++
>  toolchain/toolchain-external/Config.in             | 70 ++++++++++++++++++++++
>  toolchain/toolchain-external/toolchain-external.mk |  2 +
>  3 files changed, 94 insertions(+)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 895f3f1..038939c 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -175,6 +175,28 @@ check_kernel_headers_version = \
>  	fi
>  
>  #
> +# Check the specific gcc version actually matches the version in the
> +# toolchain
> +#
> +# $1: path to gcc
> +# $2: expected gcc version
> +#
> +# The first 'sed' removes everything but the last word of the line,
> +# which contains the gcc version.

That's not true for the BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64 toolchain:

    $ ./host/opt/ext-toolchain/bin/aarch64-linux-gnu-gcc --version
    aarch64-linux-gnu-gcc (crosstool-NG linaro-1.13.1-4.9-2014.09 -
    Linaro GCC 4.9-2014.09) 4.9.2 20140904 (prerelease)

Here's a better sed-expr that should match it too, as well as the other
gcc versions; we'll make the assumption that the version string is right
after the first closing parenthesis:

    sed -r -e '1!d; s/^[^)]+\) ([^[:space:]]+).*/\1/; s/\.[[:digit:]]+$//;'

Explanations;

  - 1!d
      - delete if not line 1  (i.e. your 'head -n1')

  - s/^[^)]+\) ([^[:space:]]+).*/\1/
      - eat all until the first ')' character followed by a space
      - match as many non-space chars as possible
      - eat all the remaining chars on the line
      - replace by the matched expression

  - s/\.[[:digit:]]+$//
      - eat a dot followed by as many digits as possible up to the end
        of line
      - replace with nothing

Notes:
  - it's an extended regexp, because [...] is not valid in a standard
    regexp, and doing without it is much more complex;
  - it's a single sed invocation, no need for head or many sed calls.

Regards,
Yann E. MORIN.

> +# The second 'sed' removes the last digit of the version (i.e 4.9.3
> +# becomes 4.9 and 5.1 becomes 5), which allows to match on the gcc
> +# major version only.
> +#
> +check_gcc_version = \
> +	expected_version="$(strip $2)" ; \
> +	real_version=`$(1) --version | head -1 | sed 's%.* %%g' | sed 's%\(.*\)\.[0-9]%\1%'` ; \
> +	if [ "$${real_version}" != "$${expected_version}" ] ; then \
> +		echo "Incorrect selection of gcc version: expected $${expected_version}, got $${real_version}" ; \
> +		exit 1 ; \
> +	fi
> +
> +#
>  # Check the availability of a particular glibc feature. This function
>  # is used to check toolchain options that are always supported by
>  # glibc, so we simply check that the corresponding option is properly
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index e70989e..310ea99 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -18,6 +18,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  	help
>  	  Linaro toolchain for the ARM architecture. It uses Linaro
>  	  GCC 2014.09 (based on gcc 4.9), Linaro GDB 2013.10 (based on
> @@ -44,6 +45,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  	help
>  	  Linaro toolchain for the ARM big endian architecture. It
>  	  uses Linaro GCC 2014.09 (based on gcc 4.9), Linaro GDB
> @@ -69,6 +71,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  	help
>  	  Sourcery CodeBench toolchain for the ARM architecture, from
>  	  Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51, glibc
> @@ -98,6 +101,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  	help
>  	  Sourcery CodeBench toolchain for the ARM architecture, from
>  	  Mentor Graphics. It uses gcc 4.8.1, binutils 2.23.52, glibc
> @@ -126,6 +130,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
>  	help
>  	  Sourcery CodeBench toolchain for the ARM architecture, from
>  	  Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52, glibc
> @@ -159,6 +164,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
>  	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
>  	# kernel headers: 2.6.31
>  	help
>  	  Texas Instruments Arago 2011.09 toolchain, with gcc 4.5.3,
> @@ -181,6 +187,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
>  	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
>  	# kernel headers: 2.6.31
>  	help
>  	  Texas Instruments Arago ARMv5 2011.09 toolchain, with gcc
> @@ -199,6 +206,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  	help
>  	  Sourcery CodeBench toolchain for the MIPS architecture, from
>  	  Mentor Graphics. It uses gcc 4.9.2, binutils 2.24.51, glibc
> @@ -284,6 +292,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  	help
>  	  Sourcery CodeBench toolchain for the MIPS architecture, from
>  	  Mentor Graphics. It uses gcc 4.9.1, binutils 2.24.51, glibc
> @@ -369,6 +378,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  	help
>  	  Sourcery CodeBench toolchain for the MIPS architecture, from
>  	  Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51, glibc
> @@ -457,6 +467,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  	help
>  	  Sourcery CodeBench toolchain for the Nios-II architecture,
>  	  from Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51,
> @@ -472,6 +483,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
>  	help
>  	  Sourcery CodeBench toolchain for the Nios-II architecture,
>  	  from Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52,
> @@ -488,6 +500,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201203
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
>  	help
>  	  Sourcery CodeBench toolchain for the PowerPC architecture,
>  	  from Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53,
> @@ -505,6 +518,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	# kernel headers: 2.6.38
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
>  	help
>  	  Sourcery CodeBench toolchain for the PowerPC architecture,
>  	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20.51,
> @@ -537,6 +551,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	# kernel headers: 2.6.35
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
>  	help
>  	  Sourcery CodeBench toolchain for the PowerPC architecture,
>  	  from Mentor Graphics. It uses gcc 4.5.1, binutils 2.20,
> @@ -569,6 +584,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
>  	help
>  	  Sourcery CodeBench toolchain for the SuperH architecture,
>  	  from Mentor Graphics. It uses gcc 4.7.2, binutils 2.23.51,
> @@ -592,6 +608,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
>  	help
>  	  Sourcery CodeBench toolchain for the SuperH architecture,
>  	  from Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53,
> @@ -616,6 +633,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	# kernel headers: 2.6.38
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
>  	help
>  	  Sourcery CodeBench toolchain for the SuperH architecture,
>  	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20,
> @@ -641,6 +659,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_201405
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  	help
>  	  Sourcery CodeBench toolchain for the amd64 (x86_64)
>  	  architectures, from Mentor Graphics. It uses gcc 4.8.3,
> @@ -665,6 +684,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
>  	help
>  	  Sourcery CodeBench toolchain for the x86/x86_64
>  	  architectures, from Mentor Graphics. It uses gcc 4.7.2,
> @@ -692,6 +712,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
>  	help
>  	  Sourcery CodeBench toolchain for the x86/x86_64
>  	  architectures, from Mentor Graphics. It uses gcc 4.6.3,
> @@ -720,6 +741,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
>  	help
>  	  Sourcery CodeBench toolchain for the x86/x86_64
>  	  architectures, from Mentor Graphics. It uses gcc 4.6.1,
> @@ -748,6 +770,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
>  	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
>  	help
>  	  Toolchain for the Blackfin architecture, from
>  	  http://blackfin.uclinux.org.
> @@ -764,6 +787,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
>  	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
>  	help
>  	  Toolchain for the Blackfin architecture, from
>  	  http://blackfin.uclinux.org.
> @@ -780,6 +804,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
>  	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
>  	help
>  	  Toolchain for the Blackfin architecture, from
>  	  http://blackfin.uclinux.org.
> @@ -794,6 +819,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
>  	help
>  	  Toolchain for the AArch64 architecture, from
>  	  http://www.linaro.org/engineering/armv8/
> @@ -808,6 +834,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  	help
>  	  Sourcery CodeBench toolchain for the AArch64 architecture,
>  	  from Mentor Graphics. It uses gcc 4.8.3, binutils 2.24,
> @@ -823,6 +850,7 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  	help
>  	  Toolchain based on the Musl C library, provided by the
>  	  musl-cross project. It uses gcc 4.9.2, binutils 2.25 and
> @@ -849,6 +877,7 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  	help
>  	  Toolchain for the ARC cores, from
>  	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
> @@ -965,6 +994,47 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL
>  if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
>  
>  choice
> +	bool "External toolchain gcc version"
> +	default BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
> +	help
> +	  Set to the gcc version that is used by your external
> +	  toolchain.
> +
> +config BR2_TOOLCHAIN_EXTERNAL_GCC_5
> +	bool "5.x"
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
> +
> +config BR2_TOOLCHAIN_EXTERNAL_GCC_4_9
> +	bool "4.9.x"
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +
> +config BR2_TOOLCHAIN_EXTERNAL_GCC_4_8
> +	bool "4.8.x"
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +
> +config BR2_TOOLCHAIN_EXTERNAL_GCC_4_7
> +	bool "4.7.x"
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> +
> +config BR2_TOOLCHAIN_EXTERNAL_GCC_4_6
> +	bool "4.6.x"
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
> +
> +config BR2_TOOLCHAIN_EXTERNAL_GCC_4_5
> +	bool "4.5.x"
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
> +
> +config BR2_TOOLCHAIN_EXTERNAL_GCC_4_4
> +	bool "4.4.x"
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
> +
> +config BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
> +	bool "4.3.x"
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
> +
> +endchoice
> +
> +choice
>  	bool "External toolchain kernel headers series"
>  	default BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
>  	help
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 5ce4d33..3cb59c6 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -473,6 +473,8 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
>  	$(call check_kernel_headers_version,\
>  		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC)),\
>  		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
> +	$(call check_gcc_version,$(TOOLCHAIN_EXTERNAL_CC),\
> +		$(call qstrip,$(BR2_TOOLCHAIN_GCC_AT_LEAST))); \
>  	if test "$(BR2_arm)" = "y" ; then \
>  		$(call check_arm_abi,\
>  			"$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)",\
> -- 
> 2.5.0
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
