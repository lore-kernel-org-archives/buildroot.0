From: Mark Corbin <mark.corbin@embecosm.com>
Date: Tue, 4 Sep 2018 11:03:22 +0100
Subject: [Buildroot] [PATCH 1/1] arch: add support for RISC-V 64-bit
 (riscv64) architecture
In-Reply-To: <20180902214024.464f8a25@windsurf>
References: <20180831091154.22530-1-mark.corbin@embecosm.com>
 <20180902214024.464f8a25@windsurf>
Message-ID: <6c81203c-261c-8525-1fda-5da1074db56e@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

On 02/09/18 20:40, Thomas Petazzoni wrote:
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
There is a name clash with using GCC_TARGET_* - some of these names are
already used in packages/gcc/gcc.mk.

GCC_TARGET_FPU = $(call qstrip,$(BR2_GCC_TARGET_FPU))
ifneq ($(GCC_TARGET_FPU),)
HOST_GCC_COMMON_CONF_OPTS += --with-fpu=$(GCC_TARGET_FPU)
endif

GCC_TARGET_FLOAT_ABI = $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
ifneq ($(GCC_TARGET_FLOAT_ABI),)
HOST_GCC_COMMON_CONF_OPTS += --with-float=$(GCC_TARGET_FLOAT_ABI)
endif

GCC_TARGET_MODE = $(call qstrip,$(BR2_GCC_TARGET_MODE))
ifneq ($(GCC_TARGET_MODE),)
HOST_GCC_COMMON_CONF_OPTS += --with-mode=$(GCC_TARGET_MODE)
endif

Anybody have any thoughts for a new prefix for either set of variables?

Thanks

Mark


-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
