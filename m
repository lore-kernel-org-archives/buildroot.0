From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 7 Oct 2017 21:55:12 +0200
Subject: [Buildroot] [PATCH 4/8] toolchain/external: hide versions too
 old for the current arch
In-Reply-To: <20171007121500.GG21901@scaer>
References: <cover.1504431850.git.yann.morin.1998@free.fr>
 <56ab77ea28f24c9495de8a7ca8822c61a1642f97.1504431850.git.yann.morin.1998@free.fr>
 <ae5be870-2ae4-966f-0cd6-261d02db7d1d@gmail.com>
 <20171007121500.GG21901@scaer>
Message-ID: <e19c1b4e-c160-a3eb-456f-9bb0c790ed12@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

Le 07/10/2017 ? 14:15, Yann E. MORIN a ?crit?:
> Romain, All,
> 
> On 2017-10-07 11:57 +0200, Romain Naour spake thusly:
>> This patch needs to be rebased on master after the last linaro toolchain version
>> bump (sorry ;-) )
>>
>> Le 03/09/2017 ? 11:44, Yann E. MORIN a ?crit?:
>>> Hide the toolchains if the arch requires a gcc version more recent
>>> than the one they provide.
>>>
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>> ---
>>>  .../toolchain-external/toolchain-external-codescape-img-mips/Config.in  | 1 +
>>>  .../toolchain-external/toolchain-external-codescape-mti-mips/Config.in  | 1 +
>>>  .../toolchain-external-codesourcery-aarch64/Config.in                   | 1 +
>>>  .../toolchain-external/toolchain-external-codesourcery-amd64/Config.in  | 1 +
>>>  .../toolchain-external/toolchain-external-codesourcery-arm/Config.in    | 2 ++
>>>  .../toolchain-external/toolchain-external-codesourcery-mips/Config.in   | 2 ++
>>>  .../toolchain-external/toolchain-external-codesourcery-niosII/Config.in | 1 +
>>>  .../toolchain-external/toolchain-external-linaro-aarch64/Config.in      | 1 +
>>>  toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in    | 2 ++
>>>  toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in  | 2 ++
>>>  toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in  | 1 +
>>>  11 files changed, 15 insertions(+)
>>>
>>> diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
>>> index e29c4dcb87..8b2eab0ad2 100644
>>> --- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
>>> +++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
>>> @@ -1,6 +1,7 @@
>>>  config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
>>>  	bool "Codescape IMG GNU Linux Toolchain 2016.05"
>>>  	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>>
>> Having
>>
>>> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
>>
>> and
>> 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>>
>> looks redundant...
> 
> It might, but this serves two different purposes.

Yes, I understand that.

> 
>> Also where BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9 is selected when you use a packaged
>> toolchain ?
> 
> The architectures do. Either the full arch, or individual cores.
> 
>> With the complete series applied I can't select a packaged external toolchain.
>>
>> Try with to select the Linaro toolchain with this defconfig:
>>
>> BR2_arm=y
>> BR2_cortex_a9=y
>> BR2_ARM_ENABLE_NEON=y
>> BR2_ARM_ENABLE_VFP=y
>> BR2_TOOLCHAIN_EXTERNAL=y
> 
> Weird, it works for me:
> 
>     $ make defconfig BR2_DEFCONFIG=$(pwd)/kubu.defconfig
>     $ grep LINARO .config
>     BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y

I made a mistake while applying the patch locally and resolve the conflict due
to the Linaro toolchain bump.

The '!' was missing before "BR2_ARCH_NEEDS_GCC_AT_LEAST_7"...
That's why I wasn't able to select the toolchain.

Sorry for the noise.

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
>> Best regards,
>> Romain
>>
