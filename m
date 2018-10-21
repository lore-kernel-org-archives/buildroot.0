From: Mark Corbin <mark.corbin@embecosm.com>
Date: Sun, 21 Oct 2018 13:13:01 +0100
Subject: [Buildroot] [PATCH 1/2] arch: add support for RISC-V 32-bit
 (riscv32) architecture
In-Reply-To: <bd1cad94-9182-334c-2607-1f6bdf12db59@gmail.com>
References: <20181020212443.4935-1-mark.corbin@embecosm.com>
 <bd1cad94-9182-334c-2607-1f6bdf12db59@gmail.com>
Message-ID: <f080599f-1d9d-afdd-3ca4-b0fdddc50fce@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain

On 21/10/2018 10:22, Romain Naour wrote:
> Hi Mark,
>
> Le 20/10/2018 ? 23:24, Mark Corbin a ?crit?:
>> This enables a riscv32 system to be built with a Buildroot generated
>> toolchain (gcc >= 7.x, binutils >= 2.30, glibc only).
>>
>> This requires a custom version of glibc 2.26 from the riscv-glibc
>> repository. Note that there are no tags in this repository, so the
>> glibc version just consists of the 40 character commit id string.
> This fork is based on the glibc 2.26 official release and not based on the glibc
> 2.26 stable branch. This particular version is know to have issues with C++
> support on x86/x86_64 but it should not affect riscv32.
>
>> Thanks to Fabrice Bellard for pointing me towards the 32-bit glibc
>> repository and for providing the necessary patch to get it to build.
>>
>> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
>> ---
>>  arch/Config.in.riscv                          | 23 +++++++++++--
>>  arch/arch.mk.riscv                            |  4 ++-
>>  configs/qemu_riscv64_virt_defconfig           |  1 +
>>  .../0001-riscv32.patch                        | 33 +++++++++++++++++++
>>  .../glibc.hash                                |  7 ++++
>>  package/glibc/glibc.mk                        |  7 ++++
>>  6 files changed, 71 insertions(+), 4 deletions(-)
>>  create mode 100644 package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0001-riscv32.patch
>>  create mode 100644 package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/glibc.hash
>>
>> diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
>> index 4361890bf4..4615f3c797 100644
>> --- a/arch/Config.in.riscv
>> +++ b/arch/Config.in.riscv
>> @@ -66,13 +66,26 @@ config BR2_RISCV_ISA_CUSTOM_RVC
>>  endif
>>  
>>  config BR2_RISCV_64
>> -	bool
>> -	default y
>> +	bool "64-bit"
>> +	default n
>>  	select BR2_ARCH_IS_64
>>  
>>  choice
>>  	prompt "Target ABI"
>> -	default BR2_RISCV_ABI_LP64
>> +	default BR2_RISCV_ABI_ILP32 if !BR2_ARCH_IS_64
>> +	default BR2_RISCV_ABI_LP64 if BR2_ARCH_IS_64
>> +
>> +config BR2_RISCV_ABI_ILP32
>> +	bool "ilp32"
>> +	depends on !BR2_ARCH_IS_64
>> +
>> +config BR2_RISCV_ABI_ILP32F
>> +	bool "ilp32f"
>> +	depends on !BR2_ARCH_IS_64 && BR2_RISCV_ISA_RVF
>> +
>> +config BR2_RISCV_ABI_ILP32D
>> +	bool "ilp32d"
>> +	depends on !BR2_ARCH_IS_64 && BR2_RISCV_ISA_RVD
>>  
>>  config BR2_RISCV_ABI_LP64
>>  	bool "lp64"
>> @@ -88,12 +101,16 @@ config BR2_RISCV_ABI_LP64D
>>  endchoice
>>  
>>  config BR2_ARCH
>> +	default "riscv32" if !BR2_ARCH_IS_64
>>  	default "riscv64" if BR2_ARCH_IS_64
>>  
>>  config BR2_ENDIAN
>>  	default "LITTLE"
>>  
>>  config BR2_GCC_TARGET_ABI
>> +	default "ilp32" if BR2_RISCV_ABI_ILP32
>> +	default "ilp32f" if BR2_RISCV_ABI_ILP32F
>> +	default "ilp32d" if BR2_RISCV_ABI_ILP32D
>>  	default "lp64" if BR2_RISCV_ABI_LP64
>>  	default "lp64f" if BR2_RISCV_ABI_LP64F
>>  	default "lp64d" if BR2_RISCV_ABI_LP64D
>> diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
>> index 022d1a6809..f3bf2b3467 100644
>> --- a/arch/arch.mk.riscv
>> +++ b/arch/arch.mk.riscv
>> @@ -5,8 +5,10 @@
>>  
>>  ifeq ($(BR2_riscv),y)
>>  
>> -ifeq ($(BR2_ARCH_IS_64),y)
>> +ifeq ($(BR2_RISCV_64),y)
> Why this change is needed to add riscv32 support ?
> BR2_ARCH_IS_64 looks fine here. (BR2_ARCH_IS_64 is selected by BR2_RISCV_64)
I talked to Thomas and he has no real preference, but it probably makes
sense to use BR2_RISCV_64 for things relating directly to the RISC-V
architecture and BR2_ARCH_IS_64 for more generic features.
>
>>  GCC_TARGET_ARCH := rv64i
>> +else
>> +GCC_TARGET_ARCH := rv32i
>>  endif
>>  
>>  ifeq ($(BR2_RISCV_ISA_RVM),y)
>> diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
>> index 59343ee98f..e15f804341 100644
>> --- a/configs/qemu_riscv64_virt_defconfig
>> +++ b/configs/qemu_riscv64_virt_defconfig
>> @@ -1,5 +1,6 @@
>>  # Architecture
>>  BR2_riscv=y
>> +BR2_RISCV_64=y
>>  
>>  # System
>>  BR2_SYSTEM_DHCP="eth0"
>> diff --git a/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0001-riscv32.patch b/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0001-riscv32.patch
>> new file mode 100644
>> index 0000000000..0d5a6b7710
>> --- /dev/null
>> +++ b/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0001-riscv32.patch
> Please use git format-patch and add a small patch description, uptream status
> and your SoB line.
I will re-generate the patch.
>
>> @@ -0,0 +1,33 @@
>> +diff --git a/elf/dl-runtime.c b/elf/dl-runtime.c
>> +index 51d3819d4a..e728e8907e 100644
>> +--- a/elf/dl-runtime.c
>> ++++ b/elf/dl-runtime.c
>> +@@ -146,6 +146,7 @@ _dl_fixup (
>> +   if (__glibc_unlikely (GLRO(dl_bind_not)))
>> +     return value;
>> + 
>> ++  (void)refsym;
>> +   return elf_machine_fixup_plt (l, result, refsym, sym, reloc, rel_addr, value);
>> + }
>> + 
>> +diff --git a/sysdeps/riscv/ldsodefs.h b/sysdeps/riscv/ldsodefs.h
>> +index db993df80a..91e7a8c88f 100644
>> +--- a/sysdeps/riscv/ldsodefs.h
>> ++++ b/sysdeps/riscv/ldsodefs.h
>> +@@ -25,14 +25,14 @@ struct La_riscv_regs;
>> + struct La_riscv_retval;
>> + 
>> + #define ARCH_PLTENTER_MEMBERS						\
>> +-    Elf64_Addr (*riscv_gnu_pltenter) (Elf64_Sym *, unsigned int,	\
>> ++    ElfW(Addr) (*riscv_gnu_pltenter) (ElfW(Sym) *, unsigned int,	\
>> + 				      uintptr_t *, uintptr_t *,		\
>> + 				      const struct La_riscv_regs *,	\
>> + 				      unsigned int *, const char *name,	\
>> + 				      long int *framesizep);
>> + 
>> + #define ARCH_PLTEXIT_MEMBERS						\
>> +-    unsigned int (*riscv_gnu_pltexit) (Elf64_Sym *, unsigned int,	\
>> ++    unsigned int (*riscv_gnu_pltexit) (ElfW(Sym) *, unsigned int,	\
>> + 				       uintptr_t *, uintptr_t *,	\
>> + 				       const struct La_riscv_regs *,	\
>> + 				       struct La_riscv_retval *,	\
>> diff --git a/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/glibc.hash b/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/glibc.hash
>> new file mode 100644
>> index 0000000000..3eb5e04e96
>> --- /dev/null
>> +++ b/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/glibc.hash
>> @@ -0,0 +1,7 @@
>> +# Locally calculated (fetched from Github)
>> +sha256 a40f908125135bad2cf92c18d07ad25b3091b161b3a5d3aea46c23ffd2ac90b8  glibc-4e2943456e690d89f48e6e710757dd09404b0c9a.tar.gz
>> +
>> +# Hashes for license files
>> +sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
>> +sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LIB
>> +sha256 61abdd6930c9c599062d89e916b3e7968783879b6be0ee1c6229dd6169def431 LICENSES
>> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
>> index 708c22f723..cea77dff39 100644
>> --- a/package/glibc/glibc.mk
>> +++ b/package/glibc/glibc.mk
>> @@ -7,6 +7,9 @@
>>  ifeq ($(BR2_arc),y)
>>  GLIBC_VERSION =  arc-2018.03-release
>>  GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
>> +else ifeq ($(BR2_riscv)$(BR2_RISCV_64),y)
> usually we do something like "ifeq ($(BR2_riscv):$(BR2_RISCV_64),y:)" when there
> is multiple BR2 variables in a condition. Ok, in this case we can't have
> BR2_RISCV_64 without selecting BR2_riscv.
Ok, I'll change this.

Regards

Mark
> Otherwise it looks ok.
>
> Best regards,
> Romain
>
>
>> +GLIBC_VERSION = 4e2943456e690d89f48e6e710757dd09404b0c9a
>> +GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
>>  else
>>  # Generate version string using:
>>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
>> @@ -79,7 +82,11 @@ GLIBC_CONF_ENV = \
>>  # Override the default library locations of /lib64/<abi> and
>>  # /usr/lib64/<abi>/ for RISC-V.
>>  ifeq ($(BR2_riscv),y)
>> +ifeq ($(BR2_RISCV_64),y)
>>  GLIBC_CONF_ENV += libc_cv_slibdir=/lib64 libc_cv_rtlddir=/lib
>> +else
>> +GLIBC_CONF_ENV += libc_cv_slibdir=/lib32 libc_cv_rtlddir=/lib
>> +endif
>>  endif
>>  
>>  # Even though we use the autotools-package infrastructure, we have to
>>

-- 

*Mark Corbin*
Embedded Operating Systems Lead
Phone: +44 1590 610184?????Mobile: +44 7765 703479
Email: mark.corbin at embecosm.com
<mailto:mark.corbin@embecosm.com>?????Web: https://www.embecosm.com

Embecosm Logo

Embecosm Ltd., Palamos House #208, 66/67 High Street, Lymington, SO41
9AL, UK
Company No. 6577021 (England & Wales).
--
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181021/f9824391/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: logo.png
Type: image/png
Size: 8442 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181021/f9824391/attachment.png>
