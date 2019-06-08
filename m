From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 8 Jun 2019 14:46:17 +0200
Subject: [Buildroot] [PATCH] package/kmsxx: work around gcc bug 85180
In-Reply-To: <f321ba2f-2563-dacc-75c2-d86826c9be95@micronovasrl.com>
References: <20190606131035.47417-1-giulio.benetti@micronovasrl.com>
 <20190607080838.46d5065d@thl530.multi.box>
 <7edbb3f8-65fa-4ea5-c2b4-e60b387ddac2@micronovasrl.com>
 <20190607091915.284a4c74@thl530.multi.box>
 <51e11b8d-8dc6-9bca-1590-e7d190022852@mind.be>
 <f321ba2f-2563-dacc-75c2-d86826c9be95@micronovasrl.com>
Message-ID: <e19c84e4-0c75-5d95-87c1-9f79604f8cb3@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 08/06/2019 13:51, Giulio Benetti ha scritto:
> Hi Arnout, Thomas H.,
> 
> Il 08/06/2019 12:56, Arnout Vandecappelle ha scritto:
>>
>>
>> On 07/06/2019 09:19, Thomas Huth wrote:
>>> Am Fri, 7 Jun 2019 08:39:07 +0200
>>> schrieb Giulio Benetti <giulio.benetti@micronovasrl.com>:
>>>
>>>> Hello Thomas H.,
>>>>
>>>> adding Thomas P.+
>>>>
>>>> Il 07/06/2019 08:08, Thomas Huth ha scritto:
>>>>> Am Thu,  6 Jun 2019 15:10:35 +0200
>>>>> schrieb Giulio Benetti <giulio.benetti@micronovasrl.com>:
>>>>>     
>>>>>> With Microblaze Gcc version < 8.x the build hangs due to gcc bug
>>>>>> 85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
>>>>>> shows up when building kmsxx with optimization but not when
>>>>>> building with -O0. To work around this, if
>>>>>> BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we force using -O0.
>>>>>
>>>>> According to the description in the bugzilla, the bug should also go
>>>>> away when compiling with -fno-dse ... so wouldn't it be better to
>>>>> use "-fno-dse" here instead of disabling the optimizations
>>>>> completely?
>>>>
>>>> Honestly I've completely missed that possible solution and didn't
>>>> even tested.
>>>>
>>>> Anyway it's been discussed on IRC channel to keep a common work
>>>> around for every different GCC_BUG_*, so since many packages are
>>>> affected by Bug 85180 and -O0 seemed to work every time Thomas P.
>>>> suggested to always keep that flag as solution.
>>
>>    It's not the same solution for every GCC_BUG_* that we want, it is the same
>> solution for every package. So we don't want to use -O2 -g0 in one package and
>> -O0 in another package.
> 
> Yes you'r right.
> 
>>    If the -fno-dse also works, that would be an even better solution.
> 
> Yes, I was thinking about it and you've beaten me on time :)

I've given a try with kmsxx using -fno-dse, unfortunately it's a NOK.
-fno-dse still hangs while -O0 is ok.

Thomas H.:
Can you please double check with this defconfig substituting '-O0' with 
'-fno-dse'?
R2_microblazeel=y
BR2_ENABLE_DEBUG=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_GCC_VERSION_4_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_KMSXX=y

Thanks!
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

>>> Well, if -fno-dse is also "fixing" this bug, maybe you could add
>>> "-fno-dse" to the global compiler flags instead of manually fixing each
>>> and every package with -O0? ... anyway, just my 0.02 ?.
>>
>>    That's a good idea, actually...
> 
> Yes, Thomas H. is totally right.
> 
>>    And very easy to test if it works: just remove the definition of GCC_BUG_85180
>> (so the -O0 is never passed), add -fno-dse to the toolchain wrapper flags, and
>> build all affected packages with a toolchain that is known to be broken.
> 
> Yep, I'm going to do that starting from Monday.
> 
>>    Great for Giulio's patch count: so many patches adding this stuff, and then the
>> same number of patches removing it again :-)
> 
> :) yes, 10 patches more, more or less. This way easier to produce them
> though.
> 
> Best regards
> 
