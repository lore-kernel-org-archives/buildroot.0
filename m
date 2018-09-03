From: Mark Corbin <mark.corbin@embecosm.com>
Date: Mon, 3 Sep 2018 12:26:47 +0100
Subject: [Buildroot] [PATCH 1/1] arch: add support for RISC-V 64-bit
 (riscv64) architecture
In-Reply-To: <20180902214024.464f8a25@windsurf>
References: <20180831091154.22530-1-mark.corbin@embecosm.com>
 <20180902214024.464f8a25@windsurf>
Message-ID: <8e07a0c3-6132-c94c-5732-fc48339878bf@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

On 02/09/18 20:40, Thomas Petazzoni wrote:
> Hello Mark,
>
> On Fri, 31 Aug 2018 10:11:54 +0100, Mark Corbin wrote:
>> This enables a riscv64 system to be built with a Buildroot generated
>> toolchain (gcc >= 7.x, binutils >= 2.30, glibc only).
>>
>> This configuration has been used to successfully build a qemu-bootable
>> riscv-linux-4.15 kernel (https://github.com/riscv/riscv-linux.git).
>>
>> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> Thanks for this work on adding RISC-V support in Buildroot! As I
> already said on another patch, it would really, really be helpful if
> you sent a complete patch series instead of individual patches. Your
> patch series should include:
>
>  - The preliminary patches to support specifying a custom version of
>    the kernel headers
>  - This patch adding the RISC-V support
>  - The patch adding the qemu defconfig
>
> This way, the dependencies between the patches are clearly visible.
No problem.
>
> Could you add an entry in the DEVELOPERS file as well, listing all the
> files you're adding under your name/e-mail?
Ok.
>
>> +config BR2_riscv64
>> +	bool "RISCV64"
>> +	select BR2_ARCH_IS_64
>> +	select BR2_ARCH_HAS_MMU_OPTIONAL
> Does your patch support the situation where the MMU is not used? I.e,
> does the RISC-V toolchain support noMMU RISC-V ?
I think that changing this to mandatory makes sense for now.
>
>> diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
>> new file mode 100644
>> index 0000000000..0bee422581
>> --- /dev/null
>> +++ b/arch/Config.in.riscv
>> @@ -0,0 +1,104 @@
>> +# RISC-V CPU ISA extensions.
>> +
>> +config BR2_RISCV_ISA_RVI
>> +	bool
>> +	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
> Why is this select here instead of on the BR2_riscv64 option, since
> anyway there is not support at all for riscv64 before gcc 7.x ?
I think that I looked at examples from Config.in.mips. I will move this
to the BR2_riscv64 option as all riscv64 targets requires gcc >= 7.x
>
>> +choice
>> +	prompt "Target ABI"
>> +	default BR2_RISCV_ABI_LP64
>> +
>> +config BR2_RISCV_ABI_LP64
>> +	bool "lp64"
>> +	depends on BR2_ARCH_IS_64
>> +
>> +config BR2_RISCV_ABI_LP64F
>> +	bool "lp64f"
>> +	depends on BR2_ARCH_IS_64 && BR2_RISCV_ISA_RVF
>> +
>> +config BR2_RISCV_ABI_LP64D
>> +	bool "lp64d"
>> +	depends on BR2_ARCH_IS_64 && BR2_RISCV_ISA_RVD
> The BR2_ARCH_IS_64 conditions don't seem to be very useful, since only
> riscv64 is supported for now... and it is always 64-bit.
Originally I had added provision for 32-bit support, but then removed it
as I had no way to test it. I'll remove these dependencies.
>
>> +endchoice
>> +
>> +config BR2_ARCH
>> +	default "riscv64"
>> +
>> +config BR2_ENDIAN
>> +	default "LITTLE"
>> +
>> +config BR2_GCC_TARGET_ARCH
>> +#	Instruction set extension characters are appended by arch/arch.mk.riscv
>> +	default "rv64i"
>> +
>> +config BR2_GCC_TARGET_ABI
>> +	default "lp64" if BR2_RISCV_ABI_LP64
>> +	default "lp64f" if BR2_RISCV_ABI_LP64F
>> +	default "lp64d" if BR2_RISCV_ABI_LP64D
>> +
>> +config BR2_READELF_ARCH_NAME
>> +	default "RISC-V"
>> +
>> diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
>> new file mode 100644
>> index 0000000000..ad2e26903b
>> --- /dev/null
>> +++ b/arch/arch.mk.riscv
>> @@ -0,0 +1,24 @@
>> +#
>> +# Append the appropriate RISC-V ISA extensions to the
>> +# BR2_GCC_TARGET_ARCH variable.
>> +#
>> +
>> +BR2_RISCV_GCC_ARCH = $(call qstrip,$(BR2_GCC_TARGET_ARCH))
>> +
>> +ifeq ($(BR2_RISCV_ISA_RVM),y)
>> +BR2_RISCV_GCC_ARCH := $(BR2_RISCV_GCC_ARCH)m
>> +endif
>> +ifeq ($(BR2_RISCV_ISA_RVA),y)
>> +BR2_RISCV_GCC_ARCH := $(BR2_RISCV_GCC_ARCH)a
>> +endif
>> +ifeq ($(BR2_RISCV_ISA_RVF),y)
>> +BR2_RISCV_GCC_ARCH := $(BR2_RISCV_GCC_ARCH)f
>> +endif
>> +ifeq ($(BR2_RISCV_ISA_RVD),y)
>> +BR2_RISCV_GCC_ARCH := $(BR2_RISCV_GCC_ARCH)d
>> +endif
>> +ifeq ($(BR2_RISCV_ISA_RVC),y)
>> +BR2_RISCV_GCC_ARCH := $(BR2_RISCV_GCC_ARCH)c
>> +endif
>> +
>> +BR2_GCC_TARGET_ARCH := $(patsubst %,"%",$(BR2_RISCV_GCC_ARCH))
> So, this is probably the part I'm the least happy with. I think it is
> the only occurrence where make logic would tweak BR2_* variables. I'm
> not sure I want to set a precedent for this, as it could become
> "strange" to see values of BR2_* options that don't match what is
> visible in the .config file.
>
> So, I think this will require a bit more rework. The solution I would
> propose is to introduce arch/arch.mk, which does:
>
> GCC_TARGET_ARCH = $(call qstrip,$(BR2_GCC_TARGET_ARCH))
> GCC_TARGET_ABI  = $(call qstrip,$(BR2_GCC_TARGET_ABI))
> GCC_TARGET_NAN  = $(call qstrip,$(BR2_GCC_TARGET_NAN))
> # etc. for all BR2_GCC_TARGET_* options listed in arch/Config.in
>
> -include $(sort $(wildcard arch/arch.mk.*))
>
> Then, in the main Makefile, you include arch/arch.mk instead of
> wildcard arch/arch.mk.*.
>
> Then, in arch/arch.mk.riscv, you can override GCC_TARGET_ARCH and al.
>
> Of course, every place where BR2_GCC_TARGET_ARCH was used needs to be
> changed to use GCC_TARGET_ARCH.
>
> Let me know if this proposal is clear or not. If it's not, I can cook
> up a quick patch to show you the direction.
I think that I understand what you are suggesting. I have a couple of
questions...

a) I guess that I will have to replace every existing BR2_GCC_TARGET_...
in the Buildroot configurations with the equivalent GCC_TARGET_... ?
This would cover a few packages and the external toolchain.

