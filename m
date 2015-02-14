From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 14 Feb 2015 14:51:58 +0100
Subject: [Buildroot] [PATCH 2/4] arm: update processor types
In-Reply-To: <54D653E2.2080305@vanguardiasur.com.ar>
References: <1421951608-31233-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1421951608-31233-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <54CFA343.9090806@openwide.fr> <54D653E2.2080305@vanguardiasur.com.ar>
Message-ID: <54DF52FE.2070603@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ezequiel,

[snip]
>>> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
>>> index 2ee2019..fd6ef53 100644
>>> --- a/toolchain/toolchain-common.in
>>> +++ b/toolchain/toolchain-common.in
>>> @@ -114,8 +114,10 @@ config BR2_NEEDS_GETTEXT_IF_LOCALE
>>>  	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
>>>  
>>>  config BR2_USE_MMU
>>> -	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_sh || BR2_xtensa
>>> -	default y if !BR2_bfin
>>> +	bool "Enable MMU support"
>>> +	depends on BR2_arm || BR2_armeb || BR2_sh || BR2_xtensa
>>> +	depends on !BR2_cortex_m3 && !BR2_bfin
>>> +	default y
>>
>> And here with BR2_ARCH_HAS_MMU_SUPPORT ?
>>

Sorry for the delay...

> 
> Hm.. shouldn't that be, BR2_ARCH_HAS_OPTIONAL_MMU or something ?
> 
> At least that's what it seems: only some architectures expose the build
> time config to disable MMU.
> 

I think we need BR2_ARCH_HAS_MMU_SUPPORT if there is an MMU in the CPU and
BR2_ARCH_HAS_OPTIONAL_MMU if the MMU can be disabled.

The BR2_ARCH_HAS_OPTIONAL_MMU should automatically select
BR2_ARCH_HAS_MMU_SUPPORT when set to y.

Then BR2_arm, BR2_armeb, BR2_sh and BR2_xtensa should select
BR2_ARCH_HAS_OPTIONAL_MMU.

And all other architecture should select BR2_ARCH_HAS_MMU_SUPPORT except
BR2_bfin and BR2_cortex_m3.

So BR2_USE_MMU look like this:

config BR2_USE_MMU
	boot "Enable MMU support" if BR2_ARCH_HAS_OPTIONAL_MMU
	default y if BR2_ARCH_HAS_MMU_SUPPORT

When looking again at your patch, there is an error when another architecture
like i386 is selected.
BR2_USE_MMU must be set to y in that case.

What do you think ?

Best regards,
Romain
