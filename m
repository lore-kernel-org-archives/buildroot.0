From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Dec 2015 01:09:00 +0100
Subject: [Buildroot] [PATCH v3 5/7] package/nodejs: remove version choice
In-Reply-To: <CAFGQKxde_+aNen+tipZq8k=Nd+ErNHBY6YJQeOD7GGQQ1vX57g@mail.gmail.com>
References: <1450872968-5834-1-git-send-email-martin@barkynet.com>
 <1450872968-5834-5-git-send-email-martin@barkynet.com>
 <20151223185653.19830dfe@free-electrons.com>
 <CAFGQKxde_+aNen+tipZq8k=Nd+ErNHBY6YJQeOD7GGQQ1vX57g@mail.gmail.com>
Message-ID: <5683209C.2060001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24-12-15 17:23, Martin Bark wrote:
> Thomas,
> 
> On 23 December 2015 at 17:56, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Martin,
>>
>> On Wed, 23 Dec 2015 12:16:06 +0000, Martin Bark wrote:
>>
>>> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
>>> index eb3aeec..1aac38e 100644
>>> --- a/package/nodejs/Config.in
>>> +++ b/package/nodejs/Config.in
>>> @@ -6,6 +6,7 @@ config BR2_PACKAGE_NODEJS
>>>       depends on !BR2_MIPS_SOFT_FLOAT
>>>       # ARM needs BLX, so v5t+
>>>       depends on !BR2_ARM_CPU_ARMV4
>>> +     depends on BR2_PACKAGE_NODEJS_0_10_X || BR2_PACKAGE_NODEJS_5_X
>>
>> I don't like that the main BR2_PACKAGE_NODEJS option depends on
>> BR2_PACKAGE_NODEJS_0_10_X || BR2_PACKAGE_NODEJS_5_X.
>>
>> Instead, please do something like:
>>
>> BR2_PACKAGE_NODEJS_VERSION
>>         string
>>         default "5.3.0"   if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS && BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 && BR2_USE_WCHAR
>>         default "0.10.41"
>>
>> And then use BR2_PACKAGE_NODEJS_VERSION in nodejs.mk to find which
>> version to use.
> 
> I'm not 100% clear what you want.  If BR2_PACKAGE_NODEJS does not
> depend on BR2_PACKAGE_NODEJS_0_10_X || BR2_PACKAGE_NODEJS_5_X then you
> can select nodejs when some dependencies are not satisfied.

 No, because BR2_PACKAGE_NODEJS already has the required depends on
!BR2_ARM_CPU_ARMV4 and others, so this is not an issue.


> This
> would mean 0.10.x would get installed on architectures other than
> armv5.  I thought the idea was 0.10.x only on armv5.  Can you please
> clarify.

 No it doesn't, with Thomas's proposal, 5.3.0 will be selected except if it is
not supported.


 By the way, if/when you repost, please include the host-gcc version check
patches that I just sent, because they are conflicting.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
