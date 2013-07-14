From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Jul 2013 22:36:23 +0200
Subject: [Buildroot] [PATCHv2 12/25] arch: introduce BR2_GCC_TARGET_{FPU,
	FLOAT}
In-Reply-To: <1373754468-7527-13-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 14 Jul 2013 00:27:35 +0200")
References: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373754468-7527-13-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8761wcc20o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Buildroot already has the BR2_GCC_TARGET_{TUNE,ARCH,ABI,CPU} hidden
 Thomas> kconfig strings that allow per-architecture Config.in files to feed
 Thomas> the appropriate values of --with-{tune,arch,abi-cpu} when building
 Thomas> gcc, or the appropriate flags for the external toolchain wrapper.

 Thomas> This commit has two additional options: BR2_GCC_TARGET_{FPU,FLOAT},
 Thomas> that allows to define the --with-{fpu,float} gcc configure options for
 Thomas> the internal backend, or the -mfpu/-mfloat-abi options for the flags
 Thomas> of the external toolchain wrapper.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  arch/Config.in                                       |  6 ++++++
 Thomas>  package/gcc/gcc.mk                                   | 10 ++++++++++
 Thomas>  toolchain/toolchain-external/ext-tool.mk             | 10 ++++++++++
 Thomas>  toolchain/toolchain-external/ext-toolchain-wrapper.c |  6 ++++++
 Thomas>  4 files changed, 32 insertions(+)

 Thomas> diff --git a/arch/Config.in b/arch/Config.in
 Thomas> index 5ca05cd..d95d4ef 100644
 Thomas> --- a/arch/Config.in
 Thomas> +++ b/arch/Config.in
 Thomas> @@ -192,6 +192,12 @@ config BR2_GCC_TARGET_CPU
 Thomas>  config BR2_GCC_TARGET_CPU_REVISION
 Thomas>  	string
 
 Thomas> +config BR2_GCC_TARGET_FPU
 Thomas> +	string
 Thomas> +
 Thomas> +config BR2_GCC_TARGET_FLOAT_ABI
 Thomas> +	string

This looks fishy. The commit message talks about TARGET_FLOAT, but you
are adding TARGET_FLOAT_ABI here.


 Thomas> +
 Thomas>  # Set up target binary format
 Thomas>  choice
 Thomas>  	prompt "Target Binary Format"
 Thomas> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
 Thomas> index 8bd65fc..bfc41a4 100644
 Thomas> --- a/package/gcc/gcc.mk
 Thomas> +++ b/package/gcc/gcc.mk
 Thomas> @@ -167,6 +167,16 @@ HOST_GCC_COMMON_CONF_OPT += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU))
 Thomas>  endif
 Thomas>  endif
 
 Thomas> +GCC_TARGET_FPU = $(call qstrip,$(BR2_GCC_TARGET_FPU))
 Thomas> +ifneq ($(GCC_TARGET_FPU),)
 Thomas> +HOST_GCC_COMMON_CONF_OPT += --with-fpu=$(GCC_TARGET_FPU)
 Thomas> +endif
 Thomas> +
 Thomas> +GCC_TARGET_FLOAT_ABI = $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
 Thomas> +ifneq ($(GCC_TARGET_FLOAT_ABI),)
 Thomas> +HOST_GCC_COMMON_CONF_OPT += --with-float=$(GCC_TARGET_FLOAT_ABI)

And passing it as --with-float here.

 Thomas> +++ b/toolchain/toolchain-external/ext-tool.mk
 Thomas> @@ -145,6 +145,8 @@ CC_TARGET_CPU_:=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISIO
 Thomas>  endif
 Thomas>  CC_TARGET_ARCH_:=$(call qstrip,$(BR2_GCC_TARGET_ARCH))
 Thomas>  CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))
 Thomas> +CC_TARGET_FLOAT_:=$(call qstrip,$(BR2_GCC_TARGET_FLOAT))
 Thomas> +CC_TARGET_FPU_:=$(call qstrip,$(BR2_GCC_TARGET_FPU))

Here you use TARGET_FLOAT.

NIT: It would be a bit nicer to keep them in the same order as Config.in
/ gcc.mk.


 Thomas>  # march/mtune/floating point mode needs to be passed to the external toolchain
 Thomas>  # to select the right multilib variant
 Thomas> @@ -168,6 +170,14 @@ ifneq ($(CC_TARGET_ABI_),)
 Thomas>  TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
 Thomas>  TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
 Thomas>  endif
 Thomas> +ifneq ($(CC_TARGET_FLOAT_),)
 Thomas> +TOOLCHAIN_EXTERNAL_CFLAGS += -mfloat-abi=$(CC_TARGET_FLOAT_)
 Thomas> +TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_FLOAT='"$(CC_TARGET_FLOAT_)"'

And pass it as -mfloat-abi here (except you used the wrong variable, so
it's never passed).

What was the idea here?

-- 
Bye, Peter Korsgaard
