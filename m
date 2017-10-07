From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 7 Oct 2017 20:43:33 +0200
Subject: [Buildroot] [PATCH 1/3] arch/mips: inverse the NaN logic
In-Reply-To: <20171007122233.GH21901@scaer>
References: <cover.1504432422.git.yann.morin.1998@free.fr>
 <585dda9412d61d550fc9c6fa76a29e7e878ceec0.1504432422.git.yann.morin.1998@free.fr>
 <93faf8c9-2223-3305-308c-6da56200a61d@gmail.com>
 <20171007122233.GH21901@scaer>
Message-ID: <7d5da0e6-ec34-483f-631b-c59f21b82ec4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

Le 07/10/2017 ? 14:22, Yann E. MORIN a ?crit?:
> Romain, All,
> 
> On 2017-10-07 12:18 +0200, Romain Naour spake thusly:
>> Le 03/09/2017 ? 11:53, Yann E. MORIN a ?crit?:
>>> Currentlym the possibility to choose the NaN encoding is conditional to
>>> having a sufficiently recent gcc version.
>>>
>>> Which means that the architecture selection depends on the gcc version.
>>>
>>> But that's opposite to what we've always done in Buildroot: the software
>>> versions are conditional to the architecture options. There is nothing
>>> we can do about the hardware: it is there, we can't change it, while we
>>> can restrict ourselves to using software that is working on said
>>> hardware.
>>>
>>> Thus, we inverse the logic, to move the condition onto the software
>>> side: whenever NaN-2008 are selected, we restrict the toolchain
>>> selection to at least a gcc-4.9.
>>>
>>> But now, the option with the NaN type is always set, so we must enclose
>>> the code in gcc.mk inside a HAS_NAN_OPTION condition, as is already done
>>> for the external toolchain case.
>>>
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>> ---
>>>  arch/Config.in.mips | 2 +-
>>>  package/gcc/gcc.mk  | 2 ++
>>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
>>> index c08b2a2968..13d1a477e6 100644
>>> --- a/arch/Config.in.mips
>>> +++ b/arch/Config.in.mips
>>> @@ -176,10 +176,10 @@ config BR2_MIPS_NAN_LEGACY
>>>  
>>>  config BR2_MIPS_NAN_2008
>>>  	bool
>>> +	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
>>
>> This series require the previous series "arch: some require a minimal gcc
>> version" adding this option.
> 
> Yes, that's why the four series were replies one to the previous, so that
> they are correctly threaded in your MUA. As long as you use a decent MUA,
> that is. ;-]

I'm only looking at the patchwork web interface and git pwc :p

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
>> Best regards,
>> Romain
>>
>>>  
>>>  choice
>>>  	prompt "Target NaN"
>>> -	depends on BR2_TOOLCHAIN_HAS_MNAN_OPTION
>>>  	depends on BR2_mips_32r5 || BR2_mips_64r5
>>>  	default BR2_MIPS_ENABLE_NAN_2008
>>>  	help
>>> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
>>> index 49ccccf56f..d45b6d7a06 100644
>>> --- a/package/gcc/gcc.mk
>>> +++ b/package/gcc/gcc.mk
>>> @@ -207,9 +207,11 @@ endif
>>>  ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
>>>  HOST_GCC_COMMON_CONF_OPTS += --with-abi=$(BR2_GCC_TARGET_ABI)
>>>  endif
>>> +ifeq ($(BR2_TOOLCHAIN_HAS_MNAN_OPTION),y)
>>>  ifneq ($(call qstrip,$(BR2_GCC_TARGET_NAN)),)
>>>  HOST_GCC_COMMON_CONF_OPTS += --with-nan=$(BR2_GCC_TARGET_NAN)
>>>  endif
>>> +endif
>>>  ifneq ($(call qstrip,$(BR2_GCC_TARGET_FP32_MODE)),)
>>>  HOST_GCC_COMMON_CONF_OPTS += --with-fp-32=$(BR2_GCC_TARGET_FP32_MODE)
>>>  endif
>>>
>>
> 
