From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 8 Apr 2013 11:28:15 +0800
Subject: [Buildroot] [PATCH v2 1/7] arch: Add blackfin CPU choice.
In-Reply-To: <20130407223911.7341dea8@skate>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
 <20130407223911.7341dea8@skate>
Message-ID: <CAJxxZ0Oe26kESdd63-f9w48YZ_1Dcwtjjnpb5PEfp4s5_NTZxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Apr 8, 2013 at 4:39 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Sonic Zhang,
>
> Thanks for continuing the work on this!
>
> On Fri, 29 Mar 2013 17:50:37 +0800, Sonic Zhang wrote:
>> From: Sonic Zhang <sonic.zhang@analog.com>
>>
>> v2-changes:
>> none
>>
>> v1-changes:
>> - is patch adds a Target CPU configuration option and uses it to select a -m
>> option for gcc.
>>
>> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>> ---
>>  arch/Config.in.bfin |   97 +++++++++++++++++++++++++++++++++++++++++++++++----
>>  1 files changed, 90 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
>> index 0b137ae..ac96620 100644
>> --- a/arch/Config.in.bfin
>> +++ b/arch/Config.in.bfin
>> @@ -1,12 +1,65 @@
>>  choice
>> -     prompt "Target ABI"
>> +     prompt "Target CPU"
>>       depends on BR2_bfin
>> -     default BR2_BFIN_FDPIC
>> -config BR2_BFIN_FDPIC
>> -     bool "FDPIC"
>> -config BR2_BFIN_FLAT
>> -     bool "FLAT"
>> -     select BR2_PREFER_STATIC_LIB
>
> You can't just remove BR2_BFIN_FDPIC and BR2_BFIN_FLAT, they are used
> in the external toolchain logic of Buildroot:
>
> $ git grep BR2_BFIN_FDPIC .
> arch/Config.in.bfin:    default BR2_BFIN_FDPIC
> arch/Config.in.bfin:config BR2_BFIN_FDPIC
> toolchain/toolchain-external/Config.in: default "bfin-uclinux"           if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1 && !BR2_BFIN_FDPIC
> toolchain/toolchain-external/Config.in: default "bfin-linux-uclibc"      if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1 && BR2_BFIN_FDPIC
> toolchain/toolchain-external/Config.in: default "bfin-uclinux"           if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 && !BR2_BFIN_FDPIC
> toolchain/toolchain-external/Config.in: default "bfin-linux-uclibc"      if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 && BR2_BFIN_FDPIC
> toolchain/toolchain-external/Config.in: default "bfin-uclinux"           if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && !BR2_BFIN_FDPIC
> toolchain/toolchain-external/Config.in: default "bfin-linux-uclibc"      if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_BFIN_FDPIC
>
> So, I think your patch 3/7 should be first in the series, and it should
> be followed by a patch that removes BR2_BFIN_FDPIC and BR2_BFIN_FLAT
> and use the new BR2_BINFMT_* symbols in the external toolchain logic.
>

OK. I will move 3/7 ahead.

Regards,

Sonic
