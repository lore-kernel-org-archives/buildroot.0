From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Mar 2016 16:33:03 +0100
Subject: [Buildroot] [PATCH v2 02/17] arch/arm: Cortex-M3 provides only
 Thumb-2
In-Reply-To: <20160318223456.GC32171@free.fr>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160318223456.GC32171@free.fr>
Message-ID: <56ED712F.9000000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/18/16 23:34, Yann E. MORIN wrote:
> Thomas, All,
>
> On 2016-03-18 22:08 +0100, Thomas Petazzoni spake thusly:
>> The Cortex-M cores only support Thumb-2, not Thumb. In fact, Thumb-2
>> is a superset of Thumb, and we could have a single option for both in
>> Buildroot, since -mthumb on ARMv4/v5 means original Thumb, while
>> -mthumb on ARMv7 means Thumb 2. However, for clarity, it makes sense
>> to have two separate options. But in this case, Cortex-M3 should not
>> advertise that it supports Thumb, as in fact selecting Thumb would
>> generate Thumb-2 code.
>
> So, if a package has some assembly code written in Thumb not Thimb2, it
> should do sometinh like:
>
>      ifeq ($(BR2_ARM_CPU_HAS_THUMB)$(BR2_ARM_CPU_HAS_THUMB2),y)
>      FOO_OPTS += --enable-thumb
>      endif
>
> whereas now it would only need to do:
>
>      ifeq ($(BR2_ARM_CPU_HAS_THUMB)$(BR2_ARM_CPU_HAS_THUMB2),y)

  I guess you meant to say

	ifeq ($(BR2_ARM_CPU_HAS_THUMB),y)

>      FOO_OPTS += --enable-thumb
>      endif
>
> Right?

  Indeed. This was discussed in v1 of the series, and Thomas updated the commit 
message to clarify that a bit. It turns out that we have no case you need a 
condition like that, but we do have a few cases where we need 
thumb-but-not-thumb2 (e.g. the uClibc threads stuff).

>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

>
> Regards,
> Yann E. MORIN.
>
>> ---
>>   arch/Config.in.arm | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
>> index 33f763a..cd1ec33 100644
>> --- a/arch/Config.in.arm
>> +++ b/arch/Config.in.arm
>> @@ -172,7 +172,6 @@ config BR2_cortex_a17
>>   	select BR2_ARCH_HAS_MMU_OPTIONAL
>>   config BR2_cortex_m3
>>   	bool "cortex-M3"
>> -	select BR2_ARM_CPU_HAS_THUMB
>>   	select BR2_ARM_CPU_HAS_THUMB2
>>   	select BR2_ARM_CPU_ARMV7M
>>   config BR2_fa526
>> --
>> 2.6.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