b) Would it be reasonable to add quotes back to the various GCC_TARGET_
variables once the arch.mk.* files have been included? It seems to me
that the existing use of the BR2_GCC_TARGET_ variables expects them to
be quoted.

>> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
>> index 21dc84e498..747bac57ed 100644
>> --- a/package/binutils/Config.in.host
>> +++ b/package/binutils/Config.in.host
>> @@ -6,15 +6,18 @@ choice
>>  	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_INSTRUCTIONS_THUMB2
>>  	default BR2_BINUTILS_VERSION_2_29_X if !BR2_arc
>>  	default BR2_BINUTILS_VERSION_ARC if BR2_arc
>> +	default BR2_BINUTILS_VERSION_2_30_X if BR2_riscv64
> This is not really needed, since the first selectable entry is the one
> chosen by default.
I'll remove this.
>>  	help
>>  	  Select the version of binutils you wish to use.
>>  
>>  config BR2_BINUTILS_VERSION_2_28_X
>>  	bool "binutils 2.28.1"
>>  	depends on !BR2_arc
>> +	depends on !BR2_riscv64
>>  
>>  config BR2_BINUTILS_VERSION_2_29_X
>>  	bool "binutils 2.29.1"
>> +	depends on !BR2_riscv64
>>  
>>  config BR2_BINUTILS_VERSION_2_30_X
>>  	bool "binutils 2.30"
>> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
>> index 75e8191f46..6798448bda 100644
>> --- a/toolchain/toolchain-buildroot/Config.in
>> +++ b/toolchain/toolchain-buildroot/Config.in
>> @@ -23,7 +23,7 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
>>  choice
>>  	prompt "C library"
>>  	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>> -	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_powerpc64
>> +	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_powerpc64 || BR2_riscv64
> Ditto: since only glibc is supported on riscv64, it will automatically
> be the default selection.
I'll remove this too.
>>  
>>  config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>>  	bool "uClibc-ng"
>> @@ -46,14 +46,16 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
>>  		   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
>>  		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
>>  		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
>> -		   BR2_sh          || BR2_sparc64    || BR2_x86_64 || \
>> -		   BR2_microblaze  || BR2_nios2      || BR2_archs38
>> +		   BR2_riscv64     || BR2_sh         || BR2_sparc64     || \
>> +		   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
>> +		   BR2_archs38
>>  	depends on BR2_USE_MMU
>>  	depends on !BR2_STATIC_LIBS
>>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
>>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
>>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
>>  	depends on !BR2_powerpc_SPE
>> +	depends on BR2_RISCV_ISA_RVA || !BR2_riscv64
>>  	select BR2_TOOLCHAIN_USES_GLIBC
>>  	# our glibc.mk enables RPC support
>>  	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>> @@ -77,6 +79,10 @@ comment "glibc on MIPS w/ NAN2008 needs a toolchain w/ headers >= 4.5"
>>  	depends on BR2_MIPS_NAN_2008
>>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
>>  
>> +comment "glibc needs ISA extension A on riscv64"
>> +	depends on BR2_riscv64
>> +	depends on !BR2_RISCV_ISA_RVA
> So, if the user selects a "Custom architecture", and then doesn't
> enable BR2_RISCV_ISA_CUSTOM_RVA, he won't have any C library available
> to build a toolchain for riscv64.
>
> Provided this, I think we should not allow enabling/disabling RVA: we
> should assume it's always enabled.
I will force the selection of RVA for now, but will still show it in the
architecture options. It is possible that it could be come optional at
some point in the future.
>
> Could you fix those comments, and resubmit a new complete patch series,
> with all patches you need for RISC-V 64 support ?
I will. Thanks for the feedback.

Mark
>
> Thanks a lot!
>
> Thomas

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
