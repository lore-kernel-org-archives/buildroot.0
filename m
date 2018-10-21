From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 21 Oct 2018 14:41:40 +0200
Subject: [Buildroot] [PATCH 1/2] arch: add support for RISC-V 32-bit
 (riscv32) architecture
In-Reply-To: <f080599f-1d9d-afdd-3ca4-b0fdddc50fce@embecosm.com>
References: <20181020212443.4935-1-mark.corbin@embecosm.com>
 <bd1cad94-9182-334c-2607-1f6bdf12db59@gmail.com>
 <f080599f-1d9d-afdd-3ca4-b0fdddc50fce@embecosm.com>
Message-ID: <25f5ed34-780f-8a0e-0daa-28e49a5692db@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mark,

Le 21/10/2018 ? 14:13, Mark Corbin a ?crit?:
> Hello Romain
> 
> On 21/10/2018 10:22, Romain Naour wrote:
>> Hi Mark,
>>
>> Le 20/10/2018 ? 23:24, Mark Corbin a ?crit?:
>>> This enables a riscv32 system to be built with a Buildroot generated
>>> toolchain (gcc >= 7.x, binutils >= 2.30, glibc only).
>>>
>>> This requires a custom version of glibc 2.26 from the riscv-glibc
>>> repository. Note that there are no tags in this repository, so the
>>> glibc version just consists of the 40 character commit id string.
>> This fork is based on the glibc 2.26 official release and not based on the glibc
>> 2.26 stable branch. This particular version is know to have issues with C++
>> support on x86/x86_64 but it should not affect riscv32.
>>
>>> Thanks to Fabrice Bellard for pointing me towards the 32-bit glibc
>>> repository and for providing the necessary patch to get it to build.
>>>
>>> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
>>> ---
[...]
>>> diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
>>> index 022d1a6809..f3bf2b3467 100644
>>> --- a/arch/arch.mk.riscv
>>> +++ b/arch/arch.mk.riscv
>>> @@ -5,8 +5,10 @@
>>>  
>>>  ifeq ($(BR2_riscv),y)
>>>  
>>> -ifeq ($(BR2_ARCH_IS_64),y)
>>> +ifeq ($(BR2_RISCV_64),y)
>> Why this change is needed to add riscv32 support ?
>> BR2_ARCH_IS_64 looks fine here. (BR2_ARCH_IS_64 is selected by BR2_RISCV_64)
> I talked to Thomas and he has no real preference, but it probably makes sense to
> use BR2_RISCV_64 for things relating directly to the RISC-V architecture and
> BR2_ARCH_IS_64 for more generic features.

ok.

>>>  GCC_TARGET_ARCH := rv64i
>>> +else
>>> +GCC_TARGET_ARCH := rv32i
>>>  endif
>>>  
>>>  ifeq ($(BR2_RISCV_ISA_RVM),y)

[...]

>>> diff --git a/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0001-riscv32.patch b/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0001-riscv32.patch
>>> new file mode 100644
>>> index 0000000000..0d5a6b7710
>>> --- /dev/null
>>> +++ b/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0001-riscv32.patch
>> Please use git format-patch and add a small patch description, uptream status
>> and your SoB line.
> I will re-generate the patch.

ok thanks!

>>> @@ -0,0 +1,33 @@
[...]
>>> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
>>> index 708c22f723..cea77dff39 100644
>>> --- a/package/glibc/glibc.mk
>>> +++ b/package/glibc/glibc.mk
>>> @@ -7,6 +7,9 @@
>>>  ifeq ($(BR2_arc),y)
>>>  GLIBC_VERSION =  arc-2018.03-release
>>>  GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
>>> +else ifeq ($(BR2_riscv)$(BR2_RISCV_64),y)
>> usually we do something like "ifeq ($(BR2_riscv):$(BR2_RISCV_64),y:)" when there
>> is multiple BR2 variables in a condition. Ok, in this case we can't have
>> BR2_RISCV_64 without selecting BR2_riscv.
> Ok, I'll change this.

Best regards,
Romain


> 
> Regards
> 
> Mark
>> Otherwise it looks ok.
>>
>> Best regards,
>> Romain
>>
>>
>>> +GLIBC_VERSION = 4e2943456e690d89f48e6e710757dd09404b0c9a
>>> +GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
>>>  else
>>>  # Generate version string using:
>>>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
>>> @@ -79,7 +82,11 @@ GLIBC_CONF_ENV = \
>>>  # Override the default library locations of /lib64/<abi> and
>>>  # /usr/lib64/<abi>/ for RISC-V.
>>>  ifeq ($(BR2_riscv),y)
>>> +ifeq ($(BR2_RISCV_64),y)
>>>  GLIBC_CONF_ENV += libc_cv_slibdir=/lib64 libc_cv_rtlddir=/lib
>>> +else
>>> +GLIBC_CONF_ENV += libc_cv_slibdir=/lib32 libc_cv_rtlddir=/lib
>>> +endif
>>>  endif
>>>  
>>>  # Even though we use the autotools-package infrastructure, we have to
>>>
> 
> -- 
> 
> *Mark Corbin*
> Embedded Operating Systems Lead
> Phone: +44 1590 610184?????Mobile: +44 7765 703479
> Email: mark.corbin at embecosm.com <mailto:mark.corbin@embecosm.com>?????Web:
> https://www.embecosm.com
> 
> Embecosm Logo
> 
> Embecosm Ltd., Palamos House #208, 66/67 High Street, Lymington, SO41 9AL, UK
> Company No. 6577021 (England & Wales).
> --
