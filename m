From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 21 Apr 2016 14:43:00 +0200
Subject: [Buildroot] [PATCH v2] elf2flt: add patch "Fix buffer overflow
	in output_relocs()"
In-Reply-To: <5717F0D8.5000103@mind.be>
References: <1461146201-7352-1-git-send-email-mcoquelin.stm32@gmail.com>
 <5717F0D8.5000103@mind.be>
Message-ID: <CALszF6DvWt_TSi9U3oeFmxTk0KnWaV+tPfhYM-cUoR4xO2bOKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-04-20 23:12 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
> On 04/20/16 11:56, Maxime Coquelin wrote:
...
>> diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
>> index 6c16c3000d89..d138a4c1cdf7 100644
>> --- a/package/elf2flt/elf2flt.mk
>> +++ b/package/elf2flt/elf2flt.mk
>> @@ -8,6 +8,7 @@ ELF2FLT_VERSION = 8a3e74446fe7d866f0517ee089a37f4bdf4bc9f7
>>   ELF2FLT_SITE = $(call github,uclinux-dev,elf2flt,$(ELF2FLT_VERSION))
>>   ELF2FLT_LICENSE = GPLv2+
>>   ELF2FLT_LICENSE_FILES = LICENSE.TXT
>> +ELF2FLT_PATCH =
>> https://github.com/mcoquelin-stm32/elf2flt/commit/4595382ea76f85dced017b1b17b37ef9513458b6.patch
>
>
>  I generally suggest to download patches rather than putting them in
> buildroot. However, I meant this for patches that are upstream (for some
> definition of upstream, e.g. could be debian or gentoo). So that we have
> some chance of them being maintained over time. I'm not so fond of
> downloading patches from a random github fork; in that case, I think it's
> better to have the patch in buildroot itself.

Ok, I understand.
In the mean time, the patch has been accepted by the elf2flt
maintainer, so I will send a v3 just changing the ELF2FLT_VERSION.
>
>
>  In your commit message, you write:
>
>> Indeed, the maximum theorical size is 20 bytes (16 bytes for the value + 3
>> bytes for "+0x" + the end of string marker).
>>
>> The reason the value overflows 32bits is yet to be understood, as the
>> ARMV7-M
>> is 32bits architecture, but this patch first ensure the sprintf call is
>> robust
>> enough.
>
>
>  Isn't that because we're subtracting a long from an int, so if it becomes
> negative, it will be 0xffffffffnnnnnnnn?

Certainly, yes.
But what I meant is that I for now didn't went far enough in the
investigation to
understand why we obtain this negative value.

Thanks,
Maxime
